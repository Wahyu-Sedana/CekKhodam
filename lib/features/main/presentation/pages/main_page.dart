import 'package:cek_khodam/cores/utils/colors.dart';
import 'package:cek_khodam/cores/utils/dimens.dart';
import 'package:cek_khodam/cores/utils/strings.dart';
import 'package:cek_khodam/cores/widgets/custom_button.dart';
import 'package:cek_khodam/features/main/presentation/widgets/khodam_form.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(1),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(mainBack), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [
                Image(image: AssetImage(text)),
                Text(
                  'Aplikasi ini dibuat hanya untuk tujuan hiburan.\n tidak bertujuan untuk menyesatkan penggunanya.\n Ini hanya sistem random yang di buat dengan kegabutan saja',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                    text: 'Mulai',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    side: BorderSide(color: darkButtonColor)),
                                backgroundColor: Colors.black.withOpacity(1),
                                contentPadding: EdgeInsets.zero,
                                content: SingleChildScrollView(
                                  child: Stack(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: KhodamFormWidget(),
                                      ),
                                      Positioned(
                                        right: 0.0,
                                        child: IconButton(
                                          color: Colors.white,
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    }),
                const SizedBox(
                  height: sizeMedium,
                ),
                CustomButton(text: 'Kasih Rating', onPressed: () {}),
              ],
            ),
            const Text(
              'By WSStudioCode',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
