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

export default function NativeDrawingFontMgrTest() {
  describe('NativeDrawingFontMgrTest', () => {
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
     * @tc.name   OH_Drawing_FontMgrTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0100
     * @tc.desc   test for creating and destroying font manager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0200
     * @tc.desc   test for getting family name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest002', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0300
     * @tc.desc   test for creating and destroying font style set by font mannager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest003', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0400
     * @tc.desc   test for matching font family by family name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest004', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest005
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0500
     * @tc.desc   test for matching font typeface by family name and font style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest005', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest006
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0600
     * @tc.desc   test for matching font typeface by family name, font style and specific character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest006', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest007
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0700
     * @tc.desc   test for getting family name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest007', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest008
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0800
     * @tc.desc   test for matching family style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest008', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest009
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_0900
     * @tc.desc   test for matching family style character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest009', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest010
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1000
     * @tc.desc   test for create a typeface for the given index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest010', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest011
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1100
     * @tc.desc   test for get font style struct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest011', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest012
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1200
     * @tc.desc   test for get typeface by match style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest012', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_Drawing_FontMgrTest013
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_TEST_1300
     * @tc.desc   test for get font style set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OH_Drawing_FontMgrTest013', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrTest(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0100
     * @tc.desc   test for matching font is not a null pointer, but points to the default font, when bcp47 is a null pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterNormalBcp47Null', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0200
     * @tc.desc   Test for matching font typeface with empty bcp47 array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterEmptyBcp47', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0300
     * @tc.desc   Test for matching font typeface with weight 900.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight900', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0400
     * @tc.desc   Test for matching font typeface with weight 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight100', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0500
     * @tc.desc   Test for matching font typeface with width 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth1', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0600
     * @tc.desc   Test for matching font typeface with width 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth9', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0700
     * @tc.desc   Test for matching font typeface with style oblique.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterStyleOblique', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0800
     * @tc.desc   Test for matching font typeface with familyName null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyNameNull', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_WEIGHT_0100
     * @tc.desc   Test for matching font typeface with familyName null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWeightExceedMaxValue', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_0900
     * @tc.desc   Test for matching font typeface with familyName null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterFamilyWidthExceedMaxValue', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1000
     * @tc.desc   Test for matching font typeface with weight 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1100
     * @tc.desc   Test for matching font typeface with weight 300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1200
     * @tc.desc   Test for matching font typeface with weight 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight400', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1300
     * @tc.desc   Test for matching font typeface with weight 500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight500', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1400
     * @tc.desc   Test for matching font typeface with weight 600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight600', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1500
     * @tc.desc   Test for matching font typeface with weight 700.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight700', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1600
     * @tc.desc   Test for matching font typeface with weight 800.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight800', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1700
     * @tc.desc   Test for matching font typeface with width 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width1', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1800
     * @tc.desc   Test for matching font typeface with width 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth2', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_1900
     * @tc.desc   Test for matching font typeface with width 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth3', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2000
     * @tc.desc   Test for matching font typeface with width 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth4', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2100
     * @tc.desc   Test for matching font typeface with width 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth6', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2200
     * @tc.desc   Test for matching font typeface with width 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth7', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2300
     * @tc.desc   Test for matching font typeface with width 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWidth8', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2400
     * @tc.desc   Test for matching font typeface with width 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Width9', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2500
     * @tc.desc   Test for matching font typeface with style 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterStyle0', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2600
     * @tc.desc   Test for matching font typeface with style 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterStyle1', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2700
     * @tc.desc   Test for matching font typeface with style 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterStyle2', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2800
     * @tc.desc   Test for matching font typeface with weight 200 and style 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style0', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CHARACTER_WEIGHT_200_STYLE_0100
     * @tc.desc   Test for matching font typeface with weight 200 and style 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style1', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CHARACTER_WEIGHT_200_STYLE_0200
     * @tc.desc   Test for matching font typeface with weight 200 and style 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight200Style2', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(30);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_3100
     * @tc.desc   Test for matching font typeface with weight 300 and style 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style0', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(31);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_2900
     * @tc.desc   Test for matching font typeface with weight 300 and style 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style1', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(32);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MGR_MATCH_FAMILY_STYLE_CHARACTER_3000
     * @tc.desc   Test for matching font typeface with weight 300 and style 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingFontMgrMatchFamilyStyleCharacterWeight300Style2', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingFontMgrMatchFamilyStyleCharacter(33);
      expect(result).assertEqual(0);
    })

  })
}

