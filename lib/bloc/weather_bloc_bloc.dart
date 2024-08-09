// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/weather.dart';

// // import '../data/my_data.dart';
// import 'package:weather_app/data/my_data.dart';

// part 'weather_bloc_event.dart';
// part 'weather_bloc_state.dart';

// class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
//   WeatherBlocBloc() : super(WeatherBlocInitial()) {
//     on<FetchWeather>((event, emit) async {
// 			emit(WeatherBlocLoading());
//       try {
// 				WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
				
// 				Weather weather = await wf.currentWeatherByLocation(
// 					event.position.latitude, 
// 					event.position.longitude,
// 				);
// 				emit(WeatherBlocSuccess(weather));
//       } catch (e) {
//         emit(WeatherBlocFailure());
//       }
//     });
//   }
// }

// weather_bloc_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

// Replace this with the path to your data file containing the API_KEY.
import 'package:weather_app/data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

// class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
//   WeatherBlocBloc() : super(WeatherBlocInitial()) {
//     on<FetchWeather>(_onFetchWeather);
//   }

//   Future<void> _onFetchWeather(
//       FetchWeather event, Emitter<WeatherBlocState> emit) async {
//     emit(WeatherBlocLoading());
//     try {
//       WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

//       Weather weather = await wf.currentWeatherByLocation(
//         event.position.latitude,
//         event.position.longitude,
//       );
//       emit(WeatherBlocSuccess(weather));
//     } catch (e) {
//       emit(WeatherBlocFailure(e.toString()));
//     }
//   }
// }
class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherBlocState> emit) async {
    emit(WeatherBlocLoading());
    try {
      print("Fetching weather for location: (${event.position.latitude}, ${event.position.longitude})");
      
      WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

      Weather weather = await wf.currentWeatherByLocation(
        event.position.latitude,
        event.position.longitude,
      );

      print("Weather fetched successfully: ${weather.weatherMain}");

      emit(WeatherBlocSuccess(weather));
    } catch (e) {
      print("Error occurred while fetching weather: $e");
      emit(WeatherBlocFailure(e.toString()));
    }
  }
}
