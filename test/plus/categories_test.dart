import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('M3U_Plus multi line file', () async {
    final playlist =
        await parseFile(await FileUtils.loadFile(fileName: 'plus/multi_line'));

    final categories =
        sortedCategories(entries: playlist, attributeName: 'group-title');

    expect(categories.keys.length, 3);
  });
}
