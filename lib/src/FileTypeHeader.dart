import 'package:m3u/parser.dart';

/// Enum like class to represent the available parse types of the library.
class FileTypeHeader {
  final _value;

  const FileTypeHeader._internal(this._value);

  toString() => _value;

  /// [m3u] is the simple playlist format type.
  /// Each line only contains the description information
  static const m3u = const FileTypeHeader._internal('#M3U');

  /// [m3uPlus] supports extra metadata associated with each line
  /// Each line only contains the description information and some key-value metadata.
  static const m3uPlus = const FileTypeHeader._internal('#EXTM3U');

  factory FileTypeHeader.fromString(String value) {
    if (value.startsWith(FileTypeHeader.m3uPlus.toString()))
      return FileTypeHeader.m3uPlus;
    else if (value.startsWith(FileTypeHeader.m3u.toString()))
      return FileTypeHeader.m3u;
    else
      throw (InvalidFormatException(InvalidFormatType.Header,
          originalValue: value));
  }
}
