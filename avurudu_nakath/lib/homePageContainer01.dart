import 'package:flutter/material.dart';

class HomePageContainer01 extends StatefulWidget {
  const HomePageContainer01({super.key});

  @override
  State<HomePageContainer01> createState() => _HomePageContainer01State();
}

class _HomePageContainer01State extends State<HomePageContainer01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
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

            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Text(
                'අප්‍රේල් මස 14 වෙනි සදුදා පූර්වභාග 04.04ට තඹවර්ණ වස්ත්‍රාභරණයෙන් සැරසී දකුණු දිශාව බලා ළිප් බැඳ, ගිනි මොළවා කිරිබතක් ද, කැවිලි වර්ගයක් ද, දී කිරි සහ විලඳ ද පිළියෙල කරගැනීම මැනවි.',
                style: TextStyle(fontSize: 20, fontFamily: 'UNGurulugomi'),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
