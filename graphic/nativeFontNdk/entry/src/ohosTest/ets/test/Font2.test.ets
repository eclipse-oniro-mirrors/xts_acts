/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

export default function Font2Test() {
  describe('Font2Test', () => {
    /**
     * @tc.name   testOHDrawingSetTextStyleAttributeInt004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeInt004
     * @tc.desc   test OHDrawingSetTextStyleAttributeInt004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTextStyleAttributeInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeInt004();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHDrawingTypographyDidExceedMaxLines004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyDidExceedMaxLines004
     * @tc.desc   test OHDrawingTypographyDidExceedMaxLines004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingTypographyDidExceedMaxLines004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyDidExceedMaxLines004();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingTypographyStyleGetEffectiveAlignment003
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingTypographyStyleGetEffectiveAlignment003
    * @tc.desc   test OHDrawingTypographyStyleGetEffectiveAlignment003
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingTypographyStyleGetEffectiveAlignment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyStyleGetEffectiveAlignment003();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingSetTextStyleAttributeDouble005
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTextStyleAttributeDouble005
    * @tc.desc   test OHDrawingSetTextStyleAttributeDouble005
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingSetTextStyleAttributeDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingSetTextStyleAttributeDouble005();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromPath001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromPath001
    * @tc.desc   test OHDrawingIsFontSupportedFromPath with supported font
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromPath001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromPath002
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromPath002
    * @tc.desc   test OHDrawingIsFontSupportedFromPath with unsupported font
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromPath002();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromPath003
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromPath003
    * @tc.desc   test OHDrawingIsFontSupportedFromPath with empty path
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromPath003();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromPath004
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromPath004
    * @tc.desc   test OHDrawingIsFontSupportedFromPath with null path
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromPath004();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer001
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with valid font buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer002
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer002
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with null buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer002();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer003
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer003
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with zero length buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer003();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer004
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer004
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with large buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer004();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer005
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer005
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with invalid font data
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer005();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer006
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer006
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with real font file data
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer006();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer007
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer007
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with buffer boundary conditions
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer007();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingIsFontSupportedFromBuffer008
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingIsFontSupportedFromBuffer008
    * @tc.desc   test OHDrawingIsFontSupportedFromBuffer with partial font data
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingIsFontSupportedFromBuffer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingIsFontSupportedFromBuffer008();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingErrorFileNotFound001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingErrorFileNotFound001
    * @tc.desc   test font creation from non-existent file returns FILE_NOT_FOUND error
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingErrorFileNotFound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingErrorFileNotFound001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex001
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with valid parameters
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex002
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex002
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with null font collection
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex002();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex003
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex003
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with empty font family name
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex003();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex004
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex004
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with null font family name
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
/*    it('testOHDrawingRegisterFontByIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex004();
      expect(result).assertEqual(0);
      done();
    });
*/


    /**
    * @tc.name   testOHDrawingRegisterFontByIndex005
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex005
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with empty file path
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex005();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex006
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex006
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with null file path
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex006();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex007
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex007
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with invalid file path
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex007();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex008
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex008
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with invalid index
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex008();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex009
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex009
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with both empty parameters
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex009();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontByIndex010
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontByIndex010
    * @tc.desc   test OH_Drawing_RegisterFontByIndex with both null parameters
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontByIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontByIndex010();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex001
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex001
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with valid parameters
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex002
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex002
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with null font collection
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex002();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex003
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex003
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with empty font family name
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex003();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex004
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex004
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with null font family name
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
/*    it('testOHDrawingRegisterFontBufferByIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex004();
      expect(result).assertEqual(0);
      done();
    });
*/

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex005
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex005
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with null buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex005();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex006
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex006
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with zero length buffer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex006();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex007
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex007
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with invalid index
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex007();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex008
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex008
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with partial buffer data
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex008();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex009
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex009
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with multiple registrations
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex009();
      expect(result).assertEqual(0);
      done();
    });

    /**
    * @tc.name   testOHDrawingRegisterFontBufferByIndex010
    * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingRegisterFontBufferByIndex010
    * @tc.desc   test OH_Drawing_RegisterFontBufferByIndex with different family names
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOHDrawingRegisterFontBufferByIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRegisterFontBufferByIndex010();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testFullDescriptorAttrSLocalPostscriptName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalPostscriptName001
     * @tc.desc   test FullDescriptorAttrSLocalPostscriptName001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalPostscriptName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalPostscriptName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testFullDescriptorAttrSLocalPostscriptName002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalPostscriptName002
     * @tc.desc   test FullDescriptorAttrSLocalPostscriptName002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalPostscriptName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalPostscriptName002();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSLocalFullName.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSLocalFullName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalFullName001
     * @tc.desc   test FullDescriptorAttrSLocalFullName001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalFullName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalFullName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testFullDescriptorAttrSLocalFullName002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalFullName002
     * @tc.desc   test FullDescriptorAttrSLocalFullName002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalFullName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalFullName002();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSLocalFamilyName.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSLocalFamilyName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalFamilyName001
     * @tc.desc   test FullDescriptorAttrSLocalFamilyName001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalFamilyName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalFamilyName001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSLocalSubFamilyName.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSLocalSubFamilyName001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLocalSubFamilyName001
     * @tc.desc   test FullDescriptorAttrSLocalSubFamilyName001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLocalSubFamilyName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLocalSubFamilyName001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSVersion.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSVersion001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSVersion001
     * @tc.desc   test FullDescriptorAttrSVersion001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSVersion001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testFullDescriptorAttrSVersion002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSVersion002
     * @tc.desc   test FullDescriptorAttrSVersion002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSVersion002();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSManufacture.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSManufacture001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSManufacture001
     * @tc.desc   test FullDescriptorAttrSManufacture001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSManufacture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSManufacture001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSCopyright.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSCopyright001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSCopyright001
     * @tc.desc   test FullDescriptorAttrSCopyright001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSCopyright001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSCopyright001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSTrademark.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSTrademark001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSTrademark001
     * @tc.desc   test FullDescriptorAttrSTrademark001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSTrademark001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSTrademark001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrSLicense.test.ets
    /**
     * @tc.name   testFullDescriptorAttrSLicense001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrSLicense001
     * @tc.desc   test FullDescriptorAttrSLicense001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrSLicense001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrSLicense001();
      expect(result).assertEqual(0);
      done();
    });

    // FullDescriptorAttrIIndex.test.ets
    /**
     * @tc.name   testFullDescriptorAttrIIndex001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_FullDescriptorAttrIIndex001
     * @tc.desc   test FullDescriptorAttrIIndex001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFullDescriptorAttrIIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeFontNdk.fullDescriptorAttrIIndex001();
      expect(result).assertEqual(0);
      done();
    });

    // GetFontUnicodeArrayFromFile.test.ets
    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromFile001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromFile001
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromFile001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromFile001();
            expect(result).assertEqual(0);
            done();
    });

    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromFile002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromFile002
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromFile002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromFile002();
            expect(result).assertEqual(0);
            done();
    });

    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromFile003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromFile003
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromFile003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromFile003();
            expect(result).assertEqual(0);
            done();
    });

    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromFile004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromFile004
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromFile004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromFile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromFile004();
            expect(result).assertEqual(0);
            done();
    });

    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromFile005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromFile005
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromFile005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromFile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromFile005();
            expect(result).assertEqual(0);
            done();
    });

    // GetFontUnicodeArrayFromBuffer.test.ets
    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromBuffer001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromBuffer001
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromBuffer001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromBuffer001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetFontUnicodeArrayFromBuffer002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontUnicodeArrayFromBuffer002
     * @tc.desc   test OHDrawingGetFontUnicodeArrayFromBuffer002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontUnicodeArrayFromBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontUnicodeArrayFromBuffer002();
            expect(result).assertEqual(0);
            done();
        }
    );

    // GetFontCountFromFile.test.ets
    /**
     * @tc.name   testOHDrawingGetFontCountFromFile001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontCountFromFile001
     * @tc.desc   test OHDrawingGetFontCountFromFile001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontCountFromFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontCountFromFile001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetFontCountFromFile002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontCountFromFile002
     * @tc.desc   test OHDrawingGetFontCountFromFile002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontCountFromFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontCountFromFile002();
            expect(result).assertEqual(0);
            done();
        }
    );

    // GetFontCountFromBuffer.test.ets
    /**
     * @tc.name   testOHDrawingGetFontCountFromBuffer001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontCountFromBuffer001
     * @tc.desc   test OHDrawingGetFontCountFromBuffer001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontCountFromBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontCountFromBuffer001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetFontCountFromBuffer002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontCountFromBuffer002
     * @tc.desc   test OHDrawingGetFontCountFromBuffer002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontCountFromBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontCountFromBuffer002();
            expect(result).assertEqual(0);
            done();
        }
    );

    // GetFontPathsByType.test.ets
    /**
     * @tc.name   testOHDrawingGetFontPathsByType001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontPathsByType001
     * @tc.desc   test OHDrawingGetFontPathsByType001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontPathsByType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontPathsByType001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetFontPathsByType002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontPathsByType002
     * @tc.desc   test OHDrawingGetFontPathsByType002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontPathsByType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontPathsByType002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetFontPathsByType003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetFontPathsByType003
     * @tc.desc   test OHDrawingGetFontPathsByType003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetFontPathsByType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetFontPathsByType003();
            expect(result).assertEqual(0);
            done();
        }
    );

    // SetTypographyStyleAttributeBool.test.ets
    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool001
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool002
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool003
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool004
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool004();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool005
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool005();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingSetTypographyStyleAttributeBool006
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingSetTypographyStyleAttributeBool006
     * @tc.desc   test OHDrawingSetTypographyStyleAttributeBool006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingSetTypographyStyleAttributeBool006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingSetTypographyStyleAttributeBool006();
            expect(result).assertEqual(0);
            done();
        }
    );

    // GetTypographyStyleAttributeBool.test.ets
    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeBool001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeBool001
     * @tc.desc   test OHDrawingGetTypographyStyleAttributeBool001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeBool001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeBool002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeBool002
     * @tc.desc   test OHDrawingGetTypographyStyleAttributeBool002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeBool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeBool002();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeBool003
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeBool003
     * @tc.desc   test OHDrawingGetTypographyStyleAttributeBool003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeBool003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeBool003();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeBool004
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeBool004
     * @tc.desc   test OHDrawingGetTypographyStyleAttributeBool004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeBool004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeBool004();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingGetTypographyStyleAttributeBool005
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingGetTypographyStyleAttributeBool005
     * @tc.desc   test OHDrawingGetTypographyStyleAttributeBool004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingGetTypographyStyleAttributeBool005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingGetTypographyStyleAttributeBool005();
            expect(result).assertEqual(0);
            done();
        }
    );

    // DestroyPositionAndAffinity.test.ets
    /**
     * @tc.name   testOHDrawingDestroyPositionAndAffinity001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingDestroyPositionAndAffinity001
     * @tc.desc   test OHDrawingDestroyPositionAndAffinity001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingDestroyPositionAndAffinity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingDestroyPositionAndAffinity001();
            expect(result).assertEqual(0);
            done();
        }
    );

    /**
     * @tc.name   testOHDrawingDestroyPositionAndAffinity002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_Font_OHDrawingDestroyPositionAndAffinity002
     * @tc.desc   test OHDrawingDestroyPositionAndAffinity002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHDrawingDestroyPositionAndAffinity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
            let result: number = nativeFontNdk.ohDrawingDestroyPositionAndAffinity002();
            expect(result).assertEqual(0);
            done();
        }
    );

  })
}