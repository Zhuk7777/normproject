import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        //в квадратных скобках пишется насыщенность цвета
        appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Список дел'),
    centerTitle: true,
    ),
    body:Column(
      children:[
        Text('Main screen',style:TextStyle(color:Colors.redAccent)),
        ElevatedButton(onPressed:(){
          //Navigator.pushNamed(context,'/todo');//первый параметр это страница, на которой мы сейчас находимся, второй-это то, куда мы хотим перейти, на новой страничке в заголовке будет стрелочка, которая позволит вернуться на пред. страницу
          //Navidator.pushNamedAndRemoveUntil(context,'/todo',(route)=>false);//позволяет убрать стрелочку, если написать true,то стрелочка останется
          Navigator.pushReplacementNamed(context, '/todo');//открывает новую страницу, удаляя предыдущую
        },child: Text('Перейти далее') ,)
      ]

    )
    );
  }
}
