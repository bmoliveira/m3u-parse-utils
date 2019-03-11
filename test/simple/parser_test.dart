import 'package:m3u/Parser.dart';
import "package:test/test.dart";

import '../utils/FileLoader.dart';

void main() {
  test('M3U single line - parsing title', () async {
    final playlist = await parseFile(
        await FileUtils.loadFile(fileName: "simple/single_line"));
    final testSubject = playlist[0];
    expect(testSubject.title, "A TV channel");
    expect(testSubject.link, "https://vimeo.com/63031638");

    // Missing
    //#EXTINF:-1
  });

  test('M3U multi line file', () async {
    final playlist = await parseFile(
        await FileUtils.loadFile(fileName: "simple/multi_line"));

    expect(playlist.length, 5);
  });
}
