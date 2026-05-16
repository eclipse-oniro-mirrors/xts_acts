import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsIsHexDigitTest() {
  describe("builtinsIsHexDigitTest", () => {
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
     * @tc.name    builtinsIsHexDigitTest0001
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0001
     * @tc.desc    Test isHexDigit with CHAR_BIT_SIZE valid range (hex '0' in 16-bit range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsHexDigitTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validHex0 = new Char(c'0');
      expect(validHex0.isHexDigit()).assertTrue();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0002
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0002
     * @tc.desc    Test isHexDigit with MAX_CODE_POINT valid mapped char (non-hex char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nonHexChar = new Char(c'\uFFFF');
      expect(nonHexChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0003
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0003
     * @tc.desc    Test isHexDigit with HIGH_SURROGATE_MIN (\uD800)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMinChar = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogateMinChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0004
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0004
     * @tc.desc    Test isHexDigit with HIGH_SURROGATE_MAX (\uDBFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const highSurrogateMaxChar = new Char(Char.HIGH_SURROGATE_MAX);
      expect(highSurrogateMaxChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0005
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0005
     * @tc.desc    Test isHexDigit with LOW_SURROGATE_MIN (\uDC00)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMinChar = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogateMinChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0006
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0006
     * @tc.desc    Test isHexDigit with LOW_SURROGATE_MAX (\uDFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lowSurrogateMaxChar = new Char(Char.LOW_SURROGATE_MAX);
      expect(lowSurrogateMaxChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0007
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0007
     * @tc.desc    Test isHexDigit with BMP_BORDER below (0xFFFE, valid BMP char)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bmpBelowChar = new Char(c'\uFFFE');
      expect(bmpBelowChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0008
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0008
     * @tc.desc    Test isHexDigit with BMP_BORDER mapped valid char (hex 'f')
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsIsHexDigitTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpAboveHexF = new Char(c'f');
      expect(bmpAboveHexF.isHexDigit()).assertTrue();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0009
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0009
     * @tc.desc    Test isHexDigit with MIN_VALUE (\u0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValueChar = new Char(Char.MIN_VALUE);
      expect(minValueChar.isHexDigit()).assertFalse();
    });

    /**
     * @tc.name    builtinsIsHexDigitTest0010
     * @tc.number  BUILTINS_IS_HEX_DIGIT_TEST_0010
     * @tc.desc    Test isHexDigit with MAX_VALUE (\uFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsIsHexDigitTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValueChar = new Char(Char.MAX_VALUE);
      expect(maxValueChar.isHexDigit()).assertFalse();
    });

  })
}