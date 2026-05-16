import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { HashSet } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashSet03Test() {
  describe('HashSet03Test', () => {
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
     * @tc.number    SUB_HASHSET_TEST03_0100
     * @tc.name      testHashSet03Chapter0001
     * @tc.desc      Test add method with valid string element in HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0001';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const result1: boolean = hashSet.add("squirrel");
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add("rabbit");
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add("squirrel");
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has("squirrel");
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0200
     * @tc.name      testHashSet03Chapter0002
     * @tc.desc      Test add method with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0002';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result1: boolean = hashSet.add(specialChars);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(specialChars);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(specialChars);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0300
     * @tc.name      testHashSet03Chapter0003
     * @tc.desc      Test add method with string null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0003';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const result1: boolean = hashSet.add("");
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add("null");
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add("undefined");
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has("");
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0400
     * @tc.name      testHashSet03Chapter0004
     * @tc.desc      Test add method with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0004';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const escapeStr: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\123\\x41";
      const result1: boolean = hashSet.add(escapeStr);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(escapeStr);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(escapeStr);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0500
     * @tc.name      testHashSet03Chapter0005
     * @tc.desc      Test add method with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0005';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const emojis: string[] = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
      emojis.forEach(emoji => {
        const result: boolean = hashSet.add(emoji);
        expect(result).assertTrue();
      });
      emojis.forEach(emoji => {
        const result: boolean = hashSet.has(emoji);
        expect(result).assertTrue();
      });
      const duplicateResult: boolean = hashSet.add("👆");
      expect(duplicateResult).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0600
     * @tc.name      testHashSet03Chapter0006
     * @tc.desc      Test add method with number type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0006';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const result1: boolean = hashSet.add(0);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(NaN);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(-0);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(Infinity);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(-Infinity);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.add(Number.MAX_VALUE);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.add(NaN);
      expect(result7).assertTrue();
      const result8: boolean = hashSet.has(Infinity);
      expect(result8).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0700
     * @tc.name      testHashSet03Chapter0007
     * @tc.desc      Test add method with different number representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0007';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const result1: boolean = hashSet.add(0xdecafafecacefade);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(123.456);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(0xcafebabe);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(0x0102);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(0x01020304);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.add(0o3);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.add(8);
      expect(result7).assertTrue();
      const result8: boolean = hashSet.add(1e3);
      expect(result8).assertTrue();
      const result9: boolean = hashSet.add(2.5e-2);
      expect(result9).assertTrue();
      const result10: boolean = hashSet.add(123.456);
      expect(result10).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0800
     * @tc.name      testHashSet03Chapter0008
     * @tc.desc      Test add method with boolean type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0008';
      console.log(TAG + ' start');
      const hashSet: HashSet<boolean> = new HashSet<boolean>();
      const result1: boolean = hashSet.add(true);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(false);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(true);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(false);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(true);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(false);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_0900
     * @tc.name      testHashSet03Chapter0009
     * @tc.desc      Test add method with array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0009';
      console.log(TAG + ' start');
      type NumberArray = Array<number>;
      const hashSet: HashSet<NumberArray> = new HashSet<NumberArray>();
      const arr1: NumberArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2: NumberArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const arr3: NumberArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const result1: boolean = hashSet.add(arr1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(arr2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(arr3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(arr1);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(arr1);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1000
     * @tc.name      testHashSet03Chapter0010
     * @tc.desc      Test add method with special array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0010';
      console.log(TAG + ' start');
      type MixedArrayItem = number | string | boolean | null | undefined;
      type MixedArray = Array<MixedArrayItem>;
      type NumberArray = Array<number>;
      const hashSet: HashSet<MixedArray | NumberArray> = new HashSet<MixedArray | NumberArray>();
      const specialArr: MixedArray = [72, "abc", true, null, undefined, 108];
      const arrWithNaN: NumberArray = [72, 101, NaN, Infinity, 108, 111];
      const emptyArr: MixedArray = [];
      const overflowArr: NumberArray = [256, 65536, 32768];
      const result1: boolean = hashSet.add(specialArr);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(arrWithNaN);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(emptyArr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(overflowArr);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(specialArr);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(arrWithNaN);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1100
     * @tc.name      testHashSet03Chapter0011
     * @tc.desc      Test add method with object type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0011';
      console.log(TAG + ' start');

      interface SimpleObject {
        a: number;
        b: string;
        c: number[];
      }

      interface InnerDObject {
        e: number;
      }

      interface InnerBObject {
        c: number;
        d: InnerDObject;
      }

      interface NestedObject {
        a: number;
        b: InnerBObject;
      }

      interface UndefinedObject {
        a: undefined;
        b: number;
      }

      interface NullObject {
        a: null;
        b: number;
      }

      interface NaNObject {
        a: number;
        b: number;
      }

      interface InfinityObject {
        a: number;
        b: number;
      }

      const hashSet: HashSet<SimpleObject | NestedObject | UndefinedObject | NullObject | NaNObject | InfinityObject> =
        new HashSet<SimpleObject | NestedObject | UndefinedObject | NullObject | NaNObject | InfinityObject>();
      const obj1: SimpleObject = { a: 1, b: "test", c: [1, 2, 3] };
      const obj2: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      const obj3: UndefinedObject = { a: undefined, b: 1 };
      const obj4: NullObject = { a: null, b: 1 };
      const obj5: NaNObject = { a: NaN, b: 1 };
      const obj6: InfinityObject = { a: Infinity, b: 1 };
      const result1: boolean = hashSet.add(obj1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(obj2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(obj3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(obj4);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(obj5);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.add(obj6);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.add(obj1);
      expect(result7).assertTrue();
      const result8: boolean = hashSet.has(obj2);
      expect(result8).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1200
     * @tc.name      testHashSet03Chapter0012
     * @tc.desc      Test add method with TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0012';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array | Uint8Array | Float32Array | Float64Array> =
        new HashSet<Int8Array | Uint8Array | Float32Array | Float64Array>();
      const int8Arr: Int8Array = new Int8Array([-128, 0, 127]);
      const uint8Arr: Uint8Array = new Uint8Array([0, 128, 255]);
      const float32Arr: Float32Array = new Float32Array([-3.4028234663852886e38, 0, 3.4028234663852886e38]);
      const float64Arr: Float64Array = new Float64Array([-1.7976931348623157e308, 0, 1.7976931348623157e308]);
      const result1: boolean = hashSet.add(int8Arr);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(uint8Arr);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(float32Arr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(float64Arr);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(int8Arr);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(uint8Arr);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1300
     * @tc.name      testHashSet03Chapter0013
     * @tc.desc      Test add method with Map and Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0013';
      console.log(TAG + ' start');

      interface MapValueObject {
        a: number;
      }

      type MapValue = string | MapValueObject;
      const hashSet: HashSet<Map<string, MapValue> | Set<number> | RegExp> =
        new HashSet<Map<string, MapValue> | Set<number> | RegExp>();
      const map: Map<string, MapValue> = new Map<string, MapValue>([
        ['key1', 'value1'],
        ['key2', { a: 1 }]
      ]);
      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      const regex: RegExp = /abc/gi;
      const result1: boolean = hashSet.add(map);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(set);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(regex);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(map);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(regex);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1400
     * @tc.name      testHashSet03Chapter0014
     * @tc.desc      Test add method with treeString type large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0014';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      let init: (size: number) => string = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const largeString: string = init(1000);
      const result1: boolean = hashSet.add(largeString);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(largeString);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(largeString);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1500
     * @tc.name      testHashSet03Chapter0015
     * @tc.desc      Test add method with repeated string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0015';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const repeatedStr: string = "a".repeat(100);
      const result1: boolean = hashSet.add(repeatedStr);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(repeatedStr);
      expect(result2).assertTrue();
      const differentStr: string = "a".repeat(99);
      const result3: boolean = hashSet.add(differentStr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(repeatedStr);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1600
     * @tc.name      testHashSet03Chapter0016
     * @tc.desc      Test add method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0016';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array> = new HashSet<Int8Array>();
      const int8ArrMin: Int8Array = new Int8Array([-128]);
      const int8ArrMax: Int8Array = new Int8Array([127]);
      const int8ArrOut1: Int8Array = new Int8Array([-129]);
      const int8ArrOut2: Int8Array = new Int8Array([128]);
      const result1: boolean = hashSet.add(int8ArrMin);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(int8ArrMax);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(int8ArrOut1);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(int8ArrOut2);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(int8ArrMin);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(int8ArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1700
     * @tc.name      testHashSet03Chapter0017
     * @tc.desc      Test add method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0017';
      console.log(TAG + ' start');
      const hashSet: HashSet<Uint8Array> = new HashSet<Uint8Array>();
      const uint8ArrMin: Uint8Array = new Uint8Array([0]);
      const uint8ArrMax: Uint8Array = new Uint8Array([255]);
      const uint8ArrOut1: Uint8Array = new Uint8Array([-1]);
      const uint8ArrOut2: Uint8Array = new Uint8Array([256]);
      const result1: boolean = hashSet.add(uint8ArrMin);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(uint8ArrMax);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(uint8ArrOut1);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(uint8ArrOut2);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(uint8ArrMax);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(uint8ArrMin);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1800
     * @tc.name      testHashSet03Chapter0018
     * @tc.desc      Test add method with null and undefined as HashSet elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0018';
      console.log(TAG + ' start');
      const hashSet: HashSet<number | string | null | undefined> = new HashSet<number | string | null | undefined>();
      const result1: boolean = hashSet.add(null);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(undefined);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add("null");
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add("undefined");
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(null);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.add(undefined);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.has(null);
      expect(result7).assertTrue();
      const result8: boolean = hashSet.has(undefined);
      expect(result8).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_1900
     * @tc.name      testHashSet03Chapter0019
     * @tc.desc      Test add method on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0019';
      console.log(TAG + ' start');
      const stringHashSet: HashSet<string> = new HashSet<string>();
      const numberHashSet: HashSet<number> = new HashSet<number>();
      const result1: boolean = stringHashSet.add("test");
      expect(result1).assertTrue();
      const result2: boolean = numberHashSet.add(123);
      expect(result2).assertTrue();
      const result3: boolean = stringHashSet.add("test");
      expect(result3).assertTrue();
      const result4: boolean = numberHashSet.add(123);
      expect(result4).assertTrue();
      const result5: boolean = stringHashSet.has("test");
      expect(result5).assertTrue();
      const result6: boolean = numberHashSet.has(123);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2000
     * @tc.name      testHashSet03Chapter0020
     * @tc.desc      Test add method after adding duplicate elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0020';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const result1: boolean = hashSet.add("element");
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add("element");
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add("element");
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has("element");
      expect(result4).assertTrue();
      const sizeCheck: number = hashSet.length;
      expect(sizeCheck).assertEqual(1);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2100
     * @tc.name      testHashSet03Chapter0021
     * @tc.desc      Test add method after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0021';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const result1: boolean = hashSet.add(1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(2);
      expect(result4).assertTrue();
      hashSet.remove(2);
      const result5: boolean = hashSet.has(2);
      expect(result5).assertFalse();
      const result6: boolean = hashSet.add(2);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.has(2);
      expect(result7).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2200
     * @tc.name      testHashSet03Chapter0022
     * @tc.desc      Test add method with object containing optional properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0022';
      console.log(TAG + ' start');

      interface ObjectWithOptional {
        requiredProp: string;
        optionalProp?: number;
      }

      const hashSet: HashSet<ObjectWithOptional> = new HashSet<ObjectWithOptional>();
      const obj1: ObjectWithOptional = {
        requiredProp: "visible",
        optionalProp: 42
      };
      const obj2: ObjectWithOptional = {
        requiredProp: "visible"
      };
      const result1: boolean = hashSet.add(obj1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(obj2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(obj1);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(obj2);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(obj1);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(obj2);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2300
     * @tc.name      testHashSet03Chapter0023
     * @tc.desc      Test add method with array containing additional string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0023';
      console.log(TAG + ' start');

      class ArrayWithStringProperties extends Array<number> {
        customStrProp1?: string;
        customStrProp2?: string;
        customNumProp?: number;
      }

      const hashSet: HashSet<ArrayWithStringProperties> = new HashSet<ArrayWithStringProperties>();
      const arr: ArrayWithStringProperties = new ArrayWithStringProperties();
      arr.push(1, 2, 3);
      arr.customStrProp1 = "abc";
      arr.customStrProp2 = "def";
      arr.customNumProp = 111;
      const result1: boolean = hashSet.add(arr);
      expect(result1).assertTrue();
      const newArr: ArrayWithStringProperties = new ArrayWithStringProperties();
      newArr.push(1, 2, 3);
      newArr.customStrProp1 = "abc";
      newArr.customStrProp2 = "def";
      newArr.customNumProp = 111;
      const result2: boolean = hashSet.add(newArr);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(arr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(arr);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2400
     * @tc.name      testHashSet03Chapter0024
     * @tc.desc      Test add method with large number of elements for performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0024';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const elementCount: number = 100;
      for (let i: number = 0; i < elementCount; i++) {
        const result: boolean = hashSet.add(i);
        expect(result).assertTrue();
      }
      const middleIndex: number = Math.floor(elementCount / 2);
      const result1: boolean = hashSet.add(middleIndex);
      expect(result1).assertTrue();
      const firstElement: boolean = hashSet.has(0);
      expect(firstElement).assertTrue();
      const lastElement: boolean = hashSet.has(elementCount - 1);
      expect(lastElement).assertTrue();
      const result2: boolean = hashSet.add(elementCount + 100);
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2500
     * @tc.name      testHashSet03Chapter0025
     * @tc.desc      Test add method with mixed types in HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0025';
      console.log(TAG + ' start');
      type MixedType = string | number | boolean | null | undefined;
      const hashSet: HashSet<MixedType> = new HashSet<MixedType>();
      const primitives: MixedType[] = [
        "string",
        42,
        3.14,
        true,
        false,
        null,
        undefined,
        0,
        -0,
        NaN,
        Infinity,
        -Infinity
      ];
      primitives.forEach(primitive => {
        const result: boolean = hashSet.add(primitive);
        expect(result).assertTrue();
      });
      primitives.forEach(primitive => {
        const result: boolean = hashSet.add(primitive);
        expect(result).assertTrue();
      });
      const newPrimitive: MixedType = "new string";
      const result: boolean = hashSet.add(newPrimitive);
      expect(result).assertTrue();
      const result2: boolean = hashSet.has(newPrimitive);
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2600
     * @tc.name      testHashSet03Chapter0026
     * @tc.desc      Test add method with large object containing many properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0026';
      console.log(TAG + ' start');

      interface LargeObjectExplicit {
        prop0: number;
        prop1: number;
        prop2: number;
        prop3: number;
        prop4: number;
        prop5: number;
        prop6: number;
        prop7: number;
        prop8: number;
        prop9: number;
        prop10: number;
        prop11: number;
        prop12: number;
        prop13: number;
        prop14: number;
        prop15: number;
        prop16: number;
        prop17: number;
        prop18: number;
        prop19: number;
        prop20: number;
        prop21: number;
        prop22: number;
        prop23: number;
        prop24: number;
        prop25: number;
        prop26: number;
        prop27: number;
        prop28: number;
        prop29: number;
        prop30: number;
        prop31: number;
        prop32: number;
        prop33: number;
        prop34: number;
        prop35: number;
        prop36: number;
        prop37: number;
        prop38: number;
        prop39: number;
        prop40: number;
        prop41: number;
        prop42: number;
        prop43: number;
        prop44: number;
        prop45: number;
        prop46: number;
        prop47: number;
        prop48: number;
        prop49: number;
      }

      const hashSet: HashSet<LargeObjectExplicit> = new HashSet<LargeObjectExplicit>();
      const largeObj: LargeObjectExplicit = {
        prop0: 0,
        prop1: 1,
        prop2: 2,
        prop3: 3,
        prop4: 4,
        prop5: 5,
        prop6: 6,
        prop7: 7,
        prop8: 8,
        prop9: 9,
        prop10: 10,
        prop11: 11,
        prop12: 12,
        prop13: 13,
        prop14: 14,
        prop15: 15,
        prop16: 16,
        prop17: 17,
        prop18: 18,
        prop19: 19,
        prop20: 20,
        prop21: 21,
        prop22: 22,
        prop23: 23,
        prop24: 24,
        prop25: 25,
        prop26: 26,
        prop27: 27,
        prop28: 28,
        prop29: 29,
        prop30: 30,
        prop31: 31,
        prop32: 32,
        prop33: 33,
        prop34: 34,
        prop35: 35,
        prop36: 36,
        prop37: 37,
        prop38: 38,
        prop39: 39,
        prop40: 40,
        prop41: 41,
        prop42: 42,
        prop43: 43,
        prop44: 44,
        prop45: 45,
        prop46: 46,
        prop47: 47,
        prop48: 48,
        prop49: 49
      };
      const result1: boolean = hashSet.add(largeObj);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(largeObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(largeObj);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2700
     * @tc.name      testHashSet03Chapter0027
     * @tc.desc      Test add method with special string containing repeated characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0027';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const repeatedCharStr: string = "a".repeat(10000);
      const result1: boolean = hashSet.add(repeatedCharStr);
      expect(result1).assertTrue();
      const slightlyDifferentStr: string = "a".repeat(9999) + "b";
      const result2: boolean = hashSet.add(slightlyDifferentStr);
      expect(result2).assertTrue();
      const longerStr: string = "a".repeat(10001);
      const result3: boolean = hashSet.add(longerStr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(repeatedCharStr);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(slightlyDifferentStr);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2800
     * @tc.name      testHashSet03Chapter0028
     * @tc.desc      Test add method with complex nested structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0028';
      console.log(TAG + ' start');

      interface Level4Object {
        value: string;
      }

      interface Level3Object {
        level4: Level4Object;
      }

      interface Level2Object {
        level3: Level3Object;
      }

      interface Level1Object {
        level2: Level2Object;
      }

      interface DeepNestedObject {
        level1: Level1Object;
      }

      const hashSet: HashSet<DeepNestedObject> = new HashSet<DeepNestedObject>();
      const level4Obj: Level4Object = {
        value: "deep value"
      };
      const level3Obj: Level3Object = {
        level4: level4Obj
      };
      const level2Obj: Level2Object = {
        level3: level3Obj
      };
      const level1Obj: Level1Object = {
        level2: level2Obj
      };
      const deepObj: DeepNestedObject = {
        level1: level1Obj
      };
      const result1: boolean = hashSet.add(deepObj);
      expect(result1).assertTrue();
      const newLevel4Obj: Level4Object = {
        value: "deep value"
      };
      const newLevel3Obj: Level3Object = {
        level4: newLevel4Obj
      };
      const newLevel2Obj: Level2Object = {
        level3: newLevel3Obj
      };
      const newLevel1Obj: Level1Object = {
        level2: newLevel2Obj
      };
      const similarDeepObj: DeepNestedObject = {
        level1: newLevel1Obj
      };
      const result2: boolean = hashSet.add(similarDeepObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(deepObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(similarDeepObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_2900
     * @tc.name      testHashSet03Chapter0029
     * @tc.desc      Test add method with all primitive types in one HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0029';
      console.log(TAG + ' start');
      type PrimitiveTypes = string | number | boolean | bigint | null | undefined;
      const hashSet: HashSet<PrimitiveTypes> = new HashSet<PrimitiveTypes>();
      const primitives: PrimitiveTypes[] = [
        "string",
        42,
        3.14,
        true,
        false,
        null,
        undefined,
        0,
        -0,
        NaN,
        Infinity,
        -Infinity,
        9007199254740991n
      ];
      primitives.forEach(primitive => {
        const result: boolean = hashSet.add(primitive);
        expect(result).assertTrue();
      });
      primitives.forEach(primitive => {
        const result: boolean = hashSet.add(primitive);
        expect(result).assertTrue();
      });
      const newPrimitive: PrimitiveTypes = "new primitive";
      const result: boolean = hashSet.add(newPrimitive);
      expect(result).assertTrue();
      const result2: boolean = hashSet.has(newPrimitive);
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3000
     * @tc.name      testHashSet03Chapter0030
     * @tc.desc      Test add method with double special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0030';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const doubleSpecialChars: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const result1: boolean = hashSet.add(doubleSpecialChars);
      expect(result1).assertTrue();
      const singleSpecialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result2: boolean = hashSet.add(singleSpecialChars);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(doubleSpecialChars);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(singleSpecialChars);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3100
     * @tc.name      testHashSet03Chapter0031
     * @tc.desc      Test add method with float precision boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0031';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const floatMinPositive: number = 1.40129846432481707e-45;
      const floatMaxPositive: number = 3.40282346638528860e+38;
      const floatMinNegative: number = -1.40129846432481707e-45;
      const floatMaxNegative: number = -3.40282346638528860e+38;
      const result1: boolean = hashSet.add(floatMinPositive);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(floatMaxPositive);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(floatMinNegative);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(floatMaxNegative);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(floatMinPositive);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(floatMaxNegative);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3200
     * @tc.name      testHashSet03Chapter0032
     * @tc.desc      Test add method with double precision boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0032';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const doubleMinPositive: number = 4.94065645841246544e-324;
      const doubleMaxPositive: number = 1.79769313486231570e+308;
      const doubleMinNegative: number = -4.94065645841246544e-324;
      const doubleMaxNegative: number = -1.79769313486231570e+308;
      const result1: boolean = hashSet.add(doubleMinPositive);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(doubleMaxPositive);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(doubleMinNegative);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(doubleMaxNegative);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(doubleMaxPositive);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(doubleMinNegative);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3300
     * @tc.name      testHashSet03Chapter0033
     * @tc.desc      Test add method with BigInt64Array overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0033';
      console.log(TAG + ' start');
      const hashSet: HashSet<BigInt64Array> = new HashSet<BigInt64Array>();
      const bigInt64Arr1: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const bigInt64Arr2: BigInt64Array = new BigInt64Array([9223372036854775807n]);
      const bigInt64Arr3: BigInt64Array = new BigInt64Array([-9223372036854775809n]);
      const bigInt64Arr4: BigInt64Array = new BigInt64Array([9223372036854775808n]);
      const result1: boolean = hashSet.add(bigInt64Arr1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(bigInt64Arr2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(bigInt64Arr3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(bigInt64Arr4);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(bigInt64Arr1);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.has(bigInt64Arr3);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3400
     * @tc.name      testHashSet03Chapter0034
     * @tc.desc      Test add method with BigUint64Array overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0034';
      console.log(TAG + ' start');
      const hashSet: HashSet<BigUint64Array> = new HashSet<BigUint64Array>();
      const bigUint64Arr1: BigUint64Array = new BigUint64Array([0n]);
      const bigUint64Arr2: BigUint64Array = new BigUint64Array([18446744073709551615n]);
      const bigUint64Arr3: BigUint64Array = new BigUint64Array([18446744073709551616n]);
      const result1: boolean = hashSet.add(bigUint64Arr1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(bigUint64Arr2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(bigUint64Arr3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(bigUint64Arr2);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(bigUint64Arr3);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3500
     * @tc.name      testHashSet03Chapter0035
     * @tc.desc      Test add method with TypedArray special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0035';
      console.log(TAG + ' start');
      type TypedArrayUnion = Float32Array | Float64Array | Int8Array | Uint8Array | Int16Array | Uint16Array
        | Int32Array | Uint32Array | Uint8ClampedArray;
      const hashSet: HashSet<TypedArrayUnion> = new HashSet<TypedArrayUnion>();
      const float32ArrWithInf: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      const float64ArrWithInf: Float64Array = new Float64Array([Infinity, -Infinity, NaN]);
      const int8ArrWithSpecial: Int8Array = new Int8Array([Infinity, -Infinity, NaN]);
      const uint8ArrWithSpecial: Uint8Array = new Uint8Array([Infinity, -Infinity, NaN]);
      const uint8ClampedArrWithSpecial: Uint8ClampedArray = new Uint8ClampedArray([Infinity, -Infinity, NaN]);
      const result1: boolean = hashSet.add(float32ArrWithInf);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(float64ArrWithInf);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(int8ArrWithSpecial);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(uint8ArrWithSpecial);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.add(uint8ClampedArrWithSpecial);
      expect(result5).assertTrue();
      const result6: boolean = hashSet.add(float32ArrWithInf);
      expect(result6).assertTrue();
      const result7: boolean = hashSet.has(int8ArrWithSpecial);
      expect(result7).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3600
     * @tc.name      testHashSet03Chapter0036
     * @tc.desc      Test add method with ASCII full character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0036';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const asciiString: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const result1: boolean = hashSet.add(asciiString);
      expect(result1).assertTrue();
      const duplicateAsciiString: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const result2: boolean = hashSet.add(duplicateAsciiString);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(asciiString);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(duplicateAsciiString);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3700
     * @tc.name      testHashSet03Chapter0037
     * @tc.desc      Test add method with invalid Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0037';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const invalidUnicode1: string = "\udc04";
      const invalidUnicode2: string = "\ud83d";
      const invalidUnicode3: string = "\udff4";
      const result1: boolean = hashSet.add(invalidUnicode1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.add(invalidUnicode2);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(invalidUnicode3);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(invalidUnicode1);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(invalidUnicode2);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3800
     * @tc.name      testHashSet03Chapter0038
     * @tc.desc      Test add method with slice string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0038';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const originalStr: string = "{k1:value1,k2:value2}";
      const slicedStr: string = originalStr.substring(0, originalStr.length - 2);
      const result1: boolean = hashSet.add(slicedStr);
      expect(result1).assertTrue();
      const newSlicedStr: string = originalStr.substring(0, originalStr.length - 2);
      const result2: boolean = hashSet.add(newSlicedStr);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(originalStr);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.add(slicedStr);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(newSlicedStr);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_3900
     * @tc.name      testHashSet03Chapter0039
     * @tc.desc      Test add method with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0039';
      console.log(TAG + ' start');

      interface FunctionObject {
        a: number;
        b: () => void;
      }

      const hashSet: HashSet<FunctionObject> = new HashSet<FunctionObject>();
      const funcObj: FunctionObject = {
        a: 1,
        b: (): void => {
        }
      };
      const result1: boolean = hashSet.add(funcObj);
      expect(result1).assertTrue();
      const newFuncObj: FunctionObject = {
        a: 1,
        b: (): void => {
        }
      };
      const result2: boolean = hashSet.add(newFuncObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(funcObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(newFuncObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4000
     * @tc.name      testHashSet03Chapter0040
     * @tc.desc      Test add method with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0040';
      console.log(TAG + ' start');

      interface ArrayBufferObject {
        buffer: ArrayBuffer;
        name: string;
      }

      const hashSet: HashSet<ArrayBufferObject> = new HashSet<ArrayBufferObject>();
      const bufferObj: ArrayBufferObject = {
        buffer: new ArrayBuffer(16),
        name: "test"
      };
      const result1: boolean = hashSet.add(bufferObj);
      expect(result1).assertTrue();
      const newBufferObj: ArrayBufferObject = {
        buffer: new ArrayBuffer(16),
        name: "test"
      };
      const result2: boolean = hashSet.add(newBufferObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(bufferObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(newBufferObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4100
     * @tc.name      testHashSet03Chapter0041
     * @tc.desc      Test add method with object containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0041';
      console.log(TAG + ' start');

      interface DataViewObject {
        view: DataView;
        id: number;
      }

      const hashSet: HashSet<DataViewObject> = new HashSet<DataViewObject>();
      const dataViewObj: DataViewObject = {
        view: new DataView(new ArrayBuffer(16)),
        id: 1
      };
      const result1: boolean = hashSet.add(dataViewObj);
      expect(result1).assertTrue();
      const newDataViewObj: DataViewObject = {
        view: new DataView(new ArrayBuffer(16)),
        id: 1
      };
      const result2: boolean = hashSet.add(newDataViewObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(dataViewObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(newDataViewObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4200
     * @tc.name      testHashSet03Chapter0042
     * @tc.desc      Test add method with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0042';
      console.log(TAG + ' start');

      interface PromiseObject {
        promise: Promise<string>;
        status: string;
      }

      const hashSet: HashSet<PromiseObject> = new HashSet<PromiseObject>();
      const promiseObj: PromiseObject = {
        promise: new Promise<string>((resolve) => {
          setTimeout(() => resolve('done'), 100);
        }),
        status: "pending"
      };
      const result1: boolean = hashSet.add(promiseObj);
      expect(result1).assertTrue();
      const newPromiseObj: PromiseObject = {
        promise: new Promise<string>((resolve) => {
          setTimeout(() => resolve('done'), 100);
        }),
        status: "pending"
      };
      const result2: boolean = hashSet.add(newPromiseObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(promiseObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(newPromiseObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4300
     * @tc.name      testHashSet03Chapter0043
     * @tc.desc      Test add method with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0043';
      console.log(TAG + ' start');

      interface RegExpObject {
        regex: RegExp;
        flags: RegExp;
      }

      const hashSet: HashSet<RegExpObject> = new HashSet<RegExpObject>();
      const regexObj: RegExpObject = {
        regex: /abc/gi,
        flags: /def/m
      };
      const result1: boolean = hashSet.add(regexObj);
      expect(result1).assertTrue();
      const newRegexObj: RegExpObject = {
        regex: /abc/gi,
        flags: /def/m
      };
      const result2: boolean = hashSet.add(newRegexObj);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(regexObj);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(newRegexObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4400
     * @tc.name      testHashSet03Chapter0044
     * @tc.desc      Test add method with very large repeated string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0044';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const largeString: string = "a".repeat(100000);
      const result1: boolean = hashSet.add(largeString);
      expect(result1).assertTrue();
      const slightlyDifferent: string = "a".repeat(99999) + "b";
      const result2: boolean = hashSet.add(slightlyDifferent);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.add(largeString);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(slightlyDifferent);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4500
     * @tc.name      testHashSet03Chapter0045
     * @tc.desc      Test add method with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0045';
      console.log(TAG + ' start');

      const hashSet: HashSet<string | undefined> = new HashSet<string | undefined>();
      const result1: boolean = hashSet.add(undefined);
      expect(result1).assertTrue();

      const result3: boolean = hashSet.has(undefined);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add("valid string");
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has("valid string");
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4600
     * @tc.name      testHashSet03Chapter0046
     * @tc.desc      Test add method with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0046';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int16Array> = new HashSet<Int16Array>();
      const int16ArrMin: Int16Array = new Int16Array([-32768]);
      const int16ArrMax: Int16Array = new Int16Array([32767]);
      const int16ArrOut1: Int16Array = new Int16Array([-32769]);
      const int16ArrOut2: Int16Array = new Int16Array([32768]);

      const result1: boolean = hashSet.add(int16ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(int16ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(int16ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(int16ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(int16ArrMin);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(int16ArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4700
     * @tc.name      testHashSet03Chapter0047
     * @tc.desc      Test add method with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0047';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint16Array> = new HashSet<Uint16Array>();
      const uint16ArrMin: Uint16Array = new Uint16Array([0]);
      const uint16ArrMax: Uint16Array = new Uint16Array([65535]);
      const uint16ArrOut1: Uint16Array = new Uint16Array([-1]);
      const uint16ArrOut2: Uint16Array = new Uint16Array([65536]);

      const result1: boolean = hashSet.add(uint16ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(uint16ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(uint16ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(uint16ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(uint16ArrMax);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(uint16ArrMin);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4800
     * @tc.name      testHashSet03Chapter0048
     * @tc.desc      Test add method with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0048';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int32Array> = new HashSet<Int32Array>();
      const int32ArrMin: Int32Array = new Int32Array([-2147483648]);
      const int32ArrMax: Int32Array = new Int32Array([2147483647]);
      const int32ArrOut1: Int32Array = new Int32Array([-2147483649]);
      const int32ArrOut2: Int32Array = new Int32Array([2147483648]);

      const result1: boolean = hashSet.add(int32ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(int32ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(int32ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(int32ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(int32ArrMin);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(int32ArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_4900
     * @tc.name      testHashSet03Chapter0049
     * @tc.desc      Test add method with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0049';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint32Array> = new HashSet<Uint32Array>();
      const uint32ArrMin: Uint32Array = new Uint32Array([0]);
      const uint32ArrMax: Uint32Array = new Uint32Array([4294967295]);
      const uint32ArrOut1: Uint32Array = new Uint32Array([-1]);
      const uint32ArrOut2: Uint32Array = new Uint32Array([4294967296]);

      const result1: boolean = hashSet.add(uint32ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(uint32ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(uint32ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(uint32ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(uint32ArrMax);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(uint32ArrMin);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_5000
     * @tc.name      testHashSet03Chapter0050
     * @tc.desc      Test add method with Uint8ClampedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0050';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint8ClampedArray> = new HashSet<Uint8ClampedArray>();
      const clampedArrMin: Uint8ClampedArray = new Uint8ClampedArray([0]);
      const clampedArrMax: Uint8ClampedArray = new Uint8ClampedArray([255]);
      const clampedArrOut1: Uint8ClampedArray = new Uint8ClampedArray([-1]);
      const clampedArrOut2: Uint8ClampedArray = new Uint8ClampedArray([256]);

      const result1: boolean = hashSet.add(clampedArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(clampedArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(clampedArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(clampedArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(clampedArrMin);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(clampedArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_5100
     * @tc.name      testHashSet03Chapter0051
     * @tc.desc      Test add method with number type byte range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0051';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(-128);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(127);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(-129);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(128);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(-128);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.add(0);
      expect(result6).assertTrue();

      const result7: boolean = hashSet.has(127);
      expect(result7).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_5200
     * @tc.name      testHashSet03Chapter0052
     * @tc.desc      Test add method with number type short range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0052';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(-32768);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(32767);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(-32769);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(32768);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(-32768);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(32767);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_5300
     * @tc.name      testHashSet03Chapter0053
     * @tc.desc      Test add method with number type int range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0053';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(-2147483648);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(2147483647);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(-2147483649);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(2147483648);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(-2147483648);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(2147483647);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST03_5400
     * @tc.name      testHashSet03Chapter0054
     * @tc.desc      Test add method with number type long range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet03Chapter0054';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(-9223372036854775808);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(9223372036854775807);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(-9223372036854775808);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(9223372036854775807);
      expect(result4).assertTrue();
    });

  })
}