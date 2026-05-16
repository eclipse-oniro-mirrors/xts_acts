/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import libImageTest from 'libimagetest.so';

export default function ImageTest() {
  describe('ImageTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0010
     * @tc.number VPE_IMAGE_API_TEST_0010
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_CscTest(0);
      expect(result).assertEqual(0);
      done();
    })


    /**
     * @tc.name   VPE_IMAGE_API_TEST_0020
     * @tc.number VPE_IMAGE_API_TEST_0020
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0020', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_CscTest(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0030
     * @tc.number VPE_IMAGE_API_TEST_0030
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0030', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_CscTest(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0040
     * @tc.number VPE_IMAGE_API_TEST_0040
     * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0040', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_CscTest(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0050
     * @tc.number VPE_IMAGE_API_TEST_0050
     * @tc.desc   OH_ImageProcessing_DeinitializeEnvironment IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0050', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_CscTest(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0060
     * @tc.number VPE_IMAGE_API_TEST_0060
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0060', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0070
     * @tc.number VPE_IMAGE_API_TEST_0070
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0070', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0080
     * @tc.number VPE_IMAGE_API_TEST_0080
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0080', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(2);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   VPE_IMAGE_API_TEST_0090
     * @tc.number VPE_IMAGE_API_TEST_0090
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0090', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0100
     * @tc.number VPE_IMAGE_API_TEST_0100
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0100', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0110
     * @tc.number VPE_IMAGE_API_TEST_0110
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0110', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_ComposeTest(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0120
     * @tc.number VPE_IMAGE_API_TEST_0120
     * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0120', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_InvalidInstanceTest(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0130
     * @tc.number VPE_IMAGE_API_TEST_0130
     * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0130', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_InvalidInstanceTest(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VPE_IMAGE_API_TEST_0140
     * @tc.number VPE_IMAGE_API_TEST_0140
     * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VPE_IMAGE_API_TEST_0140', Level.LEVEL0, async (done: Function) => {
      const result = await libImageTest.Image_InvalidInstanceTest(2);
      expect(result).assertEqual(0);
      done();
    })
  })
}
