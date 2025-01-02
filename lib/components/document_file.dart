import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentFile extends StatefulWidget {
  final String? Function(String?)? validator;

  const DocumentFile({super.key, this.validator});

  @override
  State<DocumentFile> createState() => _DocumentFileState();
}

class _DocumentFileState extends State<DocumentFile> {
  FilePickerResult? result;
  String? fileName;

  void pickFile(FormFieldState<String>? state) async {
    try {
      result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          fileName = result!.files.single.name;
        });
        // Update the FormField's state
        state?.didChange(fileName);
      } else {
        setState(() {
          fileName = null;
        });
        // Reset the FormField's state if no file is selected
        state?.didChange(null);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(0, 0, 0, 0.06),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (fileName == null)
                    Column(
                      children: [
                        IconButton(
                          color: Colors.grey,
                          iconSize: 40,
                          onPressed: () => pickFile(state),
                          icon: const Icon(Icons.upload_file),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "30".tr,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                  if (fileName != null) Text(fileName!),
                ],
              ),
            ),
            if (state.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
          ],
        );
      },
    );
  }
}
