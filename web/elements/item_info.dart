library profiteer.elements.item_info;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-item-info')
class ProfiteerItemInfo extends PolymerElement {
  @published Item model;

  factory ProfiteerItemInfo() => new Element.tag('profiteer-item-info');
  ProfiteerItemInfo.created() : super.created();
}
