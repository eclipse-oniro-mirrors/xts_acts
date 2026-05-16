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
const TAG = 'ImageNdk.ImagePixelMapCreateTest'
export default function OHImagePixelMapCreateTest() {
  describe('OHImagePixelMapCreateTest', () => {
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
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_001
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_001", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);//图像获取数据错误
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_002
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_THIRDPART_SKIA_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_002", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980268);//skia解码失败
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_003
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_003
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_003", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);//无效参数
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_004
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_004
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_004", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_4);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980115);//图像无效参数
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_005
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_005
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_005", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_5);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_006
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_006
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_006", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);//图像获取数据错误
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_007
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_007
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_007", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_008
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_008
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_THIRDPART_SKIA_ERROR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_008", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980268);//skia解码失败
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_009
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_009
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_009", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_4);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_010
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_010
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_010", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_5);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980115);//图像无效参数
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_011
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_011
     * @tc.desc      OH_PixelMap_CreatePixelMap-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_011", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapTest(CASE_INDEX_6);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_012
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_012
     * @tc.desc      OH_PixelMap_CreatePixelMapWithStride-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_012", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelMapWithStrideTest(CASE_INDEX_6);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);//图像无效参数
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_013
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_013
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_013", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreateAlphaPixelMapTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_014
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_014
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_014", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreateAlphaPixelMapTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_015
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_015
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_GET_DATA_ABNORMAL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_015", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreateAlphaPixelMapTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980105);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_016
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_016
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_016", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreateAlphaPixelMapTest(CASE_INDEX_4);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(62980115);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_017
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_017
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_017", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.PixelMapGetImageInfoTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_018
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_018
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_018", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.PixelMapGetImageInfoTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_019
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_019
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_019", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.PixelMapAccessPixelsTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_020
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_020
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_020", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.PixelMapUnAccessPixelsTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_TEST_021
     * @tc.name      SUB_IMAGE_PIXEL_MAP_TEST_021
     * @tc.desc      OH_PixelMap_CreateAlphaPixelMap-IMAGE_RESULT_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PIXEL_MAP_TEST_021", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreateAlphaPixelMapTest(CASE_INDEX_5);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
  })
}