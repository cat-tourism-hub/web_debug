import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_hub/Providers/internet_connection.dart';
import 'package:tourism_hub/dashboard.dart';
import 'package:tourism_hub/firebase_options.dart';
import 'package:tourism_hub/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => InternetConnectionProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 117, 204)),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InternetConnectionProvider>(
      builder: (context, internetConnectionProvider, child) {
        if (internetConnectionProvider.isConnected) {
          return const Dashboard();
        } else {
          return const Center(
            child: Text('No Internet Connection'),
          );
        }
      },
    );
  }
}
