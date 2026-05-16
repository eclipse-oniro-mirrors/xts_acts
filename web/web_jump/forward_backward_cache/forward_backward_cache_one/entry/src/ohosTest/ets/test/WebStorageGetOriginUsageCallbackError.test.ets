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

export default function webStorageGetOriginUsageCallbackError() {
  describe('WebStorageGetOriginUsageCallbackErrorTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebStorageGetOriginUsageCallbackError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebStorageGetOriginUsageCallbackError state success ' + JSON.stringify(pages));
        if (!('WebStorageGetOriginUsageCallbackError' == pages.name)) {
          console.info('get WebStorageGetOriginUsageCallbackError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebStorageGetOriginUsageCallbackError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webStorageGetOriginUsageCallbackError page error: ' + err);
      }
      await waitForComponent('WebStorageGetOriginUsageCallbackErrorButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorageGetOriginUsageCallbackError beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageGetOriginUsageCallbackError afterEach start');
      console.info('webStorageGetOriginUsageCallbackError afterEach end');
      done();
    })

    /**
     * @tc.name   testGetOriginUsageCallbackEmptyString
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_CALLBACK_ERROR_001
     * @tc.desc   WebStorage getOriginUsage callback empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageCallbackEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageCallbackEmptyString', 135081);
      Utils.registerEvent('testGetOriginUsageCallbackEmptyString', '17100011', 135083, done);
      sendEventByKey('WebStorageGetOriginUsageCallbackErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsageCallbackNull
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_CALLBACK_ERROR_002
     * @tc.desc   WebStorage getOriginUsage callback null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageCallbackNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageCallbackNull', 135081);
      Utils.registerEvent('testGetOriginUsageCallbackNull', '401', 135085, done);
      sendEventByKey('WebStorageGetOriginUsageCallbackErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginUsageCallbackUndefined
     * @tc.number SUB_WEB_STORAGE_GETORIGINUSAGE_CALLBACK_ERROR_003
     * @tc.desc   WebStorage getOriginUsage callback undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginUsageCallbackUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginUsageCallbackUndefined', 135081);
      Utils.registerEvent('testGetOriginUsageCallbackUndefined', '401', 135087, done);
      sendEventByKey('WebStorageGetOriginUsageCallbackErrorButton', 10, '');
    })
  })
}
