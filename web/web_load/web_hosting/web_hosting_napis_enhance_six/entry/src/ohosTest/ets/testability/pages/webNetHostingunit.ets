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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { URL_BAIDU_HTTPS } from '../../test/Config.test';

@Entry
@Component
struct webRegisterCustomsComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController('scheme-handler');
  @State str: string = ''
  @State interceptUrl: string = ''
  heads: Header[] = new Array()
  @State consoleCorsError: boolean = false
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State consoleMsg: string = ''
  @State isRegister: number = -1;
  @State isSet: number = -1;
  @State isComplete: number = -1;
  @State isEnd:number = -1;
  @State isReceive: number = -1;

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    console.error('aboutToAppear registerCustomSchemes')
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler();
    console.error('aboutToAppear setSchemeHandler' + this.isSet)
    console.error('aboutToAppear registerCustomSchemes End')

    testNapi.initResourceManager(getContext().resourceManager);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147701,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(147701)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webHostingButton').key('webHostingButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isComplete, this.str, 0);
          console.info('key==>' + this.str)
          this.isEnd = -1;
          this.controller.runJavaScript('test()', (error, result) => {
            if (error) {
              console.info(' run JavaScript error:' + JSON.stringify(error));
              return;
            }
            if (result) {
              this.isEnd = 0
              console.info(' run JavaScript return value is:' + result);
            }
          })
          await waitForExist(() => this.isEnd, this.str, 0, 1000)
          switch (this.str) {
            case 'emitWebHttpBodyStream_IsEof': {
              await waitForExist(()=>this.isComplete, this.str,0)
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_IsEof ==>');
              let result: number = testNapi.httpBodyStreamIsEof();
              if (result == 0) {
                Utils.emitEvent(true, 147740);
              } else {
                Utils.emitEvent(false, 147740);
              }
              break;
            }
            case 'emitWebHttpBodyStream_IsChunked': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_IsChunked ==>');
              let result: number = testNapi.httpBodyStreamIsChunked();
              if (result == 0) {
                Utils.emitEvent(true, 147750);
              } else {
                Utils.emitEvent(false, 147750);
              }
              break;
            }
            case 'emitWebHttpBodyStream_IsInMemory': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_IsInMemory ==>');
              let result: number = testNapi.httpBodyStreamIsInMemory();
              console.log('emitWebHttpBodyStream_IsInMemory ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147760);
              } else {
                Utils.emitEvent(false, 147760);
              }
              break;
            }
            case 'emitWebHttpBodyStream_GetPosition': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_GetPosition ==>');
              let result: number = testNapi.httpBodyStreamGetPosition();
              console.log('emitWebHttpBodyStream_GetPosition ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147770);
              } else {
                Utils.emitEvent(false, 147770);
              }
              break;
            }
            case 'emitWebHttpBodyStream_GetSize': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_GetSize ==>');
              let result: number = testNapi.httpBodyStreamGetSize();
              console.log('emitWebHttpBodyStream_GetSize ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147780);
              } else {
                Utils.emitEvent(false, 147780);
              }
              break;
            }
            case 'emitWebHttpBodyStream_SetReadCallback': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_SetReadCallback ==>');
              let result: number = testNapi.httpBodyStreamSetReadCallBack();
              console.log('emitWebHttpBodyStream_SetReadCallback ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147790);
              } else {
                Utils.emitEvent(false, 147790);
              }
              break;
            }
            case 'emitWebHttpBodyStream_SetUserData': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_SetUserData ==>');
              let result: number = testNapi.httpBodyStreamSetUserData();
              console.log('emitWebHttpBodyStream_SetUserData ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147800);
              } else {
                Utils.emitEvent(false, 147800);
              }
              break;
            }
            case 'emitWebHttpBodyStream_Init': {
              console.log('runJavaScript test()');
              console.log('emitWebHttpBodyStream_Init ==>');
              let result: number = testNapi.httpBodyStreamInit();
              console.log('emitWebHttpBodyStream_Init ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147810);
              } else {
                Utils.emitEvent(false, 147810);
              }
              break;
            }
            case 'emitWebResourceHandler_Destroy': {
              console.log('runJavaScript test()');
              console.log('emitWebResourceHandler_Destroy ==>');
              let result: number = testNapi.resourceHandlerDestroy();
              console.log('emitWebResourceHandler_Destroy ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147820);
              } else {
                Utils.emitEvent(false, 147820);
              }
              break;
            }
            case 'emitWebResourceHandler_DidReceiveResponse': {
              console.log('runJavaScript test()');
              console.log('emitWebResourceHandler_DidReceiveResponse ==>');
              let result: number = testNapi.resourceHandlerDidReceiveResponse();
              console.log('emitWebResourceHandler_DidReceiveResponse ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147830);
              } else {
                Utils.emitEvent(false, 147830);
              }
              break;
            }
            case 'emitWebResourceHandler_DidReceiveData': {
              console.log('runJavaScript test()');
              console.log('emitWebResourceHandler_DidReceiveData ==>');
              let result: number = testNapi.resourceHandlerDidReceiveData();
              console.log('emitWebResourceHandler_DidReceiveData ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147840);
              } else {
                Utils.emitEvent(false, 147840);
              }
              break;
            }
            case 'emitWebResourceHandler_DidFinish': {
              console.log('runJavaScript test()');
              console.log('emitWebResourceHandler_DidFinish ==>');
              let result: number = testNapi.resourceHandlerDidFinish();
              console.log('emitWebResourceHandler_DidFinish ==>' + result);
              if (result == 0) {
                Utils.emitEvent(true, 147850);
              } else {
                Utils.emitEvent(false, 147850);
              }
              break;
            }
            case 'testWebResourceRequest_IsMainFrame_True': {
              this.controller.loadUrl(URL_BAIDU_HTTPS+'/iframe1.html')
              await waitForExist(() => testNapi.arkWebResourceRequestIsMainFrameReturnTrue(), 'testWebResourceRequest_IsMainFrame', 1, 1000)
              let result: number = testNapi.arkWebResourceRequestIsMainFrameReturnTrue();
              console.log('arkWebResourceRequestIsMainFrameReturnTrue ==>' + String(result));
              if (result == 1) {
                Utils.emitEvent(true, 147860);
              } else {
                Utils.emitEvent(false, 147860);
              }
              break;
            }
            case 'testArkWebHttpBodyStream_IsInMemory_True': {
              this.isComplete = -1
              this.controller.loadUrl(URL_BAIDU_HTTPS+'/InMemory.html')
              await waitForExist(() => this.isComplete, 'testArkWebHttpBodyStream_IsInMemory_isPageEnd', 0, 1000)
              this.isEnd = -1;
              this.controller.runJavaScript('testInMemory()', (error, result) => {
                if (error) {
                  console.info(' run JavaScript error:' + JSON.stringify(error));
                  return;
                }
                if (result) {
                  this.isEnd = 0
                  console.info(' run JavaScript return value is:' + result);
                }
              })
              await waitForExist(() => this.isEnd, 'testArkWebHttpBodyStream_IsInMemory_js', 0, 1000)
              await waitForExist(() => testNapi.arkWebHttpBodyStreamIsInMemoryTrue(), 'arkWebHttpBodyStreamIsInMemoryTrue', 1, 1000)
              let result: number = testNapi.arkWebHttpBodyStreamIsInMemoryTrue();
              console.log('arkWebHttpBodyStreamIsInMemoryTrue ==>' + String(result));
              Utils.emitEvent(result, 147870);
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('chunked_post_stream.html'), controller: this.controller })
        .javaScriptAccess(true)
        .width('100%')
        .height('100%')
        .databaseAccess(true)
        .fileAccess(false)
        .domStorageAccess(true)
        .cacheMode(CacheMode.Default)
        .onPageBegin((event) => {
            console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
            console.log('onPageEnd ==>' + event.url);
            this.isComplete = 0
        })
    }
    .height('100%')
  }
}
