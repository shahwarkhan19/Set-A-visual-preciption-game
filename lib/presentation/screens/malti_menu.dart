import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_set/services/sound.dart';
import 'package:f_set/services/alert.dart';
import 'package:f_set/services/provider.dart';
import 'package:f_set/components/btn.dart';
import 'package:f_set/presentation/theme/theme.dart';
import 'create_room_screen.dart';
import 'join_room_screen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container
        (width: MediaQuery.of(context).size.width,
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DancingScript'),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Btn(
                    onTap: () {

                      soundService.playSound('click');

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CreateRoomScreen(),
                        ),
                      );
                    },
                    height: 40,
                    width: 250,
                    borderRadius: 250,
                    color: Colors.white,
                    gradient: [],
                    child: Text(
                      "Create Room".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 30),
                  Btn(
                    onTap: () {

                      soundService.playSound('click');

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => JoinRoomScreen(),
                        ),
                      );
                    },
                    color: Colors.white,
                    height: 40,
                    width: 250,
                    borderRadius: 250,
                    gradient: [],
                    child: Text(
                      "Join Room".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}