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
import webView from '@ohos.web.webview';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct webResourceError {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "emitOnHttpErrorReceiveByExampleWebc";
  @State javaScriptAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State errorInfo: string = ''
  @State errorCode: number = 0
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 120010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(120010)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebResourceError click").key('WebResourceErrorButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, 'WebResourceErrorButtonIsReceive', 0);
          await waitForExist(()=>this.isPageEnd, 'WebResourceErrorButtonIsPageEnd', 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testGetErrorCode001": {
              try {
                this.errorCode = 0
                this.isPageEnd = -1;
                this.controller.loadUrl('https://wrong.host.badssl.com');
                await waitForExist(()=>this.isPageEnd, 'WebResourceErrorButtonIsPageEnd', 0);
                Utils.emitEvent(this.errorCode, 120020)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .userAgent(this.userAgent)
        .onErrorReceive((event) => {
          console.log(`onErrorReceive start`);
          if (event) {
            this.errorInfo = event.error.getErrorInfo();
            console.log(`errorInfo is: ${this.errorInfo}`);
            this.errorCode = event.error.getErrorCode();
            console.log(`errorCode is: ${this.errorCode}`);
          }
        })
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })

    }
  }
}
