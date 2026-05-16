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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libimageEffect.so'
import { JSON } from '@kit.ArkTS';

const IMAGE_SUCCESS = 0;
const IMAGE_BAD_PARAMETER = 401;
const IMAGE_TOO_LARGE = 7600103;

const EFFECT_PARAM_ERROR = 401;
const CASE_INDEX_1 = 1
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const TAG = 'imageFrameworkPixelMapNativeCreateSuppXts';

export default function imageFrameworkPixelMapNativeCreateSuppTest() {
  describe('imageFrameworkPixelMapNativeCreateSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_SUPP_001
     * @tc.name    SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_SUPP_001
     * @tc.desc    OHPixelmapNativeCreateScaledPixelMapSupp的IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPixelmapNativeCreateScaledPixelMapSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_001
     * @tc.name    SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_001
     * @tc.desc    OHPixelmapNativeCreateScaledPixelMapSupp的IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_002
     * @tc.name    SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_002
     * @tc.desc    OHPixelmapNativeCreateScaledPixelMapSupp的IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_FRAMEWORK_CREATE_SCALE_PIXEL_MAP_WITH_ANTI_ALIASING_SUPP_002'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_001
     * @tc.name    SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_001
     * @tc.desc    OHPixelmapNativeTranslateSupp-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_001', Level.LEVEL1,() => {
      const testName ='SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPixelmapNativeTranslateSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_003
     * @tc.name    SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_003
     * @tc.desc    OHPixelmapNativeTranslateSupp-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_003', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_FRAMEWORK_PIXELMAP_NATIVE_TRANSLATE_SUPP_003'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPixelmapNativeTranslateSupp(CASE_INDEX_4)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    })
  });
}
