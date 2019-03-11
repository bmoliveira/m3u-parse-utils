library m3u;

import 'package:m3u/parser.dart';
import 'package:m3u/src/M3UParser.dart';

export 'package:m3u/src/entries/GenericEntry.dart';
export 'package:m3u/src/exception/InvalidFormatException.dart';

/// Parse a document represented by the [source]
///
/// [source] a string value of the full document.
Future<List<M3uGenericEntry>> parseFile(String source) async {
  return M3uParser.parse(source);
}
