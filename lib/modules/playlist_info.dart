class Playlist {
  final String playlistName;
  final String urlImage;

  const Playlist({
    required this.playlistName,
    required this.urlImage,
  });

  String get playlist_name => playlistName;
  String get playlistImg => urlImage;

}