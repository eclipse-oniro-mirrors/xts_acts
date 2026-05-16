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
import { driveFn, getPermission } from "./common";
import { image } from "@kit.ImageKit";

const CASE_INDEX_1 = 1;
const TAG = 'ImageNdk.ImageReceiverNativeReadTest'
export default function ImageReceiverNativeReadTest() {
  describe('ImageReceiverNativeReadTest', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
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
     * @tc.number    SUB_IMAGE_RICEIVER_NATIVE_READ_TEST_001
     * @tc.name      SUB_IMAGE_RICEIVER_NATIVE_READ_TEST_001
     * @tc.desc      OH_ImageReceiverNative_ReadLatestImage-IMAGE_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_RICEIVER_NATIVE_READ_TEST_001", Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_IMAGE_RICEIVER_NATIVE_READ_TEST_001';
      try {
        let result: number =
          testNapi.ImageReceiverNativeReadLatestImageSuccessTest(CASE_INDEX_1, (receiver: image.ImageReceiver) => {
          })
        console.info(TAG, 'Succeed', JSON.stringify(result));
        expect(result).assertEqual(0);
        done();
      } catch (error) {
        console.error(TAG, `${testNum} failed; error: ${error.code}  ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}

