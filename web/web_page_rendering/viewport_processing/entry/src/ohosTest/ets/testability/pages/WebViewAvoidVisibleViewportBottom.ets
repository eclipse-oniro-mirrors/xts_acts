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
import web_webview from '@ohos.web.webview';
import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../test/Utils';

@Entry
@Component
struct ViewportAvoidTestPage {
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  @State avoidHeight: number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isComplete: number = -1;
  @State str:string = ''


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153910,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(153910)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }
  build() {
    Column() {
      Row() {
        Button("web click").key('voidVisibleViewportBottomWebClick').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isComplete, this.str, 0);
          switch (this.str) {
            case "emitAvoidVisibleViewportBottom001": {
              this.avoidHeight += 50;
              this.controller.avoidVisibleViewportBottom(this.avoidHeight);
              await Utils.sleep(1000);
              Utils.emitEvent(this.controller.getScrollOffset().y, 153920)
              break;
            }

            case "emitAvoidVisibleViewportBottom002": {
              this.avoidHeight = 0;
              this.avoidHeight += 100;
              this.controller.avoidVisibleViewportBottom(this.avoidHeight);
              await Utils.sleep(1000);
              Utils.emitEvent(this.controller.getScrollOffset().y, 153930)
              break;
            }
          }
        })
      }
      .backgroundColor(Color.Gray)
      .height('10%')

      Web({
        src: $rawfile("index.html"), controller: this.controller
      })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .mixedMode(MixedMode.Compatible)
          // .layoutMode(WebLayoutMode.FIT_CONTENT)
        .height("80%")
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
    .height('100%')
  }
}