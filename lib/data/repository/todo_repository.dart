import 'package:todo_bloc/data/datasource/todo_dao.dart';
import 'package:todo_bloc/data/model/todo.dart';

class TodoRepository {
  final TodoDao _todoDao = TodoDao();

  Future<int> createTodo(Todo todo) {
    return _todoDao.insert(todo);
  }

  Future<List<Todo>> fetchTodos() {
    return _todoDao.getAll();
  }

  Future<int> updatedTodo(Todo todo) {
    return _todoDao.update(todo);
  }

  Future<int> deleteTodo(int id) {
    return _todoDao.delete(id);
  }
}
