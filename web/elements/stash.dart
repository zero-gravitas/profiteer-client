library profiteer.elements.league;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-stash')
class ProfiteerStash extends PolymerElement {
  @published Stash model;

  factory ProfiteerStash() => new Element.tag('profiteer-stash');
  ProfiteerStash.created() : super.created();
}