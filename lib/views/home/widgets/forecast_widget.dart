import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weathery_vtwo/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weathery_vtwo/services/weather_icon_method.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {
            if (state is ForecastLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ForecastFailure) {
              return Text(state.errMsg);
            }
            if (state is ForecastSuccess) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: state.weatherList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        DateFormat('EEE dd')
                            .format(state.weatherList[index].date!),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      Lottie.asset(
                        width: 25,
                        getWeatherIcon(
                          state.weatherList[index].weatherConditionCode!,
                        ),
                      ),
                      Text(
                        '${state.weatherList[index].temperature!.celsius!.round().toString()}°C',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        DateFormat('')
                            .add_jm()
                            .format(state.weatherList[index].date!),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
