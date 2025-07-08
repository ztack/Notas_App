import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'screens/home_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (TargetPlatform.windows == defaultTargetPlatform ||
      TargetPlatform.linux == defaultTargetPlatform ||
      TargetPlatform.macOS == defaultTargetPlatform) {
    sqfliteFfiInit(); // Inicializa el FFI
    databaseFactory = databaseFactoryFfi; // Asigna el factory correcto
  }

  // Asegura que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(), // Aquí se llama a tu pantalla principal
      debugShowCheckedModeBanner: false,
    );
  }
}
