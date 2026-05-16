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
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172700,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(172700)
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
        Button('webviewControllerSetHostIPParam').key('webviewControllerSetHostIPParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitSetHostIPHostNameEmpty001': {
              try {
                console.info('test setHostIP with empty hostName');
                webView.WebviewController.setHostIP('', '192.168.1.1', 60);
                Utils.emitEvent('success', 172710);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172710);
              }
              break;
            }
            case 'emitSetHostIPHostNameNull001': {
              try {
                console.info('test setHostIP with null hostName');
                webView.WebviewController.setHostIP(null, '192.168.1.1', 60);
                Utils.emitEvent('success', 172720);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172720);
              }
              break;
            }
            case 'emitSetHostIPHostNameUndefined001': {
              try {
                console.info('test setHostIP with undefined hostName');
                webView.WebviewController.setHostIP(undefined, '192.168.1.1', 60);
                Utils.emitEvent('success', 172730);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172730);
              }
              break;
            }
            case 'emitSetHostIPAddressEmpty001': {
              try {
                console.info('test setHostIP with empty address');
                webView.WebviewController.setHostIP('www.example.com', '', 60);
                Utils.emitEvent('success', 172740);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172740);
              }
              break;
            }
            case 'emitSetHostIPAddressNull001': {
              try {
                console.info('test setHostIP with null address');
                webView.WebviewController.setHostIP('www.example.com', null, 60);
                Utils.emitEvent('success', 172750);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172750);
              }
              break;
            }
            case 'emitSetHostIPAddressUndefined001': {
              try {
                console.info('test setHostIP with undefined address');
                webView.WebviewController.setHostIP('www.example.com', undefined, 60);
                Utils.emitEvent('success', 172760);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172760);
              }
              break;
            }
            case 'emitSetHostIPAliveTimeNull001': {
              try {
                console.info('test setHostIP with null aliveTime');
                webView.WebviewController.setHostIP('www.example.com', '192.168.1.1', null);
                Utils.emitEvent('success', 172770);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172770);
              }
              break;
            }
            case 'emitSetHostIPAliveTimeUndefined001': {
              try {
                console.info('test setHostIP with undefined aliveTime');
                webView.WebviewController.setHostIP('www.example.com', '192.168.1.1', undefined);
                Utils.emitEvent('success', 172780);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172780);
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
