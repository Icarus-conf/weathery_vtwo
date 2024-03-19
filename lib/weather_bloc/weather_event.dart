part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final Position position;

  FetchWeather(this.position);
}
