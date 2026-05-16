/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct prefetchedResourceTest {
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
      eventId: 148800,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148800)
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
      return 'prefetchedResourceTest test';
    }
  }

  build() {
    Column() {
      Row() {
        Button("prefetchedResourceTest click").key('prefetchedResourceTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testPrefetchedResource001": {
              let msg = "testPrefetchedResource001"
              try {
                webView.WebviewController.prefetchResource(
                  null,
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
                Utils.emitEvent(error.code, 148810)
              }
              break;
            }
            case "testPrefetchedResource002": {
              let msg = "testPrefetchedResource002"
              try {
                webView.WebviewController.prefetchResource(
                  undefined,
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
                Utils.emitEvent(error.code, 148820)
              }
              break;
            }
            case "testPrefetchedResource003": {
              let msg = "testPrefetchedResource003"
              try {
                webView.WebviewController.prefetchResource(
                  {url:"https://www.example1.com/post?e=f&g=h",
                    method:"POST",
                    formData:"a=x&b=y"},
                  null,
                  "KeyX", 500);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148830)
              }
              break;
            }
            case "testPrefetchedResource004": {
              let msg = "testPrefetchedResource004"
              try {
                webView.WebviewController.prefetchResource(
                  {url:"https://www.example1.com/post?e=f&g=h",
                    method:"POST",
                    formData:"a=x&b=y"},
                  undefined,
                  "KeyX", 500);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148840)
              }
              break;
            }
            case "testPrefetchedResource005": {
              let msg = "testPrefetchedResource005"
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
                  "", 500);
                Utils.emitEvent(true, 148850)
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148850)
              }
              break;
            }
            case "testPrefetchedResource006": {
              let msg = "testPrefetchedResource006"
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
                  null, 500);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148860)
              }
              break;
            }
            case "testPrefetchedResource007": {
              let msg = "testPrefetchedResource007"
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
                  undefined, 500);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148870)
              }
              break;
            }
            case "testPrefetchedResource008": {
              let msg = "testPrefetchedResource008"
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
                  "KeyX", null);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148880)
              }
              break;
            }
            case "testPrefetchedResource009": {
              let msg = "testPrefetchedResource009"
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
                  "KeyX", undefined);
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148890)
              }
              break;
            }
            case "testPrefetchedResource010": {
              let msg = "testPrefetchedResource010"
              try {
                webView.WebviewController.prefetchResource(
                  {url:"https://www.example1.com/post?e=f&g=h",
                    method:"POST",
                    formData:"a=x&b=y"},
                  [],
                  "KeyX", 500);
                  Utils.emitEvent(true, 148891)
              } catch (error) {
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 148891)
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
          methodList: ['test', 'toString'],
          controller: this.controller
        })

    }
  }
}
