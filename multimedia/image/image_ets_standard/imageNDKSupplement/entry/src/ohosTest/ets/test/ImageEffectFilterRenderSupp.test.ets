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
// 操作成功;
const EFFECT_SUCCESS = 0;
// 无效参数;
const EFFECT_ERROR_PARAM_INVALID = 401;
// 未知错误;
const EFFECT_ERROR_29000199 = 29000199;
// key 密钥错误;
const EFFECT_ERROR_29000122 = 29000122;
// 参数错误;
const EFFECT_ERROR_29000121 = 29000121;
const EFFECT_PARAM_ERROR = 401;
const CASE_INDEX_1 = 1
const TAG = 'imageEffectFilterRenderSuppXts';

export default function ImageEffectFilterRenderSuppTest() {
  describe('ImageEffectFilterRenderSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_SUPP_001
     * @tc.desc    OHEffectFilterRenderSupp-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_SUPP_001', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_SUPP_001'
      let result: number = testNapi.OHEffectFilterRenderSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_WITH_TEXTURE_ID_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_WITH_TEXTURE_ID_SUPP_001
     * @tc.desc    OHEffectFilterRenderWithTextureIdSupp-EFFECT_SUCCESS情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_WITH_TEXTURE_ID_SUPP_001', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RENDER_WITH_TEXTURE_ID_SUPP_001'
      let result: number = testNapi.OHEffectFilterRenderWithTextureIdSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

  });
}