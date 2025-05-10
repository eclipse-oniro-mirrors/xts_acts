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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function geolocationPermissions() {

  describe('GeolocationPermissionsTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/geolocationPermissions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get geolocationPermissions state success " + JSON.stringify(pages));
        if (!("geolocationPermissions" == pages.name)) {
          console.info("get geolocationPermissions state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push geolocationPermissions page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push geolocationPermissions page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("geolocationPermissions beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_DELETEALLGEOLOCATION_0100
    * @tc.name       : testDeleteAllGeolocation001
    * @tc.desc       : test deleteAllGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteAllGeolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeleteAllGeolocation001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteAllGeolocation001", "", 30055, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETSTOREDGEOLOCATION_0300
    * @tc.name       : testGetStoredGeolocation003
    * @tc.desc       : test getStoredGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetStoredGeolocation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetStoredGeolocation003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetStoredGeolocation003", '', 100011, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETSTOREDGEOLOCATION_0400
    * @tc.name       : testGetStoredGeolocation004
    * @tc.desc       : test getStoredGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetStoredGeolocation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetStoredGeolocation004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetStoredGeolocation004", '', 100012, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETSTOREDGEOLOCATION_0100
    * @tc.name       : testGetStoredGeolocation001
    * @tc.desc       : test getStoredGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetStoredGeolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetStoredGeolocation001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetStoredGeolocation001", "file:///", 30060, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETSTOREDGEOLOCATION_0200
    * @tc.name       : testGetStoredGeolocation002
    * @tc.desc       : test getStoredGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetStoredGeolocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetStoredGeolocation002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetStoredGeolocation002", "file:///", 30061, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_GETACCESSIBLEGEOLOCATION_0100
    * @tc.name       : testGetAccessibleGeolocation001
    * @tc.desc       : test getAccessibleGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetAccessibleGeolocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocation001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocation001", true, 100008, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETACCESSIBLEGEOLOCATION_0200
    * @tc.name       : testGetAccessibleGeolocation002
    * @tc.desc       : test getAccessibleGeolocation
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetAccessibleGeolocation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocation002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocation002", true, 100009, done);
      sendEventByKey('GeolocationPermissionsButton', 10, '');
    })

  })
}
