library profiteer.elements.item_icon;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';

@CustomTag('profiteer-item-icon')
class ProfiteerItemIcon extends PolymerElement {
  @published Item model;

  factory ProfiteerItemIcon() => new Element.tag('profiteer-item-icon');
  ProfiteerItemIcon.created() : super.created();

  void ready() {
    // This is kind of a weird hack, but it works. If you set the src in the
    // template, then it blocks until the entire page has loaded, or
    // something. Which looks ugly.
    async((_) => shadowRoot.querySelector('img.icon').src = model.icon);
  }

  void mouseover() {
    asyncFire('item-mouseover', detail: model);
  }
}


