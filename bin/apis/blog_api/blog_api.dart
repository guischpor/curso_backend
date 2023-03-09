import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    Router router = Router();

    //listagem
    router.get('/blog/noticias', (Request req) {
      return Response.ok('Choveu hoje!');
    });

    //nova noticia
    router.post('/blog/noticias', (Request req) {
      return Response.ok('Notícia postada!');
    });

    //alterar noticia
    //blog/noticias?id=1
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Notícia alterada!');
    });

    //deletar noticia
    //blog/noticias?id=1
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Notícia deletada!');
    });

    return router;
  }
}
