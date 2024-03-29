abstract class GenericServiceInterface<T> {
  T findOne(int id);
  List<T> findAll();
  bool save(T value);
  bool delete(int id);
}
