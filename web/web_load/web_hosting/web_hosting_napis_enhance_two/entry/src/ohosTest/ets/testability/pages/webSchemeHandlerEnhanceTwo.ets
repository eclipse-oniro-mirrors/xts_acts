/**
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
import web_webview from '@ohos.web.webview'
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';


import testNapi from 'libentry.so';

@Entry
@Component
struct webRegisterCustomsComponent {

  controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
  @State str: string = ""
  @State interceptUrl: string = ''
  heads: Header[] = new Array()
  @State consoleCorsError: boolean = false
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State consoleMsg: string = ''
  @State isRegister: number = -1;
  @State isSet: number = -1;

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()

    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

    console.error("aboutToAppear registerCustomSchemes")
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler();

    console.error("aboutToAppear setSchemeHandler" + this.isSet)
    console.error("aboutToAppear registerCustomSchemes End")
    
    testNapi.initResourceManager(getContext().resourceManager);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("webHostingButton").key('webHostingButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitWeb_ResourceType_MAIN_FRAME": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_MAIN_FRAME ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_MAIN_FRAME();
              console.log("emitWeb_ResourceType_MAIN_FRAME ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1001);
              } else {
                Utils.emitEvent(false, 1001);
              }
              break;
            }

            case "emitWeb_ResourceType_SUB_FRAME": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_SUB_FRAME ==>");
              this.controller.loadUrl("https://www.iqiyi.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_SUB_FRAME();
              console.log("emitWeb_ResourceType_SUB_FRAME ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1002);
              } else {
                Utils.emitEvent(false, 1002);
              }
              break;
            }

            case "emitWeb_ResourceType_STYLE_SHEET": {
              await Utils.sleep(1000);
              console.log("testWeb_ResourceType_STYLE_SHEET ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_STYLE_SHEET();
              console.log("testWeb_ResourceType_STYLE_SHEET ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1003);
              } else {
                Utils.emitEvent(false, 1003);
              }
              break;
            }

            case "emitWeb_ResourceType_SCRIPT": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_SCRIPT ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_SCRIPT();
              console.log("emitWeb_ResourceType_SCRIPT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1004);
              } else {
                Utils.emitEvent(false, 1004);
              }
              break;
            }

            case "emitWeb_ResourceType_IMAGE": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_IMAGE ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_IMAGE();
              console.log("emitWeb_ResourceType_IMAGE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1005);
              } else {
                Utils.emitEvent(false, 1005);
              }
              break;
            }

            case "emitWeb_ResourceType_FONT_RESOURCE": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_FONT_RESOURCE ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_FONT_RESOURCE();
              console.log("emitWeb_ResourceType_FONT_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1006);
              } else {
                Utils.emitEvent(false, 1006);
              }
              break;
            }

            case "emitWeb_ResourceType_SUB_RESOURCE": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_SUB_RESOURCE ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_SUB_RESOURCE();
              console.log("emitWeb_ResourceType_SUB_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1007);
              } else {
                Utils.emitEvent(false, 1007);
              }
              break;
            }

            case "emitWeb_ResourceType_OBJECT": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_OBJECT ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_OBJECT();
              console.log("emitWeb_ResourceType_OBJECT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1008);
              } else {
                Utils.emitEvent(false, 1008);
              }
              break;
            }

            case "emitWeb_ResourceType_MEDIA": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_MEDIA ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_MEDIA();
              console.log("emitWeb_ResourceType_MEDIA ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1009);
              } else {
                Utils.emitEvent(false, 1009);
              }
              break;
            }

            case "emitWeb_ResourceType_WORKER": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_WORKER ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_WORKER();
              console.log("emitWeb_ResourceType_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1010);
              } else {
                Utils.emitEvent(false, 1010);
              }
              break;
            }

            case "emitWeb_ResourceType_SHARED_WORKER": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_SHARED_WORKER ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_SHARED_WORKER();
              console.log("emitWeb_ResourceType_SHARED_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1011);
              } else {
                Utils.emitEvent(false, 1011);
              }
              break;
            }

            case "emitWeb_ResourceType_PREFETCH": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_PREFETCH ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_PREFETCH();
              console.log("emitWeb_ResourceType_PREFETCH ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1012);
              } else {
                Utils.emitEvent(false, 1012);
              }
              break;
            }

            case "emitWeb_ResourceType_FAVICON": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_FAVICON ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_FAVICON();
              console.log("emitWeb_ResourceType_FAVICON ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1013);
              } else {
                Utils.emitEvent(false, 1013);
              }
              break;
            }

            case "emitWeb_ResourceType_XHR": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_XHR ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_XHR();
              console.log("emitWeb_ResourceType_XHR ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1014);
              } else {
                Utils.emitEvent(false, 1014);
              }
              break;
            }

            case "emitWeb_ResourceType_PING": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_PING ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_PING();
              console.log("emitWeb_ResourceType_PING ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1015);
              } else {
                Utils.emitEvent(false, 1015);
              }
              break;
            }

            case "emitWeb_ResourceType_SERVICE_WORKER": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_SERVICE_WORKER ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_SERVICE_WORKER();
              console.log("emitWeb_ResourceType_SERVICE_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1016);
              } else {
                Utils.emitEvent(false, 1016);
              }
              break;
            }

            case "emitWeb_ResourceType_CSP_REPORT": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_CSP_REPORT ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_CSP_REPORT();
              console.log("emitWeb_ResourceType_CSP_REPORT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1017);
              } else {
                Utils.emitEvent(false, 1017);
              }
              break;
            }

            case "emitWeb_ResourceType_PLUGIN_RESOURCE": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_PLUGIN_RESOURCE ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_PLUGIN_RESOURCE();
              console.log("emitWeb_ResourceType_PLUGIN_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1018);
              } else {
                Utils.emitEvent(false, 1018);
              }
              break;
            }

            case "emitWeb_ResourceType_PRELOAD_MAIN": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_PRELOAD_MAIN ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_PRELOAD_MAIN();
              console.log("emitWeb_ResourceType_PRELOAD_MAIN ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1019);
              } else {
                Utils.emitEvent(false, 1019);
              }
              break;
            }

            case "emitWeb_ResourceType_PRELOAD_SUB": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceType_PRELOAD_SUB ==>");
              this.controller.loadUrl("https://www.bilibili.com/");

              await Utils.sleep(1000);
              let result:number = testNapi.getResourceType_PRELOAD_SUB();
              console.log("emitWeb_ResourceType_PRELOAD_SUB ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1020);
              } else {
                Utils.emitEvent(false, 1020);
              }
              break;
            }

            case "emitWebViewFrameUrl": {
              await Utils.sleep(1000);
              console.log("emitWebViewFrameUrl ==>");

              await Utils.sleep(1000);
              let result:number = testNapi.getFrameUrl();
              console.log("emitWebViewFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1021);
              } else {
                Utils.emitEvent(false, 1021);
              }
              break;
            }

            case "emitWebViewServiceWorkerFrameUrl": {
              await Utils.sleep(1000);
              console.log("emitWebViewServiceWorkerFrameUrl ==>");
              this.controller.loadUrl("https://m.iqiyi.com/");

              await Utils.sleep(3000);
              let result:number = testNapi.getServiceWorkerFrameUrl();
              console.log("emitWebViewServiceWorkerFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1022);
              } else {
                Utils.emitEvent(false, 1022);
              }
              break;
            }

            case "emitWebViewLoadUrlFrameUrl": {
              await Utils.sleep(1000);
              console.log("emitWebViewLoadUrlFrameUrl ==>");
              this.controller.loadUrl($rawfile('schemeHandler_loader.html'));

              await Utils.sleep(3000);
              let result:number = testNapi.getLoadUrlFrameUrl();
              console.log("emitWebViewLoadUrlFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1023);
              } else {
                Utils.emitEvent(false, 1023);
              }
              break;
            }
            case "emitWebViewSubFrameUrl": {
              await Utils.sleep(1000);
              console.log("emitWebViewSubFrameUrl ==>");
              this.controller.loadUrl($rawfile('sdkSchemeHandler.html'));

              await Utils.sleep(3000);
              let result:number = testNapi.getSubFrameUrl();
              console.log("emitWebViewSubFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1024);
              } else {
                Utils.emitEvent(false, 1024);
              }
              break;
            }


          }
        })
      }
      Web({ src: "https://www.baidu.com/", controller: this.controller})
        .javaScriptAccess(true)
        .width('100%')
        .height('100%')
        .databaseAccess(true)
        .fileAccess(false)
        .domStorageAccess(true)
        .cacheMode(CacheMode.Default)
    }
    .height('100%')

  }

}
