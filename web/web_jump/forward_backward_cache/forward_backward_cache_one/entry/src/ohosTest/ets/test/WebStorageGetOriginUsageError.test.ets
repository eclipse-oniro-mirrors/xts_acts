/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
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

export default function webStorageGetOriginUsageError() {
  describe('WebStorageGetOriginUsageErrorTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebStorageGetOriginUsageError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebStorageGetOriginUsageError state success ' + JSON.stringify(pages));
        if (!('WebStorageGetOriginUsageError' == pages.name)) {
          console.info('get WebStorageGetOriginUsageError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebStorageGetOriginUsageError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebStorageGetOriginUsageError page error: ' + err);
      }
      await waitForComponent('WebStorageGetOriginUsageErrorButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorageGetOriginUsageError beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageGetOriginUsageError afterEach start');
      console.info('webStorageGetOriginUsageError afterEach end');
      done();
    })

    /**
     * @tc.name   testGetOriginUsageEmptyString
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_ERROR_001
     * @tc.desc   WebStorage getOriginUsage empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageEmptyString', 135079);
      Utils.registerEvent('testGetOriginUsageEmptyString', '17100011', 135073, done);
      sendEventByKey('WebStorageGetOriginUsageErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsageNull
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_ERROR_002
     * @tc.desc   WebStorage getOriginUsage null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageNull', 135079);
      Utils.registerEvent('testGetOriginUsageNull', '401', 135075, done);
      sendEventByKey('WebStorageGetOriginUsageErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsageUndefined
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_ERROR_003
     * @tc.desc   WebStorage getOriginUsage undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageUndefined', 135079);
      Utils.registerEvent('testGetOriginUsageUndefined', '401', 135077, done);
      sendEventByKey('WebStorageGetOriginUsageErrorButton', 10, '');
    })
  })
}
