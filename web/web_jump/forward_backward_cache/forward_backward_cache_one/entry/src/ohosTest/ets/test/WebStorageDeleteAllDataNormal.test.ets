/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { waitForComponent } from './WaitTest.test';

export default function webStorageDeleteAllDataNormal() {
  describe('WebStorageDeleteAllDataNormalTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/DeleteAllDataNormal',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webStorageDeleteAllDataNormal state success ' + JSON.stringify(pages));
        if (!('DeleteAllDataNormal' == pages.name)) {
          console.info('get webStorageDeleteAllDataNormal state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webStorageDeleteAllDataNormal page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webStorageDeleteAllDataNormal page error: ' + err);
      }
      await waitForComponent('DeleteAllDataNormalButton');
      done()
    });

    beforeEach(async (done: Function) => {
      console.info('webStorageDeleteAllDataNormal beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webStorageDeleteAllDataNormal afterEach start');
      console.info('webStorageDeleteAllDataNormal afterEach end');
      done();
    })

    /**
     * @tc.name   testDeleteAllDataFalse
     * @tc.number SUB_WEB_DELETEALLDATA_0200
     * @tc.desc   test deleteAllData with incognito false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteAllDataFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDeleteAllDataFalse', 134909)
      Utils.registerEvent('testDeleteAllDataFalse', 0, 135038, done);
      sendEventByKey('DeleteAllDataNormalButton', 10, '');
    })
  })
}
