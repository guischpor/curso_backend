import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/noticia_model.dart';
import '../../services/generic_service_interface.dart';

class BlogApi {
  final GenericServiceInterface<NoticiaModel> _service;

  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    //listagem
    router.get('/blog/noticias', (Request req) {
      List<NoticiaModel> noticias = _service.findAll();
      List<Map<String, dynamic>> noticiasMap =
          noticias.map((e) => e.toMap()).toList();
      return Response.ok(jsonEncode(noticiasMap));
    });

    //nova noticia
    router.post('/blog/noticias', (Request req) async {
      String body = await req.readAsString();
      _service.save(NoticiaModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    //alterar noticia
    //blog/noticias?id=1
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      // _service.save('');
      return Response(201);
    });

    //deletar noticia
    //blog/noticias?id=1
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      // _service.delete(1);
      return Response.ok('Notícia deletada!');
    });

    return router;
  }
}
