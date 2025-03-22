import 'package:flutter/material.dart';
import 'data/data.dart';

class PopupDialog extends StatelessWidget {
  final DataModel data;
  final String countdownDays;
  final String countdownHours;
  final String countdownMinutes;
  final String countdownSeconds;

  const PopupDialog({
    Key? key,
    required this.data,
    required this.countdownDays,
    required this.countdownHours,
    required this.countdownMinutes,
    required this.countdownSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE9C0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),

            // Center image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Image.asset(
                'assets/lineArt.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 250,
                    height: 250,
                    color: const Color(0xFFFFF1D6),
                    child: const Center(
                      child: Text(
                        'Image Not Found',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                data.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNIndeewaree',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Countdown row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCountdownItem("දින:", countdownDays),
                  _buildCountdownItem("පැය:", countdownHours),
                  _buildCountdownItem("මිනි:", countdownMinutes),
                  _buildCountdownItem("තත්:", countdownSeconds),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                data.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'UNGanganee',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'UNIndeewaree',
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFFFE3AE),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontFamily: 'UNArundathee', fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
