import '../models/task.dart';

/// Gerenciador de tarefas (State Management simples)
/// Implementa o padrão Singleton para manter estado único na aplicação
class TaskManager {
  static final TaskManager _instance = TaskManager._internal();

  factory TaskManager() {
    return _instance;
  }

  TaskManager._internal();

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  /// Adiciona uma nova tarefa à lista
  void addTask(String title, String description) {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    _tasks.add(task);
  }

  /// Remove uma tarefa pelo ID
  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  /// Alterna o status de conclusão de uma tarefa
  void toggleTask(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    }
  }

  /// Retorna a quantidade de tarefas concluídas
  int get completedCount => _tasks.where((task) => task.isCompleted).length;

  /// Retorna o total de tarefas
  int get totalCount => _tasks.length;
}
