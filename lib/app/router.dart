import 'package:go_router/go_router.dart';
import 'routes.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/student/student_dashboard.dart';
import '../features/teacher/dashboard/teacher_dashboard.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.teacherDashboard,
        builder: (context, state) => const TeacherDashboard(),
      ),
      GoRoute(
        path: AppRoutes.studentDashboard,
        builder: (context, state) => const StudentDashboard(),
      ),
    ],
  );
}
