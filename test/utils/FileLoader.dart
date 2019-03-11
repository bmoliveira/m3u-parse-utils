import 'dart:io';

class FileUtils {
  static Future<String> loadFile({String fileName, String extension = ".m3u"}) {
    final file = new File('test_resources/$fileName$extension');
    return file.readAsString();
  }
}
