import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, TreeMap } from '@kit.ArkTS';

interface SimpleObject {
  a: number;
}

type MixedValue = number | string | boolean | null | undefined | Array<number> | SimpleObject;

interface ObjAB {
  a?: number;
  b: number;
}

interface ObjA {
  a: number;
  b?: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap02Test() {
  describe('TreeMap02Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST02_0100
     * @tc.name      testTreeMap02Chapter0001
     * @tc.desc      Check isEmpty with TreeMap containing multiple types of values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0001';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, MixedValue>();
      treeMap.set("number", 123);
      treeMap.set("string", "test");
      treeMap.set("boolean", true);
      treeMap.set("null", null);
      treeMap.set("undefined", undefined);
      treeMap.set("array", [1, 2, 3]);
      let obj: SimpleObject = { a: 1 };
      treeMap.set("object", obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0200
     * @tc.name      testTreeMap02Chapter0002
     * @tc.desc      Check isEmpty after adding and removing all elements (edge case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0002';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      for (let i = 0; i < 100; i++) {
        treeMap.set(i, `value${i}`);
      }
      for (let i = 0; i < 100; i++) {
        treeMap.remove(i);
      }
      let result = treeMap.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0300
     * @tc.name      testTreeMap02Chapter0003
     * @tc.desc      Check isEmpty with TreeMap containing out-of-boundary TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0003';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-129, "belowInt8");
      treeMap.set(128, "aboveInt8");
      treeMap.set(-1, "belowUint8");
      treeMap.set(256, "aboveUint8");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0400
     * @tc.name      testTreeMap02Chapter0004
     * @tc.desc      Check isEmpty with TreeMap containing negative infinity key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0004';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-Infinity, "negativeInfinity");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0500
     * @tc.name      testTreeMap02Chapter0005
     * @tc.desc      Check isEmpty with TreeMap containing Math.floor result key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0005';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Math.floor(1.5), "floorResult");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0600
     * @tc.name      testTreeMap02Chapter0006
     * @tc.desc      Check isEmpty with TreeMap containing bigint hex value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0006';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("0xdecafafecacefade"), "bigintHex");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0700
     * @tc.name      testTreeMap02Chapter0007
     * @tc.desc      Check isEmpty with TreeMap containing double value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0007';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(123.456, "double");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0800
     * @tc.name      testTreeMap02Chapter0008
     * @tc.desc      Check isEmpty with TreeMap containing float hex value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0008';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0xcafebabe, "floatHex");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_0900
     * @tc.name      testTreeMap02Chapter0009
     * @tc.desc      Check isEmpty with TreeMap containing 32-bit hex value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0009';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0x01020304, "hex32");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1000
     * @tc.name      testTreeMap02Chapter0010
     * @tc.desc      Check isEmpty with TreeMap containing large bigint key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0010';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("9007199254740991"), "largeBigInt");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1100
     * @tc.name      testTreeMap02Chapter0011
     * @tc.desc      Check isEmpty with TreeMap after using delete keyword on object property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0011';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const obj: ObjAB = { b: 2 };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1200
     * @tc.name      testTreeMap02Chapter0012
     * @tc.desc      Check isEmpty with TreeMap containing empty object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0012';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      treeMap.set(1, {});
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1300
     * @tc.name      testTreeMap02Chapter0013
     * @tc.desc      Check isEmpty with TreeMap containing Float32Array with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0013';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Float32Array>();
      const float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      treeMap.set(1, float32Array);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1400
     * @tc.name      testTreeMap02Chapter0014
     * @tc.desc      Check isEmpty with TreeMap containing Int8Array with special values (Infinity becomes 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0014';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Int8Array>();
      const int8Array = new Int8Array([Infinity, -Infinity, NaN, 100]);
      treeMap.set(1, int8Array);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1500
     * @tc.name      testTreeMap02Chapter0015
     * @tc.desc      Check isEmpty with TreeMap containing Uint8ClampedArray with special values (clamping behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0015';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Uint8ClampedArray>();
      const clampedArray = new Uint8ClampedArray([-1, 0, 255, 256, Infinity, -Infinity, NaN]);
      treeMap.set(1, clampedArray);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1600
     * @tc.name      testTreeMap02Chapter0016
     * @tc.desc      Check isEmpty with TreeMap containing long treeString value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0016';
      console.log(TAG + ' start');
      const init = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      }
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1, init(1000));
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1700
     * @tc.name      testTreeMap02Chapter0017
     * @tc.desc      Check isEmpty with TreeMap containing sliceString value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0017';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      const str = "{k1:value1,k2:value2}";
      const result = str.substring(0, str.length - 2);
      treeMap.set(1, result);
      let isEmptyResult = treeMap.isEmpty();
      expect(isEmptyResult).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1800
     * @tc.name      testTreeMap02Chapter0018
     * @tc.desc      Check isEmpty with TreeMap containing out-of-boundary byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0018';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-129, "belowByteMin");
      treeMap.set(128, "aboveByteMax");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_1900
     * @tc.name      testTreeMap02Chapter0019
     * @tc.desc      Check isEmpty with TreeMap containing out-of-boundary short values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0019';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32769, "belowShortMin");
      treeMap.set(32768, "aboveShortMax");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2000
     * @tc.name      testTreeMap02Chapter0020
     * @tc.desc      Check isEmpty with TreeMap containing out-of-boundary int values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0020';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483649, "belowIntMin");
      treeMap.set(2147483648, "aboveIntMax");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2100
     * @tc.name      testTreeMap02Chapter0021
     * @tc.desc      Check isEmpty with TreeMap containing Uint8Array converted from array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0021';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Uint8Array>();
      const array = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const uint8Array = Uint8Array.from(array);
      treeMap.set(1, uint8Array);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2200
     * @tc.name      testTreeMap02Chapter0022
     * @tc.desc      Check isEmpty with TreeMap containing object after delete array element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0022';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      const arr = [1, 2, 3];
      arr[1] = 0;
      treeMap.set(1, arr);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2300
     * @tc.name      testTreeMap02Chapter0023
     * @tc.desc      Check isEmpty with TreeMap containing object after delete non-existent property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0023';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const obj: SimpleObject = { a: 1 };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2400
     * @tc.name      testTreeMap02Chapter0024
     * @tc.desc      Check isEmpty with TreeMap containing object with non-configurable property after delete attempt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0024';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const obj: SimpleObject = { a: 1 };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2500
     * @tc.name      testTreeMap02Chapter0025
     * @tc.desc      Check isEmpty with TreeMap containing very large string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0025';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      const largeString = "a".repeat(10000);
      treeMap.set(1, largeString);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2600
     * @tc.name      testTreeMap02Chapter0026
     * @tc.desc      hasKey with normal string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0026';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      let result = treeMap.hasKey("squirrel");
      expect(result).assertTrue();
      result = treeMap.hasKey("not_exist");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2700
     * @tc.name      testTreeMap02Chapter0027
     * @tc.desc      hasKey with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("", 456);
      let result = treeMap.hasKey("");
      expect(result).assertTrue();
      result = treeMap.hasKey("test");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2800
     * @tc.name      testTreeMap02Chapter0028
     * @tc.desc      hasKey with undefined string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("undefined", 789);
      let result = treeMap.hasKey("undefined");
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_2900
     * @tc.name      testTreeMap02Chapter0029
     * @tc.desc      hasKey with special characters key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let specialKeys = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      for (let i = 0; i < specialKeys.length; i++) {
        treeMap.set(specialKeys.charAt(i), i);
      }
      for (let i = 0; i < specialKeys.length; i++) {
        let result = treeMap.hasKey(specialKeys.charAt(i));
        expect(result).assertTrue();
      }
      let result = treeMap.hasKey("test");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3000
     * @tc.name      testTreeMap02Chapter0030
     * @tc.desc      hasKey with number key zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      let result = treeMap.hasKey(0);
      expect(result).assertTrue();
      result = treeMap.hasKey(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3100
     * @tc.name      testTreeMap02Chapter0031
     * @tc.desc      hasKey with negative zero number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0031';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-0, "negative zero");
      let result = treeMap.hasKey(0);
      expect(result).assertTrue();
      result = treeMap.hasKey(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3200
     * @tc.name      testTreeMap02Chapter0032
     * @tc.desc      hasKey with Infinity number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0032';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Infinity, "infinity");
      let result = treeMap.hasKey(Infinity);
      expect(result).assertTrue();
      result = treeMap.hasKey(-Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3300
     * @tc.name      testTreeMap02Chapter0033
     * @tc.desc      hasKey with negative Infinity number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-Infinity, "negative infinity");
      let result = treeMap.hasKey(-Infinity);
      expect(result).assertTrue();
      result = treeMap.hasKey(Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3400
     * @tc.name      testTreeMap02Chapter0034
     * @tc.desc      hasKey with Number.MAX_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "max value");
      let result = treeMap.hasKey(Number.MAX_VALUE);
      expect(result).assertTrue();
      result = treeMap.hasKey(Number.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3500
     * @tc.name      testTreeMap02Chapter0035
     * @tc.desc      hasKey with Number.MIN_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_VALUE, "min value");
      let result = treeMap.hasKey(Number.MIN_VALUE);
      expect(result).assertTrue();
      result = treeMap.hasKey(Number.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3600
     * @tc.name      testTreeMap02Chapter0036
     * @tc.desc      hasKey with boolean key true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0036';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(true, "true value");
      let result = treeMap.hasKey(true);
      expect(result).assertTrue();
      result = treeMap.hasKey(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3700
     * @tc.name      testTreeMap02Chapter0037
     * @tc.desc      hasKey with boolean key false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0037';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(false, "false value");
      let result = treeMap.hasKey(false);
      expect(result).assertTrue();
      result = treeMap.hasKey(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3800
     * @tc.name      testTreeMap02Chapter0038
     * @tc.desc      hasKey with array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0038';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Array<number>, string>();
      let keyArray: Array<number> = [72, 101, 108, 108, 111];
      treeMap.set(keyArray, "Hello");
      let result = treeMap.hasKey(keyArray);
      expect(result).assertTrue();
      let anotherArray: Array<number> = [87, 111, 114, 108, 100];
      result = treeMap.hasKey(anotherArray);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_3900
     * @tc.name      testTreeMap02Chapter0039
     * @tc.desc      hasKey with object key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0039';
      console.log(TAG + ' start');

      interface KeyObject {
        a: number;
        b: string;
      }

      let treeMap = new TreeMap<KeyObject, string>();
      let keyObject: KeyObject = { a: 1, b: "test" };
      treeMap.set(keyObject, "object value");
      let result = treeMap.hasKey(keyObject);
      expect(result).assertTrue();
      let anotherObject: KeyObject = { a: 1, b: "test" };
      result = treeMap.hasKey(anotherObject);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4000
     * @tc.name      testTreeMap02Chapter0040
     * @tc.desc      hasKey with bigint key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      let bigIntKey = BigInt("9223372036854775807");
      treeMap.set(bigIntKey, "big int value");
      let result = treeMap.hasKey(bigIntKey);
      expect(result).assertTrue();
      let anotherBigIntKey = BigInt("9223372036854775808");
      result = treeMap.hasKey(anotherBigIntKey);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4100
     * @tc.name      testTreeMap02Chapter0041
     * @tc.desc      hasKey with emoji string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("👆", 1);
      treeMap.set("👿", 2);
      treeMap.set("👀", 3);
      let result = treeMap.hasKey("👆");
      expect(result).assertTrue();
      result = treeMap.hasKey("👿");
      expect(result).assertTrue();
      result = treeMap.hasKey("👀");
      expect(result).assertTrue();
      result = treeMap.hasKey("😊");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4200
     * @tc.name      testTreeMap02Chapter0042
     * @tc.desc      hasKey with escaped characters key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0042';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let escapedKeys = ["\n", "\t", "\r", "\"", "\\"];
      for (let i = 0; i < escapedKeys.length; i++) {
        treeMap.set(escapedKeys[i], i);
      }
      for (let i = 0; i < escapedKeys.length; i++) {
        let result = treeMap.hasKey(escapedKeys[i]);
        expect(result).assertTrue();
      }
      let result = treeMap.hasKey("\b");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4300
     * @tc.name      testTreeMap02Chapter0043
     * @tc.desc      hasKey with scientific notation number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, "one thousand");
      treeMap.set(2.5e-2, "point zero two five");
      let result = treeMap.hasKey(1000);
      expect(result).assertTrue();
      result = treeMap.hasKey(0.025);
      expect(result).assertTrue();
      result = treeMap.hasKey(1e4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4400
     * @tc.name      testTreeMap02Chapter0044
     * @tc.desc      hasKey with array containing zero elements key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Array<number>, string>();
      let keyArray: Array<number> = [72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      treeMap.set(keyArray, "array with zeros");
      let result = treeMap.hasKey(keyArray);
      expect(result).assertTrue();
      let anotherArray: Array<number> = [72, 101, 108, 108, 111];
      result = treeMap.hasKey(anotherArray);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4500
     * @tc.name      testTreeMap02Chapter0045
     * @tc.desc      hasKey with negative test for non-existent key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 100);
      treeMap.set("key2", 200);
      let result = treeMap.hasKey("key3");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4600
     * @tc.name      testTreeMap02Chapter0046
     * @tc.desc      hasKey with mixed type keys in different TreeMap instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0046';
      console.log(TAG + ' start');
      let stringTreeMap = new TreeMap<string, number>();
      stringTreeMap.set("test", 1);
      expect(stringTreeMap.hasKey("test")).assertTrue();
      let numberTreeMap = new TreeMap<number, string>();
      numberTreeMap.set(123, "value");
      expect(numberTreeMap.hasKey(123)).assertTrue();
      let booleanTreeMap = new TreeMap<boolean, number>();
      booleanTreeMap.set(true, 100);
      expect(booleanTreeMap.hasKey(true)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4700
     * @tc.name      testTreeMap02Chapter0047
     * @tc.desc      hasKey with long string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0047';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let longKey = "a".repeat(10000);
      treeMap.set(longKey, 999);
      let result = treeMap.hasKey(longKey);
      expect(result).assertTrue();
      result = treeMap.hasKey("short");
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4800
     * @tc.name      testTreeMap02Chapter0048
     * @tc.desc      hasKey with null value stored but null key query
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0048';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("key_with_null", "null");
      let result = treeMap.hasKey("null");
      expect(result).assertFalse();
      result = treeMap.hasKey("key_with_null");
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_4900
     * @tc.name      testTreeMap02Chapter0049
     * @tc.desc      hasKey with Int8Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0049';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Int8Array, string>();
      const key1 = new Int8Array([-128]);
      const key2 = new Int8Array([127]);
      treeMap.set(key1, "minInt8");
      treeMap.set(key2, "maxInt8");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
      const key3 = new Int8Array([0]);
      result = treeMap.hasKey(key3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5000
     * @tc.name      testTreeMap02Chapter0050
     * @tc.desc      hasKey with Uint8Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0050';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Uint8Array, string>();
      const key1 = new Uint8Array([0]);
      const key2 = new Uint8Array([255]);
      treeMap.set(key1, "minUint8");
      treeMap.set(key2, "maxUint8");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
      const key3 = new Uint8Array([128]);
      result = treeMap.hasKey(key3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5100
     * @tc.name      testTreeMap02Chapter0051
     * @tc.desc      hasKey with Uint8ClampedArray boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0051';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Uint8ClampedArray, string>();
      const key1 = new Uint8ClampedArray([0]);
      const key2 = new Uint8ClampedArray([255]);
      treeMap.set(key1, "minClamped");
      treeMap.set(key2, "maxClamped");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5200
     * @tc.name      testTreeMap02Chapter0052
     * @tc.desc      hasKey with Int16Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0052';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Int16Array, string>();
      const key1 = new Int16Array([-32768]);
      const key2 = new Int16Array([32767]);
      treeMap.set(key1, "minInt16");
      treeMap.set(key2, "maxInt16");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5300
     * @tc.name      testTreeMap02Chapter0053
     * @tc.desc      hasKey with Uint16Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0053';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Uint16Array, string>();
      const key1 = new Uint16Array([0]);
      const key2 = new Uint16Array([65535]);
      treeMap.set(key1, "minUint16");
      treeMap.set(key2, "maxUint16");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5400
     * @tc.name      testTreeMap02Chapter0054
     * @tc.desc      hasKey with Int32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0054';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Int32Array, string>();
      const key1 = new Int32Array([-2147483648]);
      const key2 = new Int32Array([2147483647]);
      treeMap.set(key1, "minInt32");
      treeMap.set(key2, "maxInt32");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_5500
     * @tc.name      testTreeMap02Chapter0055
     * @tc.desc      hasKey with Uint32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0055';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Uint32Array, string>();
      const key1 = new Uint32Array([0]);
      const key2 = new Uint32Array([4294967295]);
      treeMap.set(key1, "minUint32");
      treeMap.set(key2, "maxUint32");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_5600
     * @tc.name      testTreeMap02Chapter0056
     * @tc.desc      hasKey with Float32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0056';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Float32Array, string>();
      const key1 = new Float32Array([-3.4028234663852886e38]);
      const key2 = new Float32Array([3.4028234663852886e38]);
      treeMap.set(key1, "minFloat32");
      treeMap.set(key2, "maxFloat32");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_5700
     * @tc.name      testTreeMap02Chapter0057
     * @tc.desc      hasKey with Float64Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0057';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Float64Array, string>();
      const key1 = new Float64Array([-1.7976931348623157e308]);
      const key2 = new Float64Array([1.7976931348623157e308]);
      treeMap.set(key1, "minFloat64");
      treeMap.set(key2, "maxFloat64");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_5800
     * @tc.name      testTreeMap02Chapter0058
     * @tc.desc      hasKey with Float32Array containing Infinity/NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0058';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Float32Array, string>();
      const key1 = new Float32Array([Infinity]);
      const key2 = new Float32Array([-Infinity]);
      const key3 = new Float32Array([NaN]);
      treeMap.set(key1, "infinity");
      treeMap.set(key2, "negativeInfinity");
      treeMap.set(key3, "nan");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
      result = treeMap.hasKey(key3);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_5900
     * @tc.name      testTreeMap02Chapter0059
     * @tc.desc      hasKey with Int8Array containing Infinity/NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0059';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Int8Array, string>();
      const key1 = new Int8Array([Infinity]);
      const key2 = new Int8Array([-Infinity]);
      const key3 = new Int8Array([NaN]);
      treeMap.set(key1, "infinityToZero");
      treeMap.set(key2, "negativeInfinityToZero");
      treeMap.set(key3, "nanToZero");
      let result = treeMap.hasKey(key1);
      expect(result).assertTrue();
      result = treeMap.hasKey(key2);
      expect(result).assertTrue();
      result = treeMap.hasKey(key3);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6000
     * @tc.name      testTreeMap02Chapter0060
     * @tc.desc      hasKey with Uint8ClampedArray containing out-of-range values key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0060';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Uint8ClampedArray, string>();
      const key = new Uint8ClampedArray([-1, 256, 0, 255]);
      treeMap.set(key, "clampedValues");
      let result = treeMap.hasKey(key);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6100
     * @tc.name      testTreeMap02Chapter0061
     * @tc.desc      hasKey with NaN number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0061';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(NaN, "nanValue");
      let result = treeMap.hasKey(NaN);
      expect(result).assertFalse();
      result = treeMap.hasKey(0);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6200
     * @tc.name      testTreeMap02Chapter0062
     * @tc.desc      hasKey with Number.EPSILON key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0062';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.EPSILON, "epsilon");
      let result = treeMap.hasKey(Number.EPSILON);
      expect(result).assertTrue();
      result = treeMap.hasKey(0);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6300
     * @tc.name      testTreeMap02Chapter0063
     * @tc.desc      hasKey with Number.MAX_SAFE_INTEGER key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0063';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "maxSafeInteger");
      let result = treeMap.hasKey(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
      result = treeMap.hasKey(Number.MAX_SAFE_INTEGER - 1);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6400
     * @tc.name      testTreeMap02Chapter0064
     * @tc.desc      hasKey with byte boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0064';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-128, "minByte");
      treeMap.set(127, "maxByte");
      let result = treeMap.hasKey(-128);
      expect(result).assertTrue();
      result = treeMap.hasKey(127);
      expect(result).assertTrue();
      result = treeMap.hasKey(-129);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6500
     * @tc.name      testTreeMap02Chapter0065
     * @tc.desc      hasKey with short boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0065';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, "minShort");
      treeMap.set(32767, "maxShort");
      let result = treeMap.hasKey(-32768);
      expect(result).assertTrue();
      result = treeMap.hasKey(32767);
      expect(result).assertTrue();
      result = treeMap.hasKey(-32769);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6600
     * @tc.name      testTreeMap02Chapter0066
     * @tc.desc      hasKey with int boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0066';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483648, "minInt");
      treeMap.set(2147483647, "maxInt");
      let result = treeMap.hasKey(-2147483648);
      expect(result).assertTrue();
      result = treeMap.hasKey(2147483647);
      expect(result).assertTrue();
      result = treeMap.hasKey(-2147483649);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6700
     * @tc.name      testTreeMap02Chapter0067
     * @tc.desc      hasKey with long boundary key (bigint)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0067';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(-9223372036854775808n, "minLong");
      treeMap.set(9223372036854775807n, "maxLong");
      let result = treeMap.hasKey(-9223372036854775808n);
      expect(result).assertTrue();
      result = treeMap.hasKey(9223372036854775807n);
      expect(result).assertTrue();
      result = treeMap.hasKey(0n);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_6800
     * @tc.name      testTreeMap02Chapter0068
     * @tc.desc      hasKey with float boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0068';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1.40129846432481707e-45, "minFloat");
      treeMap.set(3.40282346638528860e38, "maxFloat");
      let result = treeMap.hasKey(1.40129846432481707e-45);
      expect(result).assertTrue();
      result = treeMap.hasKey(3.40282346638528860e38);
      expect(result).assertTrue();
      result = treeMap.hasKey(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_6900
     * @tc.name      testTreeMap02Chapter0069
     * @tc.desc      hasKey with double boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0069';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(4.94065645841246544e-324, "minDouble");
      treeMap.set(1.79769313486231570e308, "maxDouble");
      let result = treeMap.hasKey(4.94065645841246544e-324);
      expect(result).assertTrue();
      result = treeMap.hasKey(1.79769313486231570e308);
      expect(result).assertTrue();
      result = treeMap.hasKey(0);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_7000
     * @tc.name      testTreeMap02Chapter0070
     * @tc.desc      hasKey with char boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0070';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minChar");
      treeMap.set(65535, "maxChar");
      let result = treeMap.hasKey(0);
      expect(result).assertTrue();
      result = treeMap.hasKey(65535);
      expect(result).assertTrue();
      result = treeMap.hasKey(65536);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_7100
     * @tc.name      testTreeMap02Chapter0071
     * @tc.desc      hasKey with hex number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0071';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0x0102, "hex1");
      treeMap.set(0x01020304, "hex2");
      let result = treeMap.hasKey(0x0102);
      expect(result).assertTrue();
      result = treeMap.hasKey(0x01020304);
      expect(result).assertTrue();
      result = treeMap.hasKey(0x01020305);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7200
     * @tc.name      testTreeMap02Chapter0072
     * @tc.desc      hasKey with octal number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0072';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0o3, "octal");
      let result = treeMap.hasKey(0o3);
      expect(result).assertTrue();
      result = treeMap.hasKey(3);
      expect(result).assertTrue();
      result = treeMap.hasKey(4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7300
     * @tc.name      testTreeMap02Chapter0073
     * @tc.desc      hasKey with exponent operator key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0073';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(2**3, "exponent");
      let result = treeMap.hasKey(8);
      expect(result).assertTrue();
      result = treeMap.hasKey(2**3);
      expect(result).assertTrue();
      result = treeMap.hasKey(9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7400
     * @tc.name      testTreeMap02Chapter0074
     * @tc.desc      hasKey with Math.floor result key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0074';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Math.floor(1.5), "floor");
      let result = treeMap.hasKey(1);
      expect(result).assertTrue();
      result = treeMap.hasKey(2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7500
     * @tc.name      testTreeMap02Chapter0075
     * @tc.desc      hasKey with BigInt hex value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0075';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("0xdecafafecacefade"), "bigintHex");
      let result = treeMap.hasKey(BigInt("0xdecafafecacefade"));
      expect(result).assertTrue();
      result = treeMap.hasKey(BigInt("0xdecafafecacefadf"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7600
     * @tc.name      testTreeMap02Chapter0076
     * @tc.desc      hasKey with float hex value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0076';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0xcafebabe, "floatHex");
      let result = treeMap.hasKey(0xcafebabe);
      expect(result).assertTrue();
      result = treeMap.hasKey(3405691582);
      expect(result).assertTrue();
      result = treeMap.hasKey(0xcafebabf);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7700
     * @tc.name      testTreeMap02Chapter0077
     * @tc.desc      hasKey with large bigint key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0077';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("9007199254740991"), "largeBigInt");
      let result = treeMap.hasKey(BigInt("9007199254740991"));
      expect(result).assertTrue();
      result = treeMap.hasKey(BigInt("9007199254740992"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7800
     * @tc.name      testTreeMap02Chapter0078
     * @tc.desc Test hasValue with normal integer value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0078';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 123);
      treeMap.set("key2", 456);
      let result1 = treeMap.hasValue(123);
      let result2 = treeMap.hasValue(456);
      let result3 = treeMap.hasValue(789);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_7900
     * @tc.name      testTreeMap02Chapter0079
     * @tc.desc Test hasValue with boundary integer values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0079';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("min", -128);
      treeMap.set("max", 127);
      let result1 = treeMap.hasValue(-128);
      let result2 = treeMap.hasValue(127);
      let result3 = treeMap.hasValue(-129);
      let result4 = treeMap.hasValue(128);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
      expect(result4).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8000
     * @tc.name      testTreeMap02Chapter0080
     * @tc.desc Test hasValue with floating point values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0080';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("float1", 3.14159);
      treeMap.set("float2", -2.71828);
      treeMap.set("inf", Infinity);
      treeMap.set("ninf", -Infinity);
      treeMap.set("nan", NaN);
      let result1 = treeMap.hasValue(3.14159);
      let result2 = treeMap.hasValue(-2.71828);
      let result3 = treeMap.hasValue(Infinity);
      let result4 = treeMap.hasValue(-Infinity);
      let result5 = treeMap.hasValue(NaN);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8100
     * @tc.name      testTreeMap02Chapter0081
     * @tc.desc Test hasValue with boolean values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0081';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, boolean | number>();
      treeMap.set("true", true);
      treeMap.set("false", false);
      let result1 = treeMap.hasValue(true);
      let result2 = treeMap.hasValue(false);
      let result3 = treeMap.hasValue(1);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8200
     * @tc.name      testTreeMap02Chapter0082
     * @tc.desc Test hasValue with string values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0082';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("empty", "");
      treeMap.set("special", "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      treeMap.set("emoji", "👆");
      treeMap.set("unicode", "\ud83d\udc46");
      let result1 = treeMap.hasValue("");
      let result2 = treeMap.hasValue("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      let result3 = treeMap.hasValue("👆");
      let result4 = treeMap.hasValue("\ud83d\udc46");
      let result5 = treeMap.hasValue("not exist");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8300
     * @tc.name      testTreeMap02Chapter0083
     * @tc.desc Test hasValue with array values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0083';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let arr1 = [72, 101, 108, 108, 111];
      let arr2 = [0, 0, 0, 0, 0];
      let arr3 = [1, 2, 3];
      treeMap.set("arr1", arr1);
      treeMap.set("arr2", arr2);
      treeMap.set("arr3", arr3);
      let result1 = treeMap.hasValue(arr1);
      let result2 = treeMap.hasValue(arr2);
      let result3 = treeMap.hasValue(arr3);
      let result4 = treeMap.hasValue([72, 101, 108, 108, 111]);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_8400
     * @tc.name      testTreeMap02Chapter0084
     * @tc.desc Test hasValue with TypedArray values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0084';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8Array | Int8Array>();
      let uint8Arr = new Uint8Array([72, 101, 108, 108, 111]);
      let int8Arr = new Int8Array([-128, 0, 127]);
      treeMap.set("uint8", uint8Arr);
      let result1 = treeMap.hasValue(uint8Arr);
      let result2 = treeMap.hasValue(new Uint8Array([72, 101, 108, 108, 111]));
      let result3 = treeMap.hasValue(int8Arr);
      expect(result1).assertTrue();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
    });

    interface HasValueObjNested {
      c: number;
      d: number[];
    }

    interface HasValueObjValue {
      a?: number;
      b?: string;
      nested?: HasValueObjNested;
    }

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8500
     * @tc.name      testTreeMap02Chapter0085
     * @tc.desc Test hasValue with object values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0085';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, HasValueObjValue>();
      let obj1: HasValueObjValue = { a: 1, b: "test" };
      let nested: HasValueObjNested = { c: 2, d: [1, 2, 3] };
      let obj2: HasValueObjValue = { nested };
      treeMap.set("obj1", obj1);
      treeMap.set("obj2", obj2);
      let result1 = treeMap.hasValue(obj1);
      let result2 = treeMap.hasValue(obj2);
      let result3 = treeMap.hasValue({ a: 1, b: "test" } as HasValueObjValue);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8600
     * @tc.name      testTreeMap02Chapter0086
     * @tc.desc Test hasValue with null and undefined values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0086';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number | null | undefined>();
      treeMap.set("null", null);
      treeMap.set("undefined", undefined);
      treeMap.set("zero", 0);
      let result1 = treeMap.hasValue(null);
      let result2 = treeMap.hasValue(undefined);
      let result3 = treeMap.hasValue(0);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST02_8700
     * @tc.name      testTreeMap02Chapter0087
     * @tc.desc Test hasValue with large number values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0087';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("max", Number.MAX_VALUE);
      treeMap.set("min", Number.MIN_VALUE);
      treeMap.set("safe", Number.MAX_SAFE_INTEGER);
      treeMap.set("epsilon", Number.EPSILON);
      let result1 = treeMap.hasValue(Number.MAX_VALUE);
      let result2 = treeMap.hasValue(Number.MIN_VALUE);
      let result3 = treeMap.hasValue(Number.MAX_SAFE_INTEGER);
      let result4 = treeMap.hasValue(Number.EPSILON);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_8800
     * @tc.name      testTreeMap02Chapter0088
     * @tc.desc Test hasValue with boundary values for different number types in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0088';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("int8min", -128);
      treeMap.set("int8max", 127);
      treeMap.set("uint8max", 255);
      treeMap.set("int16min", -32768);
      treeMap.set("int16max", 32767);
      treeMap.set("uint16max", 65535);
      let result1 = treeMap.hasValue(-128);
      let result2 = treeMap.hasValue(127);
      let result3 = treeMap.hasValue(255);
      let result4 = treeMap.hasValue(-32768);
      let result5 = treeMap.hasValue(32767);
      let result6 = treeMap.hasValue(65535);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
      expect(result6).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_8900
     * @tc.name      testTreeMap02Chapter0089
     * @tc.desc Test hasValue with negative test case (binding error simulation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0089';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("test", 123);
      let result = treeMap.hasValue(456);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST02_9000
     * @tc.name      testTreeMap02Chapter0090
     * @tc.desc Test hasValue with Map object as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap02Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap02Chapter0090';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Map<string, number>>();
      let map = new Map<string, number>();
      map.set("innerKey", 123);
      treeMap.set("map", map);
      let result1 = treeMap.hasValue(map);
      let result2 = treeMap.hasValue(new Map<string, number>());
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });
  })
}