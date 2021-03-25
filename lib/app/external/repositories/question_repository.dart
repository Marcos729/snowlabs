import 'dart:convert';
import 'package:http/http.dart';
import 'package:snow_test/app/domain/models/question.dart';

abstract class QuestionRepository{
  Future<Question> createQuestion(Question question);
  Future<List<Question>> getQuestion(String filter);
  Future<List<Question>> getQuestions();
}

class QuestionRepositoryImpl implements QuestionRepository{
  final String apiUrl = "https://snowteste.herokuapp.com";

  Future<Question> createQuestion(Question question) async {
    Map data = {
      'question': question.question,
      'answer': question.answer,
      'color': question.color,
    };

    final Response response = await post("$apiUrl/add",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Question.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<List<Question>> getQuestion(String filter) async {
    final response = await get('$apiUrl/get?search=$filter');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Question> questions = body.map((dynamic item) => Question.fromJson(item)).toList();

      return questions;
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<List<Question>> getQuestions() async {
    Response res = await get('$apiUrl/get');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

      List<Question> questions = body.map((dynamic item) => Question.fromJson(item)).toList();
      return questions;
    } else {
      throw "Failed to load cases list";
    }
  }


}