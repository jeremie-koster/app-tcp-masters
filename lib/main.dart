import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router/router.dart';
import 'pages/scaffold.dart';

void main() {
  runApp(TcpMastersApp());
}

class TcpMastersApp extends StatelessWidget {
  const TcpMastersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 52, 140, 1)),
        useMaterial3: true,
      ),
    );
  }
}
