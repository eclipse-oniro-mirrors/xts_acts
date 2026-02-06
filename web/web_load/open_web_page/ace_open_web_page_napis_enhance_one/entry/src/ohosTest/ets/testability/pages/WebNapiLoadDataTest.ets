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

import testNapi from 'libentry.so'
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';

const EVENT_ID_SET_EMIT_KEY = 201230;

@Entry
@Component
struct WebNapiLoadDataTest {

  @State emitKey: string = '';
  @State webTag: string = 'web1211';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  aboutToAppear() {
    console.info('aboutToAppear start run testcase')
    web_webview.WebviewController.setWebDebuggingAccess(true);

  }

  build() {
    Column() {
      Row() {
        Button('webNapiLoadDataButton click')
          .key('webNapiLoadDataButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isPageEnd, 'webNapiLoadDataButtonIsPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'webNapiLoadDataButtonIsReceive', 1, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitWebNapiLoadData001': {
                try {
                    const htmlPictureContent: string = `
                    <html>
                    <head>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
                    </head>
                    <body>
                        Source:<pre>source</pre>
                        <div dir="auto">
                            <br />
                            <img style="max-width:592px;height:auto" src="image.jpg" alt="图片" width="592" height="1052" />
                            <div>
                                <br /><br /><br /><br /><br />
                                <div>图片</div>
                            </div>
                        </div>
                    </body>
                    </html>
                    `;
                    let resultData = testNapi.loadData(this.webTag, htmlPictureContent, 'text/html', 'UTF-8', 'resource://rawfile/', 'www');
                    console.log('emitWebNapiLoadData001 loadData result:'+resultData);
                    Utils.emitEvent(resultData,201240)
                } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(201240,201240)
                }
                break;
              }
            }
          })
      }
      Web({ src: 'www' + '.example.' + 'com', controller: this.controller })
        .domStorageAccess(true)
        .databaseAccess(true)
        .imageAccess(true)
        .onlineImageAccess(true)
        .zoomAccess(true)
        .javaScriptAccess(true)
        .overviewModeAccess(true)
        .pinchSmooth(true)
        .fileAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}