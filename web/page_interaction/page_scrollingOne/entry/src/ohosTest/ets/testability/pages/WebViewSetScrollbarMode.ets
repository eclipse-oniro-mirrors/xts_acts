/**
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
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';

const EVENT_ID_SET_SUITE_KEY = 184001;

let driver: Driver = Driver.create();

@Entry
@Component
struct webviewGetAndSetHttpAuthUsernamePassword {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller();
  @State emitKey: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebViewSetScrollbarModeButton').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await Utils.waitForExist(()=>this.isReceive, this.emitKey+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.emitKey+' isPageEnd', 1, 1000);
          switch (this.emitKey) {
            case "emitSetScrollbarMode001": {
              await Utils.sleep(2000);
              webview.WebviewController.setScrollbarMode(webview.ScrollbarMode.FORCE_DISPLAY_SCROLLBAR);
              Utils.emitEvent(webview.ScrollbarMode.FORCE_DISPLAY_SCROLLBAR, 20251208)
              break;
            }
            case "emitSetScrollbarMode002": {
              await Utils.sleep(2000)
              webview.WebviewController.setScrollbarMode(webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR);
              Utils.emitEvent(webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR, 20251209)
              break;
            }
          }
        })
      }

      Scroll(this.scroller) {
        Column() {
          Web({ src: 'resource://rawfile/text.html', controller: this.controller })
            .height("150%")
            .key("web")
            .forceDisplayScrollBar(true)
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
            })
        }
      }
      .key('scroll')
      .width('100%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
    }
  }
}



