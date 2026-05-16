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

export default function builtinsIsLetterTest() {
  describe("builtinsIsLetterTest", () => {
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
     * @tc.name    builtinsIsLetterTest0001
     * @tc.number  BUILTINS_IS_LETTER_TEST_0001
     * @tc.desc    Test isLetter with CHAR_BIT_SIZE valid range (letter 'a' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLetterTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validLetterA = new Char(c'a');
      expect(validLetterA.isLetter()).assertTrue();
    });

    /**
     * @tc.name    builtinsIsLetterTest0002
     * @tc.number  BUILTINS_IS_LETTER_TEST_0002
     * @tc.desc    Test isLetter with MAX_CODE_POINT valid mapped char (non-letter char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonLetterChar = new Char(c'\uFFFF');
      expect(nonLetterChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0003
     * @tc.number  BUILTINS_IS_LETTER_TEST_0003
     * @tc.desc    Test isLetter with HIGH_SURROGATE_MIN (\uD800)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0004
     * @tc.number  BUILTINS_IS_LETTER_TEST_0004
     * @tc.desc    Test isLetter with HIGH_SURROGATE_MAX (\uDBFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0005
     * @tc.number  BUILTINS_IS_LETTER_TEST_0005
     * @tc.desc    Test isLetter with LOW_SURROGATE_MIN (\uDC00)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0006
     * @tc.number  BUILTINS_IS_LETTER_TEST_0006
     * @tc.desc    Test isLetter with LOW_SURROGATE_MAX (\uDFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0007
     * @tc.number  BUILTINS_IS_LETTER_TEST_0007
     * @tc.desc    Test isLetter with BMP_BORDER below (0xFFFE, valid BMP char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0008
     * @tc.number  BUILTINS_IS_LETTER_TEST_0008
     * @tc.desc    Test isLetter with BMP_BORDER mapped valid char (letter 'A')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLetterTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpAboveLetterA = new Char(c'A');
      expect(bmpAboveLetterA.isLetter()).assertTrue();
    });

    /**
     * @tc.name    builtinsIsLetterTest0009
     * @tc.number  BUILTINS_IS_LETTER_TEST_0009
     * @tc.desc    Test isLetter with MIN_VALUE (\u0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLetterTest0010
     * @tc.number  BUILTINS_IS_LETTER_TEST_0010
     * @tc.desc    Test isLetter with MAX_VALUE (\uFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsLetterTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isLetter()).assertFalse();
    });

  })
}