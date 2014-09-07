library profiteer.elements.sync;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../lib-elements/api_client.dart';
import 'league_stash.dart';

@CustomTag('profiteer-sync')
class Sync extends PolymerElement {
  @published String apiClientId;
  @observable ApiClient apiClient;
  @published String leagueStashId;
  @observable LeagueStash leagueStash;

  factory Sync() => new Element.tag('profiteer-sync');
  Sync.created() : super.created();

  void apiClientIdChanged() {
    apiClient = document.querySelector('#$apiClientId');
  }

  void leagueStashIdChanged() {
    leagueStash = document.querySelector('#$leagueStashId');
  }

  void sync() {
    apiClient.getTabList(leagueStash.league).then((tabs) {
      leagueStash.model.tabs = tabs;
    });
  }
}