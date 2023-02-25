import 'package:flutter/material.dart';
import 'package:f_set/provider/room_data_provider.dart';
import 'package:f_set/utils.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';



class GameMethods {
  void checkWinner(BuildContext context, Socket socketClent) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    String winner = '';


        showGameDialog(context, '${roomDataProvider.player1.nickname} won!');
        socketClent.emit('winner', {
          'winnerSocketId': roomDataProvider.player1.socketID,
          'roomId': roomDataProvider.roomData['_id'],
        });
  }}