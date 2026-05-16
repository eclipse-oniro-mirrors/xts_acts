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
const EVENT_ID_SET_SUITE_KEY = 154014;

let emitKey = "";

export default function GeolocationPermissionsDeleteAllGeolocationTest() {
  describe('GeolocationPermissionsDeleteAllGeolocationTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GeolocationPermissionsDeleteAllGeolocation',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get GeolocationPermissionsDeleteAllGeolocation state success " + JSON.stringify(pages));
        if (!("GeolocationPermissionsDeleteAllGeolocation" == pages.name)) {
          console.info("get GeolocationPermissionsDeleteAllGeolocation state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GeolocationPermissionsDeleteAllGeolocation page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GeolocationPermissionsDeleteAllGeolocation page error: " + err);
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
        await driver.waitForComponent(ON.id("deleteAllGeolocationClick"), 10000);
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
     * @tc.name testDeleteAllGeolocationIncognitoFalse
     * @tc.number SUB_WEB_GEOLOCATION_PERMISSIONS_DELETE_ALL_GEOLOCATION_INCOGNITO_FALSE_001
     * @tc.desc Test deleteAllGeolocation with incognito=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testDeleteAllGeolocationIncognitoFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testDeleteAllGeolocationIncognitoFalse';
        let tcName = 'testDeleteAllGeolocationIncognitoFalse';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "success", 20260264, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "deleteAllGeolocationClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
