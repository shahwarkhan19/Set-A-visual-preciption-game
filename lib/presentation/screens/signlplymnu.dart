import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_set/components/btn.dart';
import 'package:f_set/services/alert.dart';
import 'package:f_set/services/provider.dart';
import 'package:f_set/services/sound.dart';
import 'package:f_set/presentation/theme/theme.dart';
import 'package:f_set/modules/instructions/instructions_screen.dart';
import 'package:f_set/modules/high_scores/high_scores_screen.dart';
import '../../modules/game/game_screen.dart';



class signlplyPage extends StatelessWidget {
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();
bool shouldpop = true;
  signlplyPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return shouldpop = true;
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
                        "Single Player",
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
                          "Free Play".toUpperCase(),
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
                      SizedBox(height: 30),
                      Btn(
                        onTap: () {

                          soundService.playSound('click');

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HighScoresScreen(),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        gradient: [],
                        child: Text(
                          "High Score".toUpperCase(),
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
        ),
      ),
    );
  }
}