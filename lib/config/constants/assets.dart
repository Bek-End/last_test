abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();
  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get arrowBack => '$basePath/arrow_back.svg';
  String get arrowDown => '$basePath/arrow_down.svg';
  String get basket => '$basePath/basket.svg';
  String get books => '$basePath/books.svg';
  String get camera => '$basePath/camera.svg';
  String get check => '$basePath/check.svg';
  String get close => '$basePath/close.svg';
  String get computer => '$basePath/computer.svg';
  String get cpu => '$basePath/cpu.svg';
  String get filter => '$basePath/filter.svg';
  String get grid => '$basePath/grid.svg';
  String get health => '$basePath/health.svg';
  String get heartRounded => '$basePath/heart_rounded.svg';
  String get heart => '$basePath/heart.svg';
  String get location => '$basePath/location.svg';
  String get person => '$basePath/person.svg';
  String get phone => '$basePath/phone.svg';
  String get point => '$basePath/point.svg';
  String get sd => '$basePath/sd.svg';
  String get search => '$basePath/search.svg';
  String get ssd => '$basePath/ssd.svg';
  String get star => '$basePath/star.svg';
  String get trash => '$basePath/trash.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');
}
