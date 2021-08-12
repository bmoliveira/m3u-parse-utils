import 'package:m3u/src/entry_information.dart';

/// An entry on a Playlist it can be a simple entry, without attributes,
/// or an entry with custom attributes.
class M3uGenericEntry {
  /// Generic constructor with
  ///
  /// [title] of the track/stream
  /// [attributes] custom attributes, can be null
  /// [link] the link to the source of the track/stream
  /// [duration] the duration in seconds of the track/stream, can be null
  M3uGenericEntry(
      {required this.title,
      required this.attributes,
      required this.link,
      this.duration});

  /// Constructor from an [EntryInformation] that only hold the title
  /// and attributes of a track/stream
  factory M3uGenericEntry.fromEntryInformation(
          {required EntryInformation information, required String link}) =>
      M3uGenericEntry(
          title: information.title,
          attributes: information.attributes,
          link: link,
          duration: information.duration);

  /// Hold the information about the track.
  /// This is a raw string there are some formats specific to playlists, but
  /// this is the raw string check EX: `#EXTINF:191,Artist Name - Track Title`
  String title;

  /// Attributes parsed from the line of metadata
  /// Ex:
  /// `#EXTINF:-1 tvg-id="identifier" group-title="The Only one",A TV channel`
  Map<String, String?> attributes;

  /// Source of the track/stream url that points to a track/stream
  String link;

  /// Duration is the seconds in the numeric part of `#EXTINF:191`
  /// It is null if not present or parsing fails
  int? duration;

  /// Simple representation of the object on a string.
  @override
  String toString() =>
      'Title: $title Link:$link hasAttributes:${attributes.isNotEmpty}';
}
