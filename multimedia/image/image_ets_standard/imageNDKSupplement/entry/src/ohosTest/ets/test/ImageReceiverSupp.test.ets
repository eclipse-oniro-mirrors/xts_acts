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


const TAG = 'ImageReceiverTestSuppXts';
const IMAGE_BAD_PARAMETER = 401;
const IMAGE_SUCCESS = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;

export default function ImageReceiverSuppTest() {
  describe('ImageReceiverSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_SIZE_SUPP_0001
     * @tc.name     SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_SIZE_SUPP_0001
     * @tc.desc     OH_ImageReceiverOptions_GetSize --IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_SIZE_SUPP_0001', Level.LEVEL0, () => {
      const testName = 'SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_SIZE_SUPP_0001';
      console.info(TAG,testName,'Start',);
      let result: number = testNapi.OhInitReceiverOptions();
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_CAPACITY_0001
     * @tc.name     SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_CAPACITY_0001
     * @tc.desc     OH_ImageReceiverOptions_GetCapacity --IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_CAPACITY_0001', Level.LEVEL0, () => {
      const testName = 'SUB_OH_IMAGE_RECEIVER_OPTIONS_GET_CAPACITY_0001';
      console.info(TAG,testName,'Start',);
      let result: number = testNapi.OhInitReceiverOptionsGetCapacity();
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_OH_IMAGE_RECEIVER_NATIVE_GET_SIZE_SUPP_0001
     * @tc.name     SUB_OH_IMAGE_RECEIVER_NATIVE_GET_SIZE_SUPP_0001
     * @tc.desc     OH_ImageReceiverNative_GetSize --IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_OH_IMAGE_RECEIVER_NATIVE_GET_SIZE_SUPP_0001', Level.LEVEL0, () => {
      const testName = 'SUB_OH_IMAGE_RECEIVER_NATIVE_GET_SIZE_SUPP_0001';
      console.info(TAG,testName,'Start',);
      let result: number = testNapi.OhImageReceiverNativeGetSize();
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_RECEIVER_NATIVE_SUPP_0001
     * @tc.name     SUB_IMAGE_RECEIVER_NATIVE_SUPP_0001
     * @tc.desc     OH_ImageReceiverNative_GetReceivingSurfaceId-IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_RECEIVER_NATIVE_SUPP_0001', Level.LEVEL0,async () => {
      console.info(TAG,'Start',);
      let result:number = testNapi.ImageReceiverNativeSuppTest(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_RECEIVER_NATIVE_GET_CAPACITY_SUPP_0001
     * @tc.name     SUB_IMAGE_RECEIVER_NATIVE_GET_CAPACITY_SUPP_0001
     * @tc.desc     OH_ImageReceiverNative_GetCapacity-IMAGE_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_RECEIVER_NATIVE_GET_CAPACITY_SUPP_0001', Level.LEVEL0,async () => {
      console.info(TAG,'Start',);
      let result:number = testNapi.ImageReceiverNativeGetCapacitySuppTest(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_COMPOSE_OPTIONS_RELEASE_SUPP_0001
     * @tc.name     SUB_COMPOSE_OPTIONS_RELEASE_SUPP_0001
     * @tc.desc     OH_ComposeOptions_Release-IMAGE_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_COMPOSE_OPTIONS_RELEASE_SUPP_0001', Level.LEVEL0,async () => {
      console.info(TAG,'Start',);
      let result:number = testNapi.ComposeOptionsReleaseSuppTest();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0001
     * @tc.name    SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0001
     * @tc.desc    OH_ImageNative_GetComponentTypes-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0001', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0001"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHImageNativeGetComponentTypesSupp();
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

    /**
     * @tc.number  SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0002
     * @tc.name    SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0002
     * @tc.desc    OH_PackingOptionsForSequence_GetFrameCount-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0002', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0002"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPackingOptionsForSequenceGetFrameCountSupp(CASE_INDEX_1);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0003
     * @tc.name    SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0003
     * @tc.desc    OH_PackingOptionsForSequence_GetFrameCount-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0003', Level.LEVEL0, async () => {
      const testName = "SUB_IMAGE_MDK_OH_IMAGE_TEST_SUPP_0003"
      console.info(TAG, testName, 'Start',);
      let result: number = testNapi.OHPackingOptionsForSequenceGetFrameCountSupp(CASE_INDEX_2);
      console.info(TAG, testName, 'Success', JSON.stringify(result));
      expect(Number(result)).assertEqual(IMAGE_BAD_PARAMETER);
    });

  });
}