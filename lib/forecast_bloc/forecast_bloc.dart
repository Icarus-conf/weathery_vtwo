import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc() : super(ForecastInitial()) {
    on<FetchForecast>((event, emit) async {
      emit(ForecastLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
            '3ec72094b7078f5e26bc6485c63e8aa7',
            language: Language.ENGLISH);

        List<Weather> weather = await weatherFactory.fiveDayForecastByLocation(
          event.position.latitude,
          event.position.longitude,
        );

        emit(ForecastSuccess(weather));
      } catch (e) {
        emit(ForecastFailure(e.toString()));
      }
    });
  }
}
