
abstract class AppEvent {}

class AppInitEvent extends AppEvent {}

class ChangeLanguageEvent extends AppEvent {
  ChangeLanguageEvent();
}

class ChangeThemeEvent extends AppEvent {
  ChangeThemeEvent();
}
