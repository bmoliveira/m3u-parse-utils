import 'dart:convert';

import 'package:m3u/src/entries/generic_entry.dart';
import 'package:m3u/src/entry_information.dart';
import 'package:m3u/src/exception/invalid_format_exception.dart';
import 'package:m3u/src/file_type_header.dart';
import 'package:m3u/src/line_parsed_type.dart';

/// A parser of M3U documents.
///
/// At the moment the parsing if done thought the static method [parse].
///
/// The parsing is done line by line. There are some context aware variables
/// to know the state of the current entry [_currentInfoEntry]
/// and what type of line should come next [_nextLineExpected].
class M3uParser {
  /// Parse a document represented by the [source]
  ///
  /// [source] a string value of the full document.
  static Future<List<M3uGenericEntry>> parse(String source) async =>
      M3uParser()._parse(source);

  /// Internally used after the header is parsed.
  FileTypeHeader _fileType;

  /// Controller for the current state of the parser
  /// This flag indicates the next type of data that we expect.
  LineParsedType _nextLineExpected = LineParsedType.header;

  /// Current holder of the information about the current Track
  EntryInformation _currentInfoEntry;

  /// Result accumulator of the parser.
  final List<M3uGenericEntry> _playlist = <M3uGenericEntry>[];

  /// Main parse function
  ///
  /// Splits the file into lines and parse line by line.
  ///
  /// [source] source file to parse.
  ///
  /// Can [throws] [InvalidFormatException] if the file is not supported.
  Future<List<M3uGenericEntry>> _parse(String source) async {
    LineSplitter.split(source).forEach(_parseLine);
    return _playlist;
  }

  void _parseLine(String line) {
    switch (_nextLineExpected) {
      case LineParsedType.header:
        _fileType = FileTypeHeader.fromString(line);
        _nextLineExpected = LineParsedType.info;
        break;
      case LineParsedType.info:
        final parsedEntry = _parseInfoRow(line, _fileType);
        if (parsedEntry == null) {
          break;
        }
        _currentInfoEntry = parsedEntry;
        _nextLineExpected = LineParsedType.source;
        break;
      case LineParsedType.source:
        if (_currentInfoEntry == null) {
          _nextLineExpected = LineParsedType.info;
          _parseLine(line);
          break;
        }
        _playlist.add(M3uGenericEntry.fromEntryInformation(
            information: _currentInfoEntry, link: line));
        _currentInfoEntry = null;
        _nextLineExpected = LineParsedType.info;
        break;
    }
  }

  EntryInformation _parseInfoRow(String line, FileTypeHeader fileType) {
    switch (fileType) {
      case FileTypeHeader.m3u:
        return _regexParse(line);
      case FileTypeHeader.m3uPlus:
        return _regexParse(line);
      default:
        throw InvalidFormatException(InvalidFormatType.other,
            originalValue: line);
    }
  }

  /// This parses the metadata information of a line.
  /// This is a Regex parser caution is advised.
  EntryInformation _regexParse(String line) {
    final regexExpression = RegExp(r' (.*?)=\"(.*?)"|,(.*)');
    final matches = regexExpression.allMatches(line);
    final attributes = <String, String>{};
    var title = '';

    matches.forEach((match) {
      if (match[1] != null && match[2] != null) {
        attributes[match[1]] = match[2];
      } else if (match[3] != null) {
        title = match[3];
      } else {
        print('ERROR regexing against -> ${match[0]}');
      }
    });
    return EntryInformation(title: title, attributes: attributes);
  }
}
