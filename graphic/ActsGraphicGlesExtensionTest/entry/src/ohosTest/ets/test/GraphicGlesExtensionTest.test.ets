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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import graphic_gles_extension_test from 'libgraphic_gles_extension_test.so'

export default function GraphicGlesExtensionTest() {

  describe('GraphicGlesExtensionTest', () => {
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
     * @tc.name   OH_GLES_Extension001
     * @tc.number OH_GLES_Extension001
     * @tc.desc   OH_GLES_Extension001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_GLES_Extension001', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const result = graphic_gles_extension_test.ohGlesExtensionTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_GLES_Extension002
     * @tc.number OH_GLES_Extension002
     * @tc.desc   OH_GLES_Extension002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_GLES_Extension002', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const result = graphic_gles_extension_test.ohGlesExtensionTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   OH_GLES_Extension003
     * @tc.number OH_GLES_Extension003
     * @tc.desc   OH_GLES_Extension003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_GLES_Extension003', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const result = graphic_gles_extension_test.ohGlesExtensionTest(2);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   OH_GLES_Extension004
     * @tc.number OH_GLES_Extension004
     * @tc.desc   OH_GLES_Extension004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_GLES_Extension004', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const result = graphic_gles_extension_test.ohGlesExtensionTest(3);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   OH_GLES_Extension005
     * @tc.number OH_GLES_Extension005
     * @tc.desc   OH_GLES_Extension005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_GLES_Extension005', Level.LEVEL2, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const result = graphic_gles_extension_test.ohGlesExtensionTest(4);
      expect(result).assertEqual(0);
    })
  })
}