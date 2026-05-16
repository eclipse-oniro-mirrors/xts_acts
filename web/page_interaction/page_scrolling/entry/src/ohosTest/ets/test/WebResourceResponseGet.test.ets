/*
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

import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = '';
const EVENT_ID_SET_SUITE_KEY = 179701;
let driver: Driver = Driver.create();

export default function webResourceResponseGet() {

  describe('WebResourceResponseGetTestSuite', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      try {
        await driver.waitForComponent(ON.id("WebResourceResponseGetButton"), 10000);
      } catch (err) {
        console.error("push WebResourceResponseGetTestSuite page error: " + err);
      }
      console.info("webResourceResponseGet beforeEach start");
      done();
    })

    /**
     * @tc.name   testScrollType001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTYPE_0100
     * @tc.desc   test ScrollType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testScrollType001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, 0, 179710, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebResourceResponseGetButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testscrollByWithResult001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_0100
     * @tc.desc   test ScrollByWithResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testscrollByWithResult001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testscrollByWithResult001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, "error", 179720, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebResourceResponseGetButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   testscrollByWithResult002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_0200
     * @tc.desc   test ScrollByWithResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testscrollByWithResult002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testscrollByWithResult002';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 20251026, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebResourceResponseGetButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })
  })
}
