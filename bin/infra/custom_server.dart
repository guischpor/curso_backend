import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialize(Handler handler) async {
    int port = 8080;
    String url = 'localhost';

    await shelf_io.serve(handler, url, port);

    print('Servidor inicializado -> http://$url:$port!');
  }
}
