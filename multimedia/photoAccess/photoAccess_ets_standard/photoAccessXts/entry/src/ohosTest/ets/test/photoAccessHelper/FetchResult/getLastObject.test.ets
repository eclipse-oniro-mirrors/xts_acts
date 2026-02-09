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
import {
  fetchAllOption,
  getPermission,
  driveFn,
  fetchOption,
  photoKeys,
  photoType,
  LOG_TAG
} from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'getLastObject';

async function getLastObjectPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
    }
    let fetchCount: number = fetchResult.getCount();
    if (fetchCount === undefined || fetchCount < 0) {
      expect().assertFail();
      done();
    }
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
    console.info(TAG, 'photoAsset displayName: ', photoAsset.displayName);
    await fetchResult.close();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

async function getLastObjectCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
    }
    let fetchCount: number = fetchResult.getCount();
    if (fetchCount === undefined || fetchCount < 0) {
      expect().assertFail();
      done();
    }
    fetchResult.getLastObject((err, photoAsset) => {
      fetchResult.close();
      if (photoAsset !== undefined) {
        console.info(TAG, 'photoAsset displayName: ', photoAsset.displayName);
      } else {
        console.error(TAG, `photoAsset failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
      }
      done();
    });
  } catch (error) {
    console.info(`failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function getLastObjectTest() {
  describe('getLastObjectTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
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
     * @tc.name   fetchResult_getLastObject_promise_001
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_001
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getLastObjectPromiseTest(done, fetchOps, testName);
    })

    /**
     * @tc.name   fetchResult_getLastObject_promise_002
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_002
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getLastObjectPromiseTest(done, fetchOps, testName);
    })

    /**
     * @tc.name   fetchResult_getLastObject_promise_003
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_003
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getLastObjectPromiseTest(done, fetchOps, testName);
    })

    /**
     * @tc.name   fetchResult_getLastObject_callback_001
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_004
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_callback_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getLastObjectCallbackTest(done, fetchOps, testName);
    })

    /**
     * @tc.name   fetchResult_getLastObject_callback_002
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_005
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_callback_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getLastObjectCallbackTest(done, fetchOps, testName);
    })

    /**
     * @tc.name   fetchResult_getLastObject_callback_003
     * @tc.number FETCH_RESULT_GET_LAST_OBJECT_006
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getLastObject_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getLastObject_callback_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getLastObjectCallbackTest(done, fetchOps, testName);
    })
  })
}