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
struct testWebResponseSetUrlUrlError {
  controller: web_webview.WebviewController = new web_webview.WebviewController('scheme-handler');
  @State str: string = ''
  @State isReceive: number = -1;

  aboutToAppear() {
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler(8);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 124618,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(124618)
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
      Button('GetUrl')
        .key('GetUrl')
        .onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          await waitForExist(() => testNapi.getRequestValue(), this.str, 1, 1000);
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testWebResponse_GetUrl_Url_Error': {
              let url = testNapi.url_return();
              if (url != null) {
                console.log('Succeed testWebResponse_GetUrl_Url_Error');
                Utils.emitEvent(url, 124750);
                console.log('Geturl is :' + url);
              } else {
                console.log('Faild OH_ArkWebResponse_GetUrl');
                Utils.emitEvent(url, 124750);
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