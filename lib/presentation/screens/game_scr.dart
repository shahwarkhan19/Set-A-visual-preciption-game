import 'package:f_set/modules/game/set_board.dart';
import 'package:f_set/presentation/routing/app_auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:f_set/provider/room_data_provider.dart';
import 'package:f_set/resources/socket_methods.dart';
import 'package:f_set/views/scoreboard.dart';
import 'package:f_set/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

import '../../modules/game/game_screen.dart';

class GameScr extends StatefulWidget {
  static String routeName = '/game';
  const GameScr ({Key? key}) : super(key: key);

  @override
  State<GameScr> createState() => _GameScrState();
}

class _GameScrState extends State<GameScr> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
        child: GameScreen(
        ),
      ),
    );
  }
}