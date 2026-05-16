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

export default function webStorageDeleteOriginError() {
  describe('WebStorageDeleteOriginErrorTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebStorageDeleteOriginError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebStorageDeleteOriginError state success ' + JSON.stringify(pages));
        if (!('WebStorageDeleteOriginError' == pages.name)) {
          console.info('get WebStorageDeleteOriginError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebStorageDeleteOriginError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebStorageDeleteOriginError page error: ' + err);
      }
      await waitForComponent('WebStorageDeleteOriginErrorButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webStorageDeleteOriginError beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageDeleteOriginError afterEach start');
      console.info('webStorageDeleteOriginError afterEach end');
      done();
    })

    /**
     * @tc.name   testDeleteOriginEmptyString
     * @tc.number SUB_WEB_STORAGE_DELETEORIGIN_ERROR_001
     * @tc.desc   WebStorage deleteOrigin empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testDeleteOriginEmptyString', 135049);
      Utils.registerEvent('testDeleteOriginEmptyString', '17100011', 20245058, done);
      sendEventByKey('WebStorageDeleteOriginErrorButton', 10, '');
    })

    /**
     * @tc.name   testDeleteOriginNull
     * @tc.number SUB_WEB_STORAGE_DELETEORIGIN_ERROR_002
     * @tc.desc   WebStorage deleteOrigin null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testDeleteOriginNull', 135049);
      Utils.registerEvent('testDeleteOriginNull', '401', 20245059, done);
      sendEventByKey('WebStorageDeleteOriginErrorButton', 10, '');
    })

    /**
     * @tc.name   testDeleteOriginUndefined
     * @tc.number SUB_WEB_STORAGE_DELETEORIGIN_ERROR_003
     * @tc.desc   WebStorage deleteOrigin undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteOriginUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('testDeleteOriginUndefined', 135049);
      Utils.registerEvent('testDeleteOriginUndefined', '401', 20245060, done);
      sendEventByKey('WebStorageDeleteOriginErrorButton', 10, '');
    })
  })
}
