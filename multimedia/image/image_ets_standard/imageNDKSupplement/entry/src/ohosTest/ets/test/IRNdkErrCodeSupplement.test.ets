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
const CASE_INDEX_14 = 14;
const CASE_INDEX_15 = 15;
const CASE_INDEX_16 = 16;
const CASE_INDEX_17 = 17;
const CASE_INDEX_18 = 18;
const CASE_INDEX_19 = 19
const CASE_INDEX_20 = 20

const TAG = 'IRNdkErrCodeSupplementTestSupp';

export default function IRNdkErrCodeSupplementTest() {
  describe('IRNdkErrCodeSupplementTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0001
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0001
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SOURCE_DATA_INCOMPLETE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0001', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980111);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0002
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0002
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MISMATCHED_FORMAT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0002', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980112);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0003
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0003
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_UNKNOWN_FORMAT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0003', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980113);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0004
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0004
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SOURCE_UNRESOLVED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0004', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_4);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980114);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0005
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0005
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DECODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0005', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_5);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980116);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0006
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0006
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_PLUGIN_REGISTER_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0006', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_6);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980117);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0007
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0007
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_PLUGIN_CREATE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0007', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_7);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980118);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0008
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0008
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_ENCODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0008', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_8);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980119);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_0009
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_0009
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_ADD_PIXEL_MAP_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_0009', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_9);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980120);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00010
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00010
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_HW_DECODE_UNSUPPORT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00010', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_10);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980121);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00011
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00011
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DECODE_HEAD_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00011', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_11);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980122);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00012
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00012
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_DECODE_EXIF_UNSUPPORT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00012', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_12);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980123);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00013
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00013
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_PROPERTY_NOT_EXIST
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00013', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_13);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980124);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00014
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00014
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_DATA_UNSUPPORT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00014', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_14);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980126);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00015
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00015
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_TOO_LARGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00015', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_15);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980127);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00016
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00016
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_MALLOC_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00016', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_16);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980128);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00017
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00017
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_END_OF_STREAM
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00017', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_17);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980129);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00018
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00018
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_IO_ABNORMAL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00018', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_18);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980130);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00019
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00019
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_MEDIA_MALFORMED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00019', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_19);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980131);
    });
    /**
     * @tc.number   SUB_IMAGE_IR_NDK_ERRCODE_00020
     * @tc.name     SUB_IMAGE_IR_NDK_ERRCODE_00020
     * @tc.desc     IRNdkErrCode-IMAGE_RESULT_SOURCE_DATA
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_IR_NDK_ERRCODE_00020', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.IRNdkErrCodeSupplementTest(CASE_INDEX_20);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(62980110);
    });
  })
}