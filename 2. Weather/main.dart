import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Weather Forecast"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          _cityEnter(),
          _divider(),
          _cityDetails(),
          _divider(),
          _mainWeather(),
          _divider(),
          _weatherDetails(),
          _divider(),
          _textSevenDayWeather(),
          _divider(),
          _sevenDayWeather(),
        ],
      ),
    ),
  );
}

Widget _cityEnter() {
  return const Row(
    children: [
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        "Enter City Name",
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}

Divider _divider() {
  return const Divider(
    color: Colors.red,
  );
}

Widget _cityDetails() {
  return const Column(
    children: [
      Text(
        "Murmansk Oblast, RU",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      Text(
        "Friday, Mar 20, 2020",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ],
  );
}

Widget _mainWeather() {
  return const Padding(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sunny,
          color: Colors.white,
          size: 50,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          children: [
            Text(
              "14 °F",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Text(
              "LIGHT SNOW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _weatherDetails() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(
            Icons.snowing,
            color: Colors.white,
          ),
          Text(
            "5",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "km/h",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.snowing,
            color: Colors.white,
          ),
          Text(
            "3",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.snowing,
            color: Colors.white,
          ),
          Text(
            "20",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _textSevenDayWeather() {
  return const Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text(
      "7-DAY WEATHER FORECAST",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Widget _sevenDayWeather() {
  final List<String> items = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Sunday",
    "Saturday"
  ];
  final List<String> intTemperature =
      List<String>.generate(7, (index) => Random().nextInt(30).toString());

  return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 170,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromARGB(178, 245, 238, 238),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                items[index],
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${intTemperature[index]} °F ',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.sunny,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
