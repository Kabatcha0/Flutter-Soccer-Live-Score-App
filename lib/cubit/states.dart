abstract class SoccerStates {}

class SoccerInitialSoccer extends SoccerStates {}

class SoccerSuccess extends SoccerStates {}

class SoccerError extends SoccerStates {
  String? error;
  SoccerError({required this.error});
}
