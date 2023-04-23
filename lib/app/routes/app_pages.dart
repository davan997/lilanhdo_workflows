import 'package:get/get.dart';

import '../modules/create_workspace/bindings/create_workspace_binding.dart';
import '../modules/create_workspace/views/create_workspace_view.dart';
import '../modules/document/bindings/document_binding.dart';
import '../modules/document/views/document_view.dart';
import '../modules/home_page/create_event/bindings/create_event_binding.dart';
import '../modules/home_page/create_event/views/create_event_view.dart';
import '../modules/home_page/create_project/bindings/create_project_binding.dart';
import '../modules/home_page/create_project/views/create_project_view.dart';
import '../modules/home_page/create_task/bindings/create_task_binding.dart';
import '../modules/home_page/create_task/views/create_task_view.dart';
import '../modules/home_page/create_team/bindings/create_team_binding.dart';
import '../modules/home_page/create_team/views/create_team_view.dart';
import '../modules/home_page/home/bindings/home_binding.dart';
import '../modules/home_page/home/views/home_view.dart';
import '../modules/home_page/set_assignee/bindings/set_assignee_binding.dart';
import '../modules/home_page/set_assignee/views/set_assignee_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigator_bar/bindings/navigator_bar_binding.dart';
import '../modules/navigator_bar/views/navigator_bar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATOR_BAR,
      page: () => const NavigatorBarView(),
      binding: NavigatorBarBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => const DocumentView(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_WORKSPACE,
      page: () => const CreateWorkspaceView(),
      binding: CreateWorkspaceBinding(),
    ),
    GetPage(
      name: _Paths.SET_ASSIGNEE,
      page: () => const SetAssigneeView(),
      binding: SetAssigneeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TASK,
      page: () => const CreateTaskView(),
      binding: CreateTaskBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PROJECT,
      page: () => const CreateProjectView(),
      binding: CreateProjectBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TEAM,
      page: () => const CreateTeamView(),
      binding: CreateTeamBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_EVENT,
      page: () => const CreateEventView(),
      binding: CreateEventBinding(),
    ),
  ];
}
