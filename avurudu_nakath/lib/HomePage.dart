import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFBE45),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 90,
              child: SizedBox(
                width: 230,
                height: 230,
                child: Image.asset('assets/sun.png', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 330,
              left: 120,
              child: const Text(
                'අපේ',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNDisapamok',
                ),
              ),
            ),
            Positioned(
              top: 355,
              left: 185,
              child: const Text(
                'අවුරුදු',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNDisapamok',
                ),
              ),
            ),
            Positioned(
              top: 350,
              child: const Text(
                'නැකැත්',
                style: TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNDisapamok',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
