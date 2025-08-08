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

  aboutToAppear() {
    testNapi.registerCustomSchemes();
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler(26);
    console.error('ygz aboutToAppear setSchemeHandler' + this.isSet)
    console.error('aboutToAppear registerCustomSchemes End')
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Button('GetMethod')
        .key('GetMethod')
        .onClick(async () => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testWebResourceRequest_GetMethod_get': {
              console.log('Execute testWebResourceRequest_GetMethod_get');
              await Utils.sleep(1000);
              let method = testNapi.returnsMethod();
              console.log('get method test result: ' + method);
              let str = 'GET';
              if (method == str) {
                console.log('testWebResourceRequest_GetMethod  call succeed');
                Utils.emitEvent(method, 5126);
              } else {
                console.error('testWebResourceRequest_GetMethod call  failed');
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