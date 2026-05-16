/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 154015;

let emitKey = "";

export default function GeolocationPermissionsGetAccessibleGeolocationTest() {
  describe('GeolocationPermissionsGetAccessibleGeolocationTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GeolocationPermissionsGetAccessibleGeolocation',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get GeolocationPermissionsGetAccessibleGeolocation state success " + JSON.stringify(pages));
        if (!("GeolocationPermissionsGetAccessibleGeolocation" == pages.name)) {
          console.info("get GeolocationPermissionsGetAccessibleGeolocation state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GeolocationPermissionsGetAccessibleGeolocation page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GeolocationPermissionsGetAccessibleGeolocation page error: " + err);
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
      try {
        await driver.waitForComponent(ON.id("getAccessibleGeolocationClick"), 10000);
      } catch (e) {
        const error = e as BusinessError;
        console.error(`${emitKey} ErrorCode: ${error.code},  Message: ${error.message}`);
      }
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      done();
    })

    /**
     * @tc.name testGetAccessibleGeolocationEmptyOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_GET_ACCESSIBLE_GEOLOCATION_EMPTY_ORIGIN_001
     * @tc.desc Test getAccessibleGeolocation with empty origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetAccessibleGeolocationEmptyOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetAccessibleGeolocationEmptyOrigin';
        let tcName = 'testGetAccessibleGeolocationEmptyOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260265, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getAccessibleGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetAccessibleGeolocationNullOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_GET_ACCESSIBLE_GEOLOCATION_NULL_ORIGIN_002
     * @tc.desc Test getAccessibleGeolocation with null origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetAccessibleGeolocationNullOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetAccessibleGeolocationNullOrigin';
        let tcName = 'testGetAccessibleGeolocationNullOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260266, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getAccessibleGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testGetAccessibleGeolocationUndefinedOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_GET_ACCESSIBLE_GEOLOCATION_UNDEFINED_ORIGIN_003
     * @tc.desc Test getAccessibleGeolocation with undefined origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testGetAccessibleGeolocationUndefinedOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testGetAccessibleGeolocationUndefinedOrigin';
        let tcName = 'testGetAccessibleGeolocationUndefinedOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260267, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "getAccessibleGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
