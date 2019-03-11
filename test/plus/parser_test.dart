import 'package:m3u/Parser.dart';
import "package:test/test.dart";

import '../utils/FileLoader.dart';

void main() {
  test('M3U_Plus single line - parsing all attribues', () async {
    final playlist =
        await parseFile(await FileUtils.loadFile(fileName: "plus/single_line"));
    final testSubject = playlist[0];

    expect(testSubject.attributes["tvg-id"], "identifier");
    expect(testSubject.attributes["tvg-name"], "a random name");
    expect(testSubject.attributes["tvg-logo"],
        "https://cdn.instructables.com/FGO/LD7W/HF23T3BP/FGOLD7WHF23T3BP.LARGE.jpg");
    expect(testSubject.attributes["group-title"], "The Only one");
    expect(testSubject.title, "A TV channel");
    expect(testSubject.link, "https://vimeo.com/63031638");

    // Missing
    //#EXTINF:-1
  });

  test('M3U_Plus multi line file', () async {
    final playlist =
        await parseFile(await FileUtils.loadFile(fileName: "plus/multi_line"));

    expect(playlist.length, 5);
  });
}
