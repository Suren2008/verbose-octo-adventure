import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/root_screen.dart';
import 'services/app_state.dart';
import 'services/storage_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  final state = AppState(StorageService());
  await state.load();

  runApp(NutriScanApp(state: state));
}

class NutriScanApp extends StatelessWidget {
  const NutriScanApp({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: state,
      builder: (context, _) {
        return MaterialApp(
          title: 'NutriScan',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: state.themeMode,
          home: RootScreen(state: state),
        );
      },
    );
  }
}
