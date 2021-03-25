import 'package:equatable/equatable.dart';

class Question extends Equatable{
  final String id;
  final String question;
  final String answer;
  final String color;

  Question({ this.id, this.question, this.answer, this.color});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      color: json['color'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $question, age: $answer}';
  }

  @override
  List<Object> get props => [
    id,
    question,
    answer,
    color,
  ];
}