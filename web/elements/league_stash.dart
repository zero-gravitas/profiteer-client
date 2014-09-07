library profiteer.elements.league;

import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/stash.dart';

@CustomTag('profiteer-league-stash')
class LeagueStash extends PolymerElement {
  @published League league;
  @published String storageKey;
  @observable Stash model;

  factory LeagueStash() => new Element.tag('league-stash');
  LeagueStash.created() : super.created();

  void ready() {
    assert(storageKey != null);
    if (window.localStorage.containsKey(storageKey)) {
      model = new Stash.fromJson(JSON.decode(window.localStorage[storageKey]));
    } else {
      model = new Stash(league);
    }
  }
}