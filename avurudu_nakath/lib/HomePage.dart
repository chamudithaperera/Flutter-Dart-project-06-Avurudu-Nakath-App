import 'package:flutter/material.dart';
import 'dart:async';

import 'data/data.dart';
import 'homePageContainer01.dart';
import 'homePageContainer02.dart';
import 'popup.dart';
import 'notification_service.dart';

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
  Timer? _eventCheckTimer;

  // Current countdown values
  String days = "00";
  String hours = "00";
  String minutes = "00";
  String seconds = "00";

  // ID of the next event (will be determined dynamically)
  late int nextEventId;
  late DataModel nextEvent;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // Find the next event
    _updateNextEvent();

    // Start the countdown timer
    _startCountdown();

    // Set up a timer to periodically check if the next event has changed
    // This handles when one event passes and we need to move to the next
    _eventCheckTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateNextEvent();
    });

    // Schedule notifications for all events
    _scheduleNotifications();
  }

  // Schedule notifications for all events
  Future<void> _scheduleNotifications() async {
    await NotificationService.scheduleAllNotifications();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();

    // Cancel the timers when widget is disposed
    _countdownTimer?.cancel();
    _eventCheckTimer?.cancel();
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

  /// Finds and updates the next upcoming event
  void _updateNextEvent() {
    final now = DateTime.now();
    DataModel? upcomingEvent;
    Duration? shortestDuration;

    for (var event in dataList) {
      final eventDateTime = _parseDateTime(event.date, event.time);
      if (eventDateTime.isBefore(now)) continue;

      final duration = eventDateTime.difference(now);
      if (shortestDuration == null || duration < shortestDuration) {
        shortestDuration = duration;
        upcomingEvent = event;
      }
    }

    if (upcomingEvent != null) {
      setState(() {
        nextEvent = upcomingEvent!;
        nextEventId = upcomingEvent.id;
      });
    }
  }

  /// Restarts the countdown timer
  void _restartCountdown() {
    _countdownTimer?.cancel();
    _startCountdown();
  }

  /// Starts the countdown timer that updates every second
  void _startCountdown() {
    // Get the target date for the next event
    final targetDateTime = _parseDateTime(nextEvent.date, nextEvent.time);

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

    // Parse time (format: HH:MM AM/PM or 24-hour format)
    int hour = 0;
    int minute = 0;

    if (timeStr.toLowerCase().contains('am') ||
        timeStr.toLowerCase().contains('pm')) {
      // 12-hour format with AM/PM
      final isPM = timeStr.toLowerCase().contains('pm');
      final timeParts = timeStr
          .replaceAll(RegExp(r'[AP]M'), '')
          .trim()
          .split(':');
      hour = int.parse(timeParts[0]);
      minute = int.parse(timeParts[1]);

      // Convert to 24-hour format if needed
      if (isPM && hour < 12) {
        hour += 12;
      } else if (!isPM && hour == 12) {
        hour = 0;
      }
    } else {
      // 24-hour format
      final timeParts = timeStr.split(':');
      hour = int.parse(timeParts[0]);
      minute = int.parse(timeParts[1]);
    }

    return DateTime(year, month, day, hour, minute);
  }

  /// Updates the countdown values based on remaining time
  void _updateCountdown(DateTime targetDateTime) {
    final now = DateTime.now();

    // Calculate the difference
    final difference = targetDateTime.difference(now);

    // If the target date is in the past, stop countdown and check for next event
    if (difference.isNegative) {
      _updateNextEvent();
      // Restart the countdown with the new next event
      _restartCountdown();
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
          // Add a safe area to prevent scrolling under the top container
          SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              // Use clamping physics to prevent overscroll
              physics: const ClampingScrollPhysics(),
              slivers: [
                // Add padding at the top to ensure content starts below the top container
                SliverPadding(
                  padding: EdgeInsets.only(
                    // Adjust padding to create more space at the top
                    top:
                        _titleHeight +
                        (_container02Height * _scrollProgress) +
                        20,
                  ),
                  sliver: SliverToBoxAdapter(child: Container()),
                ),

                SliverToBoxAdapter(
                  child: Opacity(
                    opacity: 1.0 - _scrollProgress,
                    child: Transform.translate(
                      offset: Offset(0, -50 * _scrollProgress),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 24,
                    ), // Adjust padding for better spacing
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
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      0,
                      24,
                      32,
                    ), // Adjust padding for bottom content
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Increase border radius
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(
                          dataList.length,
                          (index) => GestureDetector(
                            onTap:
                                () => _showPopup(context, dataList[index].id),
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(12), // Adjust margin
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ), // Increase border radius
                                color: const Color(0xffFFF1D6),
                              ),
                              padding: const EdgeInsets.all(
                                16.0,
                              ), // Increase padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataList[index].name,
                                    style: const TextStyle(
                                      fontSize:
                                          22, // Slightly increase font size
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFamily: 'UNIndeewaree',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ), // Increase spacing
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

                // Add extra space at the bottom for better scrolling experience
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
