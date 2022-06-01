// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String webinar;
  final String timewebinar;
  final Color;
  const card({
    Key? key,
    required this.webinar,
    required this.timewebinar,
    required this.Color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 163,
        height: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //webinar
              Text(
                webinar.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              //time webinar
              Text(
                timewebinar.toString(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Colors.white,
                  // Background color
                  primary: Colors.deepOrange[600],
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text('Join Now'),
              ),
            ]),
      ),
    );
  }
}
