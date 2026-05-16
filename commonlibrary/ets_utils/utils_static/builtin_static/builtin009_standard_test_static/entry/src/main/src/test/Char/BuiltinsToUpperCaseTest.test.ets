import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsToUpperCaseTest() {
  describe("builtinsToUpperCaseTest", () => {
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
     * @tc.name    builtinsToUpperCaseTest0001
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0001
     * @tc.desc    Test toUpperCase with CHAR_BIT_SIZE valid range (lowercase 'a' to 'A' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToUpperCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const lowercaseA = new Char(c'a');
      const uppercaseA = lowercaseA.toUpperCase();
      expect(uppercaseA).assertEqual(new Char(c'A'));
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0002
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0002
     * @tc.desc    Test toUpperCase with MAX_CODE_POINT valid mapped char (non-letter char, no change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonLetterChar = new Char(c'\uFFFF');
      const convertedChar = nonLetterChar.toUpperCase();
      expect(convertedChar).assertEqual(nonLetterChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0003
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0003
     * @tc.desc    Test toUpperCase with HIGH_SURROGATE_MIN (\uD800, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      const convertedChar = highSurrogateMinChar.toUpperCase();
      expect(convertedChar).assertEqual(highSurrogateMinChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0004
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0004
     * @tc.desc    Test toUpperCase with HIGH_SURROGATE_MAX (\uDBFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      const convertedChar = highSurrogateMaxChar.toUpperCase();
      expect(convertedChar).assertEqual(highSurrogateMaxChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0005
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0005
     * @tc.desc    Test toUpperCase with LOW_SURROGATE_MIN (\uDC00, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      const convertedChar = lowSurrogateMinChar.toUpperCase();
      expect(convertedChar).assertEqual(lowSurrogateMinChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0006
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0006
     * @tc.desc    Test toUpperCase with LOW_SURROGATE_MAX (\uDFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      const convertedChar = lowSurrogateMaxChar.toUpperCase();
      expect(convertedChar).assertEqual(lowSurrogateMaxChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0007
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0007
     * @tc.desc    Test toUpperCase with BMP_BORDER below (0xFFFE, valid BMP char, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      const convertedChar = bmpBelowChar.toUpperCase();
      expect(convertedChar).assertEqual(bmpBelowChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0008
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0008
     * @tc.desc    Test toUpperCase with BMP_BORDER mapped valid char (lowercase 'z' to 'Z')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToUpperCaseTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const lowercaseZ = new Char(c'z');
      const uppercaseZ = lowercaseZ.toUpperCase();
      expect(uppercaseZ).assertEqual(new Char(c'Z'));
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0009
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0009
     * @tc.desc    Test toUpperCase with MIN_VALUE (\u0000, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      const convertedChar = minValueChar.toUpperCase();
      expect(convertedChar).assertEqual(minValueChar);
    });

    /**
     * @tc.name    builtinsToUpperCaseTest0010
     * @tc.number  BUILTINS_TO_UPPER_CASE_TEST_0010
     * @tc.desc    Test toUpperCase with MAX_VALUE (\uFFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToUpperCaseTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      const convertedChar = maxValueChar.toUpperCase();
      expect(convertedChar).assertEqual(maxValueChar);
    });

  })
}