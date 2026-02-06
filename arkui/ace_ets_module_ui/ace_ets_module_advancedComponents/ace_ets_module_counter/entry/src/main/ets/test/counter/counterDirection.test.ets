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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function counterDirectionTest() {
  describe('counterDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("counterDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter/CounterDirection',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get counterDirectionTest state pages: " + JSON.stringify(pages));
        if (!('CounterDirection' == pages.name)) {
          console.info("get counterDirectionTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push counterDirectionTest page result successful");
        }
      }
      catch (err) {
        console.error("push counterDirectionTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('counterDirectionTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('chipDirectionTest after each called');
    });

    /**
     * @tc.name   testCounterDirection_0100
     * @tc.number direction
     * @tc.desc   Test Counter page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCounterDirection_0100', Level.LEVEL0, async (done: Function) => {
      console.log("[testCounterDirection_0100] START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("[testCounterDirection_0100] click Auto");
      const lable = await driver.findComponent(ON.text("价格"));
      const rect1 = await lable.getBounds();
      console.log("[testCounterDirection_0100] ", " rect:" + JSON.stringify(rect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("[counterDirectionTest_0100] ", "click Rtl");
      await driver.delayMs(1000);
      let lable2 = await driver.findComponent(ON.text("价格"));
      const rect2 = await lable2.getBounds();
      console.log("[testCounterDirection_0100] ", " rect:" + JSON.stringify(rect2));
      expect(rect1.left == rect2.left).assertFalse();
      console.log("[testCounterDirection_0100] END");
      done();
    });
  })
}