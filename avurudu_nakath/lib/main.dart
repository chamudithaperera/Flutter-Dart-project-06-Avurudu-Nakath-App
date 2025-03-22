import 'package:avurudu_nakath/GetStartPage.dart';
import 'package:flutter/material.dart';
import 'notification_service.dart';
import 'homePageContainer02.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init(); // Initialize notifications
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GetStartPage());
  }
}
