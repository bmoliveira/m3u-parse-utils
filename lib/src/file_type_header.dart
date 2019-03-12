import 'package:m3u/m3u.dart';

/// Enum like class to represent the available parse types of the library.
class FileTypeHeader {
  /// Init the enum with a string value
  /// If a value is not supported throw exception.
  factory FileTypeHeader.fromString(String value) {
    if (value.startsWith(FileTypeHeader.m3uPlus.toString())) {
      return FileTypeHeader.m3uPlus;
    } else if (value.startsWith(FileTypeHeader.m3u.toString())) {
      return FileTypeHeader.m3u;
    } else {
      throw InvalidFormatException(InvalidFormatType.header,
          originalValue: value);
    }
  }

  const FileTypeHeader._internal(this._value);

  final String _value;

  @override
  String toString() => _value;

  /// [m3u] is the simple playlist format type.
  /// Each line only contains the description information
  static const FileTypeHeader m3u = FileTypeHeader._internal('#M3U');

  /// [m3uPlus] supports extra metadata associated with each line
  /// Each line only contains
  /// the description information and some key-value metadata.
  static const FileTypeHeader m3uPlus = FileTypeHeader._internal('#EXTM3U');
}
