/// Base information of the metadata of a Stream/Track
/// it holds the metadata attributes and the title information of a track.
class EntryInformation {
  /// Hold the information about the track.
  /// This is a raw string there are some formats specific to playlists, but
  /// this is the raw string check EX: `#EXTINF:191,Artist Name - Track Title`
  String title;

  /// Attributes parsed from the line of metadata
  /// Ex: `#EXTINF:-1 tvg-id="identifier" group-title="The Only one",A TV channel`
  Map<String, String> attributes;

  EntryInformation({this.title, this.attributes});
}
