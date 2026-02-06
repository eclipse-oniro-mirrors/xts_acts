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
const TAG = 'ImageNdk.PictureNativeTest'
export default function ImagePictureNativeTest() {
  describe('ImagePictureNativeTest', () => {
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
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_001
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_001
     * @tc.desc      OH_ComposeOptions_SetDesiredPixelFormat-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_001", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.SetDesiredPixelFormatTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_002
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_002
     * @tc.desc      OH_ComposeOptions_GetDesiredPixelFormat-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_002", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.GetDesiredPixelFormatTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_003
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_003
     * @tc.desc      OH_ComposeOptions_GetDesiredPixelFormat-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_003", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.GetDesiredPixelFormatTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_004
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_004
     * @tc.desc      OH_ComposeOptions_Release-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_004", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ComposeOptionsReleaseTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_005
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_005
     * @tc.desc      OH_PictureNative_GetHdrComposedPixelmapWithOptions-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_005", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.GetHdrComposedPixelmapWithOptionsTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_PICTURE_NATIVE_TEST_006
     * @tc.name      SUB_IMAGE_PICTURE_NATIVE_TEST_006
     * @tc.desc      OH_ComposeOptions_Create-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PICTURE_NATIVE_TEST_006", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ComposeOptionsCreateTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
  })
}