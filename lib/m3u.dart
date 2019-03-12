library m3u;

import 'package:m3u/m3u.dart';
import 'package:m3u/src/m3u_parser.dart';

export 'package:m3u/src/entries/generic_entry.dart';
export 'package:m3u/src/exception/invalid_format_exception.dart';
export 'package:m3u/src/m3u_parser.dart';

/// Parse a document represented by the [source]
///
/// [source] a string value of the full document.
Future<List<M3uGenericEntry>> parseFile(String source) async =>
    M3uParser.parse(source);
