import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_app/features/bloc/states.dart';
import 'package:task1_app/models/nasa.dart';
import 'package:task1_app/requests/api.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaInitState());

  Future<void> loadData() async {
    try {
      emit(NasaInitState());
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
      return;
    } catch (e) {
      emit(NasaErrorState());
      return;
    }
  }
}