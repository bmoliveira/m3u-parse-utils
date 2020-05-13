/// Base information of the metadata of a Stream/Track
/// it holds the metadata attributes and the title information of a track.
class EntryInformation {
  /// Base information of the metadata of a stream/track
  /// [title] of the track/stream
  /// [attributes] the attributes of the stream, they can be null
  EntryInformation({this.title, this.attributes, this.duration});

  /// Hold the information about the track.
  /// This is a raw string there are some formats specific to playlists, but
  /// this is the raw string check EX: `#EXTINF:191,Artist Name - Track Title`
  String title;

  /// Attributes parsed from the line of metadata
  /// Ex:
  /// `#EXTINF:-1 tvg-id="identifier" group-title="The Only one",A TV channel`
  Map<String, String> attributes;

  /// Duration is the seconds in the numeric part of `#EXTINF:191`
  /// It is -1 if not present or parsing fails
  int duration;
}
