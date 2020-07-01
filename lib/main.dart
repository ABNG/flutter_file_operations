import 'package:flutter/material.dart';
import 'package:flutter_file_operations/utils/file_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String content = "No Data";
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Read And Write"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "enter text",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            child: Text("Save to File"),
            color: Colors.red,
            onPressed: () {
              FileUtils.saveToFile(textEditingController.text);
            },
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            child: Text("Read from File"),
            color: Colors.orange,
            onPressed: () {
              setState(() {
                FileUtils.readFromFile().then((value) {
                  content = value;
                });
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            content,
            textScaleFactor: 1.5,
          )
        ],
      ),
    );
  }
}
