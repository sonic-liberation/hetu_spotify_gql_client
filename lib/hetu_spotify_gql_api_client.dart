import 'dart:io';

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

  static Future<void> loadBytecodeFlutter(Hetu hetu) async {
    final byteCodeFile = File(
      'packages/hetu_std/assets/bytecode/spotify_gql_api_client.out',
    );
    final byteCode = await byteCodeFile.readAsBytes();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'spotify_gql_api_client');
  }
}
