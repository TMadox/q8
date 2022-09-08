import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_task/app/resources/colors_resource.dart';
import 'package:q8_task/data/models/player.dart';
import 'package:q8_task/service/responses/players_response.dart';
import 'package:q8_task/view/players/cubit/players_cubit.dart';

class PlayersList extends StatefulWidget {
  final List<Player> selectedPlayers;
  final String searchWord;
  final Function(Player) onTap;
  const PlayersList({
    Key? key,
    required this.selectedPlayers,
    required this.searchWord,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  late PlayerResponse playerResponse;
  @override
  Future<void> didChangeDependencies() async {
    await BlocProvider.of<PlayersCubit>(context).refreshPlayers();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersCubit, PlayersState>(
      builder: (context, state) {
        if (state is PlayersLoaded) {
          playerResponse = (state).playerResponse;
          final List<Player> filteredList =
              BlocProvider.of<PlayersCubit>(context).searchList(
            inputList: playerResponse.users,
            search: widget.searchWord,
          );
          return EasyRefresh(
            onRefresh: () async {
              await BlocProvider.of<PlayersCubit>(context).refreshPlayers();
            },
            onLoad: playerResponse.limit == playerResponse.total
                ? null
                : () async {
                    await BlocProvider.of<PlayersCubit>(context)
                        .fetchMorePlayers();
                  },
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                final Player player = filteredList[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    player.firstName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: lightPurple,
                    radius: 25,
                    backgroundImage: NetworkImage(
                      player.image,
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed:
                        (widget.selectedPlayers.contains(player) == false &&
                                widget.selectedPlayers.length == 10)
                            ? null
                            : () => widget.onTap(player),
                    style: ElevatedButton.styleFrom(
                      primary: widget.selectedPlayers
                              .where((element) => element.id == player.id)
                              .isNotEmpty
                          ? Colors.red
                          : lightPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.selectedPlayers
                              .where((element) => element.id == player.id)
                              .isNotEmpty
                          ? "Remove"
                          : "Add",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is PlayersError) {
          return EasyRefresh(
            onRefresh: () async {
              await BlocProvider.of<PlayersCubit>(context).refreshPlayers();
            },
            child: ListView(
              children: const [
                Icon(
                  Icons.error,
                  color: lightPurple,
                  size: 100,
                ),
                Text(
                  "Error",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: lightPurple,
            ),
          );
        }
      },
    );
  }
}
