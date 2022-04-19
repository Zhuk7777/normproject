import 'package:flutter/material.dart';
import 'package:normproject/pages(classes)/Home.dart';

void main()=>runApp(MaterialApp(
  theme:ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  home:Home(),//в качестве основной странички будуем вызывать класс Home, который потом опишем
));
