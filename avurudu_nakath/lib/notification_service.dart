import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_init;
import 'data/data.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notification settings
  static Future<void> init() async {
    // Initialize timezone first
    tz_init.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    final InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // Initialize the plugin
    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
      },
    );

    // Request permissions for iOS
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // Schedule notifications for all events in the data list
  static Future<void> scheduleAllNotifications() async {
    // Cancel any existing notifications first
    await _notificationsPlugin.cancelAll();

    // Schedule a notification for each event in the data list
    for (var event in dataList) {
      await scheduleEventNotification(event);
    }
  }

  // Schedule a notification for a specific event
  static Future<void> scheduleEventNotification(DataModel event) async {
    // Parse the date and time from the event
    final eventDateTime = _parseDateTime(event.date, event.time);
    final now = DateTime.now();

    // Only schedule if the event is in the future
    if (eventDateTime.isAfter(now)) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            'event_channel_id',
            'Event Notifications',
            channelDescription: 'Notifications for Avurudu events',
            importance: Importance.high,
            priority: Priority.high,
            enableVibration: true,
            enableLights: true,
            playSound: true,
          );

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      // Schedule the notification
      await _notificationsPlugin.zonedSchedule(
        event.id,
        event.name,
        event.description,
        tz.TZDateTime.from(eventDateTime, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  // Helper method to parse date and time strings
  static DateTime _parseDateTime(String dateStr, String timeStr) {
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
}
