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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import { Driver, ON } from '@kit.TestKit';
const driver: Driver = Driver.create();

@Entry
@Component
struct webOnBeforeUnload {
  controller: WebController = new WebController();
  @State str: string = "emitOnBeforeUnloadWebC";
  @State firstId: number = 402;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State boo: boolean = false

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 181203,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnBeforeUnload page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button("web click").key('webEnableDragButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitEnableDrag01": {
              try {
                this.boo = false;
                let buttonOne = await driver.findComponent(ON.text('DragMe'));
                let point = await buttonOne.getBoundsCenter();
                await driver.drag(point.x, point.y, point.x+500, point.y - 30);
                await Utils.sleep(5000);
                let buttonTwo = await driver.findComponent(ON.text('Dragging'));
                console.log('emitEnableDrag01' + buttonTwo)
                if(buttonTwo == null) {
                  Utils.emitEvent(true, 20260418)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitEnableDrag02": {
              try {
                this.boo = true;
                let buttonOne = await driver.findComponent(ON.text('DragMe'));
                let point = await buttonOne.getBoundsCenter();
                await driver.drag(point.x, point.y, point.x+500, point.y - 30);
                await Utils.sleep(5000);
                let buttonTwo = await driver.findComponent(ON.text('Dragging'));
                console.log('emitEnableDrag02' + buttonTwo);
                if(buttonTwo !== null) {
                  Utils.emitEvent(true, 20260419)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile("test.html"), controller: this.controller }).key('WebEnableDrag')
        .enableDrag(this.boo)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}