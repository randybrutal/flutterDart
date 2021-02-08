import 'package:flutter/material.dart';
import 'package:hadoken/custom_icons.dart';
import '../components/scorePad.dart';
import '../components/scoreBoard.dart';

GlobalKey<ZeroOneState> childKey = GlobalKey();

class ZeroOne extends StatefulWidget {
  ZeroOne({Key key})
  :super(key: key);

  @override
  ZeroOneState createState() => new ZeroOneState();
}

class ZeroOneState extends State<ZeroOne> {
  int originTotal;
  int countOneRound = 0;
  int totalScore = 501;
  int perDart = 0;
  int dartCount = 0;
  int times = 1;
  static int roundCount = 1;
  dynamic rounds = [];
  bool nextDisable = false;

  static int dartOne;
  static int dartTwo;
  static int dartThree;

  final colors = {
    1: Colors.cyan[50],
    2: Colors.cyanAccent[100],
    3: Colors.cyanAccent
  };

  changeType(int zeroOneType) {
    setState(() {
      originTotal = zeroOneType;
      showAlertDialog(context, callback: () => Navigator.pop(context));
    });
  }

  void nextRound() {
    setState(() {
      dynamic round = {
        1: dartOne,
        2: dartTwo,
        3: dartThree,
        4: roundCount
      };
      rounds.add(round);
      awardDialog(context, countOneRound);
      reset();
      roundCount += 1;
    });
  }

  void reset() {
    setState(() {
      nextDisable = false;
      dartOne = null;
      dartTwo = null;
      dartThree = null;
      dartCount = 0;
      perDart = 0;
      countOneRound = 0;
    });
  }

  void onDataChange(int val) {
    setState(() {
      countOneRound += val;
      if (dartCount > 2) {
        return;
      }

      dartCount += 1;
      perDart = val;
      totalScore -= val;
      
      if (totalScore == 0) {
        reset();
        // dartCount = 0;
        totalScore = originTotal;
        // dartOne = null;
        // dartTwo = null;
        // dartThree = null;
        // perDart = 0;
        rounds = [];
        // countOneRound = 0;
      }

      if (totalScore < 0) {
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
        dartCount = 0;
        totalScore += countOneRound;
        // countOneRound = 0;
        reset();
        return;
      }

      if (dartCount == 1) {
        dartOne = val;
      }

      if (dartCount == 2) {
        dartTwo = val;
      }

      if (dartCount == 3) {
        dartThree = val;
        nextDisable = true;
      }
    });
  }

  void returnDart() {
    setState(() {
      if (dartCount < 1) {
        return;
      }

      if (dartCount == 1) {
        countOneRound -= dartOne;
        totalScore += dartOne;
        dartOne = null;
        perDart = 0;
      }

      if (dartCount == 2) {
        countOneRound -= dartTwo;
        totalScore += dartTwo;
        dartTwo = null;
        perDart = dartOne;
      }

      if (dartCount == 3) {
        countOneRound -= dartThree;
        totalScore += dartThree;
        dartThree = null;
        perDart = dartTwo;
        nextDisable = false;
      }

      dartCount -= 1;
    });
  }

  void dartPadChange(int val) {
    setState(() {
      times = val;
    });
  }

  showAlertDialog(BuildContext context, {void Function() callback}) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text('取消'),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text('切換'),
      onPressed:  () {
        totalScore = originTotal;
        reset();
        rounds = [];
        Navigator.pop(context);
        callback();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('更換賽制為$originTotal'),
      content: Text('即將更換為$originTotal賽制，會清空所有當前紀錄，是否更換?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  awardDialog(BuildContext context, score) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text('取消'),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    String awardText = '';
    
    if (score > 150 && score != 180) {
      awardText = 'High Ton!';
    }

    if (score == 180) {
      awardText = 'TON 80!';
    }

    if (score >= 100 && score < 150) {
      awardText = 'Low Ton!';
    }

    if (dartOne == 50 && dartTwo == 50 && dartThree == 50) {
      awardText = 'HaTrick!';
    }

    if ((dartOne == 50 || dartTwo == 50 || dartThree == 50) && score < 100) {
      awardText = 'One Bull!';
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(awardText),
      // actions: [
      //   cancelButton
      // ],
    );
    // show the dialog
    if (awardText != '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  Widget scoreBlock(dartsNum) { // 判斷每支鏢的分數，有輸入分數，飛鏢圖案會轉為數字
    dynamic dartsObj = {
      1: dartOne,
      2: dartTwo,
      3: dartThree
    };

    if(dartsObj[dartsNum] != null) {
      return new Container(
        width: 65.0,
        height: 25,
        color: Colors.blueGrey,
        padding: EdgeInsets.only(top: 4),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          '${dartsObj[dartsNum]}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white)
        )
      );
    }

    return new Container(
      width: 65.0,
      height: 25,
      margin: EdgeInsets.only(right: 5),
      child: Icon(
        CustomIcons.darts_icon,
        size: 25
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // var topLeft = Alignment.topLeft;
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            // width: 400.0,
            margin: const EdgeInsets.all(10.0),
            // padding: const EdgeInsets.only(top:10.0, bottom: 0.0),
            child: new Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: scoreBlock(1)
                ),
                new Container(
                  child: scoreBlock(2)
                ),
                new Container(
                  child: scoreBlock(3)
                ),
                new Container(
                  width: 40,
                  height: 25,
                  padding: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: new Text(
                    '$perDart',
                    textAlign: TextAlign.center,
                  ),
                ),
                new Spacer(),
                new Container(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: (){
                      returnDart();
                    },
                    child: Text('回鏢'),
                  ),
                )
              ]
            ),
          ),
          new Container(
            width: 200,
            height: 50,
            padding: EdgeInsets.only(top: 8),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: new Text(
              '$totalScore',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25)
            ),
          ),
          new Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 0),
            child: new Column(
              children: <Widget>[
                new Row(
                  // alignment: WrapAlignment.start,
                  children: [
                    new Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          dartPadChange(1);
                        },
                        color: colors[1],
                        child: Padding(
                          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                          child: Text('Single'),
                        ),
                      )
                    ),
                    new Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          dartPadChange(2);
                        },
                        color: colors[2],
                        child: Padding(
                          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                          child: Text('Double'),
                        ),
                      )
                    ),
                    new Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          dartPadChange(3);
                        },
                        color: colors[3],
                        child: Padding(
                          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                          child: Text('Triple'),
                        ),
                      )
                    ),
                    new Spacer(),
                    new Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: (){
                          onDataChange(0);
                        },
                        color: Colors.grey,
                        child: Padding(
                          padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                          child: Text('0'),
                        ),
                      )
                    ),
                  ]
                ),
              ]
            )
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                new ScorePad(times: times, callback: (val) => onDataChange(val)),
              ]
            )
          ),
          new Row(
            children: [
              new Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: nextDisable ? (){
                    nextRound();
                  } : null,
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: new EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                    child: Text(
                      'Next Round',
                      style: TextStyle(fontSize: 20),
                    )
                  )
                )
              )
            ]
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                new ScoreBoard(rounds: rounds, count: roundCount, callback: (val) => onDataChange(val)),
              ]
            )
          ),
        ],
      ),
    );
  }
}