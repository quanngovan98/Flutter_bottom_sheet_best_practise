import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Bottom sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode _focusNode = FocusNode();
  GlobalKey _inputKey = new GlobalKey(debugLabel: 'inputText');

  @override
  void initState() {
    _focusNode.addListener(() {
      print("focusss");
      Scrollable.ensureVisible(_inputKey.currentContext);
    });
  }

  void _newTaskModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext ctx) {
        return FractionallySizedBox(
          heightFactor: 0.6, //set the sheet height here
          child: Scaffold(
            // use CupertinoPageScaffold for iOS
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true, // important
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      color: Colors.red.shade50,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '1'),
                      ),
                    ),
                    Container(
                      color: Colors.red.shade100,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '2'),
                      ),
                    ),Container(
                      color: Colors.red.shade200,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '3'),
                      ),
                    ),Container(
                      color: Colors.red.shade300,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '4'),
                      ),
                    ),Container(
                      color: Colors.red.shade400,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '5'),
                      ),
                    ),Container(
                      color: Colors.red.shade500,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '6'),
                      ),
                    ),Container(
                      color: Colors.red.shade600,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '7'),
                      ),
                    ),Container(
                      color: Colors.red.shade700,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '8'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _newTaskModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
