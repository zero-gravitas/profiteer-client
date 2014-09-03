library profiteer.stash;

class League {
  // TODO: Garena. Is it as easy as it should be?
  static const STANDARD = const League._("standard");
  static const HARDCORE = const League._("hardcore");
  static const RAMPAGE = const League._("rampage");
  static const BEYOND = const League._("beyond");

  static get values = [STANDARD, HARDORE, RAMPAGE, BEYOND];

  final String value;

  const League._(this.value);
}

class LeagueStash {
  final League league;
  List<Tab> tabs;

  LeagueStash(this.league, this.tabs);
}

class Tab {
  final String name;
  final int r;
  final int g;
  final int b;

  Tab(this.name, this.r, this.g, this.b);
}

class Item {
  final String name;

  Item(this.name);
}