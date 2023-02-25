import 'package:flutter/material.dart';
import 'package:f_set/resources/socket_methods.dart';
import 'package:f_set/responsive.dart';
import 'package:f_set/widgets/custom_buttom.dart';
import 'package:f_set/widgets/custom_text.dart';
import 'package:f_set/widgets/custom_textfield.dart';
import 'package:f_set/presentation/theme/theme.dart';

import '../../components/btn.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen ({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              shadows: [
                Shadow(
                ),
              ],
              text: 'Join Room',
              fontSize: 70,
            ),
            SizedBox(height: size.height * 0.08),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your nickname',
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: _gameIdController,
              hintText: 'Enter Game ID',
            ),
            SizedBox(height: size.height * 0.045),
            CustomButton(
              onTap: ()  => _socketMethods.joinRoom(
                  _nameController.text,
                  _gameIdController.text,),
           text:'join'),

            ]
        ),
      ),
    );
  }
}