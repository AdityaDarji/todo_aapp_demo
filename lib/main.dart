import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:todo_app_demo/view/todo_list_screen.dart';
import 'package:todo_app_demo/viewmodel/todo_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.system,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'To-Do app',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF00BFA5),
              secondary: Color(0xFF64FFDA),
            ),
          ),
          themeMode: currentMode,
          debugShowCheckedModeBanner: false,
          home: ChangeNotifierProvider(
            create: (_) => TodoViewmodel(),
            child: TodoListScreen(),
          ),
        );
      },
    );
  }
}
