// part of 'weather_bloc_bloc.dart';

// sealed class WeatherBlocState extends Equatable {
//   const WeatherBlocState();
  
//   @override
//   List<Object> get props => [];
// }

// final class WeatherBlocInitial extends WeatherBlocState {}

// final class WeatherBlocLoading extends WeatherBlocState {}
// final class WeatherBlocFailure extends WeatherBlocState {}
// final class WeatherBlocSuccess extends WeatherBlocState {
// 	final Weather weather;

// 	const WeatherBlocSuccess(this.weather);

// 	@override
//   List<Object> get props => [weather];
// }

// weather_bloc_state.dart

part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object?> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherBlocLoading extends WeatherBlocState {}

class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  const WeatherBlocSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherBlocFailure extends WeatherBlocState {
  final String error;

  const WeatherBlocFailure(this.error);

  @override
  List<Object?> get props => [error];
}
