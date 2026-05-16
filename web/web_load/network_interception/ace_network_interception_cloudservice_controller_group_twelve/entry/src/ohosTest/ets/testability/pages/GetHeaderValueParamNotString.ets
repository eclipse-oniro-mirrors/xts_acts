/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import testNapi from 'libentry.so';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct OH_ArkWebRequestHeaderList_GetHeader {
  controller: web_webview.WebviewController = new web_webview.WebviewController('scheme-handler');
  @State str: string = ''
  @State string: string = ''
  @State interceptUrl: string = ''
  @State consoleCorsError: boolean = false
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State consoleMsg: string = ''
  @State isRegister: number = -1;
  @State isSet: number = -1;
  @State isStringReceived: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  aboutToAppear() {
    testNapi.registerCustomSchemes();
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler(24);
    console.error('ygz aboutToAppear setSchemeHandler' + this.isSet)
    console.error('aboutToAppear registerCustomSchemes End')

  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 124629,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(124629)
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
      Button('GetHeader')
        .key('GetHeader')
        .onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          await waitForExist(() => testNapi.getRequestValue(), this.str, 1, 1000);
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testWebRequestHeaderList_GetHeader_ValueParam_NotString': {
              console.log('Execute testWebRequestHeaderList_GetHeader_ValueParam_NotString');
              let headerResult: number = testNapi.judgment1();
              console.log('HeaderList test result: ' + headerResult);
              if (headerResult == 0) {
                console.log('OH_ArkWebRequestHeaderList_GetHeader call succeed ');
                Utils.emitEvent(true, 124860);
              } else {
                console.log('OH_ArkWebRequestHeaderList_GetHeader call failed');
                Utils.emitEvent(false, 124860);
              }
              break;
            }
          }
        })
      Web({
        src: 'https:' +
          '//www.example.com', controller: this.controller
      });
    }
  }
}