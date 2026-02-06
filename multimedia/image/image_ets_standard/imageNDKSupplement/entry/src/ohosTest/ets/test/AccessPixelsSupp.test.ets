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
import testNapi from "libimageEffect.so";


const TAG = 'AccessPixelsSuppXts';
const IMAGE_RESULT_SUCCESS = 0;
const IMAGE_BAD_PARAMETER = 401;
const IMAGE_DMA_NOT_EXIST = 7600173;
const CASE_INDEX_1 = 1;


export default function AccessPixelsSuppTest() {
  describe('AccessPixelsSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_ACCESS_PIXELS_SUPP_0001
     * @tc.name     SUB_IMAGE_ACCESS_PIXELS_SUPP_0001
     * @tc.desc     OHAccessPixels-IMAGE_RESULT_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_ACCESS_PIXELS_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.TestAccessPixels(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SUCCESS);
    });

    /**
     * @tc.number   SUB_IMAGE_ACCESS_PIXELS_SUPP_0002
     * @tc.name     SUB_IMAGE_ACCESS_PIXELS_SUPP_0002
     * @tc.desc     OHUnAccessPixels-IMAGE_RESULT_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_ACCESS_PIXELS_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.TestUnAccessPixels(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SUCCESS);
    });

    /**
     * @tc.number   SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0001
     * @tc.name     SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0001
     * @tc.desc     OHPixelmapNativeGetNativeBuffer-IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.PixelmapNativeGetNativeBuffer(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0002
     * @tc.name     SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0002
     * @tc.desc     OHPixelmapNativeGetNativeBuffer-IMAGE_DMA_NOT_EXIST
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_NATIVE_GET_NATIVE_SUPP_0002', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.PixelmapNativeGetNativeBufferNotExist(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_DMA_NOT_EXIST);
    });

    /**
     * @tc.number   SUB_IMAGE_SCALE_SUPP_0001
     * @tc.name     SUB_IMAGE_SCALE_SUPP_0001
     * @tc.desc     ImageScale-success
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SCALE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.TestImageScale(CASE_INDEX_1);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number   SUB_IMAGE_PIXEL_MAP_WRITE_PIXELS_MAP_TO_AREA_SUPP_0001
     * @tc.name     SUB_IMAGE_PIXEL_MAP_WRITE_PIXELS_MAP_TO_AREA_SUPP_0001
     * @tc.desc     OH_PixelmapNative_WritePixelsToArea-IMAGE_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_WRITE_PIXELS_MAP_TO_AREA_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.PixelmapNativeWritePixelsToArea(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertTrue();
    });
  });
}