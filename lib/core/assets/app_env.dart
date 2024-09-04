import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static Future<String?> loadEnv()async{
    await dotenv.load(fileName: "app.env");
    return dotenv.get("API_KEY");
  }
}