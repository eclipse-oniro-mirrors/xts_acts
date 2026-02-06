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
import testNapi from 'libimageEffect.so'
import fileio from '@ohos.fileio'
import { common } from "@kit.AbilityKit";
import { JSON } from '@kit.ArkTS';
const IMAGE_RESULT_BAD_PARAMETER = -1
const IMAGE_RESULT_JNI_ENV_ABNORMAL = 62980250
const IMAGE_UNSUPPORTED_OPERATION = 7600201
const IMAGE_UNSUPPORTED_CONVERSION = 7600203
const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const TAG = 'OHPixelmapNativeCreatePixelmapNativeSupp';
let fdNumber: number;


async function getFd(path: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  console.info(TAG, 'get testContext success',context);
  let basePath = context.filesDir;
  console.info(TAG, 'get filesDir success',);
  let filePath = basePath + '/' + path;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}
export default function OHPixelmapNativeCreatePixelmapNativeTest() {
  describe('OHPixelmapNativeCreatePixelmapNativeTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_001
     * @tc.name    SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_001
     * @tc.desc    OH_PixelmapNative_CreatePixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeCreatePixelmapNativeTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_002
     * @tc.name    SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_002
     * @tc.desc    OH_PixelmapNative_CreatePixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_002', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeCreatePixelmapNativeTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_003
     * @tc.name    SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_003
     * @tc.desc    OH_PixelmapNative_CreatePixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_003', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeCreatePixelmapNativeTest(CASE_INDEX_3);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_004
     * @tc.name    SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_004
     * @tc.desc    OH_PixelmapNative_CreatePixelmapUsingAllocator-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_004', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_004"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeCreatePixelmapNativeTest(CASE_INDEX_4);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_005
     * @tc.name    SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_005
     * @tc.desc    OH_PixelmapNative_CreatePixelmapUsingAllocator-IMAGE_UNSUPPORTED_OPERATION
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_005', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_USING_ALLOCATOR_SUPP_005"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeCreatePixelmapNativeTest(CASE_INDEX_5);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_OPERATION);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_001
     * @tc.name    SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_001
     * @tc.desc    OH_PixelmapNative_GetArgbPixels-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeGetArgbPixelsTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_002
     * @tc.name    SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_002
     * @tc.desc    OH_PixelmapNative_GetArgbPixels-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_002', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeGetArgbPixelsTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_003
     * @tc.name    SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_003
     * @tc.desc    OH_PixelmapNative_GetArgbPixels-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_003', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeGetArgbPixelsTest(CASE_INDEX_3);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_004
     * @tc.name    SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_004
     * @tc.desc    OH_PixelmapNative_GetArgbPixels-IMAGE_UNSUPPORTED_CONVERSION
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_004', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_GET_ARGB_PIXELS_SUPP_004"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeGetArgbPixelsTest(CASE_INDEX_4);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_CONVERSION);
    });
    /**
     * @tc.number  SUB_CREATE_PIXELMAP_TO_SDR_SUPP_001
     * @tc.name    SUB_CREATE_PIXELMAP_TO_SDR_SUPP_001
     * @tc.desc    OH_PixelmapNative_ToSdr-IMAGE_UNSUPPORTED_OPERATION
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_PIXELMAP_TO_SDR_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_PIXELMAP_TO_SDR_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPixelmapNativeToSdrTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_OPERATION);
    });
    /**
     * @tc.number  SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_001
     * @tc.name    SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_001
     * @tc.desc    OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.PixelmapNativeCreateEmptyPixelmapUsingAllocator(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_002
     * @tc.name    SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_002
     * @tc.desc    OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_002', Level.LEVEL0, async () => {
      const testName = "SUB_CREATE_EMPTY_PIXELMAP_USING_ALLOCATOR_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.PixelmapNativeCreateEmptyPixelmapUsingAllocator(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
  })
}