import 'package:flutter/material.dart'; //引入扁平化設計風格的組件
import 'views/zeroOne.dart';

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
        // Try running your application with 'flutter run'. You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // 'hot reload' (press 'r' in the console where you ran 'flutter run',
        // or simply save your changes to 'hot reload' in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(233, 222, 50, 1.0),
      ),
      home: MyHomePage(
        title: 'darts Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  changeType(int zeroOneType) {
    childKey.currentState.changeType(zeroOneType);
  }
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [ZeroOne(key: childKey)];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SingleChildScrollView(
        child: pages[_currentIndex]
      ),
      drawer: new SizedBox(
        width: 150,
        child: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              new SizedBox(
                height: 110,
                child: new DrawerHeader(
                  child: Text(
                    '比賽選擇',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 222, 50, 1.0),
                  ), 
                ),
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '01',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  )
                ),
                title: Text(
                  '501',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                onTap: () {
                  changeType(501);
                },
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '01',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  )
                ),
                title: Text(
                  '701',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                onTap: () {
                  changeType(701);
                },
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    '01',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  )
                ),
                title: Text(
                  '901',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                onTap: () {
                  changeType(901);
                },
              ),
            ],
          )
        )
      ),
      // body: new Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       new Home()
      //     ]
      //   )
      // )
    );
  }
}