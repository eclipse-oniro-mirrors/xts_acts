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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

const EVENT_ID_SET_EMIT_KEY = 200620;

@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State title: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


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
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, 'WebAttributeTestButtonIsReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, 'WebAttributeTestButtonIsPageEnd', 1, 1000);
            console.info("key==>" + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "emitOnTitleReceive001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/changeTitle.html");
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  Utils.emitEvent(this.title, 200630);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnTitleReceive002": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/changeTitle.html");
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  this.controller.runJavaScript("changeTitle(123)");
                  const realVal = await Utils.waitForExist(()=>this.title, 'loadUrlIsPageEnd', '123', 500);
                  Utils.emitEvent(realVal, 200640);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitUserAgent001": {
                try {
                  Utils.emitEvent(this.controller.getCustomUserAgent(), 200650)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onTitleReceive((event) => {
            if (event) {
              console.log('onTitleReceive title:' + event.title)
              this.title = event.title
            }
          })
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 1;
              console.log('onPageEnd==> event.url:' + event.url);
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}