import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('It supports unknow categories', () async {
    final playlist = await parseFile(
        await FileUtils.loadFile(fileName: 'plus/multi_line_categories'));

    final categories =
        sortedCategories(entries: playlist, attributeName: 'group-title');

    expect(categories.keys.length, 4);
  });

  test('all unknow categories', () async {
    final playlist = await parseFile(await FileUtils.loadFile(
        fileName: 'plus/multi_line_all_unknown_categories'));

    final categories =
        sortedCategories(entries: playlist, attributeName: 'group-title');

    expect(categories.keys.length, 1);
  });

  test('It supports no unknow categories', () async {
    final playlist = await parseFile(await FileUtils.loadFile(
        fileName: 'plus/multi_line_no_unknown_categories'));

    final categories =
        sortedCategories(entries: playlist, attributeName: 'group-title');

    expect(categories.keys.length, 3);
  });
}
