import 'package:curso_backend/core/servers_const/servers_const.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'server_handler.dart';

void main() async {
  ServerHandleR serverHandleR = ServerHandleR();

  final server = await shelf_io.serve(
    serverHandleR.handler,
    ServerConst.address,
    ServerConst.port,
  );

  print(
      'Servidor foi iniciado http://${ServerConst.address}:${ServerConst.port}!');
}
