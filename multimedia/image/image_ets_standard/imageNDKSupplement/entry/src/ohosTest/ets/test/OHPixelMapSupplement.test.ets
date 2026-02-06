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
const IMAGE_SUCCESS = 0;
const IMAGE_RESULT_BAD_PARAMETER = -1;

const EFFECT_ERROR_PARAM_INVALID = 401;

const IMAGE_BAD_PARAMETER = 401

const IMAGE_UNKNOWN_ERROR =7600901

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;


const TAG = 'OHPixelMapSupplementSupp';


export default function OHPixelMapSupplementTest() {
  describe('OHPixelMapSupplementTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_OH_PIXEL_MAP_TRANSLATE_001
     * @tc.name    SUB_OH_PIXEL_MAP_TRANSLATE_001
     * @tc.desc    OHPixelMapTranslate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_TRANSLATE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapTranslateSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_TRANSLATE_002
     * @tc.name    SUB_OH_PIXEL_MAP_TRANSLATE_002
     * @tc.desc    OHPixelMapTranslate IMAGE_RESULT_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_TRANSLATE_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapTranslateSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_TRANSLATE_003
     * @tc.name    SUB_OH_PIXEL_MAP_TRANSLATE_003
     * @tc.desc    OHPixelMapTranslate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_TRANSLATE_003', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapTranslateSupplementTest(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_ROTATE_001
     * @tc.name    SUB_OH_PIXEL_MAP_ROTATE_001
     * @tc.desc    OHPixelMapRotate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_ROTATE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapRotateSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_ROTATE_002
     * @tc.name    SUB_OH_PIXEL_MAP_ROTATE_002
     * @tc.desc    OHPixelMapRotate IMAGE_RESULT_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_ROTATE_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapRotateSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_ROTATE_003
     * @tc.name    SUB_OH_PIXEL_MAP_ROTATE_003
     * @tc.desc    OHPixelMapRotate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_ROTATE_003', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelMapRotateSupplementTest(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_SET_COLOR_SPACE_NATIVE_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_SET_COLOR_SPACE_NATIVE_001
     * @tc.desc    OHPixelmapNativeSetColorSpaceNative IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_SET_COLOR_SPACE_NATIVE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeSetColorSpaceNativeSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_GET_COLOR_SPACE_NATIVE_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_GET_COLOR_SPACE_NATIVE_001
     * @tc.desc    OHPixelmapNativeSetColorSpaceNative EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_GET_COLOR_SPACE_NATIVE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeGetColorSpaceNativeSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_001
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_001
     * @tc.desc    OHEffectBufferInfoSetAddr EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoSetAddrSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_002
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_002
     * @tc.desc    OHEffectBufferInfoSetAddr EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoSetAddrSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_003
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_003
     * @tc.desc    OHEffectBufferInfoSetAddr EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_003', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoSetAddrSupplementTest(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_004
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_004
     * @tc.desc    OHEffectBufferInfoSetAddr EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_SET_ADDR_004', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoSetAddrSupplementTest(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_001
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_001
     * @tc.desc    OHEffectBufferInfoGetAddr EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoGetAddrSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_002
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_002
     * @tc.desc    OHEffectBufferInfoGetAddr EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoGetAddrSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_003
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_003
     * @tc.desc    OHEffectBufferInfoGetAddr EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_GET_ADDR_003', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectBufferInfoGetAddrSupplementTest(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_RECEIVE_CREATE_IMAGE_RECEIVE_001
     * @tc.name    SUB_OH_IMAGE_RECEIVE_CREATE_IMAGE_RECEIVE_001
     * @tc.desc    CreateImageReceiver IMAGE_RESULT_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_RECEIVE_CREATE_IMAGE_RECEIVE_001', Level.LEVEL0, () => {
      console.info(TAG, 'Start')
      let result: number = testNapi.CreateImageReceiverSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_BUFFER_INFO_CREATE_001
     * @tc.name    SUB_OH_EFFECT_BUFFER_INFO_CREATE_001
     * @tc.desc    OHEffectBufferInfoCreate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_BUFFER_INFO_CREATE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectBufferInfoCreateSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_FILTER_CREATE_001
     * @tc.name    SUB_OH_IMAGE_FILTER_CREATE_001
     * @tc.desc    OHEffectFilterCreate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_FILTER_CREATE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterCreateSupplementTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_FILTER_CREATE_002
     * @tc.name    SUB_OH_IMAGE_FILTER_CREATE_002
     * @tc.desc    OHEffectFilterCreate EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_FILTER_CREATE_002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterCreateSupplementTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    /**
     * @tc.number  SUB_OH_EFFECT_FILER_INFO_CREATE_001
     * @tc.name    SUB_OH_EFFECT_FILER_INFO_CREATE_001
     * @tc.desc    OHEffectFilterInfoCreate EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_EFFECT_FILER_INFO_CREATE_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHEffectFilterInfoCreateSupplementTest(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_UNACCESS_PIXELS_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_UNACCESS_PIXELS_001
     * @tc.desc    OHPixelmapNativeUnaccessPixels IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_UNACCESS_PIXELS_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeUnaccessPixelsSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_ACCESS_PIXELS_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_ACCESS_PIXELS_001
     * @tc.desc    OHPixelmapNativeAccessPixels IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_ACCESS_PIXELS_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeAccessPixelsSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_001
     * @tc.desc    OHPixelmapNativeCreateAlphaPixelmap IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeCreateAlphaPixelmapSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_002
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_002
     * @tc.desc    OHPixelmapNativeCreateAlphaPixelmap IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_CREATE_ALPHA_PIXEL_MAP_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeCreateAlphaPixelmapSuppTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_001
     * @tc.desc    OHPixelmapNativeGetUniqueId IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeGetUniqueIdSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_002
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_002
     * @tc.desc    OHPixelmapNativeGetUniqueId IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_GET_UNIQUE_ID_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeGetUniqueIdSuppTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_001
     * @tc.desc    OHPixelmapNativeIsReleased IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeIsReleasedSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_002
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_002
     * @tc.desc    OHPixelmapNativeIsReleased IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_IS_RELEASED_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeIsReleasedSuppTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_001
     * @tc.desc    OHPixelmapNativeReadPixelsFromArea IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeReadPixelsFromAreaSuppTest(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_002
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_002
     * @tc.desc    OHPixelmapNativeReadPixelsFromArea IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_READ_PIXELS_FROM_AREA_002', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeReadPixelsFromAreaSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_PIXEL_MAP_NATIVE_WRITE_PIXELS_TO_AREA_001
     * @tc.name    SUB_OH_PIXEL_MAP_NATIVE_WRITE_PIXELS_TO_AREA_001
     * @tc.desc    OHPixelmapNativeReadPixelsFromArea IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_PIXEL_MAP_NATIVE_WRITE_PIXELS_TO_AREA_001', Level.LEVEL0, () => {
      console.info(TAG,'Start')
      let result: number = testNapi.OHPixelmapNativeWritePixelsToAreaSuppTest(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
  })
}