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
import { fetchAllOption, getPermission, driveFn, fetchOption, photoKeys, photoType, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getObjectByPosition';

async function getObjectByPositionCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions,
  testName: string, index: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
    }
    let fetchCount: number = await fetchResult.getCount();
    if (fetchCount === undefined || fetchCount < 0) {
      expect().assertFail();
      done();
    }
    fetchResult.getObjectByPosition(index, (err, photoAsset) => {
      fetchResult.close();
      if (photoAsset !== undefined) {
        console.info(TAG, 'photoAsset displayName: ', photoAsset.displayName, testName);
      } else {
        console.error(TAG, `photoAsset failed with err: ${err.code}, ${err.message}`);
        expect().assertFail();
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

async function getObjectByPositionAbnormalCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions,
  testName: string, index: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
    }
    let fetchCount: number = await fetchResult.getCount();
    if (fetchCount === undefined || fetchCount < 0) {
      expect().assertFail();
      done();
    }
    fetchResult.getObjectByPosition(index, (err, photoAsset) => {
      fetchResult.close();
      if (photoAsset !== undefined) {
        console.info(TAG, 'photoAsset displayName: ', photoAsset.displayName, testName);
      } else {
        console.error(TAG, `photoAsset failed with err: ${err.code}, ${err.message}`);
        expect(err.code == ErrorCode.SYSTEM_INNER_ERROR_CODE || err.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect(error.code == ErrorCode.SYSTEM_INNER_ERROR_CODE || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}


async function getObjectByPositionPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions,
  testName: string, index: number) {
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
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(index);
    console.info('photoAsset displayName: ', photoAsset.displayName, testName);
    await fetchResult.close();
    done();
  } catch (error) {
    console.info(`failed; error:${error}, ${error.code}`, testName);
    expect().assertFail();
    done();
  }
}


async function getObjectByPositionAbnormalPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions,
  testName: string, index: number) {
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
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(index);
    console.info('photoAsset displayName: ', photoAsset.displayName, testName);
    await fetchResult.close();
    done();
  } catch (error) {
    console.info(`failed; error:${error}, ${error.code}`, testName);
    expect(error.code == ErrorCode.SYSTEM_INNER_ERROR_CODE || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function returnCount(fetchOps: photoAccessHelper.FetchOptions,) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
    await phAccessHelper.getAssets(fetchOps);
  let fetchCount: number = await fetchResult.getCount();
  return fetchCount;
}

export default function getObjectByPositionTest() {
  describe('getObjectByPositionTest', () => {

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
     * @tc.name   fetchResult_getObjectByPosition_promise_001
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_001
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index: number = 0;
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_promise_002
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_002
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index: number = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_promise_003
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_003
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index: number = 0;
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_promise_004
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_004
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_promise_005
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_005
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = 0;
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_promise_006
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_006
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_promise_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_promise_001
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_007
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index: number = await returnCount(fetchOps);
      await getObjectByPositionAbnormalPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_promise_002
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_008
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index = await returnCount(fetchOps);
      await getObjectByPositionAbnormalPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_promise_003
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_009
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = await returnCount(fetchOps);
      await getObjectByPositionAbnormalPromiseTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_001
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_010
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index = 0;
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_002
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_011
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index = await returnCount(fetchOps);
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_003
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_012
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index = 0;
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_004
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_013
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index = await returnCount(fetchOps);
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_005
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_014
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = 0;
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_callback_006
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_015
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_callback_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = await returnCount(fetchOps);
      await getObjectByPositionCallbackTest(done, fetchOps, testName, index - 1);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_callback_001
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_016
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_callback_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const index = await returnCount(fetchOps);
      await getObjectByPositionAbnormalCallbackTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_callback_002
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_017
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_callback_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      const index = await returnCount(fetchOps);
      await getObjectByPositionAbnormalCallbackTest(done, fetchOps, testName, index);
    })

    /**
     * @tc.name   fetchResult_getObjectByPosition_abnormal_callback_003
     * @tc.number FETCH_RESULT_SENDABLE_GET_OBJECT_BY_POSITION_018
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getObjectByPosition_abnormal_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getObjectByPosition_abnormal_callback_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      const index = await returnCount(fetchOps);
      await getObjectByPositionAbnormalCallbackTest(done, fetchOps, testName, index);
    })
  })
}