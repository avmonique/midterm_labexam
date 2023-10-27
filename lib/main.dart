import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  String text;
  Color color;
  Item(this.text, this.color);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var textController = TextEditingController();

  List<Item> item = [];

  void addItem(Color color) {
    String newItem = textController.text;
    if (newItem.isNotEmpty) {
      setState(() {
        item.add(Item(newItem, color));
      });
    }
  }
  void redTeam() {
    addItem(Colors.red);
  }
  void blueTeam() {
    addItem(Colors.blue);
  }
  void clearList() {
    setState(() {
      item.clear();
    });
  }
  int itemCounter() {
      return item.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: redTeam, 
                      child: const Text("Red Team"),
                    ),
                    ElevatedButton(onPressed: blueTeam, child: const Text("Blue Team")),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: clearList, 
                      child: const Text("Clear"),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: item.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ListTile(
                           title: Text(item[index].text),
                           tileColor: item[index].color,
                        ),
                      );
                    }
                  ),
                ),
                Text("Counter: ${itemCounter()}",
                  style: const TextStyle(fontSize: 22,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}