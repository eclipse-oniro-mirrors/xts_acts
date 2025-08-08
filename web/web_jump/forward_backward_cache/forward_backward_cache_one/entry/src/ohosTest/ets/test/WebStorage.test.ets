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
export default function webStorage() {

  describe('WebStorageTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webStorage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webStorage state success " + JSON.stringify(pages));
        if (!("webStorage" == pages.name)) {
          console.info("get webStorage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webStorage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webStorage page error: " + err);
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
      console.info("webStorage beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webStorage afterEach start");
      await Utils.sleep(1000);
      console.info("webStorage afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_GETORIGINS_0100
    * @tc.name       : testGetOrigins001
    * @tc.desc       : test getOrigins
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testGetOrigins001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testGetOrigins001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOrigins001", "resource://rawfile/", 20340, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_GETORIGINS_0200
    * @tc.name       : testGetOrigins002
    * @tc.desc       : test getOrigins
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetOrigins002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetOrigins002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOrigins002", "resource://rawfile/", 20341, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_ORIGIN_0100
    * @tc.name       : testWebStorageOriginOrigin001
    * @tc.desc       : test WebStorageOrigin origin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginOrigin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginOrigin001", "resource://rawfile/", 20342, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_USAGE_0100
    * @tc.name       : testWebStorageOriginUsage001
    * @tc.desc       : test WebStorageOrigin usage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginUsage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginUsage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginUsage001", true, 20343, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_QUOTA_0100
    * @tc.name       : testWebStorageOriginQuota001
    * @tc.desc       : test WebStorageOrigin quota
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginQuota001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginQuota001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginQuota001", true, 20344, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_GETORIGINS_0100
    * @tc.name       : testWebStorageOriginGetOrigins001
    * @tc.desc       : test WebStorageOrigin GetOrigins
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginGetOrigins001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginGetOrigins001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginGetOrigins001", true, 100037, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_GETORIGINQUOTA_0100
    * @tc.name       : testWebStorageOriginGetOriginQuota001
    * @tc.desc       : test WebStorageOrigin getOriginQuota
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginGetOriginQuota001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginGetOriginQuota001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginGetOriginQuota001", true, 100038, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_GETORIGINQUOTA_0200
    * @tc.name       : testWebStorageOriginGetOriginQuota002
    * @tc.desc       : test WebStorageOrigin getOriginQuota
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginGetOriginQuota002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginGetOriginQuota002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginGetOriginQuota002", true, 100039, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_GETORIGINUSAGE_0100
    * @tc.name       : testWebStorageOriginGetOriginUsage001
    * @tc.desc       : test WebStorageOrigin getOriginUsage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginGetOriginUsage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginGetOriginUsage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginGetOriginUsage001", true, 100040, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBSTORAGEORIGIN_GETORIGINUSAGE_0200
    * @tc.name       : testWebStorageOriginGetOriginUsage002
    * @tc.desc       : test WebStorageOrigin getOriginUsage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebStorageOriginGetOriginUsage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStorageOriginGetOriginUsage002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebStorageOriginGetOriginUsage002", true, 100041, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETEALLDATA_0100
    * @tc.name       : testDeleteAllData001
    * @tc.desc       : test deleteAllData
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteAllData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeleteAllData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteAllData001", 0, 20345, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DELETEORIGIN_0100
    * @tc.name       : testDeleteOrigin001
    * @tc.desc       : test deleteOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDeleteOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDeleteOrigin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDeleteOrigin001", 0, 100067, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

  })
}
