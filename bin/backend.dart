import 'dart:async';

import 'package:shelf/shelf.dart';

import 'api/blog_api/blog_api.dart';
import 'api/login_api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  FutureOr<Response> Function(Request) cascadeHandler =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(handler);
}
