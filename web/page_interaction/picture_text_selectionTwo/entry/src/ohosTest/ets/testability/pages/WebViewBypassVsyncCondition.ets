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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist} from '../../test/WaitTest.test';
const EVENT_ID_SET_SUITE_KEY = 183001;

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  condition: WebBypassVsyncCondition[] = [WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET,WebBypassVsyncCondition.NONE];
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
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
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Button("web click").key('BypassVsyncConditionButton').onClick(async () => {
        console.info("key==>" + this.str)
        await waitForExist(()=>this.isReceive, this.str, 0);
        await waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 0);
        this.isReceive = -1;
        switch (this.str) {
          case "emitBypassVsyncCondition01": {
            await Utils.sleep(2000)
            Utils.emitEvent(this.condition[0], 183010)
            break;
          }
          case "emitBypassVsyncCondition02": {
            await Utils.sleep(2000)
            Utils.emitEvent(this.condition[1], 183020)
            break;
          }
        }
      })

      Web({ src: 'www.example.com', controller: this.controller })
        .bypassVsyncCondition(WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}