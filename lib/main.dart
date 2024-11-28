import 'package:films_app/core/theme.dart';
import 'package:films_app/pages/main_screen/main_screen.dart';
import 'package:films_app/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/sizeConfig.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ViewModel(),)], child: const App(),));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Bitter",
          appBarTheme: AppTheme.appBarTheme(),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
