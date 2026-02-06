/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_001
     * @tc.name       : testOHDrawingMatchFontDescriptors001
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingMatchFontDescriptors001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_002
     * @tc.name       : testOHDrawingMatchFontDescriptors002
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingMatchFontDescriptors002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_003
     * @tc.name       : testOHDrawingMatchFontDescriptors003
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingMatchFontDescriptors003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_004
     * @tc.name       : testOHDrawingMatchFontDescriptors004
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingMatchFontDescriptors004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingMatchFontDescriptors004();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_005
     * @tc.name       : testOHDrawingMatchFontDescriptors005
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingMatchFontDescriptors005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors005();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_001
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName001
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetFontDescriptorByFullName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_002
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName002
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetFontDescriptorByFullName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_003
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName003
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_004
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName004
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_001
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetSystemFontFullNamesByType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_002
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType002
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_003
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType003
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetSystemFontFullNamesByType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_004
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType004
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetSystemFontFullNamesByType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.name       : testOHDrawingGetSystemFontFullNameByIndex001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetSystemFontFullNameByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNameByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_001
     * @tc.name       : testOHDrawingCreateLineTypography001
     * @tc.desc       : test OH_Drawing_CreateLineTypography_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingCreateLineTypography001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_002
     * @tc.name       : testOHDrawingCreateLineTypography002
     * @tc.desc       : test OH_Drawing_CreateLineTypography_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingCreateLineTypography002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_003
     * @tc.name       : testOHDrawingCreateLineTypography003
     * @tc.desc       : test OH_Drawing_CreateLineTypography_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingCreateLineTypography003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingCreateLineTypography003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_004
     * @tc.name       : testOHDrawingCreateLineTypography004
     * @tc.desc       : test OH_Drawing_CreateLineTypography_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingCreateLineTypography004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_001
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak001
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyGetLineBreak001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyGetLineBreak001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_002
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak002
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyGetLineBreak002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_003
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak003
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyGetLineBreak003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyGetLineBreak003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_004
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak004
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_005
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak005
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_001
     * @tc.name       : testOHDrawingLineTypographyCreateLine001
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyCreateLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyCreateLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_002
     * @tc.name       : testOHDrawingLineTypographyCreateLine002
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyCreateLine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_003
     * @tc.name       : testOHDrawingLineTypographyCreateLine003
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyCreateLine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_004
     * @tc.name       : testOHDrawingLineTypographyCreateLine004
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_005
     * @tc.name       : testOHDrawingLineTypographyCreateLine005
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_006
     * @tc.name       : testOHDrawingLineTypographyCreateLine006
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingLineTypographyCreateLine006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingLineTypographyCreateLine006();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_001
     * @tc.name       : testOHDrawingFontGetBounds001
     * @tc.desc       : test OH_Drawing_FontGetBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_002
     * @tc.name       : testOHDrawingFontGetBounds002
     * @tc.desc       : test OH_Drawing_FontGetBounds_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_003
     * @tc.name       : testOHDrawingFontGetBounds003
     * @tc.desc       : test OH_Drawing_FontGetBounds_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectDestroyArray_001
     * @tc.name       : testOHDrawingRectDestroyArray001
     * @tc.desc       : test OH_Drawing_RectDestroyArray_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingRectDestroyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectDestroyArray001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_001
     * @tc.name       : testOHDrawingFontGetPathForGlyph001
     * @tc.desc       : test OH_Drawing_FontGetPathForGlyph_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingFontGetPathForGlyph001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingFontGetPathForGlyph001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_002
     * @tc.name       : testOHDrawingFontGetPathForGlyph002
     * @tc.desc       : test OH_Drawing_FontGetPathForGlyph_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_003
     * @tc.name       : testOHDrawingFontGetPathForGlyph003
     * @tc.desc       : test OH_Drawing_FontGetPathForGlyph_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_004
     * @tc.name       : testOHDrawingFontGetPathForGlyph004
     * @tc.desc       : test OH_Drawing_FontGetPathForGlyph_004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArraySize_001
     * @tc.name       : testOHDrawingRectGetArraySize001
     * @tc.desc       : test OH_Drawing_RectGetArraySize_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingRectGetArraySize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingRectGetArraySize001();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArraySize_002
     * @tc.name       : testOHDrawingRectGetArraySize002
     * @tc.desc       : test OH_Drawing_RectGetArraySize_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingRectGetArraySize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingRectGetArraySize002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArrayElement_001
     * @tc.name       : testOHDrawingRectGetArrayElement001
     * @tc.desc       : test OH_Drawing_RectGetArrayElement_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingRectGetArrayElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectGetArrayElement001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateTextTab_001
     * @tc.name       : testOHDrawingCreateTextTab001
     * @tc.desc       : test OH_Drawing_CreateTextTab_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingCreateTextTab001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateTextTab001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabAlignment_001
     * @tc.name       : testOHDrawingGetTextTabAlignment001
     * @tc.desc       : test OH_Drawing_GetTextTabAlignment_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetTextTabAlignment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabAlignment001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabLocation_001
     * @tc.name       : testOHDrawingGetTextTabLocation001
     * @tc.desc       : test OH_Drawing_GetTextTabLocation_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetTextTabLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabLocation001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetTextPath_001
     * @tc.name       : testOHDrawingFontGetTextPath001
     * @tc.desc       : test OH_Drawing_FontGetTextPath_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingFontGetTextPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingFontGetTextPath001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetDrawingArraySize_001
     * @tc.name       : testOHDrawingGetDrawingArraySize001
     * @tc.desc       : test OH_Drawing_GetDrawingArraySize_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetDrawingArraySize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetDrawingArraySize001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_001
     * @tc.name       : testOHDrawingTypographyGetTextLines001
     * @tc.desc       : test OH_Drawing_TypographyGetTextLines_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTypographyGetTextLines001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_002
     * @tc.name       : testOHDrawingTypographyGetTextLines002
     * @tc.desc       : test OH_Drawing_TypographyGetTextLines_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTypographyGetTextLines002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyTextLine_001
     * @tc.name       : testOHDrawingDestroyTextLine001
     * @tc.desc       : test OH_Drawing_DestroyTextLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingDestroyTextLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyTextLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextLineByIndex_001
     * @tc.name       : testOHDrawingGetTextLineByIndex001
     * @tc.desc       : test OH_Drawing_GetTextLineByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetTextLineByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextLineByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTextRange_001
     * @tc.name       : testOHDrawingTextLineGetTextRange001
     * @tc.desc       : test OH_Drawing_TextLineGetTextRange_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetTextRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTextRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetGlyphRuns_001
     * @tc.name       : testOHDrawingTextLineGetGlyphRuns001
     * @tc.desc       : test OH_Drawing_TextLineGetGlyphRuns_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetGlyphRuns001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetGlyphRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyRuns_001
     * @tc.name       : testOHDrawingDestroyRuns001
     * @tc.desc       : test OH_Drawing_DestroyRuns_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingDestroyRuns001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunByIndex_001
     * @tc.name       : testOHDrawingGetRunByIndex001
     * @tc.desc       : test OH_Drawing_GetRunByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLinePaint_001
     * @tc.name       : testOHDrawingGetRunByIndex001
     * @tc.desc       : test OH_Drawing_TextLinePaint_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLinePaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLinePaint001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineCreateTruncatedLine_001
     * @tc.name       : testOHDrawingTextLineCreateTruncatedLine001
     * @tc.desc       : test OH_Drawing_TextLineCreateTruncatedLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineCreateTruncatedLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineCreateTruncatedLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTypographicBounds_001
     * @tc.name       : testOHDrawingTextLineGetTypographicBounds001
     * @tc.desc       : test OH_Drawing_TextLineGetTypographicBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetTypographicBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetImageBounds_001
     * @tc.name       : testOHDrawingTextLineGetImageBounds001
     * @tc.desc       : test OH_Drawing_TextLineGetImageBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetImageBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.name       : testOHDrawingTextLineGetTrailingSpaceWidth001
     * @tc.desc       : test OH_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetTrailingSpaceWidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTrailingSpaceWidth001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.name       : testOHDrawingTextLineGetStringIndexForPosition001
     * @tc.desc       : test OH_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetStringIndexForPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetStringIndexForPosition001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.name       : testOHDrawingTextLineGetOffsetForStringIndex001
     * @tc.desc       : test OH_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetOffsetForStringIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetOffsetForStringIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetAlignmentOffset_001
     * @tc.name       : testOHDrawingTextLineGetAlignmentOffset001
     * @tc.desc       : test OH_Drawing_TextLineGetAlignmentOffset_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTextLineGetAlignmentOffset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetAlignmentOffset001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphCount_001
     * @tc.name       : testOHDrawingGetRunGlyphCount001
     * @tc.desc       : test OH_Drawing_GetRunGlyphCount_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunGlyphCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphCount001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringRange_001
     * @tc.name       : testOHDrawingGetRunStringRange001
     * @tc.desc       : test OH_Drawing_GetRunStringRange_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunStringRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunTypographicBounds_001
     * @tc.name       : testOHDrawingGetRunTypographicBounds001
     * @tc.desc       : test OH_Drawing_GetRunTypographicBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunTypographicBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringIndicesByIndex_001
     * @tc.name       : testOHDrawingGetRunTypographicBounds001
     * @tc.desc       : test OH_Drawing_GetRunStringIndicesByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunStringIndicesByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringIndicesByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunImageBounds_001
     * @tc.name       : testOHDrawingGetRunImageBounds001
     * @tc.desc       : test OH_Drawing_GetRunImageBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunImageBounds001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphsByIndex_001
     * @tc.name       : testOHDrawingGetRunGlyphsByIndex001
     * @tc.desc       : test OH_Drawing_GetRunGlyphsByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunGlyphsByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphsByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunPositions_001
     * @tc.name       : testOHDrawingGetRunPositions001
     * @tc.desc       : test OH_Drawing_GetRunPositions_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetRunPositions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunPositions001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.name       : testOHDrawingGetFontCollectionGlobalInstance001
     * @tc.desc       : test OH_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingGetFontCollectionGlobalInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontCollectionGlobalInstance001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_SetTextStyleBadgeType_001
     * @tc.name       : testOHDrawingSetTextStyleBadgeType001
     * @tc.desc       : test OHDrawingSetTextStyleBadgeType001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_SetTextStyleBadgeType_002
     * @tc.name       : testOHDrawingSetTextStyleBadgeType002
     * @tc.desc       : test OHDrawingSetTextStyleBadgeType002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingSetTextStyleBadgeType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativeFontNdk.oHDrawingSetTextStyleBadgeType002();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_001
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText001
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_002
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText002
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_003
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText003
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_004
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText004
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_005
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText005
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_006
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText006
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOHDrawingTypographyHandlerAddEncodedText006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyHandlerAddEncodedText006();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_007
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText007
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText007
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_008
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText008
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText008
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyHandlerAddEncodedText_009
     * @tc.name       : testOHDrawingTypographyHandlerAddEncodedText009
     * @tc.desc       : test OHDrawingTypographyHandlerAddEncodedText009
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRun_001
     * @tc.name       : testOHDrawingGetRun001
     * @tc.desc       : test OHDrawingGetRun001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
  })
}