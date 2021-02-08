import 'package:flutter/material.dart'; //引入扁平化設計風格的組件

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // 實作一個類別，他是繼承於剛剛引入的package中的stateless組件類別
  @override
  Widget build(BuildContext context) {
    //這個function將輸出內容
    //context將會有一些app的基本資訊
    return MaterialApp(
      //最後輸出結果要return出去他才知道
      //MaterialApp是整個扁平化app的最外層
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(
        title: 'darts Calculator',
      ),
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstDart = TextEditingController();
  final _secondDart = TextEditingController();
  final _thirdDart = TextEditingController();
  int _score = 501;
  // int _firstDart = 0;
  // int _secondDart = 0;
  // int _thirdDart = 0;
  // 事件綁定
  void _clearScore() {
    setState(() {
      _score = 501;
    });
  }
  void _counter501(first, second , third) {
    setState(() {
      var _firstDart = first == '' ? 0 : int.parse(first);
      var _secondDart = second == '' ? 0 : int.parse(second);
      var _thirdDart = third == '' ? 0 : int.parse(third);
      int _oneRoundScore = _firstDart + _secondDart + _thirdDart;
      // 三鏢分數爆掉
      if (_oneRoundScore > _score && _oneRoundScore <= 180) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              content: Text('Bust!'),
            );
          },
        );
      }
      // 剩餘分數不低於三鏢加總分數
      if (_score >= _oneRoundScore && _oneRoundScore <= 180) {
        _score = _score - (_oneRoundScore);
        if (_score == 0) {
          _score = 501;
        }
        if (_oneRoundScore >= 100 && _oneRoundScore < 150) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('LowTon!'),
              );
            },
          );
        }
        if (_oneRoundScore > 150 && _oneRoundScore != 180) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('HighTon!'),
              );
            },
          );
        }
        if (_firstDart == 50 && _secondDart == 50 && _thirdDart == 50) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('HatTrick!'),
              );
            },
          );
        }
        if (_firstDart == 60 && _secondDart == 60 && _thirdDart == 60) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('Ton80!'),
              );
            },
          );
        }
        return;
      }
    });
  }

  @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      _firstDart.dispose();
      _secondDart.dispose();
      _thirdDart.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Darts 501',
            )
            ,Text(
              '$_score',
              style: Theme.of(context).textTheme.display2
            ),
            Form(
              child: Column(
                key: _formKey,
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'First Dart',
                    ),
                    validator: (value) {
                      // var _value = int.parse(value);
                      if (value.isEmpty) {
                        return '請輸入正確分數';
                      }
                      return null;
                    },
                    controller: _firstDart
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Second Dart',
                    ),
                    controller: _secondDart
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Third Dart',
                    ),
                    controller: _thirdDart
                  ),
                ],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Text('OK', style: new TextStyle(color: Colors.white)),
                  onPressed: (){
                    _counter501(_firstDart.text, _secondDart.text, _thirdDart.text);
                    _firstDart.clear();
                    _secondDart.clear();
                    _thirdDart.clear();
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  color: Colors.blue,
                ),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Text('reset', style: new TextStyle(color: Colors.white)),
                  onPressed: (){
                    _clearScore();
                    _firstDart.clear();
                    _secondDart.clear();
                    _thirdDart.clear();
                  },
                  color: Colors.red,
                ),
              ],
            ),
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.display1,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
