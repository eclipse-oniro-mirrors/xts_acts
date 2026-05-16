import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { HashSet } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashSet01Test() {
  describe('HashSet01Test', () => {
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
     * @tc.number    SUB_HASHSET_TEST01_0100
     * @tc.name      testHashSet01Chapter0001
     * @tc.desc      Create HashSet instance with default constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0001';
      console.log(TAG + ' start');
      let hashSet = new HashSet<number>();
      expect(!!hashSet).assertTrue();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0200
     * @tc.name      testHashSet01Chapter0002
     * @tc.desc      Verify HashSet can be created with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0002';
      console.log(TAG + ' start');
      let hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      hashSet.add(Number.EPSILON);
      hashSet.add(Number.MAX_SAFE_INTEGER);
      hashSet.add(-Number.MAX_SAFE_INTEGER);
      expect(hashSet.length).assertEqual(6);
      expect(hashSet.has(0)).assertTrue();
      expect(hashSet.has(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0300
     * @tc.name      testHashSet01Chapter0003
     * @tc.desc      Verify HashSet can be created with string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0003';
      console.log(TAG + ' start');
      let hashSet = new HashSet<string>();
      hashSet.add("");
      hashSet.add("undefined");
      hashSet.add("null");
      hashSet.add("NaN");
      expect(hashSet.length).assertEqual(4);
      expect(hashSet.has("")).assertTrue();
      expect(hashSet.has("NaN")).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0400
     * @tc.name      testHashSet01Chapter0004
     * @tc.desc      Verify HashSet can be created with boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0004';
      console.log(TAG + ' start');
      let hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(true)).assertTrue();
      expect(hashSet.has(false)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0500
     * @tc.name      testHashSet01Chapter0005
     * @tc.desc      Verify HashSet can be created with object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0005';
      console.log(TAG + ' start');

      interface TestObject1 {
        a: number;
        b: string;
      }

      interface TestObject2 {
        c: Array<number>;
      }

      let hashSet = new HashSet<object>();
      let obj1: TestObject1 = { a: 1, b: "test" };
      let obj2: TestObject2 = { c: [1, 2, 3] };

      hashSet.add(obj1);
      hashSet.add(obj2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(obj1)).assertTrue();
      expect(hashSet.has(obj2)).assertTrue();
    });
    /**
     * @tc.number    SUB_HASHSET_TEST01_0600
     * @tc.name      testHashSet01Chapter0006
     * @tc.desc      Verify HashSet can be created with array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0006';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Array<number>>();
      let arr1 = [1, 2, 3];
      let arr2 = [4, 5, 6];
      hashSet.add(arr1);
      hashSet.add(arr2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(arr1)).assertTrue();
      expect(hashSet.has(arr2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0700
     * @tc.name      testHashSet01Chapter0007
     * @tc.desc      Verify HashSet can handle special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0007';
      console.log(TAG + ' start');
      let hashSet = new HashSet<number>();
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(NaN);
      expect(hashSet.length).assertEqual(3);
      expect(hashSet.has(Infinity)).assertTrue();
      expect(hashSet.has(-Infinity)).assertTrue();
      expect(hashSet.has(NaN)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0800
     * @tc.name      testHashSet01Chapter0008
     * @tc.desc      Verify HashSet can handle bigint type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0008';
      console.log(TAG + ' start');
      let hashSet = new HashSet<bigint>();
      hashSet.add(0n);
      hashSet.add(9223372036854775807n);
      hashSet.add(18446744073709551615n);
      expect(hashSet.length).assertEqual(3);
      expect(hashSet.has(0n)).assertTrue();
      expect(hashSet.has(9223372036854775807n)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_0900
     * @tc.name      testHashSet01Chapter0009
     * @tc.desc      Verify HashSet can handle nested object structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0009';
      console.log(TAG + ' start');

      interface NestedObjectD {
        e: number;
      }

      interface NestedObjectB {
        c: number;
        d: NestedObjectD;
      }

      interface TestNestedObject {
        a: number;
        b: NestedObjectB;
        f: Array<number>;
      }

      let hashSet = new HashSet<object>();
      let nestedObj: TestNestedObject = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        },
        f: [1, 2, 3]
      };

      hashSet.add(nestedObj);
      expect(hashSet.length).assertEqual(1);
      expect(hashSet.has(nestedObj)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1000
     * @tc.name      testHashSet01Chapter0010
     * @tc.desc      Verify HashSet can handle typed array as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0010';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Uint8Array>();
      let arr1 = new Uint8Array([72, 101, 108, 108, 111]);
      let arr2 = new Uint8Array([87, 111, 114, 108, 100]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(arr1)).assertTrue();
      expect(hashSet.has(arr2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1100
     * @tc.name      testHashSet01Chapter0011
     * @tc.desc      Test HashSet with Map as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0011';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Map<string, number>>();
      let map1 = new Map<string, number>();
      map1.set("key1", 1);
      map1.set("key2", 2);
      let map2 = new Map<string, number>();
      map2.set("key3", 3);
      map2.set("key4", 4);
      hashSet.add(map1);
      hashSet.add(map2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(map1)).assertTrue();
      expect(hashSet.has(map2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1200
     * @tc.name      testHashSet01Chapter0012
     * @tc.desc      Test HashSet with Set as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0012';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Set<number>>();
      let set1 = new Set<number>([1, 2, 3]);
      let set2 = new Set<number>([4, 5, 6]);
      hashSet.add(set1);
      hashSet.add(set2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(set1)).assertTrue();
      expect(hashSet.has(set2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1300
     * @tc.name      testHashSet01Chapter0013
     * @tc.desc      Test HashSet with function as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0013';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Function>();
      let func1 = (): number => 1;
      let func2 = (): string => "test";
      hashSet.add(func1);
      hashSet.add(func2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(func1)).assertTrue();
      expect(hashSet.has(func2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1400
     * @tc.name      testHashSet01Chapter0014
     * @tc.desc      Test HashSet with RegExp as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0014';
      console.log(TAG + ' start');
      let hashSet = new HashSet<RegExp>();
      let regex1 = /abc/gi;
      let regex2 = /def/m;
      hashSet.add(regex1);
      hashSet.add(regex2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(regex1)).assertTrue();
      expect(hashSet.has(regex2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1500
     * @tc.name      testHashSet01Chapter0015
     * @tc.desc      Test HashSet with null and undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0015';
      console.log(TAG + ' start');
      let hashSet = new HashSet<number | null | undefined>();
      hashSet.add(null);
      hashSet.add(undefined);
      hashSet.add(0);
      expect(hashSet.length).assertEqual(3);
      expect(hashSet.has(null)).assertTrue();
      expect(hashSet.has(undefined)).assertTrue();
      expect(hashSet.has(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1600
     * @tc.name      testHashSet01Chapter0016
     * @tc.desc      Test HashSet with Promise as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0016';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Promise<number>>();
      let promise1 = new Promise<number>((resolve) => resolve(1));
      let promise2 = new Promise<number>((resolve) => resolve(2));
      hashSet.add(promise1);
      hashSet.add(promise2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(promise1)).assertTrue();
      expect(hashSet.has(promise2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1700
     * @tc.name      testHashSet01Chapter0017
     * @tc.desc      Test HashSet with DataView as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0017';
      console.log(TAG + ' start');

      let hashSet = new HashSet<DataView>();
      let buffer1 = new ArrayBuffer(16);
      let buffer2 = new ArrayBuffer(32);
      let view1 = new DataView(buffer1);
      let view2 = new DataView(buffer2);

      view1.setInt8(0, 72);
      view2.setInt16(0, 256);

      hashSet.add(view1);
      hashSet.add(view2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(view1)).assertTrue();
      expect(hashSet.has(view2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1800
     * @tc.name      testHashSet01Chapter0018
     * @tc.desc      Test HashSet with Date as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0018';
      console.log(TAG + ' start');
      let hashSet = new HashSet<Date>();
      let date1 = new Date();
      let date2 = new Date("2023-01-01");
      hashSet.add(date1);
      hashSet.add(date2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(date1)).assertTrue();
      expect(hashSet.has(date2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_1900
     * @tc.name      testHashSet01Chapter0019
     * @tc.desc      Test HashSet with ArrayBuffer as value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0019';
      console.log(TAG + ' start');
      let hashSet = new HashSet<ArrayBuffer>();
      let buffer1 = new ArrayBuffer(16);
      let buffer2 = new ArrayBuffer(32);
      hashSet.add(buffer1);
      hashSet.add(buffer2);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(buffer1)).assertTrue();
      expect(hashSet.has(buffer2)).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2000
     * @tc.name      testHashSet01Chapter0020
     * @tc.desc      Test isEmpty method on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0020';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      const result = hashSet.isEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2100
     * @tc.name      testHashSet01Chapter0021
     * @tc.desc      Test isEmpty method on HashSet with Int8Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0021';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int8Array>();
      const array = new Int8Array([-128, 127, -129, 128]);
      hashSet.add(array);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2200
     * @tc.name      testHashSet01Chapter0022
     * @tc.desc      Test isEmpty method on HashSet with Float32Array containing Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0022';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Float32Array>();
      const array = new Float32Array([Infinity, -Infinity, NaN]);
      hashSet.add(array);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2300
     * @tc.name      testHashSet01Chapter0023
     * @tc.desc      Test isEmpty method on HashSet with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0023';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const specialString = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      hashSet.add(specialString);
      hashSet.add("");
      hashSet.add("undefined");
      hashSet.add("null");
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2400
     * @tc.name      testHashSet01Chapter0024
     * @tc.desc      Test isEmpty method on HashSet with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0024';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();

      const escapeChars = "\a\b\f\n\r\t\v\\\'\"\?\0\u0053\x45";
      hashSet.add(escapeChars);

      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2500
     * @tc.name      testHashSet01Chapter0025
     * @tc.desc      Test isEmpty method on HashSet with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0025';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
      emojis.forEach(emoji => hashSet.add(emoji));
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2600
     * @tc.name      testHashSet01Chapter0026
     * @tc.desc      Test isEmpty method on HashSet with boundary numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0026';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      hashSet.add(Number.EPSILON);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(NaN);
      hashSet.add(-0);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2700
     * @tc.name      testHashSet01Chapter0027
     * @tc.desc      Test isEmpty method on HashSet with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0027';
      console.log(TAG + ' start');
      const hashSet = new HashSet<bigint>();
      hashSet.add(BigInt(0xdecafafecacefade));
      hashSet.add(9223372036854775807n);
      hashSet.add(-9223372036854775808n);
      hashSet.add(18446744073709551615n);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2800
     * @tc.name      testHashSet01Chapter0028
     * @tc.desc      Test isEmpty method on HashSet with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0028';
      console.log(TAG + ' start');
      const hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_2900
     * @tc.name      testHashSet01Chapter0029
     * @tc.desc      Test isEmpty method on HashSet with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0029';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Array<number>>();
      const array1 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const array2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const array3 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3000
     * @tc.name      testHashSet01Chapter0030
     * @tc.desc      Test isEmpty method on HashSet with special array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0030';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<string | number | boolean | null | undefined>>();

      class SpecialArray {
        items: Array<string | number | boolean | null | undefined>;
        abc: number;
        aaa: number;

        constructor() {
          this.items = [];
          this.abc = 111;
          this.aaa = 222;
          this.items.push(72);
          this.items.push("abc");
          this.items.push(true);
          this.items.push(null);
          this.items.push(undefined);
          this.items.push(108);
        }
      }

      const specialArrayInstance = new SpecialArray();

      const array1: Array<string | number | boolean | null | undefined> = specialArrayInstance.items;
      const array2: Array<number> = [NaN, Infinity, -Infinity];
      const array3: Array<number> = [256, 65536, 32768];
      const array4: Array<never> = [];

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      hashSet.add(array4);

      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3100
     * @tc.name      testHashSet01Chapter0031
     * @tc.desc      Test isEmpty method on HashSet with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0031';
      console.log(TAG + ' start');
      const hashSet = new HashSet<object>();

      class SimpleObject {
        a: number;
        b: string;
        c: number[];

        constructor() {
          this.a = 1;
          this.b = "test";
          this.c = [1, 2, 3];
        }
      }

      class NestedObjectB {
        c: number;
        d: NestedObjectD;

        constructor() {
          this.c = 2;
          this.d = new NestedObjectD();
        }
      }

      class NestedObjectD {
        e: number;

        constructor() {
          this.e = 3;
        }
      }

      class NestedObject {
        a: number;
        b: NestedObjectB;

        constructor() {
          this.a = 1;
          this.b = new NestedObjectB();
        }
      }

      class FunctionObject {
        a: number;
        b: () => void;

        constructor() {
          this.a = 1;
          this.b = (): void => {
          };
        }
      }

      class TypedArrayObject {
        a: number;
        b: Uint8Array;

        constructor() {
          this.a = 1;
          this.b = new Uint8Array([72, 101, 108, 108, 111]);
        }
      }

      class DataViewObject {
        view: DataView;

        constructor() {
          this.view = new DataView(new ArrayBuffer(16));
        }
      }

      class UndefinedObject {
        a: undefined;
        b: number;

        constructor() {
          this.a = undefined;
          this.b = 1;
        }
      }

      class NullObject {
        a: null;
        b: number;

        constructor() {
          this.a = null;
          this.b = 1;
        }
      }

      class NaNObject {
        a: number;
        b: number;

        constructor() {
          this.a = NaN;
          this.b = 1;
        }
      }

      class InfinityObject {
        a: number;
        b: number;

        constructor() {
          this.a = Infinity;
          this.b = 1;
        }
      }

      class ParentObject {
        parentProp: number;

        constructor() {
          this.parentProp = 1;
        }
      }

      class LargeObjectClass {
        items: number[][];

        constructor() {
          this.items = [];
          for (let i = 0; i < 10000; i++) {
            this.items.push([i, i]);
          }
        }
      }

      class EmptyClass {
      }

      class NonEnumerableClass {
        a: number;

        constructor() {
          this.a = 1;
        }
      }

      const obj1 = new SimpleObject();
      const obj2 = new NestedObject();
      const obj4 = new FunctionObject();
      const obj5 = new ParentObject();
      const obj6 = new NonEnumerableClass();
      const obj7 = new TypedArrayObject();
      const obj8 = new DataViewObject();
      const emptyObj = new EmptyClass();
      const largeObj = new LargeObjectClass();
      const undefinedObj = new UndefinedObject();
      const nullObj = new NullObject();
      const nanObj = new NaNObject();
      const infinityObj = new InfinityObject();

      hashSet.add(obj1);
      hashSet.add(obj2);
      hashSet.add(obj4);
      hashSet.add(obj5);
      hashSet.add(obj6);
      hashSet.add(obj7);
      hashSet.add(obj8);
      hashSet.add(emptyObj);
      hashSet.add(largeObj);
      hashSet.add(undefinedObj);
      hashSet.add(nullObj);
      hashSet.add(nanObj);
      hashSet.add(infinityObj);

      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3200
     * @tc.name      testHashSet01Chapter0032
     * @tc.desc      Test isEmpty method on HashSet with Map, Set and other collection values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0032';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Record<string, object>>();

      const map = new Map<string, string | Record<string, number>>();

      map.set('key1', 'value1');
      map.set('key2', { "a": 1 });

      const set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      set.add(2);
      set.add(1);

      const promise = new Promise<string>((resolve) => {
        setTimeout(() => resolve('done'), 100);
      });

      const regex1 = /abc/gi;
      const regex2 = /def/m;

      hashSet.add({ map: map });
      hashSet.add({ set: set });
      hashSet.add({ promise: promise });
      hashSet.add({ regex: regex1, flags: regex2 });

      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3300
     * @tc.name      testHashSet01Chapter0033
     * @tc.desc      Test isEmpty method on HashSet with large string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0033';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();

      const largeString = "a".repeat(1000000);
      hashSet.add(largeString);

      const treeString = ((size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      })(10000);
      hashSet.add(treeString);

      const str = "{k1:value1,k2:value2}";
      const sliceString = str.substring(0, str.length - 2);
      hashSet.add(sliceString);

      const result = hashSet.isEmpty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3400
     * @tc.name      testHashSet01Chapter0034
     * @tc.desc      Test isEmpty method binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0034';
      console.log(TAG + ' start');
      try {
        const hashSet = new HashSet<number>();
        const unboundIsEmpty = hashSet.isEmpty;
        const result = unboundIsEmpty();
        expect(result).assertUndefined();
      } catch (error) {
        expect(error.code).assertEqual(10200011);
        expect(error.message).assertContain("The isEmpty method cannot be bound");
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3500
     * @tc.name      testHashSet01Chapter0035
     * @tc.desc      Test has method with valid string element in HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0035';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("squirrel");
      const result: boolean = hashSet.has("squirrel");
      expect(result).assertTrue();
      const nonExistResult: boolean = hashSet.has("rabbit");
      expect(nonExistResult).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3600
     * @tc.name      testHashSet01Chapter0036
     * @tc.desc      Test has method with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0036';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      hashSet.add(specialChars);
      const result: boolean = hashSet.has(specialChars);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3700
     * @tc.name      testHashSet01Chapter0037
     * @tc.desc      Test has method with string null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0037';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("");
      const result1: boolean = hashSet.has("");
      expect(result1).assertTrue();
      const result2: boolean = hashSet.has("null");
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3800
     * @tc.name      testHashSet01Chapter0038
     * @tc.desc      Test has method with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0038';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const escapeStr: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\123\\x41";
      hashSet.add(escapeStr);
      const result: boolean = hashSet.has(escapeStr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_3900
     * @tc.name      testHashSet01Chapter0039
     * @tc.desc      Test has method with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0039';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const emojis: string[] = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
      emojis.forEach(emoji => hashSet.add(emoji));
      emojis.forEach(emoji => {
        const result: boolean = hashSet.has(emoji);
        expect(result).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4000
     * @tc.name      testHashSet01Chapter0040
     * @tc.desc      Test has method with number type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0040';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(NaN);
      hashSet.add(-0);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      hashSet.add(Number.EPSILON);
      hashSet.add(Number.MAX_SAFE_INTEGER);
      const result1: boolean = hashSet.has(0);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.has(NaN);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(Infinity);
      expect(result3).assertTrue();
      const result4: boolean = hashSet.has(Number.MAX_VALUE);
      expect(result4).assertTrue();
      const result5: boolean = hashSet.has(1.7976931348623157e+308);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4100
     * @tc.name      testHashSet01Chapter0041
     * @tc.desc      Test has method with different number representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0041';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(0xdecafafecacefade);
      hashSet.add(123.456);
      hashSet.add(0xcafebabe);
      hashSet.add(0x0102);
      hashSet.add(0x01020304);
      hashSet.add(0o3);
      hashSet.add(8);
      hashSet.add(1e3);
      hashSet.add(2.5e-2);
      const result1: boolean = hashSet.has(0xdecafafecacefade);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.has(123.456);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(0xcafebabe);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4200
     * @tc.name      testHashSet01Chapter0042
     * @tc.desc      Test has method with boolean type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0042';
      console.log(TAG + ' start');
      const hashSet: HashSet<boolean> = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      const result1: boolean = hashSet.has(true);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.has(false);
      expect(result2).assertTrue();
      const result3: boolean = hashSet.has(true);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4300
     * @tc.name      testHashSet01Chapter0043
     * @tc.desc      Test has method with array type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0043';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr1: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const arr3: Array<number> = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      hashSet.add(arr1);
      hashSet.add(arr2);
      hashSet.add(arr3);
      const result1: boolean = hashSet.has(arr1);
      expect(result1).assertTrue();
      const result2: boolean = hashSet.has([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4400
     * @tc.name      testHashSet01Chapter0044
     * @tc.desc      Test has method with special array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0044';
      console.log(TAG + ' start');

      type MixedArrayItem = number | string | boolean | null | undefined;
      type MixedArray = Array<MixedArrayItem>;
      type NumberArray = Array<number>;

      const hashSet: HashSet<MixedArray | NumberArray> = new HashSet<MixedArray | NumberArray>();

      const specialArr: MixedArray = [72, "abc", true, null, undefined, 108];
      const arrWithNaN: NumberArray = [72, 101, NaN, Infinity, 108, 111];
      const emptyArr: MixedArray = [];
      const overflowArr: NumberArray = [256, 65536, 32768];

      hashSet.add(specialArr);
      hashSet.add(arrWithNaN);
      hashSet.add(emptyArr);
      hashSet.add(overflowArr);

      const result1: boolean = hashSet.has(specialArr);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(arrWithNaN);
      expect(result2).assertTrue();

      const emptyTestArr: MixedArray = [];
      const result3: boolean = hashSet.has(emptyTestArr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4500
     * @tc.name      testHashSet01Chapter0045
     * @tc.desc      Test has method with object type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0045';
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

      hashSet.add(obj1);
      hashSet.add(obj2);
      hashSet.add(obj3);
      hashSet.add(obj4);
      hashSet.add(obj5);
      hashSet.add(obj6);

      const result1: boolean = hashSet.has(obj1);
      expect(result1).assertTrue();

      const testObj: SimpleObject = { a: 1, b: "test", c: [1, 2, 3] };
      const result2: boolean = hashSet.has(testObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4600
     * @tc.name      testHashSet01Chapter0046
     * @tc.desc      Test has method with TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0046';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int8Array | Uint8Array | Float32Array | Float64Array> =
        new HashSet<Int8Array | Uint8Array | Float32Array | Float64Array>();

      const int8Arr: Int8Array = new Int8Array([-128, 0, 127]);
      const uint8Arr: Uint8Array = new Uint8Array([0, 128, 255]);
      const float32Arr: Float32Array = new Float32Array([-3.4028234663852886e38, 0, 3.4028234663852886e38]);
      const float64Arr: Float64Array = new Float64Array([-1.7976931348623157e308, 0, 1.7976931348623157e308]);

      hashSet.add(int8Arr);
      hashSet.add(uint8Arr);
      hashSet.add(float32Arr);
      hashSet.add(float64Arr);

      const result1: boolean = hashSet.has(int8Arr);
      expect(result1).assertTrue();

      const newInt8Arr: Int8Array = new Int8Array([-128, 0, 127]);
      const result2: boolean = hashSet.has(newInt8Arr);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4700
     * @tc.name      testHashSet01Chapter0047
     * @tc.desc      Test has method with Map and Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0047';
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

      hashSet.add(map);
      hashSet.add(set);
      hashSet.add(regex);

      const result1: boolean = hashSet.has(map);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(set);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(regex);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4800
     * @tc.name      testHashSet01Chapter0048
     * @tc.desc      Test has method with treeString type large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0048';
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
      hashSet.add(largeString);
      const result: boolean = hashSet.has(largeString);
      expect(result).assertTrue();
      const nonExistResult: boolean = hashSet.has(init(1010));
      expect(nonExistResult).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_4900
     * @tc.name      testHashSet01Chapter0049
     * @tc.desc      Test has method with repeated string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0049';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const repeatedStr: string = "a".repeat(100);
      hashSet.add(repeatedStr);
      const result: boolean = hashSet.has(repeatedStr);
      expect(result).assertTrue();
      const nonExistResult: boolean = hashSet.has("a".repeat(99));
      expect(nonExistResult).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5000
     * @tc.name      testHashSet01Chapter0050
     * @tc.desc      Test has method with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0050';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int16Array> = new HashSet<Int16Array>();
      const int16ArrMin: Int16Array = new Int16Array([-32768]);
      const int16ArrMax: Int16Array = new Int16Array([32767]);
      const int16ArrOut1: Int16Array = new Int16Array([-32769]);
      const int16ArrOut2: Int16Array = new Int16Array([32768]);

      hashSet.add(int16ArrMin);
      hashSet.add(int16ArrMax);
      hashSet.add(int16ArrOut1);
      hashSet.add(int16ArrOut2);

      const result1: boolean = hashSet.has(int16ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(int16ArrMax);
      expect(result2).assertTrue();

      const newInt16Arr: Int16Array = new Int16Array([-32768]);
      const result3: boolean = hashSet.has(newInt16Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5100
     * @tc.name      testHashSet01Chapter0051
     * @tc.desc      Test has method with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0051';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint16Array> = new HashSet<Uint16Array>();
      const uint16ArrMin: Uint16Array = new Uint16Array([0]);
      const uint16ArrMax: Uint16Array = new Uint16Array([65535]);
      const uint16ArrOut1: Uint16Array = new Uint16Array([-1]);
      const uint16ArrOut2: Uint16Array = new Uint16Array([65536]);

      hashSet.add(uint16ArrMin);
      hashSet.add(uint16ArrMax);
      hashSet.add(uint16ArrOut1);
      hashSet.add(uint16ArrOut2);

      const result1: boolean = hashSet.has(uint16ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(uint16ArrMax);
      expect(result2).assertTrue();

      const newUint16Arr: Uint16Array = new Uint16Array([0]);
      const result3: boolean = hashSet.has(newUint16Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5200
     * @tc.name      testHashSet01Chapter0052
     * @tc.desc      Test has method with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0052';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int32Array> = new HashSet<Int32Array>();
      const int32ArrMin: Int32Array = new Int32Array([-2147483648]);
      const int32ArrMax: Int32Array = new Int32Array([2147483647]);
      const int32ArrOut1: Int32Array = new Int32Array([-2147483649]);
      const int32ArrOut2: Int32Array = new Int32Array([2147483648]);

      hashSet.add(int32ArrMin);
      hashSet.add(int32ArrMax);
      hashSet.add(int32ArrOut1);
      hashSet.add(int32ArrOut2);

      const result1: boolean = hashSet.has(int32ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(int32ArrMax);
      expect(result2).assertTrue();

      const newInt32Arr: Int32Array = new Int32Array([-2147483648]);
      const result3: boolean = hashSet.has(newInt32Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5300
     * @tc.name      testHashSet01Chapter0053
     * @tc.desc      Test has method with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0053';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint32Array> = new HashSet<Uint32Array>();
      const uint32ArrMin: Uint32Array = new Uint32Array([0]);
      const uint32ArrMax: Uint32Array = new Uint32Array([4294967295]);
      const uint32ArrOut1: Uint32Array = new Uint32Array([-1]);
      const uint32ArrOut2: Uint32Array = new Uint32Array([4294967296]);

      hashSet.add(uint32ArrMin);
      hashSet.add(uint32ArrMax);
      hashSet.add(uint32ArrOut1);
      hashSet.add(uint32ArrOut2);

      const result1: boolean = hashSet.has(uint32ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(uint32ArrMax);
      expect(result2).assertTrue();

      const newUint32Arr: Uint32Array = new Uint32Array([0]);
      const result3: boolean = hashSet.has(newUint32Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5400
     * @tc.name      testHashSet01Chapter0054
     * @tc.desc      Test has method with Uint8ClampedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0054';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint8ClampedArray> = new HashSet<Uint8ClampedArray>();
      const clampedArrMin: Uint8ClampedArray = new Uint8ClampedArray([0]);
      const clampedArrMax: Uint8ClampedArray = new Uint8ClampedArray([255]);
      const clampedArrOut1: Uint8ClampedArray = new Uint8ClampedArray([-1]);
      const clampedArrOut2: Uint8ClampedArray = new Uint8ClampedArray([256]);

      hashSet.add(clampedArrMin);
      hashSet.add(clampedArrMax);
      hashSet.add(clampedArrOut1);
      hashSet.add(clampedArrOut2);

      const result1: boolean = hashSet.has(clampedArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(clampedArrMax);
      expect(result2).assertTrue();

      const newClampedArr: Uint8ClampedArray = new Uint8ClampedArray([0]);
      const result3: boolean = hashSet.has(newClampedArr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5500
     * @tc.name      testHashSet01Chapter0055
     * @tc.desc      Test has method with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0055';
      console.log(TAG + ' start');

      const hashSet: HashSet<BigInt64Array> = new HashSet<BigInt64Array>();
      const bigInt64ArrMin: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const bigInt64ArrMax: BigInt64Array = new BigInt64Array([9223372036854775807n]);

      hashSet.add(bigInt64ArrMin);
      hashSet.add(bigInt64ArrMax);

      const result1: boolean = hashSet.has(bigInt64ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(bigInt64ArrMax);
      expect(result2).assertTrue();

      const newBigInt64Arr: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const result3: boolean = hashSet.has(newBigInt64Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5600
     * @tc.name      testHashSet01Chapter0056
     * @tc.desc      Test has method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0056';
      console.log(TAG + ' start');

      const hashSet: HashSet<BigUint64Array> = new HashSet<BigUint64Array>();
      const bigUint64ArrMin: BigUint64Array = new BigUint64Array([0n]);
      const bigUint64ArrMax: BigUint64Array = new BigUint64Array([18446744073709551615n]);

      hashSet.add(bigUint64ArrMin);
      hashSet.add(bigUint64ArrMax);

      const result1: boolean = hashSet.has(bigUint64ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(bigUint64ArrMax);
      expect(result2).assertTrue();

      const newBigUint64Arr: BigUint64Array = new BigUint64Array([0n]);
      const result3: boolean = hashSet.has(newBigUint64Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5700
     * @tc.name      testHashSet01Chapter0057
     * @tc.desc      Test has method with TypedArray special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0057';
      console.log(TAG + ' start');

      type TypedArrayUnion = Float32Array | Float64Array | Int8Array | Uint8Array | Int16Array | Uint16Array
        | Int32Array | Uint32Array | Uint8ClampedArray;

      const hashSet: HashSet<TypedArrayUnion> = new HashSet<TypedArrayUnion>();

      const float32ArrWithInf: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      const float64ArrWithInf: Float64Array = new Float64Array([Infinity, -Infinity, NaN]);
      const int8ArrWithSpecial: Int8Array = new Int8Array([Infinity, -Infinity, NaN]);
      const uint8ArrWithSpecial: Uint8Array = new Uint8Array([Infinity, -Infinity, NaN]);
      const uint8ClampedArrWithSpecial: Uint8ClampedArray = new Uint8ClampedArray([Infinity, -Infinity, NaN]);

      hashSet.add(float32ArrWithInf);
      hashSet.add(float64ArrWithInf);
      hashSet.add(int8ArrWithSpecial);
      hashSet.add(uint8ArrWithSpecial);
      hashSet.add(uint8ClampedArrWithSpecial);

      const result1: boolean = hashSet.has(float32ArrWithInf);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(int8ArrWithSpecial);
      expect(result2).assertTrue();

      const newFloat32Arr: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      const result3: boolean = hashSet.has(newFloat32Arr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5800
     * @tc.name      testHashSet01Chapter0058
     * @tc.desc      Test has method with full ASCII string characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0058';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const asciiString: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      hashSet.add(asciiString);

      const result1: boolean = hashSet.has(asciiString);
      expect(result1).assertTrue();

      const duplicateAsciiString: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const result2: boolean = hashSet.has(duplicateAsciiString);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_5900
     * @tc.name      testHashSet01Chapter0059
     * @tc.desc      Test has method with invalid Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0059';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const invalidUnicode1: string = "\udc04";
      const invalidUnicode2: string = "\ud83d";
      const invalidUnicode3: string = "\udff4";

      hashSet.add(invalidUnicode1);
      hashSet.add(invalidUnicode2);
      hashSet.add(invalidUnicode3);

      const result1: boolean = hashSet.has(invalidUnicode1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(invalidUnicode2);
      expect(result2).assertTrue();

      const newInvalidUnicode: string = "\udc04";
      const result3: boolean = hashSet.has(newInvalidUnicode);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_6000
     * @tc.name      testHashSet01Chapter0060
     * @tc.desc      Test has method with string keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0060';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const keyword1: string = "0";
      const keyword2: string = "NaN";
      const keyword3: string = "";

      hashSet.add(keyword1);
      hashSet.add(keyword2);
      hashSet.add(keyword3);

      const result1: boolean = hashSet.has(keyword1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(keyword2);
      expect(result2).assertTrue();

      const newKeyword: string = "0";
      const result3: boolean = hashSet.has(newKeyword);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_6100
     * @tc.name      testHashSet01Chapter0061
     * @tc.desc      Test has method with slice string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0061';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const originalStr: string = "{k1:value1,k2:value2}";
      const slicedStr: string = originalStr.substring(0, originalStr.length - 2);

      hashSet.add(slicedStr);

      const result1: boolean = hashSet.has(slicedStr);
      expect(result1).assertTrue();

      const newSlicedStr: string = originalStr.substring(0, originalStr.length - 2);
      const result2: boolean = hashSet.has(newSlicedStr);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(originalStr);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_6200
     * @tc.name      testHashSet01Chapter0062
     * @tc.desc      Test has method with number type byte range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0062';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(-128);
      hashSet.add(127);
      hashSet.add(-129);
      hashSet.add(128);

      const result1: boolean = hashSet.has(-128);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(127);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST01_6300
     * @tc.name      testHashSet01Chapter0063
     * @tc.desc      Test has method with number type short range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet01Chapter0063';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(-32768);
      hashSet.add(32767);
      hashSet.add(-32769);
      hashSet.add(32768);

      const result1: boolean = hashSet.has(-32768);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(32767);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

  })
}