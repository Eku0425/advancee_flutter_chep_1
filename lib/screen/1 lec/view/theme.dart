import 'package:flutter/material.dart';

import '../../../utils/GobalList.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({super.key});

  @override
  State<ThemeChange> createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              const Text(
                'Yo Man!',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'It\'s simple example of dark theme',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDark = false;
                  });
                },
                child:
                    lightDarkButton(height, width, 'Light Mode', Colors.amber),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDark = true;
                  });
                },
                child: lightDarkButton(height, width, 'Dark Mode', Colors.red),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/stepper');
                },
                child: const Text('Stepper Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container lightDarkButton(double height, double width, text, color) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(25),
      height: height * 0.1,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
