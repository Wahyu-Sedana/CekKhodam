import 'package:cek_khodam/cores/utils/colors.dart';
import 'package:cek_khodam/cores/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KhdoamResultWidget extends StatefulWidget {
  final String hasil;
  final String nama;
  final String quotes;
  const KhdoamResultWidget(
      {super.key, required this.nama, required this.hasil, required this.quotes});

  @override
  State<KhdoamResultWidget> createState() => _KhdoamResultWidgetState();
}

class _KhdoamResultWidgetState extends State<KhdoamResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.cm,
        ),
        const Text(
          'Hasil Cek Khodam',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Khodam yang berada di dalam tubuh ${widget.nama} adalah ${widget.hasil}',
          style: const TextStyle(color: Colors.white, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 1.cm,
        ),
        const Text(
          textAlign: TextAlign.center,
          'Quotes untuk hari ini:',
          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          '${widget.quotes} ',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 1.cm,
        ),
        const Icon(
          Icons.share,
          color: darkButtonColor,
        ),
        SizedBox(
          height: 1.cm,
        ),
        CustomButton(
            text: 'Generate Ulang',
            onPressed: () {
              Navigator.pop(context);
            }),
        SizedBox(
          height: 1.cm,
        ),
      ],
    );
  }
}
