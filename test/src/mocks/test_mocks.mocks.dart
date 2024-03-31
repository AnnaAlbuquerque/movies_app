// Mocks generated by Mockito 5.4.4 from annotations
// in movies_app/test/src/mocks/test_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_app/src/services/movie_http_client.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieHTTPClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieHTTPClient extends _i1.Mock implements _i3.MovieHTTPClient {
  @override
  _i4.Future<_i2.Response> get({
    required String? url,
    Map<String, dynamic>? queryParams,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
          {
            #url: url,
            #queryParams: queryParams,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [],
            {
              #url: url,
              #queryParams: queryParams,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [],
            {
              #url: url,
              #queryParams: queryParams,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
}
