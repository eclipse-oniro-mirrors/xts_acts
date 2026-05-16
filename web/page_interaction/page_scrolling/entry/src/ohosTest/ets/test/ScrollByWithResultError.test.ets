/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 179567;
let driver: Driver = Driver.create();

export default function scrollByWithResultError() {
  describe('scrollByWithResultErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScrollByWithResultError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollByWithResultError state success " + JSON.stringify(pages));
        if (!("ScrollByWithResultError" == pages.name)) {
          console.info("get scrollByWithResultError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("scrollByWithResultErrorButton"), 10000);
          console.info("push scrollByWithResultError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollByWithResultError page error: " + err);
      }
      done();
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

    /**
     * @tc.name   testScrollByWithResultDeltaXNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_ERROR_001
     * @tc.desc   WebviewController scrollByWithResult deltaX null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByWithResultDeltaXNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = 'testScrollByWithResultDeltaXNull';
      let tcName = 'testScrollByWithResultDeltaXNull'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "401", 179568, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "scrollByWithResultErrorButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollByWithResultDeltaXUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_ERROR_002
     * @tc.desc   WebviewController scrollByWithResult deltaX undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByWithResultDeltaXUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = 'testScrollByWithResultDeltaXUndefined';
      let tcName = 'testScrollByWithResultDeltaXUndefined'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "401", 179569, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "scrollByWithResultErrorButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollByWithResultDeltaYNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_ERROR_003
     * @tc.desc   WebviewController scrollByWithResult deltaY null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByWithResultDeltaYNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = 'testScrollByWithResultDeltaYNull';
      let tcName = 'testScrollByWithResultDeltaYNull'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "401", 179570, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "scrollByWithResultErrorButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollByWithResultDeltaYUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_ERROR_004
     * @tc.desc   WebviewController scrollByWithResult deltaY undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByWithResultDeltaYUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let emitKey = 'testScrollByWithResultDeltaYUndefined';
      let tcName = 'testScrollByWithResultDeltaYUndefined'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, "401", 179571, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "scrollByWithResultErrorButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
