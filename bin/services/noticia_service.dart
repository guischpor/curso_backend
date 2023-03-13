import '../models/noticia_model.dart';
import 'generic_service_interface.dart';

class NoticiaService implements GenericServiceInterface<NoticiaModel> {
  @override
  bool delete(int id) {
    throw UnimplementedError();
  }

  @override
  List<NoticiaModel> findAll() {
    throw UnimplementedError();
  }

  @override
  NoticiaModel findOne(int id) {
    throw UnimplementedError();
  }

  @override
  bool save(NoticiaModel value) {
    throw UnimplementedError();
  }
}
