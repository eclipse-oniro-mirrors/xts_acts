/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import webview from '@ohos.web.webview';
import testNapi from 'libentry.so'
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct setBlanklessLoadingCacheCapacityTest {
  @State webTag: string = 'WebTag';
  controller: webView.WebviewController = new webView.WebviewController(this.webTag);
  newController: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148201,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148201)
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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info('ets toString:' + String(res));
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      return 'precompileJavaScript test';
    }
  }

  build() {
    Column() {
      Row() {
        Button('setBlanklessLoadingCacheCapacityTest click')
          .key('setBlanklessLoadingCacheCapacityTestButton')
          .onClick(async () => {
            console.info('key==>' + this.str)
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            switch (this.str) {
              case 'testsetBlanklessLoadingCacheCapacity001': {
                let msg = 'testsetBlanklessLoadingCacheCapacity001'
                try {
                  let cacheCapacity = webview.WebviewController.setBlanklessLoadingCacheCapacity(-1);
                  console.log(msg, `入参:-1`,`预期值：0`,`实际值${cacheCapacity}`);
                  console.log(msg, 'cacheCapacity:' + cacheCapacity)
                  Utils.emitEvent(cacheCapacity, 148210)
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) === 801) {
                    Utils.emitEvent(0, 148210)
                  } else {
                    Utils.emitEvent(401, 148210)
                  }
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity002': {
                let msg = 'testsetBlanklessLoadingCacheCapacity002'
                try {
                  let cacheCapacity = webview.WebviewController.setBlanklessLoadingCacheCapacity(0);
                  console.log(msg, `入参:0`,`预期值：0`,`实际值${cacheCapacity}`);
                  console.log(msg, 'cacheCapacity:' + cacheCapacity)
                  Utils.emitEvent(cacheCapacity, 148220)
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148220)
                  } else {
                    Utils.emitEvent(401, 148220)
                  }
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity003': {
                let msg = 'testsetBlanklessLoadingCacheCapacity003'
                try {
                  let cacheCapacity = webview.WebviewController.setBlanklessLoadingCacheCapacity(50);
                  console.log(msg, `入参:50`,`预期值：50`,`实际值${cacheCapacity}`);
                  console.log(msg, 'CacheCapacity:' + cacheCapacity)
                  Utils.emitEvent(cacheCapacity, 148230)
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(50, 148230)
                  } else {
                    Utils.emitEvent(401, 148230)
                  }
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity004': {
                let msg = 'testsetBlanklessLoadingCacheCapacity004'
                try {
                  let cacheCapacity = webview.WebviewController.setBlanklessLoadingCacheCapacity(101);
                  console.log(msg, `入参:101`,`预期值：100`,`实际值${cacheCapacity}`);
                  console.log(msg, 'cacheCapacity:' + cacheCapacity)
                  Utils.emitEvent(cacheCapacity, 148240)
                } catch (error) {
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(100, 148240)
                  } else {
                    Utils.emitEvent(401, 148240)
                  }
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity005': {
                let msg = 'testsetBlanklessLoadingCacheCapacity005'
                try {
                  let cacheCapacity = webview.WebviewController.setBlanklessLoadingCacheCapacity(null);
                } catch (error) {
                  console.log(msg, `入参:null`,`预期值：401`,`实际值${error.code}`);
                  Utils.emitEvent(401, 148250)
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity006': {
                let msg = 'testsetBlanklessLoadingCacheCapacity006'
                try {
                  let cacheCapacity: number = testNapi.setCacheCapacity_1(this.webTag)
                  console.log(msg, `入参:-1`,`预期值：100`,`实际值${cacheCapacity}`);
                  console.log(msg, 'CacheCapacity:' + cacheCapacity)
                  if (cacheCapacity == 0) {
                    Utils.emitEvent(100, 148260)
                  } else {
                    Utils.emitEvent(cacheCapacity, 148260)
                  }
                } catch (error) {
                  console.error(`${msg} ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity007': {
                let msg = 'testsetBlanklessLoadingCacheCapacity007'
                let cacheCapacity: number = testNapi.setCacheCapacity0(this.webTag)
                console.log(msg, `入参:0`,`预期值：0`,`实际值${cacheCapacity}`);
                Utils.emitEvent(cacheCapacity, 148270)
                console.log(msg, 'CacheCapacity:' + cacheCapacity)
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity008': {
                let msg = 'testsetBlanklessLoadingCacheCapacity008'
                let cacheCapacity: number = testNapi.setCacheCapacity50(this.webTag)
                console.log(msg, `入参:-50`,`预期值：50`,`实际值${cacheCapacity}`);
                console.log(msg, 'CacheCapacity:' + cacheCapacity)
                if (cacheCapacity == 0) {
                  Utils.emitEvent(50, 148280)
                } else {
                  Utils.emitEvent(cacheCapacity, 148280)
                }
                break;
              }
              case 'testsetBlanklessLoadingCacheCapacity009': {
                let msg = 'testsetBlanklessLoadingCacheCapacity009'
                let cacheCapacity: number = testNapi.setCacheCapacity101(this.webTag)
                console.log(msg, `入参:101`,`预期值：100`,`实际值${cacheCapacity}`);
                console.log(msg, 'CacheCapacity:' + cacheCapacity)
                if (cacheCapacity == 0) {
                  Utils.emitEvent(100, 148290)
                } else {
                  Utils.emitEvent(cacheCapacity, 148290)
                }
                break;
              }
            }
          })
      }

      Web({ src: $rawfile('indexPhoto.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd(() => {
          this.isPageEnd = 0
        })
    }
  }
}
