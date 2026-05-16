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
  ports: Array<webView.WebMessagePort> = [];
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  aboutToAppear() {
    try {
      this.ports = this.controller.createWebMessagePorts();
      console.info('createWebMessagePorts success');
    } catch (error) {
      let e: BusinessError = error as BusinessError;
      console.error('createWebMessagePorts failed: ' + `ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172500,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(172500)
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
        Button('webviewControllerPostMessageParam').key('webviewControllerPostMessageParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitPostMessageNameEmpty001': {
              try {
                console.info('test postMessage with empty name');
                this.controller.postMessage('', this.ports, 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172510);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172510);
              }
              break;
            }
            case 'emitPostMessageNameNull001': {
              try {
                console.info('test postMessage with null name');
                this.controller.postMessage(null, this.ports, 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172520);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172520);
              }
              break;
            }
            case 'emitPostMessageNameUndefined001': {
              try {
                console.info('test postMessage with undefined name');
                this.controller.postMessage(undefined, this.ports, 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172530);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172530);
              }
              break;
            }
            case 'emitPostMessagePortsNull001': {
              try {
                console.info('test postMessage with null ports');
                this.controller.postMessage('test', null, 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172540);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172540);
              }
              break;
            }
            case 'emitPostMessagePortsUndefined001': {
              try {
                console.info('test postMessage with undefined ports');
                this.controller.postMessage('test', undefined, 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172550);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172550);
              }
              break;
            }
            case 'emitPostMessagePortsEmptyArray001': {
              try {
                console.info('test postMessage with empty array ports');
                this.controller.postMessage('test', [], 'file:///data/storage/el2/base/haps/entry/files/index.html');
                Utils.emitEvent('success', 172560);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172560);
              }
              break;
            }
            case 'emitPostMessageUriEmpty001': {
              try {
                console.info('test postMessage with empty uri');
                this.controller.postMessage('test', this.ports, '');
                Utils.emitEvent('success', 172570);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172570);
              }
              break;
            }
            case 'emitPostMessageUriNull001': {
              try {
                console.info('test postMessage with null uri');
                this.controller.postMessage('test', this.ports, null);
                Utils.emitEvent('success', 172580);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172580);
              }
              break;
            }
            case 'emitPostMessageUriUndefined001': {
              try {
                console.info('test postMessage with undefined uri');
                this.controller.postMessage('test', this.ports, undefined);
                Utils.emitEvent('success', 172590);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172590);
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
