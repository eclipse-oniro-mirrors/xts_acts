/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function NativeTextLineTest() {
  describe('NativeTextLineTest', () => {
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
     * @tc.name   TextLineTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0100
     * @tc.desc   test for the textLine GetGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0200
     * @tc.desc   test for the textLine GetGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0300
     * @tc.desc   test for the textLine GetGlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0400
     * @tc.desc   test for the textLine GetTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest005
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0500
     * @tc.desc   test for the textLine GetTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest006
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0600
     * @tc.desc   test for the textLine GetTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest006', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest007
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0700
     * @tc.desc   test for the textLine GetTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest007', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest008
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0800
     * @tc.desc   test for the textLine GetGlyphRuns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest008', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest009
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0900
     * @tc.desc   test for the textLine GetGlyphRuns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest009', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest010
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1000
     * @tc.desc   test for the textLine GetGlyphRuns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest010', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest011
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1100
     * @tc.desc   test for the textLine GetGlyphRuns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest011', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest012
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1200
     * @tc.desc   test for the textLine GetTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest012', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest013
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1300
     * @tc.desc   test for the textLine GetTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest013', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest014
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1400
     * @tc.desc   test for the textLine GetTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest014', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest015
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1500
     * @tc.desc   test for the textLine GetTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest015', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest016
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1600
     * @tc.desc   test for the textLine GetTrailingSpaceWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest016', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest017
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1700
     * @tc.desc   test for the textLine GetTrailingSpaceWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest017', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest018
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1800
     * @tc.desc   test for the textLine GetTrailingSpaceWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest018', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest019
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1900
     * @tc.desc   test for the textLine GetOffsetForStringIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest019', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest020
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2000
     * @tc.desc   test for the textLine GetOffsetForStringIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest020', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest021
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2100
     * @tc.desc   test for the textLine EnumerateCaretOffsets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest021', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest022
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2200
     * @tc.desc   test for the textLine EnumerateCaretOffsets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest022', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest023
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2300
     * @tc.desc   test for the textLine EnumerateCaretOffsets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest023', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest024
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2400
     * @tc.desc   test for the textLine GetAlignmentOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest024', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TextLineTest025
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2500
     * @tc.desc   test for the textLine GetAlignmentOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextLineTest025', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TextLineTest(24);
      expect(result).assertEqual(0);
    })

  })
}

