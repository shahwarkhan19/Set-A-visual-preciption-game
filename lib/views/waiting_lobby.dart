import 'package:flutter/material.dart';
import 'package:f_set/provider/room_data_provider.dart';
import 'package:f_set/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../presentation/theme/theme.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
      Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.65],
    colors: [
    MyTheme.orange,
    MyTheme.red,
    ],
    ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for a player to join...'),
        const SizedBox(height: 20),
        CustomTextField(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
        ),
      ],
    )));
  }
}