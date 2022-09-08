import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_task/app/resources/colors_resource.dart';
import 'package:q8_task/data/models/player.dart';
import 'package:q8_task/view/players/cubit/players_cubit.dart';

class SelectedSlider extends StatelessWidget {
  final List<Player> selectedPlayers;
  final Function(Player) onDelete;
  const SelectedSlider({
    Key? key,
    required this.selectedPlayers,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (BlocProvider.of<PlayersCubit>(context).checkSelectedItems(
          index: index,
          inputList: selectedPlayers,
        )) {
          final Player player = selectedPlayers[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: lightPurple,
                      radius: 23,
                      backgroundImage: NetworkImage(
                        player.image,
                      ),
                    ),
                    InkWell(
                      onTap: () => onDelete(player),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  player.firstName,
                ),
              ],
            ),
          );
        } else {
          return Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 23,
                child: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
