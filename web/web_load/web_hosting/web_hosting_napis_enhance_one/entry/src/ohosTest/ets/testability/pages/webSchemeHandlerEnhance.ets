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
    this.isSet = testNapi.setSchemeHandler();

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

            case "emitWeb_GetNativeAPI": {
              console.log("runJavaScript testError()");
              await Utils.sleep(1000);

              this.controller.runJavaScript('testError()', (error, result)=> {
                if (error) {
                  console.info(" run JavaScript testError error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript testError return value is:" + result);
                }
              })

              await Utils.sleep(1000);
              console.log("emitWeb_GetNativeAPI ==>");
              let result:number = testNapi.getNativeAPI();
              console.log("emitWeb_GetNativeAPI ==>" + result);

              await Utils.sleep(1000);

              if (result != 0) {
                Utils.emitEvent(true, 1001);
              } else {
                Utils.emitEvent(false, 1001);
              }
              break;
            }

            case "emitWeb_ReleaseString": {
              await Utils.sleep(1000);
              console.log("emitWeb_ReleaseString ==>");

              let result:number = testNapi.releaseString();
              await Utils.sleep(1000);
              console.log("emitWeb_ReleaseString ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1002);
              } else {
                Utils.emitEvent(false, 1002);
              }
              break;
            }

            case "emitWeb_ReleaseByteArray": {
              await Utils.sleep(1000);
              console.log("emitWeb_ReleaseByteArray ==>");

              let result:number = testNapi.releaseByteArray();
              await Utils.sleep(1000);
              console.log("emitWeb_ReleaseByteArray ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1003);
              } else {
                Utils.emitEvent(false, 1003);
              }
              break;
            }

            case "emitWebResourceRequest_DestroyHttpBodyStream": {
              await Utils.sleep(1000);
              console.log("emitWebResourceRequest_DestroyHttpBodyStream ==>");

              let result:number = testNapi.destroyHttpBodyStream();
              await Utils.sleep(1000);
              console.log("emitWebResourceRequest_DestroyHttpBodyStream ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1004);
              } else {
                Utils.emitEvent(false, 1004);
              }
              break;
            }

            case "emitWebResponse_SetHeaderByName": {
              await Utils.sleep(1000);
              console.log("emitWebResponse_SetHeaderByName ==>");

              let result:number = testNapi.setHeaderByName();
              await Utils.sleep(1000);
              console.log("emitWebResponse_SetHeaderByName ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1005);
              } else {
                Utils.emitEvent(false, 1005);
              }
              break;
            }

            case "emitWeb_SchemeHandler": {
              await Utils.sleep(1000);
              console.log("emitWeb_SchemeHandler ==>");
              console.log("emitWeb_SchemeHandler ==>" + this.isSet);

              if (this.isSet == 0) {
                Utils.emitEvent(true, 1006);
              } else {
                Utils.emitEvent(false, 1006);
              }
              break;
            }

            case "emitWeb_ResourceHandler": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceHandler ==>");

              let result:number = testNapi.resourceHandler();
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceHandler ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1007);
              } else {
                Utils.emitEvent(false, 1007);
              }
              break;
            }

            case "emitWeb_Response": {
              await Utils.sleep(1000);
              console.log("emitWeb_Response ==>");

              let result:number = testNapi.response();
              await Utils.sleep(1000);
              console.log("emitWeb_Response ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1008);
              } else {
                Utils.emitEvent(false, 1008);
              }
              break;
            }

            case "emitWeb_ResourceRequest": {
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceRequest ==>");

              let result:number = testNapi.resourceRequest();
              await Utils.sleep(1000);
              console.log("emitWeb_ResourceRequest ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1009);
              } else {
                Utils.emitEvent(false, 1009);
              }
              break;
            }

            case "emitWeb_RequestHeaderList": {
              await Utils.sleep(1000);
              console.log("emitWeb_RequestHeaderList ==>");

              let result:number = testNapi.requestHeaderList();
              await Utils.sleep(1000);
              console.log("emitWeb_RequestHeaderList ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1010);
              } else {
                Utils.emitEvent(false, 1010);
              }
              break;
            }

            case "emitWeb_HttpBodyStream": {
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStream ==>");

              let result:number = testNapi.httpBodyStream();
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStream ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1011);
              } else {
                Utils.emitEvent(false, 1011);
              }
              break;
            }

            case "emitWeb_HttpBodyStreamInitCallback": {
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStreamInitCallback ==>");

              let result:number = testNapi.httpBodyStreamInitCallback();
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStreamInitCallback ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1012);
              } else {
                Utils.emitEvent(false, 1012);
              }
              break;
            }

            case "emitWeb_HttpBodyStreamReadCallback": {
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStreamReadCallback ==>");

              let result:number = testNapi.httpBodyStreamReadCallback();
              await Utils.sleep(1000);
              console.log("emitWeb_HttpBodyStreamReadCallback ==>" + result);

              if (result == 0) {
                Utils.emitEvent(true, 1013);
              } else {
                Utils.emitEvent(false, 1013);
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
    }
    .height('100%')

  }

}
