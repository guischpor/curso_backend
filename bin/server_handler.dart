import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandleR {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) async {
      return Response(200, body: 'Primeira Rota!');
    });

    //http://localhost:8080/ola/mundo
    //ola mundo
    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok("Ola Mundo! $usuario");
    });

    //http: //localhost:8080/query?nome=Guilherme
    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      return Response.ok('Query params: $nome');
    });

    //http://localhost:8080/query?nome=Guilherme&idade=32
    router.get('/query/idade', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('Query params: $nome, $idade anos');
    });

    return router;
  }
}
