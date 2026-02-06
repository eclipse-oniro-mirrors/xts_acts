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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201290;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webSecureDnsModeEnumTest() {

  describe('WebSecureDnsModeEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSecureDnsModeEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSecureDnsModeEnumTest state success " + JSON.stringify(pages));
        if (!("WebSecureDnsModeEnumTest" == pages.name)) {
          console.info("get WebSecureDnsModeEnumTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebSecureDnsModeEnumTest page success");
        }
      } catch (err) {
        console.error("push WebSecureDnsModeEnumTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebSecureDnsModeEnumTestButton"), 10000);
      console.log("waitForComponent WebSecureDnsModeEnumTestButton");
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

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0100
    * @tc.name        : testWebSecureDnsModeEnum001
    * @tc.desc        : test the value of SecureDnsMode.OFF is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebSecureDnsModeEnum001", 0, 201300, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebSecureDnsModeEnumTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebSecureDnsModeEnum001' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0200
    * @tc.name        : testWebSecureDnsModeEnum002
    * @tc.desc        : test the value of SecureDnsMode.AUTO is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebSecureDnsModeEnum002", 1, 201310, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebSecureDnsModeEnumTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebSecureDnsModeEnum002' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number      : SUB_WEB_SECUREDNSMODE_ENUM_0300
    * @tc.name        : testWebSecureDnsModeEnum003
    * @tc.desc        : test the value of SecureDnsMode.SECURE_ONLY is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebSecureDnsModeEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebSecureDnsModeEnum003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebSecureDnsModeEnum003", 2, 201320, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebSecureDnsModeEnumTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebSecureDnsModeEnum003' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}