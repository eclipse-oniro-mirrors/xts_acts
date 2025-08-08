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

@Entry
@Component
struct webviewGetAndSetHttpAuthUsernamePassword {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller();
  @State emitKey: string = "";
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponentScrollBy').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          switch (this.emitKey) {
            case "emitScrollBarKeep001": {
              await Utils.sleep(2000);
              let strJson = getInspectorByKey('scroll');
              console.info("[testScrollBarKeep001] component strJson:" + strJson);
              let obj: ESObject = JSON.parse(strJson);
              console.info("[testScrollBar001] scrollBar:" + obj.$attrs.scrollBar);
              Utils.emitEvent(obj.$attrs.scrollBar, 20250701)
              break;
            }
            case "emitScrollBarKeep002": {
              await Utils.sleep(2000);
              let strJson = getInspectorByKey('scroll');
              console.info("[testScrollBarKeep002] component strJson:" + strJson);
              let obj: ESObject = JSON.parse(strJson);
              console.info("[testScrollBar002] scrollable:" + obj.$attrs.scrollable);
              Utils.emitEvent(obj.$attrs.scrollable, 20250702)
              break;
            }
          }
        })
      }

      Scroll(this.scroller) {
        Column() {
          Text("forceDisplayScrollBar(true)").fontColor(Color.Blue)
          Web({ src: 'resource://rawfile/text.html', controller: this.controller })
            .height("150%")
            .key("web")
            .forceDisplayScrollBar(true)

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



