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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { driveFn, fetchAllOption, getPermission, LOG_TAG } from '../../common';
import { common } from '@kit.AbilityKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getBurstAssetsTest';

async function getBurstAssetsOrAbnormal(done: Function, testName: string, burstKey: string | number | undefined,
  fetchOps: photoAccessHelper.FetchOptions | undefined) {
  console.info(TAG, testName + ' begin.');
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await helper.getBurstAssets(burstKey as string, fetchOps as photoAccessHelper.FetchOptions);
    if (fetchResult === undefined) {
      console.info(TAG, testName + 'fetchResult is undefined.');
      expect(false).assertFalse();
    } else {
      console.info(TAG, testName + ' getBurstAssets success, count: ' + fetchResult.getCount());
      expect(fetchResult.getCount() === 0).assertTrue();
      fetchResult.close();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error?.code == ErrorCode.PARAM_ERROR_CODE || error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    done();
  }
}

export default function getBurstAssetsTest() {
  describe('getBurstAssetsTest', () => {

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
     * @tc.name   getBurstAssets_image_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_001
     * @tc.desc   burstKey not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBurstAssets_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getBurstAssets_image_001';
      let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
      let options = fetchAllOption();
      getBurstAssetsOrAbnormal(done, testName, burstKey, options);
    })

    /**
     * @tc.name   getBurstAssets_image_abnormal_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_001
     * @tc.desc   burstKey->undefined -> error_code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBurstAssets_image_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getBurstAssets_image_abnormal_001';
      //let fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, imageDisplayName);
      let burstKey: string | undefined = undefined;
      let options = fetchAllOption();
      getBurstAssetsOrAbnormal(done, testName, burstKey, options);
    })

    /**
     * @tc.name   getBurstAssets_image_abnormal_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_001
     * @tc.desc   burstKey->number -> error_code: 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBurstAssets_image_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getBurstAssets_image_abnormal_002';
      let burstKey: number = 123123;
      let options = fetchAllOption();
      getBurstAssetsOrAbnormal(done, testName, burstKey, options);
    })

    /**
     * @tc.name   getBurstAssets_image_abnormal_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_001
     * @tc.desc   options->undefined -> error_code: 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBurstAssets_image_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getBurstAssets_image_abnormal_003';
      let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
      let options = undefined;
      getBurstAssetsOrAbnormal(done, testName, burstKey, options);
    })
  })
}