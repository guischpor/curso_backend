import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandleR {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) async {
      return Response(
        200,
        body: '<h1>Primeira Rota!</h1>',
        headers: {'content-type': 'text/html'},
      );
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

    router.post('/login', (Request req) async {
      String result = await req.readAsString();
      Map json = jsonDecode(result);
      var usuario = json['usuario'];
      var senha = json['senha'];

      //convertendo e retornando um json
      Map<String, dynamic> responseReturn = ({
        "token": "token123",
        "user_id": 1,
        "user_name": usuario,
      });

      String jsonResponse = jsonEncode(responseReturn);

      //se usuario == admin@admin.com e senha == 123456
      if (usuario == 'admin@admin.com' && senha == '123456') {
        return Response.ok(
          jsonResponse,
          headers: {'content-type': 'application/json'},
        );
      } else {
        //se não
        return Response.forbidden('Acesso negado! Usuário ou senha inválidos!');
      }
    });

    return router;
  }
}
