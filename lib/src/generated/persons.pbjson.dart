// This is a generated file - do not edit.
//
// Generated from persons.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use voidDescriptor instead')
const Void$json = {
  '1': 'Void',
};

/// Descriptor for `Void`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voidDescriptor = $convert.base64Decode('CgRWb2lk');

@$core.Deprecated('Use personDescriptor instead')
const Person$json = {
  '1': 'Person',
  '2': [
    {'1': 'last_name', '3': 1, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'age', '3': 3, '4': 1, '5': 13, '10': 'age'},
  ],
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode(
    'CgZQZXJzb24SGwoJbGFzdF9uYW1lGAEgASgJUghsYXN0TmFtZRIdCgpmaXJzdF9uYW1lGAIgAS'
    'gJUglmaXJzdE5hbWUSEAoDYWdlGAMgASgNUgNhZ2U=');

@$core.Deprecated('Use cursorResponseDescriptor instead')
const CursorResponse$json = {
  '1': 'CursorResponse',
  '2': [
    {
      '1': 'person',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.persons.Person',
      '10': 'person'
    },
    {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
    {'1': 'total', '3': 3, '4': 1, '5': 13, '10': 'total'},
    {'1': 'has_prev', '3': 4, '4': 1, '5': 8, '10': 'hasPrev'},
    {'1': 'has_next', '3': 5, '4': 1, '5': 8, '10': 'hasNext'},
  ],
};

/// Descriptor for `CursorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cursorResponseDescriptor = $convert.base64Decode(
    'Cg5DdXJzb3JSZXNwb25zZRInCgZwZXJzb24YASABKAsyDy5wZXJzb25zLlBlcnNvblIGcGVyc2'
    '9uEhQKBWluZGV4GAIgASgNUgVpbmRleBIUCgV0b3RhbBgDIAEoDVIFdG90YWwSGQoIaGFzX3By'
    'ZXYYBCABKAhSB2hhc1ByZXYSGQoIaGFzX25leHQYBSABKAhSB2hhc05leHQ=');

@$core.Deprecated('Use updatePersonRequestDescriptor instead')
const UpdatePersonRequest$json = {
  '1': 'UpdatePersonRequest',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    {
      '1': 'person',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.persons.Person',
      '10': 'person'
    },
  ],
};

/// Descriptor for `UpdatePersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePersonRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVQZXJzb25SZXF1ZXN0EhQKBWluZGV4GAEgASgNUgVpbmRleBInCgZwZXJzb24YAi'
    'ABKAsyDy5wZXJzb25zLlBlcnNvblIGcGVyc29u');

@$core.Deprecated('Use watchRequestDescriptor instead')
const WatchRequest$json = {
  '1': 'WatchRequest',
};

/// Descriptor for `WatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchRequestDescriptor =
    $convert.base64Decode('CgxXYXRjaFJlcXVlc3Q=');

@$core.Deprecated('Use personChangeDescriptor instead')
const PersonChange$json = {
  '1': 'PersonChange',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.persons.PersonChange.ChangeType',
      '10': 'type'
    },
    {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
    {
      '1': 'person',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.persons.Person',
      '10': 'person'
    },
  ],
  '4': [PersonChange_ChangeType$json],
};

@$core.Deprecated('Use personChangeDescriptor instead')
const PersonChange_ChangeType$json = {
  '1': 'ChangeType',
  '2': [
    {'1': 'UPDATED', '2': 0},
  ],
};

/// Descriptor for `PersonChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personChangeDescriptor = $convert.base64Decode(
    'CgxQZXJzb25DaGFuZ2USNAoEdHlwZRgBIAEoDjIgLnBlcnNvbnMuUGVyc29uQ2hhbmdlLkNoYW'
    '5nZVR5cGVSBHR5cGUSFAoFaW5kZXgYAiABKA1SBWluZGV4EicKBnBlcnNvbhgDIAEoCzIPLnBl'
    'cnNvbnMuUGVyc29uUgZwZXJzb24iGQoKQ2hhbmdlVHlwZRILCgdVUERBVEVEEAA=');
