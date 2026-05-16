import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsJsonSerializationStringifyTest() {
  describe('BuiltinsJsonSerializationStringifyTest', () => {
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
     * @tc.name builtinsJsonSerializationStringifyTest0001
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0001
     * @tc.desc Test stringify with FixedArray<byte> basic array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [1, 2, 3, 4, 5] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[1,2,3,4,5]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0002
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0002
     * @tc.desc Test stringify with FixedArray<byte> empty array (boundary case)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0003
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0003
     * @tc.desc Test stringify with FixedArray<byte> boundary values (TypedArray range -128~127)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [-128, -1, 0, 1, 127] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[-128,-1,0,1,127]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0004
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0004
     * @tc.desc Test stringify with FixedArray<byte> single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [42] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[42]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0005
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0005
     * @tc.desc Test stringify with FixedArray<byte> large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127,
        -128, -100, -50, 0, 50, 100, 127
      ] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(70);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0006
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0006
     * @tc.desc Test stringify with FixedArray<byte> all negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [-128, -64, -2, -1] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[-128,-64,-2,-1]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0007
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0007
     * @tc.desc Test stringify with FixedArray<byte> all positive values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [0, 1, 64, 127] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[0,1,64,127]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0008
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0008
     * @tc.desc Test stringify with FixedArray<byte> max and min boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [-128, 0, 127] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[-128,0,127]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0009
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0009
     * @tc.desc Test stringify with FixedArray<byte> alternating positive and negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<byte> = [1, -1, 2, -2, 3, -3] as FixedArray<byte>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[1,-1,2,-2,3,-3]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0010
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0010
     * @tc.desc Test stringify with FixedArray<short> containing 0~255 range values (simulating Uint8Array data)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<short> = [0, 50, 100, 150, 200, 255] as FixedArray<short>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[0,50,100,150,200,255]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0011
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0011
     * @tc.desc Test stringify with FixedArray<short> boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<short> = [-32768, -1, 0, 1, 32767] as FixedArray<short>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[-32768,-1,0,1,32767]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0012
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0012
     * @tc.desc Test stringify with FixedArray<double> special values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        Infinity as double,
        -Infinity as double,
        NaN as double,
        0.0 as double,
        3.14159 as double
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);
      expect(result).assertEqual('[null,null,null,0,3.14159]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0013
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0013
     * @tc.desc Test stringify with basic escape characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = 'test\nline';
      const result: string = JSON.stringify(str);

      expect(result).assertEqual('"test\\nline"');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0014
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0014
     * @tc.desc Test stringify with ASCII characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = 'ABC';
      const result: string = JSON.stringify(str);

      expect(result).assertEqual('"ABC"');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0015
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0015
     * @tc.desc Test stringify with large/small numbers
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        1.7976931348623157e+308 as double,
        5e-324 as double,
        2.220446049250313e-16 as double,
        9007199254740991.0 as double
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[1.7976931348623157e+308,5e-324,2.220446049250313e-16,9007199254740991]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0016
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0016
     * @tc.desc Test stringify with FixedArray<boolean> values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true, false] as FixedArray<boolean>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[true,false]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0017
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0017
     * @tc.desc Test stringify with FixedArray<double> containing special values at different positions
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        42.0 as double,
        NaN as double,
        Infinity as double,
        -Infinity as double,
        0.0 as double
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);
      expect(result).assertEqual('[42,null,null,null,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0018
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0018
     * @tc.desc Test stringify with FixedArray<int> and FixedArray<long> boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intArr: FixedArray<int> = [-2147483648, 0, 2147483647] as FixedArray<int>;
      expect(JSON.stringify(intArr)).assertEqual('[-2147483648,0,2147483647]');

      const longArr: FixedArray<long> = [
        -9223372036854775808 as long,
        9223372036854775807 as long
      ] as FixedArray<long>;
      expect(JSON.stringify(longArr)).assertEqual('[-9223372036854775808,9223372036854775807]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0019
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0019
     * @tc.desc Test stringify with FixedArray<float> boundaries (Float32 precision)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatArr: FixedArray<float> = [
        Double.toFloat(-3.4028234663852886e38),
        Double.toFloat(1.1754943508222875e-38),
        Double.toFloat(3.4028234663852886e38)
      ] as FixedArray<float>;
      const floatResult: string = JSON.stringify(floatArr);
      expect(floatResult).assertEqual('[-3.4028235e+38,1.1754944e-38,3.4028235e+38]');

      const doubleArr: FixedArray<double> = [
        Infinity,
        -Infinity,
        NaN
      ] as FixedArray<double>;
      expect(JSON.stringify(doubleArr)).assertEqual('[null,null,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0020
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0020
     * @tc.desc Test stringify with escape chars, unicode, emoji and keywords
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const esc: string = '\b\f\n\r\t';
      expect(JSON.stringify(esc)).assertEqual('"\\b\\f\\n\\r\\t"');

      const hex: string = String.fromCharCode(0x41, 0x42);
      expect(JSON.stringify(hex)).assertEqual('"AB"');

      const emoji: string = '👆';
      const emojiResult: string = JSON.stringify(emoji);

      expect(emojiResult.startsWith('"')).assertTrue();
      expect(emojiResult.endsWith('"')).assertTrue();

      expect(JSON.stringify('')).assertEqual('""');
      expect(JSON.stringify('NaN')).assertEqual('"NaN"');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0021
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0021
     * @tc.desc Test stringify with top-level null and undefined values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const undefResult: string | undefined = JSON.stringify(undefined);
      const isUndef = (undefResult === undefined) || (undefResult === "");
      expect(isUndef).assertTrue();

      const nullResult: string = JSON.stringify(null);
      expect(nullResult).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0022
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0022
     * @tc.desc Test stringify with scientific notation, hex and zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(JSON.stringify([1e3, 2.5e-2, 2 ** 3])).assertEqual('[1000,0.025,8]');

      expect(JSON.stringify(0x0102)).assertEqual('258');

      expect(JSON.stringify(-0)).assertEqual('0');

      expect(JSON.stringify(9007199254740991)).assertEqual('9007199254740991');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0023
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0023
     * @tc.desc Test stringify with Array containing undefined, null, NaN, Infinity, empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: (number | null | undefined)[] = [1, undefined, null, NaN, Infinity];
      expect(JSON.stringify(arr)).assertEqual('[1,null,null,null,null]');

      const emptyArr: number[] = [];
      expect(JSON.stringify(emptyArr)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0024
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0024
     * @tc.desc Test stringify with FixedArray<short> basic array and single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
      expect(JSON.stringify(arr1)).assertEqual('[1,2,3,4,5]');

      const arr2: FixedArray<short> = [42] as FixedArray<short>;
      expect(JSON.stringify(arr2)).assertEqual('[42]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0025
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0025
     * @tc.desc Test stringify with FixedArray<short> empty array and boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const empty: FixedArray<short> = [] as FixedArray<short>;
      expect(JSON.stringify(empty)).assertEqual('[]');

      const bounds: FixedArray<short> = [-32768, -1, 0, 1, 32767] as FixedArray<short>;
      expect(JSON.stringify(bounds)).assertEqual('[-32768,-1,0,1,32767]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0026
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0026
     * @tc.desc Test stringify with FixedArray<short> large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const large: FixedArray<short> = [
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        -32768, -10000, -1000, -100, 0, 100, 1000, 10000, 32767,
        1, 2, 3, 4, 5, 6, 7
      ] as FixedArray<short>;
      const result: string = JSON.stringify(large);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(70);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0027
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0027
     * @tc.desc Test stringify with FixedArray<short> all negative and all positive value patterns
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const neg: FixedArray<short> = [-32768, -16384, -256, -1] as FixedArray<short>;
      expect(JSON.stringify(neg)).assertEqual('[-32768,-16384,-256,-1]');

      const pos: FixedArray<short> = [0, 1, 256, 16384, 32767] as FixedArray<short>;
      expect(JSON.stringify(pos)).assertEqual('[0,1,256,16384,32767]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0028
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0028
     * @tc.desc Test stringify with FixedArray<short> alternating positive and negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<short> = [32767, -32768, 1, -1, 100, -100] as FixedArray<short>;
      expect(JSON.stringify(arr)).assertEqual('[32767,-32768,1,-1,100,-100]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0029
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0029
     * @tc.desc Test stringify with FixedArray<short> simulating Uint8Array range (0~255) and typical values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uint8Range: FixedArray<short> = [0, 50, 100, 150, 200, 255] as FixedArray<short>;
      expect(JSON.stringify(uint8Range)).assertEqual('[0,50,100,150,200,255]');

      const typical: FixedArray<short> = [-128, -100, -50, 0, 50, 100, 127] as FixedArray<short>;
      expect(JSON.stringify(typical)).assertEqual('[-128,-100,-50,0,50,100,127]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0030
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0030
     * @tc.desc Test stringify with FixedArray<short> robustness: duplicate values, boundary clusters, and zero vicinity
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const withDups: FixedArray<short> = [100, 100, 200, 200, 300] as FixedArray<short>;
      expect(JSON.stringify(withDups)).assertEqual('[100,100,200,200,300]');

      const boundaryCluster: FixedArray<short> = [-32768, -32768, 32767, 32767, -32768] as FixedArray<short>;
      expect(JSON.stringify(boundaryCluster)).assertEqual('[-32768,-32768,32767,32767,-32768]');

      const zeroVicinity: FixedArray<short> = [-1, 0, 1, -1, 0, 1] as FixedArray<short>;
      expect(JSON.stringify(zeroVicinity)).assertEqual('[-1,0,1,-1,0,1]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0031
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0031
     * @tc.desc Test stringify with FixedArray<int> basic array and single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
      expect(JSON.stringify(arr1)).assertEqual('[1,2,3,4,5]');

      const arr2: FixedArray<int> = [42] as FixedArray<int>;
      expect(JSON.stringify(arr2)).assertEqual('[42]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0032
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0032
     * @tc.desc Test stringify with FixedArray<int> empty array and Int32 boundary values (-2147483648~2147483647)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const empty: FixedArray<int> = [] as FixedArray<int>;
      expect(JSON.stringify(empty)).assertEqual('[]');

      const bounds: FixedArray<int> = [-2147483648, -1, 0, 1, 2147483647] as FixedArray<int>;
      expect(JSON.stringify(bounds)).assertEqual('[-2147483648,-1,0,1,2147483647]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0033
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0033
     * @tc.desc Test stringify with FixedArray<int> large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const large: FixedArray<int> = [
        -2147483648, -1000000, -100000, -10000, -1000, -100, -10, 0,
        10, 100, 1000, 10000, 100000, 1000000, 2147483647,
        -2147483648, -1000000, -100000, -10000, -1000, -100, -10, 0,
        10, 100, 1000, 10000, 100000, 1000000, 2147483647,
        -2147483648, -1000000, -100000, -10000, -1000, -100, -10, 0,
        10, 100, 1000, 10000, 100000, 1000000, 2147483647,
        -2147483648, -1000000, -100000, -10000, -1000, -100, -10, 0,
        10, 100, 1000, 10000, 100000, 1000000, 2147483647
      ] as FixedArray<int>;
      const result: string = JSON.stringify(large);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(60);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0034
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0034
     * @tc.desc Test stringify with FixedArray<int> all negative and all positive value patterns
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const neg: FixedArray<int> = [-2147483648, -1073741824, -65536, -256, -1] as FixedArray<int>;
      expect(JSON.stringify(neg)).assertEqual('[-2147483648,-1073741824,-65536,-256,-1]');

      const pos: FixedArray<int> = [0, 1, 256, 65536, 1073741824, 2147483647] as FixedArray<int>;
      expect(JSON.stringify(pos)).assertEqual('[0,1,256,65536,1073741824,2147483647]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0035
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0035
     * @tc.desc Test stringify with FixedArray<int> alternating positive and negative boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<int> = [
        2147483647, -2147483648, 2147483647, -2147483648,
        1, -1, 0, 1000000, -1000000
      ] as FixedArray<int>;
      expect(JSON.stringify(arr)).assertEqual('[2147483647,-2147483648,2147483647,-2147483648,1,-1,0,1000000,-1000000]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0036
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0036
     * @tc.desc Test stringify with FixedArray<int> robustness: duplicate values and zero vicinity
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('builtinsJsonSerializationStringifyTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const withDups: FixedArray<int> = [2147483647, 2147483647, 2147483647] as FixedArray<int>;
      expect(JSON.stringify(withDups)).assertEqual('[2147483647,2147483647,2147483647]');

      const zeroVicinity: FixedArray<int> = [-2, -1, 0, 1, 2] as FixedArray<int>;
      expect(JSON.stringify(zeroVicinity)).assertEqual('[-2,-1,0,1,2]');

      const mixed: FixedArray<int> = [-2147483648, 0, 2147483647] as FixedArray<int>;
      expect(JSON.stringify(mixed)).assertEqual('[-2147483648,0,2147483647]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0037
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0037
     * @tc.desc [ exploratory ] Test stringify with FixedArray<int> overflow wrapping behavior
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('builtinsJsonSerializationStringifyTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let error = false;
      try {
        const arr: FixedArray<int> = [
          Long.toInt(-2147483649),
          Long.toInt(2147483648)
        ] as FixedArray<int>;
        const result: string = JSON.stringify(arr);
        expect(result).assertEqual('[2147483647,-2147483648]');
      } catch (e) {
        console.info('Long.toInt rejects overflow: ' + e);
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0038
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0038
     * @tc.desc [ exploratory ] Test stringify with FixedArray<int> special values (Infinity→MAX, -Infinity→MIN, NaN→0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('builtinsJsonSerializationStringifyTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: FixedArray<int> = [
        Double.toInt(Infinity),
        Double.toInt(-Infinity),
        Double.toInt(NaN)
      ] as FixedArray<int>;
      expect(JSON.stringify(arr)).assertEqual('[2147483647,-2147483648,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0039
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0039
     * @tc.desc [ exploratory ] Test stringify with FixedArray<int> mixed overflow wrapping
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('builtinsJsonSerializationStringifyTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: FixedArray<int> = [
        0,
        2147483647,
        Long.toInt(2147483648),
        -2147483648,
        Long.toInt(-2147483649)
      ] as FixedArray<int>;

      expect(JSON.stringify(arr)).assertEqual('[0,2147483647,-2147483648,-2147483648,2147483647]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0040
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0040
     * @tc.desc Test stringify with FixedArray<long> basic array [1,2,3,4,5]
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<long> = [1, 2, 3, 4, 5] as FixedArray<long>;
      expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0041
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0041
     * @tc.desc Test stringify with FixedArray<long> single element [42]
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<long> = [42] as FixedArray<long>;
      expect(JSON.stringify(arr)).assertEqual('[42]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0042
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0042
     * @tc.desc Test stringify with FixedArray<long> empty array []
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const empty: FixedArray<long> = [] as FixedArray<long>;
      expect(JSON.stringify(empty)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0043
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0043
     * @tc.desc Test stringify with FixedArray<long> minimum boundary value (-9223372036854775808)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<long> = [-9223372036854775808 as long] as FixedArray<long>;
      expect(JSON.stringify(arr)).assertEqual('[-9223372036854775808]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0044
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0044
     * @tc.desc Test stringify with FixedArray<long> maximum boundary value (9223372036854775807)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<long> = [9223372036854775807 as long] as FixedArray<long>;

      expect(JSON.stringify(arr)).assertEqual('[9223372036854775807]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0045
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0045
     * @tc.desc Test stringify with FixedArray<long> mixed boundary values (MIN, 0, MAX)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bounds: FixedArray<long> = [
        -9223372036854775808 as long,
        0 as long,
        9223372036854775807 as long
      ] as FixedArray<long>;

      expect(JSON.stringify(bounds)).assertEqual('[-9223372036854775808,0,9223372036854775807]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0046
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0046
     * @tc.desc Test stringify with FixedArray<long> large array performance (29 elements)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const large: FixedArray<long> = [
        -9223372036854775808 as long, -1000000000 as long, -1000000 as long, 0 as long,
        1000000 as long, 1000000000 as long, 9223372036854775807 as long,
        -9223372036854775808 as long, -1000000000 as long, -1000000 as long, 0 as long,
        1000000 as long, 1000000000 as long, 9223372036854775807 as long,
        -9223372036854775808 as long, -1000000000 as long, -1000000 as long, 0 as long,
        1000000 as long, 1000000000 as long, 9223372036854775807 as long,
        1 as long, 2 as long, 3 as long, 4 as long, 5 as long, 6 as long, 7 as long, 8 as long
      ] as FixedArray<long>;
      const result: string = JSON.stringify(large);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(29);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0047
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0047
     * @tc.desc Test stringify with FixedArray<long> all negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const neg: FixedArray<long> = [
        -9223372036854775808 as long, -1000000 as long, -1 as long
      ] as FixedArray<long>;

      expect(JSON.stringify(neg)).assertEqual('[-9223372036854775808,-1000000,-1]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0048
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0048
     * @tc.desc Test stringify with FixedArray<long> all positive values including zero
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const pos: FixedArray<long> = [
        0 as long, 1 as long, 1000000 as long, 9223372036854775807 as long
      ] as FixedArray<long>;

      expect(JSON.stringify(pos)).assertEqual('[0,1,1000000,9223372036854775807]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0049
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0049
     * @tc.desc Test stringify with FixedArray<long> alternating positive and negative boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<long> = [
        9223372036854775807 as long, -9223372036854775808 as long, 1 as long, -1 as long
      ] as FixedArray<long>;

      expect(JSON.stringify(arr)).assertEqual('[9223372036854775807,-9223372036854775808,1,-1]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0050
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0050
     * @tc.desc Test stringify with FixedArray<long> duplicate extreme values (robustness check)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('builtinsJsonSerializationStringifyTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const withDups: FixedArray<long> = [
        9223372036854775807 as long, 9223372036854775807 as long
      ] as FixedArray<long>;

      expect(JSON.stringify(withDups)).assertEqual('[9223372036854775807,9223372036854775807]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0051
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0051
     * @tc.desc Test stringify with FixedArray<long> zero vicinity values (-2,-1,0,1,2)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('builtinsJsonSerializationStringifyTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroVicinity: FixedArray<long> = [-2, -1, 0, 1, 2] as FixedArray<long>;

      expect(JSON.stringify(zeroVicinity)).assertEqual('[-2,-1,0,1,2]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0052
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0052
     * @tc.desc Test stringify with FixedArray<float> basic integer values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(1.0), Double.toFloat(2.0), Double.toFloat(3.0)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0053
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0053
     * @tc.desc Test stringify with FixedArray<float> basic decimal values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(1.5), Double.toFloat(2.5), Double.toFloat(3.14)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[1.5,2.5,3.14]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0054
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0054
     * @tc.desc Test stringify with FixedArray<float> single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(3.14159)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[3.14159]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0055
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0055
     * @tc.desc Test stringify with FixedArray<float> empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0056
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0056
     * @tc.desc Test stringify with FixedArray<float> positive boundary value (MAX_VALUE 3.4028235e+38)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(3.4028234663852886e38)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[3.4028235e+38]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0057
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0057
     * @tc.desc Test stringify with FixedArray<float> negative boundary value (-3.4028235e+38)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(-3.4028234663852886e38)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[-3.4028235e+38]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0058
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0058
     * @tc.desc Test stringify with FixedArray<float> minimum positive value (1.1754944e-38)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(1.1754943508222875e-38)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[1.1754944e-38]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0059
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0059
     * @tc.desc Test stringify with FixedArray<float> zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(0.0), Double.toFloat(-0.0)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[0,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0060
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0060
     * @tc.desc Test stringify with FixedArray<float> Infinity saturation behavior
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(NaN)] as FixedArray<float>;
      const result: string = JSON.stringify(arr);

      expect(result === '[null]' || result === '[0]').assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0061
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0061
     * @tc.desc Test stringify with FixedArray<float> special value NaN
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [Double.toFloat(NaN)] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0062
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0062
     * @tc.desc Test stringify with FixedArray<float> mixed special and normal values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(1.0),
        Double.toFloat(NaN),
        Double.toFloat(2.0),
        Double.toFloat(Infinity),
        Double.toFloat(-Infinity),
        Double.toFloat(0.0)
      ] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[1,null,2,null,null,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0063
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0063
     * @tc.desc Test stringify with FixedArray<float> scientific notation values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(1e10),
        Double.toFloat(1e-10),
        Double.toFloat(5.5e20)
      ] as FixedArray<float>;
      const result: string = JSON.stringify(arr);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0064
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0064
     * @tc.desc Test stringify with FixedArray<float> precision test
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(3.1415926),
        Double.toFloat(2.7182818)
      ] as FixedArray<float>;
      const result: string = JSON.stringify(arr);
      expect(result === '[3.141593,2.718282]' || result === '[3.1415925,2.7182817]').assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0065
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0065
     * @tc.desc Test stringify with FixedArray<float> large array performance
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(1.0), Double.toFloat(2.0), Double.toFloat(3.0), Double.toFloat(4.0), Double.toFloat(5.0),
        Double.toFloat(1.1), Double.toFloat(2.2), Double.toFloat(3.3), Double.toFloat(4.4), Double.toFloat(5.5),
        Double.toFloat(1.2), Double.toFloat(2.3), Double.toFloat(3.4), Double.toFloat(4.5), Double.toFloat(5.6),
        Double.toFloat(1.3), Double.toFloat(2.4), Double.toFloat(3.5), Double.toFloat(4.6), Double.toFloat(5.7)
      ] as FixedArray<float>;
      const result: string = JSON.stringify(arr);
      expect(result.split(',').length).assertEqual(20);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0066
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0066
     * @tc.desc Test stringify with FixedArray<float> negative decimal values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(-1.5),
        Double.toFloat(-2.5),
        Double.toFloat(-0.1)
      ] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[-1.5,-2.5,-0.1]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0067
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0067
     * @tc.desc Test stringify with FixedArray<float> alternating positive and negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<float> = [
        Double.toFloat(1.0),
        Double.toFloat(-1.0),
        Double.toFloat(2.0),
        Double.toFloat(-2.0)
      ] as FixedArray<float>;
      expect(JSON.stringify(arr)).assertEqual('[1,-1,2,-2]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0068
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0068
     * @tc.desc Test stringify with FixedArray<double> basic integers, decimals and single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: FixedArray<double> = [1.0, 2.0, 3.0] as FixedArray<double>;
      expect(JSON.stringify(arr1)).assertEqual('[1,2,3]');

      const arr2: FixedArray<double> = [3.141592653589793] as FixedArray<double>;
      expect(JSON.stringify(arr2)).assertEqual('[3.141592653589793]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0069
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0069
     * @tc.desc Test stringify with FixedArray<double> empty array and zero values (0.0, -0.0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const empty: FixedArray<double> = [] as FixedArray<double>;
      expect(JSON.stringify(empty)).assertEqual('[]');

      const zeros: FixedArray<double> = [0.0, -0.0] as FixedArray<double>;
      expect(JSON.stringify(zeros)).assertEqual('[0,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0070
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0070
     * @tc.desc Test stringify with FixedArray<double> special values (Infinity, -Infinity, NaN → null)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [Infinity, -Infinity, NaN] as FixedArray<double>;
      expect(JSON.stringify(arr)).assertEqual('[null,null,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0071
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0071
     * @tc.desc Test stringify with FixedArray<double> extreme values (MAX_VALUE, MIN_VALUE, EPSILON)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.EPSILON
      ] as FixedArray<double>;

      expect(JSON.stringify(arr)).assertEqual('[1.7976931348623157e+308,5e-324,2.220446049250313e-16]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0072
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0072
     * @tc.desc Test stringify with FixedArray<double> scientific notation and high precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        1e10,
        1e-10,
        1.234567890123456,
        1.7976931348623157e+100
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0073
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0073
     * @tc.desc Test stringify with FixedArray<double> large array performance (20 elements)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        1.1, 2.2, 3.3, 4.4, 5.5,
        1.01, 2.02, 3.03, 4.04, 5.05,
        1.001, 2.002, 3.003, 4.004, 5.005,
        1.0001, 2.0002, 3.0003, 4.0004, 5.0005
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);

      expect(result.split(',').length).assertEqual(20);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0074
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0074
     * @tc.desc Test stringify with FixedArray<double> alternating positive and negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [1.5, -1.5, 2.5, -2.5, 0.0] as FixedArray<double>;
      expect(JSON.stringify(arr)).assertEqual('[1.5,-1.5,2.5,-2.5,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0075
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0075
     * @tc.desc Test stringify with FixedArray<double> mixed special and normal values (NaN, Infinity interleaved with regular numbers)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [1.5, NaN, 2.5, Infinity, -0.0, -Infinity] as FixedArray<double>;
      expect(JSON.stringify(arr)).assertEqual('[1.5,null,2.5,null,0,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0076
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0076
     * @tc.desc Test stringify with FixedArray<double> duplicate extreme values (MAX_VALUE, MIN_VALUE) for robustness check
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<double> = [
        Number.MAX_VALUE, Number.MAX_VALUE,
        Number.MIN_VALUE, Number.MIN_VALUE,
        0.0
      ] as FixedArray<double>;
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[1.7976931348623157e+308,1.7976931348623157e+308,5e-324,5e-324,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0077
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0077
     * @tc.desc Test stringify with FixedArray<boolean> mixed true and false values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[true,false,true,false]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0078
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0078
     * @tc.desc Test stringify with FixedArray<boolean> empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0079
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0079
     * @tc.desc Test stringify with FixedArray<boolean> all true values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[true,true,true]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0080
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0080
     * @tc.desc Test stringify with FixedArray<boolean> all false values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[false,false,false]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0081
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0081
     * @tc.desc Test stringify with FixedArray<boolean> single true element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[true]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0082
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0082
     * @tc.desc Test stringify with FixedArray<boolean> single false element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [false] as FixedArray<boolean>;
      expect(JSON.stringify(arr)).assertEqual('[false]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0083
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0083
     * @tc.desc Test stringify with FixedArray<boolean> alternating pattern (true,false,true,false,true)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
      const result: string = JSON.stringify(arr);
      expect(result).assertEqual('[true,false,true,false,true]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0084
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0084
     * @tc.desc Test stringify with FixedArray<boolean> consecutive true followed by consecutive false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [true, true, false, false, true, true] as FixedArray<boolean>;
      const result: string = JSON.stringify(arr);
      expect(result).assertEqual('[true,true,false,false,true,true]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0085
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0085
     * @tc.desc Test stringify with FixedArray<boolean> ten elements to verify comma placement
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<boolean> = [
        true, false, true, false, true,
        false, true, false, true, false
      ] as FixedArray<boolean>;
      const result: string = JSON.stringify(arr);

      expect(result.split(',').length).assertEqual(10);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0086
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0086
     * @tc.desc Test stringify with Array<Number> basic integers and floats
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [1, 2.5, -3, 0, 100];
      expect(JSON.stringify(arr)).assertEqual('[1,2.5,-3,0,100]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0087
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0087
     * @tc.desc Test stringify with Array<Number> empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [];
      expect(JSON.stringify(arr)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0088
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0088
     * @tc.desc Test stringify with Array<Number> special number values (NaN, Infinity, -Infinity)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [NaN, Infinity, -Infinity, 0, -0];
      expect(JSON.stringify(arr)).assertEqual('[null,null,null,0,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0089
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0089
     * @tc.desc Test stringify with Array<Number> extreme values (MAX_VALUE, MIN_VALUE, EPSILON)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON];
      expect(JSON.stringify(arr)).assertEqual('[1.7976931348623157e+308,5e-324,2.220446049250313e-16]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0090
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0090
     * @tc.desc Test stringify with Array<Number> safe integer boundaries (MAX_SAFE_INTEGER, MIN_SAFE_INTEGER)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 9007199254740991, -9007199254740991];
      expect(JSON.stringify(arr)).assertEqual('[9007199254740991,-9007199254740991,9007199254740991,-9007199254740991]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0091
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0091
     * @tc.desc Test stringify with Array<Number> typed range boundaries (byte, short, int, long limits)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        -128, 127,
        -32768, 32767,
        -2147483648, 2147483647,
        -9223372036854775808, 9223372036854775807
      ];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0092
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0092
     * @tc.desc Test stringify with Array<Number> float boundaries and scientific notation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        1.40129846432481707e-45,
        3.40282346638528860e+38,
        1e10, 1e-10, 2.5e-2, 1e3
      ];
      const result: string = JSON.stringify(arr);
      expect(result.indexOf('1e+10') >= 0 || result.indexOf('10000000000') >= 0).assertTrue();
      expect(result.indexOf('0.025') >= 0).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0093
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0093
     * @tc.desc Test stringify with Array<Number> hex, octal literals and char range values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        0x0102,
        0x3,
        0b1010,
        0o17,
        0xCAFEBABE,
        0x01020304
      ];
      expect(JSON.stringify(arr)).assertEqual('[258,3,10,15,3405691582,16909060]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0094
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0094
     * @tc.desc Test stringify with Array<Number> single element and negative values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrSingle: Number[] = [42];
      const arrNegative: Number[] = [-1, -256, -65535, -999999];

      expect(JSON.stringify(arrSingle)).assertEqual('[42]');
      expect(JSON.stringify(arrNegative)).assertEqual('[-1,-256,-65535,-999999]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0095
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0095
     * @tc.desc Test stringify with Array<Number> mixed with zero variations and math operations
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        0,
        -0,
        Math.floor(1.5),
        Math.ceil(1.2),
        2 ** 3,
        1.7976931348623157e+308 / 1e308
      ];
      expect(JSON.stringify(arr)).assertEqual('[0,0,1,2,8,1.7976931348623157]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0096
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0096
     * @tc.desc Test stringify with Array<Number> duplicate values and large array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        0, 0, 0,
        1.5, 1.5,
        NaN, NaN,
        Infinity, Infinity
      ];
      const result: string = JSON.stringify(arr);

      expect(result.split(',').length).assertEqual(9);
      expect(result).assertEqual('[0,0,0,1.5,1.5,null,null,null,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0097
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0097
     * @tc.desc Test stringify with ArrayLike<Number> basic integer sequence
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [10, 20, 30];
      expect(JSON.stringify(arr)).assertEqual('[10,20,30]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0098
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0098
     * @tc.desc Test stringify with ArrayLike<Number> empty array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [];
      expect(JSON.stringify(arr)).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0099
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0099
     * @tc.desc Test stringify with ArrayLike<Number> single element
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [42];
      expect(JSON.stringify(arr)).assertEqual('[42]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0100
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0100
     * @tc.desc Test stringify with ArrayLike<Number> special values (NaN, Infinity, -Infinity)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [NaN, Infinity, -Infinity];
      expect(JSON.stringify(arr)).assertEqual('[null,null,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0101
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0101
     * @tc.desc Test stringify with ArrayLike<Number> mixed floats and negatives
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [-1.5, 0, 3.14, -999.99];
      expect(JSON.stringify(arr)).assertEqual('[-1.5,0,3.14,-999.99]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0102
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0102
     * @tc.desc Test stringify with ArrayLike<Number> extreme values (MAX_VALUE, MIN_VALUE)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [Number.MAX_VALUE, Number.MIN_VALUE];
      expect(JSON.stringify(arr)).assertEqual('[1.7976931348623157e+308,5e-324]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0103
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0103
     * @tc.desc Test stringify with ArrayLike<Number> scientific notation values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [1e5, 2.5e-3, -3e10];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[100000,0.0025,-30000000000]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0104
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0104
     * @tc.desc Test stringify with ArrayLike<Number> zero variations (0, -0)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [0, -0, 0];
      expect(JSON.stringify(arr)).assertEqual('[0,0,0]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0105
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0105
     * @tc.desc Test stringify with ArrayLike<Number> ten elements to verify no trailing comma
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const result: string = JSON.stringify(arr);

      expect(result.split(',').length).assertEqual(10);
      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0106
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0106
     * @tc.desc Test stringify with ArrayLike<Number> EPSILON and safe integer boundaries
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [Number.EPSILON, Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER];
      expect(JSON.stringify(arr)).assertEqual('[2.220446049250313e-16,9007199254740991,-9007199254740991]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0107
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0107
     * @tc.desc Test stringify with ArrayLike<Number> hexadecimal literals (0x0102, 0xCAFEBABE, 0x01020304)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [0x0102, 0xCAFEBABE, 0x01020304, 0x3];
      expect(JSON.stringify(arr)).assertEqual('[258,3405691582,16909060,3]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0108
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0108
     * @tc.desc Test stringify with ArrayLike<Number> octal and binary literals (0o17, 0b1010)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [0o17, 0b1010, 0o101];
      expect(JSON.stringify(arr)).assertEqual('[15,10,65]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0109
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0109
     * @tc.desc Test stringify with ArrayLike<Number> exponential operator results (**)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [2 ** 3, 3 ** 2, 10 ** 6, Math.pow(2, 10)];
      expect(JSON.stringify(arr)).assertEqual('[8,9,1000000,1024]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0110
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0110
     * @tc.desc Test stringify with ArrayLike<Number> integer type boundaries (byte, short, int, long)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        -128, 127,
        -32768, 32767,
        -2147483648, 2147483647,
        -9223372036854775808, 9223372036854775807
      ];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();

      expect(result.indexOf('-128') >= 0).assertTrue();
      expect(result.indexOf('127') >= 0).assertTrue();
      expect(result.indexOf('32767') >= 0).assertTrue();
      expect(result.indexOf('2147483647') >= 0).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0111
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0111
     * @tc.desc Test stringify with ArrayLike<Number> float type boundaries (float min/max)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [
        1.40129846432481707e-45,
        3.40282346638528860e+38,
        -3.40282346638528860e+38,
        1.17549435e-38
      ];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(4);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0112
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0112
     * @tc.desc Test stringify with ArrayLike<Number> duplicate indices and consecutive identical values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Number[] = [0, 0, 0, 1, 1, NaN, NaN, Infinity];
      expect(JSON.stringify(arr)).assertEqual('[0,0,0,1,1,null,null,null]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0113
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0113
     * @tc.desc Test stringify with empty FixedArray<char> to verify empty array handling
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('[]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0114
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0114
     * @tc.desc Test stringify with single char element 'A' (ASCII 65)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'A'];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('["A"]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0115
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0115
     * @tc.desc Test stringify with char boundary values 0 (NULL) and 127 (DEL) at ASCII range limits
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\u0000', c'\u007F'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(2);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0116
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0116
     * @tc.desc Test stringify with extended ASCII range (128-255) including common Latin chars
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\u0080', c'\u00A9', c'\u00FF'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(3);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0117
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0117
     * @tc.desc Test stringify with char absolute boundaries 0 and 65535 (char range limit)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\u0000', c'\uFFFF'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0118
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0118
     * @tc.desc Test stringify with printable ASCII full range (32-126) including letters, digits, symbols
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c' ', c'0', c'A', c'a', c'z', c'~'];
      const result: string = JSON.stringify(arr);

      expect(result.indexOf('" "') >= 0).assertTrue();
      expect(result.indexOf('"0"') >= 0).assertTrue();
      expect(result.indexOf('"A"') >= 0).assertTrue();
      expect(result.indexOf('"a"') >= 0).assertTrue();
      expect(result.split(',').length).assertEqual(6);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0119
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0119
     * @tc.desc Test stringify with special control characters (TAB 9, LF 10, CR 13)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\t', c'\n', c'\r'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(3);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0120
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0120
     * @tc.desc Test stringify with consecutive char sequence "Hello" (72,101,108,108,111)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'H', c'e', c'l', c'l', c'o'];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('["H","e","l","l","o"]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0121
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0121
     * @tc.desc Test stringify with large FixedArray<char> (1000 elements) to verify performance and no trailing comma
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const chars: FixedArray<char> = [c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
      c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
      c'U', c'V', c'W', c'X', c'Y', c'Z'];

      let arr: FixedArray<char> = [];
      for (let i = 0; i < 1000; i++) {
        arr = [...arr, chars[i % 26]];
      }
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('["A"')).assertTrue();
      expect(result.endsWith('"]')).assertTrue();
      expect(result.split(',').length).assertEqual(1000);

      expect(result.indexOf(',]') < 0).assertTrue();
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0122
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0122
     * @tc.desc Test stringify with Unicode BMP chars (char values 256-65535) including CJK and symbols
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\u20AC', c'\u4E2D', c'\u65E5', c'\uD800', c'\uDBFF', c'\uDC00', c'\uDFFF'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(7);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0123
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0123
     * @tc.desc Test stringify with char boundary 256 (start of extended plane) and common math symbols
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'\u0100', c'\u03B1', c'\u03A9', c'\u222B', c'\u2248', c'\u2260'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(6);
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0124
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0124
     * @tc.desc Test stringify with duplicate consecutive chars and mixed case letters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'A', c'A', c'B', c'B', c'a', c'a'];
      const result: string = JSON.stringify(arr);

      expect(result).assertEqual('["A","A","B","B","a","a"]');
    });

    /**
     * @tc.name builtinsJsonSerializationStringifyTest0125
     * @tc.number BUILTINS_JSON_SERIALIZATION_STRINGIFY_TEST_0125
     * @tc.desc Test stringify with digits and punctuation marks commonly used in JSON
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonSerializationStringifyTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: FixedArray<char> = [c'"', c',', c':', c'[', c']', c'{', c'}'];
      const result: string = JSON.stringify(arr);

      expect(result.startsWith('[')).assertTrue();
      expect(result.endsWith(']')).assertTrue();
      expect(result.split(',').length).assertEqual(8);
      expect(result.length > 14).assertTrue();
    });

  });
};
