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

export default function VpeImageNdkTest() {
  describe('VpeImageNdkTest', () => {
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
     * @tc.name   VpeImageNdk01
     * @tc.number VpeImageNdk01
     * @tc.desc   VpeImageNdk01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk01', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk02
     * @tc.number VpeImageNdk02
     * @tc.desc   VpeImageNdk02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk02', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk03
     * @tc.number VpeImageNdk03
     * @tc.desc   VpeImageNdk03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk03', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk04
     * @tc.number VpeImageNdk04
     * @tc.desc   VpeImageNdk04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk04', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk05
     * @tc.number VpeImageNdk05
     * @tc.desc   VpeImageNdk05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk05', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk06
     * @tc.number VpeImageNdk06
     * @tc.desc   VpeImageNdk06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk06', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk07
     * @tc.number VpeImageNdk07
     * @tc.desc   VpeImageNdk07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk07', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk08
     * @tc.number VpeImageNdk08
     * @tc.desc   VpeImageNdk08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk08', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk09
     * @tc.number VpeImageNdk09
     * @tc.desc   VpeImageNdk09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk09', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk10
     * @tc.number VpeImageNdk10
     * @tc.desc   VpeImageNdk10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk10', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk11
     * @tc.number VpeImageNdk11
     * @tc.desc   VpeImageNdk11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk11', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk112
     * @tc.number VpeImageNdk112
     * @tc.desc   VpeImageNdk112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk112', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk113
     * @tc.number VpeImageNdk113
     * @tc.desc   VpeImageNdk113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk113', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk114
     * @tc.number VpeImageNdk114
     * @tc.desc   VpeImageNdk114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk114', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk115
     * @tc.number VpeImageNdk115
     * @tc.desc   VpeImageNdk115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk115', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk12
     * @tc.number VpeImageNdk12
     * @tc.desc   VpeImageNdk12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk12', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk13
     * @tc.number VpeImageNdk13
     * @tc.desc   VpeImageNdk13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk13', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk14
     * @tc.number VpeImageNdk14
     * @tc.desc   VpeImageNdk14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk14', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk15
     * @tc.number VpeImageNdk15
     * @tc.desc   VpeImageNdk15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk15', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk16
     * @tc.number VpeImageNdk16
     * @tc.desc   VpeImageNdk16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk16', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk17
     * @tc.number VpeImageNdk17
     * @tc.desc   VpeImageNdk17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk17', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk18
     * @tc.number VpeImageNdk18
     * @tc.desc   VpeImageNdk18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk18', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk19
     * @tc.number VpeImageNdk19
     * @tc.desc   VpeImageNdk19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk19', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk20
     * @tc.number VpeImageNdk20
     * @tc.desc   VpeImageNdk20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk20', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk21
     * @tc.number VpeImageNdk21
     * @tc.desc   VpeImageNdk21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk21', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk22
     * @tc.number VpeImageNdk22
     * @tc.desc   VpeImageNdk22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk22', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk23
     * @tc.number VpeImageNdk23
     * @tc.desc   VpeImageNdk23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk23', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk24
     * @tc.number VpeImageNdk24
     * @tc.desc   VpeImageNdk24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk24', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk25
     * @tc.number VpeImageNdk25
     * @tc.desc   VpeImageNdk25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk25', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk26
     * @tc.number VpeImageNdk26
     * @tc.desc   VpeImageNdk26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk26', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk27
     * @tc.number VpeImageNdk27
     * @tc.desc   VpeImageNdk27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk27', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk28
     * @tc.number VpeImageNdk28
     * @tc.desc   VpeImageNdk28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk28', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk29
     * @tc.number VpeImageNdk29
     * @tc.desc   VpeImageNdk29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk29', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk30
     * @tc.number VpeImageNdk30
     * @tc.desc   VpeImageNdk30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk30', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk31
     * @tc.number VpeImageNdk31
     * @tc.desc   VpeImageNdk31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk31', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk32
     * @tc.number VpeImageNdk32
     * @tc.desc   VpeImageNdk32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk32', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk33
     * @tc.number VpeImageNdk33
     * @tc.desc   VpeImageNdk33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk33', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(36)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk34
     * @tc.number VpeImageNdk34
     * @tc.desc   VpeImageNdk34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk34', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(37)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk35
     * @tc.number VpeImageNdk35
     * @tc.desc   VpeImageNdk35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk35', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(38)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk36
     * @tc.number VpeImageNdk36
     * @tc.desc   VpeImageNdk36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk36', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(39)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk37
     * @tc.number VpeImageNdk37
     * @tc.desc   VpeImageNdk37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk37', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(40)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk38
     * @tc.number VpeImageNdk38
     * @tc.desc   VpeImageNdk38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk38', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(41)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk39
     * @tc.number VpeImageNdk39
     * @tc.desc   VpeImageNdk39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk39', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(42)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk40
     * @tc.number VpeImageNdk40
     * @tc.desc   VpeImageNdk40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk40', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(43)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk41
     * @tc.number VpeImageNdk41
     * @tc.desc   VpeImageNdk41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk41', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(44)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk42
     * @tc.number VpeImageNdk42
     * @tc.desc   VpeImageNdk42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk42', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(45)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk43
     * @tc.number VpeImageNdk43
     * @tc.desc   VpeImageNdk43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk43', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(46)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk44
     * @tc.number VpeImageNdk44
     * @tc.desc   VpeImageNdk44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk44', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(47)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk45
     * @tc.number VpeImageNdk45
     * @tc.desc   VpeImageNdk45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk45', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(48)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk46
     * @tc.number VpeImageNdk46
     * @tc.desc   VpeImageNdk46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk46', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(49)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk47
     * @tc.number VpeImageNdk47
     * @tc.desc   VpeImageNdk47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk47', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(50)).assertEqual(0);
    })
  })
}