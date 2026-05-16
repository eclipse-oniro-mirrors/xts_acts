import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIsLowerConversionTest() {
  describe('builtinsIsLowerConversionTest', () => {
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
     * @tc.name    builtinsIsLowerConversionTest0001
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0001
     * @tc.desc    Test isLowerCase for basic lowercase letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charA: Char = c'a';
      const charM: Char = c'm';
      const charZ: Char = c'z';

      expect(charA.isLowerCase()).assertTrue();
      expect(charM.isLowerCase()).assertTrue();
      expect(charZ.isLowerCase()).assertTrue();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0002
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0002
     * @tc.desc    Test isLowerCase for uppercase letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charA: Char = c'A';
      const charM: Char = c'M';
      const charZ: Char = c'Z';

      expect(charA.isLowerCase()).assertFalse();
      expect(charM.isLowerCase()).assertFalse();
      expect(charZ.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0003
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0003
     * @tc.desc    Test isLowerCase for digit characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const char0: Char = c'0';
      const char5: Char = c'5';
      const char9: Char = c'9';

      expect(char0.isLowerCase()).assertFalse();
      expect(char5.isLowerCase()).assertFalse();
      expect(char9.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0004
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0004
     * @tc.desc    Test isLowerCase for special symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const atSymbol: Char = c'@';
      const hash: Char = c'#';
      const dollar: Char = c'$';
      const percent: Char = c'%';
      const ampersand: Char = c'&';

      expect(atSymbol.isLowerCase()).assertFalse();
      expect(hash.isLowerCase()).assertFalse();
      expect(dollar.isLowerCase()).assertFalse();
      expect(percent.isLowerCase()).assertFalse();
      expect(ampersand.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0005
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0005
     * @tc.desc    Test isLowerCase for punctuation characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const period: Char = c'.';
      const comma: Char = c',';
      const exclamation: Char = c'!';
      const question: Char = c'?';
      const semicolon: Char = c';';

      expect(period.isLowerCase()).assertFalse();
      expect(comma.isLowerCase()).assertFalse();
      expect(exclamation.isLowerCase()).assertFalse();
      expect(question.isLowerCase()).assertFalse();
      expect(semicolon.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0006
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0006
     * @tc.desc    Test isLowerCase for whitespace characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const space: Char = c' ';
      const newline: Char = c'\n';
      const tab: Char = c'\t';
      const carriageReturn: Char = c'\r';
      const backspace: Char = c'\b';
      const formFeed: Char = c'\f';
      const verticalTab: Char = c'\v';

      expect(space.isLowerCase()).assertFalse();
      expect(newline.isLowerCase()).assertFalse();
      expect(tab.isLowerCase()).assertFalse();
      expect(carriageReturn.isLowerCase()).assertFalse();
      expect(backspace.isLowerCase()).assertFalse();
      expect(formFeed.isLowerCase()).assertFalse();
      expect(verticalTab.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0007
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0007
     * @tc.desc    Test isLowerCase for boundary characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const beforeLowerA: Char = c'`';
      const afterLowerZ: Char = c'{';
      const beforeUpperA: Char = c'@';
      const afterUpperZ: Char = c'[';

      expect(beforeLowerA.isLowerCase()).assertFalse();
      expect(afterLowerZ.isLowerCase()).assertFalse();
      expect(beforeUpperA.isLowerCase()).assertFalse();
      expect(afterUpperZ.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0008
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0008
     * @tc.desc    Test isLowerCase for mathematical operators
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const plus: Char = c'+';
      const minus: Char = c'-';
      const multiply: Char = c'*';
      const divide: Char = c'/';
      const equals: Char = c'=';

      expect(plus.isLowerCase()).assertFalse();
      expect(minus.isLowerCase()).assertFalse();
      expect(multiply.isLowerCase()).assertFalse();
      expect(divide.isLowerCase()).assertFalse();
      expect(equals.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0009
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0009
     * @tc.desc    Test isLowerCase for bracket characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const parenOpen: Char = c'(';
      const parenClose: Char = c')';
      const bracketOpen: Char = c'[';
      const bracketClose: Char = c']';
      const braceOpen: Char = c'{';
      const braceClose: Char = c'}';

      expect(parenOpen.isLowerCase()).assertFalse();
      expect(parenClose.isLowerCase()).assertFalse();
      expect(bracketOpen.isLowerCase()).assertFalse();
      expect(bracketClose.isLowerCase()).assertFalse();
      expect(braceOpen.isLowerCase()).assertFalse();
      expect(braceClose.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0010
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0010
     * @tc.desc    Test isLowerCase for Unicode surrogate pairs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const highSurrogateMin: Char = c'\uD800';
      const highSurrogateMax: Char = c'\uDBFF';
      const lowSurrogateMin: Char = c'\uDC00';
      const lowSurrogateMax: Char = c'\uDFFF';

      expect(highSurrogateMin.isLowerCase()).assertFalse();
      expect(highSurrogateMax.isLowerCase()).assertFalse();
      expect(lowSurrogateMin.isLowerCase()).assertFalse();
      expect(lowSurrogateMax.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0011
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0011
     * @tc.desc    Test isLowerCase for char boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minValue: Char = c'\u0000';
      const maxValue: Char = c'\uFFFF';

      expect(minValue.isLowerCase()).assertFalse();
      expect(maxValue.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0012
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0012
     * @tc.desc    Test isLowerCase for BMP border characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const beforeBMPBorder: Char = c'\uFFFE';
      const atBMPBorder: Char = c'\uFFFF';

      expect(beforeBMPBorder.isLowerCase()).assertFalse();
      expect(atBMPBorder.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0013
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0013
     * @tc.desc    Test isLowerCase for character set performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testChars: Char[] = [
        c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
      c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c'@', c'#', c'$', c'%', c'&', c'*', c'(', c')', c'-', c'_'
      ];

      for (let i = 0; i < testChars.length; i++) {
        const ch: Char = testChars[i];
        const result: boolean = ch.isLowerCase();

        if (ch >= c'a' && ch <= c'z') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
      }
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0014
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0014
     * @tc.desc    Test isLowerCase for additional symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const tilde: Char = c'~';
      const caret: Char = c'^';
      const pipe: Char = c'|';
      const lessThan: Char = c'<';
      const greaterThan: Char = c'>';
      const colon: Char = c':';
      const slash: Char = c'/';
      const backtick: Char = c'`';
      const doubleQuote: Char = c'"';
      const singleQuote: Char = c'\'';
      const comma: Char = c',';
      const backslash: Char = c'\\';

      expect(tilde.isLowerCase()).assertFalse();
      expect(caret.isLowerCase()).assertFalse();
      expect(pipe.isLowerCase()).assertFalse();
      expect(lessThan.isLowerCase()).assertFalse();
      expect(greaterThan.isLowerCase()).assertFalse();
      expect(colon.isLowerCase()).assertFalse();
      expect(slash.isLowerCase()).assertFalse();
      expect(backtick.isLowerCase()).assertFalse();
      expect(doubleQuote.isLowerCase()).assertFalse();
      expect(singleQuote.isLowerCase()).assertFalse();
      expect(comma.isLowerCase()).assertFalse();
      expect(backslash.isLowerCase()).assertFalse();
    });
    /**
     * @tc.name    builtinsIsLowerConversionTest0015
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0015
     * @tc.desc    Test isLowerCase for extended ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extendedChar1: Char = c'\u0080';
      const extendedChar2: Char = c'\u00FF';
      const extendedChar3: Char = c'\u0100';

      expect(extendedChar1.isLowerCase()).assertFalse();
      expect(extendedChar2.isLowerCase()).assertFalse();
      expect(extendedChar3.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0016
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0016
     * @tc.desc    Test isLowerCase for char bit size compatibility
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charSizeBoundary1: Char = c'\u7FFF';
      const charSizeBoundary2: Char = c'\u8000';

      expect(charSizeBoundary1.isLowerCase()).assertFalse();
      expect(charSizeBoundary2.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0017
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0017
     * @tc.desc    Test isLowerCase for escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bell: Char = c'\u0007';
      const backspace: Char = c'\u0008';
      const formFeed: Char = c'\u000C';
      const newline: Char = c'\u000A';
      const carriageReturn: Char = c'\u000D';
      const horizontalTab: Char = c'\u0009';
      const verticalTab: Char = c'\u000B';
      const backslash: Char = c'\u005C';
      const singleQuote: Char = c'\u0027';
      const doubleQuote: Char = c'\u0022';
      const questionMark: Char = c'\u003F';

      expect(bell.isLowerCase()).assertFalse();
      expect(backspace.isLowerCase()).assertFalse();
      expect(formFeed.isLowerCase()).assertFalse();
      expect(newline.isLowerCase()).assertFalse();
      expect(carriageReturn.isLowerCase()).assertFalse();
      expect(horizontalTab.isLowerCase()).assertFalse();
      expect(verticalTab.isLowerCase()).assertFalse();
      expect(backslash.isLowerCase()).assertFalse();
      expect(singleQuote.isLowerCase()).assertFalse();
      expect(doubleQuote.isLowerCase()).assertFalse();
      expect(questionMark.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0018
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0018
     * @tc.desc    Test isLowerCase for emoji Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojiChars: Char[] = [
        c'\uD83D', c'\uDC46',
      c'\uD83D', c'\uDC7F',
      c'\uD83D', c'\uDC40',
      c'\uD83D', c'\uDCAF',
      c'\uD83C', c'\uDF85',
      c'\uD83D', c'\uDE3C',
      c'\uD83D', c'\uDD27',
      c'\uD83D', c'\uDC87',
      c'\uD83E', c'\uDD3C',
      c'\u200D',
      c'\u2642',
      c'\uFE0F',
      c'\uD83D', c'\uDEE2',
      c'\uD83C', c'\uDC04',
      c'\uD83C', c'\uDFF4'
      ];

      emojiChars.forEach((ch, index) => {
        expect(ch.isLowerCase()).assertFalse();
      });
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0019
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0019
     * @tc.desc    Test isLowerCase for illegal Unicode encodings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const illegalUnicode1: Char = c'\uDC04';
      const illegalUnicode2: Char = c'\uD83D';

      expect(illegalUnicode1.isLowerCase()).assertFalse();
      expect(illegalUnicode2.isLowerCase()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0020
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0020
     * @tc.desc    Test isLowerCase for special character sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialSequences: Char[] = [
        c'$', c'!', c'"', c'#', c'\\', c'(', c')', c'%', c'&',
      c'"', c'(', c')', c'^', c'*', c'+', c',', c'$', c'-',
      c'.', c'/', c':', c'<', c'=', c'>', c'?', c'@', c'[',
      c'\\', c']', c'^', c'$', c'{', c'|', c'}', c'~'
      ];

      specialSequences.forEach((ch, index) => {
        expect(ch.isLowerCase()).assertFalse();
      });
    });

    /**
     * @tc.name    builtinsIsLowerConversionTest0021
     * @tc.number  BUILTINS_IS_LOWER_CONVERSION_TEST_0021
     * @tc.desc    Test isLowerCase for keyword characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsLowerConversionTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zeroChar: Char = c'0';
      const nChar: Char = c'N';
      const aChar: Char = c'a';
      const nLowerChar: Char = c'n';

      expect(zeroChar.isLowerCase()).assertFalse();
      expect(nChar.isLowerCase()).assertFalse();
      expect(aChar.isLowerCase()).assertTrue();
      expect(nLowerChar.isLowerCase()).assertTrue();
    });
  });
}
