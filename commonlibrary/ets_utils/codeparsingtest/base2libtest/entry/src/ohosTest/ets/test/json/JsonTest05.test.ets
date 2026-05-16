import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
interface TypedArraysObject {
  float32: Float32Array;
  float64: Float64Array;
  int8: Int8Array;
  uint8: Uint8Array;
}

interface IllegalUnicodeObject {
  "\udc04"?: string;
  "\ud83d"?: string;
  "\udff4"?: string;
}
interface NumericValueObject {
  a?: number;
  max?: number;
  min?: number;
  epsilon?: number;
  maxSafe?: number;
  hex?: number;
  b?: number;
}

interface ArrayValuesObject {
  normalArray: number[];
  zeroArray: number[];
  negativeArray: number[];
  specialArray: number[];
  mixedArray: (number | string | boolean | null | undefined)[];
}

interface SpecialArrayObject {
  overflowArray: number[];
  emptyArray: number[];
  sparseArray: Record<string, number>;
}

interface NumericBoundariesObject {
  zero: number;
  negativeZero: number;
  nan: number;
  infinity: number;
  negInfinity: number;
  maxValue: number;
  minValue: number;
  epsilon: number;
  maxSafe: number;
  minSafe: number;
  byteMax: number;
  byteMin: number;
  shortMax: number;
  shortMin: number;
  intMax: number;
  intMin: number;
}

interface NumericFormatsObject {
  hex: number;
  hex32: number;
  octal: number;
  binary: number;
  exponent: number;
  scientific1: number;
  scientific2: number;
  bigInt1: bigint;
  bigInt2: bigint;
}

interface BooleanLikeObject {
  trueVal: boolean;
  falseVal: boolean;
  zero: number;
  nan: number;
  emptyString: string;
  nullVal: null;
  undefinedVal: undefined;
}

interface AllTypedArraysObject {
  int8: Int8Array;
  uint8: Uint8Array;
  uint8Clamped: Uint8ClampedArray;
  int16: Int16Array;
  uint16: Uint16Array;
  int32: Int32Array;
  uint32: Uint32Array;
  float32: Float32Array;
  float64: Float64Array;
  bigInt64: BigInt64Array;
  bigUint64: BigUint64Array;
}

interface Test60Object {
  a: number;
  b: number;
  c: number;
}
interface DeepNestedObject {
  nested: NestedRootObject;
  mixed: MixedObject;
}
interface BigIntObject {
  big: bigint;
  b: number;
}
interface UnicodeObject {
  "\ud83d\udc46": string;
  b: number;
}

interface MixedObject {
  number: number;
  string: string;
  boolean: boolean;
  null: null;
  undefined: undefined;
  array: number[];
  object: ObjectWithA;
}


interface NestedRootObject {
  level1: Level1Object;
}

interface ObjectWithA {
  a: number;
}
interface Level1Object {
  level2: Level2Object;
}

interface Level3Object {
  value: string;
}

interface Level2Object {
  level3: Level3Object;
}


function initTreeString(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Json05Test() {
  describe('Json05Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_JSON_TEST05_0100
     * @tc.name      testJson05Chapter0001
     * @tc.desc      Test JSON.has with object containing property with value Number.EPSILON.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0001";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { epsilon: Number.EPSILON, b: 1 };
      let result = JSON.has(obj, "epsilon");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0200
     * @tc.name      testJson05Chapter0002
     * @tc.desc      Test JSON.has with object containing property with value Number.MAX_SAFE_INTEGER.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0002";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { maxSafe: Number.MAX_SAFE_INTEGER, b: 1 };
      let result = JSON.has(obj, "maxSafe");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0300
     * @tc.name      testJson05Chapter0003
     * @tc.desc      Test JSON.has with object containing property with bigint value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0003";
      console.log(TAG + ' Start');
      let obj: BigIntObject = { big: BigInt("9007199254740991"), b: 1 };
      let result = JSON.has(obj, "big");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0400
     * @tc.name      testJson05Chapter0004
     * @tc.desc      Test JSON.has with object containing property with hexadecimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0004";
      console.log(TAG + ' Start');
      let obj: NumericValueObject = { hex: 0x0102, b: 1 };
      let result = JSON.has(obj, "hex");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0500
     * @tc.name      testJson05Chapter0005
     * @tc.desc      Test JSON.has with property name as unicode escape sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0005";
      console.log(TAG + ' Start');
      let obj: UnicodeObject = { "\ud83d\udc46": "emoji", b: 1 };
      let result = JSON.has(obj, "\ud83d\udc46");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0600
     * @tc.name      testJson05Chapter0006
     * @tc.desc      Test JSON.has with object from array-like object with string keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0006";
      console.log(TAG + ' Start');
      let arrLike: Record<string, number> = {};
      arrLike["abc"] = 111;
      arrLike["aaa"] = 222;
      let result = JSON.has(arrLike, "abc");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0700
     * @tc.name      testJson05Chapter0007
     * @tc.desc      Test JSON.has with object containing TypedArray property with special values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0007";
      console.log(TAG + ' Start');
      let obj: TypedArraysObject = {
        float32: new Float32Array([Infinity, -Infinity, NaN, 1.5]),
        float64: new Float64Array([Infinity, -Infinity, NaN]),
        int8: new Int8Array([Infinity, -Infinity, NaN]),
        uint8: new Uint8Array([Infinity, -Infinity, NaN])
      };
      let result = JSON.has(obj, "float32");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0800
     * @tc.name      testJson05Chapter0008
     * @tc.desc      Test JSON.has with property name containing illegal unicode.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0008";
      console.log(TAG + ' Start');
      let obj: IllegalUnicodeObject = {
        "\udc04": "illegal1",
        "\ud83d": "illegal2",
        "\udff4": "illegal3"
      };
      let result = JSON.has(obj, "\udc04");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_0900
     * @tc.name      testJson05Chapter0009
     * @tc.desc      Test JSON.has with property name as treeString type (large JSON string pattern).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0009";
      console.log(TAG + ' Start');

      let treeKey = initTreeString(100);
      let obj: Record<string, string> = {};
      obj[treeKey] = "treeStringValue";

      let result = JSON.has(obj, treeKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1000
     * @tc.name      testJson05Chapter0010
     * @tc.desc      Test JSON.has with property name from sliceString type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0010";
      console.log(TAG + ' Start');
      let str = "{k1:value1,k2:value2}";
      let resultKey = str.substring(0, str.length - 2);
      let obj: Record<string, string> = {};
      obj[resultKey] = "sliceStringValue";

      let result = JSON.has(obj, resultKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1100
     * @tc.name      testJson05Chapter0011
     * @tc.desc      Test JSON.has with property name as very large string (memory test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0011";
      console.log(TAG + ' Start');
      let largeKey = "a".repeat(10000);
      let obj: Record<string, string> = {};
      obj[largeKey] = "largeStringValue";

      let result = JSON.has(obj, largeKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1200
     * @tc.name      testJson05Chapter0012
     * @tc.desc      Test JSON.has with object containing array of various typed values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0012";
      console.log(TAG + ' Start');
      let obj: ArrayValuesObject = {
        normalArray: [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63],
        zeroArray: [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63],
        negativeArray: [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63],
        specialArray: [72, 101, NaN, Infinity, 108, 111],
        mixedArray: [72, "abc", true, null, undefined, 108]
      };

      let result = JSON.has(obj, "normalArray");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1300
     * @tc.name      testJson05Chapter0013
     * @tc.desc      Test JSON.has with object containing array with out-of-range values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0013";
      console.log(TAG + ' Start');

      let sparseArray: Record<string, number> = {};
      sparseArray["abc"] = 111;
      sparseArray["aaa"] = 222;

      let obj: SpecialArrayObject = {
        overflowArray: [256, 65536, 32768],
        emptyArray: [],
        sparseArray: sparseArray
      };

      let result = JSON.has(obj, "overflowArray");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1400
     * @tc.name      testJson05Chapter0014
     * @tc.desc      Test JSON.has with object after delete operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0014";
      console.log(TAG + ' Start');
      let obj: Test60Object = { a: 1, b: 2, c: 3 };
      JSON.remove(obj, "b");

      let result1 = JSON.has(obj, "a");
      let result2 = JSON.has(obj, "b");
      let result3 = JSON.has(obj, "c");

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1500
     * @tc.name      testJson05Chapter0015
     * @tc.desc      Test JSON.has with object containing various numeric boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0015";
      console.log(TAG + ' Start');
      let obj: NumericBoundariesObject = {
        zero: 0,
        negativeZero: -0,
        nan: NaN,
        infinity: Infinity,
        negInfinity: -Infinity,
        maxValue: Number.MAX_VALUE,
        minValue: Number.MIN_VALUE,
        epsilon: Number.EPSILON,
        maxSafe: Number.MAX_SAFE_INTEGER,
        minSafe: Number.MIN_SAFE_INTEGER,
        byteMax: 127,
        byteMin: -128,
        shortMax: 32767,
        shortMin: -32768,
        intMax: 2147483647,
        intMin: -2147483648
      };

      let result = JSON.has(obj, "maxValue");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1600
     * @tc.name      testJson05Chapter0016
     * @tc.desc      Test JSON.has with object containing numeric values in different formats.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0016";
      console.log(TAG + ' Start');
      let obj: NumericFormatsObject = {
        hex: 0x0102,
        hex32: 0x01020304,
        octal: 0o3,
        binary: 0b1010,
        exponent: 2**3,
        scientific1: 1e3,
        scientific2: 2.5e-2,
        bigInt1: BigInt("9007199254740991"),
        bigInt2: BigInt("0xdecafafecacefade")
      };

      let result = JSON.has(obj, "hex");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1700
     * @tc.name      testJson05Chapter0017
     * @tc.desc      Test JSON.has with object containing boolean-like values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0017";
      console.log(TAG + ' Start');
      let obj: BooleanLikeObject = {
        trueVal: true,
        falseVal: false,
        zero: 0,
        nan: NaN,
        emptyString: "",
        nullVal: null,
        undefinedVal: undefined
      };

      let result = JSON.has(obj, "trueVal");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1800
     * @tc.name      testJson05Chapter0018
     * @tc.desc      Test JSON.has with object containing all ASCII characters as separate properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0018";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 32; i <= 126; i++) {
        obj[String.fromCharCode(i)] = `char${i}`;
      }

      let result = JSON.has(obj, "A");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_1900
     * @tc.name      testJson05Chapter0019
     * @tc.desc      Test JSON.has with object containing escape sequence property names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0019";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\\a": "bell",
        "\\b": "backspace",
        "\\f": "formfeed",
        "\\n": "newline",
        "\\r": "carriageReturn",
        "\\t": "tab",
        "\\v": "verticalTab",
        "\\\\": "backslash",
        "\\'": "singleQuote",
        '\\"': "doubleQuote",
        "\\?": "questionMark",
        "\\0": "nullChar"
      };

      let result = JSON.has(obj, "\\n");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2000
     * @tc.name      testJson05Chapter0020
     * @tc.desc      Test JSON.has with object containing emoji unicode property names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0020";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "👆": "emoji1",
        "👿": "emoji2",
        "👀": "emoji3",
        "💯": "emoji4",
        "🎅": "emoji5",
        "😼": "emoji6",
        "🔧": "emoji7",
        "💇": "emoji8",
        "🤼‍♂️": "emoji9",
        "🛢": "emoji10",
        "🀄": "emoji11",
        "🏴": "emoji12"
      };

      let result = JSON.has(obj, "👆");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2100
     * @tc.name      testJson05Chapter0021
     * @tc.desc      Test JSON.has with object containing typed arrays of all types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0021";
      console.log(TAG + ' Start');
      let obj: AllTypedArraysObject = {
        int8: new Int8Array([-128, 0, 127]),
        uint8: new Uint8Array([0, 128, 255]),
        uint8Clamped: new Uint8ClampedArray([0, 128, 255]),
        int16: new Int16Array([-32768, 0, 32767]),
        uint16: new Uint16Array([0, 32768, 65535]),
        int32: new Int32Array([-2147483648, 0, 2147483647]),
        uint32: new Uint32Array([0, 2147483648, 4294967295]),
        float32: new Float32Array([-3.4e38, 0, 3.4e38]),
        float64: new Float64Array([-1.8e308, 0, 1.8e308]),
        bigInt64: new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]),
        bigUint64: new BigUint64Array([0n, 9223372036854775808n, 18446744073709551615n])
      };

      let result = JSON.has(obj, "int8");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2200
     * @tc.name      testJson05Chapter0022
     * @tc.desc      Test JSON.has with object containing complex nested structures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0022";
      console.log(TAG + ' Start');
      let obj: DeepNestedObject = {
        nested: {
          level1: {
            level2: {
              level3: {
                value: "deep"
              }
            }
          }
        },
        mixed: {
          number: 123,
          string: "test",
          boolean: true,
          null: null,
          undefined: undefined,
          array: [1, 2, 3],
          object: { a: 1 }
        }
      };

      let result = JSON.has(obj, "nested");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2300
     * @tc.name      testJson05Chapter0023
     * @tc.desc      Test JSON.has with property name that changes dynamically.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0023";
      console.log(TAG + ' Start');
      let dynamicKey = "key" + Math.random();
      let obj: Record<string, string> = {};
      obj[dynamicKey] = "dynamicValue";

      let result = JSON.has(obj, dynamicKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2400
     * @tc.name      testJson05Chapter0024
     * @tc.desc      Test JSON.has with property name containing repeated special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0024";
      console.log(TAG + ' Start');
      let specialKey = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      let obj: Record<string, string> = {};
      obj[specialKey] = "repeatedSpecial";

      let result = JSON.has(obj, specialKey);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2500
     * @tc.name      testJson05Chapter0025
     * @tc.desc      Test JSON.has with property name containing tab and newline characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0025";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "key\twith\ttabs": "tabValue",
        "key\nwith\nnewlines": "newlineValue",
        "key\rwith\rcarriage": "carriageValue"
      };

      let result = JSON.has(obj, "key\twith\ttabs");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2600
     * @tc.name      testJson05Chapter0026
     * @tc.desc      Test JSON.has with property name containing octal and hex escape sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0026";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "hex\\x41": "hexValue",
        "oct\\101": "octValue"
      };

      let result = JSON.has(obj, "hex\\x41");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2700
     * @tc.name      testJson05Chapter0027
     * @tc.desc      Test JSON.has with property name as various number string representations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0027";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "0": "zero",
        "NaN": "notANumber",
        "Infinity": "infinity",
        "-Infinity": "negativeInfinity",
        "1e3": "oneThousand",
        "2.5e-2": "pointZeroTwoFive"
      };

      let result = JSON.has(obj, "NaN");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2800
     * @tc.name      testJson05Chapter0028
     * @tc.desc      Test JSON.has with property name that looks like boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0028";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "true": "isTrue",
        "false": "isFalse",
        "null": "isNull",
        "undefined": "isUndefined"
      };

      let result = JSON.has(obj, "true");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_2900
     * @tc.name      testJson05Chapter0029
     * @tc.desc      Test JSON.has with extremely large object (performance test).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0029";
      console.log(TAG + ' Start');
      let obj: Record<string, number> = {};
      for (let i = 0; i < 1000; i++) {
        obj[`key${i}`] = i;
      }

      let result = JSON.has(obj, "key500");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3000
     * @tc.name      testJson05Chapter0030
     * @tc.desc      Test JSON.has with property name containing surrogate pairs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0030";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\ud83d\udc46": "pointUp",
        "\ud83d\udc7f": "imp",
        "\ud83d\udc40": "eyes",
        "\ud83d\udcaf": "hundred",
        "\ud83c\udf85": "santa",
        "\ud83d\ude3c": "catSmile",
        "\ud83d\udd27": "wrench",
        "\ud83d\udc87": "haircut",
        "\ud83e\udd3c\u200d\u2642\ufe0f": "menWrestling",
        "\ud83d\udee2": "oilDrum",
        "\ud83c\udc04": "mahjong",
        "\ud83c\udff4": "blackFlag"
      };

      let result = JSON.has(obj, "\ud83d\udc46");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3100
     * @tc.name      testJson05Chapter0031
     * @tc.desc      Test JSON.has with property name containing control characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0031";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 0; i < 32; i++) {
        if (i !== 9 && i !== 10 && i !== 13) {
          obj[String.fromCharCode(i)] = `control${i}`;
        }
      }

      let result = JSON.has(obj, String.fromCharCode(1));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3200
     * @tc.name      testJson05Chapter0032
     * @tc.desc      Test JSON.has with property name containing extended ASCII characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0032";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 127; i < 256; i++) {
        obj[String.fromCharCode(i)] = `extended${i}`;
      }

      let result = JSON.has(obj, String.fromCharCode(128));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3300
     * @tc.name      testJson05Chapter0033
     * @tc.desc      Test JSON.has with property name containing zero-width characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0033";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\u200B": "zeroWidthSpace",
        "\u200C": "zeroWidthNonJoiner",
        "\u200D": "zeroWidthJoiner",
        "\uFEFF": "zeroWidthNoBreakSpace"
      };

      let result = JSON.has(obj, "\u200B");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3400
     * @tc.name      testJson05Chapter0034
     * @tc.desc      Test JSON.has with property name containing combining characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0034";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "e\u0301": "eAccentValue",
        "a\u0300": "aGraveValue",
        "i\u0302": "iCircumflexValue"
      };

      let result = JSON.has(obj, "e\u0301");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3500
     * @tc.name      testJson05Chapter0035
     * @tc.desc      Test JSON.has with property name containing right-to-left characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0035";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\u202B": "rightToLeftEmbedding",
        "\u202E": "rightToLeftOverride",
        "\u200F": "rightToLeftMark",
        "שלום": "shalom"
      };

      let result = JSON.has(obj, "שלום");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3600
     * @tc.name      testJson05Chapter0036
     * @tc.desc      Test JSON.has with property name containing mathematical symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0036";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "∑": "summation",
        "∫": "integral",
        "∂": "partialDifferential",
        "∇": "nabla",
        "∏": "product",
        "√": "squareRoot",
        "∞": "infinitySymbol",
        "≠": "notEqual",
        "≈": "approximatelyEqual",
        "≤": "lessThanOrEqual",
        "≥": "greaterThanOrEqual"
      };

      let result = JSON.has(obj, "∑");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3700
     * @tc.name      testJson05Chapter0037
     * @tc.desc      Test JSON.has with property name containing currency symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0037";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "$": "dollar",
        "€": "euro",
        "£": "pound",
        "¥": "yen",
        "₹": "rupee",
        "₽": "ruble",
        "₿": "bitcoin",
        "¢": "cent",
        "¤": "currency"
      };

      let result = JSON.has(obj, "$");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3800
     * @tc.name      testJson05Chapter0038
     * @tc.desc      Test JSON.has with property name containing punctuation from different languages.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0038";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "、": "ideographicComma",
        "。": "ideographicFullStop",
        "「": "leftCornerBracket",
        "」": "rightCornerBracket",
        "『": "leftWhiteCornerBracket",
        "』": "rightWhiteCornerBracket",
        "【": "leftBlackLenticularBracket",
        "】": "rightBlackLenticularBracket",
        "《": "leftDoubleAngleBracket",
        "》": "rightDoubleAngleBracket"
      };

      let result = JSON.has(obj, "。");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_3900
     * @tc.name      testJson05Chapter0039
     * @tc.desc      Test JSON.has with property name containing line separators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0039";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\u2028": "lineSeparator",
        "\u2029": "paragraphSeparator",
        "\u0085": "nextLine"
      };

      let result = JSON.has(obj, "\u2028");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4000
     * @tc.name      testJson05Chapter0040
     * @tc.desc      Test JSON.has with property name containing variation selectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0040";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "☆\uFE00": "starWithVariation1",
        "★\uFE01": "starWithVariation2",
        "☀\uFE02": "sunWithVariation",
        "☁\uFE03": "cloudWithVariation"
      };

      let result = JSON.has(obj, "☆\uFE00");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4100
     * @tc.name      testJson05Chapter0041
     * @tc.desc      Test JSON.has with property name containing tag characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0041";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\uE000": "privateUseFirst",
        "\uF8FF": "privateUseLast",
        "\uFDD0": "nonCharacter1",
        "\uFDEF": "nonCharacter2"
      };

      let result = JSON.has(obj, "\uE000");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4200
     * @tc.name      testJson05Chapter0042
     * @tc.desc      Test JSON.has with property name containing BOM (Byte Order Mark).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0042";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\uFEFF": "bom",
        "\uFFFE": "nonCharacterBOM"
      };

      let result = JSON.has(obj, "\uFEFF");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4300
     * @tc.name      testJson05Chapter0043
     * @tc.desc      Test JSON.has with property name containing musical symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0043";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "♩": "quarterNote",
        "♪": "eighthNote",
        "♫": "beamedEighthNotes",
        "♬": "beamedSixteenthNotes",
        "♭": "flat",
        "♮": "natural",
        "♯": "sharp",
        "𝄞": "gClef",
        "𝄢": "fClef",
        "𝄡": "cClef"
      };

      let result = JSON.has(obj, "♪");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4400
     * @tc.name      testJson05Chapter0044
     * @tc.desc      Test JSON.has with property name containing chess symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0044";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "♔": "whiteKing",
        "♕": "whiteQueen",
        "♖": "whiteRook",
        "♗": "whiteBishop",
        "♘": "whiteKnight",
        "♙": "whitePawn",
        "♚": "blackKing",
        "♛": "blackQueen",
        "♜": "blackRook",
        "♝": "blackBishop",
        "♞": "blackKnight",
        "♟": "blackPawn"
      };

      let result = JSON.has(obj, "♔");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4500
     * @tc.name      testJson05Chapter0045
     * @tc.desc      Test JSON.has with property name containing weather symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0045";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "☀": "sun",
        "☁": "cloud",
        "☂": "umbrella",
        "☃": "snowman",
        "☄": "comet",
        "☉": "sunSymbol",
        "☼": "whiteSun",
        "☽": "firstQuarterMoon",
        "☾": "lastQuarterMoon",
        "☿": "mercury",
        "♀": "venus",
        "♁": "earth",
        "♂": "mars",
        "♃": "jupiter",
        "♄": "saturn",
        "♅": "uranus",
        "♆": "neptune",
        "♇": "pluto"
      };

      let result = JSON.has(obj, "☀");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4600
     * @tc.name      testJson05Chapter0046
     * @tc.desc      Test JSON.has with property name containing zodiac symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0046";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "♈": "aries",
        "♉": "taurus",
        "♊": "gemini",
        "♋": "cancer",
        "♌": "leo",
        "♍": "virgo",
        "♎": "libra",
        "♏": "scorpio",
        "♐": "sagittarius",
        "♑": "capricorn",
        "♒": "aquarius",
        "♓": "pisces"
      };

      let result = JSON.has(obj, "♈");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4700
     * @tc.name      testJson05Chapter0047
     * @tc.desc      Test JSON.has with property name containing playing card symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0047";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "♠": "spade",
        "♣": "club",
        "♥": "heart",
        "♦": "diamond",
        "♤": "whiteSpade",
        "♧": "whiteClub",
        "♡": "whiteHeart",
        "♢": "whiteDiamond"
      };

      let result = JSON.has(obj, "♠");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4800
     * @tc.name      testJson05Chapter0048
     * @tc.desc      Test JSON.has with property name containing recycling symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0048";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "♲": "universalRecycling",
        "♳": "recyclingType1",
        "♴": "recyclingType2",
        "♵": "recyclingType3",
        "♶": "recyclingType4",
        "♷": "recyclingType5",
        "♸": "recyclingType6",
        "♹": "recyclingType7",
        "♺": "recyclingType8",
        "♻": "blackUniversalRecycling",
        "♼": "recycledPaper",
        "♽": "partiallyRecycledPaper"
      };

      let result = JSON.has(obj, "♻");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_4900
     * @tc.name      testJson05Chapter0049
     * @tc.desc      Test JSON.has with property name containing warning symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0049";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "⚠": "warning",
        "⚡": "highVoltage",
        "☢": "radioactive",
        "☣": "biohazard",
        "⬆": "upArrow",
        "⬇": "downArrow",
        "⬅": "leftArrow",
        "➡": "rightArrow"
      };

      let result = JSON.has(obj, "⚠");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5000
     * @tc.name      testJson05Chapter0050
     * @tc.desc      Test JSON.has with property name containing geometric shapes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0050";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "■": "blackSquare",
        "□": "whiteSquare",
        "▲": "blackUpPointingTriangle",
        "△": "whiteUpPointingTriangle",
        "▼": "blackDownPointingTriangle",
        "▽": "whiteDownPointingTriangle",
        "◆": "blackDiamond",
        "◇": "whiteDiamond",
        "●": "blackCircle",
        "○": "whiteCircle",
        "★": "blackStar",
        "☆": "whiteStar"
      };

      let result = JSON.has(obj, "■");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5100
     * @tc.name      testJson05Chapter0051
     * @tc.desc      Test JSON.has with property name containing box drawing characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0051";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "┌": "boxDrawingLightDownAndRight",
        "┐": "boxDrawingLightDownAndLeft",
        "└": "boxDrawingLightUpAndRight",
        "┘": "boxDrawingLightUpAndLeft",
        "├": "boxDrawingLightVerticalAndRight",
        "┤": "boxDrawingLightVerticalAndLeft",
        "┬": "boxDrawingLightDownAndHorizontal",
        "┴": "boxDrawingLightUpAndHorizontal",
        "┼": "boxDrawingLightVerticalAndHorizontal",
        "╔": "boxDrawingDoubleDownAndRight",
        "╗": "boxDrawingDoubleDownAndLeft",
        "╚": "boxDrawingDoubleUpAndRight",
        "╝": "boxDrawingDoubleUpAndLeft"
      };

      let result = JSON.has(obj, "┌");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5200
     * @tc.name      testJson05Chapter0052
     * @tc.desc      Test JSON.has with property name containing braille patterns.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0052";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 0x2800; i <= 0x28FF; i++) {
        obj[String.fromCharCode(i)] = `braille${i.toString(16)}`;
      }

      let result = JSON.has(obj, String.fromCharCode(0x2800));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5300
     * @tc.name      testJson05Chapter0053
     * @tc.desc      Test JSON.has with property name containing cuneiform symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0053";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};
      const baseCode = 0x12000;

      try {
        obj[String.fromCodePoint(baseCode)] = `cuneiform${baseCode.toString(16)}`;
      } catch (e) {
      }

      for (let i = baseCode + 1; i <= 0x123FF; i++) {
        if (i % 100 === 0) {
          try {
            obj[String.fromCodePoint(i)] = `cuneiform${i.toString(16)}`;
          } catch (e) {
          }
        }
      }

      let result = JSON.has(obj, String.fromCodePoint(baseCode));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5400
     * @tc.name      testJson05Chapter0054
     * @tc.desc      Test JSON.has with property name containing Egyptian hieroglyphs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0054";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};
      const baseCode = 0x13000;

      try {
        obj[String.fromCodePoint(baseCode)] = `hieroglyph${baseCode.toString(16)}`;
      } catch (e) {
      }

      for (let i = baseCode + 1; i <= 0x1342F; i++) {
        if (i % 100 === 0) {
          try {
            obj[String.fromCodePoint(i)] = `hieroglyph${i.toString(16)}`;
          } catch (e) {
          }
        }
      }

      let result = JSON.has(obj, String.fromCodePoint(baseCode));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5500
     * @tc.name      testJson05Chapter0055
     * @tc.desc      Test JSON.has with property name containing mathematical alphanumeric symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0055";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};
      const baseCode = 0x1D400;

      try {
        obj[String.fromCodePoint(baseCode)] = `math${baseCode.toString(16)}`;
      } catch (e) {
      }

      for (let i = baseCode + 1; i <= 0x1D7FF; i++) {
        if (i % 100 === 0) {
          try {
            obj[String.fromCodePoint(i)] = `math${i.toString(16)}`;
          } catch (e) {
          }
        }
      }

      let result = JSON.has(obj, String.fromCodePoint(baseCode));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5600
     * @tc.name      testJson05Chapter0056
     * @tc.desc      Test JSON.has with property name containing emoji modifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0056";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "👋\uD83C\uDFFB": "wavingHandLightSkinTone",
        "👋\uD83C\uDFFC": "wavingHandMediumLightSkinTone",
        "👋\uD83C\uDFFD": "wavingHandMediumSkinTone",
        "👋\uD83C\uDFFE": "wavingHandMediumDarkSkinTone",
        "👋\uD83C\uDFFF": "wavingHandDarkSkinTone",
        "👍\uD83C\uDFFB": "thumbsUpLightSkinTone",
        "👍\uD83C\uDFFC": "thumbsUpMediumLightSkinTone",
        "👍\uD83C\uDFFD": "thumbsUpMediumSkinTone",
        "👍\uD83C\uDFFE": "thumbsUpMediumDarkSkinTone",
        "👍\uD83C\uDFFF": "thumbsUpDarkSkinTone"
      };

      let result = JSON.has(obj, "👋\uD83C\uDFFB");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5700
     * @tc.name      testJson05Chapter0057
     * @tc.desc      Test JSON.has with property name containing flag sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0057";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\uD83C\uDDE6\uD83C\uDDFA": "australiaFlag",
        "\uD83C\uDDEB\uD83C\uDDF7": "franceFlag",
        "\uD83C\uDDEC\uD83C\uDDE7": "unitedKingdomFlag",
        "\uD83C\uDDFA\uD83C\uDDF8": "unitedStatesFlag",
        "\uD83C\uDDEF\uD83C\uDDF5": "japanFlag",
        "\uD83C\uDDE8\uD83C\uDDF3": "chinaFlag",
        "\uD83C\uDDF7\uD83C\uDDFA": "russiaFlag",
        "\uD83C\uDDEE\uD83C\uDDF3": "indiaFlag"
      };

      let result = JSON.has(obj, "\uD83C\uDDE6\uD83C\uDDFA");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5800
     * @tc.name      testJson05Chapter0058
     * @tc.desc      Test JSON.has with property name containing ZWJ sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0058";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "👨\u200D👩\u200D👧\u200D👦": "familyManWomanGirlBoy",
        "👩\u200D🏫": "womanTeacher",
        "👨\u200D💻": "manTechnologist",
        "👩\u200D🔬": "womanScientist",
        "👨\u200D🚀": "manAstronaut",
        "👩\u200D✈️": "womanPilot",
        "👨\u200D❤️\u200D👨": "coupleWithHeartManMan",
        "👩\u200D❤️\u200D👩": "coupleWithHeartWomanWoman"
      };

      let result = JSON.has(obj, "👨\u200D👩\u200D👧\u200D👦");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_5900
     * @tc.name      testJson05Chapter0059
     * @tc.desc      Test JSON.has with property name containing keycap sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0059";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "0\uFE0F\u20E3": "keycap0",
        "1\uFE0F\u20E3": "keycap1",
        "2\uFE0F\u20E3": "keycap2",
        "3\uFE0F\u20E3": "keycap3",
        "4\uFE0F\u20E3": "keycap4",
        "5\uFE0F\u20E3": "keycap5",
        "6\uFE0F\u20E3": "keycap6",
        "7\uFE0F\u20E3": "keycap7",
        "8\uFE0F\u20E3": "keycap8",
        "9\uFE0F\u20E3": "keycap9",
        "*\uFE0F\u20E3": "keycapAsterisk",
        "#\uFE0F\u20E3": "keycapNumberSign"
      };

      let result = JSON.has(obj, "0\uFE0F\u20E3");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_6000
     * @tc.name      testJson05Chapter0060
     * @tc.desc      Test JSON.has with property name containing regional indicator symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0060";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 0x1F1E6; i <= 0x1F1FF; i++) {
        obj[String.fromCodePoint(i)] = `regional${i.toString(16)}`;
      }

      let result = JSON.has(obj, String.fromCodePoint(0x1F1E6));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_6100
     * @tc.name      testJson05Chapter0061
     * @tc.desc      Test JSON.has with property name containing tag sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0061";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {
        "\uDB40\uDC61\uDB40\uDC62\uDB40\uDC63\uDB40\uDC64\uDB40\uDC65\uDB40\uDC66": "tagABC",
        "\uDB40\uDC67\uDB40\uDC68\uDB40\uDC69\uDB40\uDC6A\uDB40\uDC6B\uDB40\uDC6C": "tagGHIJKL",
        "\uDB40\uDC7F\uDB40\uDC7F\uDB40\uDC7F\uDB40\uDC7F\uDB40\uDC7F\uDB40\uDC7F": "tagCancel"
      };

      let result = JSON.has(obj, "\uDB40\uDC61\uDB40\uDC62\uDB40\uDC63\uDB40\uDC64\uDB40\uDC65\uDB40\uDC66");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST05_6200
     * @tc.name      testJson05Chapter0062
     * @tc.desc      Test JSON.has with property name containing variation selector sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson05Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testJson05Chapter0062";
      console.log(TAG + ' Start');
      let obj: Record<string, string> = {};

      for (let i = 0xFE00; i <= 0xFE0F; i++) {
        obj["A" + String.fromCharCode(i)] = `variation${i.toString(16)}`;
      }

      for (let i = 0xE0100; i <= 0xE01EF; i++) {
        if (i % 16 === 0) {
          try {
            obj["B" + String.fromCodePoint(i)] = `variationSupplement${i.toString(16)}`;
          } catch (e) {
          }
        }
      }

      let result = JSON.has(obj, "A" + String.fromCharCode(0xFE00));
      expect(result).assertEqual(true);
    });
  })
}
