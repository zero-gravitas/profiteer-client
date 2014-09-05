library profiteer.elements.league;

import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/stash.dart';

@CustomTag('profiteer-league-stash')
class LeagueStash extends PolymerElement {
  @published League league;
  @observable Stash model;

  factory LeagueStash() => new Element.tag('league-stash');
  LeagueStash.created() : super.created();

  void ready() {
    model = new Stash(league);
  }
}