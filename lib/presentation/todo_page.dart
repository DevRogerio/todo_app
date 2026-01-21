import 'package:flutter/material.dart';
import 'package:flutter_application_c/domain/repository/todo.repo.dart';
import 'package:flutter_application_c/presentation/todo_cubit.dart';
import 'package:flutter_application_c/presentation/todo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todorepo;

  const TodoPage({super.key, required this.todorepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todorepo),
      child: const TodoView(),
    );
  }
}
