import 'package:flutter/material.dart';
import 'package:hetu_script/hetu/hetu.dart';
// import 'package:hetu_script/values.dart';
import 'package:hetu_spotify_gql_client/hetu_spotify_gql_client.dart';
import 'package:hetu_std/hetu_std.dart';

import 'package:dotenv/dotenv.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await runHetuSpotifyGqlApi();

  runApp(
    MaterialApp(
      title: 'Hetu Spotify GQL Client',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SizedBox(),
    ),
  );
}

Future<void> runHetuSpotifyGqlApi() async {
  final env = DotEnv(includePlatformEnvironment: true)..load();

  final hetu = Hetu();
  hetu.init();
  HetuStdLoader.loadBindings(hetu);

  await HetuStdLoader.loadBytecodeFlutter(hetu);
  await HetuSpotifyGqlApiClientLoader.loadBytecodeFlutter(hetu);

  hetu.eval("const ACCESS_TOKEN = '${env["ACCESS_TOKEN"]}'");
  hetu.eval(r"""
    import 'module:spotify_gql_api_client' as spotify

    var { SpotifyGqlApi } = spotify

    var spotifyApi = SpotifyGqlApi(ACCESS_TOKEN)
    
    
    // spotifyApi.user.me().then((user){
    //   print('User ID: ${user}')
    // })
    
    // spotifyApi.user.savedTracks().then((tracks) {
    //   print('Saved Tracks: ${tracks}')
    // })

    // spotifyApi.user.savedPlaylists().then((item) {
    //   print('Saved Playlists: ${item}')
    // })

    // spotifyApi.user.savedAlbums().then((item) {
    //   print('Saved Albums: ${item}')
    // })

    // spotifyApi.user.savedArtists().then((item) {
    //   print('Saved artists: ${item}')
    // })

    // spotifyApi.user.isTracksSaved(["0BBLwKdU4vn0HDSi1C8xDZ", "10WWosq6z75o3WGRjL4v2D"])
    // .then((item) {
    //   print('Is tracks saved: ${item}')
    // })

    // spotifyApi.user.isPlaylistSaved("3cEYpjA9oz9GiPac4AsH4n")
    // .then((item) {
    //   print('Is playlist saved: ${item}')
    // })

    // spotifyApi.user.isInLibrary(
    //   ["0Rkv5iqjF2uenfL0OVB8hg", "3vDIjYB1eatEoGlVoZWUFs", "69xcXWqK1aN73KgVA2i3Zq"],
    //   itemType: "album"
    // )
    // .then((item) {
    //   print('Is albums in library: ${item}')
    // })

    // spotifyApi.user.isInLibrary(
    //   ["3YQKmKGau1PzlVlkL1iodx", "45dkTj5sMRSjrmBSBeiHym"],
    //   itemType: "artist"
    // )
    // .then((item) {
    //   print('Is artists in library: ${item}')
    // })

    // spotifyApi.playlist.getPlaylist("3cEYpjA9oz9GiPac4AsH4n").then((item) {
    //   print('Get Playlist: ${item}')
    // })

    // spotifyApi.playlist.tracks("3cEYpjA9oz9GiPac4AsH4n", offset: 1, limit: 10).then((item) {
    //   print('Get Playlist Tracks: ${item}')
    // })

    // spotifyApi.playlist.create(
    //   "<your user id>",
    //   name: "My testing playlist",
    //   description: "This is a test playlist",
    //   public: false,
    //   collaborative: false,
    // ).then((item) {
    //   print('Create playlist: ${item}')
    // })

    // spotifyApi.playlist.update(
    //   "<your playlist id>",
    //   name: "Update playlist",
    //   description: "updated description",
    //   public: false,
    //   collaborative: false,
    // ).then((item) {
    //   print('Update playlist: ${item}')
    // })

    // spotifyApi.playlist.addTracks(
    //   "<your playlist id>",
    //   uris: ["spotify:track:2Z8WuEywRWYTKe1NybPQEW"]
    // ).then((item) {
    //   print('Added tracks: ${item}')
    // })

    // spotifyApi.playlist.removeTracks(
    //   "<your playlist id>",
    //   uris: ["spotify:track:2Z8WuEywRWYTKe1NybPQEW"]
    // ).then((item) {
    //   print('Removed tracks: ${item}')
    // })

    // spotifyApi.playlist.follow("3cEYpjA9oz9GiPac4AsH4n").then((item) {
    //   print('Playlist follow: ${item}')
    // })

    // spotifyApi.playlist.unfollow("3cEYpjA9oz9GiPac4AsH4n").then((item) {
    //   print('Playlist unfollow: ${item}')
    // })

    // spotifyApi.album.getAlbum("4aawyAB9vmqN3uQ7FjRGTy").then((item) {
    //   print('Get album: ${item}')
    // })

    // spotifyApi.album.tracks("4aawyAB9vmqN3uQ7FjRGTy", offset: 1, limit: 10).then((item) {
    //   print('Get Album Tracks: ${item}')
    // })

    // spotifyApi.album.releases(offset: 0, limit: 10).then((item) {
    //   print('Album RELEASES: ${item}')
    // })

    // spotifyApi.album.save(["6arzq3H2uuaYsfBBe2BYC3"]).then((item) {
    //   print('Album save: ${item}')
    // })

    // spotifyApi.album.unsave(["6arzq3H2uuaYsfBBe2BYC3"]).then((item) {
    //   print('Album unsave: ${item}')
    // })

    // spotifyApi.artist.getArtist("0TnOYISbd1XYRBk9myaseg").then((item) {
    //   print('Get artist: ${item}')
    // })

    // spotifyApi.artist.topTracks("0TnOYISbd1XYRBk9myaseg").then((item) {
    //   print('Get artist top tracks: ${item}')
    // })

    // spotifyApi.artist.albums("0TnOYISbd1XYRBk9myaseg").then((item) {
    //   print('Get artist albums: ${item}')
    // })

    // spotifyApi.artist.follow(["6LqNN22kT3074XbTVUrhzX"]).then((item) {
    //   print('Artist save: ${item}')
    // })

    // spotifyApi.artist.unfollow(["6LqNN22kT3074XbTVUrhzX"]).then((item) {
    //   print('Artist unsave: ${item}')
    // })

    // spotifyApi.track.getTrack("11dFghVXANMlKmJXsNCbNl").then((item) {
    //   print('Get artist: ${item}')
    // })

    // spotifyApi.track.save(["11dFghVXANMlKmJXsNCbNl"]).then((item) {
    //   print('Save track: ${item}')
    // })

    // spotifyApi.track.unsave(["11dFghVXANMlKmJXsNCbNl"]).then((item) {
    //   print('Save track: ${item}')
    // })

    // spotifyApi.search.all("Twenty One Pilots").then((item) {
    //   print('Search all: ${item}')
    // })

    // spotifyApi.search.albums("Twenty One Pilots").then((item) {
    //   print('Search albums: ${item}')
    // })

    // spotifyApi.search.artists("Twenty One Pilots").then((item) {
    //   print('Search artists: ${item}')
    // })
    
    // spotifyApi.search.playlists("Twenty One Pilots").then((item) {
    //   print('Search playlists: ${item}')
    // })

    // spotifyApi.search.tracks("Twenty One Pilots").then((item) {
    //   print('Search tracks: ${item}')
    // })

    spotifyApi.browse.home(timeZone: "Asia/Mumbai", spTCookie: "<your sp_t cookie>")
    .then((item) {
      print('Browse home: ${item}')
    })
  """);

  // Invoke through Dart API
  // print(
  //   await (((hetu.fetch("spotifyApi") as HTInstance).memberGet("user")
  //               as HTInstance)
  //           .invoke("me")
  //       as Future),
  // );
}
