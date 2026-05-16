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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 180001;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      try {
        await driver.waitForComponent(ON.id("WebInitTestButton"), 10000);
      } catch (err) {
        console.error("push webViewScrollable page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   testWebViewAvoidArea05
     * @tc.number SUB_ACE_WEB_AVOIDAREA_API_0005
     * @tc.desc   test onAvoidAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewAvoidArea05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewAvoidArea05';
      tcName = 'testWebViewAvoidArea05'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'success', 180010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebInitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
