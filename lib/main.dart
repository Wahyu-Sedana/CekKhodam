import 'package:cek_khodam/features/main/presentation/providers/main_provider.dart';
import 'package:cek_khodam/features/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/main/presentation/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  try {
    runApp(const MyApp());
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MainProvider())],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const SplashPage(),
              '/main': (context) => const MainPage(),
            },
            builder: (context, child) {
              final mediaQuery = MediaQuery.of(context);
              final scale = mediaQuery.textScaleFactor.clamp(1.0, 1.2);
              return MediaQuery(data: mediaQuery.copyWith(textScaleFactor: scale), child: child!);
            },
          );
        },
        maxTabletWidth: 900,
        maxMobileWidth: 450,
      ),
    );
  }
}
