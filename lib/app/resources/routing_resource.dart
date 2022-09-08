import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_task/view/players/cubit/players_cubit.dart';
import 'package:q8_task/view/players/players_view.dart';

class RoutesManager {
  static const String playersRoute = '/';
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case playersRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => PlayersCubit(),
              child: const PlayersView(),
            );
          },
        );
    }
    return null;
  }
}
