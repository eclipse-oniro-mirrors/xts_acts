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

export default function webStorageGetOriginQuotaCallbackError() {
  describe('WebStorageGetOriginQuotaCallbackErrorTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebStorageGetOriginQuotaCallbackError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebStorageGetOriginQuotaCallbackError state success ' + JSON.stringify(pages));
        if (!('WebStorageGetOriginQuotaCallbackError' == pages.name)) {
          console.info('get WebStorageGetOriginQuotaCallbackError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebStorageGetOriginQuotaCallbackError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webStorageGetOriginQuotaCallbackError page error: ' + err);
      }
      await waitForComponent('WebStorageGetOriginQuotaCallbackErrorButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorageGetOriginQuotaCallbackError beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageGetOriginQuotaCallbackError afterEach start');
      console.info('webStorageGetOriginQuotaCallbackError afterEach end');
      done();
    })

    /**
     * @tc.name   testGetOriginQuotaCallbackEmptyString
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_CALLBACK_ERROR_001
     * @tc.desc   WebStorage getOriginQuota callback empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaCallbackEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaCallbackEmptyString', 135161);
      Utils.registerEvent('testGetOriginQuotaCallbackEmptyString', '17100011', 135067, done);
      sendEventByKey('WebStorageGetOriginQuotaCallbackErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaCallbackNull
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_CALLBACK_ERROR_002
     * @tc.desc   WebStorage getOriginQuota callback null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaCallbackNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaCallbackNull', 135161);
      Utils.registerEvent('testGetOriginQuotaCallbackNull', '401', 135069, done);
      sendEventByKey('WebStorageGetOriginQuotaCallbackErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginQuotaCallbackUndefined
     * @tc.number SUB_WEB_STORAGE_GETORIGINQUOTA_CALLBACK_ERROR_003
     * @tc.desc   WebStorage getOriginQuota callback undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginQuotaCallbackUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testGetOriginQuotaCallbackUndefined', 135161);
      Utils.registerEvent('testGetOriginQuotaCallbackUndefined', '401', 135071, done);
      sendEventByKey('WebStorageGetOriginQuotaCallbackErrorButton', 10, '');
    })
  })
}
