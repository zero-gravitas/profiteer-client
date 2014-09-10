library profiteer.elements.inventory;

import 'dart:convert' show JSON;
import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/stash.dart';

@CustomTag('profiteer-inventory')
class ProfiteerInventory extends PolymerElement {
  @published ObservableList<League> leagues = toObservable(
      League.leagues.values.toList());
  @published var index = 0;
  @published String storageKey;
  @observable ObservableList<LeagueStash> stashes = toObservable([]);

  factory ProfiteerInventory() => new Element.tag('profiteer-inventory');
  ProfiteerInventory.created() : super.created();

  void ready() {
    if (stashes != null) {
      League.leagues.values.forEach(
          (league) => stashes.add(new Stash(league)));
    }
  }

  void save() {
    if (storageKey == null) return;
  }
}