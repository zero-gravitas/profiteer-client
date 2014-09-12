library profiteer.elements.sync;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/model.dart';
import 'package:template_binding/template_binding.dart';

@CustomTag('profiteer-stash-tab')
class ProfiteerStashTab extends PolymerElement {
  @published Tab model;

  factory ProfiteerStashTab() => new Element.tag('profiteer-stash-tab');
  ProfiteerStashTab.created() : super.created();

  void iconMouseover(Event e) {
    asyncFire('item-mouseover',
        detail: nodeBind(e.target).templateInstance.model.value);
  }

  void ready() {
    // This is kind of a weird hack, but it works. If you set the src in the
    // template, then it blocks until the entire page has loaded, or
    // something. Which looks ugly.
    shadowRoot.querySelectorAll('img.icon').forEach((img) {
      Item model = nodeBind(img).templateInstance.model.value;
      async((_) => img.src = model.icon);
    });
  }
}
