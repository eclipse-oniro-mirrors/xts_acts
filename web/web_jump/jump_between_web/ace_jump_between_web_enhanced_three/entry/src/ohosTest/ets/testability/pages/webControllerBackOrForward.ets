/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import business_error from '@ohos.base'

@Entry
@Component
struct webControllerBackOrForwardTest {
  controller: WebController = new WebController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 121,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(121)
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
        Button('webController click').key('webControllerBackOrForwardButton').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitAccessBackwardFalse': {
              try {
                let result = this.controller.accessBackward();
                console.log(this.str + ' accessBackward result==>' + result);
                Utils.emitEvent(result, 2025102103)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessForwardFalse': {
              try {
                let result = this.controller.accessForward();
                console.log(this.str + ' accessBackward result==>' + result);
                Utils.emitEvent(result, 2025102104)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessStepFalse': {
              try {
                let result = this.controller.accessStep(1);
                console.log(this.str + ' accessStep result==>' + result);
                Utils.emitEvent(result, 2025102111)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessBackwardTrue': {
              try {
                this.controller.clearHistory();
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/index.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/second.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                let result = this.controller.accessBackward();
                console.log(this.str + ' accessBackward result==>' + result);
                Utils.emitEvent(result, 2025102105)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessForwardTrue': {
              try {
                this.controller.clearHistory();
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/index.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/second.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                this.isPageEnd = -1;
                this.controller.backward();
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                let result = this.controller.accessForward();
                console.log(this.str + ' accessBackward result==>' + result);
                Utils.emitEvent(result, 2025102106)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessStepTrue': {
              try {
                this.controller.clearHistory();
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/index.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({url:'resource://rawfile/second.html'});
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                this.isPageEnd = -1;
                this.controller.backward();
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                let result = this.controller.accessStep(1);
                console.log(this.str + ' accessStep result==>' + result);
                Utils.emitEvent(result, 2025102112)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
