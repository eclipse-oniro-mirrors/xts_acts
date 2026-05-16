import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, TreeMap } from '@kit.ArkTS';

type FalsyValue = number | string | null | undefined;

type MixedArrayElement = number | string | boolean | null | undefined;

interface ComplexObj {
  a: undefined | number;
  b: null | string;
  c: number;
  d: number;
  e: number;
}

interface NonEnumObj {
  a: number;
  b: number;
  hidden: number;
}

interface FuncObj {
  a: number;
  b: () => string;
  c: () => number;
}

interface InheritedObj {
  parentProp: number;
  childProp: number;
}

interface DeletedObj {
  a: number | undefined;
  b: number;
}

interface SymObj {
  a: number;
  symKey: string;
}

interface MixedKeysObj {
  a: number;
  s1: number;
  b: number;
  s2: number;
}

interface BufferObj {
  buffer: ArrayBuffer;
  name: string;
}

interface SimpleAB {
  a: number;
  b: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap03Test() {
  describe('TreeMap03Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST03_0100
     * @tc.name      testTreeMap03Chapter0001
     * @tc.desc Test hasValue with Set object as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0001';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Set<number>>();
      let set = new Set<number>([1, 2, 3, 2, 1]);
      treeMap.set("set", set);
      let result1 = treeMap.hasValue(set);
      let result2 = treeMap.hasValue(new Set<number>([1, 2, 3]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0200
     * @tc.name      testTreeMap03Chapter0002
     * @tc.desc Test hasValue with Date object as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0002';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Date>();
      let date = new Date('2023-01-01');
      treeMap.set("date", date);
      let result1 = treeMap.hasValue(date);
      let result2 = treeMap.hasValue(new Date('2023-01-01'));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0300
     * @tc.name      testTreeMap03Chapter0003
     * @tc.desc Test hasValue with RegExp object as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0003';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, RegExp>();
      let regex = /abc/gi;
      treeMap.set("regex", regex);
      let result1 = treeMap.hasValue(regex);
      let result2 = treeMap.hasValue(/abc/gi);
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0400
     * @tc.name      testTreeMap03Chapter0004
     * @tc.desc Test hasValue with ArrayBuffer as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0004';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, ArrayBuffer>();
      let buffer = new ArrayBuffer(16);
      treeMap.set("buffer", buffer);
      let result1 = treeMap.hasValue(buffer);
      let result2 = treeMap.hasValue(new ArrayBuffer(16));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0500
     * @tc.name      testTreeMap03Chapter0005
     * @tc.desc Test hasValue with DataView as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0005';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, DataView>();
      let buffer = new ArrayBuffer(16);
      let view = new DataView(buffer);
      treeMap.set("view", view);
      let result1 = treeMap.hasValue(view);
      let result2 = treeMap.hasValue(new DataView(new ArrayBuffer(16)));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0600
     * @tc.name      testTreeMap03Chapter0006
     * @tc.desc Test hasValue with Promise as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0006';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Promise<number>>();
      let promise = Promise.resolve(123);
      treeMap.set("promise", promise);
      let result1 = treeMap.hasValue(promise);
      let result2 = treeMap.hasValue(Promise.resolve(123));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0700
     * @tc.name      testTreeMap03Chapter0007
     * @tc.desc Test hasValue with function as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0007';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Function>();
      let func = () => { return 123; };
      treeMap.set("func", func);
      let result1 = treeMap.hasValue(func);
      let result2 = treeMap.hasValue(() => { return 123; });
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0800
     * @tc.name      testTreeMap03Chapter0008
     * @tc.desc Test hasValue with typed array containing special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0008';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float32Array>();
      let floatArray = new Float32Array([1.5, Infinity, -Infinity, NaN]);
      treeMap.set("floatArray", floatArray);
      let result1 = treeMap.hasValue(floatArray);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_0900
     * @tc.name      testTreeMap03Chapter0009
     * @tc.desc Test hasValue with symbol as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0009';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let symLike = "symbol:test";
      treeMap.set("symbol", symLike);
      let result1 = treeMap.hasValue(symLike);
      let result2 = treeMap.hasValue("symbol:other");
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1000
     * @tc.name      testTreeMap03Chapter0010
     * @tc.desc Test hasValue with BigInt as value in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0010';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, bigint>();
      treeMap.set("bigint1", -9223372036854775808n);
      treeMap.set("bigint2", 9223372036854775807n);
      treeMap.set("bigint3", 18446744073709551615n);
      let result1 = treeMap.hasValue(-9223372036854775808n);
      let result2 = treeMap.hasValue(9223372036854775807n);
      let result3 = treeMap.hasValue(18446744073709551615n);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1100
     * @tc.name      testTreeMap03Chapter0011
     * @tc.desc Test hasValue with object containing undefined and null properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0011';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, ComplexObj>();
      let obj: ComplexObj = { a: undefined, b: null, c: 1, d: NaN, e: Infinity };
      treeMap.set("obj", obj);
      let result1 = treeMap.hasValue(obj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1200
     * @tc.name      testTreeMap03Chapter0012
     * @tc.desc Test hasValue with very large string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0012';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let largeString = "a".repeat(10000);
      treeMap.set("large", largeString);
      let result1 = treeMap.hasValue(largeString);
      let result2 = treeMap.hasValue("a".repeat(10000));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST03_1300
     * @tc.name      testTreeMap03Chapter0013
     * @tc.desc Test hasValue with Uint8ClampedArray values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0013';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint8ClampedArray>();
      let clampedArray = new Uint8ClampedArray([0, 128, 255, 256, -1]);
      treeMap.set("clamped", clampedArray);
      let result1 = treeMap.hasValue(clampedArray);
      let result2 = treeMap.hasValue(new Uint8ClampedArray([0, 128, 255, 256, -1]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1400
     * @tc.name      testTreeMap03Chapter0014
     * @tc.desc Test hasValue with Int16Array boundary values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0014';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int16Array>();
      let int16Array = new Int16Array([-32768, 0, 32767]);
      treeMap.set("int16", int16Array);
      let result1 = treeMap.hasValue(int16Array);
      let result2 = treeMap.hasValue(new Int16Array([-32768, 0, 32767]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1500
     * @tc.name      testTreeMap03Chapter0015
     * @tc.desc Test hasValue with Uint16Array boundary values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0015';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint16Array>();
      let uint16Array = new Uint16Array([0, 32768, 65535]);
      treeMap.set("uint16", uint16Array);
      let result1 = treeMap.hasValue(uint16Array);
      let result2 = treeMap.hasValue(new Uint16Array([0, 32768, 65535]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1600
     * @tc.name      testTreeMap03Chapter0016
     * @tc.desc Test hasValue with Int32Array boundary values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0016';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Int32Array>();
      let int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      treeMap.set("int32", int32Array);
      let result1 = treeMap.hasValue(int32Array);
      let result2 = treeMap.hasValue(new Int32Array([-2147483648, 0, 2147483647]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1700
     * @tc.name      testTreeMap03Chapter0017
     * @tc.desc Test hasValue with Uint32Array boundary values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0017';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Uint32Array>();
      let uint32Array = new Uint32Array([0, 2147483648, 4294967295]);
      treeMap.set("uint32", uint32Array);
      let result1 = treeMap.hasValue(uint32Array);
      let result2 = treeMap.hasValue(new Uint32Array([0, 2147483648, 4294967295]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1800
     * @tc.name      testTreeMap03Chapter0018
     * @tc.desc Test hasValue with BigUint64Array boundary values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0018';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, BigUint64Array>();
      let bigUint64Array = new BigUint64Array([0n, 9223372036854775808n, 18446744073709551615n]);
      treeMap.set("bigUint64", bigUint64Array);
      let result1 = treeMap.hasValue(bigUint64Array);
      let result2 = treeMap.hasValue(new BigUint64Array([0n, 9223372036854775808n, 18446744073709551615n]));
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_1900
     * @tc.name      testTreeMap03Chapter0019
     * @tc.desc Test hasValue with TypedArray containing Infinity/NaN values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0019';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Float64Array | Int8Array>();
      let float64Array = new Float64Array([Infinity, -Infinity, NaN]);
      let int8Array = new Int8Array([Infinity, -Infinity, NaN]);
      treeMap.set("float64", float64Array);
      treeMap.set("int8", int8Array);
      let result1 = treeMap.hasValue(float64Array);
      let result2 = treeMap.hasValue(int8Array);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2000
     * @tc.name      testTreeMap03Chapter0020
     * @tc.desc Test hasValue with string containing all ASCII characters in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0020';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let asciiString = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      treeMap.set("ascii", asciiString);
      let result1 = treeMap.hasValue(asciiString);
      let result2 = treeMap.hasValue("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2100
     * @tc.name      testTreeMap03Chapter0021
     * @tc.desc Test hasValue with string containing special characters twice in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0021';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let specialString = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      treeMap.set("special2", specialString);
      let result1 = treeMap.hasValue(specialString);
      let result2 = treeMap.hasValue(" !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2200
     * @tc.name      testTreeMap03Chapter0022
     * @tc.desc Test hasValue with string containing escape sequences in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0022';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let escapeString = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\x7f";
      treeMap.set("escape", escapeString);
      let result1 = treeMap.hasValue(escapeString);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2300
     * @tc.name      testTreeMap03Chapter0023
     * @tc.desc Test hasValue with string containing illegal unicode sequences in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0023';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let illegalUnicode = "\udc04\ud83d\udff4";
      treeMap.set("illegal", illegalUnicode);
      let result1 = treeMap.hasValue(illegalUnicode);
      let result2 = treeMap.hasValue("\udc04\ud83d\udff4");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2400
     * @tc.name      testTreeMap03Chapter0024
     * @tc.desc Test hasValue with string keyword "0" in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0024';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("zeroStr", "0");
      treeMap.set("nanStr", "NaN");
      let result1 = treeMap.hasValue("0");
      let result2 = treeMap.hasValue("NaN");
      let result3 = treeMap.hasValue("");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2500
     * @tc.name      testTreeMap03Chapter0025
     * @tc.desc Test hasValue with treeString type in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0025';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      }
      let treeString = initTreeString(1000);
      treeMap.set("treeString", treeString);
      let result1 = treeMap.hasValue(treeString);
      let result2 = treeMap.hasValue(initTreeString(1000));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2600
     * @tc.name      testTreeMap03Chapter0026
     * @tc.desc Test hasValue with sliceString type in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0026';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let originalStr = "{k1:value1,k2:value2}";
      let sliceStr = originalStr.substring(0, originalStr.length - 2);
      treeMap.set("sliceStr", sliceStr);
      let result1 = treeMap.hasValue(sliceStr);
      let result2 = treeMap.hasValue("{k1:value1,k2:value2}".substring(0, "{k1:value1,k2:value2}".length - 2));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2700
     * @tc.name      testTreeMap03Chapter0027
     * @tc.desc Test hasValue with scientific notation numbers in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("sci1", 1e3);
      treeMap.set("sci2", 2.5e-2);
      treeMap.set("sci3", 1.23e4);
      treeMap.set("sci4", 5e-6);
      let result1 = treeMap.hasValue(1e3);
      let result2 = treeMap.hasValue(2.5e-2);
      let result3 = treeMap.hasValue(1.23e4);
      let result4 = treeMap.hasValue(5e-6);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2800
     * @tc.name      testTreeMap03Chapter0028
     * @tc.desc Test hasValue with hex, octal and binary numbers in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("hex", 0x0102);
      treeMap.set("octal", 0o3);
      treeMap.set("binary", 0b1010);
      treeMap.set("hex32", 0x01020304);
      let result1 = treeMap.hasValue(0x0102);
      let result2 = treeMap.hasValue(0o3);
      let result3 = treeMap.hasValue(0b1010);
      let result4 = treeMap.hasValue(0x01020304);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_2900
     * @tc.name      testTreeMap03Chapter0029
     * @tc.desc Test hasValue with exponent operator numbers in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("exp1", 2 ** 3);
      treeMap.set("exp2", 3 ** 2);
      treeMap.set("exp3", 10 ** 0);
      treeMap.set("exp4", 5 ** -1);
      let result1 = treeMap.hasValue(8);
      let result2 = treeMap.hasValue(9);
      let result3 = treeMap.hasValue(1);
      let result4 = treeMap.hasValue(0.2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3000
     * @tc.name      testTreeMap03Chapter0030
     * @tc.desc Test hasValue with float hex representation in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let floatValue = 0xcafebabe;
      treeMap.set("floatHex", floatValue);
      let result1 = treeMap.hasValue(floatValue);
      let result2 = treeMap.hasValue(0xcafebabe);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3100
     * @tc.name      testTreeMap03Chapter0031
     * @tc.desc Test hasValue with bigint hex representation in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0031';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, bigint>();
      let bigintValue = BigInt("0xdecafafecacefade");
      treeMap.set("bigintHex", bigintValue);
      let result1 = treeMap.hasValue(bigintValue);
      let result2 = treeMap.hasValue(BigInt("0xdecafafecacefade"));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3200
     * @tc.name      testTreeMap03Chapter0032
     * @tc.desc Test hasValue with values commonly treated as false in boolean context in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0032';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, FalsyValue>();
      treeMap.set("zero", 0);
      treeMap.set("nan", NaN);
      treeMap.set("empty", "");
      treeMap.set("null", null);
      treeMap.set("undefined", undefined);
      let result1 = treeMap.hasValue(0);
      let result2 = treeMap.hasValue(NaN);
      let result3 = treeMap.hasValue("");
      let result4 = treeMap.hasValue(null);
      let result5 = treeMap.hasValue(undefined);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3300
     * @tc.name      testTreeMap03Chapter0033
     * @tc.desc Test hasValue with array containing NaN/Infinity in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let specialArray = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      treeMap.set("specialArray", specialArray);
      let result1 = treeMap.hasValue(specialArray);
      let result2 = treeMap.hasValue([72, 101, NaN, Infinity, -Infinity, 108, 111]);
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3400
     * @tc.name      testTreeMap03Chapter0034
     * @tc.desc Test hasValue with array containing non-numeric types in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<MixedArrayElement>>();
      let mixedArray: Array<MixedArrayElement> = [72, "abc", true, null, undefined, 108];
      treeMap.set("mixedArray", mixedArray);
      let result1 = treeMap.hasValue(mixedArray);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3500
     * @tc.name      testTreeMap03Chapter0035
     * @tc.desc Test hasValue with array containing overflow values in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let overflowArray = [256, 65536, 32768, 4294967296];
      treeMap.set("overflow", overflowArray);
      let result1 = treeMap.hasValue(overflowArray);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3600
     * @tc.name      testTreeMap03Chapter0036
     * @tc.desc Test hasValue with object containing non-enumerable properties in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0036';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, NonEnumObj>();
      let obj: NonEnumObj = { a: 1, b: 2, hidden: 3 };
      treeMap.set("nonEnumObj", obj);
      let result1 = treeMap.hasValue(obj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3700
     * @tc.name      testTreeMap03Chapter0037
     * @tc.desc Test hasValue with object containing Symbol keys in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0037';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, SymObj>();
      let obj: SymObj = { a: 1, symKey: "value" };
      treeMap.set("symObj", obj);
      let result1 = treeMap.hasValue(obj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3800
     * @tc.name      testTreeMap03Chapter0038
     * @tc.desc Test hasValue with object containing function properties in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0038';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, FuncObj>();
      let funcObj: FuncObj = {
        a: 1,
        b: () => "test",
        c: () => 1
      };
      treeMap.set("funcObj", funcObj);
      let result1 = treeMap.hasValue(funcObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_3900
     * @tc.name      testTreeMap03Chapter0039
     * @tc.desc Test hasValue with object with inheritance chain in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0039';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, InheritedObj>();
      let child: InheritedObj = { parentProp: 1, childProp: 2 };
      treeMap.set("inheritedObj", child);
      let result1 = treeMap.hasValue(child);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4000
     * @tc.name      testTreeMap03Chapter0040
     * @tc.desc Test hasValue with very large object in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let largeArray: Array<number> = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }
      treeMap.set("largeObj", largeArray);
      let result1 = treeMap.hasValue(largeArray);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4100
     * @tc.name      testTreeMap03Chapter0041
     * @tc.desc Test hasValue with array converted to TypedArray scenario in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number> | Uint8Array>();
      let numberArray = [72, 101, 108, 108, 111];
      let typedArray = new Uint8Array(numberArray);
      treeMap.set("numberArray", numberArray);
      treeMap.set("typedArray", typedArray);
      let result1 = treeMap.hasValue(numberArray);
      let result2 = treeMap.hasValue(typedArray);
      let result3 = treeMap.hasValue(new Uint8Array(numberArray));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4200
     * @tc.name      testTreeMap03Chapter0042
     * @tc.desc Test hasValue with negative boolean conversion scenarios in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0042';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, boolean>();
      treeMap.set("true", true);
      treeMap.set("false", false);
      let result1 = treeMap.hasValue(!'s');
      let result2 = treeMap.hasValue(!0);
      let result3 = treeMap.hasValue(!'');
      let result4 = treeMap.hasValue(!null);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4300
     * @tc.name      testTreeMap03Chapter0043
     * @tc.desc Test hasValue with delete keyword scenarios in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, DeletedObj>();
      let obj: DeletedObj = { a: 1, b: 2 };
      obj.a = undefined;
      treeMap.set("deletedObj", obj);
      let result1 = treeMap.hasValue(obj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4400
     * @tc.name      testTreeMap03Chapter0044
     * @tc.desc Test hasValue with frozen object in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, SimpleAB>();
      let frozenObj: SimpleAB = { a: 1, b: 2 };
      treeMap.set("frozen", frozenObj);
      let result1 = treeMap.hasValue(frozenObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4500
     * @tc.name      testTreeMap03Chapter0045
     * @tc.desc Test hasValue with sealed object in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, SimpleAB>();
      let sealedObj: SimpleAB = { a: 1, b: 2 };
      treeMap.set("sealed", sealedObj);
      let result1 = treeMap.hasValue(sealedObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4600
     * @tc.name      testTreeMap03Chapter0046
     * @tc.desc Test hasValue with non-extensible object in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0046';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, SimpleAB>();
      let nonExtensibleObj: SimpleAB = { a: 1, b: 2 };
      treeMap.set("nonExtensible", nonExtensibleObj);
      let result1 = treeMap.hasValue(nonExtensibleObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4700
     * @tc.name      testTreeMap03Chapter0047
     * @tc.desc Test hasValue with special array indices in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0047';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, Array<number>>();
      let specialArray: Array<number> = [];
      specialArray[0] = 333;
      specialArray[1] = 111;
      specialArray[2] = 222;
      treeMap.set("specialIndexArray", specialArray);
      let result1 = treeMap.hasValue(specialArray);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4800
     * @tc.name      testTreeMap03Chapter0048
     * @tc.desc Test hasValue with object containing mixed Symbol and string keys in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0048';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, MixedKeysObj>();
      let mixedObj: MixedKeysObj = { a: 1, s1: 2, b: 3, s2: 4 };
      treeMap.set("mixedKeys", mixedObj);
      let result1 = treeMap.hasValue(mixedObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_4900
     * @tc.name      testTreeMap03Chapter0049
     * @tc.desc Test hasValue with object containing ArrayBuffer property in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0049';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, BufferObj>();
      let bufferObj: BufferObj = { buffer: new ArrayBuffer(16), name: "test" };
      treeMap.set("bufferObj", bufferObj);
      let result1 = treeMap.hasValue(bufferObj);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST03_5000
     * @tc.name      testTreeMap03Chapter0050
     * @tc.desc Test hasValue with very large string for memory testing in TreeMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testTreeMap03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap03Chapter0050';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      let largeString = "a".repeat(100000);
      treeMap.set("hugeString", largeString);
      let result1 = treeMap.hasValue(largeString);
      expect(result1).assertTrue();
    });
  })
}