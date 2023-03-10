import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:f_set/services/provider.dart';
import 'package:f_set/services/sound.dart';
import 'package:f_set/presentation/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({ Key? key}) : super(key: key);

  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final soundService = locator<SoundService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: soundService.enableSound$,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          final bool? isSoundEnabled = snapshot.data;

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
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // Text(
                          //   "Settings".toUpperCase(),
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w700,
                          //     fontSize: 30,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Enable Sound",
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.w700,
                            fontSize: 20,
                              fontWeight: FontWeight.w700,

                          ),
                        ),
                        Expanded(child: Container()),
                        CupertinoSwitch(
                          onChanged: (e) {
                            soundService.enableSound$?.add(e);
                          },
                          value: isSoundEnabled!,
                          activeColor: MyTheme.orange,
                          trackColor: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}