import 'package:flutter/cupertino.dart';

class Music {
  final String songName;
  final String playlistName;
  final String urlImage;
  final String artistName;

  const Music({
    required this.songName,
    required this.playlistName,
    required this.artistName,
    required this.urlImage
  });

  String get song => songName;
  String get playlist_name => playlistName;
  String get artist_name => artistName;

}