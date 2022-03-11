import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_builder/config/theme.dart';
import 'package:flutter_widget_builder/features/bloc/widget_tree/widget_tree_bloc.dart';
import 'package:flutter_widget_builder/features/controller/interface_controller.dart';
import 'package:flutter_widget_builder/features/view/home/home_view.dart';
import 'package:flutter_widget_builder/features/view/playground.dart';

class MyApp extends StatelessWidget {
  final FbInterfaceController fbController;

  const MyApp({Key? key, required this.fbController}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WidgetTreeBloc>(
          create: (_) =>
              WidgetTreeBloc(fbController)..add(InitialWidgetTreeEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        // home: const Playground(),
        home: const HomeView(),
      ),
    );
  }
}
