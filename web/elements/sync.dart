library profiteer.elements.sync;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/api_client.dart';
import '../src/model.dart';

@CustomTag('profiteer-sync')
class ProfiteerSync extends PolymerElement {
  ApiClient _apiClient = new ApiClient();
  @published Stash stash;

  factory ProfiteerSync() => new Element.tag('profiteer-sync');
  ProfiteerSync.created() : super.created();

  void sync() {
    _apiClient.getTabList(stash.league).then((tabs) {
      stash.tabs = tabs;
      fire('sync');
      for (var i = 0; i < stash.tabs.length; i++) {
        Tab tab = stash.tabs[i];
        _apiClient.getTabContents(stash.league, i).then((items) {
          tab.items.clear();
          tab.items.addAll(items);
          fire('sync');
        });
      }
    });
  }
}