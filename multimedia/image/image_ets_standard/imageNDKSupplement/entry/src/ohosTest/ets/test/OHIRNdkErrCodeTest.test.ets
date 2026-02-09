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

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const TAG = 'ImageNdk.IRNdkErrCodeTest'

export default function IRNdkErrCode() {
  describe('IRNdkErrCode', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_001
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_001
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_FILE_DAMAGED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_001", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980264);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_002
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_002
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_CREATE_DECODER_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_002", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980265);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_003
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_003
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_CREATE_ENCODER_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_003", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980266);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_004
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_004
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_CHECK_FORMAT_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_004", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_4);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980267);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_005
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_005
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_HW_DECODE_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_005", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_5);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980269);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_006
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_006
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_ALLOCATER_TYPE_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_006", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_6);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980270);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_007
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_007
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_ALPHA_TYPE_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_007", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_7);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980271);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_008
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_008
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_INDEX_INVALID
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_008", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_8);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980272);
    })
    /**
     * @tc.number    SUB_IMAGE_IRNDK_ERROR_CODE_009
     * @tc.name      SUB_IMAGE_IRNDK_ERROR_CODE_009
     * @tc.desc      OH_PictureNative_SetMetadata-IMAGE_RESULT_MEDIA_UNKNOWN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_IRNDK_ERROR_CODE_009", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.OHIRNdkErrCodeTestSupp(CASE_INDEX_9);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980296);
    })
  })
}