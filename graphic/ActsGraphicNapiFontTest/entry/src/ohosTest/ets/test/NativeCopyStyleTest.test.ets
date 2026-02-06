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

export default function NativeCopyStyleTest() {
  describe('NativeCopyStyleTest', () => {
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
     * @tc.name   OHDrawingCopyTextStyle001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0100
     * @tc.desc   test for copy text style：base
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTextStyle001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTextStyle(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTextStyle002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0200
     * @tc.desc   test for copy text style: FontStyleStruct、AddFontFeature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTextStyle002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTextStyle(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTextStyle003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0300
     * @tc.desc   test for copy text style: brush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTextStyle003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTextStyle(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTextStyle004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0400
     * @tc.desc   test for copy text style: pen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTextStyle004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTextStyle(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTextShadow001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_SHADOW_0100
     * @tc.desc   test for copy text shadow and copy textstyle with shadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTextShadow001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTextShadow(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTypographyStyle001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0100
     * @tc.desc   test for copy typography style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTypographyStyle001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTypographyStyle(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTypographyStyle002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0200
     * @tc.desc   test for copy typography style：FontWeight、FontStyle、FontFamily、FontSize、FontHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTypographyStyle002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTypographyStyle(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTypographyStyle003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0300
     * @tc.desc   test for copy typography style: FontStyleStruct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTypographyStyle003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTypographyStyle(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingCopyTypographyStyle004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0400
     * @tc.desc   test for copy text shadow: typographystyle->textstyle->shadow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHDrawingCopyTypographyStyle004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.OHDrawingCopyTypographyStyle(3);
      expect(result).assertEqual(0);
    })

  })
}