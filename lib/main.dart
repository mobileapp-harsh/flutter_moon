import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moon/config/app_routes.dart';
import 'package:flutter_moon/config/app_screen.dart';
import 'package:get/get.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH_SCREEN,
      getPages: AppScreens.list,
      title: 'First App',
    );
  }
}