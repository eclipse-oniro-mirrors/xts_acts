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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import business_error from '@ohos.base'
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct webViewControllerPart2 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerone: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State enterPageEnd: boolean = false
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
  @State isReceive:number = -1
  @State isComplete:number = -1
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153610,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153610)
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
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isReceive, this.str, 0);
          await waitForExist(() => this.isComplete, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "testNativeEmbedStatus001": {
              try {
                console.log('testNativeEmbedStatus001 :'+NativeEmbedStatus.ENTER_BFCACHE)
                Utils.emitEvent(NativeEmbedStatus.ENTER_BFCACHE, 153620);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testNativeEmbedStatus002": {
              try {
                console.log('testNativeEmbedStatus002 :'+NativeEmbedStatus.LEAVE_BFCACHE)
                Utils.emitEvent(NativeEmbedStatus.LEAVE_BFCACHE, 153630);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .key("onShowFileSelectorKey")
    }
  }
}
