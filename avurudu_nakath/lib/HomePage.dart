import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: const Color(0xffFFBE45),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('සුභ අළුත් අවුරුද්දක් වේවා')],
          ),
        ),
      ),
    );
  }
}
