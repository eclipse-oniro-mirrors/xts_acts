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

export default function webStorageGetOriginQuotaError() {
  describe('WebStorageGetOriginQuotaErrorTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebStorageGetOriginQuotaError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebStorageGetOriginQuotaError state success ' + JSON.stringify(pages));
        if (!('WebStorageGetOriginQuotaError' == pages.name)) {
          console.info('get WebStorageGetOriginQuotaError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebStorageGetOriginQuotaError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebStorageGetOriginQuotaError page error: ' + err);
      }
      await waitForComponent('WebStorageGetOriginQuotaErrorButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorageGetOriginQuotaError beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageGetOriginQuotaError afterEach start');
      console.info('webStorageGetOriginQuotaError afterEach end');
      done();
    })

    /**
     * @tc.name   testGetOriginQuotaEmptyString
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_ERROR_001
     * @tc.desc   WebStorage getOriginQuota empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaEmptyString', 135059);
      Utils.registerEvent('testGetOriginQuotaEmptyString', '17100011', 135061, done);
      sendEventByKey('WebStorageGetOriginQuotaErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaNull
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_ERROR_002
     * @tc.desc   WebStorage getOriginQuota null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaNull', 135059);
      Utils.registerEvent('testGetOriginQuotaNull', '401', 135063, done);
      sendEventByKey('WebStorageGetOriginQuotaErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaUndefined
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_ERROR_003
     * @tc.desc   WebStorage getOriginQuota undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaUndefined', 135059);
      Utils.registerEvent('testGetOriginQuotaUndefined', '401', 135065, done);
      sendEventByKey('WebStorageGetOriginQuotaErrorButton', 10, '');
    })
  })
}
