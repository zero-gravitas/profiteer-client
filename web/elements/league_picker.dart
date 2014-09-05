library profiteer.elements.league_picker;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/stash.dart';

@CustomTag('profiteer-league-picker')
class LeaguePicker extends PolymerElement {
  final leagues = League.leagues.values;

  factory LeaguePicker() => new Element.tag('league-picker');
  LeaguePicker.created() : super.created();
}