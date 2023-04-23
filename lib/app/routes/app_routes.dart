// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const NAVIGATOR_BAR = _Paths.NAVIGATOR_BAR;
  static const DOCUMENT = _Paths.DOCUMENT;
  static const SEARCH = _Paths.SEARCH;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const LOGIN = _Paths.LOGIN;
  static const CREATE_WORKSPACE = _Paths.CREATE_WORKSPACE;
  static const SET_ASSIGNEE = _Paths.SET_ASSIGNEE;
  static const CREATE_TASK = _Paths.CREATE_TASK;
  static const CREATE_PROJECT = _Paths.CREATE_PROJECT;
  static const CREATE_TEAM = _Paths.CREATE_TEAM;
  static const CREATE_EVENT = _Paths.CREATE_EVENT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const NAVIGATOR_BAR = '/navigator-bar';
  static const DOCUMENT = '/document';
  static const SEARCH = '/search';
  static const NOTIFICATION = '/notification';
  static const LOGIN = '/login';
  static const CREATE_WORKSPACE = '/create-workspace';
  static const SET_ASSIGNEE = '/set-assignee';
  static const CREATE_TASK = '/create-task';
  static const CREATE_PROJECT = '/create-project';
  static const CREATE_TEAM = '/create-team';
  static const CREATE_EVENT = '/create-event';
}
