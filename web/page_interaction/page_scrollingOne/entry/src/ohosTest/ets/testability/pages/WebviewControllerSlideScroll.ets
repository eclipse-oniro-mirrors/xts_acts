/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
 */

import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';

const EVENT_ID_SET_SUITE_KEY = 154017;

@Entry
@Component
struct WebviewControllerSlideScroll {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
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
        Button("web click").key('slideScrollClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;

          switch (this.emitKey) {
            case "testSlideScrollVxNullVyNull":
              try {
                this.controller.slideScroll(null, null);
                Utils.emitEvent("error", 20260271);
              } catch (error) {
                console.error("slideScroll with vx=null, vy=null error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260271);
              }
              break;
            case "testSlideScrollVxNullVyUndefined":
              try {
                this.controller.slideScroll(null, undefined);
                Utils.emitEvent("error", 20260272);
              } catch (error) {
                console.error("slideScroll with vx=null, vy=undefined error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260272);
              }
              break;
            case "testSlideScrollVxUndefinedVyNull":
              try {
                this.controller.slideScroll(undefined, null);
                Utils.emitEvent("error", 20260273);
              } catch (error) {
                console.error("slideScroll with vx=undefined, vy=null error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260273);
              }
              break;
            case "testSlideScrollVxUndefinedVyUndefined":
              try {
                this.controller.slideScroll(undefined, undefined);
                Utils.emitEvent("error", 20260274);
              } catch (error) {
                console.error("slideScroll with vx=undefined, vy=undefined error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260274);
              }
              break;
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
