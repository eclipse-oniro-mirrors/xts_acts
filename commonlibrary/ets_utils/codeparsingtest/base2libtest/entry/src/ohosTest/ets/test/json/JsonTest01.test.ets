import { JSON } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Json01Test() {
  describe('Json01Test', () => {
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

    interface Person {
      name: string;
      age: number;
      city: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_0100
     * @tc.name      testJson01Chapter0001
     * @tc.desc      Test parsing valid JSON string with basic structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0001';
      console.log(TAG + ' start');
      const jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
      const obj = JSON.parse(jsonText) as Person;
      expect(obj?.name).assertEqual("John");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0200
     * @tc.name      testJson01Chapter0002
     * @tc.desc      Test parsing null input string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0002';
      console.log(TAG + ' start');
      const jsonText = 'null';
      const result = JSON.parse(jsonText);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0300
     * @tc.name      testJson01Chapter0003
     * @tc.desc      Test parsing empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0003';
      console.log(TAG + ' start');
      const jsonText = '{}';
      const obj = JSON.parse(jsonText);
      expect(Object.keys(obj as object).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0400
     * @tc.name      testJson01Chapter0004
     * @tc.desc      Test parsing array with TypedArray like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0004';
      console.log(TAG + ' start');
      const jsonText = '[72, 101, 108, 108, 111]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0500
     * @tc.name      testJson01Chapter0005
     * @tc.desc      Test parsing number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0005';
      console.log(TAG + ' start');
      const jsonText = '{"min": -128, "max": 127}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["min"]).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0600
     * @tc.name      testJson01Chapter0006
     * @tc.desc      Test parsing Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0006';
      console.log(TAG + ' start');
      const jsonText = '{"min": 0, "max": 255}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0700
     * @tc.name      testJson01Chapter0007
     * @tc.desc      Test parsing Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0007';
      console.log(TAG + ' start');
      const jsonText = '{"min": -32768, "max": 32767}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["min"]).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0800
     * @tc.name      testJson01Chapter0008
     * @tc.desc      Test parsing Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0008';
      console.log(TAG + ' start');
      const jsonText = '{"min": 0, "max": 65535}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_0900
     * @tc.name      testJson01Chapter0009
     * @tc.desc      Test parsing Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0009';
      console.log(TAG + ' start');
      const jsonText = '{"min": -2147483648, "max": 2147483647}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1000
     * @tc.name      testJson01Chapter0010
     * @tc.desc      Test parsing Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0010';
      console.log(TAG + ' start');
      const jsonText = '{"max": 4294967295}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(4294967295);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1100
     * @tc.name      testJson01Chapter0011
     * @tc.desc      Test parsing Float32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0011';
      console.log(TAG + ' start');
      const jsonText = '{"value": 3.4028234663852886e38}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["value"]).assertEqual(3.4028234663852886e38);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1200
     * @tc.name      testJson01Chapter0012
     * @tc.desc      Test parsing Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0012';
      console.log(TAG + ' start');
      const jsonText = '{"value": 1.7976931348623157e308}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["value"]).assertEqual(1.7976931348623157e308);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1300
     * @tc.name      testJson01Chapter0013
     * @tc.desc      Test parsing special number values: Infinity, -Infinity, NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0013';
      console.log(TAG + ' start');
      const jsonText = '{"inf": Infinity, "ninf": -Infinity, "nan": NaN}';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1400
     * @tc.name      testJson01Chapter0014
     * @tc.desc      Test parsing string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0014';
      console.log(TAG + ' start');
      const jsonText = '{"special": "!\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["special"]).assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1500
     * @tc.name      testJson01Chapter0015
     * @tc.desc      Test parsing string with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0015';
      console.log(TAG + ' start');
      const jsonText = '{"escapes": "\\n\\r\\t\\\\\\"\\/"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["escapes"]).assertEqual("\n\r\t\\\"/");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1600
     * @tc.name      testJson01Chapter0016
     * @tc.desc      Test parsing string with emoji Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0016';
      console.log(TAG + ' start');
      const jsonText = '{"emoji": "👆👿👀💯"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["emoji"]).assertEqual("👆👿👀💯");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1700
     * @tc.name      testJson01Chapter0017
     * @tc.desc      Test parsing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0017';
      console.log(TAG + ' start');
      const jsonText = '{"trueVal": true, "falseVal": false}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, boolean>)?.["trueVal"]).assertTrue();
      expect((obj as Record<string, boolean>)?.["falseVal"]).assertFalse();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_1800
     * @tc.name      testJson01Chapter0018
     * @tc.desc      Test parsing array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0018';
      console.log(TAG + ' start');
      const jsonText = '[72, "abc", true, null, 108]';
      const arr = JSON.parse(jsonText) as Array<number | string | boolean | null>;
      expect(arr.length).assertEqual(5);
    });

    interface DeepNestedObject {
      e: number;
    }

    interface MidNestedObject {
      c: number;
      d: DeepNestedObject;
    }

    interface NestedObject {
      a: number;
      b: MidNestedObject;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_1900
     * @tc.name      testJson01Chapter0019
     * @tc.desc      Test parsing nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0019';
      console.log(TAG + ' start');
      const jsonText = '{"a":1, "b":{"c":2, "d":{"e":3}}}';
      const obj = JSON.parse(jsonText) as NestedObject;
      expect(obj?.b?.c).assertEqual(2);
    });

    interface ObjectWithNull {
      a: null;
      b: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_2000
     * @tc.name      testJson01Chapter0020
     * @tc.desc      Test parsing object with undefined and null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0020';
      console.log(TAG + ' start');
      const jsonText = '{"a":null, "b":1}';
      const obj = JSON.parse(jsonText) as ObjectWithNull;
      expect(obj?.a).assertEqual(null);
    });

    interface PersonWithAge {
      name: string;
      age: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_2100
     * @tc.name      testJson01Chapter0021
     * @tc.desc      Test parsing with reviver function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0021';
      console.log(TAG + ' start');
      const reviverFunc = (key: string, value: Object | undefined | null): Object | undefined | null => {
        if (key === "age" && typeof value === 'number') {
          return value + 1;
        }
        return value;
      };
      const jsonText = '{"name": "John", "age": 30}';
      const obj = JSON.parse(jsonText, reviverFunc) as PersonWithAge;
      expect(obj?.age).assertEqual(31);
    });

    interface ObjectWithBigInt {
      number: number;
      largeNumber: bigint;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_2200
     * @tc.name      testJson01Chapter0022
     * @tc.desc      Test parsing with bigIntMode option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0022';
      console.log(TAG + ' start');
      const numberText = '{"number": 10, "largeNumber": 112233445566778899}';
      const options: JSON.ParseOptions = { bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT };
      const numberObj = JSON.parse(numberText, null, options) as ObjectWithBigInt;
      expect(typeof numberObj?.largeNumber).assertEqual("bigint");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2300
     * @tc.name      testJson01Chapter0023
     * @tc.desc      Test parsing empty string (should fail)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0023';
      console.log(TAG + ' start');
      const jsonText = '';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2400
     * @tc.name      testJson01Chapter0024
     * @tc.desc      Test parsing invalid JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0024';
      console.log(TAG + ' start');
      const jsonText = '{"name": John}';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2500
     * @tc.name      testJson01Chapter0025
     * @tc.desc      Test parsing string with invalid Unicode escape
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0025';
      console.log(TAG + ' start');
      const jsonText = '{"unicode": "\\udc04"}';
      try {
        const obj = JSON.parse(jsonText);
        expect((obj as Record<string, string>)?.["unicode"]).assertEqual("\udc04");
      } catch (err) {
        expect(err instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2600
     * @tc.name      testJson01Chapter0026
     * @tc.desc      Test parsing number with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0026';
      console.log(TAG + ' start');
      const jsonText = '{"sci1": 1e3, "sci2": 2.5e-2}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["sci1"]).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2700
     * @tc.name      testJson01Chapter0027
     * @tc.desc      Test parsing hex and octal numbers (invalid in JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0027';
      console.log(TAG + ' start');
      const jsonText = '{"hex": 0x0102, "octal": 0o10}';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_2800
     * @tc.name      testJson01Chapter0028
     * @tc.desc      Test parsing array with overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0028';
      console.log(TAG + ' start');
      const jsonText = '[256, 65536, 32768]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>)[0]).assertEqual(256);
    });

    interface ObjectWithSymbolKey {
      "Symbol(key)": string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_2900
     * @tc.name      testJson01Chapter0029
     * @tc.desc      Test parsing object with Symbol-like keys (not valid JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0029';
      console.log(TAG + ' start');
      const jsonText = '{"Symbol(key)": "value"}';
      try {
        const obj = JSON.parse(jsonText) as ObjectWithSymbolKey;
        expect(Reflect.get(obj, "Symbol(key)")).assertEqual("value");
      } catch (err) {
        expect(err instanceof Error).assertTrue();
      }
    });

    interface ObjectWithAProperty {
      a: number;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_3000
     * @tc.name      testJson01Chapter0030
     * @tc.desc      Test parsing large JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0030';
      console.log(TAG + ' start');
      const jsonText = createLargeJsonArray(1000);
      const arr = JSON.parse(jsonText) as Array<ObjectWithAProperty>;
      expect(Array.isArray(arr)).assertTrue();
    });

    interface ObjectWithOptionalProperties {
      keep: string;
      removeMe?: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_3100
     * @tc.name      testJson01Chapter0031
     * @tc.desc      Test parsing with reviver returning undefined (should delete property)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0031';
      console.log(TAG + ' start');
      const reviverFunc = (key: string, value: Object | undefined | null): Object | undefined | null => {
        if (key === "removeMe") {
          return undefined;
        }
        return value;
      };
      const jsonText = '{"keep": "this", "removeMe": "delete"}';
      const obj = JSON.parse(jsonText, reviverFunc) as ObjectWithOptionalProperties;
      expect(obj?.keep).assertEqual("this");
      expect(obj?.removeMe).assertUndefined();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_3200
     * @tc.name      testJson01Chapter0032
     * @tc.desc      Test parsing Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0032';
      console.log(TAG + ' start');
      const maxSafe = Number.MAX_SAFE_INTEGER;
      const jsonText = `{"maxSafe": ${maxSafe}}`;
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["maxSafe"]).assertEqual(maxSafe);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_3300
     * @tc.name      testJson01Chapter0033
     * @tc.desc      Test parsing Number.MIN_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0033';
      console.log(TAG + ' start');
      const minSafe = Number.MIN_SAFE_INTEGER;
      const jsonText = `{"minSafe": ${minSafe}}`;
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["minSafe"]).assertEqual(minSafe);
    });

    interface ObjectWithKey {
      key: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_3400
     * @tc.name      testJson01Chapter0034
     * @tc.desc      Test parsing with duplicate keys (last wins in JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0034';
      console.log(TAG + ' start');
      const jsonText = '{"key": "first", "key": "second"}';
      const obj = JSON.parse(jsonText) as ObjectWithKey;
      expect(obj?.key).assertEqual("second");
    });

    interface DeeplyNestedObject {
      nested: DeeplyNestedObject | string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_3500
     * @tc.name      testJson01Chapter0035
     * @tc.desc      Test parsing deeply nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0035';
      console.log(TAG + ' start');
      const jsonText = createNestedJson(10);
      const obj = JSON.parse(jsonText) as DeeplyNestedObject;
      let current: DeeplyNestedObject | string = obj;
      for (let i = 0; i < 10; i++) {
        current = (current as DeeplyNestedObject)?.nested;
      }
      expect(current).assertEqual("value");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_3600
     * @tc.name      testJson01Chapter0036
     * @tc.desc      Test parsing array with trailing comma (invalid JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0036';
      console.log(TAG + ' start');
      const jsonText = '[1, 2, 3,]';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_3700
     * @tc.name      testJson01Chapter0037
     * @tc.desc      Test parsing object with trailing comma (invalid JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0037';
      console.log(TAG + ' start');
      const jsonText = '{"a": 1, "b": 2,}';
      let errorCaught: boolean = false;
      try {
        JSON.parse(jsonText);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_3800
     * @tc.name      testJson01Chapter0038
     * @tc.desc      Test parsing special string values "0", "NaN", "Infinity"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0038';
      console.log(TAG + ' start');
      const jsonText = '{"zero": "0", "nan": "NaN", "inf": "Infinity"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["zero"]).assertEqual("0");
    });

    interface AsciiTestObject {
      ascii: string;
    }

    /**
     * @tc.number    SUB_JSON_TEST01_3900
     * @tc.name      testJson01Chapter0039
     * @tc.desc      Test parsing with all ASCII characters in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0039';
      console.log(TAG + ' start');
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        if (i !== 34 && i !== 92) {
          asciiStr += String.fromCharCode(i);
        }
      }
      const objToSerialize: AsciiTestObject = { ascii: asciiStr };
      const jsonText = JSON.stringify(objToSerialize);
      const obj = JSON.parse(jsonText);
      expect(Reflect.get(obj, "ascii") as string).assertEqual(asciiStr);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4000
     * @tc.name      testJson01Chapter0040
     * @tc.desc      Test parsing with multiple consecutive special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0040';
      console.log(TAG + ' start');
      const jsonText = '{"special": "!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@[[\\\\\\\\]]^^__``{{||}}~~"}';
      const obj = JSON.parse(jsonText);
      expect(typeof (obj as Record<string, string>)?.["special"]).assertEqual("string");
    });
    /**
     * @tc.number    SUB_JSON_TEST01_4100
     * @tc.name      testJson01Chapter0041
     * @tc.desc      Test parsing Int8Array boundary and out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0041';
      console.log(TAG + ' start');
      const jsonText = '{"min": -128, "max": 127, "out1": -129, "out2": 128}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["min"]).assertEqual(-128);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4200
     * @tc.name      testJson01Chapter0042
     * @tc.desc      Test parsing Uint8Array boundary and out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0042';
      console.log(TAG + ' start');
      const jsonText = '{"min": 0, "max": 255, "out1": -1, "out2": 256}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["min"]).assertEqual(0);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4300
     * @tc.name      testJson01Chapter0043
     * @tc.desc      Test parsing Uint8ClampedArray behavior with out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0043';
      console.log(TAG + ' start');
      const jsonText = '{"min": 0, "max": 255, "out1": -1, "out2": 256}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["out1"]).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4400
     * @tc.name      testJson01Chapter0044
     * @tc.desc      Test parsing Float32Array out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0044';
      console.log(TAG + ' start');
      const jsonText = '{"normal": 3.4028234663852886e38, "out": 3.5e38}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["normal"]).assertEqual(3.4028234663852886e38);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4500
     * @tc.name      testJson01Chapter0045
     * @tc.desc      Test parsing Float64Array out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0045';
      console.log(TAG + ' start');
      const jsonText = '{"normal": 1.7976931348623157e308, "out": 1.8e308}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["normal"]).assertEqual(1.7976931348623157e308);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4600
     * @tc.name      testJson01Chapter0046
     * @tc.desc      Test parsing BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0046';
      console.log(TAG + ' start');
      const jsonText = '{"min": -9223372036854775808, "max": 9223372036854775807}';
      const options: JSON.ParseOptions = { bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT };
      const obj = JSON.parse(jsonText, null, options);
      expect(typeof (obj as Record<string, bigint>)?.["min"]).assertEqual("bigint");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4700
     * @tc.name      testJson01Chapter0047
     * @tc.desc      Test parsing BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0047';
      console.log(TAG + ' start');
      const jsonText = '{"min": 0, "max": 18446744073709551615}';
      const options: JSON.ParseOptions = { bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT };
      const obj = JSON.parse(jsonText, null, options);
      expect(typeof (obj as Record<string, bigint>)?.["max"]).assertEqual("bigint");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4800
     * @tc.name      testJson01Chapter0048
     * @tc.desc      Test parsing TypedArray special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0048';
      console.log(TAG + ' start');
      const jsonText = '{"inf": "Infinity", "ninf": "-Infinity", "nan": "NaN"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["inf"]).assertEqual("Infinity");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_4900
     * @tc.name      testJson01Chapter0049
     * @tc.desc      Test parsing string with undefined, null, empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0049';
      console.log(TAG + ' start');
      const jsonText = '{"undef": "undefined", "nullStr": "null", "empty": ""}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["empty"]).assertEqual("");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5000
     * @tc.name      testJson01Chapter0050
     * @tc.desc      Test parsing all escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0050';
      console.log(TAG + ' start');
      const jsonText = '{"escapes": "\\\\n\\\\r\\\\t\\\\\\\\\\\\\\"\\\\/"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["escapes"]).assertEqual("\\n\\r\\t\\\\\\\"\\/");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5100
     * @tc.name      testJson01Chapter0051
     * @tc.desc      Test parsing byte type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0051';
      console.log(TAG + ' start');
      const jsonText = '{"byteMin": -128, "byteMax": 127}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["byteMin"]).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5200
     * @tc.name      testJson01Chapter0052
     * @tc.desc      Test parsing short type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0052';
      console.log(TAG + ' start');
      const jsonText = '{"shortMin": -32768, "shortMax": 32767}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["shortMax"]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5300
     * @tc.name      testJson01Chapter0053
     * @tc.desc      Test parsing int type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0053';
      console.log(TAG + ' start');
      const jsonText = '{"intMin": -2147483648, "intMax": 2147483647}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["intMin"]).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5400
     * @tc.name      testJson01Chapter0054
     * @tc.desc      Test parsing long type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0054';
      console.log(TAG + ' start');
      const jsonText = '{"longMin": -9223372036854775808, "longMax": 9223372036854775807}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["longMax"]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5500
     * @tc.name      testJson01Chapter0055
     * @tc.desc      Test parsing float type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0055';
      console.log(TAG + ' start');
      const jsonText = '{"float": 3.40282346638528860e+38}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["float"]).assertEqual(3.40282346638528860e+38);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5600
     * @tc.name      testJson01Chapter0056
     * @tc.desc      Test parsing double type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0056';
      console.log(TAG + ' start');
      const jsonText = '{"double": 1.79769313486231570e+308}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["double"]).assertEqual(1.79769313486231570e+308);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5700
     * @tc.name      testJson01Chapter0057
     * @tc.desc      Test parsing char type number range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0057';
      console.log(TAG + ' start');
      const jsonText = '{"charMin": 0, "charMax": 65535}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["charMax"]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5800
     * @tc.name      testJson01Chapter0058
     * @tc.desc      Test parsing hex numbers (invalid in JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0058';
      console.log(TAG + ' start');
      const jsonText = '{"hex": "0x0102"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["hex"]).assertEqual("0x0102");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_5900
     * @tc.name      testJson01Chapter0059
     * @tc.desc      Test parsing octal numbers (invalid in JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0059';
      console.log(TAG + ' start');
      const jsonText = '{"octal": "0o10"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["octal"]).assertEqual("0o10");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6000
     * @tc.name      testJson01Chapter0060
     * @tc.desc      Test parsing exponent operator expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0060';
      console.log(TAG + ' start');
      const jsonText = '{"exp": 8}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["exp"]).assertEqual(8);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6100
     * @tc.name      testJson01Chapter0061
     * @tc.desc      Test parsing array with multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0061';
      console.log(TAG + ' start');
      const jsonText = '[72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>).length).assertEqual(19);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6200
     * @tc.name      testJson01Chapter0062
     * @tc.desc      Test parsing array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0062';
      console.log(TAG + ' start');
      const jsonText = '[72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>)[6]).assertEqual(-111);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6300
     * @tc.name      testJson01Chapter0063
     * @tc.desc      Test parsing array with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0063';
      console.log(TAG + ' start');
      const jsonText = '[72, 101, "NaN", "Infinity", 108, 111]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number | string>)[2]).assertEqual("NaN");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6400
     * @tc.name      testJson01Chapter0064
     * @tc.desc      Test parsing array with non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0064';
      console.log(TAG + ' start');
      const jsonText = '[72, "abc", true, null, "undefined", 108]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number | string | boolean | null>).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6500
     * @tc.name      testJson01Chapter0065
     * @tc.desc      Test parsing empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0065';
      console.log(TAG + ' start');
      const jsonText = '[]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6600
     * @tc.name      testJson01Chapter0066
     * @tc.desc      Test parsing array with overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0066';
      console.log(TAG + ' start');
      const jsonText = '[256, 65536, 32768]';
      const arr = JSON.parse(jsonText);
      expect((arr as Array<number>)[1]).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6700
     * @tc.name      testJson01Chapter0067
     * @tc.desc      Test parsing object with function property (as string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0067';
      console.log(TAG + ' start');
      const jsonText = '{"a":1, "b":"function(){}"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number | string>)?.["b"]).assertEqual("function(){}");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6800
     * @tc.name      testJson01Chapter0068
     * @tc.desc      Test parsing object with inherited properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0068';
      console.log(TAG + ' start');
      const jsonText = '{"a":1}';
      const obj = JSON.parse(jsonText) as never as object;
      const newObj = JSON.parse(JSON.stringify(obj)) as never as object;
      expect(JSON.has(newObj, "a")).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_6900
     * @tc.name      testJson01Chapter0069
     * @tc.desc      Test parsing object with non-enumerable property (as normal property)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0069';
      console.log(TAG + ' start');
      const jsonText = '{"a":1, "nonEnum":2}';
      const obj = JSON.parse(jsonText) as never as object;
      expect(JSON.has(obj, "nonEnum")).assertEqual(true);
      const objStr = JSON.stringify(obj);
      expect(objStr.includes("nonEnum")).assertEqual(true);
      expect(objStr.includes("2")).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7000
     * @tc.name      testJson01Chapter0070
     * @tc.desc      Test parsing object with mixed Symbol and string keys (Symbol as string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0070';
      console.log(TAG + ' start');
      const jsonText = '{"a":1, "Symbol(key)":2, "b":3}';
      const obj = JSON.parse(jsonText) as never as object;
      expect(JSON.has(obj, "Symbol(key)")).assertEqual(true);
      const objStr = JSON.stringify(obj);
      expect(objStr.includes("Symbol(key)\":2")).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7100
     * @tc.name      testJson01Chapter0071
     * @tc.desc      Test parsing object with ArrayBuffer property (as object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0071';
      console.log(TAG + ' start');
      const jsonText = '{"buffer": {"type": "ArrayBuffer", "size": 16}}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, Record<string, string | number>>)?.["buffer"]?.["type"]).assertEqual("ArrayBuffer");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7200
     * @tc.name      testJson01Chapter0072
     * @tc.desc      Test parsing object with DataView property (as object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0072';
      console.log(TAG + ' start');
      const jsonText = '{"view": {"type": "DataView", "bufferSize": 16}}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, Record<string, string | number>>)?.["view"]?.["type"]).assertEqual("DataView");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7300
     * @tc.name      testJson01Chapter0073
     * @tc.desc      Test parsing object with undefined property value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0073';
      console.log(TAG + ' start');
      const jsonText = '{"a":null, "b":1}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number | null>)?.["a"]).assertEqual(null);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7400
     * @tc.name      testJson01Chapter0074
     * @tc.desc      Test parsing object with NaN property (as string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0074';
      console.log(TAG + ' start');
      const jsonText = '{"a":"NaN", "b":1}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number | string>)?.["a"]).assertEqual("NaN");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7500
     * @tc.name      testJson01Chapter0075
     * @tc.desc      Test parsing object with Infinity property (as string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0075';
      console.log(TAG + ' start');
      const jsonText = '{"a":"Infinity", "b":1}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number | string>)?.["a"]).assertEqual("Infinity");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7600
     * @tc.name      testJson01Chapter0076
     * @tc.desc      Test parsing object with TypedArray property (as array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0076';
      console.log(TAG + ' start');
      const jsonText = '{"buffer": [72,101,108,108,111]}';
      const obj = JSON.parse(jsonText);
      expect(Array.isArray((obj as Record<string, Array<number>>)?.["buffer"])).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7700
     * @tc.name      testJson01Chapter0077
     * @tc.desc      Test parsing object with Map property (as array of entries)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0077';
      console.log(TAG + ' start');
      const jsonText = '{"map": [["key1", "value1"], ["key2", {"a":1}]]}';
      const obj = JSON.parse(jsonText) as never as object;
      const objStr = JSON.stringify(obj);
      expect(objStr.includes('"map":[[')).assertEqual(true);
      expect(objStr.includes('"key1",')).assertEqual(true);
      expect(objStr.includes('"value1"]')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7800
     * @tc.name      testJson01Chapter0078
     * @tc.desc      Test parsing object with Set property (as array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0078';
      console.log(TAG + ' start');
      const jsonText = '{"set": [1,2,3,2,1]}';
      const obj = JSON.parse(jsonText);
      expect(Array.isArray((obj as Record<string, Array<number>>)?.["set"])).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_7900
     * @tc.name      testJson01Chapter0079
     * @tc.desc      Test parsing object with Promise property (as object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0079';
      console.log(TAG + ' start');
      const jsonText = '{"promise": {"state": "pending", "value": null}}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, Record<string, string | null>>)?.["promise"]?.["state"]).assertEqual("pending");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8000
     * @tc.name      testJson01Chapter0080
     * @tc.desc      Test parsing object with RegExp property (as object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0080';
      console.log(TAG + ' start');
      const jsonText = '{"regex": {"pattern": "abc", "flags": "gi"}}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, Record<string, string>>)?.["regex"]?.["flags"]).assertEqual("gi");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8100
     * @tc.name      testJson01Chapter0081
     * @tc.desc      Test parsing very large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0081';
      console.log(TAG + ' start');
      let jsonText = '{';
      for (let i = 0; i < 1000; i++) {
        jsonText += `"key${i}": ${i},`;
      }
      jsonText = jsonText.slice(0, -1) + '}';
      const obj = JSON.parse(jsonText);
      expect(Object.keys(obj as object).length).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8200
     * @tc.name      testJson01Chapter0082
     * @tc.desc      Test parsing treeString type (deeply nested JSON)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0082';
      console.log(TAG + ' start');
      const jsonText = createTreeString(10);
      const obj = JSON.parse(jsonText);
      expect(Array.isArray(obj)).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8300
     * @tc.name      testJson01Chapter0083
     * @tc.desc      Test parsing sliceString type (substring manipulation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0083';
      console.log(TAG + ' start');
      const original = '{"k1":"value1","k2":"value2"}';
      const sliced = original.substring(0, original.length - 2);
      let errorCaught: boolean = false;
      try {
        JSON.parse(sliced);
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8400
     * @tc.name      testJson01Chapter0084
     * @tc.desc      Test parsing with delete keyword simulation (remove property via reviver)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0084';
      console.log(TAG + ' start');
      const reviverFunc = (key: string, value: Object | undefined | null): Object | undefined | null => {
        if (key === "deleteMe") {
          return undefined;
        }
        return value;
      };
      const jsonText = '{"keep": "this", "deleteMe": "remove"}';
      const obj = JSON.parse(jsonText, reviverFunc);
      expect((obj as Record<string, string>)?.["keep"]).assertEqual("this");
      expect((obj as Record<string, string>)?.["deleteMe"]).assertUndefined();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8500
     * @tc.name      testJson01Chapter0085
     * @tc.desc      Test parsing with delete non-existent property simulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0085';
      console.log(TAG + ' start');
      const reviverFunc = (key: string, value: object | undefined | null): object | undefined | null => {
        if (key === "nonExistent") {
          return undefined;
        }
        return value;
      };
      const jsonText = '{"existing": "value"}';
      const obj = JSON.parse(jsonText, reviverFunc);
      expect((obj as Record<string, string>)?.["existing"]).assertEqual("value");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8600
     * @tc.name      testJson01Chapter0086
     * @tc.desc      Test parsing with delete non-configurable property simulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0086';
      console.log(TAG + ' start');
      const jsonText = '{"configurable": "yes", "nonConfigurable": "no"}';
      const obj = JSON.parse(jsonText) as never as object;
      expect(JSON.has(obj, "configurable")).assertEqual(true);
      expect(JSON.has(obj, "nonConfigurable")).assertEqual(true);
      const objStr = JSON.stringify(obj);
      expect(objStr.includes('"configurable":"yes"')).assertEqual(true);
      expect(objStr.includes('"nonConfigurable":"no"')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8700
     * @tc.name      testJson01Chapter0087
     * @tc.desc      Test parsing with all special characters twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0087';
      console.log(TAG + ' start');
      const specialChars = '!!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const obj = JSON.parse(JSON.stringify({ special: specialChars })) as never as object;
      const objStr = JSON.stringify(obj);
      expect(objStr.includes('"special":')).assertEqual(true);
      expect(objStr.includes('!!')).assertEqual(true);
      expect(objStr.includes('##')).assertEqual(true);
      expect(objStr.includes('$$')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8800
     * @tc.name      testJson01Chapter0088
     * @tc.desc      Test parsing with all ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0088';
      console.log(TAG + ' start');
      let ascii = '';
      for (let i = 32; i <= 126; i++) {
        const char = String.fromCharCode(i);
        if (char === '"' || char === '\\') {
          ascii += '\\' + char;
        } else {
          ascii += char;
        }
      }
      const jsonText = `{"ascii": "${ascii}"}`;
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["ascii"].length).assertEqual(95);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_8900
     * @tc.name      testJson01Chapter0089
     * @tc.desc      Test parsing with emoji Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0089';
      console.log(TAG + ' start');
      const jsonText = '{"emoji": "\\ud83d\\udc46\\ud83d\\udc7f\\ud83d\\udc40"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["emoji"]).assertEqual("👆👿👀");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9000
     * @tc.name      testJson01Chapter0090
     * @tc.desc      Test parsing with invalid Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0090';
      console.log(TAG + ' start');
      const jsonText = '{"invalid": "\\udc04\\ud83d\\udff4"}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, string>)?.["invalid"]).assertEqual("\udc04\ud83d\udff4");
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9100
     * @tc.name      testJson01Chapter0091
     * @tc.desc      Test parsing with boolean-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0091';
      console.log(TAG + ' start');
      const jsonText = '{"zero": 0, "empty": "", "nullVal": null, "falseVal": false}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number | string | boolean | null>)?.["zero"]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9200
     * @tc.name      testJson01Chapter0092
     * @tc.desc      Test parsing with Number.MAX_VALUE and Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0092';
      console.log(TAG + ' start');
      const jsonText = `{"max": ${Number.MAX_VALUE}, "min": ${Number.MIN_VALUE}}`;
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["max"]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9300
     * @tc.name      testJson01Chapter0093
     * @tc.desc      Test parsing with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0093';
      console.log(TAG + ' start');
      const jsonText = `{"epsilon": ${Number.EPSILON}}`;
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["epsilon"]).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9400
     * @tc.name      testJson01Chapter0094
     * @tc.desc      Test parsing with -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0094';
      console.log(TAG + ' start');
      const jsonText = '{"negZero": -0}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["negZero"]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9500
     * @tc.name      testJson01Chapter0095
     * @tc.desc      Test parsing with double type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0095';
      console.log(TAG + ' start');
      const jsonText = '{"double": 123.456}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["double"]).assertEqual(123.456);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9600
     * @tc.name      testJson01Chapter0096
     * @tc.desc      Test parsing with float type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0096';
      console.log(TAG + ' start');
      const jsonText = '{"float": 3405691582}';
      const obj = JSON.parse(jsonText) as never as object;
      const objStr = JSON.stringify(obj);
      expect(objStr.includes('"float":3405691582')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9700
     * @tc.name      testJson01Chapter0097
     * @tc.desc      Test parsing with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0097';
      console.log(TAG + ' start');
      const jsonText = '{"sci1": 1e3, "sci2": 2.5e-2}';
      const obj = JSON.parse(jsonText);
      expect((obj as Record<string, number>)?.["sci2"]).assertEqual(0.025);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9800
     * @tc.name      testJson01Chapter0098
     * @tc.desc      Test parsing with very large BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0098';
      console.log(TAG + ' start');
      const jsonText = '{"big": 9007199254740991}';
      const obj = JSON.parse(jsonText) as never as object;
      const objStr = JSON.stringify(obj);
      expect(objStr.includes('"big":9007199254740991')).assertEqual(true);
    });

    /**
     * @tc.number    SUB_JSON_TEST01_9900
     * @tc.name      testJson01Chapter0099
     * @tc.desc      Test parsing with ! operator simulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0099';
      console.log(TAG + ' start');
      const jsonText = '{"str": "s", "zero": 0}';
      const reviverFunc = (key: string, value: Object | undefined | null): Object | undefined | null => {
        if (key === "str" && typeof value === 'string') {
          return !value;
        }
        if (key === "zero" && typeof value === 'number') {
          return !value;
        }
        return value;
      };
      const obj = JSON.parse(jsonText, reviverFunc);
      expect((obj as Record<string, boolean>)?.["str"]).assertFalse();
    });

    /**
     * @tc.number    SUB_JSON_TEST01_10000
     * @tc.name      testJson01Chapter0100
     * @tc.desc      Test parsing with complex mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJson01Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testJson01Chapter0100';
      console.log(TAG + ' start');
      const jsonText = '{"array": [1,2,3], "obj": {"a":1}, "str": "test", "num": 123, "bool": true, "null": null}';
      const obj = JSON.parse(jsonText);
      expect(Array.isArray((obj as Record<string, Array<number>>)?.["array"])).assertTrue();
      expect(typeof (obj as Record<string, Record<string, number>>)?.["obj"]).assertEqual("object");
    });
  })
}

function createLargeJsonArray(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

function createNestedJson(depth: number): string {
  let json = '"value"';
  for (let i = 0; i < depth; i++) {
    json = `{"nested": ${json}}`;
  }
  return json;
}

function createTreeString(depth: number): string {
  let result = '[';
  for (let i = 0; i < depth; i++) {
    result += '{"a":1},';
  }
  result = result.slice(0, -1) + ']';
  return result;
}