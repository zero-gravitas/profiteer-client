library profiteer.elements.league_picker;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/stash.dart';

@CustomTag('profiteer-league-picker')
class LeaguePicker extends PolymerElement {
  @published List<String> leagues;

  factory LeaguePicker() => new Element.tag('league-picker');
  LeaguePicker.created() : super.created();
}