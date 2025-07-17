import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activitymodel.dart';

class ActivityService {
  Future<List<ActivityLog>> fetchLogs({int page = 1, int limit = 10}) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limit');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ActivityLog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load activity logs');
    }
  }
}
