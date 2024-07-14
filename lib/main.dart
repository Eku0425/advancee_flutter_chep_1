import 'package:advancee_flutter_chep_1/screen/1.4/provider/change_theme_screen_provider.dart';
import 'package:advancee_flutter_chep_1/screen/1.4/view/change_theme.dart';
import 'package:advancee_flutter_chep_1/screen/1.5(2)/introScreen/introScreen.dart';
import 'package:advancee_flutter_chep_1/screen/1.5(2)/provider/introScreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool theme = false;
bool isHomed = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  theme = sharedPreferences.getBool('theme') ?? false;
  isHomed = sharedPreferences.getBool('home') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeThemeScreenProvider(theme),
        ),
        ChangeNotifierProvider(
          create: (context) => IntroScreenProvider(isHomed),
        ),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ChangeThemeScreenProvider changeThemeScreenProviderTrue =
        Provider.of<ChangeThemeScreenProvider>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider.of<IntroScreenProvider>(context).isHome
          ? const ChangeTheme()
          : const IntroScreen(),
      theme: changeThemeDataToLight,
      darkTheme: changeThemeDataToDark,
      themeMode: changeThemeScreenProviderTrue.isDark
          ? ThemeMode.dark
          : ThemeMode.light,
    );

    // return ChangeNotifierProvider(
    //   create: (context) => IntroScreenProvider(),
    //   builder: (context, child) => const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: IntroScreen(),
    //   ),
    // );

    // return ChangeNotifierProvider(
    //   create: (context) => HomeProvider(),
    //   builder: (context, child) => const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: HomeScreen(),
    //   ),
    // );
  }
}
