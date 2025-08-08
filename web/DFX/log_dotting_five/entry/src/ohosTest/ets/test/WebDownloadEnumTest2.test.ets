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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webDownloadEnumTestTwo() {

  describe('webDownloadEnumTestTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadEnumTest2',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages));
        if (!("WebDownloadEnumTest" == pages.name)) {
          console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebDownloadEnumTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDownloadEnumTest page error: " + err);
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

    afterEach(async (done: Function) => {
      console.info("WebDownloadEnumTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebDownloadEnumTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0100
    * @tc.name        : testWebDownloadEnumGroup001
    * @tc.desc        : test the value of WebDownloadErrorCode.ERROR_UNKNOWN is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum001", 0, 70250, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0200
    * @tc.name        : testWebDownloadEnumGroup002
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_FAILED is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum002", 1, 70251, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0300
    * @tc.name        : testWebDownloadEnumGroup003
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_ACCESS_DENIED is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnumGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum003", 2, 70252, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0400
    * @tc.name        : testWebDownloadEnumGroup004
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_NO_SPACE is 3
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnumGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum004", 3, 70253, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0500
    * @tc.name        : testWebDownloadEnumGroup005
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_NAME_TOO_LONG is 5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum005", 5, 70254, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0600
    * @tc.name        : testWebDownloadEnumGroup006
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TOO_LARGE is 6
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum006", 6, 70255, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0700
    * @tc.name        : testWebDownloadEnumGroup007
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TRANSIENT_ERROR is 10
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum007", 10, 70256, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0800
    * @tc.name        : testWebDownloadEnumGroup008
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_BLOCKED is 11
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum008", 11, 70257, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0900
    * @tc.name        : testWebDownloadEnumGroup009
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TOO_SHORT is 13
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum009", 13, 70258, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1000
    * @tc.name        : testWebDownloadEnumGroup010
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_HASH_MISMATCH is 14
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum010", 14, 70259, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1100
    * @tc.name        : testWebDownloadEnumGroup011
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_SAME_AS_SOURCE is 15
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum011", 15, 70260, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1200
    * @tc.name        : testWebDownloadEnumGroup012
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_FAILED is 20
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum012", 20, 70261, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1300
    * @tc.name        : testWebDownloadEnumGroup013
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_TIMEOUT is 21
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum013", 21, 70262, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1400
    * @tc.name        : testWebDownloadEnumGroup014
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_DISCONNECTED is 22
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum014", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum014", 22, 70263, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1500
    * @tc.name        : testWebDownloadEnumGroup015
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_SERVER_DOWN is 23
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnumGroup015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum015", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum015", 23, 70264, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1600
    * @tc.name        : testWebDownloadEnumGroup016
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_INVALID_REQUEST is 24
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum016", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum016", 24, 70265, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1700
    * @tc.name        : testWebDownloadEnumGroup017
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_FAILED is 30
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum017", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum017", 30, 70266, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1800
    * @tc.name        : testWebDownloadEnumGroup018
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_NO_RANGE is 31
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnumGroup018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum018", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum018", 31, 70267, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1900
    * @tc.name        : testWebDownloadEnumGroup019
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_BAD_CONTENT is 33
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum019", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum019", 33, 70268, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2000
    * @tc.name        : testWebDownloadEnumGroup020
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_UNAUTHORIZED is 34
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum020", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum020", 34, 70269, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2100
    * @tc.name        : testWebDownloadEnumGroup021
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CERT_PROBLEM is 35
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum021", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum021", 35, 70270, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2200
    * @tc.name        : testWebDownloadEnumGroup022
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_FORBIDDEN is 36
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum022", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum022", 36, 70271, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2300
    * @tc.name        : testWebDownloadEnumGroup023
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_UNREACHABLE is 37
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum023", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum023", 37, 70272, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2400
    * @tc.name        : testWebDownloadEnumGroup024
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH is 38
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum024", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum024", 38, 70273, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2500
    * @tc.name        : testWebDownloadEnumGroup025
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT is 39
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum025", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum025", 39, 70274, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2600
    * @tc.name        : testWebDownloadEnumGroup026
    * @tc.desc        : test the value of WebDownloadErrorCode.USER_CANCELED is 40
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum026", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum026", 40, 70275, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2700
    * @tc.name        : testWebDownloadEnumGroup027
    * @tc.desc        : test the value of WebDownloadErrorCode.USER_SHUTDOWN is 41
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum027", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum027", 41, 70276, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2800
    * @tc.name        : testWebDownloadEnumGroup028
    * @tc.desc        : test the value of WebDownloadErrorCode.CRASH is 50
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebDownloadEnumGroup028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum028", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebDownloadEnum028", 50, 70277, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    
  })
}
