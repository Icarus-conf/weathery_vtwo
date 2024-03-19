String getWeatherIcon(int condition) {
  if (condition < 300) {
    return 'assets/lottie/thunder.json';
  } else if (condition < 400) {
    return 'assets/lottie/rainy.json';
  } else if (condition < 600) {
    return 'assets/lottie/rainy.json';
  } else if (condition < 700) {
    return 'assets/lottie/snowy.json';
  } else if (condition < 800) {
    return 'assets/lottie/storm.json';
  } else if (condition == 800) {
    return 'assets/lottie/sunny.json';
  } else if (condition <= 804) {
    return 'assets/lottie/cloudy.json';
  } else {
    return '🤷‍';
  }
}
