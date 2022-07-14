import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_tips/bloc/authorisation/auth_bloc.dart';
import 'package:fl_tips/bloc/registration/register_bloc.dart';
import 'package:fl_tips/data/repository/authorisation.dart';
import 'package:fl_tips/data/repository/registration.dart';
import 'package:fl_tips/screens/login_screen.dart';
import 'package:fl_tips/screens/main_screen.dart';
import 'package:fl_tips/screens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? _user;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _user = user;
        });
      } else {
        setState(() {
          _user = null;
        });
      }
    });
    return MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<RegistrationRepository>(
                  create: (context) => RegistrationRepository()),
              RepositoryProvider<AuthorisationRepository>(
                  create: (context) => AuthorisationRepository()),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<RegistrationBloc>(
                    create: (context) => RegistrationBloc(
                          RepositoryProvider.of<RegistrationRepository>(
                              context),
                        )),
                BlocProvider<AuthorisationBloc>(
                    create: (context) => AuthorisationBloc(
                          RepositoryProvider.of<AuthorisationRepository>(
                              context),
                        ))
              ],
              child: _user != null
                  ? DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        // bottomNavigationBar: BottomNavigationBar(items: const [
                        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                        //   BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
                        // ],),
                        appBar: AppBar(
                          bottom: const TabBar(
                            tabs: [
                              Tab(icon: Icon(Icons.home)),
                              Tab(icon: Icon(Icons.settings))
                            ],
                          ),
                        ),
                        body: const TabBarView(
                            children: [MainScreen(), SettingsScreen()]),
                      ),
                    )
                  : const LoginScreen(),
            )));
  }
}
