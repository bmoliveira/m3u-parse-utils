import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('M3U invalid Header format', () {
    expect(
        () async => parseFile(
            await FileUtils.loadFile(fileName: 'generic/invalid_header')),
        throwsA(predicate((exception) =>
            exception is InvalidFormatException &&
            exception.formatType == InvalidFormatType.header)));
  });
}
