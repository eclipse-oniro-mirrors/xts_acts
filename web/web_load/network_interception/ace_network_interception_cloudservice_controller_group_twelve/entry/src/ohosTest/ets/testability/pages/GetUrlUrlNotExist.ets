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
struct testWebResponseGetUrlUrlNotExist {
  controller: web_webview.WebviewController = new web_webview.WebviewController('scheme-handler');
  @State str: string = ''

  aboutToAppear() {
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler(7);
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
      Button('GetUrl')
        .key('GetUrl')
        .onClick(async () => {
          switch (this.str) {
            case 'testWebResponse_GetUrl_Url_NotExist': {
              let judgment = testNapi.judgment_num();
              if (judgment == 0) {
                console.log('Succeed OH_ArkWebResponse_GetUrl');
                Utils.emitEvent(true, 5107);
              } else {
                console.log('Faild OH_ArkWebResponse_GetUrl');
                Utils.emitEvent(false, 5107);
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