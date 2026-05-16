/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
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
const EVENT_ID_SET_SUITE_KEY = 154012;

let emitKey = "";

export default function GeolocationPermissionsAllowGeolocationTest() {
  describe('GeolocationPermissionsAllowGeolocationTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GeolocationPermissionsAllowGeolocation',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get GeolocationPermissionsAllowGeolocation state success " + JSON.stringify(pages));
        if (!("GeolocationPermissionsAllowGeolocation" == pages.name)) {
          console.info("get GeolocationPermissionsAllowGeolocation state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GeolocationPermissionsAllowGeolocation page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GeolocationPermissionsAllowGeolocation page error: " + JSON.stringify(err));
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
        await driver.waitForComponent(ON.id("allowGeolocationClick"), 10000);
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
     * @tc.name testAllowGeolocationEmptyOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_ALLOW_GEOLOCATION_EMPTY_ORIGIN_001
     * @tc.desc Test allowGeolocation with empty origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testAllowGeolocationEmptyOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testAllowGeolocationEmptyOrigin';
        let tcName = 'testAllowGeolocationEmptyOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260256, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "allowGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testAllowGeolocationNullOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_ALLOW_GEOLOCATION_NULL_ORIGIN_002
     * @tc.desc Test allowGeolocation with null origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testAllowGeolocationNullOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testAllowGeolocationNullOrigin';
        let tcName = 'testAllowGeolocationNullOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260257, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "allowGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testAllowGeolocationUndefinedOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_ALLOW_GEOLOCATION_UNDEFINED_ORIGIN_003
     * @tc.desc Test allowGeolocation with undefined origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testAllowGeolocationUndefinedOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testAllowGeolocationUndefinedOrigin';
        let tcName = 'testAllowGeolocationUndefinedOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260258, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "allowGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testAllowGeolocationIncognitoFalse
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_ALLOW_GEOLOCATION_INCOGNITO_FALSE_004
     * @tc.desc Test allowGeolocation with incognito=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testAllowGeolocationIncognitoFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testAllowGeolocationIncognitoFalse';
        let tcName = 'testAllowGeolocationIncognitoFalse';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "success", 20260259, () => {
          isReturn =  true
        });
        Utils.waitAndClickComponent(driver, "allowGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
