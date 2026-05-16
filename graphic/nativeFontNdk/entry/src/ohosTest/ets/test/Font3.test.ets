/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import nativeFontNdk from 'libnativeFontNdk.so';

export default function Font3Test() {
  describe('Font3Test', () => {


    /**
     * @tc.name   testOHDrawingGetFontFullDescriptorAttributeArray0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeArray_0100
     * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeArray0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontFullDescriptorAttributeArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontFullDescriptorAttributeArray0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontFullDescriptorAttributeArray0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeArray_0200
     * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeArray0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontFullDescriptorAttributeArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontFullDescriptorAttributeArray0200();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationAxisAttributeStr0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeStr_0100
     * @tc.desc   test OHDrawingGetFontVariationAxisAttributeStr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationAxisAttributeStr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationAxisAttributeStr0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationAxisAttributeStr0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeStr_0200
     * @tc.desc   test OHDrawingGetFontVariationAxisAttributeStr0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationAxisAttributeStr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationAxisAttributeStr0200();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationInstanceByIndex0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationInstanceByIndex_0100
     * @tc.desc   test OHDrawingGetFontVariationInstanceByIndex0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationInstanceByIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationInstanceByIndex0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingDestroyFontVariationInstance0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingDestroyFontVariationInstance_0100
     * @tc.desc   test OHDrawingDestroyFontVariationInstance0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingDestroyFontVariationInstance0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingDestroyFontVariationInstance0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationInstanceAttributeStr0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationInstanceAttributeStr_0100
     * @tc.desc   test OHDrawingGetFontVariationInstanceAttributeStr0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationInstanceAttributeStr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationInstanceAttributeStr0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationInstanceCoordinate0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationInstanceCoordinate_0100
     * @tc.desc   test OHDrawingGetFontVariationInstanceCoordinate0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationInstanceCoordinate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationInstanceCoordinate0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontFullDescriptorByFullName0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_testOHDrawingGetFontFullDescriptorByFullName_0100
     * @tc.desc   test OHDrawingGetFontFullDescriptorByFullName0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontFullDescriptorByFullName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationInstanceCoordinate0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationAxisAttributeDouble0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeDouble_0100
     * @tc.desc   test OHDrawingGetFontVariationAxisAttributeDouble0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationAxisAttributeDouble0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationAxisAttributeDouble0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingGetFontVariationAxisAttributeInt0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontVariationAxisAttributeInt_0100
     * @tc.desc   test OHDrawingGetFontVariationAxisAttributeInt0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontVariationAxisAttributeInt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingGetFontVariationAxisAttributeInt0100();
        expect(result).assertEqual(0);
        done();
      });


    /**
     * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer0900
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_0900
     * @tc.desc   test OHDrawingTypographyLayoutWithConstraintsWithBuffer0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyLayoutWithConstraintsWithBuffer0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTypographyLayoutWithConstraintsWithBuffer0900();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTypographyLayoutWithConstraintsWithBuffer1000
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyLayoutWithConstraintsWithBuffer_1000
     * @tc.desc   test OHDrawingTypographyLayoutWithConstraintsWithBuffer1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyLayoutWithConstraintsWithBuffer1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTypographyLayoutWithConstraintsWithBuffer1000();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextStyleAddFontVariationWithNormalization_0100
     * @tc.desc   test OHDrawingTextStyleAddFontVariationWithNormalization0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleAddFontVariationWithNormalization0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTextStyleAddFontVariationWithNormalization0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextStyleAddFontVariationWithNormalization_0200
     * @tc.desc   test OHDrawingTextStyleAddFontVariationWithNormalization0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleAddFontVariationWithNormalization0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTextStyleAddFontVariationWithNormalization0200();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0300
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextStyleAddFontVariationWithNormalization_0300
     * @tc.desc   test OHDrawingTextStyleAddFontVariationWithNormalization0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleAddFontVariationWithNormalization0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTextStyleAddFontVariationWithNormalization0300();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTextStyleAddFontVariationWithNormalization0400
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextStyleAddFontVariationWithNormalization_0400
     * @tc.desc   test OHDrawingTextStyleAddFontVariationWithNormalization0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleAddFontVariationWithNormalization0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTextStyleAddFontVariationWithNormalization0400();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer_0100
     * @tc.desc   test OHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer_0100
     * @tc.desc   test OHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer_0100
     * @tc.desc   test OHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHEllipsisModalMultilineHead0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHEllipsisModalMultilineHead_0100
     * @tc.desc   test OHEllipsisModalMultilineHead0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEllipsisModalMultilineHead0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohEllipsisModalMultilineHead0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHTextStyleAttriFontEdging0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHTextStyleAttriFontEdging_0100
     * @tc.desc   test OHTextStyleAttriFontEdging0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTextStyleAttriFontEdging0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohTextStyleAttriFontEdging0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingReleaseRangeBuffer0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingReleaseRangeBuffer_0100
     * @tc.desc   test OHDrawingReleaseRangeBuffer0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingReleaseRangeBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingReleaseRangeBuffer0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingFontFullDescriptorAttributeId0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingFontFullDescriptorAttributeId_0100
     * @tc.desc   test OHDrawingFontFullDescriptorAttributeId0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontFullDescriptorAttributeId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingFontFullDescriptorAttributeId0100();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingFontFullDescriptorAttributeId0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingFontFullDescriptorAttributeId_0200
     * @tc.desc   test OHDrawingFontFullDescriptorAttributeId0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingFontFullDescriptorAttributeId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeFontNdk.ohDrawingFontFullDescriptorAttributeId0200();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0100
     * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeDoubleArray0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeDoubleArray0100();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0100
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0100();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0200
     * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with nullptr style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeDoubleArray0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeDoubleArray0200();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0200
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0200
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0200();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0300
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0300
     * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with invalid attribute id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingSetTypographyStyleAttributeDoubleArray0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeDoubleArray0300();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0300
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0300
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with invalid attribute id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0300();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0400
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0400
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with line tail indent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0400();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleArray0500
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleArray_0500
     * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDoubleArray with unsupported attribute id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHDrawingSetTypographyStyleAttributeDoubleArray0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeDoubleArray0500();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0600
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0600
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray without prior set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0600();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0700
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0700
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr arrayValue out param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0700();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0800
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0800
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with nullptr arrayLength out param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0800();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeDoubleArray0900
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDoubleArray_0900
     * @tc.desc   test OH_Drawing_GetTypographyStyleAttributeDoubleArray with both out params nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeDoubleArray0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeDoubleArray0900();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent_0100
     * @tc.desc   test OH_Drawing_SetTypographyStyleAttributeDouble with FIRST_LINE_HEAD_INDENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100();
      expect(result).assertEqual(0);
      done();
    });
  })
}
