import 'package:go_router/go_router.dart';
import 'package:cent/forum_exer/screens/home/home_screen.dart';
import 'package:cent/forum_exer/screens/register/register_screen.dart';
import 'package:cent/forum_exer/screens/post_detail/post_detail_screen.dart';
import 'package:cent/forum_exer/screens/login/login_screen.dart';
import 'package:cent/forum_exer/screens/profile/profile_screen.dart';
class RouteName {
  // định nghĩa các đường dẫn đến màn hình chính
  static const String home = '/';
  static const String login = '/login';
  static const String postDetail = '/post/:id';
  static const String profile = '/profile';
  static const String register = '/register';

  static const publicRoutes = [// đây là routes public user k cần phải sign in cũng có thể nhìn thấy 2 màn hình này
    login,
    register,
  ];
}

final router = GoRouter(
  redirect: (context, state) {
    if (RouteName.publicRoutes.contains(state.fullPath)) {
      return null;
    }
    // if (context.read<AuthBloc>().state is AuthAuthenticateSuccess) {
    //   return null;
    // }
    return RouteName.login;
  },
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: RouteName.login,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RouteName.postDetail,
      builder: (context, state) => PostDetailScreen(
        id: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: RouteName.profile,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: RouteName.register,
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);