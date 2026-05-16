import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

interface EmptyObject {}

interface SpecialCharsTestObject {
  normal: string;
}

interface NumericPairObject {
  a: number;
  b: number;
}

interface UndefinedPropertyObject {
  a?: undefined;
  b: number;
}

interface SpecialValueObject {
  a: number;
  b: number;
}

interface MaxValueObject {
  max: number;
  normal: number;
}

interface MinValueObject {
  min: number;
  normal: number;
}

interface LargeObject extends Record<string, string> {}

interface TypedArrayObject<T extends ArrayBufferView> {
  typedArray: T;
}

interface AsciiStringObject {
  ascii: string;
}

interface EscapeCharsObject {
  escapes: string;
}

interface EmojiStringObject {
  emojis: string;
}

interface MaxSafeIntegerObject {
  maxSafe: number;
}

interface BigIntObject {
  bigint: bigint;
}

interface HexValueObject {
  hex: number;
}

interface BinaryValueObject {
  binary: number;
}

interface ScientificNotationObject {
  sci1: number;
  sci2: number;
}

interface BooleanObject {
  flag: boolean;
}

interface ZeroValueObject {
  zero: number;
}

interface EmptyStringObject {
  empty: string;
}

interface NumberArrayObject {
  array: number[];
}

interface MixedArrayObject {
  array: (number | string | boolean | null | undefined)[];
}

interface DeepNestedObject {
  e: number;
}

interface MiddleNestedObject {
  c: number;
  d: DeepNestedObject;
}

interface NestedObject {
  a: number;
  b: MiddleNestedObject;
}

interface FunctionObject {
  a: number;
  b: () => void;
}

interface ArrayBufferObject {
  buffer: ArrayBuffer;
}

interface DataViewObject {
  view: DataView;
}

interface MapObjectValue {
  a: number;
}

interface MapObject {
  map: Map<string, MapObjectValue | string>;
}

interface SetObject {
  set: Set<number>;
}

interface PromiseObject {
  promise: Promise<string>;
}

interface RegExpObject {
  regex: RegExp;
  flags: RegExp;
}

interface LargeObjWrapper {
  data: Record<string, string>;
}

interface LargeArrayObject {
  array: number[];
}

interface TreeStringObject {
  tree: string;
}

interface SliceStringObject {
  slice: string;
}

interface LargeStringObject {
  large: string;
}

interface EpsilonObject {
  epsilon: number;
}

interface DoubleFloatObject {
  double: number;
  float: number;
}

interface ExponentObject {
  exponent: number;
}

interface OctalValueObject {
  octal: number;
}

interface Uint8ClampedArrayObject {
  clamped: Uint8ClampedArray;
}

interface Int16ArrayObject {
  int16: Int16Array;
}

interface Uint16ArrayObject {
  uint16: Uint16Array;
}

interface Int32ArrayObject {
  int32: Int32Array;
}

interface Uint32ArrayObject {
  uint32: Uint32Array;
}

interface Float64ArrayObject {
  float64: Float64Array;
}

interface BigUint64ArrayObject {
  bigUint64: BigUint64Array;
}

interface SpecialArrayObject {
  specialArray: number[];
}

interface OverflowArrayObject {
  overflow: number[];
}

interface InvalidUnicodeObject {
  invalidUnicode: string;
}

interface KeywordObject {
  keyword: string;
  nan: string;
  empty: string;
}

interface RepeatedSpecialObject {
  repeated: string;
}

interface LargeStringWithNormalObject {
  large: string;
  normal: string;
}

interface SpecialRecord {
  abc: number;
  aaa: number;
}

interface TestObject {
  specialArray: SpecialRecord;
}

export function initTreeString(size: number): string {
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

export default function Json06Test() {
  describe('Json06Test', () => {
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
     * @tc.number    SUB_JSON_TEST06_0100
     * @tc.name      testJson06Chapter0001
     * @tc.desc      Test remove normal property from object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0001';
        console.log(TAG + ' Start');
        const jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "name");
        const result = JSON.has(inputObj, "name");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0200
     * @tc.name      testJson06Chapter0002
     * @tc.desc      Test remove property with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0002';
        console.log(TAG + ' Start');
        const inputObj: UndefinedPropertyObject = { a: undefined, b: 1 };
        JSON.remove(inputObj, "a");
        const result = JSON.has(inputObj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0300
     * @tc.name      testJson06Chapter0003
     * @tc.desc      Test remove property with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0003';
        console.log(TAG + ' Start');
        const jsonText = '{"a": null, "b": 1}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "a");
        const result = JSON.has(inputObj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0400
     * @tc.name      testJson06Chapter0004
     * @tc.desc      Test remove property with empty string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0004';
        console.log(TAG + ' Start');
        const jsonText = '{"a": "", "b": 1}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "a");
        const result = JSON.has(inputObj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0500
     * @tc.name      testJson06Chapter0005
     * @tc.desc      Test remove property with special characters in name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0005';
        console.log(TAG + ' Start');
        const jsonText = '{"!@#$%^&*()": "value1", "normal": "value2"}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "!@#$%^&*()");
        const result = JSON.has(inputObj, "!@#$%^&*()");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0600
     * @tc.name      testJson06Chapter0006
     * @tc.desc      Test remove property with unicode characters in name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0006';
        console.log(TAG + ' Start');
        const jsonText = '{"👆": "value1", "🎅": "value2"}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "👆");
        const result = JSON.has(inputObj, "👆");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0700
     * @tc.name      testJson06Chapter0007
     * @tc.desc      Test remove property from nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0007';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1, "b": {"c": 2, "d": 3}}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "b");
        const result = JSON.has(inputObj, "b");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0800
     * @tc.name      testJson06Chapter0008
     * @tc.desc      Test remove non-existent property should not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0008';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1, "b": 2}';
        const inputObj = JSON.parse(jsonText);

        let removeSucceeded = false;
        let errorCaught = false;

        try {
          JSON.remove(inputObj, "c");
          removeSucceeded = true;
          const resultA = JSON.has(inputObj, "a");
          const resultB = JSON.has(inputObj, "b");
          expect(resultA).assertTrue();
          expect(resultB).assertTrue();
        } catch (error) {
          errorCaught = true;
        }

        expect(removeSucceeded).assertTrue();
        expect(errorCaught).assertFalse();
      });

    /**
     * @tc.number    SUB_JSON_TEST06_0900
     * @tc.name      testJson06Chapter0009
     * @tc.desc      Test remove property from empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0009';
        console.log(TAG + ' Start');
        const jsonText = '{}';
        const inputObj = JSON.parse(jsonText);

        let removeSucceeded = false;
        let errorCaught = false;
        let propertyExistsAfterRemoval = true;

        try {
          JSON.remove(inputObj, "a");
          removeSucceeded = true;
          propertyExistsAfterRemoval = JSON.has(inputObj, "a");
        } catch (error) {
          errorCaught = true;
        }

        expect(removeSucceeded).assertTrue();
        expect(errorCaught).assertFalse();
        expect(propertyExistsAfterRemoval).assertFalse();
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1000
     * @tc.name      testJson06Chapter0010
     * @tc.desc      Test remove property with number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0010';
        console.log(TAG + ' Start');
        const jsonText = '{"age": 30, "height": 180.5}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "age");
        const result = JSON.has(inputObj, "age");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1100
     * @tc.name      testJson06Chapter0011
     * @tc.desc      Test remove property with boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0011';
        console.log(TAG + ' Start');
        const jsonText = '{"enabled": true, "active": false}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "enabled");
        const result = JSON.has(inputObj, "enabled");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1200
     * @tc.name      testJson06Chapter0012
     * @tc.desc      Test remove property with array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0012';
        console.log(TAG + ' Start');
        const jsonText = '{"items": [1, 2, 3], "tags": ["a", "b"]}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "items");
        const result = JSON.has(inputObj, "items");
        expect(result).assertEqual(false);
      });


    /**
     * @tc.number    SUB_JSON_TEST06_1300
     * @tc.name      testJson06Chapter0013
     * @tc.desc      Test remove with invalid first parameter (array instead of object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0013';
        console.log(TAG + ' Start');
        const jsonText = '[1, 2, 3]';
        const inputObj = JSON.parse(jsonText);
        let hasError = false;
        try {
          JSON.remove(inputObj, "0");
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1400
     * @tc.name      testJson06Chapter0014
     * @tc.desc      Test remove with missing first parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0014';
        console.log(TAG + ' Start');
        let hasError = false;
        try {
          JSON.remove(undefined, "property");
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1500
     * @tc.name      testJson06Chapter0015
     * @tc.desc      Test remove with missing second parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0015';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1}';
        const inputObj = JSON.parse(jsonText);
        let hasError = false;
        try {
          JSON.remove(inputObj, undefined);
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1600
     * @tc.name      testJson06Chapter0016
     * @tc.desc      Test remove with non-string second parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0016';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1}';
        const inputObj = JSON.parse(jsonText);
        let hasError = false;
        try {
          JSON.remove(inputObj, 123 as never as string);
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1700
     * @tc.name      testJson06Chapter0017
     * @tc.desc      Test remove with null as first parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0017';
        console.log(TAG + ' Start');
        let hasError = false;
        try {
          JSON.remove(null, "property");
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1800
     * @tc.name      testJson06Chapter0018
     * @tc.desc      Test remove with number as first parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0018';
        console.log(TAG + ' Start');
        let hasError = false;
        try {
          JSON.remove(123 as never as object, "property");
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_1900
     * @tc.name      testJson06Chapter0019
     * @tc.desc      Test remove with boolean as first parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0019';
        console.log(TAG + ' Start');
        let hasError = false;
        try {
          JSON.remove(true as never as object, "property");
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2000
     * @tc.name      testJson06Chapter0020
     * @tc.desc      Test remove with object as property name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0020';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1}';
        const inputObj = JSON.parse(jsonText);
        let hasError = false;
        try {
          let emptyObj: EmptyObject = {};
          JSON.remove(inputObj, emptyObj as never as string);
        } catch (error) {
          hasError = true;
        }
        expect(hasError).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2100
     * @tc.name      testJson06Chapter0021
     * @tc.desc      Test remove property with NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0021';
        console.log(TAG + ' Start');
        const obj: NumericPairObject = { "a": NaN as never as number, "b": 1 };
        JSON.remove(obj, "a");
        const result = JSON.has(obj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2200
     * @tc.name      testJson06Chapter0022
     * @tc.desc      Test remove property with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0022';
        console.log(TAG + ' Start');
        const obj: NumericPairObject = { "a": Infinity as never as number, "b": 1 };
        JSON.remove(obj, "a");
        const result = JSON.has(obj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2300
     * @tc.name      testJson06Chapter0023
     * @tc.desc      Test remove property with -Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0023';
        console.log(TAG + ' Start');
        const obj: NumericPairObject = { "a": -Infinity as never as number, "b": 1 };
        JSON.remove(obj, "a");
        const result = JSON.has(obj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2400
     * @tc.name      testJson06Chapter0024
     * @tc.desc      Test remove property with escape characters in name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0024';
        console.log(TAG + ' Start');
        const jsonText = '{"line\\nbreak": "value1", "tab\\tchar": "value2"}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "line\nbreak");
        const result = JSON.has(inputObj, "line\nbreak");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2500
     * @tc.name      testJson06Chapter0025
     * @tc.desc      Test remove multiple properties sequentially
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0025';
        console.log(TAG + ' Start');
        const jsonText = '{"a": 1, "b": 2, "c": 3, "d": 4}';
        const inputObj = JSON.parse(jsonText);

        JSON.remove(inputObj, "a");
        JSON.remove(inputObj, "c");

        const resultA = JSON.has(inputObj, "a");
        const resultB = JSON.has(inputObj, "b");
        const resultC = JSON.has(inputObj, "c");
        const resultD = JSON.has(inputObj, "d");

        expect(resultA).assertEqual(false);
        expect(resultB).assertEqual(true);
        expect(resultC).assertEqual(false);
        expect(resultD).assertEqual(true);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2600
     * @tc.name      testJson06Chapter0026
     * @tc.desc      Test remove property with zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0026';
        console.log(TAG + ' Start');
        const jsonText = '{"zero": 0, "negativeZero": -0}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "zero");
        const result = JSON.has(inputObj, "zero");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2700
     * @tc.name      testJson06Chapter0027
     * @tc.desc      Test remove property with maximum number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0027';
        console.log(TAG + ' Start');
        const maxValue = Number.MAX_VALUE;
        const obj: MaxValueObject = { "max": maxValue, "normal": 1 };
        JSON.remove(obj, "max");
        const result = JSON.has(obj, "max");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2800
     * @tc.name      testJson06Chapter0028
     * @tc.desc      Test remove property with minimum positive number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0028';
        console.log(TAG + ' Start');
        const minValue = Number.MIN_VALUE;
        const obj: MinValueObject = { "min": minValue, "normal": 1 };
        JSON.remove(obj, "min");
        const result = JSON.has(obj, "min");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_2900
     * @tc.name      testJson06Chapter0029
     * @tc.desc      Test remove property from large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0029';
        console.log(TAG + ' Start');
        let largeObj: LargeObject = {};
        for (let i = 0; i < 1000; i++) {
          largeObj[`key${i}`] = `value${i}`;
        }
        largeObj["targetKey"] = "targetValue";

        JSON.remove(largeObj, "targetKey");
        const result = JSON.has(largeObj, "targetKey");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3000
     * @tc.name      testJson06Chapter0030
     * @tc.desc      Test remove property with all special characters in name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0030';
        console.log(TAG + ' Start');
        const simpleSpecialChars = "!@#$%^&*()_+-=[]{}|;:,.<>?";
        const objStr = `{"normal":"value2","${simpleSpecialChars.replace(/"/g, '\\"')}":"value"}`;
        const inputObj = JSON.parse(objStr) as never as object;
        JSON.remove(inputObj, simpleSpecialChars);
        const result = JSON.has(inputObj, simpleSpecialChars);
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3100
     * @tc.name      testJson06Chapter0031
     * @tc.desc      Test remove property when same property exists multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0031';
        console.log(TAG + ' Start');
        const obj: NumericPairObject = { "a": 1, "b": 2 };
        JSON.remove(obj, "a");
        const result = JSON.has(obj, "a");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3200
     * @tc.name      testJson06Chapter0032
     * @tc.desc      Test remove property with scientific notation value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0032';
        console.log(TAG + ' Start');
        const jsonText = '{"sci": 1.23e4, "negativeSci": 5.67e-8}';
        const inputObj = JSON.parse(jsonText);
        JSON.remove(inputObj, "sci");
        const result = JSON.has(inputObj, "sci");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3300
     * @tc.name      testJson06Chapter0033
     * @tc.desc      Test property removal after multiple JSON operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0033';
        console.log(TAG + ' Start');
        const jsonText1 = '{"a": 1, "b": 2}';
        const jsonText2 = '{"c": 3, "d": 4}';

        const obj1 = JSON.parse(jsonText1);
        const obj2 = JSON.parse(jsonText2);

        const obj1Str = JSON.stringify(obj1);
        const obj2Str = JSON.stringify(obj2);
        const mergedObjStr = obj1Str.substring(0, obj1Str.length - 1) + "," + obj2Str.substring(1);
        const mergedObj: object = JSON.parse(mergedObjStr) as object;

        JSON.remove(mergedObj, "a");
        JSON.remove(mergedObj, "c");

        const resultA = JSON.has(mergedObj, "a");
        const resultB = JSON.has(mergedObj, "b");
        const resultC = JSON.has(mergedObj, "c");
        const resultD = JSON.has(mergedObj, "d");

        expect(resultA).assertEqual(false);
        expect(resultB).assertEqual(true);
        expect(resultC).assertEqual(false);
        expect(resultD).assertEqual(true);
      });
    /**
     * @tc.number    SUB_JSON_TEST06_3400
     * @tc.name      testJson06Chapter0034
     * @tc.desc      Test remove property with TypedArray value (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0034';
        console.log(TAG + ' Start');
        const obj: TypedArrayObject<Int8Array> = { typedArray: new Int8Array([1, 2, 3, -128, 127]) };
        JSON.remove(obj, "typedArray");
        const result = JSON.has(obj, "typedArray");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3500
     * @tc.name      testJson06Chapter0035
     * @tc.desc      Test remove property with Uint8Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0035';
        console.log(TAG + ' Start');
        const obj: TypedArrayObject<Uint8Array> = { typedArray: new Uint8Array([0, 255, 100]) };
        JSON.remove(obj, "typedArray");
        const result = JSON.has(obj, "typedArray");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3600
     * @tc.name      testJson06Chapter0036
     * @tc.desc      Test remove property with Float32Array value (including Infinity/NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0036';
        console.log(TAG + ' Start');
        const obj: TypedArrayObject<Float32Array> = { typedArray: new Float32Array([1.5, Infinity, -Infinity, NaN]) };
        JSON.remove(obj, "typedArray");
        const result = JSON.has(obj, "typedArray");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3700
     * @tc.name      testJson06Chapter0037
     * @tc.desc      Test remove property with BigInt64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0037';
        console.log(TAG + ' Start');
        const obj: TypedArrayObject<BigInt64Array> =
          { typedArray: new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]) };
        JSON.remove(obj, "typedArray");
        const result = JSON.has(obj, "typedArray");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3800
     * @tc.name      testJson06Chapter0038
     * @tc.desc      Test remove property with all ASCII characters in value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0038';
        console.log(TAG + ' Start');
        const asciiStr =
          '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        const obj: AsciiStringObject = { ascii: asciiStr };
        JSON.remove(obj, "ascii");
        const result = JSON.has(obj, "ascii");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_3900
     * @tc.name      testJson06Chapter0039
     * @tc.desc      Test remove property with escape characters in value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0039';
        console.log(TAG + ' Start');
        const obj: EscapeCharsObject = {
          escapes: "\\\\a\\\\b\\\\f\\\\n\\\\r\\\\t\\\\v\\\\\\\\\\\\'\\\"\\\\?\\\\0\\\\101\\\\x41"
        };
        JSON.remove(obj, "escapes");
        const result = JSON.has(obj, "escapes");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4000
     * @tc.name      testJson06Chapter0040
     * @tc.desc      Test remove property with emoji characters in value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0040';
        console.log(TAG + ' Start');
        const obj: EmojiStringObject = {
          emojis: "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴"
        };
        JSON.remove(obj, "emojis");
        const result = JSON.has(obj, "emojis");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4100
     * @tc.name      testJson06Chapter0041
     * @tc.desc      Test remove property with Number.MAX_SAFE_INTEGER value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0041';
        console.log(TAG + ' Start');
        const obj: MaxSafeIntegerObject = { maxSafe: Number.MAX_SAFE_INTEGER };
        JSON.remove(obj, "maxSafe");
        const result = JSON.has(obj, "maxSafe");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4200
     * @tc.name      testJson06Chapter0042
     * @tc.desc      Test remove property with BigInt value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0042';
        console.log(TAG + ' Start');
        const obj: BigIntObject = { bigint: BigInt(0xdecafafecacefade) };
        JSON.remove(obj, "bigint");
        const result = JSON.has(obj, "bigint");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4300
     * @tc.name      testJson06Chapter0043
     * @tc.desc      Test remove property with hexadecimal number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0043';
        console.log(TAG + ' Start');
        const obj: HexValueObject = { hex: 0x0102 };
        JSON.remove(obj, "hex");
        const result = JSON.has(obj, "hex");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4400
     * @tc.name      testJson06Chapter0044
     * @tc.desc      Test remove property with scientific notation value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0044';
        console.log(TAG + ' Start');
        const obj: ScientificNotationObject = { sci1: 1e3, sci2: 2.5e-2 };
        JSON.remove(obj, "sci1");
        const result = JSON.has(obj, "sci1");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4500
     * @tc.name      testJson06Chapter0045
     * @tc.desc      Test remove property with false boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0045';
        console.log(TAG + ' Start');
        const obj: BooleanObject = { flag: false };
        JSON.remove(obj, "flag");
        const result = JSON.has(obj, "flag");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4600
     * @tc.name      testJson06Chapter0046
     * @tc.desc      Test remove property with 0 value (often used as false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0046';
        console.log(TAG + ' Start');
        const obj: ZeroValueObject = { zero: 0 };
        JSON.remove(obj, "zero");
        const result = JSON.has(obj, "zero");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4700
     * @tc.name      testJson06Chapter0047
     * @tc.desc      Test remove property with empty string value (often used as false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0047';
        console.log(TAG + ' Start');
        const obj: EmptyStringObject = { empty: "" };
        JSON.remove(obj, "empty");
        const result = JSON.has(obj, "empty");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4800
     * @tc.name      testJson06Chapter0048
     * @tc.desc      Test remove property with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0048';
        console.log(TAG + ' Start');
        const obj: NumberArrayObject =
          { array: [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63] };
        JSON.remove(obj, "array");
        const result = JSON.has(obj, "array");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_4900
     * @tc.name      testJson06Chapter0049
     * @tc.desc      Test remove property with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0049';
        console.log(TAG + ' Start');
        const obj: NumberArrayObject = { array: [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63] };
        JSON.remove(obj, "array");
        const result = JSON.has(obj, "array");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5000
     * @tc.name      testJson06Chapter0050
     * @tc.desc      Test remove property with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0050';
        console.log(TAG + ' Start');
        const obj: NumberArrayObject = { array: [72, 101, NaN, Infinity, 108, 111] };
        JSON.remove(obj, "array");
        const result = JSON.has(obj, "array");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5100
     * @tc.name      testJson06Chapter0051
     * @tc.desc      Test remove property with array containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0051';
        console.log(TAG + ' Start');
        const obj: MixedArrayObject = { array: [72, "abc", true, null, undefined, 108] };
        JSON.remove(obj, "array");
        const result = JSON.has(obj, "array");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5200
     * @tc.name      testJson06Chapter0052
     * @tc.desc      Test remove property with empty array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0052';
        console.log(TAG + ' Start');
        const obj: NumberArrayObject = { array: [] };
        JSON.remove(obj, "array");
        const result = JSON.has(obj, "array");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5300
     * @tc.name      testJson06Chapter0053
     * @tc.desc      Test remove property from nested object structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0053';
        console.log(TAG + ' Start');
        const obj: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
        JSON.remove(obj, "b");
        const result = JSON.has(obj, "b");
        expect(result).assertEqual(false);
      });


    /**
     * @tc.number    SUB_JSON_TEST06_5400
     * @tc.name      testJson06Chapter0054
     * @tc.desc      Test remove object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0054';
        console.log(TAG + ' Start');
        const obj: FunctionObject = {
          a: 1, b: () => {
          }
        };
        JSON.remove(obj, "a");
        const result = JSON.has(obj, "a");
        expect(result).assertEqual(false);
      });


    /**
     * @tc.number    SUB_JSON_TEST06_5500
     * @tc.name      testJson06Chapter0055
     * @tc.desc      Test remove property with ArrayBuffer value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0055';
        console.log(TAG + ' Start');
        const obj: ArrayBufferObject = { buffer: new ArrayBuffer(16) };
        JSON.remove(obj, "buffer");
        const result = JSON.has(obj, "buffer");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5600
     * @tc.name      testJson06Chapter0056
     * @tc.desc      Test remove property with DataView value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0056';
        console.log(TAG + ' Start');
        const obj: DataViewObject = { view: new DataView(new ArrayBuffer(16)) };
        JSON.remove(obj, "view");
        const result = JSON.has(obj, "view");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5700
     * @tc.name      testJson06Chapter0057
     * @tc.desc      Test remove property with Map value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0057';
        console.log(TAG + ' Start');
        const mapValue: MapObjectValue = { a: 1 };
        const obj: MapObject =
          { map: new Map<string, MapObjectValue | string>([['key1', 'value1'], ['key2', mapValue]]) };
        JSON.remove(obj, "map");
        const result = JSON.has(obj, "map");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5800
     * @tc.name      testJson06Chapter0058
     * @tc.desc      Test remove property with Set value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0058';
        console.log(TAG + ' Start');
        const obj: SetObject = { set: new Set([1, 2, 3, 2, 1]) };
        JSON.remove(obj, "set");
        const result = JSON.has(obj, "set");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_5900
     * @tc.name      testJson06Chapter0059
     * @tc.desc      Test remove property with Promise value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0059';
        console.log(TAG + ' Start');
        const obj: PromiseObject = { promise: new Promise((resolve) => setTimeout(() => resolve('done'), 100)) };
        JSON.remove(obj, "promise");
        const result = JSON.has(obj, "promise");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6000
     * @tc.name      testJson06Chapter0060
     * @tc.desc      Test remove property with RegExp value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0060';
        console.log(TAG + ' Start');
        const obj: RegExpObject = { regex: /abc/gi, flags: /def/m };
        JSON.remove(obj, "regex");
        const result = JSON.has(obj, "regex");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6100
     * @tc.name      testJson06Chapter0061
     * @tc.desc      Test remove property from large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0061';
        console.log(TAG + ' Start');
        const largeObj: Record<string, string> = {};
        for (let i = 0; i < 10000; i++) {
          largeObj[`key${i}`] = `value${i}`;
        }
        const obj: LargeObjWrapper = { data: largeObj };
        JSON.remove(obj, "data");
        const result = JSON.has(obj, "data");
        expect(result).assertEqual(false);
      });


    /**
     * @tc.number    SUB_JSON_TEST06_6200
     * @tc.name      testJson06Chapter0062
     * @tc.desc      Test remove property with tree string value (large JSON string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0062';
        console.log(TAG + ' Start');
        const treeString = initTreeString(1000);
        const obj: TreeStringObject = { tree: treeString };
        JSON.remove(obj, "tree");
        const result = JSON.has(obj, "tree");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6300
     * @tc.name      testJson06Chapter0063
     * @tc.desc      Test remove property with slice string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0063';
        console.log(TAG + ' Start');
        const str = "{k1:value1,k2:value2}";
        const slicedStr = str.substring(0, str.length - 2);
        const obj: SliceStringObject = { slice: slicedStr };
        JSON.remove(obj, "slice");
        const result = JSON.has(obj, "slice");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6400
     * @tc.name      testJson06Chapter0064
     * @tc.desc      Test remove property with very large string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0064';
        console.log(TAG + ' Start');
        const largeString = "a".repeat(10000);
        const obj: LargeStringObject = { large: largeString };
        JSON.remove(obj, "large");
        const result = JSON.has(obj, "large");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6500
     * @tc.name      testJson06Chapter0065
     * @tc.desc      Test remove property with Number.EPSILON value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0065';
        console.log(TAG + ' Start');
        const obj: EpsilonObject = { epsilon: Number.EPSILON };
        JSON.remove(obj, "epsilon");
        const result = JSON.has(obj, "epsilon");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6600
     * @tc.name      testJson06Chapter0066
     * @tc.desc      Test remove property with double precision float value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0066';
        console.log(TAG + ' Start');
        const obj: DoubleFloatObject = { double: 123.456, float: 0xcafebabe };
        JSON.remove(obj, "double");
        const result = JSON.has(obj, "double");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6700
     * @tc.name      testJson06Chapter0067
     * @tc.desc      Test remove property with exponent operator value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0067';
        console.log(TAG + ' Start');
        const obj: ExponentObject = { exponent: 2**3 };
        JSON.remove(obj, "exponent");
        const result = JSON.has(obj, "exponent");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6800
     * @tc.name      testJson06Chapter0068
     * @tc.desc      Test remove property with octal value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0068';
        console.log(TAG + ' Start');
        const obj: OctalValueObject = { octal: 0o3 };
        JSON.remove(obj, "octal");
        const result = JSON.has(obj, "octal");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_6900
     * @tc.name      testJson06Chapter0069
     * @tc.desc      Test remove property with Uint8ClampedArray value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0069';
        console.log(TAG + ' Start');
        const obj: Uint8ClampedArrayObject = { clamped: new Uint8ClampedArray([0, 255, 300, -1]) };
        JSON.remove(obj, "clamped");
        const result = JSON.has(obj, "clamped");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7000
     * @tc.name      testJson06Chapter0070
     * @tc.desc      Test remove property with Int16Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0070';
        console.log(TAG + ' Start');
        const obj: Int16ArrayObject = { int16: new Int16Array([-32768, 0, 32767]) };
        JSON.remove(obj, "int16");
        const result = JSON.has(obj, "int16");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7100
     * @tc.name      testJson06Chapter0071
     * @tc.desc      Test remove property with Uint16Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0071';
        console.log(TAG + ' Start');
        const obj: Uint16ArrayObject = { uint16: new Uint16Array([0, 32768, 65535]) };
        JSON.remove(obj, "uint16");
        const result = JSON.has(obj, "uint16");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7200
     * @tc.name      testJson06Chapter0072
     * @tc.desc      Test remove property with Int32Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0072';
        console.log(TAG + ' Start');
        const obj: Int32ArrayObject = { int32: new Int32Array([-2147483648, 0, 2147483647]) };
        JSON.remove(obj, "int32");
        const result = JSON.has(obj, "int32");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7300
     * @tc.name      testJson06Chapter0073
     * @tc.desc      Test remove property with Uint32Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0073';
        console.log(TAG + ' Start');
        const obj: Uint32ArrayObject = { uint32: new Uint32Array([0, 2147483648, 4294967295]) };
        JSON.remove(obj, "uint32");
        const result = JSON.has(obj, "uint32");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7400
     * @tc.name      testJson06Chapter0074
     * @tc.desc      Test remove property with Float64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0074';
        console.log(TAG + ' Start');
        const obj: Float64ArrayObject =
          { float64: new Float64Array([-1.7976931348623157e308, 0, 1.7976931348623157e308]) };
        JSON.remove(obj, "float64");
        const result = JSON.has(obj, "float64");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7500
     * @tc.name      testJson06Chapter0075
     * @tc.desc      Test remove property with BigUint64Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0075';
        console.log(TAG + ' Start');
        const obj: BigUint64ArrayObject = { bigUint64: new BigUint64Array([0n, 18446744073709551615n]) };
        JSON.remove(obj, "bigUint64");
        const result = JSON.has(obj, "bigUint64");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7600
     * @tc.name      testJson06Chapter0076
     * @tc.desc      Test remove property with special array index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0076';
        console.log(TAG + ' Start');
        const specialRecord: SpecialRecord = {
          abc: 111,
          aaa: 222
        };

        const obj: TestObject = {
          specialArray: specialRecord
        };

        JSON.remove(obj, "specialArray");
        const result = JSON.has(obj, "specialArray");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7700
     * @tc.name      testJson06Chapter0077
     * @tc.desc      Test remove property with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0077';
        console.log(TAG + ' Start');
        const obj: OverflowArrayObject = { overflow: [256, 65536, 32768] };
        JSON.remove(obj, "overflow");
        const result = JSON.has(obj, "overflow");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7800
     * @tc.name      testJson06Chapter0078
     * @tc.desc      Test remove property with invalid Unicode string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0078';
        console.log(TAG + ' Start');
        const obj: InvalidUnicodeObject = { invalidUnicode: "\udc04\ud83d\udff4" };
        JSON.remove(obj, "invalidUnicode");
        const result = JSON.has(obj, "invalidUnicode");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_7900
     * @tc.name      testJson06Chapter0079
     * @tc.desc      Test remove property with keyword string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0079';
        console.log(TAG + ' Start');
        const obj: KeywordObject = { keyword: "0", nan: "NaN", empty: "" };
        JSON.remove(obj, "keyword");
        const result = JSON.has(obj, "keyword");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_8000
     * @tc.name      testJson06Chapter0080
     * @tc.desc      Test remove property with repeated special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0080';
        console.log(TAG + ' Start');
        const repeatedSpecial = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        const obj: RepeatedSpecialObject = { repeated: repeatedSpecial };
        JSON.remove(obj, "repeated");
        const result = JSON.has(obj, "repeated");
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_JSON_TEST06_8100
     * @tc.name      testJson06Chapter0081
     * @tc.desc      Test remove property after potential garbage collection
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson06Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testJson06Chapter0081';
        console.log(TAG + ' Start');
        let largeString = "a".repeat(1000000);
        const obj: LargeStringWithNormalObject = { large: largeString, normal: "test" };
        largeString = "";

        JSON.remove(obj, "normal");
        const result = JSON.has(obj, "normal");
        expect(result).assertEqual(false);
      });
  })
}
