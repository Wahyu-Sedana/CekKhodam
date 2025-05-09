import 'package:cek_khodam/cores/utils/colors.dart';
import 'package:cek_khodam/cores/widgets/custom_button.dart';
import 'package:cek_khodam/features/main/presentation/providers/main_provider.dart';
import 'package:cek_khodam/features/main/presentation/widgets/khodam_result.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class KhodamFormWidget extends StatefulWidget {
  const KhodamFormWidget({super.key});

  @override
  State<KhodamFormWidget> createState() => _KhodamFormWidgetState();
}

class _KhodamFormWidgetState extends State<KhodamFormWidget> {
  bool _isLoading = false;

  // Fungsi untuk cek Khodam dengan validasi dan loading
  void cekKhodam(MainProvider provider) async {
    if (!provider.formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await provider.getRandomKhodam();

    setState(() {
      _isLoading = false;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: darkButtonColor),
          ),
          backgroundColor: Colors.black.withOpacity(1),
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: KhdoamResultWidget(
                nama: provider.inputNamaController.text,
                hasil: provider.result,
                quotes: provider.queotes,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, _) {
        return Form(
          key: provider.formKey,
          child: Column(
            children: [
              SizedBox(height: 1.cm),
              const SizedBox(
                width: 200,
                child: Text(
                  'Cek Khodam Ges!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 1.cm),
              TextFormField(
                controller: provider.inputNamaController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.white),
                  labelText: 'Masukkan Nama Anda',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: darkButtonColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: darkButtonColor, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: darkButtonColor, width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 1.cm),
              CustomButton(
                text: _isLoading ? 'Loading...' : 'Cek',
                onPressed: _isLoading ? null : () => cekKhodam(provider),
              ),
              SizedBox(height: 1.cm),
            ],
          ),
        );
      },
    );
  }
}
