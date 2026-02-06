/*
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


import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewControllerVideoMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();
  @State RectWidth:number = 0
  @State RectHeight:number = 0
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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewSurfaceInfo").id('surfaceInfoButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "rectEvent0100": {
              try {
                await Utils.sleep(5000);
                Utils.emitEvent(this.RectWidth > 0 && this.RectHeight > 0 , 202503222)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }



      Web({ src: $rawfile('scrollByTo.html'), controller: this.controller })
        .enableNativeMediaPlayer({enable: true, shouldOverlay: false})
        .onPageBegin((event) => {
          this.controller.onCreateNativeMediaPlayer((handler: webView.NativeMediaPlayerHandler, mediaInfo: webView.MediaInfo) => {
            this.RectWidth = mediaInfo.surfaceInfo.rect.width;
            this.RectHeight = mediaInfo.surfaceInfo.rect.height;
            console.log(`surfaceInfo.rect.x = ${mediaInfo.surfaceInfo.rect.x}`)
            console.log(`surfaceInfo.rect.y = ${mediaInfo.surfaceInfo.rect.y}`)
            console.log(`surfaceInfo.rect.width = ${mediaInfo.surfaceInfo.rect.width}`)
            console.log(`surfaceInfo.rect.height = ${mediaInfo.surfaceInfo.rect.height}`)
            return null;
          });
        })
    }
  }
}
