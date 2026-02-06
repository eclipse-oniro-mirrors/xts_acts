/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, fetchAllOption } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'cancelRequestSupp';

const cancelRequestAbnormalPromiseTest =
  async (done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions, testContext:common.UIAbilityContext | null |undefined,requestId: string,
    callback: (err: number) => void) => {
    let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    try {
      phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
        console.info(TAG, 'fetchResult success');
        console.info(TAG, 'requestImage successfully', requestId);
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId);
        done();
      });
    } catch (error) {
      console.info(TAG, `failed; error: ${error}`, testName);
      callback(error.code);
      done();
    }
  }


export default function MediaAssetManagerCancelRequestTest() {
  describe('MediaAssetManagerCancelRequestTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.name   cancel_Request_abnormal_promise_0001
     * @tc.number cancel_Request_abnormal_promise_0001
     * @tc.desc   cancelRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_Request_abnormal_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_Request_abnormal_promise_0001';
      const fetchOptions = fetchAllOption();
      let testContext: common.UIAbilityContext = '' as ESObject;
      let requestId = '123';
      await cancelRequestAbnormalPromiseTest(done, testName, fetchOptions, testContext,requestId,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   cancel_Request_abnormal_promise_0002
     * @tc.number cancel_Request_abnormal_promise_0002
     * @tc.desc   cancelRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_Request_abnormal_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_Request_abnormal_promise_0002';
      const fetchOptions = fetchAllOption();
      let testContext: common.UIAbilityContext = null as ESObject;
      let requestId = '123';
      await cancelRequestAbnormalPromiseTest(done, testName, fetchOptions, testContext,requestId,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   cancel_Request_abnormal_promise_0004
     * @tc.number cancel_Request_abnormal_promise_0004
     * @tc.desc   cancelRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_Request_abnormal_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_Request_abnormal_promise_0004';
      const fetchOptions = fetchAllOption();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let requestId = '';
      await cancelRequestAbnormalPromiseTest(done, testName, fetchOptions, testContext,requestId,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   cancel_Request_abnormal_promise_0005
     * @tc.number cancel_Request_abnormal_promise_0005
     * @tc.desc   cancelRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_Request_abnormal_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_Request_abnormal_promise_0005';
      const fetchOptions = fetchAllOption();
      let testContext: common.UIAbilityContext = '' as ESObject;
      let requestId = '';
      await cancelRequestAbnormalPromiseTest(done, testName, fetchOptions, testContext,requestId,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   cancel_Request_abnormal_promise_0006
     * @tc.number cancel_Request_abnormal_promise_0006
     * @tc.desc   cancelRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_Request_abnormal_promise_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_Request_abnormal_promise_0006';
      const fetchOptions = fetchAllOption();
      let testContext: common.UIAbilityContext = null as ESObject;
      let requestId = '';
      await cancelRequestAbnormalPromiseTest(done, testName, fetchOptions, testContext,requestId,(errCode) => {
        expect().assertFail();
      });
    })

  })
}