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
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
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
const CASE_INDEX_19 = 19;
const CASE_INDEX_20 = 20;
const IMAGE_RESULT_BASE = 62980096;
const IMAGE_RESULT_MEDIA_SOURCE_NOT_SET = IMAGE_RESULT_BASE + 64;
const IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_INIT = IMAGE_RESULT_BASE + 65;
const IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_EXIST = IMAGE_RESULT_BASE + 66;
const IMAGE_RESULT_MEDIA_RTSP_SURFACE_UNSUPPORT = IMAGE_RESULT_BASE + 67;
const IMAGE_RESULT_MEDIA_RTSP_CAPTURE_NOT_INIT = IMAGE_RESULT_BASE + 68;
const IMAGE_RESULT_MEDIA_RTSP_SOURCE_URL_INVALID = IMAGE_RESULT_BASE + 69;
const IMAGE_RESULT_MEDIA_RTSP_VIDEO_TRACK_NOT_FOUND = IMAGE_RESULT_BASE + 70;
const IMAGE_RESULT_MEDIA_RTSP_CAMERA_NUM_REACH_MAX = IMAGE_RESULT_BASE + 71;
const IMAGE_RESULT_MEDIA_SET_VOLUME = IMAGE_RESULT_BASE + 72;
const IMAGE_RESULT_MEDIA_NUMBER_OVERFLOW = IMAGE_RESULT_BASE + 73;
const IMAGE_RESULT_MEDIA_DIS_PLAYER_UNSUPPORTED = IMAGE_RESULT_BASE + 74;
const IMAGE_RESULT_MEDIA_DENCODE_ICC_FAILED = IMAGE_RESULT_BASE + 75;
const IMAGE_RESULT_MEDIA_ENCODE_ICC_FAILED = IMAGE_RESULT_BASE + 76;
const IMAGE_RESULT_MEDIA_READ_PIXELMAP_FAILED = IMAGE_RESULT_BASE + 150;
const IMAGE_RESULT_MEDIA_WRITE_PIXELMAP_FAILED = IMAGE_RESULT_BASE + 151;
const IMAGE_RESULT_MEDIA_PIXELMAP_NOT_ALLOW_MODIFY = IMAGE_RESULT_BASE + 152;
const IMAGE_RESULT_MEDIA_CONFIG_FAILED = IMAGE_RESULT_BASE + 153;
const IMAGE_RESULT_SURFACE_GRALLOC_BUFFER_FAILED = IMAGE_RESULT_BASE + 155;
const IMAGE_RESULT_CREATE_SURFACE_FAILED = IMAGE_RESULT_BASE + 156;
const IMAGE_RESULT_SURFACE_GET_PARAMETER_FAILED = IMAGE_RESULT_BASE + 157;
const TAG = 'imageEffectSuppXts';

export default function ImageEffectSuppTest() {
  describe('ImageEffectSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100
     * @tc.desc   OH_ImageEffect_Create with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectCreateSupp(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_AddFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectAddFilterSupp(CASE_INDEX_4);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_InsertFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectInsertFilterSupp(CASE_INDEX_5);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_RemoveFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectRemoveFilterSupp(CASE_INDEX_4);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPP_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectReplaceFilterSupp(CASE_INDEX_5);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400
     * @tc.desc   OH_ImageEffect_ReplaceFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_BY_FILTER_SUPP_0400', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilterSupp(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200
     * @tc.desc   OH_ImageEffect_Create with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CREATE_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectCreateSupp(undefined);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_AddFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectAddFilterSupp(undefined);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_AddFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_InsertFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPP_0200', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.OHImageEffectInsertFilterSupp(undefined);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400
     * @tc.desc   OH_ImageEffect_InsertFilterByFilter with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_BY_FILTER_SUPP_0400', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterSupp(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300
     * @tc.desc   OH_ImageEffect_RemoveFilterByIndex with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REMOVE_FILTER_BY_INDEX_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndexSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200
     * @tc.desc   OH_ImageEffect_SetInputPicture with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPictureSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300
     * @tc.desc   OH_ImageEffect_SetInputPicture with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_PICTURE_SUPP_0300', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPictureSupp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100
     * @tc.desc   OH_ImageEffect_SetOutputPicture with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_OUTPUT_PICTURE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPictureSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100
     * @tc.desc   OH_ImageEffect_Release with EFFECT_SUCCESS
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReleaseSupp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200
     * @tc.desc   OH_ImageEffect_Release with EFFECT_ERROR_PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_RELEASE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReleaseSupp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });


    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_AddFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_ADD_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: undefined = testNapi.OHImageEffectAddFilterSupplement();
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_InsertFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_INSERT_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: undefined = testNapi.OHImageEffectInsertFilterSupplement();
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_ReplaceFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_REPLACE_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: undefined = testNapi.OHImageEffectReplaceFilterSupplement();
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100
     * @tc.desc   OH_ImageEffect_GetFilter with undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_GET_FILTER_SUPPLEMENT_0100', Level.LEVEL0, () => {
      console.info(TAG, 'Start',);
      let result: undefined = testNapi.OHImageEffectGetFilterSupplement();
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0100', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputTextureSupp(1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200
     * @tc.name   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_SET_INPUT_TURE_SUPP_0200', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputTextureSupp(2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0100
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0100
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_SOURCE_NOT_SET
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0100', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_SOURCE_NOT_SET);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0200
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0200
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_INIT
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0200', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_INIT);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0300
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0300
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_EXIST
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0300', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_3);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_ADAPTER_NOT_EXIST);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0400
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0400
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_SURFACE_UNSUPPORT
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0400', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_4);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_SURFACE_UNSUPPORT);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0500
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0500
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_CAPTURE_NOT_INIT
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0500', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_5);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_CAPTURE_NOT_INIT);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0600
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0600
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_SOURCE_URL_INVALID
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0600', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_6);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_SOURCE_URL_INVALID);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0700
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0700
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_VIDEO_TRACK_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0700', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_7);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_VIDEO_TRACK_NOT_FOUND);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0800
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0800
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_RTSP_CAMERA_NUM_REACH_MAX
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0800', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_8);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_RTSP_CAMERA_NUM_REACH_MAX);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_0900
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_0900
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_SET_VOLUME
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_0900', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_9);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_SET_VOLUME);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1000
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1000
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_NUMBER_OVERFLOW
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1000', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_10);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_NUMBER_OVERFLOW);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1100
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1100
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_DIS_PLAYER_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1100', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_11);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_DIS_PLAYER_UNSUPPORTED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1200
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1200
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_DENCODE_ICC_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1200', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_12);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_DENCODE_ICC_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1300
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1300
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_ENCODE_ICC_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1300', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_13);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_ENCODE_ICC_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1400
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1400
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_READ_PIXELMAP_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1400', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_14);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_READ_PIXELMAP_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1500
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1500
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_WRITE_PIXELMAP_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1500', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_15);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_WRITE_PIXELMAP_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1600
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1600
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_PIXELMAP_NOT_ALLOW_MODIFY
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1600', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_16);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_PIXELMAP_NOT_ALLOW_MODIFY);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1700
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1700
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_MEDIA_CONFIG_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1700', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_17);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_CONFIG_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1800
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1800
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_SURFACE_GRALLOC_BUFFER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1800', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_18);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SURFACE_GRALLOC_BUFFER_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_1900
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_1900
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_CREATE_SURFACE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_1900', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_19);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_CREATE_SURFACE_FAILED);
    });

    /**
     * @tc.number SUB_IR_NDK_ERRCODE_SUPPLEMENT_2000
     * @tc.name   SUB_IR_NDK_ERRCODE_SUPPLEMENT_2000
     * @tc.desc   IR_NDK_ERRCODE -IMAGE_RESULT_SURFACE_GET_PARAMETER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   Function
     * @tc.level  LEVEL0
     */
    it('SUB_IR_NDK_ERRCODE_SUPPLEMENT_2000', Level.LEVEL0, () => {
      let result: number = testNapi.IRNdkErrCodeSupplement(CASE_INDEX_20);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SURFACE_GET_PARAMETER_FAILED);
    });
  });
}