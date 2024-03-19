import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
            '3ec72094b7078f5e26bc6485c63e8aa7',
            language: Language.ENGLISH);

        Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );

        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
      }
    });
  }
}
