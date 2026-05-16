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
import { waitForExist } from '../../test/WaitTest.test';

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
  @State isPageEnd: number = -1
  @State isReceive: number = -1;
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
      eventId: 147811,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(147811)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("webHostingButton").key('webHostingButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitWeb_ResourceType_MAIN_FRAME": {
              console.log("emitWeb_ResourceType_MAIN_FRAME ==>");
              let result:number = testNapi.getResourceType_MAIN_FRAME();
              console.log("emitWeb_ResourceType_MAIN_FRAME ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147860);
              } else {
                Utils.emitEvent(false, 147860);
              }
              break;
            }

            case "emitWeb_ResourceType_SUB_FRAME": {
              console.log("emitWeb_ResourceType_SUB_FRAME ==>");
              let result:number = testNapi.getResourceType_SUB_FRAME();
              console.log("emitWeb_ResourceType_SUB_FRAME ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147870);
              } else {
                Utils.emitEvent(false, 147870);
              }
              break;
            }

            case "emitWeb_ResourceType_STYLE_SHEET": {
              console.log("testWeb_ResourceType_STYLE_SHEET ==>");
              let result:number = testNapi.getResourceType_STYLE_SHEET();
              console.log("testWeb_ResourceType_STYLE_SHEET ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147880);
              } else {
                Utils.emitEvent(false, 147880);
              }
              break;
            }

            case "emitWeb_ResourceType_SCRIPT": {
              console.log("emitWeb_ResourceType_SCRIPT ==>");
              let result:number = testNapi.getResourceType_SCRIPT();
              console.log("emitWeb_ResourceType_SCRIPT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147890);
              } else {
                Utils.emitEvent(false, 147890);
              }
              break;
            }

            case "emitWeb_ResourceType_IMAGE": {
              console.log("emitWeb_ResourceType_IMAGE ==>");
              let result:number = testNapi.getResourceType_IMAGE();
              console.log("emitWeb_ResourceType_IMAGE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147900);
              } else {
                Utils.emitEvent(false, 147900);
              }
              break;
            }

            case "emitWeb_ResourceType_FONT_RESOURCE": {
              console.log("emitWeb_ResourceType_FONT_RESOURCE ==>");
              let result:number = testNapi.getResourceType_FONT_RESOURCE();
              console.log("emitWeb_ResourceType_FONT_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147910);
              } else {
                Utils.emitEvent(false, 147910);
              }
              break;
            }

            case "emitWeb_ResourceType_SUB_RESOURCE": {
              console.log("emitWeb_ResourceType_SUB_RESOURCE ==>");
              let result:number = testNapi.getResourceType_SUB_RESOURCE();
              console.log("emitWeb_ResourceType_SUB_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147920);
              } else {
                Utils.emitEvent(false, 147920);
              }
              break;
            }

            case "emitWeb_ResourceType_OBJECT": {
              console.log("emitWeb_ResourceType_OBJECT ==>");
              let result:number = testNapi.getResourceType_OBJECT();
              console.log("emitWeb_ResourceType_OBJECT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147930);
              } else {
                Utils.emitEvent(false, 147930);
              }
              break;
            }

            case "emitWeb_ResourceType_MEDIA": {
              console.log("emitWeb_ResourceType_MEDIA ==>");
              let result:number = testNapi.getResourceType_MEDIA();
              console.log("emitWeb_ResourceType_MEDIA ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147940);
              } else {
                Utils.emitEvent(false, 147940);
              }
              break;
            }

            case "emitWeb_ResourceType_WORKER": {
              console.log("emitWeb_ResourceType_WORKER ==>");
              let result:number = testNapi.getResourceType_WORKER();
              console.log("emitWeb_ResourceType_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147950);
              } else {
                Utils.emitEvent(false, 147950);
              }
              break;
            }

            case "emitWeb_ResourceType_SHARED_WORKER": {
              console.log("emitWeb_ResourceType_SHARED_WORKER ==>");
              let result:number = testNapi.getResourceType_SHARED_WORKER();
              console.log("emitWeb_ResourceType_SHARED_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147960);
              } else {
                Utils.emitEvent(false, 147960);
              }
              break;
            }

            case "emitWeb_ResourceType_PREFETCH": {
              console.log("emitWeb_ResourceType_PREFETCH ==>");
              let result:number = testNapi.getResourceType_PREFETCH();
              console.log("emitWeb_ResourceType_PREFETCH ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147970);
              } else {
                Utils.emitEvent(false, 147970);
              }
              break;
            }

            case "emitWeb_ResourceType_FAVICON": {
              console.log("emitWeb_ResourceType_FAVICON ==>");
              let result:number = testNapi.getResourceType_FAVICON();
              console.log("emitWeb_ResourceType_FAVICON ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147980);
              } else {
                Utils.emitEvent(false, 147980);
              }
              break;
            }

            case "emitWeb_ResourceType_XHR": {
              console.log("emitWeb_ResourceType_XHR ==>");
              let result:number = testNapi.getResourceType_XHR();
              console.log("emitWeb_ResourceType_XHR ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147990);
              } else {
                Utils.emitEvent(false, 147990);
              }
              break;
            }

            case "emitWeb_ResourceType_PING": {
              console.log("emitWeb_ResourceType_PING ==>");
              let result:number = testNapi.getResourceType_PING();
              console.log("emitWeb_ResourceType_PING ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148510);
              } else {
                Utils.emitEvent(false, 148510);
              }
              break;
            }

            case "emitWeb_ResourceType_SERVICE_WORKER": {
              console.log("emitWeb_ResourceType_SERVICE_WORKER ==>");
              let result:number = testNapi.getResourceType_SERVICE_WORKER();
              console.log("emitWeb_ResourceType_SERVICE_WORKER ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148520);
              } else {
                Utils.emitEvent(false, 148520);
              }
              break;
            }

            case "emitWeb_ResourceType_CSP_REPORT": {
              console.log("emitWeb_ResourceType_CSP_REPORT ==>");
              let result:number = testNapi.getResourceType_CSP_REPORT();
              console.log("emitWeb_ResourceType_CSP_REPORT ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148530);
              } else {
                Utils.emitEvent(false, 148530);
              }
              break;
            }

            case "emitWeb_ResourceType_PLUGIN_RESOURCE": {
              console.log("emitWeb_ResourceType_PLUGIN_RESOURCE ==>");
              let result:number = testNapi.getResourceType_PLUGIN_RESOURCE();
              console.log("emitWeb_ResourceType_PLUGIN_RESOURCE ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148540);
              } else {
                Utils.emitEvent(false, 148540);
              }
              break;
            }

            case "emitWeb_ResourceType_PRELOAD_MAIN": {
              console.log("emitWeb_ResourceType_PRELOAD_MAIN ==>");
              let result:number = testNapi.getResourceType_PRELOAD_MAIN();
              console.log("emitWeb_ResourceType_PRELOAD_MAIN ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148550);
              } else {
                Utils.emitEvent(false, 148550);
              }
              break;
            }

            case "emitWeb_ResourceType_PRELOAD_SUB": {
              console.log("emitWeb_ResourceType_PRELOAD_SUB ==>");
              let result:number = testNapi.getResourceType_PRELOAD_SUB();
              console.log("emitWeb_ResourceType_PRELOAD_SUB ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148560);
              } else {
                Utils.emitEvent(false, 148560);
              }
              break;
            }

            case "emitWebViewFrameUrl": {
              console.log("emitWebViewFrameUrl ==>");

              let result:number = testNapi.getFrameUrl();
              console.log("emitWebViewFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148570);
              } else {
                Utils.emitEvent(false, 148570);
              }
              break;
            }

            case "emitWebViewServiceWorkerFrameUrl": {
              console.log("emitWebViewServiceWorkerFrameUrl ==>")
              this.isPageEnd = -1;
              this.controller.loadUrl('https://www.openharmony.cn/');
              await waitForExist(()=>this.isPageEnd, this.str,0)
              await waitForExist(() => testNapi.getRequestValue(), this.str, 1, 1000);
              let result:number = testNapi.getServiceWorkerFrameUrl();
              console.log("emitWebViewServiceWorkerFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148580);
              } else {
                Utils.emitEvent(false, 148580);
              }
              break;
            }

            case "emitWebViewLoadUrlFrameUrl": {
              console.log("emitWebViewLoadUrlFrameUrl ==>");
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('schemeHandler_loader.html'));
              await waitForExist(()=>this.isPageEnd, this.str,0)
              let result:number = testNapi.getLoadUrlFrameUrl();
              console.log("emitWebViewLoadUrlFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148590);
              } else {
                Utils.emitEvent(false, 148590);
              }
              break;
            }
            case "emitWebViewSubFrameUrl": {
              console.log("emitWebViewSubFrameUrl ==>");
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('sdkSchemeHandler.html'));
              await waitForExist(()=>this.isPageEnd, this.str,0)
              let result:number = testNapi.getSubFrameUrl();
              console.log("emitWebViewSubFrameUrl ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 148600);
              } else {
                Utils.emitEvent(false, 148600);
              }
              break;
            }


          }
        })
      }
      Web({ src: $rawfile("indexPhoto.html"), controller: this.controller})
        .javaScriptAccess(true)
        .width('100%')
        .height('100%')
        .databaseAccess(true)
        .fileAccess(false)
        .domStorageAccess(true)
        .cacheMode(CacheMode.Default)
        .onPageEnd(()=>{
          this.isPageEnd = 0
        })
    }
    .height('100%')

  }

}
