import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsToLowerCaseTest() {
  describe("builtinsToLowerCaseTest", () => {
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
     * @tc.name    builtinsToLowerCaseTest0001
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0001
     * @tc.desc    Test toLowerCase with CHAR_BIT_SIZE valid range (uppercase 'A' to 'a' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToLowerCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercaseA = new Char(c'A');
      const lowercaseA = uppercaseA.toLowerCase();
      expect(lowercaseA).assertEqual(new Char(c'a'));
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0002
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0002
     * @tc.desc    Test toLowerCase with MAX_CODE_POINT valid mapped char (non-letter char, no change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonLetterChar = new Char(c'\uFFFF');
      const convertedChar = nonLetterChar.toLowerCase();
      expect(convertedChar).assertEqual(nonLetterChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0003
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0003
     * @tc.desc    Test toLowerCase with HIGH_SURROGATE_MIN (\uD800, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      const convertedChar = highSurrogateMinChar.toLowerCase();
      expect(convertedChar).assertEqual(highSurrogateMinChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0004
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0004
     * @tc.desc    Test toLowerCase with HIGH_SURROGATE_MAX (\uDBFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      const convertedChar = highSurrogateMaxChar.toLowerCase();
      expect(convertedChar).assertEqual(highSurrogateMaxChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0005
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0005
     * @tc.desc    Test toLowerCase with LOW_SURROGATE_MIN (\uDC00, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      const convertedChar = lowSurrogateMinChar.toLowerCase();
      expect(convertedChar).assertEqual(lowSurrogateMinChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0006
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0006
     * @tc.desc    Test toLowerCase with LOW_SURROGATE_MAX (\uDFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      const convertedChar = lowSurrogateMaxChar.toLowerCase();
      expect(convertedChar).assertEqual(lowSurrogateMaxChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0007
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0007
     * @tc.desc    Test toLowerCase with BMP_BORDER below (0xFFFE, valid BMP char, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      const convertedChar = bmpBelowChar.toLowerCase();
      expect(convertedChar).assertEqual(bmpBelowChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0008
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0008
     * @tc.desc    Test toLowerCase with BMP_BORDER mapped valid char (uppercase 'Z' to 'z')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsToLowerCaseTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercaseZ = new Char(c'Z');
      const lowercaseZ = uppercaseZ.toLowerCase();
      expect(lowercaseZ).assertEqual(new Char(c'z'));
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0009
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0009
     * @tc.desc    Test toLowerCase with MIN_VALUE (\u0000, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      const convertedChar = minValueChar.toLowerCase();
      expect(convertedChar).assertEqual(minValueChar);
    });

    /**
     * @tc.name    builtinsToLowerCaseTest0010
     * @tc.number  BUILTINS_TO_LOWER_CASE_TEST_0010
     * @tc.desc    Test toLowerCase with MAX_VALUE (\uFFFF, no case change)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsToLowerCaseTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      const convertedChar = maxValueChar.toLowerCase();
      expect(convertedChar).assertEqual(maxValueChar);
    });
  })
}