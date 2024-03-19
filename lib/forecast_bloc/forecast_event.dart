part of 'forecast_bloc.dart';

@immutable
sealed class ForecastEvent {}

class FetchForecast extends ForecastEvent {
  final Position position;

  FetchForecast(this.position);
}
