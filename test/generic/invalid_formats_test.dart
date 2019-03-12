import 'package:m3u/m3u.dart';
import "package:test/test.dart";

import '../utils/FileLoader.dart';

void main() {
  test('M3U invalid Header format', () {
    expect(
        () async => await parseFile(
            await FileUtils.loadFile(fileName: "generic/invalid_header")),
        throwsA(predicate((exception) =>
            exception is InvalidFormatException &&
            exception.formatType == InvalidFormatType.Header)));
  });
}
