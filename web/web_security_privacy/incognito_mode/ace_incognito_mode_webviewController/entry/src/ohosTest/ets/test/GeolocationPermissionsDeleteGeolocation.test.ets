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
const EVENT_ID_SET_SUITE_KEY = 154013;

let emitKey = "";

export default function GeolocationPermissionsDeleteGeolocationTest() {
  describe('GeolocationPermissionsDeleteGeolocationTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GeolocationPermissionsDeleteGeolocation',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get GeolocationPermissionsDeleteGeolocation state success " + JSON.stringify(pages));
        if (!("GeolocationPermissionsDeleteGeolocation" == pages.name)) {
          console.info("get GeolocationPermissionsDeleteGeolocation state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GeolocationPermissionsDeleteGeolocation page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GeolocationPermissionsDeleteGeolocation page error: " + err);
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
        await driver.waitForComponent(ON.id("deleteGeolocationClick"), 10000);
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
     * @tc.name testDeleteGeolocationEmptyOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_DELETE_GEOLOCATION_EMPTY_ORIGIN_001
     * @tc.desc Test deleteGeolocation with empty origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testDeleteGeolocationEmptyOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testDeleteGeolocationEmptyOrigin';
        let tcName = 'testDeleteGeolocationEmptyOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260260, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "deleteGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testDeleteGeolocationNullOrigin
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_DELETE_GEOLOCATION_NULL_ORIGIN_002
     * @tc.desc Test deleteGeolocation with null origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testDeleteGeolocationNullOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testDeleteGeolocationNullOrigin';
        let tcName = 'testDeleteGeolocationNullOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260261, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "deleteGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testDeleteGeolocationUndefinedOrigin
     * @tc.number SUBWEB_GEOLOCATION_PERMISSIONS_DELETE_GEOLOCATION_UNDEFINED_ORIGIN_003
     * @tc.desc Test deleteGeolocation with undefined origin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testDeleteGeolocationUndefinedOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testDeleteGeolocationUndefinedOrigin';
        let tcName = 'testDeleteGeolocationUndefinedOrigin';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260262, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "deleteGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testDeleteGeolocationIncognitoFalse
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_DELETE_GEOLOCATION_INCOGNITO_FALSE_004
     * @tc.desc Test deleteGeolocation with incognito=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testDeleteGeolocationIncognitoFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testDeleteGeolocationIncognitoFalse';
        let tcName = 'testDeleteGeolocationIncognitoFalse';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "success", 20260263, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "deleteGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
