import 'package:flutter/material.dart';
import 'package:snow_test/app/domain/models/question.dart';
import 'package:snow_test/app/presenter/styles/HexColor.dart';

class QuestionListWidget extends StatelessWidget {

  final List<Question> questions;
  QuestionListWidget({Key key, this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: questions.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                ),
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: HexColor.fromHex(questions[index].color), width: 3),
                      ),
                    ),
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      title: Text(questions[index].question, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: Text(
                            questions[index].answer,
                            style:TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ),
          );
        },
      );
  }
}