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
const CASE_INDEX_14 = 14;
const CASE_INDEX_15 = 15;
const CASE_INDEX_16 = 16;
const CASE_INDEX_17 = 17;
const CASE_INDEX_18 = 18;
const TAG = 'ImageResultIRNdkErrCodeSupp';
export default function ImageResultIRNdkErrCodeTest() {
  describe('ImageResultIRNdkErrCodeTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0001
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0001
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_BUFFER_TOO_SMALL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0001', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0001'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980132);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0002
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0002
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_OUT_OF_RANGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0002', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0002'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980133);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0003
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0003
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_STATUS_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0003', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0003'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_3)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980134);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0004
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0004
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_VALUE_INVALID
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0004', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0004'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_4)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980135);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0005
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0005
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_NULL_POINTER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0005', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0005'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_5)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980136);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0006
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0006
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_INVALID_OPERATION
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0006', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0006'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_6)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980137);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0007
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0007
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_ERR_PLAYER_NOT_INIT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0007', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0007'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_7)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980138);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0008
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0008
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_EARLY_PREPARE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0008', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0008'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_8)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980139);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0009
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0009
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_GET_SURFACE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0009', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0009'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_9)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980254);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0010
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0010
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SURFACE_ACQUIRE_BUFFER_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0010', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0010'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_10)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980255);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0011
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0011
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SURFACE_REQUEST_BUFFER_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0011', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0011'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_11)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980256);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0012
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0012
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_REGISTER_LISTENER_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0012', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0012'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_12)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980257);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0013
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0013
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_REGISTER_BUFFER_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0013', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0013'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_13)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980258);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0014
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0014
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_FREAD_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0014', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0014'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_14)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980259);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0015
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0015
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_PEEK_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0015', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0015'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_15)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980260);
    })/**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0016
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0016
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SEEK_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0016', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0016'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_16)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980261);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0017
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0017
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_STREAM_SIZE_ERROR
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0017', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0017'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_17)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980262);
    })
    /**
     * @tc.number   SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0018
     * @tc.name     SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0018
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_FILE_FD_ERROR
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0018', Level.LEVEL0, () => {
      const testName ='SUB_NDK_IMAGE_RESULT_ERROR_CODE_SUPP_0018'
      console.info(TAG, testName,'Start',);
      let result: number = testNapi.ImageResultIRNdkErrCodeTest(CASE_INDEX_18)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(62980263);
    })
  })
 }