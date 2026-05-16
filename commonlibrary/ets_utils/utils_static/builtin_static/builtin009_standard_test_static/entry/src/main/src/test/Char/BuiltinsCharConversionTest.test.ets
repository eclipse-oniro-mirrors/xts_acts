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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
// import exec from '@system.exec';
// import { sleep } from '../testability/pages/Utils';
export default function builtinsCharConversionTest() {
  describe('builtinsCharConversionTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsCharConversionTest0001
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0001
     * @tc.desc    Test Char construction from literal and hex code
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charFromLiteral: Char = new Char(c'\u0000');
      let charFromHexCode: Char = new Char(c'\u0000');

      expect(charFromLiteral).not().assertNull();
      expect(charFromHexCode).not().assertNull();
      expect(charFromLiteral instanceof Char).assertTrue();
      expect(charFromHexCode instanceof Char).assertTrue();
      expect(charFromLiteral.equals(charFromHexCode)).assertTrue();
    });

    /**
     * @tc.name    builtinsCharConversionTest0002
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0002
     * @tc.desc    Verify default constructor creates a defined Char object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let defaultChar: Char = new Char();

      expect(defaultChar).not().assertUndefined();
      expect(defaultChar).not().assertNull();
      expect(defaultChar instanceof Char).assertTrue();
      expect(defaultChar.toInt()).assertEqual(0);
    });
    /**
     * @tc.name    builtinsCharConversionTest0003
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0003
     * @tc.desc    Test Char construction with maximum BMP value 0xFFFF
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charMaxBmp: Char = new Char(c'\uFFFF');

      expect(charMaxBmp).not().assertNull();
      expect(charMaxBmp instanceof Char).assertTrue();
      expect(charMaxBmp.toInt()).assertEqual(0xFFFF);
    });

    /**
     * @tc.name    builtinsCharConversionTest0004
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0004
     * @tc.desc    Test Char construction with value before high surrogate area 0xD7FF
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charBeforeSurrogate: Char = new Char(c'\uD7FF');

      expect(charBeforeSurrogate).not().assertNull();
      expect(charBeforeSurrogate instanceof Char).assertTrue();
      expect(charBeforeSurrogate.toInt()).assertEqual(0xD7FF);
    });

    /**
     * @tc.name    builtinsCharConversionTest0005
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0005
     * @tc.desc    Test Char construction with value after low surrogate area 0xE000
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charAfterSurrogate: Char = new Char(c'\uE000');

      expect(charAfterSurrogate).not().assertNull();
      expect(charAfterSurrogate instanceof Char).assertTrue();
      expect(charAfterSurrogate.toInt()).assertEqual(0xE000);
    });

    /**
     * @tc.name    builtinsCharConversionTest0006
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0006
     * @tc.desc    Test Char construction with high surrogate minimum value 0xD800
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highSurrogateMin: Char = new Char(c'\uD800');

      expect(highSurrogateMin).not().assertNull();
      expect(highSurrogateMin instanceof Char).assertTrue();
      expect(highSurrogateMin.toInt()).assertEqual(0xD800);
    });

    /**
     * @tc.name    builtinsCharConversionTest0007
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0007
     * @tc.desc    Test Char construction with high surrogate maximum value 0xDBFF
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highSurrogateMax: Char = new Char(c'\uDBFF');

      expect(highSurrogateMax).not().assertNull();
      expect(highSurrogateMax instanceof Char).assertTrue();
      expect(highSurrogateMax.toInt()).assertEqual(0xDBFF);
    });

    /**
     * @tc.name    builtinsCharConversionTest0008
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0008
     * @tc.desc    Test Char construction with low surrogate minimum value 0xDC00
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let lowSurrogateMin: Char = new Char(c'\uDC00');

      expect(lowSurrogateMin).not().assertNull();
      expect(lowSurrogateMin instanceof Char).assertTrue();
      expect(lowSurrogateMin.toInt()).assertEqual(0xDC00);
    });

    /**
     * @tc.name    builtinsCharConversionTest0009
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0009
     * @tc.desc    Test Char construction with low surrogate maximum value 0xDFFF
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let lowSurrogateMax: Char = new Char(c'\uDFFF');

      expect(lowSurrogateMax).not().assertNull();
      expect(lowSurrogateMax instanceof Char).assertTrue();
      expect(lowSurrogateMax.toInt()).assertEqual(0xDFFF);
    });

    /**
     * @tc.name    builtinsCharConversionTest0010
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0010
     * @tc.desc    Test character to numeric conversion for uppercase A to 65
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA: Char = new Char(c'A');

      expect(charA).not().assertNull();
      expect(charA instanceof Char).assertTrue();
      expect(charA.toInt()).assertEqual(65);
    });

    /**
     * @tc.name    builtinsCharConversionTest0011
     * @tc.number  BUILTINS_CHAR_CONVERSION_TEST_0011
     * @tc.desc    Test character to numeric conversion for lowercase a to 97
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharConversionTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charLowerA: Char = new Char(c'a');

      expect(charLowerA).not().assertNull();
      expect(charLowerA instanceof Char).assertTrue();
      expect(charLowerA.toInt()).assertEqual(97);
    });
  })
}