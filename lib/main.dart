import 'package:flutter/material.dart';
import 'package:task2/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData( size: 60,color: Colors.red),
        scaffoldBackgroundColor: Colors.green[100],
        appBarTheme: AppBarTheme(color: Colors.orange[100]),
        
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Show Images",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Home(),
      ),
    );
  }
}
