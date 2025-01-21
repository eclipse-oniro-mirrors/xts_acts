/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function geolocationPermissionsErrorCode() {

  describe('GeolocationPermissionsErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/geolocationPermissionsErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get geolocationPermissionsErrorCode state success " + JSON.stringify(pages));
        if (!("geolocationPermissionsErrorCode" == pages.name)) {
          console.info("get geolocationPermissionsErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push geolocationPermissionsErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push geolocationPermissionsErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("geolocationPermissionsErrorCode beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("GeolocationPermissionsErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("GeolocationPermissionsErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0100
    * @tc.name       : testGetAccessibleGeolocationError001
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError001', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError001", '17100011', 20020, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0200
    * @tc.name       : testGetAccessibleGeolocationError002
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError002', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError002", '17100011', 20021, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0300
    * @tc.name       : testGetAccessibleGeolocationError003
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError003', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError003", '17100011', 20022, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0400
    * @tc.name       : testGetAccessibleGeolocationError004
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError004', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError004", '17100011', 20023, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0500
    * @tc.name       : testGetAccessibleGeolocationError005
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError005', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError005", '17100011', 20024, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0600
    * @tc.name       : testGetAccessibleGeolocationError006
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError006', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError006", '17100011', 20025, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0700
    * @tc.name       : testGetAccessibleGeolocationError007
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError007', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError007", '17100011', 20026, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETACCESSIBLEGEOLOCATION_0800
    * @tc.name       : testGetAccessibleGeolocationError008
    * @tc.desc       : test accessibleGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetAccessibleGeolocationError008', 0, async (done: Function) => {
      Utils.emitEvent("testGetAccessibleGeolocationError008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetAccessibleGeolocationError008", '17100011', 20027, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEGEOLOCATION_0100
    * @tc.name       : testDeleteGeolocationError001
    * @tc.desc       : test deleteGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteGeolocationError001', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteGeolocationError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteGeolocationError001", '17100011', 20010, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEGEOLOCATION_0200
    * @tc.name       : testDeleteGeolocationError002
    * @tc.desc       : test deleteGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteGeolocationError002', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteGeolocationError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteGeolocationError002", '17100011', 20011, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEGEOLOCATION_0300
    * @tc.name       : testDeleteGeolocationError003
    * @tc.desc       : test deleteGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteGeolocationError003', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteGeolocationError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteGeolocationError003", '17100011', 20012, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_DELETEGEOLOCATION_0400
    * @tc.name       : testDeleteGeolocationError004
    * @tc.desc       : test deleteGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testDeleteGeolocationError004', 0, async (done: Function) => {
      Utils.emitEvent("testDeleteGeolocationError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteGeolocationError004", '17100011', 20013, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ALLOWGEOLOCATION_0100
    * @tc.name       : testAllowGeolocationError001
    * @tc.desc       : test allowGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAllowGeolocationError001', 0, async (done: Function) => {
      Utils.emitEvent("testAllowGeolocationError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAllowGeolocationError001", '17100011', 20000, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ALLOWGEOLOCATION_0200
    * @tc.name       : testAllowGeolocationError002
    * @tc.desc       : test allowGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAllowGeolocationError002', 0, async (done: Function) => {
      Utils.emitEvent("testAllowGeolocationError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAllowGeolocationError002", '17100011', 20001, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ALLOWGEOLOCATION_0300
    * @tc.name       : testAllowGeolocationError003
    * @tc.desc       : test allowGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAllowGeolocationError003', 0, async (done: Function) => {
      Utils.emitEvent("testAllowGeolocationError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAllowGeolocationError003", '17100011', 20002, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ALLOWGEOLOCATION_0400
    * @tc.name       : testAllowGeolocationError004
    * @tc.desc       : test allowGeolocation error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testAllowGeolocationError004', 0, async (done: Function) => {
      Utils.emitEvent("testAllowGeolocationError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testAllowGeolocationError004", '17100011', 20003, done);
      sendEventByKey('GeolocationPermissionsErrorCodeButton', 10, '')
    })


  })
}
