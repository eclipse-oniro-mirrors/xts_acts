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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import testNapi from 'libimageEffect.so'
import { JSON } from '@kit.ArkTS';
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_1 = 1;
const TAG = 'OHImageEffectRestoreSupp';
export default function OHImageEffectRestoreTest() {
  describe('OHImageEffectRestoreTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_RESTORE_TEST_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_RESTORE_TEST_SUPP_001
     * @tc.desc    OHImageEffectRestore-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_EFFECT_RESTORE_TEST_SUPP_001', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_EFFECT_RESTORE_TEST_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectRestoreTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

  })
}