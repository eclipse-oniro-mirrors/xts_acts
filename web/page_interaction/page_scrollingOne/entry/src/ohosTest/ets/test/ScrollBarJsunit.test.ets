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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = "emitScrollBarKeep001"

export default function ActsAceWebviewScrollBar() {
  describe('TEST_ScrollBar_Keep', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/scrollBar',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("scrollBar" == pages.name)) {
          console.info("get scrollBar state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("webcomponentScrollBy"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("webcomponentScrollBy"),10000);
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })



    it('testScrollBarKeep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async  (done: Function) => {
      emitKey="emitScrollBarKeep001";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testScrollBarKeep001","BarState.Auto",20250701,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    });

    it('testScrollBarKeep002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async  (done: Function) =>{
      emitKey="emitScrollBarKeep002";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testScrollBarKeep002","ScrollDirection.Vertical",20250702,done);
      sendEventByKey('webcomponentScrollBy',10,'');
    });

  })
}
