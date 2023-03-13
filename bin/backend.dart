import 'dart:async';

import 'package:shelf/shelf.dart';

import 'apis/blog_api/blog_api.dart';
import 'apis/login_api/login_api.dart';
import 'infra/custom_server.dart';
import 'services/noticia_service.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  FutureOr<Response> Function(Request) cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi(NoticiaService()).handler)
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
