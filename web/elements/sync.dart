library profiteer.elements.sync;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../src/api_client.dart';
import '../src/stash.dart';

@CustomTag('profiteer-sync')
class ProfiteerSync extends PolymerElement {
  ApiClient _apiClient = new ApiClient();
  @published Stash stash;

  factory ProfiteerSync() => new Element.tag('profiteer-sync');
  ProfiteerSync.created() : super.created();

  void sync() {
    _apiClient.getTabList(stash.league).then((tabs) {
      stash.tabs = tabs;
    });
  }
}