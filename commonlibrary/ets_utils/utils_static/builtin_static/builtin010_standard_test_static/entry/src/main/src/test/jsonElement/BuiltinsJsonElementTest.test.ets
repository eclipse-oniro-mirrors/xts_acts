import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsJsonElementTest() {
  describe('BuiltinsJsonElementTest', () => {
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
     * @tc.name builtinsJsonElementTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0001
     * @tc.desc  Test setDouble() with normal double value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const testValue: double = 123.456 as double;

      element.setDouble(testValue);

      expect(element.asDouble()).assertEqual(testValue);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0002
     * @tc.desc  Test setDouble() with Number.MAX_VALUE
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const maxValue: double = Number.MAX_VALUE as double;

      element.setDouble(maxValue);

      expect(element.asDouble()).assertEqual(maxValue);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0003
     * @tc.desc  Test setDouble() with Number.MIN_VALUE
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const minValue: double = Number.MIN_VALUE as double;

      element.setDouble(minValue);

      expect(element.asDouble()).assertEqual(minValue);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0004
     * @tc.desc  Test setDouble() with positive Infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const posInf: double = Infinity as double;

      element.setDouble(posInf);

      expect(element.asDouble()).assertEqual(posInf);
      expect(element.asDouble()).assertInstanceOf('Number');
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0005
     * @tc.desc  Test setDouble() with negative Infinity
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const negInf: double = -Infinity as double;

      element.setDouble(negInf);

      expect(element.asDouble()).assertEqual(negInf);
      expect(element.asDouble()).assertInstanceOf('Number');
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0006
     * @tc.desc  Test setDouble() with NaN
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const nanValue: double = NaN as double;

      element.setDouble(nanValue);

      expect(isNaN(element.asDouble())).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0007
     * @tc.desc  Test setDouble() with zero
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const zero: double = 0 as double;

      element.setDouble(zero);

      expect(element.asDouble()).assertEqual(0);
      expect(element.asDouble()).assertInstanceOf('Number');
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0008
     * @tc.desc  Test setDouble() with negative zero
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const negZero: double = -0 as double;

      element.setDouble(negZero);

      expect(element.asDouble()).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0009
     * @tc.desc  Test setDouble() with scientific notation value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const sciValue: double = 2.5e-2 as double;

      element.setDouble(sciValue);

      expect(element.asDouble()).assertEqual(0.025);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0010
     * @tc.desc  Test setDouble() with hexadecimal value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const hexValue: double = 0xcafebabe as double;

      element.setDouble(hexValue);

      expect(element.asDouble()).assertEqual(0xcafebabe);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0011
     * @tc.desc  Test setDouble() with byte range value (-128~127)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const byteMin: double = -128 as double;
      const byteMax: double = 127 as double;

      element.setDouble(byteMin);
      expect(element.asDouble()).assertEqual(-128);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setDouble(byteMax);
      expect(element.asDouble()).assertEqual(127);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0012
     * @tc.desc  Test setDouble() with short range value (-32768~32767)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const shortMin: double = -32768 as double;
      const shortMax: double = 32767 as double;

      element.setDouble(shortMin);
      expect(element.asDouble()).assertEqual(-32768);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setDouble(shortMax);
      expect(element.asDouble()).assertEqual(32767);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0013
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0013
     * @tc.desc  Test setDouble() with int range value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const intMin: double = -2147483648 as double;
      const intMax: double = 2147483647 as double;

      element.setDouble(intMin);
      expect(element.asDouble()).assertEqual(-2147483648);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setDouble(intMax);
      expect(element.asDouble()).assertEqual(2147483647);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0014
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0014
     * @tc.desc  Test setDouble() with float range value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const floatValue: double = 3.4028234663852886e38 as double;

      element.setDouble(floatValue);

      expect(element.asDouble()).assertEqual(3.4028234663852886e38);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0015
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0015
     * @tc.desc  Test setDouble() with EPSILON value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const epsilon: double = Number.EPSILON as double;

      element.setDouble(epsilon);

      expect(element.asDouble()).assertEqual(2.220446049250313e-16);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0016
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0016
     * @tc.desc  Test setDouble() with MAX_SAFE_INTEGER
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const maxSafeInt: double = Number.MAX_SAFE_INTEGER as double;

      element.setDouble(maxSafeInt);

      expect(element.asDouble()).assertEqual(9007199254740991);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0017
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0017
     * @tc.desc  Test consecutive setDouble() calls with different values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const values: double[] = [1.5 as double, -10.25 as double, 0 as double, Infinity as double];

      values.forEach((value) => {
        element.setDouble(value);
        if (isFinite(value)) {
          expect(element.asDouble()).assertEqual(value);
        } else {
          expect(element.asDouble()).assertInstanceOf('Number');
        }
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      });
    });

    /**
     * @tc.name builtinsJsonElementTest0018
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0018
     * @tc.desc  Test setDouble() with precision boundary values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const precisionValue: double = 1.7976931348623157e308 as double;

      element.setDouble(precisionValue);

      expect(element.asDouble()).assertEqual(1.7976931348623157e308);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0019
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0019
     * @tc.desc  Test setDouble() with octal value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const octalValue: double = 0o777 as double;

      element.setDouble(octalValue);

      expect(element.asDouble()).assertEqual(511);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0020
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0020
     * @tc.desc  Test setDouble() with very small negative value (precision boundary)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const smallNegValue: double = -4.94065645841246544e-324 as double;

      element.setDouble(smallNegValue);

      expect(element.asDouble()).assertEqual(-4.94065645841246544e-324);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0021
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0021
     * @tc.desc  Test setDouble() with high precision value (π approximation)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const piValue: double = 3.14159265358979323846 as double;

      element.setDouble(piValue);

      expect(element.asDouble()).assertEqual(3.141592653589793);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0022
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0022
     * @tc.desc  Test setDouble() after setInteger() (type override behavior)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const intValue: int = 42;
      const doubleValue: double = 42.5 as double;

      element.setInteger(intValue);
      expect(element.asInteger()).assertEqual(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setDouble(doubleValue);
      expect(element.asDouble()).assertEqual(42.5);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      expect(element.asDouble()).assertEqual(42.5);
    });

    /**
     * @tc.name builtinsJsonElementTest0023
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0023
     * @tc.desc  Test setDouble() with result of exponential operation
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const expResult: double = (2 ** 10) as double;

      element.setDouble(expResult);

      expect(element.asDouble()).assertEqual(1024);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0024
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0024
     * @tc.desc  Test setInteger() with normal integer value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const testValue: int = 12345;

      element.setInteger(testValue);

      expect(element.asInteger()).assertEqual(testValue);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0025
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0025
     * @tc.desc  Test setInteger() with zero
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const zero: int = 0;

      element.setInteger(zero);

      expect(element.asInteger()).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0026
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0026
     * @tc.desc  Test setInteger() with negative zero
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const negZero: int = -0;

      element.setInteger(negZero);

      expect(element.asInteger()).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0027
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0027
     * @tc.desc  Test setInteger() with byte range boundary values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const byteMin: int = -128;
      const byteMax: int = 127;

      element.setInteger(byteMin);
      expect(element.asInteger()).assertEqual(-128);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setInteger(byteMax);
      expect(element.asInteger()).assertEqual(127);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0028
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0028
     * @tc.desc  Test setInteger() with short range boundary values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const shortMin: int = -32768;
      const shortMax: int = 32767;

      element.setInteger(shortMin);
      expect(element.asInteger()).assertEqual(-32768);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setInteger(shortMax);
      expect(element.asInteger()).assertEqual(32767);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0029
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0029
     * @tc.desc  Test setInteger() with int range boundary values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const intMin: int = -2147483648;
      const intMax: int = 2147483647;

      element.setInteger(intMin);
      expect(element.asInteger()).assertEqual(-2147483648);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setInteger(intMax);
      expect(element.asInteger()).assertEqual(2147483647);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0030
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0030
     * @tc.desc  Test setInteger() with hexadecimal value (within int range)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const hexValue: int = 0x7FFFFFFF;

      element.setInteger(hexValue);

      expect(element.asInteger()).assertEqual(2147483647);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0031
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0031
     * @tc.desc  Test setInteger() with octal value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const octalValue: int = 0o777;

      element.setInteger(octalValue);

      expect(element.asInteger()).assertEqual(511);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0032
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0032
     * @tc.desc  Test setInteger() with scientific notation result
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const sciResult: int = Double.toInt(1e3);

      element.setInteger(sciResult);

      expect(element.asInteger()).assertEqual(1000);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0033
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0033
     * @tc.desc  Test setInteger() after setDouble() - type override behavior
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const doubleValue: double = 3.14 as double;
      const intValue: int = 42;

      element.setDouble(doubleValue);
      expect(element.asDouble()).assertEqual(3.14);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setInteger(intValue);
      expect(element.asInteger()).assertEqual(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0034
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0034
     * @tc.desc  Test consecutive setInteger() calls with different values
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const values: int[] = [0, -1, 1, 2147483647, -2147483648];

      values.forEach((value) => {
        element.setInteger(value);
        expect(element.asInteger()).assertEqual(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      });
    });

    /**
     * @tc.name builtinsJsonElementTest0035
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0035
     * @tc.desc  Test setInteger() after setString() - type override behavior
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const testValue: int = 999;

      element.setString("test");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);

      element.setInteger(testValue);
      expect(element.asInteger()).assertEqual(999);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name builtinsJsonElementTest0036
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0036
     * @tc.desc  Test setString() with normal string value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const testValue: string = "Hello World";

      element.setString(testValue);

      expect(element.asString()).assertEqual(testValue);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0037
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0037
     * @tc.desc  Test setString() with empty string
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const emptyStr: string = "";

      element.setString(emptyStr);

      expect(element.asString()).assertEqual("");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0038
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0038
     * @tc.desc  Test setString() with special characters coverage
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      element.setString(specialChars);

      expect(element.asString()).assertEqual(specialChars);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0039
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0039
     * @tc.desc  Test setString() with ASCII full coverage (excluding control chars)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const asciiStr: string = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      element.setString(asciiStr);

      expect(element.asString()).assertEqual(asciiStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0040
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0040
     * @tc.desc  Test setString() with escape characters
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const escapeStr: string = "Line1\nLine2\rLine3\tTabbed\\Backslash\"Quoted\'\x41HexA";

      element.setString(escapeStr);

      expect(element.asString()).assertEqual(escapeStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0041
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0041
     * @tc.desc  Test setString() with emoji characters and Unicode
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const emojiStr: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";

      element.setString(emojiStr);

      expect(element.asString()).assertEqual(emojiStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0042
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0042
     * @tc.desc  Test setString() with repeated special characters (double coverage)
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const doubleSpecial: string = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";

      element.setString(doubleSpecial);

      expect(element.asString()).assertEqual(doubleSpecial);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0043
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0043
     * @tc.desc  Test setString() with keywords and special identifiers
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const keywords: string[] = ["0", "NaN", "null", "undefined", "true", "false", ""];

      keywords.forEach((keyword) => {
        element.setString(keyword);
        expect(element.asString()).assertEqual(keyword);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
      });
    });

    /**
     * @tc.name builtinsJsonElementTest0044
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0044
     * @tc.desc  Test setString() with multiline string
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const multilineStr: string = "Line1\nLine2\r\nLine3\tIndented";

      element.setString(multilineStr);

      expect(element.asString()).assertEqual(multilineStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0045
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0045
     * @tc.desc  Test setString() overrides previous double value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setDouble(3.14 as double);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setString("overridden");
      expect(element.asString()).assertEqual("overridden");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name builtinsJsonElementTest0046
     * @tc.number  BUILTINS_JSON_ELEMENT_TEST_0046
     * @tc.desc  Test setString() overrides previous integer value
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonElementTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setInteger(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setString("42_string");
      expect(element.asString()).assertEqual("42_string");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name setStringTest4700
     * @tc.number  BUILTINS_JSON_ELEMENT_SETSTRING_TEST4700
     * @tc.desc  Test setString() with JSON-like string content
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setStringTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const jsonLikeStr: string = "{\"key\":\"value\",\"array\":[1,2,3]}";

      element.setString(jsonLikeStr);

      expect(element.asString()).assertEqual(jsonLikeStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
      // Verify it's not parsed as object
      expect(element.asString()).assertEqual("{\"key\":\"value\",\"array\":[1,2,3]}");
    });

    /**
     * @tc.name setStringTest4800
     * @tc.number  BUILTINS_JSON_ELEMENT_SETSTRING_TEST4800
     * @tc.desc  Test consecutive setString() calls with different content
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setStringTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const strings: string[] = ["Hello", "", "👋", "Special!@#", "12345"];

      strings.forEach((str) => {
        element.setString(str);
        expect(element.asString()).assertEqual(str);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
      });
    });

    /**
     * @tc.name setStringTest4900
     * @tc.number  BUILTINS_JSON_ELEMENT_SETSTRING_TEST4900
     * @tc.desc  Test setString() with Unicode surrogate pairs
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setStringTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const surrogateStr: string = "\uD83D\uDC46\uD83D\uDC7F";

      element.setString(surrogateStr);

      expect(element.asString()).assertEqual(surrogateStr);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name setStringTest5000
     * @tc.number  BUILTINS_JSON_ELEMENT_SETSTRING_TEST5000
     * @tc.desc  Test setString() with very long string
     * @tc.type  FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setStringTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const longStr: string = "A".repeat(10000);

      element.setString(longStr);

      expect(element.asString()).assertEqual(longStr);
      expect(element.asString().length).assertEqual(10000);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name setBooleanTest5100
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5100
     * @tc.desc Test setBoolean() with true value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(true);

      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest5200
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5200
     * @tc.desc Test setBoolean() with false value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(false);

      expect(element.asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name setBooleanTest5300
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5300
     * @tc.desc Test setBoolean() overrides previous double value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setDouble(3.14 as double);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest5400
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5400
     * @tc.desc Test setBoolean() overrides previous string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setString("test");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);

      element.setBoolean(false);
      expect(element.asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name setBooleanTest5500
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5500
     * @tc.desc Test consecutive setBoolean() calls with different values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);

      element.setBoolean(false);
      expect(element.asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest5600
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5600
     * @tc.desc Test setBoolean() overrides previous integer value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setInteger(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest5700
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5700
     * @tc.desc Test setBoolean() with boolean from variable
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const boolVar: boolean = 5 > 3;

      element.setBoolean(boolVar);

      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest5800
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5800
     * @tc.desc Test setBoolean() with boolean expression result
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(10 === 10);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);

      element.setBoolean(10 === 5);
      expect(element.asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name setBooleanTest5900
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST5900
     * @tc.desc Test setBoolean() overrides previous null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest6000
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST6000
     * @tc.desc Test setBoolean() overrides previous undefined value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);

      element.setBoolean(false);
      expect(element.asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name setBooleanTest6100
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST6100
     * @tc.desc Test setBoolean() overrides previous array value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setArray([new jsonx.JsonElement()]);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);

      element.setBoolean(true);
      expect(element.asBoolean()).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name setBooleanTest6200
     * @tc.number BUILTINS_JSON_ELEMENT_SETBOOLEAN_TEST6200
     * @tc.desc Test setBoolean() result consistent with static factory method
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setBooleanTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element1 = new jsonx.JsonElement();
      element1.setBoolean(true);

      const element2 = jsonx.JsonElement.createBoolean(true);

      expect(element1.jsonType).assertEqual(element2.jsonType);
      expect(element1.asBoolean()).assertEqual(element2.asBoolean());
      expect(element1.asBoolean()).assertTrue();
    });

    /**
     * @tc.name setArrayTest6300
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6300
     * @tc.desc Test setArray() with empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const emptyArray: Array<jsonx.JsonElement> = [];

      element.setArray(emptyArray);

      expect(element.asArray()).assertEqual(emptyArray);
      expect(element.asArray().length).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6400
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6400
     * @tc.desc Test setArray() with single element array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const singleElement: Array<jsonx.JsonElement> = [jsonx.JsonElement.createString("single")];

      element.setArray(singleElement);

      expect(element.asArray()).assertEqual(singleElement);
      expect(element.asArray().length).assertEqual(1);
      expect(element.asArray()[0].asString()).assertEqual("single");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6500
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6500
     * @tc.desc Test setArray() with mixed type elements (number conversions)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const mixedArray: Array<jsonx.JsonElement> = [
        jsonx.JsonElement.createInteger(42),
        jsonx.JsonElement.createDouble(3.14 as double),
        jsonx.JsonElement.createString("test"),
        jsonx.JsonElement.createBoolean(true),
        jsonx.JsonElement.createNull()
      ];

      element.setArray(mixedArray);

      expect(element.asArray().length).assertEqual(5);
      expect(element.asArray()[0].asInteger()).assertEqual(42);
      expect(element.asArray()[1].asDouble()).assertEqual(3.14);
      expect(element.asArray()[2].asString()).assertEqual("test");
      expect(element.asArray()[3].asBoolean()).assertTrue();
      expect(element.asArray()[4].jsonType).assertEqual(jsonx.JsonType.JsonNull);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6600
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6600
     * @tc.desc Test setArray() with nested array structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const innerArray: Array<jsonx.JsonElement> = [jsonx.JsonElement.createInteger(1), jsonx.JsonElement.createInteger(2)];
      const nestedArray: Array<jsonx.JsonElement> = [
        jsonx.JsonElement.createArray(innerArray),
        jsonx.JsonElement.createString("nested")
      ];

      element.setArray(nestedArray);

      expect(element.asArray().length).assertEqual(2);
      expect(element.asArray()[0].asArray().length).assertEqual(2);
      expect(element.asArray()[0].asArray()[0].asInteger()).assertEqual(1);
      expect(element.asArray()[1].asString()).assertEqual("nested");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6700
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6700
     * @tc.desc Test setArray() with NaN and Infinity values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const specialArray: Array<jsonx.JsonElement> = [
        jsonx.JsonElement.createDouble(NaN as double),
        jsonx.JsonElement.createDouble(Infinity as double),
        jsonx.JsonElement.createDouble(-Infinity as double)
      ];

      element.setArray(specialArray);

      expect(element.asArray().length).assertEqual(3);
      expect(isNaN(element.asArray()[0].asDouble())).assertTrue();
      expect(element.asArray()[1].asDouble()).assertEqual(Infinity);
      expect(element.asArray()[2].asDouble()).assertEqual(-Infinity);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6800
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6800
     * @tc.desc Test setArray() overrides previous double value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setDouble(3.14 as double);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      const testArray: Array<jsonx.JsonElement> = [jsonx.JsonElement.createInteger(1)];
      element.setArray(testArray);

      expect(element.asArray().length).assertEqual(1);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest6900
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST6900
     * @tc.desc Test setArray() overrides previous string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setString("test");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);

      const testArray: Array<jsonx.JsonElement> = [jsonx.JsonElement.createString("array_item")];
      element.setArray(testArray);

      expect(element.asArray().length).assertEqual(1);
      expect(element.asArray()[0].asString()).assertEqual("array_item");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7000
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7000
     * @tc.desc Test setArray() overrides previous boolean value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(true);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);

      const testArray: Array<jsonx.JsonElement> = [jsonx.JsonElement.createBoolean(false)];
      element.setArray(testArray);

      expect(element.asArray().length).assertEqual(1);
      expect(element.asArray()[0].asBoolean()).assertFalse();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7100
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7100
     * @tc.desc Test consecutive setArray() calls with different arrays
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      const array1: Array<jsonx.JsonElement> = [jsonx.JsonElement.createInteger(1)];
      const array2: Array<jsonx.JsonElement> = [jsonx.JsonElement.createString("two"), jsonx.JsonElement.createString("items")];
      const array3: Array<jsonx.JsonElement> = [];

      element.setArray(array1);
      expect(element.asArray().length).assertEqual(1);

      element.setArray(array2);
      expect(element.asArray().length).assertEqual(2);

      element.setArray(array3);
      expect(element.asArray().length).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7200
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7200
     * @tc.desc Test setArray() with large array (performance check)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const largeArray: Array<jsonx.JsonElement> = [];

      for (let i = 0; i < 1000; i++) {
        largeArray.push(jsonx.JsonElement.createInteger(i));
      }

      element.setArray(largeArray);

      expect(element.asArray().length).assertEqual(1000);
      expect(element.asArray()[0].asInteger()).assertEqual(0);
      expect(element.asArray()[999].asInteger()).assertEqual(999);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7300
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7300
     * @tc.desc Test setArray() with null and undefined elements
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const specialArray: Array<jsonx.JsonElement> = [
        jsonx.JsonElement.createNull(),
        jsonx.JsonElement.createUndefined(),
        jsonx.JsonElement.createString("normal")
      ];

      element.setArray(specialArray);

      expect(element.asArray().length).assertEqual(3);
      expect(element.asArray()[0].jsonType).assertEqual(jsonx.JsonType.JsonNull);
      expect(element.asArray()[1].jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      expect(element.asArray()[2].asString()).assertEqual("normal");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7400
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7400
     * @tc.desc Test setArray() with extremely large array (stress test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const largeArray: Array<jsonx.JsonElement> = [];

      for (let i = 0; i < 10000; i++) {
        largeArray.push(jsonx.JsonElement.createInteger(i));
      }

      element.setArray(largeArray);

      expect(element.asArray().length).assertEqual(10000);
      expect(element.asArray()[0].asInteger()).assertEqual(0);
      expect(element.asArray()[9999].asInteger()).assertEqual(9999);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name setArrayTest7500
     * @tc.number BUILTINS_JSON_ELEMENT_SETARRAY_TEST7500
     * @tc.desc Test setArray() with deep nested structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setArrayTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      let nestedArray: jsonx.JsonElement = jsonx.JsonElement.createInteger(1);
      for (let i = 0; i < 5; i++) {
        nestedArray = jsonx.JsonElement.createArray([nestedArray]);
      }

      element.setArray(nestedArray.asArray());

      let current = element;
      for (let i = 0; i < 5; i++) {
        expect(current.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        current = current.asArray()[0];
      }
      expect(current.asInteger()).assertEqual(1);
    });

    /**
     * @tc.name setNullTest7600
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST7600
     * @tc.desc Test setNull() basic functionality
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setNull();

      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest7700
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST7700
     * @tc.desc Test setNull() overrides previous double value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setDouble(3.14 as double);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest7800
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST7800
     * @tc.desc Test setNull() overrides previous string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setString("test");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest7900
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST7900
     * @tc.desc Test setNull() overrides previous boolean value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(true);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest8000
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST8000
     * @tc.desc Test setNull() overrides previous integer value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setInteger(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest8100
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST8100
     * @tc.desc Test setNull() overrides previous array value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setArray([new jsonx.JsonElement()]);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest8200
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST8200
     * @tc.desc Test setNull() overrides previous object value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setElement("key", new jsonx.JsonElement());
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest8300
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST8300
     * @tc.desc Test setNull() with consecutive calls
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setNullTest8400
     * @tc.number BUILTINS_JSON_ELEMENT_SETNULL_TEST8400
     * @tc.desc Test setNull() result consistent with static factory method
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setNullTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element1 = new jsonx.JsonElement();
      element1.setNull();

      const element2 = jsonx.JsonElement.createNull();

      expect(element1.jsonType).assertEqual(element2.jsonType);
      expect(element1.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name setUndefinedTest8500
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST8500
     * @tc.desc Test setUndefined() basic functionality
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setUndefined();

      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest8600
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST8600
     * @tc.desc Test setUndefined() overrides previous double value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setDouble(3.14 as double);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest8700
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST8700
     * @tc.desc Test setUndefined() overrides previous string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setString("test");
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest8800
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST8800
     * @tc.desc Test setUndefined() overrides previous boolean value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setBoolean(true);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest8900
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST8900
     * @tc.desc Test setUndefined() overrides previous integer value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setInteger(42);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest9000
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST9000
     * @tc.desc Test setUndefined() overrides previous array value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setArray([new jsonx.JsonElement()]);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest9100
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST9100
     * @tc.desc Test setUndefined() overrides previous object value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setElement("key", new jsonx.JsonElement());
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest9200
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST9200
     * @tc.desc Test setUndefined() overrides previous null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setNull();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest9300
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST9300
     * @tc.desc Test consecutive setUndefined() calls
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);

      element.setUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name setUndefinedTest9400
     * @tc.number BUILTINS_JSON_ELEMENT_SETUNDEFINED_TEST9400
     * @tc.desc Test setUndefined() result consistent with static factory method
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('setUndefinedTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element1 = new jsonx.JsonElement();
      element1.setUndefined();

      const element2 = jsonx.JsonElement.createUndefined();

      expect(element1.jsonType).assertEqual(element2.jsonType);
      expect(element1.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

  });
};