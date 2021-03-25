import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:snow_test/app/presenter/constants/routes/app_route.dart';
import 'package:snow_test/app/presenter/events/question_event.dart';
import 'package:snow_test/app/presenter/pages/home/widgets/question_list_widget.dart';
import 'package:snow_test/app/presenter/pages/question_bloc.dart';
import 'package:snow_test/app/presenter/states/question_state.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = true;
  var searchCtrl = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<QuestionBloc>(context).add(LoadingSucessQuestionEvent());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10159A),
        title: Container(
          child: isSearch
              ? Text("Perguntas Frequentes")
              : TextField(
                  controller: searchCtrl,
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        BlocProvider.of<QuestionBloc>(context).add(GetAlQuestionEvent(searchCtrl.text));
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Row(
                        children: [
                          // Text('| ', style: TextStyle(color: Colors.white,),),
                          Icon(
                            Icons.clear,
                            color: Colors.white,

                          ),
                        ],
                      ),
                      onPressed: () {
                        searchCtrl.clear();
                        setState(() {
                          isSearch = true;
                        });
                        BlocProvider.of<QuestionBloc>(context).add(GetAlQuestionEvent(searchCtrl.text));
                      },
                    ),
                  ),
                ),
        ),
        centerTitle: true,
        actions: [
          isSearch
              ? Container(
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        isSearch = false;
                      });
                    },
                  ),
                )
              : Container()
        ],
      ),
      body: new Container(
        child: BlocListener<QuestionBloc, QuestionState>(
          listener: (context, state) {
          },
          child: _blocBuilder(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
        child: RaisedButton(
          color: Colors.yellow[700],
          onPressed: () {
            Modular.to.navigate(AppRoute.CADASTRAR);

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
      ),
    );
  }

  _blocBuilder() {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        if (state is InitialState) {
          return Center(
            child: Text("Initial"),
          );
        } else if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedSucessState) {
          return new Center(
              child: new QuestionListWidget(questions: state.questions));
        } else if (state is ErrorState) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        );
      },
    );
  }

// Future loadList() {
//   Future<List<Question>> futureCases = ApiService().getQuestions();
//   futureCases.then((casesList) {
//     setState(() {
//       this.casesList = casesList;
//     });
//   });
//   return futureCases;
// }
}
