/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import business_error from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver, ON, On  } from '@ohos.UiTest';
import testNapi from 'libentry.so';
import web_webview from '@ohos.web.webview'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isReceive: number = -1;
  @State scrollResult: boolean = false;
  @State isPageEnd: number = -1;
  @State str: string = "";
  webTag: string = 'ArkWeb1';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);
  scrollCallback: (result: string) => void = (result: string) => {
    console.info("test result: " + result);
    this.scrollResult = true;
  }

  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase in index!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    testNapi.nativeWebInit(this.webTag);
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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {

      Column( { space: 20 } ) {
        Button('web click')
          .key('WebViewScrollCallbackButton')
          .onClick(async () => {
            await Utils.waitForExist(() => this.isReceive, this.str, 1,500);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitWebViewScrollCallback001': {
                try {

                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://www.baidu.com')
                  testNapi.setScrollCallback(this.scrollCallback);
                  await Utils.waitForExist(() => this.isPageEnd, this.str, 1, 500);
                  this.controller.scrollTo(0, 1000);
                  setTimeout(() => {
                    Utils.emitEvent(this.scrollResult, 20251222);
                  }, 3000)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }



              case 'emitWebViewScrollCallback002': {
                try {
                  this.scrollResult = false;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('keyboardAvoid.html'));
                  await Utils.waitForExist(() => this.isPageEnd, this.str, 1, 500);
                  testNapi.setScrollCallback(this.scrollCallback);
                  this.controller.scrollTo(0, 1000)
                  setTimeout(() => {
                    Utils.emitEvent(this.scrollResult, 20251223);
                  },3000)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewNativeWebInitFalse003': {
                try {
                  this.scrollResult = false;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('keyboardAvoid.html'));
                  await Utils.waitForExist(() => this.isPageEnd, this.str, 1, 500);
                  let res1 = testNapi.nativeWebInitFalse();
                  setTimeout(() => {
                    Utils.emitEvent(res1, 20251227);
                  },3000)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewNativeWebInitTrue004': {
                try {
                  this.scrollResult = false;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('keyboardAvoid.html'));
                  await Utils.waitForExist(() => this.isPageEnd, this.str, 1, 500);
                  let res2 = testNapi.nativeWebInitTrue(this.webTag);
                  setTimeout(() => {
                    Utils.emitEvent(res2, 20251228);
                  },3000)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

            }
          })


        Row() {
          Web({ src: $rawfile('keyboardAvoid.html'), controller: this.controller })
            .javaScriptAccess(true)
            .fileAccess(true)
            .borderRadius(10)
            .onPageEnd(() => {
              this.isPageEnd = 0
            })
        }.height('20%')
      }
      .height('100%')
      .width('100%')
      .alignItems(HorizontalAlign.Center)

  }
}
