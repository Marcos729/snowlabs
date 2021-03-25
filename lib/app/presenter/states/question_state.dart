import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:snow_test/app/domain/models/question.dart';


@immutable
abstract class QuestionState extends Equatable {
  const QuestionState();
}

//eventos que sairão do bloc

class EmptyState extends QuestionState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitialState extends QuestionState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends QuestionState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedSucessState extends QuestionState {
  final List<Question> questions;
  const LoadedSucessState(this.questions);
  @override
  List<Object> get props => [questions];
}

class ErrorState extends QuestionState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> get props => [message];
}