import 'package:flutter/material.dart';
// import '../common/eventBus.dart';
import 'dart:async';


class ScoreBoard extends StatefulWidget {
  
  ScoreBoard({Key key, this.rounds, this.count, this.callback})
    :super(key: key);
  final callback;
  final rounds;
  final int count;
  
  
  @override
  ScoreBoardState createState() => new ScoreBoardState();
}

class ScoreBoardState extends State<ScoreBoard> {
  int pertDart;

  final colors = {
    1: Colors.white,
    2: Colors.red,
    3: Colors.blue
  };

  void firedA() {
    widget.callback(pertDart);
  }

  List<Widget>scoreList() => widget.rounds.map<Widget>((element) =>
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.white, child: Text('${element[4]}')),
      label: new Container(
        width: 80,
        child: new Row(
          children: <Widget>[
            new Container(
              width: 22,
              margin: EdgeInsets.only(),
              // decoration: BoxDecoration(
              //   border: Border(
              //     right: BorderSide(
              //       width: 1,
              //       color: Colors.grey
              //     )
              //   )
              // ),
              child: new Text(
                '${element[1]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ),
            new Container(
              child: new Text(
                '|',
                style: TextStyle(
                  color: Colors.grey
                ),
              )
            ),
            new Container(
              width: 22,
              margin: EdgeInsets.only(),
              // decoration: BoxDecoration(
              //   border: Border(
              //     right: BorderSide(
              //       width: 1,
              //       color: Colors.grey
              //     )
              //   )
              // ),
              child: new Text(
                '${element[2]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ),
            new Container(
              child: new Text(
                '|',
                style: TextStyle(
                  color: Colors.grey
                ),
              )
            ),
            new Container(
              width: 22,
              margin: EdgeInsets.only(),
              child: new Text(
                '${element[3]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ),
          ]
        ),
      ),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0), side: new BorderSide(style: BorderStyle.none)),
      // elevation: 10,
      backgroundColor: Color.fromRGBO(217, 218, 219, .5)
    ),
    // Container(
    //   // child: Text("Round:${element[4]} ${element[1]} ${element[2]} ${element[3]}"),
    //   child: new Row(
    //     children: [
    //       new Text("Round${element[4]}: "),
    //       new Row(
    //         children: [
    //           new Text("${element[1]} ${element[2]} ${element[3]}")
    //         ]
    //       )
    //     ]
    //   )
    // )
  ).toList();
  // List<Widget>boxs4() => _score4.map((element) =>
  //   Expanded(
  //     child: RaisedButton(
  //       shape: RoundedRectangleBorder(
  //         side: BorderSide(color: Colors.grey, width: .1)
  //       ),
  //       onPressed: (){
  //         _onChanged(element * widget.times);
  //       },
  //       child: Padding(
  //         padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
  //         child: Text("${element * widget.times}"),
  //       ),
  //       color: colors[widget.times],
  //       padding: EdgeInsets.all(1)
  //     )
  //   )
  // ).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:0.0, bottom: 0.0),
      alignment: Alignment.centerLeft,
      child: new Wrap(
        runSpacing: 10.0,
        spacing: 10.0,
        children: scoreList()
      )
    );
  }
}
