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
const TAG = 'imageErrorSuppXts';

export default function ImageErrorSuppTest() {
  describe('ImageErrorSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0001
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0001
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_UNKNOWN
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0002
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0002
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_OPAQUE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0003
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0003
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_PREMUL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0004
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0004
     * @tc.desc     OHOS_PIXEL_MAP_ALPHA_TYPE_UNPREMUL
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ALPHA_TYPE_SUPP_0004', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_READ_ONLY_SUPP_0001
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_READ_ONLY_SUPP_0001
     * @tc.desc     OHOS_PIXEL_MAP_READ_ONLY
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_READ_ONLY_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_EDITABLE_SUPP_0002
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_EDITABLE_SUPP_0002
     * @tc.desc     OHOS_PIXEL_MAP_EDITABLE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_EDITABLE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_6);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0001
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0001
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_NONE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_7);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0002
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0002
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_RGBA_8888
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_8);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0003
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0003
     * @tc.desc     OHOS_PIXEL_MAP_FORMAT_RGB_565
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_NAPI_SUPP_0003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAlphaTypeSupp(CASE_INDEX_9);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0001
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0001
     * @tc.desc     IMAGE_UNSUPPORTED_MIME_TYPE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600101);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0002
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0002
     * @tc.desc     IMAGE_UNKNOWN_MIME_TYPE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600102);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0003
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0003
     * @tc.desc     IMAGE_TOO_LARGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600103);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0004
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0004
     * @tc.desc     IMAGE_DMA_OPERATION_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0004', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600174);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0005
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0005
     * @tc.desc     IMAGE_UNSUPPORTED_CONVERSION
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0005', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600203);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0006
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0006
     * @tc.desc     IMAGE_INVALID_REGION
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0006', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_6);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600204);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0007
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0007
     * @tc.desc     IMAGE_UNSUPPORTED_MEMORY_FORMAT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0007', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_7);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600205);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0008
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0008
     * @tc.desc     IMAGE_INVALID_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0008', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_8);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600206);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0009
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0009
     * @tc.desc     IMAGE_UNSUPPORTED_DATA_FORMAT
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0009', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_9);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600207);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0010
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0010
     * @tc.desc     IMAGE_LOCK_UNLOCK_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0010', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_10);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600303);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0011
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0011
     * @tc.desc     IMAGE_INIT_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0011', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_11);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600304);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0012
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0012
     * @tc.desc     IMAGE_CREATE_PIXELMAP_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0012', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_12);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600305);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0013
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0013
     * @tc.desc     IMAGE_ALLOCATOR_MODE_UNSUPPORTED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0013', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_13);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7600501);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0014
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0014
     * @tc.desc     IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0014', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_14);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7700102);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0015
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0015
     * @tc.desc     IMAGE_SOURCE_TOO_LARGE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0015', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_15);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7700103);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0016
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0016
     * @tc.desc     IMAGE_DECODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0016', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_16);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7700301);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0017
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0017
     * @tc.desc     IMAGE_SOURCE_ALLOC_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0017', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_17);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7700302);
    });

    /**
     * @tc.number   SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0018
     * @tc.name     SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0018
     * @tc.desc     IMAGE_ENCODE_FAILED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_EFFECT_OH_IMAGE_ERROR_CODE_SUPP_0018', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageErrorCodeSupp(CASE_INDEX_18);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(7800301);
    });

    /**
     * @tc.number   SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0001
     * @tc.name     SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0001
     * @tc.desc     OHOS_PIXEL_MAP_SCALE_MODE_FIT_TARGET_SIZE
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageScaleModeSupp(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0002
     * @tc.name     SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0002
     * @tc.desc     OHOS_PIXEL_MAP_SCALE_MODE_CENTER_CROP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SCALE_MODE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageScaleModeSupp(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number   SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0001
     * @tc.name     SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0001
     * @tc.desc     AUXILIARY_PICTURE_TYPE_GAINMAP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAuxiliaryPictureSupp(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number   SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0002
     * @tc.name     SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0002
     * @tc.desc     AUXILIARY_PICTURE_TYPE_DEPTH_MAP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAuxiliaryPictureSupp(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number   SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0003
     * @tc.name     SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0003
     * @tc.desc     AUXILIARY_PICTURE_TYPE_UNREFOCUS_MAP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAuxiliaryPictureSupp(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number   SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0004
     * @tc.name     SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0004
     * @tc.desc     AUXILIARY_PICTURE_TYPE_LINEAR_MAP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0004', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAuxiliaryPictureSupp(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number   SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0005
     * @tc.name     SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0005
     * @tc.desc     AUXILIARY_PICTURE_TYPE_FRAGMENT_MAP
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_AUXILIARY_PICTURE_TYPE_SUPP_0005', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageAuxiliaryPictureSupp(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number   SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0001
     * @tc.name     SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0001
     * @tc.desc     MediaLibraryErrorCode-MEDIA_LIBRARY_PERMISSION_DENIED
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.MediaLibraryErrorCode(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(201);
    });

    /**
     * @tc.number   SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0002
     * @tc.name     SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0002
     * @tc.desc     MediaLibraryErrorCode-MEDIA_LIBRARY_INVALID_DISPLAY_NAME
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.MediaLibraryErrorCode(CASE_INDEX_2);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(23800102);
    });

    /**
     * @tc.number   SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0003
     * @tc.name     SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0003
     * @tc.desc     MediaLibraryErrorCode-MEDIA_LIBRARY_INVALID_ASSET_URI
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0003', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.MediaLibraryErrorCode(CASE_INDEX_3);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(23800103);
    });

    /**
     * @tc.number   SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0004
     * @tc.name     SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0004
     * @tc.desc     MediaLibraryErrorCode-MEDIA_LIBRARY_INVALID_PHOTO_KEY
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0004', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.MediaLibraryErrorCode(CASE_INDEX_4);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(23800104);
    });

    /**
     * @tc.number   SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0005
     * @tc.name     SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0005
     * @tc.desc     MediaLibraryMediaType-MEDIA_LIBRARY_VIDEO
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_MEDIA_LIBRARY_ERROR_CODE_SUPP_0005', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.MediaLibraryErrorCode(CASE_INDEX_5);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(2);
    });

  });
}