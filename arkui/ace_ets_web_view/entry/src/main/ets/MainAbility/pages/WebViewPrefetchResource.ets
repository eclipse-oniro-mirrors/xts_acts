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
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct WebViewPrefetchResource {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State registerJavaScriptProxyFlag: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebViewPrefetchResource click").key('WebViewPrefetchResourceTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testPrefetchResource001": {
              let msg="testPrefetchResource001"
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
                await Utils.sleep(500)
                Utils.emitEvent(true, 10080)
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testPrefetchResource002": {
              let msg="testPrefetchResource002"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:"POST",formData:"a=x&b=y"});
                await Utils.sleep(500)
                Utils.emitEvent(true, 10081)
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testPrefetchResource003": {
              let msg="testPrefetchResource003"
              try {
                webView.WebviewController.prefetchResource({url:"",method:"",formData:"",});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10082)
              }
              break;
            }
            case "testPrefetchResource004": {
              let msg="testPrefetchResource004"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:"",formData:""});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10083)
              }
              break;
            }
            case "testPrefetchResource005": {
              let msg="testPrefetchResource005"
              try {
                webView.WebviewController.prefetchResource(undefined);
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10084)
              }
              break;
            }
            case "testPrefetchResource006": {
              let msg="testPrefetchResource006"
              try {
                webView.WebviewController.prefetchResource(null);
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10085)
              }
              break;
            }

            case "testPrefetchResource007": {
              let msg="testPrefetchResource007"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:"string_POST",formData:""});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10086)
              }
              break;
            }
            case "testPrefetchResource008": {
              let msg="testPrefetchResource008"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:"POST",formData:undefined});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10087)
              }
              break;
            }
            case "testPrefetchResource009": {
              let msg="testPrefetchResource009"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:null,formData:'a=x&b=y'});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10088)
              }
              break;
            }
            case "testPrefetchResource010": {
              let msg="testPrefetchResource010"
              try {
                webView.WebviewController.prefetchResource({url:"https://www.example1.com/post?e=f&g=h",method:undefined,formData:null});
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10089)
              }
              break;
            }
            case "testPrefetchResource011": {
              let msg="testPrefetchResource011"
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
                      headerValue:"application/xml",
                    },
                  ],
                  "KeyX", 500);
                await Utils.sleep(500)
                Utils.emitEvent(true, 10090)
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testPrefetchResource012": {
              let msg="testPrefetchResource012"
              try {
                webView.WebviewController.prefetchResource(
                  {url:"https://www.example1.com/post?e=f&g=h",
                    method:"GET",
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
                await Utils.sleep(500)
              } catch (error) {
                console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 10091)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

    }
  }
}
