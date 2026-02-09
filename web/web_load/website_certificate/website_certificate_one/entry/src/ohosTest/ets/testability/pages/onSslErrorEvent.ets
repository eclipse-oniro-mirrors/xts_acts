/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { image } from '@kit.ImageKit';

const EVENT_ID_SET_EMIT_KEY = 202520;

@Entry
@Component
struct onCreateNativeMediaPlayer {
  @State icon: image.PixelMap | undefined = undefined;
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State statusResult: string = '';
  @State url: string = ''
  @State isReceive: number = -1;
  mode: WebLayoutMode = WebLayoutMode.FIT_CONTENT;

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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("onCreateNativeMediaPlayerTest").key('WebonSslErrorEventButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebonSslErrorEventButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitonSslErrorEvent": {
              try {
                Utils.emitEvent(WebLayoutMode.FIT_CONTENT, 202530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://expired.badssl.com', controller: this.controller })
        .enableNativeMediaPlayer({enable: true, shouldOverlay: false})
        .onFaviconReceived((event) => {
          console.log('onFaviconReceived');
          this.icon = event.favicon;
        })
        .layoutMode(this.mode)
        .onSslErrorEvent((event: SslErrorEvent) => {
          this.url = event.url
          console.log("onSslErrorEvent url: " + event.url);
          console.log("onSslErrorEvent error: " + event.error);
          console.log("onSslErrorEvent originalUrl: " + event.originalUrl);
          console.log("onSslErrorEvent referrer: " + event.referrer);
          console.log("onSslErrorEvent isFatalError: " + event.isFatalError);
          console.log("onSslErrorEvent isMainFrame: " + event.isMainFrame);
        })
    }
  }
}