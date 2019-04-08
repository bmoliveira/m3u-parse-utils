import 'package:m3u/m3u.dart';
import 'package:meta/meta.dart';

/// Helper functions around categories and extra properties on playlist files.
class PlaylistHelper {
  /// From a list of categories return them organized by a property
  /// [entries] all the entries from the response
  /// [attributeName] name of the attribute to merge for
  /// [defaultAttribute] when the attribute is not found category
  /// to merge properties.
  static Map<String, List<M3uGenericEntry>> sortedCategories(
          {@required List<M3uGenericEntry> entries,
          @required String attributeName,
          String defaultAttribute = 'other'}) =>
      entries.fold(<String, List<M3uGenericEntry>>{}, (acc, current) {
        final property = current.attributes[attributeName] ?? defaultAttribute;

        if (!acc.containsKey(property)) {
          acc[property] = [current];
        } else {
          acc[property].add(current);
        }
        return acc;
      });
}
