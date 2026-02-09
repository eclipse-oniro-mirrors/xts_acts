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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 127101;
const driver = Driver.create();

export default function webOnFirstContentfulPaint() {
  describe('WebOnFirstContentfulPaintTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnFirstContentfulPaint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnFirstContentfulPaint state success " + JSON.stringify(pages));
        if (!("WebOnFirstContentfulPaint" == pages.name)) {
          console.info("get WebOnFirstContentfulPaint state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebOnFirstContentfulPaintButton"), 10000);
          console.info("push WebOnFirstContentfulPaint page success ");
        }
      } catch (err) {
        console.error("push WebOnFirstContentfulPaint page error: " + err);
      }
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

    /**
     * @tc.name   testOnFirstContentfulPaint001
     * @tc.number SUB_WEB_ONFIRSTCONTENTFULPAINT_0100
     * @tc.desc   test onFirstContentfulPaint with Visibility.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnFirstContentfulPaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstContentfulPaint001", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnFirstContentfulPaint001", false, 127110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnFirstContentfulPaintButton", "testOnFirstContentfulPaint001");
      await Utils.waitForExist(() => isReturn, "testOnFirstContentfulPaint001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testOnFirstContentfulPaint002
     * @tc.number SUB_WEB_ONFIRSTCONTENTFULPAINT_0200
     * @tc.desc   test onFirstContentfulPaint with Visibility.Visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnFirstContentfulPaint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstContentfulPaint002", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnFirstContentfulPaint002", true, 127120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnFirstContentfulPaintButton", "testOnFirstContentfulPaint002");
      await Utils.waitForExist(() => isReturn, "testOnFirstContentfulPaint002" + '_returnCheck', true, 1000);
      done();
    })

  })
}