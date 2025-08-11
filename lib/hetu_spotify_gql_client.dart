import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hetu_script/hetu/hetu.dart';
import 'package:path/path.dart';

class HetuSpotifyGqlApiClientLoader {
  static Future<void> loadBytecodePureDart(
    Hetu hetu,
    String packagePath,
  ) async {
    final byteCodeFile = File(
      join(packagePath, 'lib/assets/bytecode/spotify_gql_api_client.out'),
    );
    final byteCode = await byteCodeFile.readAsBytes();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'spotify_gql_api_client');
  }

  /// Loads the bytecode for the standard library from the Flutter asset bundle.
  /// Add following to your `pubspec.yaml`:
  ///
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - packages/hetu_spotify_gql_client/assets/bytecode/spotify_gql_api_client.out
  /// ```
  static Future<void> loadBytecodeFlutter(Hetu hetu) async {
    final byteCodeFile = await rootBundle.load(
      'packages/hetu_spotify_gql_client/assets/bytecode/spotify_gql_api_client.out',
    );
    final byteCode = byteCodeFile.buffer.asUint8List();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'spotify_gql_api_client');
  }
}
