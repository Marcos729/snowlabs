import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:snow_test/app/domain/models/question.dart';

@immutable
abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

//eventos que serão enviados para a entrada do bloc

class LoadingSucessQuestionEvent extends QuestionEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class GetAlQuestionEvent extends QuestionEvent {
  final String filter;
  const GetAlQuestionEvent(this.filter);
  @override
  List<Object> get props => [filter];
}

class CreateQuestionEvent extends QuestionEvent {
  final Question question;
  const CreateQuestionEvent(this.question);

  @override
  List<Object> get props => [question];
}


class NetworkErrorEvent extends Error {}