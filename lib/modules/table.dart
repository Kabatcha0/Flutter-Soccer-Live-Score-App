import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/cubit/cubit.dart';
import 'package:scoreboard/cubit/states.dart';
import 'package:scoreboard/model/matches.dart';

class TableOfMatches extends StatelessWidget {
  late ResponseOfMatches model;
  TableOfMatches({required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoccerCubit, SoccerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      model.teams.home.name,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      model.teams.home.logo,
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  model.goals.away != null
                      ? "${model.goals.home} - ${model.goals.away}"
                      : "-",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.network(
                      model.teams.away.logo,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(text: model.teams.away.name),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
