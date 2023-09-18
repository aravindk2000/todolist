import 'package:flutter/material.dart';

void main() {
  runApp(const todo());
}

class todo extends StatelessWidget {
  const todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen()
    );
  }

}

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  List<Widget> data = [];

  TextEditingController acontroller = TextEditingController();

  TextEditingController bcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {

          alert(context);
        },child:Icon(Icons.add)
        ),
        body: ListView.builder(
          itemCount:  data.length,
          itemBuilder: (context, index) {
            return data[index];
          },)

    );
  }

  alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'New Tasks',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.brown, fontSize: 16),
          ),
          content: Column(
            children: [
              Container(
                  child: TextField(
                    controller: acontroller,
                  )
              ),
              Container(
                  child: TextField(
                    controller: bcontroller,
                  )
              )
            ],
          ),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Cancel')),
            ElevatedButton(onPressed: () {
              setState(() { display(context);});
              acontroller.clear();
              bcontroller.clear();
              Navigator.pop(context);
            }, child: Text('save'))

          ],
        );
      },
    );
  }

  display(BuildContext context) {
    final subtitle = bcontroller.text;
    final title = acontroller.text;
    return data.add(
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 60,
          color: Colors.redAccent,padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(title),
              Text(subtitle)
            ],
          ),
        )

    );
  }

}