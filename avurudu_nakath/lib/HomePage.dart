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
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'මීළඟ නැකත: ආහාර පිසීම',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'UNIndeewaree',
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            'දින:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'UNIndeewaree',
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffFFE3AE),
                            ),

                            child: Center(
                              child: Text(
                                '00',
                                style: TextStyle(
                                  fontFamily: 'UNArundathee',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6),

                          Text(
                            'පැය:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'UNIndeewaree',
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffFFE3AE),
                            ),

                            child: Center(
                              child: Text(
                                '02',
                                style: TextStyle(
                                  fontFamily: 'UNArundathee',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6),

                          Text(
                            'මිනි:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'UNIndeewaree',
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffFFE3AE),
                            ),
                            child: Center(
                              child: Text(
                                '34',
                                style: TextStyle(
                                  fontFamily: 'UNArundathee',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6),

                          Text(
                            'තත්:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'UNIndeewaree',
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffFFE3AE),
                            ),
                            child: Center(
                              child: Text(
                                '12',
                                style: TextStyle(
                                  fontFamily: 'UNArundathee',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                        ],
                      ),
                    ],
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
