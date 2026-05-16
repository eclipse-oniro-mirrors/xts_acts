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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct WebAttributeEnhancedTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive:number = -1;
  @State isOnLoadStarted: number = -1;
  @State isOnLoadFinished: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133)
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
    Row() {
      Column() {
        Button('web click')
          .key('WebAttributeEnhancedTestButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.str, 0);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            this.isOnLoadStarted = -1;
            this.isOnLoadFinished = -1;
            switch (this.str) {
              case 'emitOnLoadStarted001': {
                try {
                  this.controller.loadUrl($rawfile('second.html'))
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isOnLoadStarted, check, 1, 2025071701, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnLoadStarted002': {
                try {
                  this.controller.loadUrl(URL);
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isOnLoadStarted, check, 1, 2025071702, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnLoadStarted003': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('anchor.html'));
                  await waitForExist(()=>this.isPageEnd, this.str, 1);
                  this.isOnLoadStarted = -1;
                  this.isOnLoadFinished = -1;
                  this.controller.runJavaScript('jumpAnchor()', (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      console.info('run JavaScript result: ==>' + result);
                    }
                  })
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForExist(()=>this.isOnLoadFinished, this.str, 1);
                  await waitForAssert(()=>this.isOnLoadStarted, check, -1, 2025071703, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnLoadFinished001': {
                try {
                  this.controller.loadUrl($rawfile('second.html'))
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isOnLoadFinished, check, 1, 2025071704, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnLoadFinished002': {
                try {
                  this.controller.loadUrl(URL);
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isOnLoadFinished, check, 1, 2025071705, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnLoadFinished003': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('anchor.html'));
                  await waitForExist(()=>this.isPageEnd, this.str, 1);
                  this.isOnLoadFinished = -1;
                  this.controller.runJavaScript('jumpAnchor()', (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      console.info('run JavaScript result: ==>' + result);
                    }
                  })
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true:false;
                  }
                  await waitForAssert(()=>this.isOnLoadFinished, check, 1, 2025071706, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .onLoadStarted((event) => {
            if (event) {
              console.log('onLoadStarted url==>' + event.url);
              if (event.url) {
                this.isOnLoadStarted = 1;
              }
            }
          })
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 1;
              console.log('onPageEnd url==>' + event.url);
            }
          })
          .onLoadFinished((event) => {
            if (event) {
              console.log('onLoadFinished url==>' + event.url);
              if (event.url) {
                this.isOnLoadFinished = 1;
              }
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}