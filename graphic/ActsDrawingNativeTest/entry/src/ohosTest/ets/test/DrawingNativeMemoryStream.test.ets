/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativeMemoryStreamTest() {
  describe('DrawingNativeMemoryStreamTest', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testMemoryStreamCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMemoryStream_0100
     * @tc.desc   Test for creating memory stream with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMemoryStreamCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMemoryStream(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMemoryStreamCreateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMemoryStream_0200
     * @tc.desc   Test for creating memory stream with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMemoryStreamCreateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMemoryStreamCreateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMemoryStream_0300
     * @tc.desc   Test for creating memory stream with abnormal parameters (negative values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMemoryStreamCreateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMemoryStreamCreateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMemoryStream_0400
     * @tc.desc   Test for creating memory stream with multiple calls using different data segments.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMemoryStreamCreateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(3);
      expect(result).assertEqual(0);
    })
  })
}