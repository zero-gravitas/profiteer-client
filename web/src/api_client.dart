library profiteer.lib_elements.api_client;

import 'dart:async';
import 'dart:convert';
import 'dart:js';
import 'package:chrome/chrome_app.dart' as chrome;
import '../src/model.dart';

const String EXTENSION_ID = "achekneimlaiohppchbdfggjoelmhajm";

/**
 * A client for the PoE API. This will eventually have things like a PHPSESSID
 * cookie for when it supports proxying through the backend, which is why it's a
 * class and not a bunch of functions.
 */
class ApiClient {
  Future<dynamic> poeXhr(String route, Map<String, dynamic> params) {
    return chrome.runtime.sendMessage([route, params], EXTENSION_ID)
      .then((resp) => resp['result']);
  }

  /**
   * Get a list of all tabs in [league]. The tabs will have empty items.
   */
  Future<List<Tab>> getTabList(League league) {
    return poeXhr("character-window/get-stash-items", {
      "league": league.value,
      "tabs": 1,
      "tabIndex": 0
    }).then((json) {
      JsArray jsTabs = json['tabs'];
      List<Tab> tabs = [];
      for (var i = 0; i < jsTabs.length; i++) {
        var jsTab = jsTabs[i];
        var color = jsTab['colour'];
        tabs.add(new Tab(
                jsTab['n'],
                new Color(color['r'], color['g'], color['b']),
                []));
      }
      return tabs;
    });
  }

  /**
   * Get a list of all items in tab [tabIndex] of league [league].
   */
  Future<List<Item>> getTabContents(League league, int tabIndex) {
    return poeXhr("character-window/get-stash-items", {
      "league": league.value,
      "tabs": 0,
      "tabIndex": tabIndex
    }).then((json) => json['items'].map((itemJson) =>
            new Item.fromPoeApi(itemJson)));
  }
}
