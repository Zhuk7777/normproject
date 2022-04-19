
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userTodo = '';
  List todo_list = []; //todo_list просто название списка
  @override
  //void initState() {
    //мотод для заполнения списка и он вызывается, когда только только запускается прога
    // TODO: implement initState
    //super.initState();

    //todo_list.addAll(['Купить молоко', 'Помыть посуду', 'Купить картошку']);
  //}

  void _menuOpen()
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder:(BuildContext context) {
      return Scaffold
        (
        appBar: AppBar(title: Text('Меню'),backgroundColor: Colors.redAccent,),
        body:Row(
          children:[
            ElevatedButton(onPressed: () {
              Navigator.pop(context);//позволяет сначала скрыть меню
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
              child:Text('На главную'),
            ),
            Padding(padding:EdgeInsets.only(left:15)),//отступ
            Text('Наше простое меню'),
          ]
        ),
      );
      })
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //в квадратных скобках пишется насыщенность цвета
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Список дел'),
        centerTitle: true,
        actions:[
          IconButton(
            icon:Icon(Icons.menu_outlined),
            onPressed: _menuOpen,//метод, который сами выше реализовали
          ),
        ]
      ),
      body: ListView.builder(
          itemCount: todo_list.length, //размер списка
          itemBuilder: (BuildContext context,
              int index) { //вроде это функция, в которой мы будем обращаться к конкретному индексу списка, сам itemBuilder перебирает весь список
            return Dismissible(key: Key(todo_list[index]),
              //позволяет каждый элемент,который представляет блок(карточку) смахивать вправо или влево
              child: Card(
                child: ListTile(
                    title: Text(todo_list[index]),
                    trailing: IconButton( //делаем доп конпку для удаления, помимо смахиания
                      icon: Icon(
                        Icons.delete_sweep,
                        color: Colors.redAccent,
                      ), onPressed: () {
                      setState(() {
                        todo_list.removeAt(index);
                      }
                      ); //setState
                    }, //onPressed
                    )
                ),
              ),
              onDismissed: (
                  direction) { //штука, которая позволяет описать что будет происходить внутри проги при смахивании вправо или влево
                //direction сами дали такие название входного параметра функции
                //if(direction==DismissDirection.endToStart);//смахиание влево, мы могли написать, что допустим при смахивании влево он удаляется, но мы будем удалять при любом смахивании
                //if(direction==DismissDirection.startToEnd)//смахивание впрово
                setState(() {
                  todo_list.removeAt(index);
                }

                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    userTodo = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      todo_list.add(userTodo);
                    });
                    Navigator.of(context)
                        .pop(); //закрытие окна при нажатии на добавить
                  }, child: Text('Добавить')),
                ], //добавляем кнопку, вообще в actions можно добавлять много кнопок
              );
            }); //всплывающее окно
            // context это такой же параметр, что и в Widget build(BuildContext context)
            //он означает, что мы будем делать всплывающее окно на той же страничке, в том же контексте
          },
          child: Icon(
            Icons.add_box,
            color: Colors.white,
          )),
    );
  }
}
