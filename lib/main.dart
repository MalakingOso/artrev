import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_theme.dart';
import 'package:artrev/presentation/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  //Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  //Initialize window manager
  await windowManager.ensureInitialized();

  //Configure window settings 
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1280, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  //Run the app
  runApp(const ProviderScope(child: ArtRevApp()));
}


class ArtRevApp extends StatelessWidget {
  const ArtRevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtRev',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
