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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL_INVALID, URL_EMPTY_RESPONSE } from '../../test/Config.test';

@Entry
@Component
struct webErrorPageTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isJumpUserAgentTwo: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnOverrideErrorPage: number = -1;
  @State errorCode: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 19,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(19)
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
        Button('error page click')
          .key('WebErrorPageButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            this.isOnOverrideErrorPage = -1;
            this.errorCode = -1;
            switch (this.emitKey) {
              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled01': {
                try {
                  this.controller.setErrorPageEnabled(true);
                  let result = this.controller.getErrorPageEnabled();
                  console.log(this.emitKey + ' getErrorPageEnabled：' + result);
                  Utils.emitEvent(result, 2025081401);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081401);
                }
                break;
              }
              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled02': {
                try {
                  this.controller.setErrorPageEnabled(false);
                  let result = this.controller.getErrorPageEnabled();
                  console.log(this.emitKey + ' getErrorPageEnabled：' + result);
                  Utils.emitEvent(result, 2025081402);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081402);
                }
                break;
              }
              case 'emitSetErrorPageEnabledErrorCode01': {
                try {
                  this.controller.setErrorPageEnabled(null);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081403);
                }
                break;
              }
              case 'emitSetErrorPageEnabledErrorCode02': {
                try {
                  this.controller.setErrorPageEnabled(undefined);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081404);
                }
                break;
              }
              case 'emitSetErrorPageEnabledErrorCode03': {
                try {
                  this.controllerTwo.setErrorPageEnabled(true);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081405);
                }
                break;
              }
              case 'emitGetErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.getErrorPageEnabled();
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081406);
                }
                break;
              }
              case 'emitOnOverrideErrorPage01': {
                try {
                  this.controller.setErrorPageEnabled(true);
                  this.controller.loadUrl(URL_INVALID);
                  await waitForExist(()=>this.isOnOverrideErrorPage, this.emitKey, 0);
                  Utils.emitEvent(this.errorCode, 2025081407);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081407);
                }
                break;
              }
              case 'emitOnOverrideErrorPage02': {
                try {
                  this.controller.setErrorPageEnabled(true);
                  this.controller.loadUrl(URL_EMPTY_RESPONSE);
                  await waitForExist(()=>this.isOnOverrideErrorPage, this.emitKey, 0);
                  Utils.emitEvent(this.errorCode, 2025081408);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081408);
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('onPageEnd url:' + event.url);
           }
        })
        .onOverrideErrorPage(event => {
          console.log('onOverrideErrorPage getErrorCode：' + event.error.getErrorCode());
          console.log('onOverrideErrorPage getErrorInfo:' + event.error.getErrorInfo());
          if (event.error.getErrorCode()) {
            this.isOnOverrideErrorPage = 0;
            this.errorCode = event.error.getErrorCode();
          }
          let htmlStr = '<html><h1>error occur : ';
          htmlStr += event.error.getErrorCode();
          htmlStr += event.error.getErrorInfo();
          htmlStr += '</h1></html>';
          return htmlStr;
        })
        .width('100%')
        .height('100%')
    }
  }
}
