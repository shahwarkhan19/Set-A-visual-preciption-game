import 'package:flutter/material.dart';
import 'package:f_set/resources/socket_methods.dart';
import 'package:f_set/widgets/custom_buttom.dart';
import 'package:f_set/widgets/custom_text.dart';
import 'package:f_set/widgets/custom_textfield.dart';
import 'package:f_set/presentation/theme/theme.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}


class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
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
              text: 'Create Room',
              fontSize: 70,

            ),
            SizedBox(height: size.height * 0.08),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your nickname',
            ),
            SizedBox(height: size.height * 0.045),
            CustomButton(
                onTap: () => _socketMethods.createRoom(
                  _nameController.text,
                ),
                text: 'Create'),
          ],
        ),
      ),
    );
  }
}