/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct webOnFirstContThree {
  controller: WebController = new WebController();
  @State str: string = "emitLoadUrlOnfirstcontentfulpaintWebc";
  @State firstId: number = 151800;
  @State firstcontentfulpaint: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 151790,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(151790)
  }
  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnFirstContThree page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webOnFirstContThree').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          switch (this.str) {
            case "emitLoadUrlOnfirstcontentfulpaintWebc": {
              try {
                this.isComplete = -1;
                this.controller.clearHistory();
                this.controller.loadUrl({ url: "https://m.weibo.cn" });
                await waitForExist(() => this.isComplete, this.str, 0);
                console.log("action of emitLoadUrlOnfirstcontentfulpaintWebc is loadUrl");
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.firstcontentfulpaint, this.firstId);
              break;
            }
          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onFirstContentfulPaint(event => {
          console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
          event.navigationStartTick + ", [firstContentfulPaintMs]:" + event.firstContentfulPaintMs + this.firstId)
          if (event.firstContentfulPaintMs > 0 && event.navigationStartTick > 0) {
            this.firstcontentfulpaint = true;
            console.error("result of onFirstContentfulPaint is: " + this.firstcontentfulpaint + this.firstId);
          }
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}