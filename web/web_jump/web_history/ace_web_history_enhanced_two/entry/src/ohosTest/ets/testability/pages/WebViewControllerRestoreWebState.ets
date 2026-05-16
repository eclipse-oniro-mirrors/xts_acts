/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
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

const EVENT_ID_SET_SUITE_KEY = 154018;

@Entry
@Component
struct WebviewControllerRestoreWebState {
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
        Button("web click").key('restoreWebStateClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await Utils.waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;

          switch (this.emitKey) {
            case "testRestoreWebStateNull":
              try {
                this.controller.restoreWebState(null);
                Utils.emitEvent("error", 20260275);
              } catch (error) {
                console.error("restoreWebState with null state error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260275);
              }
              break;
            case "testRestoreWebStateUndefined":
              try {
                this.controller.restoreWebState(undefined);
                Utils.emitEvent("error", 20260276);
              } catch (error) {
                console.error("restoreWebState with undefined state error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260276);
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
