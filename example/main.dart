import 'dart:io';

import 'package:m3u/m3u.dart';

Future<void> main(List<String> arguments) async {
  final fileContent = await File('resources/example.m3u').readAsString();
  final List<M3uGenericEntry> listOfTracks = await parseFile(fileContent);
  print(listOfTracks);
}
