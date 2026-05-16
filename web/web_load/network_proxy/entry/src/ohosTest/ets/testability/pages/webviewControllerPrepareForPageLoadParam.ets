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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 173000,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(173000)
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
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .height('80%')
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
      
      Row() {
        Button('webviewControllerPrepareForPageLoadParam').key('webviewControllerPrepareForPageLoadParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitPrepareForPageLoadNullUrl001': {
              try {
                console.info('test prepareForPageLoad with null url');
                webView.WebviewController.prepareForPageLoad(null, true, 3);
                Utils.emitEvent('success', 173010);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173010);
              }
              break;
            }
            case 'emitPrepareForPageLoadUndefinedUrl001': {
              try {
                console.info('test prepareForPageLoad with undefined url');
                webView.WebviewController.prepareForPageLoad(undefined, true, 3);
                Utils.emitEvent('success', 173020);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173020);
              }
              break;
            }
            case 'emitPrepareForPageLoadEmptyStringUrl001': {
              try {
                console.info('test prepareForPageLoad with empty string url');
                webView.WebviewController.prepareForPageLoad('', true, 3);
                Utils.emitEvent('success', 173030);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173030);
              }
              break;
            }
            case 'emitPrepareForPageLoadPreconnectableFalse001': {
              try {
                console.info('test prepareForPageLoad with preconnectable false');
                webView.WebviewController.prepareForPageLoad('htt' + 'ps://www.example.com', false, 3);
                Utils.emitEvent('success', 173040);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173040);
              }
              break;
            }
            case 'emitPrepareForPageLoadNumSocketsNull001': {
              try {
                console.info('test prepareForPageLoad with null numSockets');
                webView.WebviewController.prepareForPageLoad('htt' + 'ps://www.example.com', true, null);
                Utils.emitEvent('success', 173050);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173050);
              }
              break;
            }
            case 'emitPrepareForPageLoadNumSocketsUndefined001': {
              try {
                console.info('test prepareForPageLoad with undefined numSockets');
                webView.WebviewController.prepareForPageLoad('htt' + 'ps://www.example.com', true, undefined);
                Utils.emitEvent('success', 173060);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173060);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}
