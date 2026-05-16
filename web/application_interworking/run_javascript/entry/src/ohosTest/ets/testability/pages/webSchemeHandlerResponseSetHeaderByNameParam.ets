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
      eventId: 182000,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(182000)
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
        Button('webSchemeHandlerResponseSetHeaderByNameParam').key('webSchemeHandlerResponseSetHeaderByNameParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitSetHeaderByNameEmptyName001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with empty name');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('', 'value', true);
                console.log('[schemeHandler] getHeaderByName:' + response.getHeaderByName(''));
                Utils.emitEvent('success', 182010);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182010);
              }
              break;
            }
            case 'emitSetHeaderByNameNullName001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with null name');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName(null, 'value', true);
                Utils.emitEvent('success', 182020);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182020);
              }
              break;
            }
            case 'emitSetHeaderByNameUndefinedName001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with undefined name');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName(undefined, 'value', true);
                Utils.emitEvent('success', 182030);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182030);
              }
              break;
            }
            case 'emitSetHeaderByNameEmptyValue001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with empty value');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('name', '', true);
                console.log('[schemeHandler] getHeaderByName:' + response.getHeaderByName('name'));
                Utils.emitEvent('success', 182040);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182040);
              }
              break;
            }
            case 'emitSetHeaderByNameNullValue001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with null value');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('name', null, true);
                Utils.emitEvent('success', 182050);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182050);
              }
              break;
            }
            case 'emitSetHeaderByNameUndefinedValue001': {
              try {
                console.info('test WebSchemeHandlerResponse.setHeaderByName with undefined value');
                let response = new webView.WebSchemeHandlerResponse();
                response.setHeaderByName('name', undefined, true);
                Utils.emitEvent('success', 182060);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 182060);
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
