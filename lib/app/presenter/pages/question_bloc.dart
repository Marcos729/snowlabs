import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snow_test/app/domain/models/question.dart';
import 'package:snow_test/app/external/repositories/question_repository.dart';
import 'package:snow_test/app/presenter/events/question_event.dart';
import 'package:snow_test/app/presenter/states/question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepository repository;

  QuestionBloc(this.repository) : super(null);

  QuestionState get initialState => LoadingState();

  @override
  Stream<QuestionState> mapEventToState(
      QuestionEvent event,
      ) async* {
    // Emitting a state from the asynchronous generator
    // Branching the executed logic by checking the event type
    LoadingState();
    if (event is LoadingSucessQuestionEvent) {
      yield* _mapQuestionLoadedNoFilterToState();
    } else if (event is CreateQuestionEvent) {
      yield* _mapQuestionAddedToState(event);
    }else if (event is GetAlQuestionEvent) {
      yield* _mapQuestionLoadedToState(event);
    }
  }

  Stream<QuestionState> _mapQuestionLoadedNoFilterToState() async* {
    try {
      var questions = (await this.repository.getQuestions());
      yield LoadedSucessState(questions);
    } catch (_) {
      yield ErrorState("error loading questons");
    }
  }

  Stream<QuestionState> _mapQuestionLoadedToState(GetAlQuestionEvent event) async* {
    try {
      var questions = (await this.repository.getQuestion(event.filter));
      yield LoadedSucessState(questions);
    } catch (_) {
      yield ErrorState("error loading questons");
    }
  }

  Stream<QuestionState> _mapQuestionAddedToState(CreateQuestionEvent event) async* {
    try {
      if (state is LoadedSucessState) {
        var newAlbum = (await this.repository.createQuestion(event.question));
        List<Question> updatedQuestions;
        if (newAlbum != null) {
          updatedQuestions = List.from((state as LoadedSucessState).questions)..add(newAlbum);

          yield LoadedSucessState(updatedQuestions.reversed.toList());
        }
      }
    } catch (_) {
      yield ErrorState("error Add Question");
    }
  }



}