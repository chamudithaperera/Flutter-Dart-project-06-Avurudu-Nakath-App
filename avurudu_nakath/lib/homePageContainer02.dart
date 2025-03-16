import 'package:flutter/material.dart';

class HomePageContainer02 extends StatefulWidget {
  const HomePageContainer02({super.key});

  @override
  State<HomePageContainer02> createState() => _HomePageContainer02State();
}

class _HomePageContainer02State extends State<HomePageContainer02> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
            SizedBox(height: 12),

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
    );
  }
}
