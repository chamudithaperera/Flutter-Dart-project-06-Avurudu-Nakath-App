import 'package:flutter/material.dart';
import 'dart:async';

import 'data/data.dart';
import 'homePageContainer01.dart';
import 'homePageContainer02.dart';
import 'popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollProgress = 0.0;

  final double _titleHeight = 160.0;
  final double _container02Height = 130.0;
  final double _topPadding = 50.0;
  final double _scrollThreshold = 50.0;
  final double _maxTransitionOffset = 150.0;

  // Timer for countdown
  Timer? _countdownTimer;

  // Current countdown values
  String days = "00";
  String hours = "00";
  String minutes = "00";
  String seconds = "00";

  // ID of the next event (ආහාර පිසීම has ID 5 in the dataList)
  final int nextEventId = 5;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // Start the countdown timer
    _startCountdown();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();

    // Cancel the timer when widget is disposed
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _scrollListener() {
    double rawProgress =
        (_scrollController.offset - _scrollThreshold) /
        (_maxTransitionOffset - _scrollThreshold);
    double progress = rawProgress.clamp(0.0, 1.0);

    bool isNowScrolled = _scrollController.offset > _scrollThreshold;

    if (isNowScrolled != _isScrolled || progress != _scrollProgress) {
      setState(() {
        _isScrolled = isNowScrolled;
        _scrollProgress = progress;
      });
    }
  }

  /// Starts the countdown timer that updates every second
  void _startCountdown() {
    // Get the target date from dataList for the next event
    final targetEvent = dataList.firstWhere((item) => item.id == nextEventId);
    final targetDateTime = _parseDateTime(targetEvent.date, targetEvent.time);

    // Update countdown immediately
    _updateCountdown(targetDateTime);

    // Set up timer to update countdown every second
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCountdown(targetDateTime);
    });
  }

  /// Parses date and time strings into DateTime object
  DateTime _parseDateTime(String dateStr, String timeStr) {
    // Parse date (format: YYYY-MM-DD)
    final dateParts = dateStr.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    // Parse time (format: HH:MM AM/PM)
    final isPM = timeStr.toLowerCase().contains('pm');
    final timeParts = timeStr
        .replaceAll(RegExp(r'[AP]M'), '')
        .trim()
        .split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    // Convert to 24-hour format if needed
    if (isPM && hour < 12) {
      hour += 12;
    } else if (!isPM && hour == 12) {
      hour = 0;
    }

    return DateTime(year, month, day, hour, minute);
  }

  /// Updates the countdown values based on remaining time
  void _updateCountdown(DateTime targetDateTime) {
    final now = DateTime.now();

    // Calculate the difference
    final difference = targetDateTime.difference(now);

    // If the target date is in the past, stop countdown
    if (difference.isNegative) {
      _countdownTimer?.cancel();
      setState(() {
        days = "00";
        hours = "00";
        minutes = "00";
        seconds = "00";
      });
      return;
    }

    // Calculate time components
    final daysRemaining = difference.inDays;
    final hoursRemaining = difference.inHours % 24;
    final minutesRemaining = difference.inMinutes % 60;
    final secondsRemaining = difference.inSeconds % 60;

    // Format and update the state
    setState(() {
      days = daysRemaining.toString().padLeft(2, '0');
      hours = hoursRemaining.toString().padLeft(2, '0');
      minutes = minutesRemaining.toString().padLeft(2, '0');
      seconds = secondsRemaining.toString().padLeft(2, '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFBE45),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: _titleHeight)),

              SliverToBoxAdapter(
                child: Opacity(
                  opacity: 1.0 - _scrollProgress,
                  child: Transform.translate(
                    offset: Offset(0, -50 * _scrollProgress),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HomePageContainer01(
                        days: days,
                        hours: hours,
                        minutes: minutes,
                        seconds: seconds,
                        eventId: nextEventId,
                        onTap: () => _showPopup(context, nextEventId),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/lineArt.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image Not Found',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      children: List.generate(
                        dataList.length,
                        (index) => GestureDetector(
                          onTap: () => _showPopup(context, dataList[index].id),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFF1D6),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataList[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'UNIndeewaree',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  dataList[index].description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'UNGanganee',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 1.0 - _scrollProgress,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 70, 10, 20),
                child: Text(
                  'සුභ අළුත් අවුරුද්දක් වේවා',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'UNDisapamok',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          Positioned(
            top: _topPadding,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: _scrollProgress,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Transform.translate(
                  offset: Offset(0, (1.0 - _scrollProgress) * 30),
                  child: HomePageContainer02(
                    days: days,
                    hours: hours,
                    minutes: minutes,
                    seconds: seconds,
                    eventId: nextEventId,
                    onTap: () => _showPopup(context, nextEventId),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a popup dialog with countdown information for the specified event
  void _showPopup(BuildContext context, int id) {
    final data = dataList.firstWhere((item) => item.id == id);

    // For the selected event, calculate its own countdown
    final targetDateTime = _parseDateTime(data.date, data.time);
    final now = DateTime.now();
    final difference = targetDateTime.difference(now);

    String eventDays = "00";
    String eventHours = "00";
    String eventMinutes = "00";
    String eventSeconds = "00";

    // Only calculate if the event is in the future
    if (!difference.isNegative) {
      eventDays = difference.inDays.toString().padLeft(2, '0');
      eventHours = (difference.inHours % 24).toString().padLeft(2, '0');
      eventMinutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
      eventSeconds = (difference.inSeconds % 60).toString().padLeft(2, '0');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupDialog(
          data: data,
          countdownDays: eventDays,
          countdownHours: eventHours,
          countdownMinutes: eventMinutes,
          countdownSeconds: eventSeconds,
        );
      },
    );
  }
}
