import 'package:flutter/material.dart';
import 'data/data.dart';

class HomePageContainer01 extends StatelessWidget {
  final String days;
  final String hours;
  final String minutes;
  final String seconds;
  final int eventId;
  final VoidCallback onTap;

  const HomePageContainer01({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.eventId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Find the event data from the dataList
    final eventData = dataList.firstWhere((item) => item.id == eventId);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                'මීළඟ නැකත: ${eventData.name}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNIndeewaree',
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  const Text(
                    'දින:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'UNIndeewaree',
                    ),
                  ),
                  const SizedBox(width: 2),
                  _buildCountdownBox(days),
                  const SizedBox(width: 6),

                  const Text(
                    'පැය:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'UNIndeewaree',
                    ),
                  ),
                  const SizedBox(width: 2),
                  _buildCountdownBox(hours),
                  const SizedBox(width: 6),

                  const Text(
                    'මිනි:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'UNIndeewaree',
                    ),
                  ),
                  const SizedBox(width: 2),
                  _buildCountdownBox(minutes),
                  const SizedBox(width: 6),

                  const Text(
                    'තත්:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'UNIndeewaree',
                    ),
                  ),
                  const SizedBox(width: 2),
                  _buildCountdownBox(seconds),
                  const SizedBox(width: 6),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  eventData.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'UNGurulugomi',
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates a styled container for displaying countdown numbers
  Widget _buildCountdownBox(String value) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffFFE3AE),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(fontFamily: 'UNArundathee', fontSize: 25),
        ),
      ),
    );
  }
}
