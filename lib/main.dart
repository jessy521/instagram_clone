import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDTU-ZvqTRFcAzeC9DG7IVecNzsZjdgTB",
            appId: "1:342218531093:web:76f3f32c2030936ffe491c",
            messagingSenderId: "342218531093",
            projectId: "instagram-clone-c66d7",
            storageBucket: "instagram-clone-c66d7.appspot.com"));
  } else {
    Firebase.initializeApp;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const Scaffold(
      //   body: ResponsiveLayoutScreen(
      //       webScreenLayout: WebScreenLayout(),
      //       mobileScreenLayout: MobileScreenLayout()),
      // ),
      home: const SignUpPage(),
    );
  }
}
