import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seven_otl/screens/playerList.dart';

class NewPlayerPage extends StatefulWidget {
  NewPlayerPage({Key key}) : super(key: key);

  @override
  _NewPlayerPageState createState() => _NewPlayerPageState();
}

class _NewPlayerPageState extends State<NewPlayerPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController numberInputController;
  String lineValue;
  String positionValue;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    numberInputController = new TextEditingController();
    lineValue = "Offense";
    positionValue = "Handler";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          left: 30.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.grey),
          ),
        ),
        Align(
            child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage('assets/profile.png'),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 3.0, color: Colors.grey)
                            ])),
                    SizedBox(height: 60.0),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Number', hintText: "00"),
                        keyboardType: TextInputType.number,
                        controller: numberInputController,
                        validator: (value) {
                          if (value.length > 3) {
                            return "Please enter no more than two digits.";
                          }
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'First Name', hintText: "Angus"),
                      controller: firstNameInputController,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Last Name', hintText: "Boswell"),
                      controller: lastNameInputController,
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      value: lineValue,
                      hint: Text("Line"),
                      onChanged: (String newValue) {
                        setState(() {
                          lineValue = newValue;
                        });
                      },
                      items: ["Offense", "Defense"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSaved: (val) => setState(() => lineValue = val),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      value: positionValue,
                      hint: Text("Position"),
                      onChanged: (String newValue) {
                        setState(() {
                          positionValue = newValue;
                        });
                      },
                      items: ["Handler", "Cutter", "Hybrid"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSaved: (val) => setState(() => positionValue = val),
                    ),
                  ],
                ))),
        Align(
            alignment: Alignment.bottomCenter,
            child: new SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                    child: Text("CREATE", style: TextStyle(fontSize: 25)),
                    color: Colors.grey,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        Firestore.instance
                            .runTransaction((transaction) async {
                              await Firestore.instance
                                  .collection('players')
                                  .add({
                                "injured": "false",
                                "line": lineValue,
                                "position": positionValue,
                                "number": numberInputController,
                                "firstName": firstNameInputController,
                                "lastName": lastNameInputController,
                              });
                            })
                            .then((result) => {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlayerList()),
                                      (_) => false),
                                  firstNameInputController.clear(),
                                  lastNameInputController.clear(),
                                  numberInputController.clear(),
                                })
                            .catchError((err) => print(err));
                      }
                    })))
      ],
    ));
  }
}

enum Options { edit, delete }
