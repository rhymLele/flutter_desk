import 'dart:io';

import 'package:path_provider/path_provider.dart';
class ScoreData{
  static Future<String> get GetFilePath async{
    final Directory directory= await getApplicationCacheDirectory();
    print(directory.path);
      return directory.path;
  }
  static Future<File> get GetFile async{
    final path=await GetFilePath;
    return File('$path/score.txt');
  }
  static Future<String> readScore() async{
    try{
        final file=await GetFile;
        String fileContents=await file!.readAsString();
        return fileContents;
    }catch(e){
      print(e);
      return 'Error';
    }
  }
  static Future<File> saveScore(String score) async{
    final file= await GetFile;
    return file.writeAsString(score);
  }
}