import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/cubit/states.dart';
import 'package:scoreboard/model/matches.dart';
import 'package:scoreboard/shared/network/dio.dart';

class SoccerCubit extends Cubit<SoccerStates> {
  SoccerCubit() : super(SoccerInitialSoccer());
  static SoccerCubit get(context) => BlocProvider.of(context);
  AllMatches? matches;
  List<ResponseOfMatches> allMatches = [];
  void getData() {
    allMatches = [];
    DioHelper.get(path: "fixtures", query: {"season": "2022", "league": "39"})
        .then((value) {
      matches = AllMatches.fromJson(value.data);
      matches!.response.forEach((element) {
        allMatches.add(element);
      });
      print(allMatches[0].teams.home.name);
      print(allMatches[0].teams.away.name);

      emit(SoccerSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(SoccerError(error: onError.toString()));
    });
  }
}
