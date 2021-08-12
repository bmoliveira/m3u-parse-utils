# M3U format parser

Simple parser for [M3U](https://en.wikipedia.org/wiki/M3U) and 
[M3U_Plus](https://en.wikipedia.org/wiki/M3U) files. 

## How to use

Currently the parser only supports full file parsing.

```dart
import 'package:m3u/m3u.dart';

main() async {
  String playlistContent = <load_playlist>;
  final playlist = await M3uParser.parse(file);
  
  // Organized categories
  final categories =
      sortedCategories(entries: listOfTracks, attributeName: 'group-title');
  print(categories);
}
```

## Missing features

- [ ] Parse from a stream of data instead of a string
- [ ] Parse info from the header
- [ ] Parse start track info
- [ ] Parse non string information ex: `aspect-ratio=4:3`

