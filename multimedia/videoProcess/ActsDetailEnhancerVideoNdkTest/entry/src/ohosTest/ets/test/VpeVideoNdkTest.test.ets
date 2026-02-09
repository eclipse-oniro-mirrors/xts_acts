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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libNdk from 'libentry.so';

export default function VpeVideoNdkTest() {
  describe('VpeVideoNdkTest', () => {
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
     * @tc.name   VpeVideoNdk01
     * @tc.number VpeVideoNdk01
     * @tc.desc   VpeVideoNdk01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk01', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk02
     * @tc.number VpeVideoNdk02
     * @tc.desc   VpeVideoNdk02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk02', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk03
     * @tc.number VpeVideoNdk03
     * @tc.desc   VpeVideoNdk03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk03', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk05
     * @tc.number VpeVideoNdk05
     * @tc.desc   VpeVideoNdk05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk05', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk06
     * @tc.number VpeVideoNdk06
     * @tc.desc   VpeVideoNdk06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk06', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk07
     * @tc.number VpeVideoNdk07
     * @tc.desc   VpeVideoNdk07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk07', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk08
     * @tc.number VpeVideoNdk08
     * @tc.desc   VpeVideoNdk08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk08', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk09
     * @tc.number VpeVideoNdk09
     * @tc.desc   VpeVideoNdk09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk09', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk10
     * @tc.number VpeVideoNdk10
     * @tc.desc   VpeVideoNdk10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk10', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk11
     * @tc.number VpeVideoNdk11
     * @tc.desc   VpeVideoNdk11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk11', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk12
     * @tc.number VpeVideoNdk12
     * @tc.desc   VpeVideoNdk12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk12', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk13
     * @tc.number VpeVideoNdk13
     * @tc.desc   VpeVideoNdk13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk13', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk14
     * @tc.number VpeVideoNdk14
     * @tc.desc   VpeVideoNdk14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk14', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk15
     * @tc.number VpeVideoNdk15
     * @tc.desc   VpeVideoNdk15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk15', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk16
     * @tc.number VpeVideoNdk16
     * @tc.desc   VpeVideoNdk16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk16', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk17
     * @tc.number VpeVideoNdk17
     * @tc.desc   VpeVideoNdk17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk17', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk18
     * @tc.number VpeVideoNdk18
     * @tc.desc   VpeVideoNdk18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk18', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk19
     * @tc.number VpeVideoNdk19
     * @tc.desc   VpeVideoNdk19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk19', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk20
     * @tc.number VpeVideoNdk20
     * @tc.desc   VpeVideoNdk20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk20', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk21
     * @tc.number VpeVideoNdk21
     * @tc.desc   VpeVideoNdk21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk21', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk22
     * @tc.number VpeVideoNdk22
     * @tc.desc   VpeVideoNdk22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk22', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk23
     * @tc.number VpeVideoNdk23
     * @tc.desc   VpeVideoNdk23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk23', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk24
     * @tc.number VpeVideoNdk24
     * @tc.desc   VpeVideoNdk24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk24', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk25
     * @tc.number VpeVideoNdk25
     * @tc.desc   VpeVideoNdk25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk25', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk26
     * @tc.number VpeVideoNdk26
     * @tc.desc   VpeVideoNdk26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk26', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk27
     * @tc.number VpeVideoNdk27
     * @tc.desc   VpeVideoNdk27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk27', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk28
     * @tc.number VpeVideoNdk28
     * @tc.desc   VpeVideoNdk28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk28', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk29
     * @tc.number VpeVideoNdk29
     * @tc.desc   VpeVideoNdk29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk29', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk30
     * @tc.number VpeVideoNdk30
     * @tc.desc   VpeVideoNdk30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk30', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk31
     * @tc.number VpeVideoNdk31
     * @tc.desc   VpeVideoNdk31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk31', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk32
     * @tc.number VpeVideoNdk32
     * @tc.desc   VpeVideoNdk32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk32', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk33
     * @tc.number VpeVideoNdk33
     * @tc.desc   VpeVideoNdk33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk33', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk34
     * @tc.number VpeVideoNdk34
     * @tc.desc   VpeVideoNdk34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk34', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk342
     * @tc.number VpeVideoNdk342
     * @tc.desc   VpeVideoNdk342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk342', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk35
     * @tc.number VpeVideoNdk35
     * @tc.desc   VpeVideoNdk35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk35', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk37
     * @tc.number VpeVideoNdk37
     * @tc.desc   VpeVideoNdk37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk37', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk38
     * @tc.number VpeVideoNdk38
     * @tc.desc   VpeVideoNdk38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk38', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(36)).assertEqual(0);
    })

  })
}