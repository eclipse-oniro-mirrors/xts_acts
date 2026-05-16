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


const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;

const TAG = 'ImageEffectInfoSupplementSupp';

export default function ImageEffectInfoSupplementTest() {
  describe('ImageEffectInfoSupplementTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_001
     * @tc.desc    OHEffectFilterInfoSetFilterName EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetFilterNameSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_002
     * @tc.desc    OHEffectFilterInfoSetFilterName EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetFilterNameSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_003
     * @tc.desc    OHEffectFilterInfoSetFilterName EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetFilterNameSupplementTest(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_004
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_004
     * @tc.desc    OHEffectFilterInfoSetFilterName EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_FILTER_NAME_004', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetFilterNameSupplementTest(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_001
     * @tc.desc    OHEffectFilterInfoGetFilterName EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_001', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetFilterNameSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_002
     * @tc.desc    OHEffectFilterInfoGetFilterName EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_002', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetFilterNameSupplementTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_003
     * @tc.desc    OHEffectFilterInfoGetFilterName EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_003', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetFilterNameSupplementTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_004
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_004
     * @tc.desc    OHEffectFilterInfoGetFilterName EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_FILTER_NAME_004', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetFilterNameSupplementTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_001
     * @tc.desc    OHEffectFilterInfoSetSupportedBufferTypes EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_001', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypesSuppTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_002
     * @tc.desc    OHEffectFilterInfoSetSupportedBufferTypes EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_002', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypesSuppTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_003
     * @tc.desc    OHEffectFilterInfoSetSupportedBufferTypes EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_BUFFER_003', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypesSuppTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_001
     * @tc.desc    OHEffectFilterInfoGetSupportedBufferTypes EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_001', Level.LEVEL0, () => {
      const testName = 'SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_001'
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypesSuppTest(CASE_INDEX_1);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_002
     * @tc.desc    OHEffectFilterInfoGetSupportedBufferTypes EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_002', Level.LEVEL0, () => {
      const testName = 'SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_002'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypesSuppTest(CASE_INDEX_2);
      console.info(TAG, testName,'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_003
     * @tc.desc    OHEffectFilterInfoGetSupportedBufferTypes EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_003', Level.LEVEL0, () => {
      const testName = 'SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_BUFFER_TYPES_003'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypesSuppTest(CASE_INDEX_3);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_001
     * @tc.desc    OHEffectFilterInfoSetSupportedFormats EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_001', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormatsSuppTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_002
     * @tc.desc    OHEffectFilterInfoSetSupportedFormats EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_002', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormatsSuppTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_003
     * @tc.desc    OHEffectFilterInfoSetSupportedFormats EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_SET_SUPPORTED_FORMATS_003', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormatsSuppTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_001
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_001
     * @tc.desc    OHEffectFilterInfoGetSupportedFormats EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormatsSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_002
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_002
     * @tc.desc    OHEffectFilterInfoGetSupportedFormats EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormatsSuppTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_003
     * @tc.name    SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_003
     * @tc.desc    OHEffectFilterInfoGetSupportedFormats EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILTER_INFO_GET_SUPPORTED_FORMATS_003', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormatsSuppTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_001
     * @tc.name    SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_001
     * @tc.desc    OHEffectFilterInfoRelease EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoReleaseSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_002
     * @tc.name    SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_002
     * @tc.desc    OHEffectFilterInfoRelease EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_INFO_RELEASE_SUPPLEMENT_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoReleaseSupplementTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
  })
}