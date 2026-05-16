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


export default function DrawingNativeColorTest() {
  describe('DrawingNativeColorTest', () => {
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
     * @tc.name   testColorSetArgbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSetArgb_0100
     * @tc.desc   test for testColorSetArgbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorSetArgbNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSetArgb(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSetArgbNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSetArgb_0200
     * @tc.desc   test for testColorSetArgbNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSetArgbNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSetArgbMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSetArgb_0300
     * @tc.desc   test for testColorSetArgbMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSetArgbMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSetArgbAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSetArgb_0400
     * @tc.desc   test for testColorSetArgbAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSetArgbAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSetArgbMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSetArgb_0500
     * @tc.desc   test for testColorSetArgbMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSetArgbMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(4);
      expect(result).assertEqual(0);
    })
  })
}