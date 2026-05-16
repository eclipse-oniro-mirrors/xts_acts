/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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

export default function fontTest() {
  describe('FontTest', () => {
    // cpp1中的用例
    /**
     * @tc.name   testOHDrawingMatchFontDescriptors001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_001
     * @tc.desc   test OH_Drawing_MatchFontDescriptors_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingMatchFontDescriptors001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingMatchFontDescriptors002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_002
     * @tc.desc   test OH_Drawing_MatchFontDescriptors_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingMatchFontDescriptors002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingMatchFontDescriptors003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_003
     * @tc.desc   test OH_Drawing_MatchFontDescriptors_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingMatchFontDescriptors003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingMatchFontDescriptors004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_004
     * @tc.desc   test OH_Drawing_MatchFontDescriptors_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingMatchFontDescriptors004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingMatchFontDescriptors004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingMatchFontDescriptors005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_005
     * @tc.desc   test OH_Drawing_MatchFontDescriptors_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingMatchFontDescriptors005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors005();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontDescriptorByFullName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_001
     * @tc.desc   test OH_Drawing_GetFontDescriptorByFullName_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontDescriptorByFullName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontDescriptorByFullName002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_002
     * @tc.desc   test OH_Drawing_GetFontDescriptorByFullName_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontDescriptorByFullName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontDescriptorByFullName003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_003
     * @tc.desc   test OH_Drawing_GetFontDescriptorByFullName_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontDescriptorByFullName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetFontDescriptorByFullName003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontDescriptorByFullName004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_004
     * @tc.desc   test OH_Drawing_GetFontDescriptorByFullName_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontDescriptorByFullName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetFontDescriptorByFullName004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetSystemFontFullNamesByType001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_001
     * @tc.desc   test OH_Drawing_GetSystemFontFullNamesByType_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetSystemFontFullNamesByType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetSystemFontFullNamesByType002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_002
     * @tc.desc   test OH_Drawing_GetSystemFontFullNamesByType_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetSystemFontFullNamesByType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetSystemFontFullNamesByType003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_003
     * @tc.desc   test OH_Drawing_GetSystemFontFullNamesByType_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetSystemFontFullNamesByType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetSystemFontFullNamesByType004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_004
     * @tc.desc   test OH_Drawing_GetSystemFontFullNamesByType_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetSystemFontFullNamesByType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetSystemFontFullNameByIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.desc   test OH_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetSystemFontFullNameByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNameByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingCreateLineTypography001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_001
     * @tc.desc   test OH_Drawing_CreateLineTypography_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingCreateLineTypography001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingCreateLineTypography002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_002
     * @tc.desc   test OH_Drawing_CreateLineTypography_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingCreateLineTypography002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingCreateLineTypography003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_003
     * @tc.desc   test OH_Drawing_CreateLineTypography_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingCreateLineTypography003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingCreateLineTypography003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingCreateLineTypography004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_004
     * @tc.desc   test OH_Drawing_CreateLineTypography_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingCreateLineTypography004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyGetLineBreak001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_001
     * @tc.desc   test OH_Drawing_LineTypographyGetLineBreak_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyGetLineBreak001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyGetLineBreak001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyGetLineBreak002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_002
     * @tc.desc   test OH_Drawing_LineTypographyGetLineBreak_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyGetLineBreak002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyGetLineBreak003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_003
     * @tc.desc   test OH_Drawing_LineTypographyGetLineBreak_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyGetLineBreak003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyGetLineBreak004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_004
     * @tc.desc   test OH_Drawing_LineTypographyGetLineBreak_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyGetLineBreak004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyGetLineBreak005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_005
     * @tc.desc   test OH_Drawing_LineTypographyGetLineBreak_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyGetLineBreak005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak005();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_001
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyCreateLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_002
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_003
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_004
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_005
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine005();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingLineTypographyCreateLine006
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_006
     * @tc.desc   test OH_Drawing_LineTypographyCreateLine_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingLineTypographyCreateLine006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine006();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetBounds001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_001
     * @tc.desc   test OH_Drawing_FontGetBounds_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetBounds001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetBounds002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_002
     * @tc.desc   test OH_Drawing_FontGetBounds_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetBounds002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetBounds002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetBounds003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_003
     * @tc.desc   test OH_Drawing_FontGetBounds_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetBounds003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetBounds003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingRectDestroyArray001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectDestroyArray_001
     * @tc.desc   test OH_Drawing_RectDestroyArray_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingRectDestroyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectDestroyArray001();
      expect(result).assertEqual(0);
      done();
    });

    // cpp2中的用例
    /**
     * @tc.name   testOHDrawingFontGetPathForGlyph001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_001
     * @tc.desc   test OH_Drawing_FontGetPathForGlyph_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetPathForGlyph001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetPathForGlyph001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetPathForGlyph002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_002
     * @tc.desc   test OH_Drawing_FontGetPathForGlyph_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetPathForGlyph002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetPathForGlyph002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetPathForGlyph003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_003
     * @tc.desc   test OH_Drawing_FontGetPathForGlyph_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetPathForGlyph003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetPathForGlyph003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetPathForGlyph004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_004
     * @tc.desc   test OH_Drawing_FontGetPathForGlyph_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetPathForGlyph004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetPathForGlyph004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingRectGetArraySize001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArraySize_001
     * @tc.desc   test OH_Drawing_RectGetArraySize_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingRectGetArraySize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingRectGetArraySize001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingRectGetArraySize002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArraySize_002
     * @tc.desc   test OH_Drawing_RectGetArraySize_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingRectGetArraySize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingRectGetArraySize002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingRectGetArrayElement001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArrayElement_001
     * @tc.desc   test OH_Drawing_RectGetArrayElement_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingRectGetArrayElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectGetArrayElement001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingCreateTextTab001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateTextTab_001
     * @tc.desc   test OH_Drawing_CreateTextTab_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingCreateTextTab001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateTextTab001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTextTabAlignment001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabAlignment_001
     * @tc.desc   test OH_Drawing_GetTextTabAlignment_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTextTabAlignment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabAlignment001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTextTabLocation001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabLocation_001
     * @tc.desc   test OH_Drawing_GetTextTabLocation_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTextTabLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabLocation001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingFontGetTextPath001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetTextPath_001
     * @tc.desc   test OH_Drawing_FontGetTextPath_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingFontGetTextPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingFontGetTextPath001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetDrawingArraySize001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetDrawingArraySize_001
     * @tc.desc   test OH_Drawing_GetDrawingArraySize_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetDrawingArraySize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetDrawingArraySize001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetTextLines001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_001
     * @tc.desc   test OH_Drawing_TypographyGetTextLines_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetTextLines001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetTextLines002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_002
     * @tc.desc   test OH_Drawing_TypographyGetTextLines_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetTextLines002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingDestroyTextLine001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyTextLine_001
     * @tc.desc   test OH_Drawing_DestroyTextLine_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingDestroyTextLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyTextLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetTextLineByIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextLineByIndex_001
     * @tc.desc   test OH_Drawing_GetTextLineByIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTextLineByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextLineByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetTextRange001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTextRange_001
     * @tc.desc   test OH_Drawing_TextLineGetTextRange_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetTextRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTextRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetGlyphRuns001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetGlyphRuns_001
     * @tc.desc   test OH_Drawing_TextLineGetGlyphRuns_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetGlyphRuns001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetGlyphRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingDestroyRuns001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyRuns_001
     * @tc.desc   test OH_Drawing_DestroyRuns_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingDestroyRuns001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunByIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunByIndex_001
     * @tc.desc   test OH_Drawing_GetRunByIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLinePaint001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLinePaint_001
     * @tc.desc   test OH_Drawing_TextLinePaint_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLinePaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLinePaint001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineCreateTruncatedLine001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineCreateTruncatedLine_001
     * @tc.desc   test OH_Drawing_TextLineCreateTruncatedLine_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineCreateTruncatedLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineCreateTruncatedLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetTypographicBounds001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTypographicBounds_001
     * @tc.desc   test OH_Drawing_TextLineGetTypographicBounds_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetTypographicBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetImageBounds001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetImageBounds_001
     * @tc.desc   test OH_Drawing_TextLineGetImageBounds_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetImageBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetTrailingSpaceWidth001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.desc   test OH_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetTrailingSpaceWidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTrailingSpaceWidth001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetStringIndexForPosition001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.desc   test OH_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetStringIndexForPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetStringIndexForPosition001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetOffsetForStringIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.desc   test OH_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetOffsetForStringIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetOffsetForStringIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextLineGetAlignmentOffset001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetAlignmentOffset_001
     * @tc.desc   test OH_Drawing_TextLineGetAlignmentOffset_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextLineGetAlignmentOffset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetAlignmentOffset001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunGlyphCount001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphCount_001
     * @tc.desc   test OH_Drawing_GetRunGlyphCount_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunGlyphCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphCount001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunStringRange001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringRange_001
     * @tc.desc   test OH_Drawing_GetRunStringRange_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunStringRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunTypographicBounds001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunTypographicBounds_001
     * @tc.desc   test OH_Drawing_GetRunTypographicBounds_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunTypographicBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunStringIndicesByIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringIndicesByIndex_001
     * @tc.desc   test OH_Drawing_GetRunStringIndicesByIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunStringIndicesByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringIndicesByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunImageBounds001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunImageBounds_001
     * @tc.desc   test OH_Drawing_GetRunImageBounds_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunImageBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunGlyphsByIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphsByIndex_001
     * @tc.desc   test OH_Drawing_GetRunGlyphsByIndex_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunGlyphsByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphsByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRunPositions001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunPositions_001
     * @tc.desc   test OH_Drawing_GetRunPositions_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRunPositions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunPositions001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontCollectionGlobalInstance001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.desc   test OH_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontCollectionGlobalInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontCollectionGlobalInstance001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleBadgeType001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_SetTextStyleBadgeType_001
     * @tc.desc   test OHDrawingSetTextStyleBadgeType001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleBadgeType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingSetTextStyleBadgeType001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleBadgeType002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_SetTextStyleBadgeType_002
     * @tc.desc   test OHDrawingSetTextStyleBadgeType002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleBadgeType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingSetTextStyleBadgeType002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_001
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_002
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_003
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_004
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_005
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText005();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText006
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_006
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText006();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText007
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_007
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText007();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText008
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_008
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText008();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyHandlerAddEncodedText009
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_009
     * @tc.desc   test OHDrawingTypographyHandlerAddEncodedText009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText009();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetRun001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRun_001
     * @tc.desc   test OHDrawingGetRun001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetRun001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetRun001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble001
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeDouble001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeInt001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeInt001
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeInt001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeInt001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeDouble001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeDouble001
     * @tc.desc   test OHDrawingSetTextStyleAttributeDouble001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeDouble001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeDouble002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeDouble002
     * @tc.desc   test OHDrawingSetTextStyleAttributeDouble002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeDouble002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeDouble003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeDouble003
     * @tc.desc   test OHDrawingSetTextStyleAttributeDouble003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeDouble003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeDouble004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeDouble004
     * @tc.desc   test OHDrawingSetTextStyleAttributeDouble004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeDouble004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeInt001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeInt001
     * @tc.desc   test OHDrawingSetTextStyleAttributeInt001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeInt001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingGetFontFullDescriptorsFromPath001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorsFromPath001
     * @tc.desc   test OHDrawingGetFontFullDescriptorsFromPath001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontFullDescriptorsFromPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorsFromPath001();
      expect(result).assertEqual(0);
      done();
    });

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorsFromPath002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorsFromPath002
      * @tc.desc   test OHDrawingGetFontFullDescriptorsFromPath002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorsFromPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorsFromPath002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorsFromPath003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorsFromPath003
      * @tc.desc   test OHDrawingGetFontFullDescriptorsFromPath003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorsFromPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorsFromPath003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorAttributeString001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeString001
      * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeString001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorAttributeString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorAttributeString001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorAttributeString002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeString002
      * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeString002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorAttributeString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorAttributeString002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorAttributeString003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeString003
      * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeString003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorAttributeString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorAttributeString003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorByIndex001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorByIndex001
      * @tc.desc   test OHDrawingGetFontFullDescriptorByIndex001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorByIndex001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorAttributeInt001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeInt001
      * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeInt001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorAttributeInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorAttributeInt001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorAttributeInt002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorAttributeInt002
      * @tc.desc   test OHDrawingGetFontFullDescriptorAttributeInt002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorAttributeInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorAttributeInt002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorFromStream001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorFromStream001
      * @tc.desc   test OHDrawingGetFontFullDescriptorFromStream001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorFromStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorFromStream001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorFromStream002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorFromStream002
      * @tc.desc   test OHDrawingGetFontFullDescriptorFromStream002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorFromStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorFromStream002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetFontFullDescriptorFromStream003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontFullDescriptorFromStream003
      * @tc.desc   test OHDrawingGetFontFullDescriptorFromStream003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetFontFullDescriptorFromStream003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetFontFullDescriptorFromStream003();
            expect(result).assertEqual(0);
            done();
        }
    );

    // cpp3中的用例
    /**
      * @tc.name   testOHDrawingTypographyIsEllipsized001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsEllipsized001
      * @tc.desc   Test OHDrawingTypographyIsEllipsized001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsEllipsized001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsEllipsized001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyIsEllipsized002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsEllipsized002
      * @tc.desc   Test OHDrawingTypographyIsEllipsized002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsEllipsized002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsEllipsized002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyIsEllipsized003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsEllipsized003
      * @tc.desc   Test OHDrawingTypographyIsEllipsized003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsEllipsized003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsEllipsized003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyIsLineUnlimited001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsLineUnlimited001
      * @tc.desc   Test OHDrawingTypographyIsLineUnlimited001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsLineUnlimited001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsLineUnlimited001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyIsLineUnlimited002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsLineUnlimited002
      * @tc.desc   Test OHDrawingTypographyIsLineUnlimited002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsLineUnlimited002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsLineUnlimited002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyIsLineUnlimited003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyIsLineUnlimited003
      * @tc.desc   Test OHDrawingTypographyIsLineUnlimited003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyIsLineUnlimited003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyIsLineUnlimited003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingFontParserGetFontByName001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingFontParserGetFontByName001
      * @tc.desc   Test OHDrawingFontParserGetFontByName001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingFontParserGetFontByName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingFontParserGetFontByName001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingCreateFontDescriptor001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingCreateFontDescriptor001
      * @tc.desc   Test OHDrawingCreateFontDescriptor001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingCreateFontDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingCreateFontDescriptor001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyGetLineTextRange001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetLineTextRange001
      * @tc.desc   Test OHDrawingTypographyGetLineTextRange001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyGetLineTextRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyGetLineTextRange001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyGetLineTextRange002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetLineTextRange002
      * @tc.desc   Test OHDrawingTypographyGetLineTextRange002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyGetLineTextRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyGetLineTextRange002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyGetLineTextRange003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetLineTextRange003
      * @tc.desc   Test OHDrawingTypographyGetLineTextRange003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyGetLineTextRange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyGetLineTextRange003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTextVerticalAlignment001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextVerticalAlignment001
      * @tc.desc   Test OHDrawingTextVerticalAlignment001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTextVerticalAlignment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTextVerticalAlignment001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTextVerticalAlignment002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTextVerticalAlignment002
      * @tc.desc   Test OHDrawingTextVerticalAlignment002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTextVerticalAlignment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTextVerticalAlignment002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeInt002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeInt002
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeInt002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeInt002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble002
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble003
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTextStyleAttributeInt001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTextStyleAttributeInt001
      * @tc.desc   Test OHDrawingGetTextStyleAttributeInt001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTextStyleAttributeInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTextStyleAttributeInt001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetRunGlyphAdvanceByIndex001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetRunGlyphAdvanceByIndex001
      * @tc.desc   Test OHDrawingGetRunGlyphAdvanceByIndex001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetRunGlyphAdvanceByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetRunGlyphAdvanceByIndex001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingLineTypographyCreateLine007
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingLineTypographyCreateLine007
      * @tc.desc   Test OHDrawingLineTypographyCreateLine007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingLineTypographyCreateLine007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingLineTypographyCreateLine007();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingUnregisterFont001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingUnregisterFont001
      * @tc.desc   Test OHDrawingUnregisterFont001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingUnregisterFont001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingUnregisterFont001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingFontStyleSetGetStyle001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingFontStyleSetGetStyle001
      * @tc.desc   Test OHDrawingFontStyleSetGetStyle001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingFontStyleSetGetStyle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingFontStyleSetGetStyle001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyStyleIsHintEnabled001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyStyleIsHintEnabled001
      * @tc.desc   Test OHDrawingTypographyStyleIsHintEnabled001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyStyleIsHintEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyStyleIsHintEnabled001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyStyleIsHintEnabled002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyStyleIsHintEnabled002
      * @tc.desc   Test OHDrawingTypographyStyleIsHintEnabled002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyStyleIsHintEnabled002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyStyleIsHintEnabled002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetSystemFontConfigInfo001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetSystemFontConfigInfo001
      * @tc.desc   Test OHDrawingGetSystemFontConfigInfo001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetSystemFontConfigInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetSystemFontConfigInfo001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble007
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble007
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble007
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble007();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeInt005
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeInt005
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeInt005
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeInt005();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTextStyleAttributeInt002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeInt002
      * @tc.desc   Test OHDrawingSetTextStyleAttributeInt002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTextStyleAttributeInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeInt002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTextStyleAttributeInt003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeInt003
      * @tc.desc   Test OHDrawingSetTextStyleAttributeInt003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTextStyleAttributeInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeInt003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTextStyleAttributeInt002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTextStyleAttributeInt002
      * @tc.desc   Test OHDrawingGetTextStyleAttributeInt002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTextStyleAttributeInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTextStyleAttributeInt002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble004
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble004
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble004
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble004();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble005
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble005
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble005
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble005();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeDouble006
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeDouble006
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeDouble006
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeDouble006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeDouble006();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTypographyStyleAttributeDouble001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeDouble001
      * @tc.desc   Test OHDrawingGetTypographyStyleAttributeDouble001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTypographyStyleAttributeDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTypographyStyleAttributeDouble001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTypographyStyleAttributeInt001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeInt001
      * @tc.desc   Test OHDrawingGetTypographyStyleAttributeInt001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTypographyStyleAttributeInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTypographyStyleAttributeInt001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeInt003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeInt003
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeInt003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeInt003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingSetTypographyStyleAttributeInt004
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeInt004
      * @tc.desc   Test OHDrawingSetTypographyStyleAttributeInt004
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingSetTypographyStyleAttributeInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingSetTypographyStyleAttributeInt004();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTextStyleAttributeDouble001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTextStyleAttributeDouble001
      * @tc.desc   Test OHDrawingGetTextStyleAttributeDouble001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTextStyleAttributeDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTextStyleAttributeDouble001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTypographyStyleAttributeInt002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeInt002
      * @tc.desc   Test OHDrawingGetTypographyStyleAttributeInt002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTypographyStyleAttributeInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTypographyStyleAttributeInt002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTypographyStyleAttributeInt003
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeInt003
      * @tc.desc   Test OHDrawingGetTypographyStyleAttributeInt003
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTypographyStyleAttributeInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTypographyStyleAttributeInt003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyStyleGetStrutStyle001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyStyleGetStrutStyle001
      * @tc.desc   Test OHDrawingTypographyStyleGetStrutStyle001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyStyleGetStrutStyle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyStyleGetStrutStyle001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyTextlineStyleGetFontWeight001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyTextlineStyleGetFontWeight001
      * @tc.desc   Test OHDrawingTypographyTextlineStyleGetFontWeight001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyTextlineStyleGetFontWeight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyTextlineStyleGetFontWeight001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyTextlineStyleGetFontStyle001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyTextlineStyleGetFontStyle001
      * @tc.desc   Test OHDrawingTypographyTextlineStyleGetFontStyle001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyTextlineStyleGetFontStyle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyTextlineStyleGetFontStyle001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingTypographyGetTextAlign001
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyGetTextAlign001
      * @tc.desc   Test OHDrawingTypographyGetTextAlign001
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingTypographyGetTextAlign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingTypographyGetTextAlign001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
      * @tc.name   testOHDrawingGetTextTabAlignment002
      * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTextTabAlignment002
      * @tc.desc   Test OHDrawingGetTextTabAlignment002
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testOHDrawingGetTextTabAlignment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.oHDrawingGetTextTabAlignment002();
            expect(result).assertEqual(0);
            done();
        }
    );
        
    // cpp4中的用例
    /**
     * @tc.name   testOHDrawingTextStyleGetFontMetrics001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontMetrics001
     * @tc.desc   test OHDrawingTextStyleGetFontMetrics001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontMetrics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontMetrics001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontMetrics002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontMetrics002
     * @tc.desc   test OHDrawingTextStyleGetFontMetrics002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontMetrics002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontMetrics002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontMetrics003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontMetrics003
     * @tc.desc   test OHDrawingTextStyleGetFontMetrics003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontMetrics003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontMetrics003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontMetrics004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontMetrics004
     * @tc.desc   test OHDrawingTextStyleGetFontMetrics004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontMetrics004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontMetrics004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontMetrics005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontMetrics005
     * @tc.desc   test OHDrawingTextStyleGetFontMetrics005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontMetrics005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontMetrics005();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineInfo001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineInfo001
     * @tc.desc   test OHDrawingTypographyGetLineInfo001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineInfo001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineInfo002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineInfo002
     * @tc.desc   test OHDrawingTypographyGetLineInfo002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineInfo002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineInfo003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineInfo003
     * @tc.desc   test OHDrawingTypographyGetLineInfo003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineInfo003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineInfo004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineInfo004
     * @tc.desc   test OHDrawingTypographyGetLineInfo004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineInfo004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineInfo005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineInfo005
     * @tc.desc   test OHDrawingTypographyGetLineInfo005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineInfo005();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetShadowWithIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetShadowWithIndex001
     * @tc.desc   test OHDrawingTextStyleGetShadowWithIndex001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetShadowWithIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetShadowWithIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetShadowWithIndex002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetShadowWithIndex002
     * @tc.desc   test OHDrawingTextStyleGetShadowWithIndex002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetShadowWithIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetShadowWithIndex002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetShadowWithIndex003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetShadowWithIndex003
     * @tc.desc   test OHDrawingTextStyleGetShadowWithIndex003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetShadowWithIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetShadowWithIndex003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetShadowWithIndex004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetShadowWithIndex004
     * @tc.desc   test OHDrawingTextStyleGetShadowWithIndex004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetShadowWithIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetShadowWithIndex004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyTextGetHeightBehavior001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyTextGetHeightBehavior001
     * @tc.desc   test OHDrawingTypographyTextGetHeightBehavior001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyTextGetHeightBehavior001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyTextGetHeightBehavior001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyTextGetHeightBehavior002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyTextGetHeightBehavior002
     * @tc.desc   test OHDrawingTypographyTextGetHeightBehavior002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyTextGetHeightBehavior002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyTextGetHeightBehavior002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetDecorationStyle001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetDecorationStyle001
     * @tc.desc   test OHDrawingTextStyleGetDecorationStyle001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetDecorationStyle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetDecorationStyle001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetDecorationStyle002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetDecorationStyle002
     * @tc.desc   test OHDrawingTextStyleGetDecorationStyle002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetDecorationStyle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetDecorationStyle002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontWeight001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontWeight001
     * @tc.desc   test OHDrawingTextStyleGetFontWeight001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontWeight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontWeight001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontWeight002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontWeight002
     * @tc.desc   test OHDrawingTextStyleGetFontWeight002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontWeight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontWeight002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontStyle001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontStyle001
     * @tc.desc   test OHDrawingTextStyleGetFontStyle001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontStyle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontStyle001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetFontStyle002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetFontStyle002
     * @tc.desc   test OHDrawingTextStyleGetFontStyle002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetFontStyle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetFontStyle002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetBaseline001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetBaseline001
     * @tc.desc   test OHDrawingTextStyleGetBaseline001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetBaseline001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetBaseline002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetBaseline002
     * @tc.desc   test OHDrawingTextStyleGetBaseline002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetBaseline002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetHalfLeading001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetHalfLeading001
     * @tc.desc   test OHDrawingTextStyleGetHalfLeading001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetHalfLeading001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetHalfLeading001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleGetHalfLeading002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleGetHalfLeading002
     * @tc.desc   test OHDrawingTextStyleGetHalfLeading002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleGetHalfLeading002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleGetHalfLeading002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleIsPlaceholder001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleIsPlaceholder001
     * @tc.desc   test OHDrawingTextStyleIsPlaceholder001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleIsPlaceholder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleIsPlaceholder001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTextStyleIsPlaceholder002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTextStyleIsPlaceholder002
     * @tc.desc   test OHDrawingTextStyleIsPlaceholder002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTextStyleIsPlaceholder002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextStyleIsPlaceholder002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyStyleGetEffectiveAlignment001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyStyleGetEffectiveAlignment001
     * @tc.desc   test OHDrawingTypographyStyleGetEffectiveAlignment001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyStyleGetEffectiveAlignment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyStyleGetEffectiveAlignment001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyStyleGetEffectiveAlignment002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyStyleGetEffectiveAlignment002
     * @tc.desc   test OHDrawingTypographyStyleGetEffectiveAlignment002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyStyleGetEffectiveAlignment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyStyleGetEffectiveAlignment002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyDidExceedMaxLines001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyDidExceedMaxLines001
     * @tc.desc   test OHDrawingTypographyDidExceedMaxLines001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyDidExceedMaxLines001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyDidExceedMaxLines001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyDidExceedMaxLines002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyDidExceedMaxLines002
     * @tc.desc   test OHDrawingTypographyDidExceedMaxLines002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyDidExceedMaxLines002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyDidExceedMaxLines002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyDidExceedMaxLines003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyDidExceedMaxLines003
     * @tc.desc   test OHDrawingTypographyDidExceedMaxLines003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyDidExceedMaxLines003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyDidExceedMaxLines003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetRectsForRange001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetRectsForRange001
     * @tc.desc   test OHDrawingTypographyGetRectsForRange001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetRectsForRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetRectsForRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetGlyphPositionAtCoordinate001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetGlyphPositionAtCoordinate001
     * @tc.desc   test OHDrawingTypographyGetGlyphPositionAtCoordinate001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetGlyphPositionAtCoordinate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetGlyphPositionAtCoordinate001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetGlyphPositionAtCoordinate002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetGlyphPositionAtCoordinate002
     * @tc.desc   test OHDrawingTypographyGetGlyphPositionAtCoordinate002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetGlyphPositionAtCoordinate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetGlyphPositionAtCoordinate002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001
     * @tc.desc   test OHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetWordBoundary001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetWordBoundary001
     * @tc.desc   test OHDrawingTypographyGetWordBoundary001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetWordBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetWordBoundary001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineMetricsAt001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineMetricsAt001
     * @tc.desc   test OHDrawingTypographyGetLineMetricsAt001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineMetricsAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineMetricsAt001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineMetricsAt002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineMetricsAt002
     * @tc.desc   test OHDrawingTypographyGetLineMetricsAt002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineMetricsAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineMetricsAt002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineMetricsAt003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineMetricsAt003
     * @tc.desc   test OHDrawingTypographyGetLineMetricsAt003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineMetricsAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineMetricsAt003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyGetLineMetricsAt004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_FONT_OHDrawingTypographyGetLineMetricsAt004
     * @tc.desc   test OHDrawingTypographyGetLineMetricsAt004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyGetLineMetricsAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetLineMetricsAt004();
      expect(result).assertEqual(0);
      done();
    });

  })
}