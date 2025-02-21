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

@Entry
@Component
struct webOnFirstContTwo {
  controller: WebController = new WebController();
  @State str: string = "emitNoneOnfirstcontentfulpaintWebc";
  @State firstId: number = 424;
  @State firstcontentfulpaint: string = 'VisibilityNoneTest';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State webVisibility: Visibility = Visibility.None

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnFirstContTwo page valueChangeCallBack");
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
        Button("web click").key('webOnFirstContTwo').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitNoneOnfirstcontentfulpaintWebc": {
              try {
                this.controller.refresh();
                console.log("action of emitNoneOnfirstcontentfulpaintWebc is refresh");
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.firstcontentfulpaint, this.firstId)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onFirstContentfulPaint(event => {
          console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
          event.navigationStartTick + ", [firstContentfulPaintMs]:" + event.firstContentfulPaintMs)
          this.firstcontentfulpaint = JSON.stringify(event)
        })
    }
  }
}