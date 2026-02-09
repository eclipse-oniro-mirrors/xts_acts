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
const EFFECT_ERROR_29000121 = 29000121;

const EFFECT_ERROR_PERMISSION_DENIED = 201;
const EFFECT_BUFFER_SIZE_NOT_MATCH = 29000001;
const EFFECT_COLOR_SPACE_NOT_MATCH = 29000002;
const EFFECT_INPUT_OUTPUT_NOT_MATCH = 29000101;
const EFFECT_EFFECT_NUMBER_LIMITED = 29000102;
const EFFECT_INPUT_OUTPUT_NOT_SUPPORTED = 29000103;
const EFFECT_ALLOCATE_MEMORY_FAILED = 29000104;
const IMAGE_RESULT_MEDIA_SEEK_ERR = 62980140;
const IMAGE_RESULT_MEDIA_PERMISSION_DENIED = 62980141;
const IMAGE_RESULT_MEDIA_DEAD_OBJECT = 62980142;
const IMAGE_RESULT_MEDIA_TIMED_OUT = 62980143;
const IMAGE_RESULT_MEDIA_TRACK_NOT_ALL_SUPPORTED = 62980144;
const IMAGE_RESULT_MEDIA_ADAPTER_INIT_FAILED = 62980145;
const IMAGE_RESULT_MEDIA_WRITE_PARCEL_FAIL = 62980146;
const IMAGE_RESULT_MEDIA_READ_PARCEL_FAIL = 62980147;
const IMAGE_RESULT_MEDIA_NO_AVAIL_BUFFER = 62980148;
const IMAGE_RESULT_MEDIA_INVALID_PARAM = 62980149;
const IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_EXIST = 62980150;
const IMAGE_RESULT_MEDIA_CREATE_CODEC_ADAPTER_FAILED = 62980151;
const IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_INIT = 62980152;
const IMAGE_RESULT_MEDIA_ZCODEC_CREATE_FAILED = 62980153;
const IMAGE_RESULT_MEDIA_ZCODEC_NOT_EXIST = 62980154;
const IMAGE_RESULT_MEDIA_JNI_CLASS_NOT_EXIST = 62980155;
const IMAGE_RESULT_MEDIA_JNI_METHOD_NOT_EXIST = 62980156;
const IMAGE_RESULT_MEDIA_JNI_NEW_OBJ_FAILED = 62980157;
const IMAGE_RESULT_MEDIA_JNI_COMMON_ERROR = 62980158;
const IMAGE_RESULT_MEDIA_DISTRIBUTE_NOT_SUPPORT = 62980159;

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
const CASE_INDEX_19 = 19;
const CASE_INDEX_20 = 20;
const TAG = 'xts.imageEffectsSuppXts';

export default function ImageEffectsSuppTest() {
  describe('ImageEffectsSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00001
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00001
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00001';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00002
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00002
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00002';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00003
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00003
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00003';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_3);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00004
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00004
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00004', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00004';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_4);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00005
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00005
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00005', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00005';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_5);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00006
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00006
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00006', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00006';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_6);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00007
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00007
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00007', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00007';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_7);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00008
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00008
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00008', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00008';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_8);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00009
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00009
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00009', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00009';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_9);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00010
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00010
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00010', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00010';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_10);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00011
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00011
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00011', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00011';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_11);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00012
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00012
     * @tc.desc     OH_IMAGE_EFFECT_CONFIGURE -EFFECT_ERROR_29000121
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00012', Level.LEVEL0, () => {
      const testName: string = 'SUB_IMAGE_EFFECT_OH_IMAGE_EFFECT_CONFIGURE_SUPP_00012';
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageEffectConfigureSupp(CASE_INDEX_12);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00001
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE -EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00001';
      let result: number = testNapi.OHImageEffectSetOutputSurfaceSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00002
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_SURFACE_SUPP_00002';
      let result: number = testNapi.OHImageEffectSetOutputSurfaceSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00001
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE -EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00001';
      let result: number = testNapi.OHImageEffectGetInputSurfaceSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00002
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_GET_INPUT_SURFACE_SUPP_00002';
      let result: number = testNapi.OHImageEffectGetInputSurfaceSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00001
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_SAVE -EFFECT_SUCCESS
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00001';
      let result: number = testNapi.OHImageEffectSaveSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00002
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_SAVE -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00002';
      let result: number = testNapi.OHImageEffectSaveSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00003
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00003
     * @tc.desc        IMAGE_OH_IMAGE_EFFECT_SAVE -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SAVE_SUPP_00003';
      let result: number = testNapi.OHImageEffectSaveSupp(CASE_INDEX_3);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00001
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_ERROR_PERMISSION_DENIED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00001';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PERMISSION_DENIED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00002
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_BUFFER_SIZE_NOT_MATCH
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00002';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_BUFFER_SIZE_NOT_MATCH);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00003
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00003
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_COLOR_SPACE_NOT_MATCH
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00003';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_3);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_COLOR_SPACE_NOT_MATCH);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00004
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00004
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_INPUT_OUTPUT_NOT_MATCH
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00004', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00004';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_4);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_INPUT_OUTPUT_NOT_MATCH);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00005
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00005
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_EFFECT_NUMBER_LIMITED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00005', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00005';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_5);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_EFFECT_NUMBER_LIMITED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00006
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00006
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_INPUT_OUTPUT_NOT_SUPPORTED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00006', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00006';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_6);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_INPUT_OUTPUT_NOT_SUPPORTED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00007
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00007
     * @tc.desc        OH_IMAGE_EFFECT_EMU -EFFECT_ALLOCATE_MEMORY_FAILED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00007', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_EMU_SUPP_00007';
      let result: number = testNapi.OHImageEffectEmuSupp(CASE_INDEX_7);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ALLOCATE_MEMORY_FAILED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00002
     * @tc.desc        OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00002';
      let result: number = testNapi.OHImageEffectSetInputPixelmapSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00003
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00003
     * @tc.desc        OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_PIXELMAP_00003';
      let result: number = testNapi.OHImageEffectSetInputPixelmapSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00001
     * @tc.desc        OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00001';
      let result: number = testNapi.OHImageEffectSetOutputSurfaceSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00002
     * @tc.desc        OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_PIXELMAP_SUPP_00002';
      let result: number = testNapi.OHImageEffectSetOutputSurfaceSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00001
     * @tc.desc        OH_IMAGE_EFFECT_SET_INPUT_URI -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00001';
      let result: number = testNapi.OHImageEffectSetInputUriSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00002
     * @tc.desc        OH_IMAGE_EFFECT_SET_INPUT_URI -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_INPUT_URI_SUPP_00002';
      let result: number = testNapi.OHImageEffectSetInputUriSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00001
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00001
     * @tc.desc        OH_IMAGE_EFFECT_SET_OUTPUT_URI -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00001';
      let result: number = testNapi.OHImageEffectSetOutputUriSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00002
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00002
     * @tc.desc        OH_IMAGE_EFFECT_SET_OUTPUT_URI -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00002';
      let result: number = testNapi.OHImageEffectSetOutputUriSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00003
     * @tc.name        SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00003
     * @tc.desc        OH_IMAGE_EFFECT_SET_OUTPUT_URI -EFFECT_ERROR_PARAM_INVALID
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IMAGE_OH_IMAGE_EFFECT_SET_OUTPUT_URI_SUPP_00003';
      let result: number = testNapi.OHImageEffectSetOutputUriSupp(CASE_INDEX_3);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00001
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00001
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_SEEK_ERR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00001', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00001';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_1);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_SEEK_ERR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00002
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00002
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_PERMISSION_DENIED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00002', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00002';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_2);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_PERMISSION_DENIED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00003
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00003
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_DEAD_OBJECT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00003', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00003';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_3);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_DEAD_OBJECT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00004
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00004
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_TIMED_OUT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00004', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00004';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_4);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_TIMED_OUT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00005
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00005
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_TRACK_NOT_ALL_SUPPORTED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00005', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00005';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_5);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_TRACK_NOT_ALL_SUPPORTED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00006
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00006
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_ADAPTER_INIT_FAILED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00006', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00006';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_6);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_ADAPTER_INIT_FAILED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00007
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00007
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_WRITE_PARCEL_FAIL
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00007', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00007';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_7);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_WRITE_PARCEL_FAIL);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00008
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00008
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_READ_PARCEL_FAIL
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00008', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00008';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_8);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_READ_PARCEL_FAIL);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00009
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00009
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_NO_AVAIL_BUFFER
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00009', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00009';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_9);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_NO_AVAIL_BUFFER);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00010
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00010
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_INVALID_PARAM
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00010', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00010';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_10);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_INVALID_PARAM);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00011
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00011
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00011', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00011';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_11);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_EXIST);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00012
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00012
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_CREATE_CODEC_ADAPTER_FAILED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00012', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00012';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_12);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_CREATE_CODEC_ADAPTER_FAILED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00013
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00013
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_INIT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00013', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00013';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_13);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_INIT);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00014
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00014
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_ZCODEC_CREATE_FAILED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00014', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00014';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_14);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_ZCODEC_CREATE_FAILED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00015
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00015
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_ZCODEC_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00015', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00015';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_15);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_ZCODEC_NOT_EXIST);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00016
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00016
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_JNI_CLASS_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00016', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00016';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_16);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_JNI_CLASS_NOT_EXIST);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00017
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00017
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_JNI_METHOD_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00017', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00017';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_17);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_JNI_METHOD_NOT_EXIST);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00018
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00018
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_JNI_NEW_OBJ_FAILED
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00018', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00018';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_18);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_JNI_NEW_OBJ_FAILED);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00019
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00019
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_JNI_COMMON_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00019', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00019';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_19);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_JNI_COMMON_ERROR);
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IR_NDK_ERRCODE_00020
     * @tc.name        SUB_MULTIMEDIA_IR_NDK_ERRCODE_00020
     * @tc.desc        IR_NDK_ERRCODE --IMAGE_RESULT_MEDIA_DISTRIBUTE_NOT_SUPPORT
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IR_NDK_ERRCODE_00020', Level.LEVEL0, () => {
      const testName: string = 'SUB_MULTIMEDIA_IR_NDK_ERRCODE_00020';
      let result: number = testNapi.OIRNdkErrCodeEmuSupp(CASE_INDEX_20);
      console.info(TAG, testName, '  Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_MEDIA_DISTRIBUTE_NOT_SUPPORT);
    });
  });
}