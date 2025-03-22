import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    // ✅ Define Android settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ✅ Define iOS settings
    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    // ✅ Set up initialization settings for both platforms
    final InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // ✅ Initialize the plugin
    await _notificationsPlugin.initialize(settings);

    // ✅ Ensure Timezone is Initialized
    _initializeTimeZone();
  }

  static void _initializeTimeZone() {
    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation('Asia/Colombo'),
    ); // ✅ Set Sri Lanka Timezone
  }

  static Future<void> scheduleNotification(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
  ) async {
    final tz.TZDateTime tzScheduled = tz.TZDateTime.from(
      scheduledTime,
      tz.local,
    );

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzScheduled,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'avurudu_nakath_channel',
          'Avurudu Nakath Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(), // ✅ Add iOS Notification Settings
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
