import 'package:flutter/material.dart';
import 'package:tcp_masters/pages/user_dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TcpMastersApp());
}

class TcpMastersApp extends StatelessWidget {
  const TcpMastersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 52, 140, 1)),
        useMaterial3: true,
      ),
      home: DashboardPage(),
    );
  }
}
