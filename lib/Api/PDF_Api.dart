import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Pdfapi {

  static Future <File> loadAsset (String path) async {
      final data = await rootBundle.load(path);
      final bytes = data.buffer.asUint8List();

      return _storeFile(path, bytes);
  }
  
  static Future<File> _storeFile (String url, List <int> bytes) async {
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$fileName");
    await file.writeAsBytes( bytes, flush:true);
    return file;
    
  }

}