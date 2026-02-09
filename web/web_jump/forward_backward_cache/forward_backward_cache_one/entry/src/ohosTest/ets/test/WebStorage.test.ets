/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

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
        console.info('get webStorage state success ' + JSON.stringify(pages));
        if (!('webStorage' == pages.name)) {
          console.info('get webStorage state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webStorage page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webStorage page error: ' + err);
      }
      await waitForComponent('WebStorageButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorage beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorage afterEach start');
      console.info('webStorage afterEach end');
      done();
    })

    /**
     * @tc.name   testGetOrigins001
     * @tc.number SUB_WEB_GETORIGINS_0100
     * @tc.desc   test getOrigins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOrigins001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('testGetOrigins001', 134900)
      Utils.registerEvent('testGetOrigins001', 'resource://rawfile/', 134910, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testGetOrigins002
     * @tc.number SUB_WEB_GETORIGINS_0200
     * @tc.desc   test getOrigins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOrigins002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetOrigins002', 134900)
      Utils.registerEvent('testGetOrigins002', 'resource://rawfile/', 134920, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testWebStorageOriginOrigin001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_ORIGIN_0100
     * @tc.desc   test WebStorageOrigin origin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebStorageOriginOrigin001', 134900)
      Utils.registerEvent('testWebStorageOriginOrigin001', 'resource://rawfile/', 134930, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testWebStorageOriginUsage001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_USAGE_0100
     * @tc.desc   test WebStorageOrigin usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginUsage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebStorageOriginUsage001', 134900)
      Utils.registerEvent('testWebStorageOriginUsage001', true, 134940, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testWebStorageOriginQuota001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_QUOTA_0100
     * @tc.desc   test WebStorageOrigin quota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginQuota001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebStorageOriginQuota001', 134900)
      Utils.registerEvent('testWebStorageOriginQuota001', true, 134950, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testWebStorageOriginGetOrigins001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_GETORIGINS_0100
     * @tc.desc   test WebStorageOrigin GetOrigins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginGetOrigins001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testWebStorageOriginGetOrigins001', 134900)
        Utils.registerEvent('testWebStorageOriginGetOrigins001', true, 134960, done);
        sendEventByKey('WebStorageButton', 10, '');
      })

    /**
     * @tc.name   testWebStorageOriginGetOriginQuota001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_GETORIGINQUOTA_0100
     * @tc.desc   test WebStorageOrigin getOriginQuota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginGetOriginQuota001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testWebStorageOriginGetOriginQuota001', 134900)
        Utils.registerEvent('testWebStorageOriginGetOriginQuota001', true, 134970, done);
        sendEventByKey('WebStorageButton', 10, '');
      })

    /**
     * @tc.name   testWebStorageOriginGetOriginQuota002
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_GETORIGINQUOTA_0200
     * @tc.desc   test WebStorageOrigin getOriginQuota
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginGetOriginQuota002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testWebStorageOriginGetOriginQuota002', 134900)
        Utils.registerEvent('testWebStorageOriginGetOriginQuota002', true, 134980, done);
        sendEventByKey('WebStorageButton', 10, '');
      })

    /**
     * @tc.name   testWebStorageOriginGetOriginUsage001
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_GETORIGINUSAGE_0100
     * @tc.desc   test WebStorageOrigin getOriginUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginGetOriginUsage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testWebStorageOriginGetOriginUsage001', 134900)
        Utils.registerEvent('testWebStorageOriginGetOriginUsage001', true, 134990, done);
        sendEventByKey('WebStorageButton', 10, '');
      })

    /**
     * @tc.name   testWebStorageOriginGetOriginUsage002
     * @tc.number SUB_WEB_WEBSTORAGEORIGIN_GETORIGINUSAGE_0200
     * @tc.desc   test WebStorageOrigin getOriginUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStorageOriginGetOriginUsage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testWebStorageOriginGetOriginUsage002', 134900)
        Utils.registerEvent('testWebStorageOriginGetOriginUsage002', true, 135000, done);
        sendEventByKey('WebStorageButton', 10, '');
      })

    /**
     * @tc.name   testDeleteAllData001
     * @tc.number SUB_WEB_DELETEALLDATA_0100
     * @tc.desc   test deleteAllData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteAllData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDeleteAllData001', 134900)
      Utils.registerEvent('testDeleteAllData001', 0, 135010, done);
      sendEventByKey('WebStorageButton', 10, '');
    })

    /**
     * @tc.name   testDeleteOrigin001
     * @tc.number SUB_WEB_DELETEORIGIN_0100
     * @tc.desc   test deleteOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDeleteOrigin001', 134900)
      Utils.registerEvent('testDeleteOrigin001', 0, 135020, done);
      sendEventByKey('WebStorageButton', 10, '');
    })
  })
}
