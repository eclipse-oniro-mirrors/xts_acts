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
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
const CASE_INDEX_12 = 12;
const CASE_INDEX_13 = 13;
const TAG = 'imageEffectErrorCodeSuppXts';

export default function ImageEffectErrorCodeSuppTest() {
  describe('ImageEffectErrorCodeSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0001
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0001
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_ERROR_PERMISSION_DENIED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0001', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0001";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(201);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0002
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0002
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_BUFFER_SIZE_NOT_MATCH
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0002', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0002";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000001);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0003
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0003
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_COLOR_SPACE_NOT_MATCH
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0003', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0003";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000002);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0004
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0004
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_INPUT_OUTPUT_NOT_MATCH
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0004', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0004";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_4);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000101);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0005
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0005
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_EFFECT_NUMBER_LIMITED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0005', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0005";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_5);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000102);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0006
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0006
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_INPUT_OUTPUT_NOT_SUPPORTED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0006', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0006";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_6);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000103);
    });
    /**
     * @tc.number   SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0007
     * @tc.name     SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0007
     * @tc.desc     ImageEffect_ErrorCode-EFFECT_ALLOCATE_MEMORY_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0007', Level.LEVEL0, () => {
      const testName = "SUB_IMAGE_EFFECT_ERROR_CODE_SUPP_0007";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageEffectErrorCodeSupp(CASE_INDEX_7);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(29000104);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0008
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0008
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_IMAGE_RESULT_BASE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0008', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0008";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980096);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0009
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0009
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_ERR_IPC
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0009', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_0009";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980097);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00010
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00010
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_ERR_SHAMEM_NOT_EXIST
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00010', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00010";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980098);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00011
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00011
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_ERR_SHAMEM_DATA_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00011', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00011";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_4);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980099);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00012
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00012
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DECODE_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00012', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00012";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_5);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980100);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00013
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00013
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DATA_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00013', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00013";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_6);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980101);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00014
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00014
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MALLOC_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00014', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00014";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_7);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980102);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00015
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00015
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DATA_UNSUPPORT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00015', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00015";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_8);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980103);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00016
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00016
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_INIT_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00016', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00016";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_9);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980104);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00017
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00017
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_TOO_LARGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00017', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00017";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_10);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980106);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00018
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00018
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_TRANSFORM
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00018', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00018";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_11);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980107);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00019
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00019
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_COLOR_CONVERT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00019', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00019";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_12);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980108);
    });
    /**
     * @tc.number   SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00020
     * @tc.name     SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00020
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_CROP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00020', Level.LEVEL0, () => {
      const testName = "SUB_IR_NDK_ERROR_CODE_TEST_SUPP_00020";
      console.info(TAG,'Start',);
      let result: number = testNapi.OHIRNdkErrorCodeTestSupp(CASE_INDEX_13);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980109);
    });
  });
}