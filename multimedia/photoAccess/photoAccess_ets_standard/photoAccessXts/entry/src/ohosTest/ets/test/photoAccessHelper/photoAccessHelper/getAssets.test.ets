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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';
import { driveFn, fetchOption, getPermission, LOG_TAG, photoKeys } from '../../common';
import { dataSharePredicates } from '@kit.ArkData';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getAssetsTest';

async function getAssetsCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) {
  let testContext: common.UIAbilityContext =
    AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAssets(fetchOps, (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAssets failed; error: ${error?.code}, ${error?.message}`);
          expect().assertFail();
        } else {
          let count: number = fetchResult.getCount();
          console.info(TAG, `getAssets succeed; photo count: ${count}`);
          expect(count).assertEqual(expectCount);
          fetchResult.close();
        }
        done();
      } catch (error) {
        console.error(TAG, `getAssets callback failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
      done();
    });
  } catch (error) {
    console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAssetsAbnormalCallbackTest(done: Function,
  fetchOps: photoAccessHelper.FetchOptions | undefined | "invalid") {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAssets(fetchOps as photoAccessHelper.FetchOptions, (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAssets failed; error: ${error?.code}, ${error?.message}`);
          expect().assertFail();
        } else {
          console.info(TAG, `getAssets succeed; photo count: ${fetchResult.getCount()}`);
          fetchResult.close();
        }
        done();
      } catch (error) {
        console.error(TAG, `getAssets callback failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
      done();
    });
  } catch (error) {
    console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAssetsPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const fetchResult = await helper.getAssets(fetchOps);
    expect(fetchResult.getCount()).assertEqual(expectCount);
    fetchResult.close();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAssetsAbnormalPromiseTest(done: Function,
  fetchOps: photoAccessHelper.FetchOptions | undefined | "invalid") {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const fetchResult = await helper.getAssets(fetchOps as photoAccessHelper.FetchOptions);
    fetchResult.close();
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    done();
  }
}

export default function getAssetsTest() {
  describe('getAssetsTest', () => {
    const imageDisplayName = 'testGetAsset.jpg';
    const videoDisplayName = 'testGetAsset.mp4';
    const abnormalDisplayName = 'text';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.name   getAssets_callback_image_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_001
     * @tc.desc   callback, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_callback_image_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, imageDisplayName);
      const expectCount = 1;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_image_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_002
     * @tc.desc   callback, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_image_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_callback_image_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_image_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_003
     * @tc.desc   callback, image, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_image_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_callback_image_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_image_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_004
     * @tc.desc   callback, image, fetchOps->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_callback_image_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_callback_image_abnormal_001';
      console.info(TAG, testName);
      await getAssetsAbnormalCallbackTest(done, undefined);
    })

    /**
     * @tc.name   getAssets_callback_image_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_005
     * @tc.desc   callback, image, fetchOps->invalid strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('getAssets_callback_image_abnormal_002', Level.LEVEL4, async (done: Function) => {
      const testName = 'getAssets_callback_image_abnormal_002';
      console.info(TAG, testName);
      await getAssetsAbnormalCallbackTest(done, 'invalid');
    })

    /**
     * @tc.name   getAssets_callback_video_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_006
     * @tc.desc   callback, video, fetchOps->normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_callback_video_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, videoDisplayName);
      const expectCount = 1;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_video_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_007
     * @tc.desc   callback, video, fetchOps -> abnormal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_callback_video_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_callback_video_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_video_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_008
     * @tc.desc   callback, video, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_callback_video_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_callback_video_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsCallbackTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_callback_video_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_009
     * @tc.desc   callback, video, fetchOps -> undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_callback_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_callback_video_abnormal_001';
      console.info(TAG, testName);
      await getAssetsAbnormalCallbackTest(done, undefined);
    })

    /**
     * @tc.name   getAssets_callback_video_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_010
     * @tc.desc   callback, video, fetchOps -> invalid strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('getAssets_callback_video_abnormal_002', Level.LEVEL4, async (done: Function) => {
      const testName = 'getAssets_callback_video_abnormal_001';
      console.info(TAG, testName);
      await getAssetsAbnormalCallbackTest(done, 'invalid');
    })

    /**
     * @tc.name   getAssets_promise_image_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_011
     * @tc.desc   promise, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_image_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, imageDisplayName);
      const expectCount = 1;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_image_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_012
     * @tc.desc   promise, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_image_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_image_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_image_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_013
     * @tc.desc   promise, image, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_image_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_image_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_image_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_014
     * @tc.desc   promise, image, fetchOps->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_image_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_image_abnormal_001';
      console.info(TAG, testName);
      await getAssetsAbnormalPromiseTest(done, undefined);
    })

    /**
     * @tc.name   getAssets_promise_image_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_015
     * @tc.desc   promise, image, fetchOps->invalid strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('getAssets_promise_image_abnormal_002', Level.LEVEL4, async (done: Function) => {
      const testName = 'getAssets_promise_image_abnormal_002';
      console.info(TAG, testName);
      await getAssetsAbnormalPromiseTest(done, "invalid");
    })

    /**
     * @tc.name   getAssets_promise_video_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_016
     * @tc.desc   promise, video, fetchOps -> normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_video_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, videoDisplayName);
      const expectCount = 1;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_video_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_017
     * @tc.desc   promise, video, fetchOps -> abnormal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_video_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_video_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_018
     * @tc.desc   promise, video, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_promise_video_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsPromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_promise_video_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_019
     * @tc.desc   promise, video, fetchOps->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_promise_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_promise_video_abnormal_001';
      console.info(TAG, testName);
      await getAssetsAbnormalPromiseTest(done, undefined);
    })

    /**
     * @tc.name   getAssets_promise_video_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_ASSETS_020
     * @tc.desc   promise, video, fetchOps->invalid strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('getAssets_promise_video_abnormal_002', Level.LEVEL4, async (done: Function) => {
      const testName = 'getAssets_promise_video_abnormal_002';
      console.info(TAG, testName);
      await getAssetsAbnormalPromiseTest(done, "invalid");
    })
  })
}