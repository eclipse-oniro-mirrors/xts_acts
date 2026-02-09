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

export default function NativeTextRunTest() {
  describe('NativeTextRunTest', () => {
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
     * @tc.name   RunTest001
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0100
     * @tc.desc   Test for get run by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest001', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest002
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0200
     * @tc.desc   Test for get run glyph count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest002', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest003
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0300
     * @tc.desc   Test for get glyph index in paragraph
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest003', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest004
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0400
     * @tc.desc   Test for get run string range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest004', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest005
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0500
     * @tc.desc   Test for get run typographic bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest005', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest006
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0600
     * @tc.desc   Test for get run glyphs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest006', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest007
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0700
     * @tc.desc   Test for get run positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest007', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest008
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0800
     * @tc.desc   Test for special value input parameters testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest008', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   RunTest009
     * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0900
     * @tc.desc   Test for the run of nullptr pointer testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RunTest009', Level.LEVEL0, () => {
      const result = libGraphicDrawing.RunTest(8);
      expect(result).assertEqual(0);
    })

  })
}

