/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

export default function NativeFontTest() {
  describe('NativeFontTest', () => {
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
     * @tc.name   NativeFontTest_FontMeasureText015
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1500
     * @tc.desc   test for the textbox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText015', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeFontTest_FontMeasureText016
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1600
     * @tc.desc   test for the textshadow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText016', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeFontTest_FontMeasureText017
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1700
     * @tc.desc   test for the fontVariation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeFontTest_FontMeasureText017', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeFontTest_FontMeasureText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeDrawingRegisterFontTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_REGISTER_FONT_TEST_0100
     * @tc.desc   test for register font
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeDrawingRegisterFontTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeDrawingRegisterFontTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   NativeDrawingRegisterFontTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_REGISTER_FONT_TEST_0200
     * @tc.desc   test for register font
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NativeDrawingRegisterFontTest002', Level.LEVEL1, () => {
      const result = libGraphicDrawing.NativeDrawingRegisterFontTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontCollectionTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_COLLECTION_TEST_0100
     * @tc.desc   test for creating fontCollection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontCollectionTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OH_Drawing_FontCollectionTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest016
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_1600
     * @tc.desc   test for typography
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest016', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest026
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_2600
     * @tc.desc   test for typography and txtStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest026', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest027
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_2700
     * @tc.desc   test for getting line info for text typography
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest027', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTest042
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_4200
     * @tc.desc   test for text shadow for textstyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTest042', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingTypographyLargeValueTestWithIndent
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_WITH_INDENT_0100
     * @tc.desc   test for typography
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingTypographyLargeValueTestWithIndent', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingTypographyLargeValueTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0100
     * @tc.desc   test for the text tab create and destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0200
     * @tc.desc   test for get alignment of the text tab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCreateTextTab003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0300
     * @tc.desc   test for get location of the text tab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCreateTextTab003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCreateTextTab(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0100
     * @tc.desc   test for text tab with left alignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0200
     * @tc.desc   test for text tab with left alignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0300
     * @tc.desc   test for text tab with center alignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0400
     * @tc.desc   test for setting both the texttab and text layout direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypographyTest005
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0500
     * @tc.desc   test for setting both the texttab and ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TypographyTest005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.TypographyTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0100
     * @tc.desc   test for common character of textpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0200
     * @tc.desc   test for UTF16 and UTF32 character of textpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0300
     * @tc.desc   test for space character of textpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0400
     * @tc.desc   test for negative coordinates of textpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   FontGetTextPath005
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0500
     * @tc.desc   test for conversion of glyphsID to path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FontGetTextPath005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.FontGetTextPath(4);
      expect(result).assertEqual(0);
    })

  })
}

