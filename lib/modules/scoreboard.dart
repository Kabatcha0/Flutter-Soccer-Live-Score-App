import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/cubit/cubit.dart';
import 'package:scoreboard/cubit/states.dart';
import 'package:scoreboard/modules/table.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SoccerCubit()..getData(),
      child: BlocConsumer<SoccerCubit, SoccerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SoccerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 54, 54, 54),
              elevation: 0.0,
              centerTitle: true,
              title: Text(cubit.allMatches.isNotEmpty
                  ? "${cubit.allMatches[0].league.name} - ${cubit.allMatches[0].league.country}"
                  : ""),
            ),
            body: ConditionalBuilder(
              condition: cubit.allMatches.isNotEmpty,
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
              builder: (context) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text("Local Team"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  cubit.allMatches[0].teams.home.logo,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(cubit.allMatches[0].teams.home.name),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  cubit.allMatches[0].fixture.status.short!,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${cubit.allMatches[0].goals.home} - ${cubit.allMatches[0].goals.away}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${cubit.allMatches[0].teams.home.winner == true ? "winner" : "loser"} - ${cubit.allMatches[0].teams.away.winner == true ? "winner" : "loser"}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text("Visitor Team"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  cubit.allMatches[0].teams.away.logo,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(cubit.allMatches[0].teams.away.name),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "${cubit.allMatches[0].fixture.venue.city} - ${cubit.allMatches[0].fixture.venue.staduim}",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Matches",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TableOfMatches(
                                    model: cubit.allMatches[index]),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: cubit.allMatches.length),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
