import 'package:task1_app/models/nasa.dart';

abstract class NasaState {}

class NasaInitState extends NasaState {}

class NasaLoadedState extends NasaState {
  Nasa data;
  NasaLoadedState({required this.data});
}

class NasaErrorState extends NasaState {}