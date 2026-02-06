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
import testNapi from 'libimageEffect.so';
import { JSON } from '@kit.ArkTS';
const EFFECT_SUCCESS = 0;
const CASE_INDEX_1 = 1;
const TAG = 'ImageEffectStartXts';

export default function OHImageEffectStartTest() {
  describe('OHImageEffectStartTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_START_SUPP_0100
     * @tc.name    SUB_IMAGE_EFFECT_START_SUPP_0100
     * @tc.desc    OH_ImageEffect_Start-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_START_SUPP_0100', Level.LEVEL1, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectStart(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
  });
}