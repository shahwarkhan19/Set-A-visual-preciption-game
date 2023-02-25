import 'package:f_set/presentation/screens/join_room_screen.dart';
import 'package:f_set/presentation/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/room_data_provider.dart';
import 'create_room_screen.dart';
import 'game_scr.dart';
class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Set A Visual Perception game',
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        routes:{
          StartPage.routeName: (context) => StartPage(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScr.routeName: (context) => const GameScr(),
        },
        initialRoute: StartPage.routeName,
      ),


    );
  }}