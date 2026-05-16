/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

const EVENT_ID_SET_SUITE_KEY = 126127;

export default function trimMemoryByPressureLevelTest() {

  describe('TrimMemoryByPressureLevel', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/TrimMemoryByPressureLevel',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get TrimMemoryByPressureLevel state success " + JSON.stringify(pages));
        if (!("TrimMemoryByPressureLevel" == pages.name)) {
          console.info("get TrimMemoryByPressureLevel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push TrimMemoryByPressureLevel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TrimMemoryByPressureLevel page error: " + err);
      }
      await driver.waitForComponent(ON.id("trimMemoryByPressureLevelButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start");
      Utils.emitEvent('', EVENT_ID_SET_SUITE_KEY)
      console.info("web afterEach end");
      done();
    })

    /**
     * @tc.name   testTrimMemoryPressLevelModerate
     * @tc.number SUB_WEB_TRIMMEMORYBYPRESSURELEVEL_0100
     * @tc.desc   test trimMemoryByPressureLevel with MEMORY_PRESSURE_LEVEL_MODERATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTrimMemoryPressLevelModerate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testTrimMemoryPressLevelModerate';
        let tcName = 'testTrimMemoryPressLevelModerate';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "success", 126130, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "trimMemoryByPressureLevelButton");
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

  })
}
