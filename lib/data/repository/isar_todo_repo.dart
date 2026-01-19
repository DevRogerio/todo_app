/* DATABASE REPO

This implements the todo repo and handles storing , retrieving, updating,
deleting in the isar database */

import 'package:flutter_application_c/data/models/isar_todo.dart';
import 'package:flutter_application_c/domain/models/todo.dart';
import 'package:flutter_application_c/domain/repository/todo.repo.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  //database
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    // fetch from db
    final todos = await db.todoIsars.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) {
    final todoIsar = TodoIsar.fromDomain(newTodo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
