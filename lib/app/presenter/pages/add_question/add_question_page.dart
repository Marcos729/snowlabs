import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:snow_test/app/domain/models/question.dart';
import 'package:snow_test/app/presenter/constants/routes/app_route.dart';
import 'package:snow_test/app/presenter/events/question_event.dart';
import 'package:snow_test/app/presenter/pages/question_bloc.dart';
import 'package:snow_test/app/presenter/styles/HexColor.dart';


class AddQuestionPage extends StatefulWidget {
  @override
  _AddQuestionPageState createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final _addFormKey = GlobalKey<FormState>();

  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  List<Color> colorsList = List<Color>();
  int colorSelect = 0;
  
  @override
  void initState() {
    colorsList.add(Color(0xff46C9A7));
    colorsList.add(Color(0xffFF7074));
    colorsList.add(Color(0xffFFBE00));
    colorsList.add(Color(0xff10159A));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Pergunta'),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Modular.to.navigate(AppRoute.HOME)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
        child: Container(
          child: Card(
            elevation: 2.0,
            child: SingleChildScrollView(
              child: Form(
                key: _addFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: new EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                            ),
                            child: TextFormField(
                              controller: _questionController,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                labelText: "Pergunta",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe uma pergunta';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: new EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                            ),
                            child: new TextFormField(
                              controller: _answerController,
                              keyboardType: TextInputType.text,
                              maxLines: 5,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                                ),
                                labelText: "Resposta",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Informe uma reposta';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left:75.0, right: 75.0, top: 10.0),
                          child: Column(
                            children: [
                              Text("Cor"),
                              SizedBox(
                                height: 10.0,
                              ),
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: colorsList.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: new BoxDecoration(
                                              color: colorsList.elementAt(index),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.done,
                                              color: index == colorSelect ? Colors.white : colorsList.elementAt(index),
                                              size: 28,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              colorSelect = index;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                              ),
                            ],
                          ),
                        ),

                        RaisedButton(
                          color: Colors.yellow[700],
                          onPressed: (){
                            if (_addFormKey.currentState.validate()) {
                              _addFormKey.currentState.save();

                              BlocProvider.of<QuestionBloc>(context)
                                  .add(CreateQuestionEvent(Question(question: _questionController.text, answer: _answerController.text, color: colorsList[colorSelect].toHex())));

                              Modular.to.navigate(AppRoute.HOME) ;
                            }
                          },
                          textColor: Colors.white,
                          child: Container(
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Center(
                                  child: new Text(
                                    "Adicionar",
                                    style: new TextStyle(
                                      color: Color(0xff10159A),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
