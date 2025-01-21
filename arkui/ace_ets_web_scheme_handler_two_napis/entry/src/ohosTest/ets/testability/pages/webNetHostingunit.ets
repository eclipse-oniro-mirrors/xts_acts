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

import web_webview from '@ohos.web.webview'
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testNapi from 'libentry.so';
// import { JSON } from '@kit.ArkTS'

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
            case "emitWebHttpBodyStream_IsEof": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(4000);
              console.log("emitWebHttpBodyStream_IsEof ==>");
              let result: number = testNapi.httpBodyStreamIsEof();
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7743);
              } else {
                Utils.emitEvent(false, 7743);
              }
              break;
            }
            case "emitWebHttpBodyStream_IsChunked": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_IsChunked ==>");
              let result: number = testNapi.httpBodyStreamIsChunked();
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7744);
              } else {
                Utils.emitEvent(false, 7744);
              }
              break;
            }
            case "emitWebHttpBodyStream_IsInMemory": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_IsInMemory ==>");
              let result: number = testNapi.httpBodyStreamIsInMemory();
              console.log("emitWebHttpBodyStream_IsInMemory ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7745);
              } else {
                Utils.emitEvent(false, 7745);
              }
              break;
            }
            case "emitWebHttpBodyStream_GetPosition": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_GetPosition ==>");
              let result: number = testNapi.httpBodyStreamGetPosition();
              console.log("emitWebHttpBodyStream_GetPosition ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7746);
              } else {
                Utils.emitEvent(false, 7746);
              }
              break;
            }
            case "emitWebHttpBodyStream_GetSize": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_GetSize ==>");
              let result: number = testNapi.httpBodyStreamGetSize();
              console.log("emitWebHttpBodyStream_GetSize ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7747);
              } else {
                Utils.emitEvent(false, 7747);
              }
              break;
            }
            case "emitWebHttpBodyStream_SetReadCallback": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_SetReadCallback ==>");
              let result: number = testNapi.httpBodyStreamSetReadCallBack();
              console.log("emitWebHttpBodyStream_SetReadCallback ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7748);
              } else {
                Utils.emitEvent(false, 7748);
              }
              break;
            }
            case "emitWebHttpBodyStream_SetUserData": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_SetUserData ==>");
              let result: number = testNapi.httpBodyStreamSetUserData();
              console.log("emitWebHttpBodyStream_SetUserData ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7749);
              } else {
                Utils.emitEvent(false, 7749);
              }
              break;
            }
            case "emitWebHttpBodyStream_Init": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebHttpBodyStream_Init ==>");
              let result: number = testNapi.httpBodyStreamInit();
              console.log("emitWebHttpBodyStream_Init ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7750);
              } else {
                Utils.emitEvent(false, 7750);
              }
              break;
            }
            case "emitWebResourceHandler_Destroy": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebResourceHandler_Destroy ==>");
              let result: number = testNapi.resourceHandlerDestroy();
              console.log("emitWebResourceHandler_Destroy ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7751);
              } else {
                Utils.emitEvent(false, 7751);
              }
              break;
            }
            case "emitWebResourceHandler_DidReceiveResponse": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebResourceHandler_DidReceiveResponse ==>");
              let result: number = testNapi.resourceHandlerDidReceiveResponse();
              console.log("emitWebResourceHandler_DidReceiveResponse ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7752);
              } else {
                Utils.emitEvent(false, 7752);
              }
              break;
            }
            case "emitWebResourceHandler_DidReceiveData": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebResourceHandler_DidReceiveData ==>");
              let result: number = testNapi.resourceHandlerDidReceiveData();
              console.log("emitWebResourceHandler_DidReceiveData ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7753);
              } else {
                Utils.emitEvent(false, 7753);
              }
              break;
            }
            case "emitWebResourceHandler_DidFinish": {
              console.log("runJavaScript test()");
              this.controller.runJavaScript('test()', (error, result) => {
                if (error) {
                  console.info(" run JavaScript error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript return value is:" + result);
                }
              })
              await Utils.sleep(1000);
              console.log("emitWebResourceHandler_DidFinish ==>");
              let result: number = testNapi.resourceHandlerDidFinish();
              console.log("emitWebResourceHandler_DidFinish ==>" + result);
              await Utils.sleep(1000);
              if (result == 0) {
                Utils.emitEvent(true, 7754);
              } else {
                Utils.emitEvent(false, 7754);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("chunked_post_stream.html"), controller: this.controller })
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
