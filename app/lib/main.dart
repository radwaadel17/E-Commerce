import 'package:app/views/Home%20page.dart';
import 'package:app/firebase_options.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:app/views/onboarding%20page.dart';
import 'package:app/views/splash%20page.dart';
import 'package:app/views/welcome%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() async{
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const App()// Wrap your app
  ),
  
  );
    await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MaterialApp(
       routes: {
          'on' : (context) => onboarding_screen(),
        },
       debugShowCheckedModeBanner: false,
       home: splash_page(),
      ),
    );
  }
}