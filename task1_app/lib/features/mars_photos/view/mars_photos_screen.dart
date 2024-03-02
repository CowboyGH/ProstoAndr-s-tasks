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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rover Photos', 
          style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<NasaCubit, NasaState>(
        builder: (context, state){
          if (state is NasaLoadingState) {
            BlocProvider.of<NasaCubit>(context).loadData();
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NasaLoadedState) {
            return ListView.builder(
              itemCount: state.data.photos!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(state.data.photos![index].imgSrc!),
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