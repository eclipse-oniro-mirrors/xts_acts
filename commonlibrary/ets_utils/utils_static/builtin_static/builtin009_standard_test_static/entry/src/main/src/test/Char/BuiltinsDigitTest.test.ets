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
class TestRuntimeLinker extends RuntimeLinker {
  findAndLoadClass(clsName: string, init: boolean): Class | undefined {
    return undefined
  }
}
export default function builtinsDigitTest() {
  describe('builtinsDigitTest', () => {
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
     * @tc.name    builtinsDigitTest0001
     * @tc.number  BUILTINS_DIGIT_TEST_0001
     * @tc.desc    Test charsToCodePoint method with valid surrogate pairs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highSurrogate: char = c'\uD83D';
      let lowSurrogate: char = c'\uDE00';
      let codePoint: int = Char.charsToCodePoint(highSurrogate, lowSurrogate);
      expect(codePoint).assertEqual(0x1F600);

      let highSurrogate2: char = c'\uD834';
      let lowSurrogate2: char = c'\uDD1E';
      let codePoint2: int = Char.charsToCodePoint(highSurrogate2, lowSurrogate2);
      expect(codePoint2).assertEqual(0x1D11E);
    });

    /**
     * @tc.name    builtinsDigitTest0002
     * @tc.number  BUILTINS_DIGIT_TEST_0002
     * @tc.desc    Test isBinDigit static method with binary and non-binary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();
      expect(Char.isBinDigit(c'a')).assertFalse();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c' ')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0003
     * @tc.number  BUILTINS_DIGIT_TEST_0003
     * @tc.desc    Test isBinDigit instance method with binary and non-binary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let char0: Char = new Char(c'0');
      let char1: Char = new Char(c'1');
      let char2: Char = new Char(c'2');
      let charA: Char = new Char(c'A');

      expect(char0.isBinDigit()).assertTrue();
      expect(char1.isBinDigit()).assertTrue();
      expect(char2.isBinDigit()).assertFalse();
      expect(charA.isBinDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0004
     * @tc.number  BUILTINS_DIGIT_TEST_0004
     * @tc.desc    Test isDecDigit static method with decimal and non-decimal values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'a')).assertFalse();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c' ')).assertFalse();
      expect(Char.isDecDigit(c'+')).assertFalse();
      expect(Char.isDecDigit(c'~')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0005
     * @tc.number  BUILTINS_DIGIT_TEST_0005
     * @tc.desc    Test isDecDigit instance method with decimal and non-decimal values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let char0: Char = new Char(c'0');
      let char5: Char = new Char(c'5');
      let char9: Char = new Char(c'9');
      let charA: Char = new Char(c'A');
      let charSpace: Char = new Char(c' ');

      expect(char0.isDecDigit()).assertTrue();
      expect(char5.isDecDigit()).assertTrue();
      expect(char9.isDecDigit()).assertTrue();
      expect(charA.isDecDigit()).assertFalse();
      expect(charSpace.isDecDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0006
     * @tc.number  BUILTINS_DIGIT_TEST_0006
     * @tc.desc    Test isHexDigit static method with hexadecimal and non-hexadecimal values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c' ')).assertFalse();
      expect(Char.isHexDigit(c'+')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0007
     * @tc.number  BUILTINS_DIGIT_TEST_0007
     * @tc.desc    Test isHexDigit instance method with hexadecimal and non-hexadecimal values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let char0: Char = new Char(c'0');
      let char9: Char = new Char(c'9');
      let charA: Char = new Char(c'A');
      let charF: Char = new Char(c'F');
      let charG: Char = new Char(c'G');
      let charSpace: Char = new Char(c' ');

      expect(char0.isHexDigit()).assertTrue();
      expect(char9.isHexDigit()).assertTrue();
      expect(charA.isHexDigit()).assertTrue();
      expect(charF.isHexDigit()).assertTrue();
      expect(charG.isHexDigit()).assertFalse();
      expect(charSpace.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0008
     * @tc.number  BUILTINS_DIGIT_TEST_0008
     * @tc.desc    Test isLetter static method with alphabetic and non-alphabetic values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isLetter(c'm')).assertTrue();
      expect(Char.isLetter(c'M')).assertTrue();
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isLetter(c'9')).assertFalse();
      expect(Char.isLetter(c' ')).assertFalse();
      expect(Char.isLetter(c'+')).assertFalse();
      expect(Char.isLetter(c'~')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0009
     * @tc.number  BUILTINS_DIGIT_TEST_0009
     * @tc.desc    Test isLetter instance method with alphabetic and non-alphabetic values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA: Char = new Char(c'A');
      let charZ: Char = new Char(c'Z');
      let charM: Char = new Char(c'm');
      let char0: Char = new Char(c'0');
      let charSpace: Char = new Char(c' ');
      let charPlus: Char = new Char(c'+');

      expect(charA.isLetter()).assertTrue();
      expect(charZ.isLetter()).assertTrue();
      expect(charM.isLetter()).assertTrue();
      expect(char0.isLetter()).assertFalse();
      expect(charSpace.isLetter()).assertFalse();
      expect(charPlus.isLetter()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0010
     * @tc.number  BUILTINS_DIGIT_TEST_0010
     * @tc.desc    Test isUpperCase static method with uppercase and non-uppercase values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
      expect(Char.isUpperCase(c'm')).assertFalse();
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'9')).assertFalse();
      expect(Char.isUpperCase(c' ')).assertFalse();
      expect(Char.isUpperCase(c'+')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0011
     * @tc.number  BUILTINS_DIGIT_TEST_0011
     * @tc.desc    Test isUpperCase instance method with uppercase and non-uppercase values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA: Char = new Char(c'A');
      let charZ: Char = new Char(c'Z');
      let charM: Char = new Char(c'M');
      let charLowerA: Char = new Char(c'a');
      let charLowerM: Char = new Char(c'm');
      let char0: Char = new Char(c'0');
      let charSpace: Char = new Char(c' ');

      expect(charA.isUpperCase()).assertTrue();
      expect(charZ.isUpperCase()).assertTrue();
      expect(charM.isUpperCase()).assertTrue();
      expect(charLowerA.isUpperCase()).assertFalse();
      expect(charLowerM.isUpperCase()).assertFalse();
      expect(char0.isUpperCase()).assertFalse();
      expect(charSpace.isUpperCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0012
     * @tc.number  BUILTINS_DIGIT_TEST_0012
     * @tc.desc    Test isLowerCase static method with lowercase and non-lowercase values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLowerCase(c'm')).assertTrue();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLowerCase(c'Z')).assertFalse();
      expect(Char.isLowerCase(c'M')).assertFalse();
      expect(Char.isLowerCase(c'0')).assertFalse();
      expect(Char.isLowerCase(c'9')).assertFalse();
      expect(Char.isLowerCase(c' ')).assertFalse();
      expect(Char.isLowerCase(c'+')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0013
     * @tc.number  BUILTINS_DIGIT_TEST_0013
     * @tc.desc    Test isLowerCase instance method with lowercase and non-lowercase values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA: Char = new Char(c'a');
      let charZ: Char = new Char(c'z');
      let charM: Char = new Char(c'm');
      let charUpperA: Char = new Char(c'A');
      let charUpperM: Char = new Char(c'M');
      let char0: Char = new Char(c'0');
      let charSpace: Char = new Char(c' ');

      expect(charA.isLowerCase()).assertTrue();
      expect(charZ.isLowerCase()).assertTrue();
      expect(charM.isLowerCase()).assertTrue();
      expect(charUpperA.isLowerCase()).assertFalse();
      expect(charUpperM.isLowerCase()).assertFalse();
      expect(char0.isLowerCase()).assertFalse();
      expect(charSpace.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0014
     * @tc.number  BUILTINS_DIGIT_TEST_0014
     * @tc.desc    Test toUpperCase static method converting lowercase to uppercase
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'm')).assertEqual(c'M');
      expect(Char.toUpperCase(c'h')).assertEqual(c'H');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'M')).assertEqual(c'M');
      expect(Char.toUpperCase(c'0')).assertEqual(c'0');
      expect(Char.toUpperCase(c'9')).assertEqual(c'9');
      expect(Char.toUpperCase(c' ')).assertEqual(c' ');
      expect(Char.toUpperCase(c'+')).assertEqual(c'+');
    });

    /**
     * @tc.name    builtinsDigitTest0015
     * @tc.number  BUILTINS_DIGIT_TEST_0015
     * @tc.desc    Test toUpperCase instance method converting lowercase instances to uppercase
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charLowerA: Char = new Char(c'a');
      let charLowerZ: Char = new Char(c'z');
      let charLowerH: Char = new Char(c'h');
      let charUpperA: Char = new Char(c'A');
      let charDigit: Char = new Char(c'5');
      let charSpace: Char = new Char(c' ');

      expect(charLowerA.toUpperCase().toChar()).assertEqual(c'A');
      expect(charLowerZ.toUpperCase().toChar()).assertEqual(c'Z');
      expect(charLowerH.toUpperCase().toChar()).assertEqual(c'H');
      expect(charUpperA.toUpperCase().toChar()).assertEqual(c'A');
      expect(charDigit.toUpperCase().toChar()).assertEqual(c'5');
      expect(charSpace.toUpperCase().toChar()).assertEqual(c' ');
    });

    /**
     * @tc.name    builtinsDigitTest0016
     * @tc.number  BUILTINS_DIGIT_TEST_0016
     * @tc.desc    Test toLowerCase static method converting uppercase to lowercase
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'M')).assertEqual(c'm');
      expect(Char.toLowerCase(c'H')).assertEqual(c'h');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'm')).assertEqual(c'm');
      expect(Char.toLowerCase(c'0')).assertEqual(c'0');
      expect(Char.toLowerCase(c'9')).assertEqual(c'9');
      expect(Char.toLowerCase(c' ')).assertEqual(c' ');
      expect(Char.toLowerCase(c'+')).assertEqual(c'+');
    });

    /**
     * @tc.name    builtinsDigitTest0017
     * @tc.number  BUILTINS_DIGIT_TEST_0017
     * @tc.desc    Test toLowerCase instance method converting uppercase instances to lowercase
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charUpperA: Char = new Char(c'A');
      let charUpperZ: Char = new Char(c'Z');
      let charUpperH: Char = new Char(c'H');
      let charLowerA: Char = new Char(c'a');
      let charDigit: Char = new Char(c'7');
      let charSpace: Char = new Char(c' ');

      expect(charUpperA.toLowerCase().toChar()).assertEqual(c'a');
      expect(charUpperZ.toLowerCase().toChar()).assertEqual(c'z');
      expect(charUpperH.toLowerCase().toChar()).assertEqual(c'h');
      expect(charLowerA.toLowerCase().toChar()).assertEqual(c'a');
      expect(charDigit.toLowerCase().toChar()).assertEqual(c'7');
      expect(charSpace.toLowerCase().toChar()).assertEqual(c' ');
    });

    /**
     * @tc.name    builtinsDigitTest0018
     * @tc.number  BUILTINS_DIGIT_TEST_0018
     * @tc.desc    Test isWhiteSpace static method with whitespace and non-whitespace values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isWhiteSpace(c'\n')).assertTrue();
      expect(Char.isWhiteSpace(c'\r')).assertTrue();
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isWhiteSpace(c'a')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
      expect(Char.isWhiteSpace(c'+')).assertFalse();
      expect(Char.isWhiteSpace(c'~')).assertFalse();
    });

    /**
     * @tc.name    builtinsDigitTest0019
     * @tc.number  BUILTINS_DIGIT_TEST_0019
     * @tc.desc    Test isWhiteSpace instance method with whitespace and non-whitespace instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDigitTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charSpace: Char = new Char(c' ');
      let charTab: Char = new Char(c'\t');
      let charNewline: Char = new Char(c'\n');
      let charA: Char = new Char(c'A');
      let char0: Char = new Char(c'0');
      let charPlus: Char = new Char(c'+');

      expect(charSpace.isWhiteSpace()).assertTrue();
      expect(charTab.isWhiteSpace()).assertTrue();
      expect(charNewline.isWhiteSpace()).assertTrue();
      expect(charA.isWhiteSpace()).assertFalse();
      expect(char0.isWhiteSpace()).assertFalse();
      expect(charPlus.isWhiteSpace()).assertFalse();
    });
  })
}