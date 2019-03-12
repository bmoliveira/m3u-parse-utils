/// Exception thrown when an error occurs
/// due to invalid Header format of a file.
class InvalidFormatException implements Exception {
  /// Creates the exception with the given parameters.
  InvalidFormatException(this.formatType,
      {this.originalValue, this.customMessage})
      : super();

  /// Type of Error
  InvalidFormatType formatType;

  /// Option extra parameter that represent the value given to throw this error.
  String originalValue;

  /// Optional message to give more debug options.
  String customMessage;

  @override
  String toString() {
    final finalMessage = StringBuffer('');

    switch (formatType) {
      case InvalidFormatType.header:
        finalMessage.writeln('Invalid Header found');
        break;
      default:
    }

    if (originalValue != null) {
      finalMessage
        ..write('Value: [')
        ..write(originalValue)
        ..writeln(']');
    }

    if (customMessage != null) {
      finalMessage.writeln(customMessage);
    }
    return finalMessage.toString();
  }
}

/// Supported types of invalid format exceptions.
enum InvalidFormatType {
  /// Header with the information of the track/stream
  /// title, and custom attributes
  header,

  /// Other kind of information, usually the link of the stream
  other
}
