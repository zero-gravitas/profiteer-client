library profiteer.elements.item;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-item')
class ProfiteerItem extends PolymerElement {
  @published Item model;

  factory ProfiteerItem() => new Element.tag('profiteer-item');
  ProfiteerItem.created() : super.created();
}


