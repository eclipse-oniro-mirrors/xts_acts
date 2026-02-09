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
import { expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
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
          console.info("push WebOnPermissionRequest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnPermissionRequest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnPermissionRequestTestButton"), 10000);
      console.log("waitForComponent WebOnPermissionRequestTestButton");
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
     * @tc.name   testPermissionRequestDenyGroup001
     * @tc.number SUB_WEB_PERMISSIONREQUESTDENY_GROUP_0100
     * @tc.desc   test permissionRequest deny
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPermissionRequestDenyGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestDeny001", 160860)
      Utils.registerBaseEvent("testPermissionRequestDeny001", '"deny"', 160870,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebOnPermissionRequestTestButton");
    })

    /**
     * @tc.name   testPermissionRequestGrantGroup001
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0100
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitPermissionRequestGrant001", 160860)
      Utils.registerBaseEvent("testPermissionRequestGrant001", '"grant"', 160880,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "WebOnPermissionRequestTestButton");
    })
  })
}
