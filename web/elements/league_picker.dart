library profiteer.elements.league_picker;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'sync.dart';
import '../src/stash.dart';

@CustomTag('profiteer-league-picker')
class LeaguePicker extends PolymerElement {
  final List<League> leagues =
    [League.STANDARD, League.HARDCORE, League.RAMPAGE, League.BEYOND];
  @published int index = 0;

  factory LeaguePicker() => new Element.tag('league-picker');
  LeaguePicker.created() : super.created();

  void select() {
    $['sync'].leagueStash = $["${leagues[index].value}-stash"];
  }
}