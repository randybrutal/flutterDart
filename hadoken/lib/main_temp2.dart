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
      title: 'darts Calculator',
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
        primaryColor: Color.fromRGBO(233, 222, 50, 1.0),
      ),
      home: ScoreColumn(),
    );
  }
}

class ScoreColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Darts Calculator')
      ),
      body: NumberPad()
    );
  }
}

class NumberPad extends StatefulWidget {
  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  int _score = 501;
  int _singleDart = 0;
  int _baseSingle = 20;
  int _oneDartScore = 20;

  _clearScore(item) {
    setState(() {
      _singleDart = item;
    });
  }

  _changeScorePad(times) {
    setState(() {
      _oneDartScore = _baseSingle * times;
    });
  }

  // List scoreList;

  // initState() {
  //   super.initState();
  //   scoreList = [1,2,3,4];
  // }
  List<Widget> boxs() => List.generate(_oneDartScore, (index) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Colors.orangeAccent,
      //     Colors.orange,
      //     Colors.deepOrange
      //   ]),
      // ),
      child: RaisedButton(
        onPressed: (){
          _clearScore(index + 1);
        },
        child: Text("${index + 1}"),
        // color: Color.fromRGBO(230, 12, 14, 1.0),
        // color: Color.fromRGBO(0, 0, 0, 1.0),
        color: Color.fromRGBO(33, 114, 255, 1.0),
        padding: EdgeInsets.all(5),
        // shape: 
        // icon: Icon(Icons.gps_not_fixed_outlined),
      )
    );
  });

  // Widget buildButton() {
  //   List<Widget> buttons = []; // 先建一個陣列用於存放迴圈生成的widget
  //   Widget content;
  //   for (var item = 1; item <= 20; item++) {
  //     buttons.add(
  //       Container(
  //         width: 50.0,
  //         height: 50.0,
  //         alignment: Alignment.center,
  //         child: RaisedButton(
  //           onPressed: (){
  //             _clearScore(item);
  //           },
  //           child: Text(item.toString()),
  //           // color: Color.fromRGBO(230, 12, 14, 1.0),
  //           // color: Color.fromRGBO(0, 0, 0, 1.0),
  //           color: Color.fromRGBO(33, 114, 255, 1.0),
  //           padding: EdgeInsets.all(5),
  //           // shape: 
  //           // icon: Icon(Icons.gps_not_fixed_outlined),
  //         )
  //       )
  //     );
  //   }
  //   content = new ButtonBar(children: buttons);
    
  //   return content;
  // }

  // Widget buttonBlock = buildButton();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: -10, //主轴上子控件的间距
      runSpacing: -10, //交叉轴上子控件之间的间距
      children: boxs()
    );
  }
}
