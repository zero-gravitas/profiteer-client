library profiteer.stash;

import 'package:observe/observe.dart';

class League {
  // TODO: Garena. Is it as easy as it should be?
  static const STANDARD = const League._('standard');
  static const HARDCORE = const League._('hardcore');
  static const RAMPAGE = const League._('rampage');
  static const BEYOND = const League._('beyond');

  static Map get leagues => {
    'standard': STANDARD,
    'hardcore': HARDCORE,
    'rampage': RAMPAGE,
    'beyond': BEYOND
  };

  final String value;

  const League._(this.value);
  factory League.fromJson(String json) {
    if (leagues[json] != null) {
      return leagues[json];
    } else {
      throw new ArgumentError('$json is not a valid league name');
    }
  }

  String toJson() { return value; }
}

class Stash extends Observable {
  League league;
  @observable List<Tab> tabs = [];

  Stash(this.league);
  Stash.fromJson(Map json) {
    league = new League.fromJson(json['league']);

    tabs = json['tabs'].map((tab) => new Tab.fromJson(tab)).toList();
  }

  Map toJson() {
    return {
      'league': league,
      'tabs': tabs
    };
  }
}

/**
 * An HTML RGB color, with values in the range 0 to 255.
 */
class Color extends Observable {
  final int r;
  final int g;
  final int b;

  Color(this.r, this.g, this.b);
  Color.fromJson(Map json) : r = json['r'], g = json['g'], b = json['b'];

  Map toJson() {
    return {
      'r': this.r,
      'g': this.g,
      'b': this.b
    };
  }
}

class Tab extends Observable {
  final String name;
  final Color color;
  @observable ObservableList<Item> items;

  Tab(this.name, this.color, items) {
    this.items = toObservable(items);
  }
  Tab.fromJson(Map json) : name = json['name'],
    color = new Color.fromJson(json['color']) {
    items = toObservable(json['items'].map((item) => new Item.fromJson(item)));
  }

  Map toJson() {
    return {
      'name': name,
      'color': color,
      'items': items
    };
  }
}

class Item extends Observable {
  final String name;
  final String typeLine;
  final int width;
  final int height;
  final int x;
  final int y;
  final String icon;

  Item(this.name, this.typeLine, this.width, this.height, this.x, this.y,
      this.icon);
  // This is a factory because it needs to dispatch on the type of the item
  factory Item.fromPoeApi(Map json) {
    return new Item(
        json['name'],
        json['typeLine'],
        json['w'],
        json['h'],
        json['x'],
        json['y'],
        json['icon']);
  }
  factory Item.fromJson(Map json) {
    return new Item(
        json['name'],
        json['typeLine'],
        json['width'],
        json['height'],
        json['x'],
        json['y'],
        json['icon']);
  }

  Map toJson() {
    return {
      'name': name,
      'typeLine': typeLine,
      'width': width,
      'height': height,
      'x': x,
      'y': y,
      'icon': icon
    };
  }
}