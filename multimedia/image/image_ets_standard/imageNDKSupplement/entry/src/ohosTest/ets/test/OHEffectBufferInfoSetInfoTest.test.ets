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

const EFFECT_SUCCESS = 0;
const EFFECT_ERROR_PARAM_INVALID = 401;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const TAG = 'OHEffectBufferInfoSetInfoTestTestSupp';
export default function OHEffectBufferInfoSetInfoTest() {
  describe('OHEffectBufferInfoSetInfoTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_001
     * @tc.desc    OHEffectBufferInfoSetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_001"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetHeightTest(CASE_INDEX_1);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_002
     * @tc.desc    OHEffectBufferInfoSetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_002"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetHeightTest(CASE_INDEX_2);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_003
     * @tc.desc    OHEffectBufferInfoSetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_003"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetHeightTest(CASE_INDEX_3);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_004
     * @tc.desc    OHEffectBufferInfoSetHeight-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_HEIGHT_SUPP_004"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetHeightTest(CASE_INDEX_4);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_001
     * @tc.desc    OHEffectBufferInfoGetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetHeightTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_002
     * @tc.desc    OHEffectBufferInfoGetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetHeightTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_003
     * @tc.desc    OHEffectBufferInfoGetHeight-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_HEIGHT_SUPP_003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetHeightTest(CASE_INDEX_3);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_Height_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_Height_SUPP_004
     * @tc.desc    OHEffectBufferInfoGetHeight-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_Height_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_Height_SUPP_004"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetHeightTest(CASE_INDEX_4);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_001
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_001"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetWidthTest(CASE_INDEX_1);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_002
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_002"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetWidthTest(CASE_INDEX_2);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_003
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_003"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetWidthTest(CASE_INDEX_3);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_004
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_WIDTH_SUPP_004"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetWidthTest(CASE_INDEX_4);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_001
     * @tc.desc    OHEffectBufferInfoGetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetWidthTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_002
     * @tc.desc    OHEffectBufferInfoGetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetWidthTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_003
     * @tc.desc    OHEffectBufferInfoGetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetWidthTest(CASE_INDEX_3);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_004
     * @tc.desc    OHEffectBufferInfoGetWidth-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_WIDTH_SUPP_004"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetWidthTest(CASE_INDEX_4);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_001
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_001"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetRowSizeTest(CASE_INDEX_1);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_002
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_002"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetRowSizeTest(CASE_INDEX_2);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_003
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_003"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetRowSizeTest(CASE_INDEX_3);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_004
     * @tc.desc    OHEffectBufferInfoSetWidth-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_SET_ROW_SIZE_SUPP_004"
      console.info(TAG,testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoSetRowSizeTest(CASE_INDEX_4);
      console.info(TAG,testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });/**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_001
     * @tc.desc    OHEffectBufferInfoGetRowSize-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetRowSizeTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_002
     * @tc.desc    OHEffectBufferInfoGetRowSize-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetRowSizeTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_003
     * @tc.desc    OHEffectBufferInfoGetRowSize-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetRowSizeTest(CASE_INDEX_3);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_004
     * @tc.desc    OHEffectBufferInfoGetRowSize-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_GET_ROW_SIZE_SUPP_004"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoGetRowSizeTest(CASE_INDEX_4);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_001
     * @tc.desc    OHEffectBufferInfoRelease-EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoReleaseTest(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_002
     * @tc.desc    OHEffectBufferInfoRelease-EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_OH_EFFECT_BUFFER_INFO_RELEASE_SUPP_002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHEffectBufferInfoReleaseTest(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
  })
}