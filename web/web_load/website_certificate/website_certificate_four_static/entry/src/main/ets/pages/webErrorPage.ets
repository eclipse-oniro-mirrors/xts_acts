/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Web,
  SslErrorEvent
} from '@ohos.arkui.component';
import { Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewOnSslErrorEvent {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerTwo: webView.WebviewController = new webView.WebviewController(undefined);
  @State emitKey: string = '';
  // @State message: Array<string> = [];
  @State isJumpUserAgentTwo: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnOverrideErrorPage: number = -1;
  @State errorCode: number = -1;
  @State errorInfo: string = '';
  @State currentStr: string = '';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebErrorPageButton').id('WebErrorPageButton').onClick((e: ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
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
                this.currentStr = 'onOverrideErrorPageOne'
                this.controller.setErrorPageEnabled(true);
                this.controller.loadUrl('https://www.baiiiiiiiiidu.com');
              } catch (error) {
                console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                Utils.emitEvent(error.message, 2025081407);
              }
              break;
            }
          }
        })
      }

      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('onPageEnd url:' + event.url);
          }
        })
        .onOverrideErrorPage(event => {
          console.log('onOverrideErrorPage getErrorCode：' + event.error.getErrorCode());
          console.log('onOverrideErrorPage getErrorInfo:' + event.error.getErrorInfo());
          if(event && event.request) {
            console.log('onOverrideErrorPage request getRequestUrl：' + event.request.getRequestUrl());
            console.log('onOverrideErrorPage request getRequestHeader：' + event.request.getRequestHeader());
            console.log('onOverrideErrorPage request isMainFrame：' + event.request.isMainFrame());
            console.log('onOverrideErrorPage request isRedirect：' + event.request.isRedirect());
            console.log('onOverrideErrorPage request isRequestGesture：' + event.request.isRequestGesture());
            console.log('onOverrideErrorPage request getRequestMethod：' + event.request.getRequestMethod());
            if (this.currentStr === 'onOverrideErrorPageOne') {
              Utils.emitEvent(event.request.getRequestUrl(), 26031035);
              let headArr = event.request.getRequestHeader();
              if (headArr && headArr.length > 0) {
                Utils.emitEvent(true, 26031036);
              }
              Utils.emitEvent(event.request.isMainFrame(), 26031037);
              Utils.emitEvent(event.request.isRedirect(), 26031038);
              Utils.emitEvent(event.request.isRequestGesture(), 26031039);
              Utils.emitEvent(event.request.getRequestMethod(), 26031040);
            }
          }
          if (event.error.getErrorCode()) {
            this.isOnOverrideErrorPage = 0;
            this.errorCode = event.error.getErrorCode();
            this.errorInfo = event.error.getErrorInfo();
          }
          let htmlStr = '<html><h1>error occur : ';
          htmlStr += event.error.getErrorCode();
          htmlStr += event.error.getErrorInfo();
          htmlStr += '</h1></html>';
          return htmlStr;
        })


    }
  }
}