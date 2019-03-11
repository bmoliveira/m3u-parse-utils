import 'package:meta/meta.dart';

/// Exception thrown when an error occurs due to invalid Header format of a file.
class InvalidFormatException implements Exception {
  /// Type of Error
  InvalidFormatType formatType;

  /// Option extra parameter that represent the value given to throw this error.
  String originalValue;

  /// Optional message to give more debug options.
  String customMessage;

  /// Creates the exception with the given parameters.
  InvalidFormatException(
      {@required this.formatType, this.originalValue, this.customMessage})
      : super() {}

  @override
  String toString() {
    var finalMessage = StringBuffer("");

    switch (formatType) {
      case InvalidFormatType.Header:
        finalMessage.writeln("Invalid Header found");
        break;
      default:
    }

    if (originalValue != null) {
      finalMessage.write("Value: [");
      finalMessage.write(originalValue);
      finalMessage.writeln("]");
    }

    if (customMessage != null) {
      finalMessage.writeln(customMessage);
    }
    return finalMessage.toString();
  }
}

/// Supported types of invalid  format exceptions.
enum InvalidFormatType { Header, Other }
