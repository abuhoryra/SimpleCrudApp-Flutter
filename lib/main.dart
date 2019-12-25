import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My First App', style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green[400]
        ,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/image1.jpg'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Container(
             child: Add(),
            margin: EdgeInsets.all(15.0),
          )
        ],

      ),


    );
  }
}

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  String name = '';
  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            child: Text('Add'),
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Add List'),

                    content: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter a List'
                      ),
                      controller: myController,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel', style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Save', style: TextStyle(color: Colors.green),),
                        onPressed: (){
                         setState(() {
                           name = myController.text;
                           myController.clear();
                           Navigator.of(context).pop();
                         });
                        },
                      )
                    ],
                  )
              );

            },
            backgroundColor: Colors.deepOrange,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            '$name',style: TextStyle(color: Colors.white,fontSize: 30.0),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(0.0),
          child: RaisedButton(
            child: Text('Clear', style: TextStyle(color: Colors.white),),
            color: Colors.red,
            onPressed: () {
                setState(() {
                  name = '';
                });
            },
          ),

        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.all(0.0),
          child: RaisedButton(
            child: Text('Edit', style: TextStyle(color: Colors.white),),
            color: Colors.blueAccent,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Add List'),
                    content: TextField(
                      decoration: InputDecoration(
                          hintText: name,
                      ),

                      controller: myController,

                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel', style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Save', style: TextStyle(color: Colors.green),),
                        onPressed: (){
                          setState(() {
                            name = myController.text;
                            myController.clear();
                            Navigator.of(context).pop();
                          });
                        },
                      )
                    ],
                  )
              );
            },
          ),
        )
      ],
    );
  }
}

