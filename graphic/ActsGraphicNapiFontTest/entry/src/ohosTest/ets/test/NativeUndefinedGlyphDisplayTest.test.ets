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
import libGraphicDrawing from 'libgraphicdrawing.so';

export default function NativeUndefinedGlyphDisplayTest() {
  describe('NativeUndefinedGlyphDisplayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay001
     * @tc.number OHDrawingSetTextUndefinedGlyphDisplay001
     * @tc.desc   OHDrawingSetTextUndefinedGlyphDisplay001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingSetTextUndefinedGlyphDisplay001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingSetTextUndefinedGlyphDisplay(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay002
     * @tc.number OHDrawingSetTextUndefinedGlyphDisplay002
     * @tc.desc   OHDrawingSetTextUndefinedGlyphDisplay002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingSetTextUndefinedGlyphDisplay002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingSetTextUndefinedGlyphDisplay(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay003
     * @tc.number OHDrawingSetTextUndefinedGlyphDisplay003
     * @tc.desc   OHDrawingSetTextUndefinedGlyphDisplay003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingSetTextUndefinedGlyphDisplay003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingSetTextUndefinedGlyphDisplay(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay004
     * @tc.number OHDrawingSetTextUndefinedGlyphDisplay004
     * @tc.desc   OHDrawingSetTextUndefinedGlyphDisplay004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingSetTextUndefinedGlyphDisplay004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingSetTextUndefinedGlyphDisplay(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay005
     * @tc.number OHDrawingSetTextUndefinedGlyphDisplay005
     * @tc.desc   OHDrawingSetTextUndefinedGlyphDisplay005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingSetTextUndefinedGlyphDisplay005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingSetTextUndefinedGlyphDisplay(4);
      expect(result).assertEqual(0);
    })

  })
}

