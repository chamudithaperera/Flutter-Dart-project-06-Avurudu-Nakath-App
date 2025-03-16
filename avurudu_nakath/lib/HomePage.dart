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

            //main text set start
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
            ), //main text set end

            Positioned(
              top: 600,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'සිංහල',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 664,
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'தமிழ்',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
