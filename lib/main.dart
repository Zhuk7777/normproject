import 'package:flutter/material.dart';
import 'package:normproject/pages(classes)/Home.dart';
import 'package:normproject/pages(classes)/main_screen.dart';

void main()=>runApp(MaterialApp(
  theme:ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  initialRoute: '/',//изначальный путь, т.e при запуске приложения откроется MainScreen
  //home:MainScreen(),
  //home:Home(),//в качестве основной странички будуем вызывать класс Home, который потом опишем
  routes:
  {
    '/':(context)=>MainScreen(),//т.е. главной страницей будет MainScreen, в кавычках мы дали просто название этой странице
    '/todo':(context)=>Home(),
  }
));
