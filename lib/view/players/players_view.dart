import 'package:flutter/material.dart';
import 'package:q8_task/data/models/player.dart';
import 'package:q8_task/service/responses/players_response.dart';
import 'package:q8_task/view/players/components/players_list.dart';
import 'package:q8_task/view/players/components/search_bar.dart';
import 'package:q8_task/view/players/components/selected_slider.dart';

class PlayersView extends StatefulWidget {
  const PlayersView({Key? key}) : super(key: key);

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  late PlayerResponse playerResponse;
  List<Player> selectedPlayers = [];
  String searchWord = "";
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add players",
          ),
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                  child: SelectedSlider(
                    onDelete: (player) {
                      setState(() {
                        selectedPlayers.remove(player);
                      });
                    },
                    selectedPlayers: selectedPlayers,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: SearchBar(
                    onChanged: (value) {
                      setState(() {
                        searchWord = value ?? "";
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PlayersList(
                    selectedPlayers: selectedPlayers,
                    searchWord: searchWord,
                    onTap: (player) {
                      setState(() {
                        if (selectedPlayers.length <= 10) {
                          selectedPlayers
                                  .where((element) => element.id == player.id)
                                  .isNotEmpty
                              ? selectedPlayers.removeWhere(
                                  (element) => element.id == player.id)
                              : selectedPlayers.add(player);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
