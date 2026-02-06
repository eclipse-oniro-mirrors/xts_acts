/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import { waitForExist } from '../../test/WaitTest.test';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 171220,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  onPageHide() {
    events_emitter.off(171220)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('web click').key('runJavaScriptPromiseErrorCodeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive =-1;
          switch (this.str) {
            case 'emitRunJavaScriptPromiseErrorCode001': {
              try {
                this.controller.runJavaScript(null)
                  .then((result) => {
                    console.log('result: ' + result);
                  })
                  .catch((error:BusinessError) => {
                    console.error('error: ' + error);
                  })
              } catch (error) {
                console.error(this.str + `ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code),171230);
              }
              break;
            }
            case 'emitRunJavaScriptCallbackErrorCode001': {
              try {
                this.controller.runJavaScript(
                  null,
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      console.info('The test() return value is: result');
                    }
                  });
              } catch (error) {
                console.error(this.str + `ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code),171240);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isPageEnd = 0
        })
    }
  }
}
