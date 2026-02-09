/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import {
  OnOverScrollEvent,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  stringObj: StringFields = new StringFields();
  @State str: string = ''
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State uri: string = 'file://docs/storage/Users/currentUser/Documents/1.json';
  @State FileSelectorParamGetIsCapture: boolean = true
  @State enterPageEnd: boolean = false
  @State onOverScrollCallBack: boolean = false
  @State forceDarkAccess: boolean = false
  @State userAgentPC: string = '';
  no_error: string = 'no error happened'
  @State X: number = 0;
  @State Y: number = 0;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }
  build() {
    Column(undefined) {
      Row(undefined) {
        Button('WebViewController click')
          .key('WebViewControllerButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testOnOverScroll001': {
              try {
                this.controller.loadUrl('https://www.example.com/');
                Utils.emitEvent(this.onOverScrollCallBack, 31038)
				this.onOverScrollCallBack = false
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31038)
              }
              break;
            }

            case 'testOnOverScroll002': {
              try {
                this.controller.loadUrl('https://www.example.com/');
                Utils.emitEvent(this.onOverScrollCallBack, 100034)
				this.onOverScrollCallBack = false
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100034)
              }
              break;
            }

            case 'testOnOverScroll003': {
              try {
                this.controller.loadUrl('https://www.example.com/');
                Utils.emitEvent(this.onOverScrollCallBack, 100035)
				this.onOverScrollCallBack = false
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100035)
              }
              break;
            }

            case 'testOnOverScroll004': {
              try {
                this.controller.loadUrl('https://www.example.com/');
                Utils.emitEvent(this.onOverScrollCallBack, 100036)
				this.onOverScrollCallBack = false
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100036)
              }
              break;
            }
          }
        })
      }
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onOverScroll((event: OnOverScrollEvent): void => {
          if (event) {
            console.info('onOverScroll x = ' + event.xOffset)
            console.info('onOverScroll y = ' + event.yOffset)
            this.onOverScrollCallBack = true
          }
        })
    }
  }
}
