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
import image from '@ohos.multimedia.image';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import testNapi from 'libentry.so'
import fileio from '@ohos.fileio'
import { common } from "@kit.AbilityKit";
import { JSON } from '@kit.ArkTS';
import { driveFn, getPermission, sleep, } from '../PhotoCommon.test';
import { indexSurfaceId } from '../../testability/pages/Index';
const IMAGE_RESULT_BAD_PARAMETER = -1
const IMAGE_RESULT_JNI_ENV_ABNORMAL = 62980250
const IMAGE_UNSUPPORTED_OPERATION = 7600201
const MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED = 23800201;
const MEDIA_LIBRARY_NO_SUCH_FILE = 23800101
const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const TAG = 'OHMediaAssetCreateSupp';

export default function OHMediaAssetCreateTest() {
  describe('OHMediaAssetCreateTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      testNapi.TestOhMediaAsset(CASE_INDEX_1,indexSurfaceId);
      console.info(TAG, 'beforeAll case', indexSurfaceId);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.number  SUB_MEDIA_ASSET_CHANGE_CREATE_001
     * @tc.name    SUB_MEDIA_ASSET_CHANGE_CREATE_001
     * @tc.desc    OHMediaAssetChangeRequestCreate-nullptr
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_ASSET_CHANGE_CREATE_001', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_ASSET_CHANGE_CREATE_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHMediaAssetChangeRequestCreateTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_MEDIA_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_SUPP_001
     * @tc.name    SUB_MEDIA_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_SUPP_001
     * @tc.desc    OHMediaAssetManagerCreate-MEDIA_LIBRARY_NO_SUCH_FILE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_SUPP_001"
      console.info(TAG, testName, 'Start',);
      await sleep(3000);
      let result: number = testNapi.OHMediaAssetChangeRequestAddResourceWithUriTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(MEDIA_LIBRARY_NO_SUCH_FILE);
    });
    /**
     * @tc.number  SUB_MEDIA_CHANGE_REQUEST_APPLY_CHANGE_SUPP_001
     * @tc.name    SUB_MEDIA_CHANGE_REQUEST_APPLY_CHANGE_SUPP_001
     * @tc.desc    OHMediaAccessHelperApplyChanges-MEDIA_LIBRARY_PARAMETER_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_CHANGE_REQUEST_APPLY_CHANGE_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_CHANGE_REQUEST_APPLY_CHANGE_SUPP_001"
      console.info(TAG, testName, 'Start',);
      await sleep(3000);
      let result: number = testNapi.OHMediaAccessHelperApplyChangesTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_001
     * @tc.name    SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_001
     * @tc.desc    OHMediaAssetChangeRequestRelease-MEDIA_LIBRARY_PARAMETER_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_001"
      console.info(TAG, testName, 'Start',);
      await sleep(3000);
      let result: number = testNapi.OHMediaAssetChangeRequestReleaseTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_002
     * @tc.name    SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_002
     * @tc.desc    OHMediaAssetChangeRequestRelease-MEDIA_LIBRARY_OK
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_002', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_CHANGE_REQUEST_Release_SUPP_002"
      console.info(TAG, testName, 'Start',);
      await sleep(3000);
      let result: number = testNapi.OHMediaAssetChangeRequestReleaseTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_001
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_001
     * @tc.desc    OHMediaAssetManagerQuickRequestImageTest-MEDIA_LIBRARY_OK
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_001', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHMediaAssetManagerQuickRequestImageTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_002
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_002
     * @tc.desc    OHMediaAssetManagerQuickRequestImageTest-MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_002', Level.LEVEL0, async () => {
      const testName = "SUB_MEDIA_ASSET_MANAGER_QUICK_REQUEST_IMAGE_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHMediaAssetManagerQuickRequestImageTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
    });
  })
}