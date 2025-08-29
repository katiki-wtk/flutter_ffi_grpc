import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';

typedef _H = ffi.Pointer<ffi.Void>;

class PersonsNative {
  final ffi.DynamicLibrary _lib;

  late final _H Function(ffi.Pointer<ffi.Char>) _create;
  late final void Function(_H) _free;
  late final int Function(_H) _count;
  late final int Function(_H) _index;
  late final int Function(_H) _next;
  late final int Function(_H) _prev;
  late final int Function(_H) _getAge;
  late final int Function(_H, ffi.Pointer<ffi.Char>, int) _getFirstName;
  late final int Function(_H, ffi.Pointer<ffi.Char>, int) _getLastName;

  _H? _handle;

  PersonsNative._(this._lib) {
    _free = _lib.lookupFunction<ffi.Void Function(_H), void Function(_H)>(
      'persons_free',
    );

    _create = _lib
        .lookupFunction<
          _H Function(ffi.Pointer<ffi.Char>),
          _H Function(ffi.Pointer<ffi.Char>)
        >('persons_create_from_csv');

    _count = _lib.lookupFunction<ffi.Int32 Function(_H), int Function(_H)>(
      'persons_count',
    );
    _index = _lib.lookupFunction<ffi.Int32 Function(_H), int Function(_H)>(
      'persons_index',
    );
    _next = _lib.lookupFunction<ffi.Int32 Function(_H), int Function(_H)>(
      'persons_next',
    );
    _prev = _lib.lookupFunction<ffi.Int32 Function(_H), int Function(_H)>(
      'persons_prev',
    );
    _getAge = _lib.lookupFunction<ffi.Int32 Function(_H), int Function(_H)>(
      'persons_get_age',
    );

    _getFirstName = _lib
        .lookupFunction<
          ffi.Int32 Function(_H, ffi.Pointer<ffi.Char>, ffi.Int32),
          int Function(_H, ffi.Pointer<ffi.Char>, int)
        >('persons_get_firstname');

    _getLastName = _lib
        .lookupFunction<
          ffi.Int32 Function(_H, ffi.Pointer<ffi.Char>, ffi.Int32),
          int Function(_H, ffi.Pointer<ffi.Char>, int)
        >('persons_get_lastname');
  }

  static PersonsNative load({String? path}) {
    final lib = _openLib(path: path);
    return PersonsNative._(lib);
  }

  static ffi.DynamicLibrary _openLib({String? path}) {
    if (path != null && path.isNotEmpty) {
      return ffi.DynamicLibrary.open(path);
    }
    final name = Platform.isWindows ? 'persons.dll' : 'libpersons.so';
    return ffi.DynamicLibrary.open(name);
  }

  void openCsv(String filePath) {
    final cPath = filePath.toNativeUtf8();
    try {
      _handle = _create(cPath.cast<ffi.Char>());
    } finally {
      calloc.free(cPath);
    }
  }

  bool get isOpen => _handle != null;

  int count() => _handle == null ? 0 : _count(_handle!);
  int index() => _handle == null ? 0 : _index(_handle!);

  bool next() => _handle != null && _next(_handle!) != 0;
  bool prev() => _handle != null && _prev(_handle!) != 0;

  int age() => _handle == null ? -1 : _getAge(_handle!);

  String _readString(int Function(_H, ffi.Pointer<ffi.Char>, int) nativeFn) {
    final h = _handle;
    if (h == null) return '';
    final needed = nativeFn(h, ffi.Pointer.fromAddress(0), 0);
    if (needed <= 0) return '';
    final buf = calloc<ffi.Char>(needed + 1);
    try {
      nativeFn(h, buf, needed + 1);
      //return buf.toDartString();
      return buf.cast<Utf8>().toDartString();
    } finally {
      calloc.free(buf);
    }
  }

  String firstName() => _readString(_getFirstName);
  String lastName() => _readString(_getLastName);

  void dispose() {
    final h = _handle;
    if (h != null) {
      _free(h);
      _handle = null;
    }
  }
}
