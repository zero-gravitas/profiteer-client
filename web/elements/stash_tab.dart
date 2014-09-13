library profiteer.elements.sync;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-stash-tab')
class ProfiteerStashTab extends PolymerElement {
  @published Tab model;

  factory ProfiteerStashTab() => new Element.tag('profiteer-stash-tab');
  ProfiteerStashTab.created() : super.created();
}
