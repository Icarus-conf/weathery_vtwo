part of 'forecast_bloc.dart';

@immutable
sealed class ForecastState {}

final class ForecastInitial extends ForecastState {}

final class ForecastLoading extends ForecastState {}

final class ForecastSuccess extends ForecastState {
  final List<Weather> weatherList;

  ForecastSuccess(this.weatherList);
}

final class ForecastFailure extends ForecastState {
  final String errMsg;

  ForecastFailure(this.errMsg);
}
