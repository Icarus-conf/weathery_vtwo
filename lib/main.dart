import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathery_vtwo/bloc/weather_bloc.dart';
import 'package:weathery_vtwo/views/home/home_view.dart';
import 'package:weathery_vtwo/services/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: LocationPerm.getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) =>
                  WeatherBloc()..add(FetchWeather(snapshot.data as Position)),
              child: const HomePage(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: SpinKitDoubleBounce(
                  color: Colors.blueGrey,
                  size: 50.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
