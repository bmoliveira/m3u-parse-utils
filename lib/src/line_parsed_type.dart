/// Types of lines supported by the parser
enum LineParsedType {
  /// [header] is the representation of the file type.
  header,

  /// [info] is the row of information of the track.
  info,

  /// [source] is the link to the Stream/Track.
  source
}
