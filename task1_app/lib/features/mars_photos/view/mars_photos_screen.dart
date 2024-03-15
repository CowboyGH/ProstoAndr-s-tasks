import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_app/features/bloc/cubit.dart';
import 'package:task1_app/features/bloc/states.dart';

class MarsPhotosScreen extends StatefulWidget {
  const MarsPhotosScreen({super.key});

  @override
  State<MarsPhotosScreen> createState() => _MarsPhotosScreenState();
}

class _MarsPhotosScreenState extends State<MarsPhotosScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? const Color.fromARGB(255, 29, 29, 29) : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Rover Photos', 
          style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF451804),
        actions: [IconButton(
          onPressed: () {
          setState(() {
            isDark = !isDark;
          });
        },
          icon: isDark ? 
          const Icon(
            Icons.mode_night_outlined
          ) : 
          const Icon(
            Icons.wb_sunny_sharp, 
            color: Colors.white,
          ),
        )],
      ),
      body: BlocBuilder<NasaCubit, NasaState>(
        builder: (context, state){
          if (state is NasaInitState) {
            BlocProvider.of<NasaCubit>(context).loadData();
            return const Center(child: CircularProgressIndicator(color: Colors.black));
          }

          if (state is NasaLoadedState) {
            return ListView.separated(
              itemCount: state.data.photos!.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.network(state.data.photos![index].imgSrc!),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 25,
                  color: isDark ? const Color.fromARGB(255, 29, 29, 29) : Colors.white,
                );
              },
            );
          }

          if (state is NasaErrorState) {
            return const Center(child: Text('Произошла ошибка'));
          }
          return const Divider();
        }
      )
    );
  }
}