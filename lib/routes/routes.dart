import 'package:get/get.dart';
import '../views/activitylogscreen.dart';
import '../views/dashboard.dart';
import '../views/graphscreen.dart';
import '../views/loginscreen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String activityLog = '/activity';
  static const String graph = '/graph';

  static final List<GetPage> getPages = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: activityLog, page: () => ActivityLogScreen()),
    GetPage(name: graph, page: () => GraphScreen()),
  ];
}
