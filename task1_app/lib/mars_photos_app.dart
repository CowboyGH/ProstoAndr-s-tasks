import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_app/features/bloc/cubit.dart';
import 'package:task1_app/features/mars_photos/view/mars_photos_screen.dart';

class MarsPhotosApp extends StatelessWidget {
  const MarsPhotosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => NasaCubit(),
        child: const MarsPhotosScreen()
      )
    );
  }
}