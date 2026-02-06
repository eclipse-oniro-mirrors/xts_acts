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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { driveFn, fetchOption, getPermission, LOG_TAG, photoKeys } from '../../common';
import { dataSharePredicates } from '@kit.ArkData';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'sendableGetAssetsTest';
const imageDisplayName = 'testGetAsset.jpg';
const videoDisplayName = 'testGetAsset.mp4';
const abnormalDisplayName = 'text';

async function getAssetsSendablePromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions,
  expectCount: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    expect(fetchResult.getCount()).assertEqual(expectCount);
    fetchResult.close();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAssetsSendableAbnormalPromiseTest(done: Function,
  fetchOps: photoAccessHelper.FetchOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    await sendablePhAccessHelper.getAssets(fetchOps as photoAccessHelper.FetchOptions);
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    done();
  }
}

export default function sendablePhotoAccessHelperGetAssetsTest() {
  describe('sendablePhotoAccessHelperGetAssetsTest', () => {
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
     * @tc.name   getAssets_sendable_promise_image_001
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_001
     * @tc.desc   promise, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_image_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, imageDisplayName);
      const expectCount = 1;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_image_002
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_002
     * @tc.desc   promise, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_image_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_image_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_image_003
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_003
     * @tc.desc   promise, image, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_image_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_image_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_image_abnormal_001
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_004
     * @tc.desc   promise, image, fetchOps->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_sendable_promise_image_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_image_abnormal_001';
      console.info(TAG, testName);
      await getAssetsSendableAbnormalPromiseTest(done, undefined);
    })

    /**
     * @tc.name   getAssets_sendable_promise_video_001
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_005
     * @tc.desc   promise, video, fetchOps -> normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_video_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, videoDisplayName);
      const expectCount = 1;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_video_002
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_006
     * @tc.desc   promise, video, fetchOps -> abnormal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_video_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.DISPLAY_NAME, abnormalDisplayName);
      const expectCount = 0;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_video_003
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_007
     * @tc.desc   promise, video, fetchOps -> abnormal fetchColumns and new predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_sendable_promise_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_video_003';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalDisplayName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      const expectCount = 0;
      await getAssetsSendablePromiseTest(done, fetchOps, expectCount);
    })

    /**
     * @tc.name   getAssets_sendable_promise_video_abnormal_001
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_SENDABLE_008
     * @tc.desc   promise, video, fetchOps->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_sendable_promise_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAssets_sendable_promise_video_abnormal_001';
      console.info(TAG, testName);
      await getAssetsSendableAbnormalPromiseTest(done, undefined);
    })
  })
}