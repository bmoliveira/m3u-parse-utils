import 'package:m3u/src/entry_information.dart';

/// An entry on a Playlist it can be a simple entry, without attributes,
/// or an entry with custom attributes.
class M3uGenericEntry {
  /// Hold the information about the track.
  /// This is a raw string there are some formats specific to playlists, but
  /// this is the raw string check EX: `#EXTINF:191,Artist Name - Track Title`
  String title;

  /// Attributes parsed from the line of metadata
  /// Ex: `#EXTINF:-1 tvg-id="identifier" group-title="The Only one",A TV channel`
  Map<String, String> attributes;

  /// Source of the track/stream url that points to a track/stream
  String link;

  M3uGenericEntry({this.title, this.attributes, this.link});

  /// Simple representation of the object on a string.
  @override
  String toString() {
    return "Title: $title Link:$link hasAttributes:${attributes.isNotEmpty}";
  }

  /// Constructor from an [EntryInformation] that only hold the title
  /// and attributes of a track/stream
  factory M3uGenericEntry.fromEntryInformation(
      {EntryInformation information, String link}) {
    return M3uGenericEntry(
        title: information.title,
        attributes: information.attributes,
        link: link);
  }
}
