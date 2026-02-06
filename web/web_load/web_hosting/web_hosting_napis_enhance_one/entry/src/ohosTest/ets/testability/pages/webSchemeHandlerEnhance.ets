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
  @State isReceive:number = -1;
  @State isEnd: number = -1;
  @State isPageEnd: number = -1
  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()

    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

    console.error("aboutToAppear registerCustomSchemes")
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    this.isSet = testNapi.setSchemeHandler();

    console.error("aboutToAppear setSchemeHandler" + this.isSet)
    console.error("aboutToAppear registerCustomSchemes End")

    testNapi.initResourceManager(getContext().resourceManager);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147411,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(147411)
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
          console.info("key==>" + this.str)
          await waitForExist(() => this.isReceive, this.str, 0)
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          this.isReceive = -1;
          this.controller.runJavaScript('testError()', (error, result) => {
            if (error) {
              console.info(" run JavaScript testError error:" + JSON.stringify(error));
              return;
            }
            if (result) {

              console.info(" run JavaScript testError return value is:" + result);
              this.isEnd = 0;
            }
          })
          await waitForExist(() => this.isEnd, this.str, 0, 1000)
          this.isEnd = -1;
          switch (this.str) {
            case "emitWeb_GetNativeAPI": {
              console.log("runJavaScript testError()");
              console.log("emitWeb_GetNativeAPI ==>");
              let result:number = testNapi.getNativeAPI();
              console.log("emitWeb_GetNativeAPI ==>" + result);
              if (result != 0) {
                Utils.emitEvent(true, 147420);
              } else {
                Utils.emitEvent(false, 147420);
              }
              break;
            }

            case "emitWeb_ReleaseString": {
              console.log("emitWeb_ReleaseString ==>");

              let result:number = testNapi.releaseString();
              console.log("emitWeb_ReleaseString ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147430);
              } else {
                Utils.emitEvent(false, 147430);
              }
              break;
            }

            case "emitWeb_ReleaseByteArray": {
              console.log("emitWeb_ReleaseByteArray ==>");

              let result:number = testNapi.releaseByteArray();
              await Utils.sleep(1000);
              console.log("emitWeb_ReleaseByteArray ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147440);
              } else {
                Utils.emitEvent(false, 147440);
              }
              break;
            }

            case "emitWebResourceRequest_DestroyHttpBodyStream": {
              console.log("emitWebResourceRequest_DestroyHttpBodyStream ==>");

              let result:number = testNapi.destroyHttpBodyStream();
              console.log("emitWebResourceRequest_DestroyHttpBodyStream ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147450);
              } else {
                Utils.emitEvent(false, 147450);
              }
              break;
            }

            case "emitWebResponse_SetHeaderByName": {
              console.log("emitWebResponse_SetHeaderByName ==>");

              let result:number = testNapi.setHeaderByName();
              console.log("emitWebResponse_SetHeaderByName ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147460);
              } else {
                Utils.emitEvent(false, 147460);
              }
              break;
            }

            case "emitWeb_SchemeHandler": {
              console.log("emitWeb_SchemeHandler ==>");
              console.log("emitWeb_SchemeHandler ==>" + this.isSet);

              if (this.isSet == 0) {
                Utils.emitEvent(true, 147470);
              } else {
                Utils.emitEvent(false, 147470);
              }
              break;
            }

            case "emitWeb_ResourceHandler": {
              console.log("emitWeb_ResourceHandler ==>");

              let result:number = testNapi.resourceHandler();
              console.log("emitWeb_ResourceHandler ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147480);
              } else {
                Utils.emitEvent(false, 147480);
              }
              break;
            }

            case "emitWeb_Response": {
              console.log("emitWeb_Response ==>");

              let result:number = testNapi.response();
              console.log("emitWeb_Response ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147490);
              } else {
                Utils.emitEvent(false, 147490);
              }
              break;
            }

            case "emitWeb_ResourceRequest": {
              console.log("emitWeb_ResourceRequest ==>");

              let result:number = testNapi.resourceRequest();
              console.log("emitWeb_ResourceRequest ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147500);
              } else {
                Utils.emitEvent(false, 147500);
              }
              break;
            }

            case "emitWeb_RequestHeaderList": {
              console.log("emitWeb_RequestHeaderList ==>");

              let result:number = testNapi.requestHeaderList();
              console.log("emitWeb_RequestHeaderList ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147510);
              } else {
                Utils.emitEvent(false, 147510);
              }
              break;
            }

            case "emitWeb_HttpBodyStream": {
              console.log("emitWeb_HttpBodyStream ==>");

              let result:number = testNapi.httpBodyStream();
              console.log("emitWeb_HttpBodyStream ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147520);
              } else {
                Utils.emitEvent(false, 147520);
              }
              break;
            }

            case "emitWeb_HttpBodyStreamInitCallback": {
              console.log("emitWeb_HttpBodyStreamInitCallback ==>");

              let result:number = testNapi.httpBodyStreamInitCallback();
              console.log("emitWeb_HttpBodyStreamInitCallback ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147530);
              } else {
                Utils.emitEvent(false, 147530);
              }
              break;
            }

            case "emitWeb_HttpBodyStreamReadCallback": {
              console.log("emitWeb_HttpBodyStreamReadCallback ==>");

              let result:number = testNapi.httpBodyStreamReadCallback();
              console.log("emitWeb_HttpBodyStreamReadCallback ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 147540);
              } else {
                Utils.emitEvent(false, 147540);
              }
              break;
            }
          }
        })
      }
      Web({ src: $rawfile("chunked_post_stream.html"), controller: this.controller})
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
