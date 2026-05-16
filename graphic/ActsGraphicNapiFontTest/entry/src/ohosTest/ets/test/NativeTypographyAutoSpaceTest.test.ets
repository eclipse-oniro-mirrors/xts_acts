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

export default function NativeTypographyAutoSpaceTest() {
  describe('NativeTypographyAutoSpaceTest', () => {
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
     * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0100
     * @tc.desc   test for set auto space when paragraph with single run
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingSetTypographyTextAutoSpaceTest001', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingSetTypographyTextAutoSpaceTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0200
     * @tc.desc   test for set auto space when paragraph with single run and the layout width is at the boundary value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingSetTypographyTextAutoSpaceTest002', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingSetTypographyTextAutoSpaceTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0300
     * @tc.desc   test for set auto space when paragraph with many lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingSetTypographyTextAutoSpaceTest003', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingSetTypographyTextAutoSpaceTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0400
     * @tc.desc   test for set auto space when paragraph is many lines and the layout width is at the boundary value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OHDrawingSetTypographyTextAutoSpaceTest004', Level.LEVEL1, () => {
      const result = libGraphicDrawing.OHDrawingSetTypographyTextAutoSpaceTest(3);
      expect(result).assertEqual(0);
    })

  })
}

