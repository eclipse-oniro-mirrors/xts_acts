/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';

@Entry
@Component
struct clearPrefetchedResourceTest {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  responseweb: WebResourceResponse = new WebResourceResponse()
  scheme1: webView.WebCustomScheme = {
    schemeName: "name1",
    isSupportCORS: true,
    isSupportFetch: true,
    isStandard: false,
    isLocal: false,
    isDisplayIsolated: false,
    isSecure: false,
    isCspBypassing: false,
    isCodeCacheSupported: false,
  }
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148301,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148301)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info('ets toString:' + String(res));
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      return 'clearPrefetchedResourceTest test';
    }
  }

  build() {
    Column() {
      Row() {
        Button("clearPrefetchedResourceTest click").key('clearPrefetchedResourceTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testClearPrefetchedResource001": {
              let msg = "testClearPrefetchedResource001"
              try {
                webView.WebviewController.prefetchResource(
                  {url:"https://www.example1.com/post?e=f&g=h",
                    method:"POST",
                    formData:"a=x&b=y"},
                  [
                    {headerKey:"Accept",
                      headerValue:"application/json",
                    },
                    {headerKey:"Content-Type",
                      headerValue:"application/x-www-form-urlencoded",
                    },
                  ],
                  "KeyX", 500);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                webView.WebviewController.clearPrefetchedResource(["KeyX"]);
                Utils.emitEvent(true, 148300)
              } catch (err) {
                console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
              }
              break;
            }
            case "testClearPrefetchedResource002": {
              let msg = "testClearPrefetchedResource002"
              try {
                webView.WebviewController.clearPrefetchedResource([" "]);
              } catch (err) {
                console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                Utils.emitEvent(err.code, 148310)
              }
              break;
            }
            case "testClearPrefetchedResource003": {
              let msg = "testClearPrefetchedResource003"
              try {
                webView.WebviewController.clearPrefetchedResource(undefined);
              } catch (err) {
                console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                Utils.emitEvent(err.code, 148320)
              }
              break;
            }
            case "testClearPrefetchedResource004": {
              let msg = "testClearPrefetchedResource004"
              try {
                webView.WebviewController.clearPrefetchedResource(null);
              } catch (err) {
                console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                Utils.emitEvent(err.code, 148330)
              }
              break;
            }
            case "testClearPrefetchedResource005": {
              let msg = "testClearPrefetchedResource005"
              try {
                webView.WebviewController.clearPrefetchedResource(['中——文']);
              } catch (err) {
                console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                Utils.emitEvent(err.code, 148340)
              }
              break;
            }
            case "testCustomizeSchemes001": {
              let msg = "testCustomizeSchemes001"
              try {
                webView.WebviewController.customizeSchemes([this.scheme1])
              } catch (err) {
                console.error(msg + 'customizeSchemes error: ' + err.code + ' Message: ' + err.message);
                Utils.emitEvent(err.code, 148350)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
