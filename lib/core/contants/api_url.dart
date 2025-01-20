import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static final baseURL = dotenv.get('API_BASE_URL');
  static final token = dotenv.get('API_KEY');

  static final signup = '${baseURL}/auth/v1/signup';

}
