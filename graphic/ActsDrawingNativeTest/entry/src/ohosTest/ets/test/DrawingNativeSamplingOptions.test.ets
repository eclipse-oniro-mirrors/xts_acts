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


export default function DrawingNativeSamplingOptionsTest() {
  describe('DrawingNativeSamplingOptionsTest', () => {
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
     * @tc.name   testSamplingOptionsCreateDestroyDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0100
     * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsCreateDestroyDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSamplingOptions(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSamplingOptionsCreateDestroyDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0200
     * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsCreateDestroyDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSamplingOptionsCreateDestroyDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0300
     * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsCreateDestroyDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSamplingOptionsCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0400
     * @tc.desc   test for testSamplingOptionsCopyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSamplingOptionsCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSamplingOptions(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSamplingOptionsCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0500
     * @tc.desc   test for testSamplingOptionsCopyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testSamplingOptionsCopyMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingSamplingOptions_0600
     * @tc.desc   test for testSamplingOptionsCopyMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testSamplingOptionsCopyMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(5);
      expect(result).assertEqual(0);
    })
  })
}