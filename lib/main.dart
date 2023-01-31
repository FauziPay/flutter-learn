import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_parse/cubit/product_cubit.dart';
import 'package:flutter_learn_parse/screen/product_overview_screen_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => ProductBloc()..add(OnProductEventCalled()),
      create: (context) => ProductCubit(),
      child: const MaterialApp(
        home: Scaffold(
          body: ProductOverviewCubitScreen(),
        ),
      ),
    );
  }
}
