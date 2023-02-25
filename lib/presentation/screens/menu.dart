import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_set/components/btn.dart';
import 'package:f_set/presentation/screens/settings.dart';

import 'package:f_set/services/alert.dart';
import 'package:f_set/services/provider.dart';
import 'package:f_set/services/sound.dart';
import 'package:f_set/presentation/theme/theme.dart';

import '../../modules/game/game_screen.dart';
import '../../modules/instructions/instructions_screen.dart';
import 'malti_menu.dart';

class StartPage extends StatelessWidget {
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();
  static String routeName = '/menu';
  StartPage({Key? key}) : super(key: key);
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
    context: context,
    builder: (context)=> AlertDialog(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text('Do you want to exit?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          fontFamily: 'DancingScript'), ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
            onPressed: () => Navigator.pop(context, false), child: Text('No'.toUpperCase(),
    style: TextStyle(
        color: Colors.black.withOpacity(.8),
        fontWeight: FontWeight.w700),
  ),),
        ElevatedButton(   style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),onPressed: () => Navigator.pop(context, true), child: Text('Yes'.toUpperCase(),
          style: TextStyle(
              color: Colors.black.withOpacity(.8),
              fontWeight: FontWeight.w700),
        ),),
      ],

    )
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: SafeArea(
        child: Scaffold(
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
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SET",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DancingScript'),
                      ),
                      Text(
                        "A Visual Perception "
                            "Game",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DancingScript'),
                      ),

                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Btn(
                        onTap: () {

                          soundService.playSound('click');

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GameScreen(),
                            ),
                          );
                        },
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        color: Colors.white,
                        gradient: [],
                        child: Text(
                          "single player".toUpperCase(),
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
                              builder: (context) => WelcomeScreen(),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        gradient: [],
                        child: Text(
                          "with a friend".toUpperCase(),
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
                              builder: (context) => InstructionsScreen(),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        gradient: [],
                        child: Text(
                          "How to Play".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 60),
                      Btn(
                        onTap: () {
                          soundService.playSound('click');
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => SettingsPage(),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 25,
                        gradient: [],
                        child: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}