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
import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { indexSurfaceId } from "../testability/pages/Index";

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const IMAGE_SUCCESS = 0
const IMAGE_BAD_PARAMETER = 401


const TAG = 'ImageNdk.OHImageNdkFrameworkTest'
let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}
export default function OHImageNdkFrameworkTest() {
  describe('OHImageNdkFrameworkTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await sleep(1000);
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
     * @tc.number    SUB_IMAGE_FRAME_WORK_TEST_001
     * @tc.name      SUB_IMAGE_FRAME_WORK_TEST_001
     * @tc.desc      ImagePackerNativeCreate-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_FRAME_WORK_TEST_001", Level.LEVEL0, () => {
      let errorCode = testNapi.ImagePackerNativeCreateTest(CASE_INDEX_1);
      expect(errorCode).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number    SUB_IMAGE_FRAME_WORK_TEST_002
     * @tc.name      SUB_IMAGE_FRAME_WORK_TEST_002
     * @tc.desc      OHDecodingOptionsCreateTest-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_FRAME_WORK_TEST_002", Level.LEVEL0, () => {
      let errorCode = testNapi.OHDecodingOptionsCreateTest(CASE_INDEX_1);
      expect(errorCode).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number    SUB_IMAGE_FRAME_WORK_TEST_003
     * @tc.name      SUB_IMAGE_FRAME_WORK_TEST_003
     * @tc.desc      OH_PixelmapNative_GetImageInfo-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_FRAME_WORK_TEST_003", Level.LEVEL0, () => {
      let errorCode = testNapi.OH_PixelmapNative_GetImageInfoTest(CASE_INDEX_1);
      expect(errorCode).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number    SUB_IMAGE_FRAME_WORK_TEST_004
     * @tc.name      SUB_IMAGE_FRAME_WORK_TEST_004
     * @tc.desc      OH_PixelmapNative_ConvertAlphaFormat-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_FRAME_WORK_TEST_004", Level.LEVEL0, () => {
      let errorCode = testNapi.OH_PixelmapNative_ConvertAlphaFormatTest(CASE_INDEX_1);
      expect(errorCode).assertEqual(IMAGE_SUCCESS);
    })

  })
}