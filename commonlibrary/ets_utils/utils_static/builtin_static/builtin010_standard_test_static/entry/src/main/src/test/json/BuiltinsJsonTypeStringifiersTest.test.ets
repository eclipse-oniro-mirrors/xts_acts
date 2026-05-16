import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsJsonTypeStringifiersTest() {
  describe('BuiltinsJsonTypeStringifiersTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
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
     * @tc.name  builtinsJsonTypeStringifiersTest0001
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0001
     * @tc.desc  Test JSON.stringify with basic byte value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteValue: byte = 42;
      const result = JSON.stringify(byteValue);

      expect(result).assertEqual("42");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0002
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0002
     * @tc.desc  Test JSON.stringify with byte value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: byte = 0;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0003
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0003
     * @tc.desc  Test JSON.stringify with negative byte value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: byte = -42;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-42");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0004
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0004
     * @tc.desc  Test JSON.stringify with byte minimum boundary -128
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minByte: byte = -128;
      const result = JSON.stringify(minByte);

      expect(result).assertEqual("-128");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0005
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0005
     * @tc.desc  Test JSON.stringify with byte maximum boundary 127
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxByte: byte = 127;
      const result = JSON.stringify(maxByte);

      expect(result).assertEqual("127");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0006
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0006
     * @tc.desc  Test JSON.stringify preserves byte value precision across full range
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: byte[] = [-127, -64, -2, 2, 64, 126];
      const expected: string[] = ["-127", "-64", "-2", "2", "64", "126"];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0007
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0007
     * @tc.desc  Test JSON.stringify with extreme negative range -128 to -120
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremeNegatives: byte[] = [-128, -127, -126, -125, -124, -123, -122, -121, -120];

      for (let i = 0; i < extremeNegatives.length; i++) {
        const val: byte = extremeNegatives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0008
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0008
     * @tc.desc  Test JSON.stringify with positive mid-range values 50-80
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRange: byte[] = [50, 55, 60, 65, 70, 75, 80];

      for (let i = 0; i < midRange.length; i++) {
        const val: byte = midRange[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0009
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0009
     * @tc.desc  Test JSON.stringify with negative mid-range values -80 to -50
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRangeNeg: byte[] = [-80, -75, -70, -65, -60, -55, -50];

      for (let i = 0; i < midRangeNeg.length; i++) {
        const val: byte = midRangeNeg[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0010
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0010
     * @tc.desc  Test JSON.stringify with single digit byte values -9 to 9
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const singleDigits: byte[] = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

      for (let i = 0; i < singleDigits.length; i++) {
        const val: byte = singleDigits[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0011
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0011
     * @tc.desc  Test JSON.stringify returns String type with correct length
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testBytes: byte[] = [-128, -100, -10, -1, 0, 1, 10, 100, 127];
      const expectedLens: number[] = [4, 4, 3, 2, 1, 1, 2, 3, 3];

      for (let i = 0; i < testBytes.length; i++) {
        const byteVal: byte = testBytes[i];
        const result = JSON.stringify(byteVal);

        expect(typeof result).assertEqual("string");
        expect(result.length).assertEqual(expectedLens[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0012
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0012
     * @tc.desc  Comprehensive validation of JSON.stringify byte conversion with length and sign checks
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validationSet: byte[] = [-128, -96, -48, -16, -2, 3, 15, 31, 63, 95, 111, 127];
      const expectedStr: string[] = ["-128", "-96", "-48", "-16", "-2", "3", "15", "31", "63", "95", "111", "127"];
      const expectedLen: number[] = [4, 3, 3, 3, 2, 1, 2, 2, 2, 2, 3, 3];

      for (let i = 0; i < validationSet.length; i++) {
        const input: byte = validationSet[i];
        const actual: string = JSON.stringify(input);

        expect(actual).assertEqual(expectedStr[i]);
        expect(actual.length).assertEqual(expectedLen[i]);

        const containsDash: boolean = actual.indexOf("-") >= 0;
        expect(containsDash).assertEqual(input < 0);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0013
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0013
     * @tc.desc  Test JSON.stringify with basic short value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortValue: short = 30000;
      const result = JSON.stringify(shortValue);

      expect(result).assertEqual("30000");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0014
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0014
     * @tc.desc  Test JSON.stringify with short value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: short = 0;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0015
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0015
     * @tc.desc  Test JSON.stringify with negative short value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: short = -15000;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-15000");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0016
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0016
     * @tc.desc  Test JSON.stringify with short minimum boundary -32768
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minShort: short = -32768;
      const result = JSON.stringify(minShort);

      expect(result).assertEqual("-32768");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0017
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0017
     * @tc.desc  Test JSON.stringify with short maximum boundary 32767
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxShort: short = 32767;
      const result = JSON.stringify(maxShort);

      expect(result).assertEqual("32767");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0018
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0018
     * @tc.desc  Test JSON.stringify preserves short value precision across key points
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: short[] = [-32767, -16384, -256, 256, 16384, 32766];
      const expected: string[] = ["-32767", "-16384", "-256", "256", "16384", "32766"];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0019
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0019
     * @tc.desc  Test JSON.stringify with extreme negative range -32768 to -32760
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremeNegatives: short[] = [-32768, -32767, -32766, -32765, -32764, -32763, -32762, -32761, -32760];

      for (let i = 0; i < extremeNegatives.length; i++) {
        const val: short = extremeNegatives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0020
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0020
     * @tc.desc  Test JSON.stringify with positive mid-range values 10000-20000
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRange: short[] = [10000, 12000, 14000, 16000, 18000, 20000];

      for (let i = 0; i < midRange.length; i++) {
        const val: short = midRange[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0021
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0021
     * @tc.desc  Test JSON.stringify with negative mid-range values -20000 to -10000
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRangeNeg: short[] = [-20000, -18000, -16000, -14000, -12000, -10000];

      for (let i = 0; i < midRangeNeg.length; i++) {
        const val: short = midRangeNeg[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0022
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0022
     * @tc.desc  Test JSON.stringify with small short values -9 to 9
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const smallValues: short[] = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

      for (let i = 0; i < smallValues.length; i++) {
        const val: short = smallValues[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0023
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0023
     * @tc.desc  Test JSON.stringify returns String type with correct length
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testShorts: short[] = [-32768, -10000, -100, -1, 0, 1, 100, 10000, 32767];
      const expectedLens: number[] = [6, 6, 4, 2, 1, 1, 3, 5, 5];

      for (let i = 0; i < testShorts.length; i++) {
        const shortVal: short = testShorts[i];
        const result = JSON.stringify(shortVal);

        expect(typeof result).assertEqual("string");
        expect(result.length).assertEqual(expectedLens[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0024
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0024
     * @tc.desc  Comprehensive validation of JSON.stringify short conversion
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validationSet: short[] = [-32768, -16384, -4096, -256, -16, -2, 3, 15, 127, 1024, 8192, 32767];
      const expectedStr: string[] = ["-32768", "-16384", "-4096", "-256", "-16", "-2", "3", "15", "127", "1024", "8192", "32767"];
      const expectedLen: number[] = [6, 6, 5, 4, 3, 2, 1, 2, 3, 4, 4, 5];

      for (let i = 0; i < validationSet.length; i++) {
        const input: short = validationSet[i];
        const actual: string = JSON.stringify(input);

        expect(actual).assertEqual(expectedStr[i]);
        expect(actual.length).assertEqual(expectedLen[i]);

        const containsDash: boolean = actual.indexOf("-") >= 0;
        expect(containsDash).assertEqual(input < 0);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0025
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0025
     * @tc.desc  Test JSON.stringify with basic int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intValue: int = 1234567890;
      const result = JSON.stringify(intValue);

      expect(result).assertEqual("1234567890");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0026
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0026
     * @tc.desc  Test JSON.stringify with int value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: int = 0;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0027
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0027
     * @tc.desc  Test JSON.stringify with negative int value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: int = -987654321;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-987654321");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0028
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0028
     * @tc.desc  Test JSON.stringify with int minimum boundary -2147483648
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minInt: int = -2147483648;
      const result = JSON.stringify(minInt);

      expect(result).assertEqual("-2147483648");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0029
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0029
     * @tc.desc  Test JSON.stringify with int maximum boundary 2147483647
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxInt: int = 2147483647;
      const result = JSON.stringify(maxInt);

      expect(result).assertEqual("2147483647");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0030
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0030
     * @tc.desc  Test JSON.stringify preserves int value precision across key points
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: int[] = [-2147483647, -1073741824, -65536, 65536, 1073741823, 2147483646];
      const expected: string[] = ["-2147483647", "-1073741824", "-65536", "65536", "1073741823", "2147483646"];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0031
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0031
     * @tc.desc  Test JSON.stringify with extreme negative range near minimum boundary
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremeNegatives: int[] = [-2147483648, -2147483647, -2147483646, -2147483645, -2147483644];

      for (let i = 0; i < extremeNegatives.length; i++) {
        const val: int = extremeNegatives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0032
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0032
     * @tc.desc  Test JSON.stringify with positive mid-range values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRange: int[] = [1000000, 500000000, 1000000000, 1500000000, 2000000000];

      for (let i = 0; i < midRange.length; i++) {
        const val: int = midRange[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0033
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0033
     * @tc.desc  Test JSON.stringify with negative mid-range values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRangeNeg: int[] = [-2000000000, -1500000000, -1000000000, -500000000, -1000000];

      for (let i = 0; i < midRangeNeg.length; i++) {
        const val: int = midRangeNeg[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0034
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0034
     * @tc.desc  Test JSON.stringify with small int values -9 to 9
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const smallValues: int[] = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

      for (let i = 0; i < smallValues.length; i++) {
        const val: int = smallValues[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0035
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0035
     * @tc.desc  Test JSON.stringify returns String type with correct length
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testInts: int[] = [-2147483648, -1000000000, -1000000, -1, 0, 1, 1000000, 1000000000, 2147483647];
      const expectedLens: number[] = [11, 11, 8, 2, 1, 1, 7, 10, 10];

      for (let i = 0; i < testInts.length; i++) {
        const intVal: int = testInts[i];
        const result = JSON.stringify(intVal);

        expect(typeof result).assertEqual("string");
        expect(result.length).assertEqual(expectedLens[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0036
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0036
     * @tc.desc  Test JSON.stringify with extreme positive range near maximum boundary
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremePositives: int[] = [2147483647, 2147483646, 2147483645, 2147483644, 2147483643];

      for (let i = 0; i < extremePositives.length; i++) {
        const val: int = extremePositives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0037
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0037
     * @tc.desc  Test JSON.stringify correctly adds minus sign for all negative ints
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negativeSamples: int[] = [-2147483648, -1000000, -1];

      for (let i = 0; i < negativeSamples.length; i++) {
        const val: int = negativeSamples[i];
        const result = JSON.stringify(val);

        expect(result.indexOf("-") >= 0).assertTrue();
        expect(result).assertEqual(val.toString());
      }

      const positiveSamples: int[] = [1, 1000000, 2147483647];

      for (let i = 0; i < positiveSamples.length; i++) {
        const val: int = positiveSamples[i];
        const result = JSON.stringify(val);

        expect(result.indexOf("-") >= 0).assertFalse();
        expect(result).assertEqual(val.toString());
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0038
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0038
     * @tc.desc  Test JSON.stringify with basic long value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longValue: bigint = 9223372036854775807n;
      const result = JSON.stringify(longValue);

      expect(result).assertEqual("9223372036854775807");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0039
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0039
     * @tc.desc  Test JSON.stringify with long value 0
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: bigint = 0n;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0040
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0040
     * @tc.desc  Test JSON.stringify with negative long value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: bigint = -9223372036854775808n;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0041
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0041
     * @tc.desc  Test JSON.stringify preserves long value precision across key power-of-two points
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: bigint[] = [-9223372036854775808n, -4611686018427387904n, -2147483648n, 2147483647n, 4611686018427387903n, 9223372036854775806n];
      const expected: string[] = ["-9223372036854775808", "-4611686018427387904", "-2147483648", "2147483647", "4611686018427387903", "9223372036854775806"];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);

        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0042
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0042
     * @tc.desc  Test JSON.stringify with extreme negative range near minimum boundary
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremeNegatives: bigint[] = [-9223372036854775808n, -9223372036854775807n, -9223372036854775806n, -9223372036854775805n, -9223372036854775804n];

      for (let i = 0; i < extremeNegatives.length; i++) {
        const val: bigint = extremeNegatives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0043
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0043
     * @tc.desc  Test JSON.stringify with positive mid-range large values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRange: bigint[] = [1000000000000n, 10000000000000n, 100000000000000n, 1000000000000000n, 10000000000000000n, 100000000000000000n];

      for (let i = 0; i < midRange.length; i++) {
        const val: bigint = midRange[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0044
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0044
     * @tc.desc  Test JSON.stringify with negative mid-range large values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const midRangeNeg: bigint[] = [-100000000000000000n, -10000000000000000n, -1000000000000000n, -100000000000000n, -10000000000000n, -1000000000000n];

      for (let i = 0; i < midRangeNeg.length; i++) {
        const val: bigint = midRangeNeg[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0045
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0045
     * @tc.desc  Test JSON.stringify with small long values -9 to 9
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const smallValues: bigint[] = [-9n, -8n, -7n, -6n, -5n, -4n, -3n, -2n, -1n, 0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n];

      for (let i = 0; i < smallValues.length; i++) {
        const val: bigint = smallValues[i];
        const result = JSON.stringify(val);
        const expected = val.toString();

        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0046
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0046
     * @tc.desc  Test JSON.stringify returns String type with correct length for long values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testLongs: bigint[] = [-9223372036854775808n, -1000000000000000000n, -1n, 0n, 1n, 1000000000000000000n, 9223372036854775807n];
      const expectedLens: number[] = [20, 20, 2, 1, 1, 19, 19];

      for (let i = 0; i < testLongs.length; i++) {
        const longVal: bigint = testLongs[i];
        const result = JSON.stringify(longVal);

        expect(typeof result).assertEqual("string");
        expect(result.length).assertEqual(expectedLens[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0047
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0047
     * @tc.desc  Comprehensive validation of JSON.stringify long conversion
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validationSet: bigint[] = [-9223372036854775808n, -4611686018427387904n, -2147483648n, -1n, 0n, 1n, 2147483647n, 4611686018427387903n, 9223372036854775807n];
      const expectedStr: string[] = ["-9223372036854775808", "-4611686018427387904", "-2147483648", "-1", "0", "1", "2147483647", "4611686018427387903", "9223372036854775807"];
      const expectedLen: number[] = [20, 20, 11, 2, 1, 1, 10, 19, 19];

      for (let i = 0; i < validationSet.length; i++) {
        const input: bigint = validationSet[i];
        const actual: string = JSON.stringify(input);

        expect(actual).assertEqual(expectedStr[i]);
        expect(actual.length).assertEqual(expectedLen[i]);

        const containsDash: boolean = actual.indexOf("-") >= 0;
        expect(containsDash).assertEqual(input < 0);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0048
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0048
     * @tc.desc  Test JSON.stringify with extreme positive range near maximum boundary
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const extremePositives: bigint[] = [9223372036854775807n, 9223372036854775806n, 9223372036854775805n, 9223372036854775804n, 9223372036854775803n];

      for (let i = 0; i < extremePositives.length; i++) {
        const val: bigint = extremePositives[i];
        const result = JSON.stringify(val);
        const expected = val.toString();
        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0049
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0049
     * @tc.desc  Test JSON.stringify correctly handles minus sign for all long values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negativeSamples: bigint[] = [-9223372036854775808n, -1n, -4611686018427387904n];

      for (let i = 0; i < negativeSamples.length; i++) {
        const val: bigint = negativeSamples[i];
        const result = JSON.stringify(val);
        expect(result.indexOf("-") >= 0).assertTrue();
        expect(result).assertEqual(val.toString());
      }

      const positiveSamples: bigint[] = [1n, 4611686018427387903n, 9223372036854775807n];

      for (let i = 0; i < positiveSamples.length; i++) {
        const val: bigint = positiveSamples[i];
        const result = JSON.stringify(val);
        expect(result.indexOf("-") >= 0).assertFalse();
        expect(result).assertEqual(val.toString());
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0050
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0050
     * @tc.desc  Test JSON.stringify with basic float value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatValue: float = 3.14159f;
      const result = JSON.stringify(floatValue);

      expect(result).assertEqual("3.14159");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0051
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0051
     * @tc.desc  Test JSON.stringify with float zero value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: float = 0.0f;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0052
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0052
     * @tc.desc  Test JSON.stringify with negative float value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: float = -2.71828f;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-2.71828");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0053
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0053
     * @tc.desc  Test JSON.stringify with float maximum boundary (note precision loss)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxFloat: float = Double.toFloat(3.4028234663852886e38);
      const result = JSON.stringify(maxFloat);

      expect(result).assertEqual("3.4028235e+38");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0054
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0054
     * @tc.desc  Test JSON.stringify with float minimum boundary 1.40129846432481707e-45
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minFloat: float = 1.40129846432481707e-45f;
      const result = JSON.stringify(minFloat);

      expect(result).assertEqual("1e-45");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0055
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0055
     * @tc.desc  Test JSON.stringify with float Infinity (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inf: float = Double.toFloat(Infinity);
      const result = JSON.stringify(inf);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0056
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0056
     * @tc.desc  Test JSON.stringify with float -Infinity (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negInf: float = Double.toFloat(-Infinity);
      const result = JSON.stringify(negInf);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0057
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0057
     * @tc.desc  Test JSON.stringify with float NaN (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nan: float = Double.toFloat(NaN);
      const result = JSON.stringify(nan);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0058
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0058
     * @tc.desc  Test JSON.stringify with float scientific notation values (note representation conversion)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sciValues: float[] = [
        Double.toFloat(1.2e-10),
        Double.toFloat(2.5e-5),
        Double.toFloat(3.4e38),
        Double.toFloat(1.5e-38)
      ];
      const expected: string[] = [
        "1.2e-10",
        "0.000025",
        "3.4e+38",
        "1.5e-38"
      ];

      for (let i = 0; i < sciValues.length; i++) {
        const result = JSON.stringify(sciValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0059
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0059
     * @tc.desc  Test JSON.stringify preserves float precision for 6-7 significant digits
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: float[] = [
        Double.toFloat(0.123456789),
        Double.toFloat(-0.123456789),
        Double.toFloat(123.456789),
        Double.toFloat(-123.456789)
      ];
      const expected: string[] = [
        "0.12345679",
        "-0.12345679",
        "123.45679",
        "-123.45679"
      ];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0060
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0060
     * @tc.desc  Test JSON.stringify with float -0 (should return "0")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negZero: float = -0.0f;
      const result = JSON.stringify(negZero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0061
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0061
     * @tc.desc  Test JSON.stringify with basic double value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleValue: double = 3.141592653589793;
      const result = JSON.stringify(doubleValue);

      expect(result).assertEqual("3.141592653589793");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0062
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0062
     * @tc.desc  Test JSON.stringify with double zero value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: double = 0.0;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0063
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0063
     * @tc.desc  Test JSON.stringify with negative double value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: double = -2.718281828459045;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-2.718281828459045");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0064
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0064
     * @tc.desc  Test JSON.stringify with double maximum boundary 1.7976931348623157e308
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxDouble: double = 1.7976931348623157e308;
      const result = JSON.stringify(maxDouble);

      expect(result).assertEqual("1.7976931348623157e+308");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0065
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0065
     * @tc.desc  Test JSON.stringify with double minimum boundary 5e-324
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minDouble: double = 5e-324;
      const result = JSON.stringify(minDouble);

      expect(result).assertEqual("5e-324");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0066
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0066
     * @tc.desc  Test JSON.stringify with double Infinity (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inf: double = Infinity;
      const result = JSON.stringify(inf);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0067
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0067
     * @tc.desc  Test JSON.stringify with double -Infinity (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negInf: double = -Infinity;
      const result = JSON.stringify(negInf);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0068
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0068
     * @tc.desc  Test JSON.stringify with double NaN (should return "null")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nan: double = NaN;
      const result = JSON.stringify(nan);

      expect(result).assertEqual("null");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0069
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0069
     * @tc.desc  Test JSON.stringify with double scientific notation values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sciValues: double[] = [1.234567890123456e-10, 2.5e-50, 1.234567890123456e50];
      const expected: string[] = ["1.234567890123456e-10", "2.5e-50", "1.234567890123456e+50"];

      for (let i = 0; i < sciValues.length; i++) {
        const result = JSON.stringify(sciValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0070
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0070
     * @tc.desc  Test JSON.stringify preserves double precision for 15-digit values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: double[] = [0.123456789012345, -0.123456789012345, 123456789012.345, -123456789012.345];
      const expected: string[] = ["0.123456789012345", "-0.123456789012345", "123456789012.345", "-123456789012.345"];

      for (let i = 0; i < testValues.length; i++) {
        const result = JSON.stringify(testValues[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0071
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0071
     * @tc.desc  Test JSON.stringify with double -0 (should return "0")
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negZero: double = -0.0;
      const result = JSON.stringify(negZero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0072
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0072
     * @tc.desc  Test JSON.stringify with basic bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintValue: bigint = 9007199254740991n;
      const result = JSON.stringify(bigintValue);

      expect(result).assertEqual("9007199254740991");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0073
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0073
     * @tc.desc  Test JSON.stringify with bigint zero value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: bigint = 0n;
      const result = JSON.stringify(zero);

      expect(result).assertEqual("0");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0074
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0074
     * @tc.desc  Test JSON.stringify with negative bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negative: bigint = -9007199254740991n;
      const result = JSON.stringify(negative);

      expect(result).assertEqual("-9007199254740991");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0075
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0075
     * @tc.desc  Test JSON.stringify with extremely large bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeValue: bigint = 9223372036854775807123456789n;
      const result = JSON.stringify(largeValue);

      expect(result).assertEqual("9223372036854775807123456789");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0076
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0076
     * @tc.desc  Test JSON.stringify with large bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexBigint: bigint = BigInt("160456018070528910107");
      const result = JSON.stringify(hexBigint);

      expect(result).assertEqual("160456018070528910107");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0077
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0077
     * @tc.desc  Test JSON.stringify with medium-large bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const binaryBigint: bigint = 6148914691236517206n;
      const result = JSON.stringify(binaryBigint);

      expect(result).assertEqual("6148914691236517206");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0078
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0078
     * @tc.desc  Test JSON.stringify with large bigint value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const octalBigint: bigint = BigInt("14604232723076937013194123847511");
      const result = JSON.stringify(octalBigint);

      expect(result).assertEqual("14604232723076937013194123847511");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0079
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0079
     * @tc.desc  Test JSON.stringify with bigint from arithmetic operations
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: bigint = 123456789012345678901n;
      const b: bigint = 987654321098765432109n;
      const sum: bigint = a + b;
      const result = JSON.stringify(sum);

      expect(result).assertEqual("1111111110111111111010");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0080
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0080
     * @tc.desc  Test JSON.stringify with bigint that looks like scientific notation in string
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sciLikeBigint: bigint = 123456789012345678901234567890n;
      const result = JSON.stringify(sciLikeBigint);

      expect(result).assertEqual("123456789012345678901234567890");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0081
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0081
     * @tc.desc  Test JSON.stringify with bigint from power operation
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const powerBigint: bigint = 2n ** 100n;
      const result = JSON.stringify(powerBigint);

      expect(result).assertEqual("1267650600228229401496703205376");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0082
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0082
     * @tc.desc  Test JSON.stringify returns String type with correct length for bigint values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testBigints: bigint[] = [1n, 9007199254740991n, 9223372036854775807n, 123456789012345678901234567890n];
      const expectedLens: number[] = [1, 16, 19, 30];

      for (let i = 0; i < testBigints.length; i++) {
        const bigintVal: bigint = testBigints[i];
        const result = JSON.stringify(bigintVal);

        expect(typeof result).assertEqual("string");
        expect(result.length).assertEqual(expectedLens[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0083
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0083
     * @tc.desc  Comprehensive validation of JSON.stringify bigint conversion
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const validationSet: bigint[] = [
        -9223372036854775808n,
        -9007199254740991n,
        -1n,
        0n,
        1n,
        9007199254740991n,
        9223372036854775807n,
        18446744073709551615n
      ];

      for (let i = 0; i < validationSet.length; i++) {
        const input: bigint = validationSet[i];
        const actual: string = JSON.stringify(input);
        const expected: string = input.toString();

        expect(actual).assertEqual(expected);

        const containsDash: boolean = actual.indexOf("-") >= 0;
        expect(containsDash).assertEqual(input < 0);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0084
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0084
     * @tc.desc  Test JSON.stringify with core ASCII printable characters
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testChars: char[] = [
        c'A', c'a', c'0', c'9', c'!', c'@', c'#', c'$', c'%', c'^',
      c'&', c'*', c'(', c')', c'-', c'_', c'+', c'=', c' ', c'~'
      ];
      const expected: string[] = [
        "\"A\"", "\"a\"", "\"0\"", "\"9\"", "\"!\"", "\"@\"", "\"#\"", "\"$\"", "\"%\"", "\"^\"",
        "\"&\"", "\"*\"", "\"(\"", "\")\"", "\"-\"", "\"_\"", "\"+\"", "\"=\"", "\" \"", "\"~\""
      ];

      for (let i = 0; i < testChars.length; i++) {
        const result = JSON.stringify(testChars[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0085
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0085
     * @tc.desc  Test backslash character
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(JSON.stringify(c'\'')).assertEqual("\"'\"");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0086
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0086
     * @tc.desc  Complete digit range 0-9
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const digits: char[] = [c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9'];
      const expected: string[] = ["\"0\"", "\"1\"", "\"2\"", "\"3\"", "\"4\"", "\"5\"", "\"6\"", "\"7\"", "\"8\"", "\"9\""];

      for (let i = 0; i < digits.length; i++) {
        const result = JSON.stringify(digits[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0087
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0087
     * @tc.desc  Complete lowercase a-z range
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const lowercase: char[] = [
        c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j', c'k', c'l', c'm',
      c'n', c'o', c'p', c'q', c'r', c's', c't', c'u', c'v', c'w', c'x', c'y', c'z'
      ];
      const expected: string[] = [
        "\"a\"", "\"b\"", "\"c\"", "\"d\"", "\"e\"", "\"f\"", "\"g\"", "\"h\"", "\"i\"", "\"j\"", "\"k\"", "\"l\"", "\"m\"",
        "\"n\"", "\"o\"", "\"p\"", "\"q\"", "\"r\"", "\"s\"", "\"t\"", "\"u\"", "\"v\"", "\"w\"", "\"x\"", "\"y\"", "\"z\""
      ];

      for (let i = 0; i < lowercase.length; i++) {
        const result = JSON.stringify(lowercase[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0088
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0088
     * @tc.desc  Complete ASCII printable characters (32-126) - full coverage per document
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiChars: char[] = [
        c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')', c'*', c'+', c',', c'-', c'.', c'/',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c':', c';', c'<', c'=', c'>', c'?', c'@',
      c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J', c'K', c'L', c'M',
      c'N', c'O', c'P', c'Q', c'R', c'S', c'T', c'U', c'V', c'W', c'X', c'Y', c'Z',
      c'[', c'\\', c']', c'^', c'_', c'`',
      c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j', c'k', c'l', c'm',
      c'n', c'o', c'p', c'q', c'r', c's', c't', c'u', c'v', c'w', c'x', c'y', c'z',
      c'{', c'|', c'}', c'~'
      ];

      for (let i = 0; i < asciiChars.length; i++) {
        const result = JSON.stringify(asciiChars[i]);
        expect(result[0]).assertEqual("\"");
        expect(result[result.length - 1]).assertEqual("\"");
        expect(result.length).assertEqual(3);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0089
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0089
     * @tc.desc  Critical boundary symbols with lower test weight in previous cases
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specials: char[] = [c'{', c'}', c'|', c'[', c']', c'`'];
      const expected: string[] = ["\"{\"", "\"}\"", "\"|\"", "\"[\"", "\"]\"", "\"`\""];

      for (let i = 0; i < specials.length; i++) {
        const result = JSON.stringify(specials[i]);
        expect(result).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0090
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0090
     * @tc.desc  Test JSON.stringify with true and false literals
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let boolTrue: boolean = true;
      let boolFalse: boolean = false;
      expect(JSON.stringify(boolTrue)).assertEqual("true");
      expect(JSON.stringify(boolFalse)).assertEqual("false");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0091
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0091
     * @tc.desc  Test truthy values converted to boolean
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let truthyNum: boolean = !!1;
      let truthyStr: boolean = !!"test";

      expect(JSON.stringify(truthyNum)).assertEqual("true");
      expect(JSON.stringify(truthyStr)).assertEqual("true");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0092
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0092
     * @tc.desc  Test falsy values converted to boolean (exclude undefined as requested)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let falsyZero: boolean = !!0;
      let falsyEmptyStr: boolean = !!"";
      let falsyNull: boolean = !!null;
      let falsyNaN: boolean = !!NaN;

      expect(JSON.stringify(falsyZero)).assertEqual("false");
      expect(JSON.stringify(falsyEmptyStr)).assertEqual("false");
      expect(JSON.stringify(falsyNull)).assertEqual("false");
      expect(JSON.stringify(falsyNaN)).assertEqual("false");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0093
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0093
     * @tc.desc  Verify return type is String with correct length
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let boolTrue: boolean = true;
      let boolFalse: boolean = false;
      let result1: string = JSON.stringify(boolTrue);
      let result2: string = JSON.stringify(boolFalse);

      expect(typeof result1).assertEqual("string");
      expect(result1.length).assertEqual(4);
      expect(result1).assertEqual("true");
      expect(typeof result2).assertEqual("string");
      expect(result2.length).assertEqual(5);
      expect(result2).assertEqual("false");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0094
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0094
     * @tc.desc  Batch test with multiple boolean values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let bool1: boolean = true;
      let bool2: boolean = false;
      let bool3: boolean = !!"test";
      let bool4: boolean = !!0;
      let bool5: boolean = true;

      expect(JSON.stringify(bool1)).assertEqual("true");
      expect(JSON.stringify(bool2)).assertEqual("false");
      expect(JSON.stringify(bool3)).assertEqual("true");
      expect(JSON.stringify(bool4)).assertEqual("false");
      expect(JSON.stringify(bool5)).assertEqual("true");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0095
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0095
     * @tc.desc  Test JSON.stringify with empty string
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify("");

      expect(result).assertEqual("\"\"");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0096
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0096
     * @tc.desc  Test JSON.stringify with special escape characters (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = '"' + '\\' + '\b' + '\f' + '\n' + '\r' + '\t';
      const result = JSON.stringify(testString);

      expect(result).assertContain("\\\"");
      expect(result).assertContain("\\\\");
      expect(result).assertContain("\\b");
      expect(result).assertContain("\\f");
      expect(result).assertContain("\\n");
      expect(result).assertContain("\\r");
      expect(result).assertContain("\\t");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0097
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0097
     * @tc.desc  Test JSON.stringify with full ASCII coverage 1-127 (skip \u0000 to avoid truncation)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let asciiString = '"';

      for (let i = 1; i <= 127; i++) {
        asciiString += String.fromCharCode(i);
      }

      const result = JSON.stringify(asciiString);

      expect(result).assertContain("\\\"");
      expect(result).assertContain("\\\\");
      expect(result).assertContain("\\b");
      expect(result).assertContain("\\f");
      expect(result).assertContain("\\n");
      expect(result).assertContain("\\r");
      expect(result).assertContain("\\t");
      expect(result).assertContain("\\u0001");
      expect(result).assertContain("\\u001f");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0098
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0098
     * @tc.desc  Test JSON.stringify with valid surrogate pairs (implementation-specific behavior)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const testString = "😊";
      const result = JSON.stringify(testString);

      expect(result.startsWith("\"")).assertTrue();
      expect(result.endsWith("\"")).assertTrue();

      expect(result.length).assertLarger(2);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0099
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0099
     * @tc.desc  Test JSON.stringify with unpaired surrogate (implementation-specific behavior)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = String.fromCharCode(0xD83D, 0xDFFF);
      const result = JSON.stringify(testString);

      expect(result.startsWith("\"")).assertTrue();
      expect(result.endsWith("\"")).assertTrue();

      expect(result.length).assertLarger(2);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0100
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0100
     * @tc.desc  Test JSON.stringify with \\0 \\ddd \\xhh escapes (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = '\0' + 'A' + '\x7F';
      const result = JSON.stringify(testString);

      expect(result.startsWith("\"")).assertTrue();
      expect(result.endsWith("\"")).assertTrue();
      expect(result.length).assertLarger(5);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0101
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0101
     * @tc.desc  Test JSON.stringify with literal \\b \\f \\n sequences (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = String.fromCharCode(92, 34, 92, 92, 92, 98, 92, 102, 92, 110, 92, 114, 92, 116, 92, 34);

      const result = JSON.stringify(testString);

      const backslashPairs = result.split("\\\\").length - 1;
      expect(backslashPairs).assertLarger(4);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0102
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0102
     * @tc.desc  Test JSON.stringify with keywords "0" "NaN" and quotes (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = '0 NaN "';
      const result = JSON.stringify(testString);
      expect(result).assertEqual("\"0 NaN \\\"\"");
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0103
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0103
     * @tc.desc  Test JSON.stringify with emoji and ZWJ sequences (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString = "🦠👿👀🎠🇨😼💱🦧🏹‍♂️😢🦉🍴";

      const result = JSON.stringify(testString);

      expect(result.startsWith("\"")).assertTrue();
      expect(result.endsWith("\"")).assertTrue();

      expect(result.length).assertLarger(10);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0104
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0104
     * @tc.desc  Test JSON.stringify with repeated special characters 2x (document section 3)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[^^__``{{||}}~~';

      const result = JSON.stringify(specialChars);

      expect(result).assertContain("\\\"");
      expect(result.length).assertLarger(specialChars.length);
    });

    /**
     * @tc.name  builtinsJsonTypeStringifiersTest0105
     * @tc.number  BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0105
     * @tc.desc  Test JSON.stringify with large tree-like string (document section 3 treeString)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const size = 100;
      let treeString = "[";
      for (let i = 0; i < size; i++) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';

      const result = JSON.stringify(treeString);

      expect(result.startsWith("\"")).assertTrue();
      expect(result.endsWith("\"")).assertTrue();
      expect(result).assertContain("\\\"");
      expect(result.length).assertLarger(treeString.length);
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0106
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0106
     * @tc.desc Test stringify with basic string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = JSON.stringify("Hello");

      expect(result).assertEqual('"Hello"');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0107
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0107
     * @tc.desc Test stringify with number values including special ones
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(JSON.stringify(0 as double)).assertEqual('0');
      expect(JSON.stringify(-0 as double)).assertEqual('0');
      expect(JSON.stringify(NaN as double)).assertEqual('null');
      expect(JSON.stringify(Infinity as double)).assertEqual('null');
      expect(JSON.stringify(-Infinity as double)).assertEqual('null');
      expect(JSON.stringify(123.456 as double)).assertEqual('123.456');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0108
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0108
     * @tc.desc Test stringify with boolean values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(JSON.stringify(true)).assertEqual('true');
      expect(JSON.stringify(false)).assertEqual('false');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0109
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0109
     * @tc.desc Test stringify with null and undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(JSON.stringify(null)).assertEqual('null');
      expect(JSON.stringify(undefined)).assertEqual('');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0110
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0110
     * @tc.desc Test stringify with empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0111
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0111
     * @tc.desc Test stringify with array containing various number types
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [0, -0, NaN, Infinity, -Infinity, 42, 3.14, 1e3];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[0,0,null,null,null,42,3.14,1000]');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0112
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0112
     * @tc.desc Test stringify with nested arrays
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const deep: number[] = [4];
      const middle: number[] = [3, ...deep];
      const outer: number[] = [2, ...middle];
      const nested: number[][] = [[1], outer];

      const result: string = JSON.stringify(nested);
      expect(result).assertEqual('[[1],[2,3,4]]');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0113
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0113
     * @tc.desc Test stringify with special characters in string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = 'Hello\nWorld\t!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const result: string = JSON.stringify(str);

      expect(result).assertEqual('"Hello\\nWorld\\t!\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0114
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0114
     * @tc.desc Test stringify with emoji and Unicode
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const result: string = JSON.stringify(emoji);

      expect(result).assertEqual('"👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴"');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0115
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0115
     * @tc.desc Test stringify with large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeArray: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        largeArray.push(i);
      }
      const result: string = JSON.stringify(largeArray);
      const expected: string = `[${largeArray.join(',')}]`;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0116
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0116
     * @tc.desc Test stringify with large object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const tempObj: Record<string, double> = {};
      for (let i: int = 0; i < 100; i++) {
        tempObj[`key${i}`] = Int.toDouble(i);
      }
      const largeObj: Object = tempObj;

      const result: string = JSON.stringify(largeObj);

      expect(result).assertInstanceOf('String');
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0117
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0117
     * @tc.desc Test stringify with hexadecimal and octal numbers
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexNum: double = 0xCAFEBABE as double;
      const octNum: double = 0o777 as double;

      expect(JSON.stringify(hexNum)).assertEqual('3405691582');
      expect(JSON.stringify(octNum)).assertEqual('511');
    });

    /**
     * @tc.name builtinsJsonTypeStringifiersTest0118
     * @tc.number BUILTINS_JSON_TYPE_STRINGIFIERS_TEST_0118
     * @tc.desc Test stringify with keywords as strings
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTypeStringifiersTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const keywords: string[] = ["0", "NaN", "null", "undefined", "true", "false"];
      const results: string[] = [];
      for (let i: int = 0; i < keywords.length; i++) {
        results.push(JSON.stringify(keywords[i]));
      }

      expect(results[0]).assertEqual('"0"');
      expect(results[1]).assertEqual('"NaN"');
      expect(results[2]).assertEqual('"null"');
      expect(results[3]).assertEqual('"undefined"');
      expect(results[4]).assertEqual('"true"');
      expect(results[5]).assertEqual('"false"');
    });

  });
};
