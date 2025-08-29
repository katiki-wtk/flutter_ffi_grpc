// This is a generated file - do not edit.
//
// Generated from persons.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'persons.pb.dart' as $0;

export 'persons.pb.dart';

@$pb.GrpcServiceName('persons.PersonNavigator')
class PersonNavigatorClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PersonNavigatorClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CursorResponse> current(
    $0.Void request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$current, request, options: options);
  }

  $grpc.ResponseFuture<$0.CursorResponse> next(
    $0.Void request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$next, request, options: options);
  }

  $grpc.ResponseFuture<$0.CursorResponse> previous(
    $0.Void request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$previous, request, options: options);
  }

  /// Additional service rpc
  $grpc.ResponseFuture<$0.CursorResponse> update(
    $0.UpdatePersonRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseStream<$0.PersonChange> watch(
    $0.WatchRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$watch, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$current = $grpc.ClientMethod<$0.Void, $0.CursorResponse>(
      '/persons.PersonNavigator/Current',
      ($0.Void value) => value.writeToBuffer(),
      $0.CursorResponse.fromBuffer);
  static final _$next = $grpc.ClientMethod<$0.Void, $0.CursorResponse>(
      '/persons.PersonNavigator/Next',
      ($0.Void value) => value.writeToBuffer(),
      $0.CursorResponse.fromBuffer);
  static final _$previous = $grpc.ClientMethod<$0.Void, $0.CursorResponse>(
      '/persons.PersonNavigator/Previous',
      ($0.Void value) => value.writeToBuffer(),
      $0.CursorResponse.fromBuffer);
  static final _$update =
      $grpc.ClientMethod<$0.UpdatePersonRequest, $0.CursorResponse>(
          '/persons.PersonNavigator/Update',
          ($0.UpdatePersonRequest value) => value.writeToBuffer(),
          $0.CursorResponse.fromBuffer);
  static final _$watch = $grpc.ClientMethod<$0.WatchRequest, $0.PersonChange>(
      '/persons.PersonNavigator/Watch',
      ($0.WatchRequest value) => value.writeToBuffer(),
      $0.PersonChange.fromBuffer);
}

@$pb.GrpcServiceName('persons.PersonNavigator')
abstract class PersonNavigatorServiceBase extends $grpc.Service {
  $core.String get $name => 'persons.PersonNavigator';

  PersonNavigatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Void, $0.CursorResponse>(
        'Current',
        current_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Void.fromBuffer(value),
        ($0.CursorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Void, $0.CursorResponse>(
        'Next',
        next_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Void.fromBuffer(value),
        ($0.CursorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Void, $0.CursorResponse>(
        'Previous',
        previous_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Void.fromBuffer(value),
        ($0.CursorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePersonRequest, $0.CursorResponse>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePersonRequest.fromBuffer(value),
        ($0.CursorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WatchRequest, $0.PersonChange>(
        'Watch',
        watch_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.WatchRequest.fromBuffer(value),
        ($0.PersonChange value) => value.writeToBuffer()));
  }

  $async.Future<$0.CursorResponse> current_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Void> $request) async {
    return current($call, await $request);
  }

  $async.Future<$0.CursorResponse> current(
      $grpc.ServiceCall call, $0.Void request);

  $async.Future<$0.CursorResponse> next_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Void> $request) async {
    return next($call, await $request);
  }

  $async.Future<$0.CursorResponse> next(
      $grpc.ServiceCall call, $0.Void request);

  $async.Future<$0.CursorResponse> previous_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Void> $request) async {
    return previous($call, await $request);
  }

  $async.Future<$0.CursorResponse> previous(
      $grpc.ServiceCall call, $0.Void request);

  $async.Future<$0.CursorResponse> update_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdatePersonRequest> $request) async {
    return update($call, await $request);
  }

  $async.Future<$0.CursorResponse> update(
      $grpc.ServiceCall call, $0.UpdatePersonRequest request);

  $async.Stream<$0.PersonChange> watch_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.WatchRequest> $request) async* {
    yield* watch($call, await $request);
  }

  $async.Stream<$0.PersonChange> watch(
      $grpc.ServiceCall call, $0.WatchRequest request);
}
