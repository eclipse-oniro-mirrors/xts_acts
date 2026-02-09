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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

let driver = Driver.create();
@Entry
@Component
struct webOnBeforeUnload {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isReload: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141411,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141411)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webOnBeforeUnload click')
          .key('WebOnBeforeUnloadButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            this.isReload = -1;
            switch (this.emitKey) {
              case 'emitOnBeforeUnloadIsReloadTrue': {
                try {
                  await Utils.waitAndClickComponent('onBeforeUnloadWebView',driver);
                  this.controller.runJavaScript('myRefresh()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                    }
                  })
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isReload, check, 1, 141460, this.emitKey);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(true, 141460);
                  }
                }
                break;
              }
              case 'emitOnBeforeUnloadIsReloadFalse': {
                try {
                  await Utils.waitAndClickComponent('onBeforeUnloadWebView',driver);
                  this.controller.runJavaScript('myNewPage()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                    }
                  })
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isReload, check, 2, 141470, this.emitKey);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(false, 141470);
                  }
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('onBeforeUnload.html'), controller: this.controller })
        .key('onBeforeUnloadWebView')
        .onPageEnd((event) => {
          if (event) {
            console.log('onBeforeUnload onPageEnd url:' + event.url);
            this.isPageEnd = 0;
          }
        })
        .onBeforeUnload((event) => {
          if (event) {
            console.log('onBeforeUnload isReload==>' + event.isReload);
            if (event.isReload === true) {
              this.isReload = 1;
            }
            if (event.isReload === false) {
              this.isReload = 2;
            }
            event.result.handleConfirm();
          }
          return true
        })
        .width('100%')
        .height('100%')
    }
  }
}
