import 'package:adge/api/AdgeApi.dart';
import 'package:adge/firebase_options.dart';
import 'package:adge/providers/auth/auth_provider.dart';
import 'package:adge/providers/dashboard/sidemenu_provider.dart';
import 'package:adge/providers/user/user_form_provider.dart';
import 'package:adge/providers/user/users_provider.dart';
import 'package:adge/router/router.dart';
import 'package:adge/services/local_storage.dart';
import 'package:adge/services/navigation_service.dart';
import 'package:adge/services/notifications_service.dart';
import 'package:adge/ui/layouts/auth/auth_layout.dart';
import 'package:adge/ui/layouts/dashboard_layout.dart';
import 'package:adge/ui/layouts/splash/splash_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalStorage.configurePrefs();
  AdgeApi.configureDio();

  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider(context)),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADGE',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}