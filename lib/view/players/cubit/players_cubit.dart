import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:q8_task/app/util/locator.dart';
import 'package:q8_task/data/models/player.dart';
import 'package:q8_task/service/dio_service.dart';
import 'package:q8_task/service/responses/players_response.dart';
part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());
  int limit = 10;
  late PlayerResponse response;

  Future<void> fetchMorePlayers() async {
    try {
      limit += 10;
      response = PlayerResponse.fromJson(
          await locator.get<DioService>().get("/users?limit=$limit"));
      emit(
        PlayersLoaded(response),
      );
    } catch (e) {
      log(e.toString());
      emit(PlayersError(e.toString()));
    }
  }

  Future<void> refreshPlayers() async {
    try {
      response = PlayerResponse.fromJson(
          await locator.get<DioService>().get("/users?limit=10"));
      emit(
        PlayersLoaded(response),
      );
    } catch (e) {
      emit(PlayersError(e.toString()));
    }
  }

  bool checkSelectedItems({
    required int index,
    required List<Player> inputList,
  }) {
    try {
      inputList[index];
      return true;
    } catch (e) {
      return false;
    }
  }
  

  List<Player> searchList({
    String? search,
    required List<Player> inputList,
  }) {
    if (search != null && search != "") {
      return inputList
          .where((element) =>
              ("${element.lastName} ${element.firstName} ${element.maidenName}")
                  .toLowerCase()
                  .contains(search.toLowerCase()))
          .toList();
    } else {
      return inputList;
    }
  }
}
