part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isLightMode;
  const ThemeState({
    required this.isLightMode,
  });

  factory ThemeState.initial() {
    return const ThemeState(isLightMode: true,
    //AppSharedPreferences.getCashedThemeMode()
    );
  }

  ThemeState copyWith({
    bool? isLightMode,
  }) {
    return ThemeState(
      isLightMode: isLightMode ?? this.isLightMode,
    );
  }

  @override
  List<Object> get props => [isLightMode];
}
