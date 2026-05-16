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
      eventId: 179000,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(179000)
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
        Button('webSchemeHandlerResponseGetHeaderByNameParam').key('webSchemeHandlerResponseGetHeaderByNameParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitGetHeaderByNameEmptyString001': {
              try {
                console.info('test WebSchemeHandlerResponse.getHeaderByName with empty string');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('Content-Type', 'text/html', true);
                let headerValue = response.getHeaderByName('');
                console.log('[schemeHandler] getHeaderByName empty string result:' + headerValue);
                Utils.emitEvent('success', 179010);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179010);
              }
              break;
            }
            case 'emitGetHeaderByNameNull001': {
              try {
                console.info('test WebSchemeHandlerResponse.getHeaderByName with null name');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('Content-Type', 'text/html', true);
                let headerValue = response.getHeaderByName(null);
                console.log('[schemeHandler] getHeaderByName null result:' + headerValue);
                Utils.emitEvent('success', 179020);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179020);
              }
              break;
            }
            case 'emitGetHeaderByNameUndefined001': {
              try {
                console.info('test WebSchemeHandlerResponse.getHeaderByName with undefined name');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('Content-Type', 'text/html', true);
                let headerValue = response.getHeaderByName(undefined);
                console.log('[schemeHandler] getHeaderByName undefined result:' + headerValue);
                Utils.emitEvent('success', 179030);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179030);
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
