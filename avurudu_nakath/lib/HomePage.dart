import 'package:flutter/material.dart';

import 'homePageContainer01.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 10, 20),
              child: Text(
                'සුභ අළුත් අවුරුද්දක් වේවා',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNDisapamok',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HomePageContainer01(),
            ),
          ],
        ),
      ),
    );
  }
}
