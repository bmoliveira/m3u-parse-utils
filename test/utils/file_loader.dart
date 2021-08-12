import 'dart:io';

class FileUtils {
  static Future<String> loadFile(
          {String? fileName, String extension = '.m3u'}) =>
      File('test_resources/$fileName$extension').readAsString();
}
