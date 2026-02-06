/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import { CommonConstants } from '../../test/Constant.test'

@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State initialScale: number = 100
  @State geolocationAccess: boolean = true
  @State blockNetwork: boolean = false
  @State errorReceive: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isRequestErr: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134350,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134350)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
        this.errorReceive = '';
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log("onFocus==>")
          })
          .onBlur(() => {
            console.log("onBlur==>")
          })
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitBlockNetWork001": {
                try {
                  this.blockNetwork = true

                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  this.isRequestErr = -1;
                  this.controller.loadUrl(CommonConstants.EXAMPLE_URL)
                  await waitForExist(() => this.isRequestErr, this.str, 0);

                  Utils.emitEvent(this.errorReceive, 134360)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork002": {
                try {
                  this.blockNetwork = false;

                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('index.html'));
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  this.isPageEnd = -1;
                  this.controller.loadUrl(CommonConstants.EXAMPLE_URL)
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let testTitle = this.controller.getTitle();
                  console.log(`testTitle is: ${testTitle}`);
                  Utils.emitEvent(this.errorReceive, 134370)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork003": {
                try {
                  this.blockNetwork = true

                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('index.html'));
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('second.html'))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  Utils.emitEvent(this.errorReceive, 134380)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork004": {
                try {
                  this.blockNetwork = true
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('index.html'));
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/index.html')
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  Utils.emitEvent(this.errorReceive, 134390)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork005": {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  this.blockNetwork = true

                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('index.html'));
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  this.isPageEnd = -1;
                  this.controller.loadUrl(`file://${sandboxPath}`)
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  Utils.emitEvent(this.errorReceive, 134400)
                  break;
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
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .geolocationAccess(this.geolocationAccess)
          .databaseAccess(true)
          .blockNetwork(this.blockNetwork)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onErrorReceive((event) => {
            console.log("onErrorReceive==>")
            if (event) {
              this.isRequestErr = 0;
              this.errorReceive = event.request.getRequestUrl()
            }
          })
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
          .onSslErrorEvent((event: SslErrorEvent) => {
            if (event) {
              console.log('onSslErrorEvent url: ' + event.url);
              console.log('onSslErrorEvent error: ' + event.error);
              console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
              console.log('onSslErrorEvent referrer: ' + event.referrer);
              console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
              console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
              console.log('onSslErrorEvent handler: ' + event.handler);
              event.handler.handleConfirm();
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}
