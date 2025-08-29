// This is a generated file - do not edit.
//
// Generated from persons.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'persons.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'persons.pbenum.dart';

class Void extends $pb.GeneratedMessage {
  factory Void() => create();

  Void._();

  factory Void.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Void.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Void',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Void clone() => Void()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Void copyWith(void Function(Void) updates) =>
      super.copyWith((message) => updates(message as Void)) as Void;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Void create() => Void._();
  @$core.override
  Void createEmptyInstance() => create();
  static $pb.PbList<Void> createRepeated() => $pb.PbList<Void>();
  @$core.pragma('dart2js:noInline')
  static Void getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Void>(create);
  static Void? _defaultInstance;
}

class Person extends $pb.GeneratedMessage {
  factory Person({
    $core.String? lastName,
    $core.String? firstName,
    $core.int? age,
  }) {
    final result = create();
    if (lastName != null) result.lastName = lastName;
    if (firstName != null) result.firstName = firstName;
    if (age != null) result.age = age;
    return result;
  }

  Person._();

  factory Person.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Person.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Person',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lastName')
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'age', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Person copyWith(void Function(Person) updates) =>
      super.copyWith((message) => updates(message as Person)) as Person;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  @$core.override
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lastName => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => $_clearField(3);
}

class CursorResponse extends $pb.GeneratedMessage {
  factory CursorResponse({
    Person? person,
    $core.int? index,
    $core.int? total,
    $core.bool? hasPrev,
    $core.bool? hasNext,
  }) {
    final result = create();
    if (person != null) result.person = person;
    if (index != null) result.index = index;
    if (total != null) result.total = total;
    if (hasPrev != null) result.hasPrev = hasPrev;
    if (hasNext != null) result.hasNext = hasNext;
    return result;
  }

  CursorResponse._();

  factory CursorResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CursorResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CursorResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..aOM<Person>(1, _omitFieldNames ? '' : 'person', subBuilder: Person.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'hasPrev')
    ..aOB(5, _omitFieldNames ? '' : 'hasNext')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CursorResponse clone() => CursorResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CursorResponse copyWith(void Function(CursorResponse) updates) =>
      super.copyWith((message) => updates(message as CursorResponse))
          as CursorResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CursorResponse create() => CursorResponse._();
  @$core.override
  CursorResponse createEmptyInstance() => create();
  static $pb.PbList<CursorResponse> createRepeated() =>
      $pb.PbList<CursorResponse>();
  @$core.pragma('dart2js:noInline')
  static CursorResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CursorResponse>(create);
  static CursorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Person get person => $_getN(0);
  @$pb.TagNumber(1)
  set person(Person value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPerson() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerson() => $_clearField(1);
  @$pb.TagNumber(1)
  Person ensurePerson() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasPrev => $_getBF(3);
  @$pb.TagNumber(4)
  set hasPrev($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasPrev() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasPrev() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasNext => $_getBF(4);
  @$pb.TagNumber(5)
  set hasNext($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHasNext() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasNext() => $_clearField(5);
}

class UpdatePersonRequest extends $pb.GeneratedMessage {
  factory UpdatePersonRequest({
    $core.int? index,
    Person? person,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (person != null) result.person = person;
    return result;
  }

  UpdatePersonRequest._();

  factory UpdatePersonRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePersonRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePersonRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..aOM<Person>(2, _omitFieldNames ? '' : 'person', subBuilder: Person.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePersonRequest clone() => UpdatePersonRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePersonRequest copyWith(void Function(UpdatePersonRequest) updates) =>
      super.copyWith((message) => updates(message as UpdatePersonRequest))
          as UpdatePersonRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePersonRequest create() => UpdatePersonRequest._();
  @$core.override
  UpdatePersonRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePersonRequest> createRepeated() =>
      $pb.PbList<UpdatePersonRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePersonRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePersonRequest>(create);
  static UpdatePersonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  Person get person => $_getN(1);
  @$pb.TagNumber(2)
  set person(Person value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPerson() => $_has(1);
  @$pb.TagNumber(2)
  void clearPerson() => $_clearField(2);
  @$pb.TagNumber(2)
  Person ensurePerson() => $_ensure(1);
}

/// Message for being notified
class WatchRequest extends $pb.GeneratedMessage {
  factory WatchRequest() => create();

  WatchRequest._();

  factory WatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchRequest clone() => WatchRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchRequest copyWith(void Function(WatchRequest) updates) =>
      super.copyWith((message) => updates(message as WatchRequest))
          as WatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchRequest create() => WatchRequest._();
  @$core.override
  WatchRequest createEmptyInstance() => create();
  static $pb.PbList<WatchRequest> createRepeated() =>
      $pb.PbList<WatchRequest>();
  @$core.pragma('dart2js:noInline')
  static WatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchRequest>(create);
  static WatchRequest? _defaultInstance;
}

/// Message in response after update
class PersonChange extends $pb.GeneratedMessage {
  factory PersonChange({
    PersonChange_ChangeType? type,
    $core.int? index,
    Person? person,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (index != null) result.index = index;
    if (person != null) result.person = person;
    return result;
  }

  PersonChange._();

  factory PersonChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'persons'),
      createEmptyInstance: create)
    ..e<PersonChange_ChangeType>(
        1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: PersonChange_ChangeType.UPDATED,
        valueOf: PersonChange_ChangeType.valueOf,
        enumValues: PersonChange_ChangeType.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..aOM<Person>(3, _omitFieldNames ? '' : 'person', subBuilder: Person.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonChange clone() => PersonChange()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonChange copyWith(void Function(PersonChange) updates) =>
      super.copyWith((message) => updates(message as PersonChange))
          as PersonChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonChange create() => PersonChange._();
  @$core.override
  PersonChange createEmptyInstance() => create();
  static $pb.PbList<PersonChange> createRepeated() =>
      $pb.PbList<PersonChange>();
  @$core.pragma('dart2js:noInline')
  static PersonChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonChange>(create);
  static PersonChange? _defaultInstance;

  @$pb.TagNumber(1)
  PersonChange_ChangeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PersonChange_ChangeType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  Person get person => $_getN(2);
  @$pb.TagNumber(3)
  set person(Person value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPerson() => $_has(2);
  @$pb.TagNumber(3)
  void clearPerson() => $_clearField(3);
  @$pb.TagNumber(3)
  Person ensurePerson() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
