library profiteer.elements.inventory;

import 'dart:convert' show JSON;
import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-inventory')
class ProfiteerInventory extends PolymerElement {
  @published var index = 0;
  @published String storageKey;
  @observable ObservableList<Stash> stashes = toObservable([]);
  @observable currentItem;

  factory ProfiteerInventory() => new Element.tag('profiteer-inventory');
  ProfiteerInventory.created() : super.created();

  void ready() {
    if (window.localStorage[storageKey] == null) {
      League.leagues.values.forEach(
          (league) => stashes.add(new Stash(league)));
      save();
    } else {
      JSON.decode(window.localStorage[storageKey]).forEach((decoded) =>
          stashes.add(new Stash.fromJson(decoded)));
    }
  }

  void save() {
    if (storageKey == null) return;
    window.localStorage[storageKey] = JSON.encode(stashes);
  }

  void indexChanged() {
    currentItem = null;
  }

  void itemMouseover(Event event) {
    currentItem = event.detail;
  }
}