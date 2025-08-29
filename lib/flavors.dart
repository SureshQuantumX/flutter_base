enum Flavor { apple, banana, orange }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.apple:
        return 'Apple App';
      case Flavor.banana:
        return 'Banana App';
      case Flavor.orange:
        return 'Orange App';
    }
  }
}
