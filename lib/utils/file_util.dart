import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils {
  static Future<String> getPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path;
  }

  static Future<File> get getFile async {
    final String path = await getPath();

    return File("$path/myfile.txt");
  }

  static Future<File> saveToFile(String data) async {
    final File file = await getFile;
    return file.writeAsString(data);
  }

  static Future<String> readFromFile() async {
    try {
      final File file = await getFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return "";
    }
  }
}
