import 'package:flutter/material.dart';
// import '../common/eventBus.dart';
import 'dart:async';


class ScorePad extends StatefulWidget {
  
  ScorePad({Key key, this.times, this.callback})
  :super(key: key);
  final callback;
  final int times;
  
  
  @override
  ScorePadState createState() => new ScorePadState();
}

class ScorePadState extends State<ScorePad> {
  int pertDart;

  final colors = {
    1: Colors.cyan[50],
    2: Colors.cyanAccent[100],
    3: Colors.cyanAccent
  };

  final List<int> _score1 = [1, 2, 3, 4, 5];
  final List<int> _score2 = [6, 7, 8, 9, 10];
  final List<int> _score3 = [11, 12, 13, 14, 15];
  final List<int> _score4 = [16, 17, 18, 19, 20];

  void firedA() {
    widget.callback(pertDart);
  }

  void _onChanged(int value) {
    setState(() {
      pertDart = value;
      firedA();
    });
  }

  List<Widget>boxs1() => _score1.map((element) =>
    Expanded(
      flex: 2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: .1)
        ),
        onPressed: (){
          _onChanged(element * widget.times);
        },
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          child: Text("${element * widget.times}"),
        ),
        color: colors[widget.times],
        padding: EdgeInsets.all(1)
      )
    )
  ).toList();

  List<Widget>boxs2() => _score2.map((element) => 
    Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: .1)
        ),
        onPressed: (){
          _onChanged(element * widget.times);
        },
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          child: Text("${element * widget.times}"),
        ),
        color: colors[widget.times],
        padding: EdgeInsets.all(1)
      )
    )
  ).toList();

  List<Widget>boxs3() => _score3.map((element) =>
    Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: .1)
        ),
        onPressed: (){
          _onChanged(element * widget.times);
        },
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          child: Text("${element * widget.times}"),
        ),
        color: colors[widget.times],
        padding: EdgeInsets.all(1)
      )
    )
  ).toList();

  List<Widget>boxs4() => _score4.map((element) => 
    Expanded(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: .1)
        ),
        onPressed: (){
          _onChanged(element * widget.times);
        },
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          child: Text("${element * widget.times}"),
        ),
        color: colors[widget.times],
        padding: EdgeInsets.all(1)
      )
    )
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:0.0, bottom: 0.0),
      decoration: BoxDecoration(
        color: Colors.white),
      child: new Column(
        children: [
          new Row(
            children: boxs1()
          ),
          new Row(
            children: boxs2()
          ),
          new Row(
            children: boxs3()
          ),
          new Row(
            children: boxs4()
          ),
          new Row(
            children: [
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: .1)
                  ),
                  onPressed: (){
                    _onChanged(25);
                  },
                  child: Padding(
                    padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                    child: Text('Single Bull'),
                  ),
                  color: Colors.greenAccent[100],
                  padding: EdgeInsets.all(1)
                )
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: .1)
                  ),
                  onPressed: (){
                    _onChanged(50);
                  },
                  child: Padding(
                    padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                    child: Text('Double Bull'),
                  ),
                  color: Colors.greenAccent,
                  padding: EdgeInsets.all(1)
                )
              )
            ]
          )
        ]
      )
    );
  }
}
