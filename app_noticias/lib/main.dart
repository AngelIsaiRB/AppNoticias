import 'package:app_noticias/src/pages/tabs_page.dart';
import 'package:app_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
      theme: miTema,
    );
  }
}