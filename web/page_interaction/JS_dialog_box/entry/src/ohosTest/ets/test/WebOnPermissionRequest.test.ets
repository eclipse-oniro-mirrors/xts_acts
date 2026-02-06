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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 177401;
let driver = Driver.create();

export default function webOnPermissionRequest() {

  describe('WebOnPermissionRequestTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnPermissionRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages));
        if (!("WebOnPermissionRequest" == pages.name)) {
          console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebOnPermissionRequestTestButton"), 10000);
          console.info("push WebOnPermissionRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnPermissionRequest page error: " + err);
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

    /*
    * @tc.number      : SUB_WEB_PERMISSIONREQUESTDENY_0100
    * @tc.name        : testPermissionRequestDeny001
    * @tc.desc        : test permissionRequest deny
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testPermissionRequestDeny001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestDeny001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testPermissionRequestDeny001", '"deny"', 177410, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnPermissionRequestTestButton", "testPermissionRequestDeny001");
      await Utils.waitForExist(() => isReturn, "testPermissionRequestDeny001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_PERMISSIONREQUESTGRANT_0100
    * @tc.name        : testPermissionRequestGrant001
    * @tc.desc        : test permissionRequest grant
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testPermissionRequestGrant001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestGrant001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testPermissionRequestGrant001", '"grant"', 177420, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnPermissionRequestTestButton","testPermissionRequestGrant001");
      await Utils.waitForExist(() => isReturn, "testPermissionRequestGrant001" + '_returnCheck', true, 2000);
      done();
    })
  })
}
