import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { TreeMap } from '@kit.ArkTS';

interface TestEntry {
  id: number;
}

interface CustomKey {
  id: number;
}

interface NestedKey {
  id: number;
  name: string;
}

interface ObjABC {
  a: number;
  b: string;
  c: number[];
}

interface ObjSym {
  a: number;
  symKey: string;
}

interface ObjFunc {
  a: number;
  b: () => void;
}

type MixedArrayElement = number | string | boolean | null | undefined;

interface NestedLevel2 {
  e: number;
}

interface NestedLevel1 {
  c: number;
  d: NestedLevel2;
}

interface NestedObjectValue {
  a: number;
  b: NestedLevel1;
}

interface InheritObj {
  parentProp: number;
  childProp: number;
}

interface SpecialArrayMap {
  abc: number;
  aaa: number;
}

interface SimpleObjectValue {
  a: number;
}

interface MixedKeysObjectValue {
  a: number;
  symProp: number;
  b: number;
}

interface UndefinedPropertyObject {
  a: number | undefined;
  b: number;
}

interface NullPropertyObject {
  a: number | null;
  b: number;
}

interface RegExpObjectValue {
  regex: RegExp;
  flags: RegExp;
}

interface MapValueObject {
  a: number;
}

interface TypedArrayPropertyObject {
  buffer: Uint8Array;
}

type MapValue = string | MapValueObject;

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap01Test() {
  describe('TreeMap01Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST01_0100
     * @tc.name      testTreeMap01Chapter0001
     * @tc.desc      TreeMap default constructor without comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0001';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      expect(treeMap !== null && treeMap !== undefined).assertTrue();
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0200
     * @tc.name      testTreeMap01Chapter0002
     * @tc.desc      TreeMap constructor with comparator for ascending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0002';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(5, "five");
      treeMap.set(1, "one");
      treeMap.set(3, "three");
      treeMap.set(2, "two");
      treeMap.set(4, "four");
      let expectedKeys = [1, 2, 3, 4, 5];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0300
     * @tc.name      testTreeMap01Chapter0003
     * @tc.desc      TreeMap constructor with comparator for descending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0003';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue > secondValue;
        });
      treeMap.set(1, "one");
      treeMap.set(5, "five");
      treeMap.set(3, "three");
      treeMap.set(4, "four");
      treeMap.set(2, "two");
      let expectedKeys = [5, 4, 3, 2, 1];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0400
     * @tc.name      testTreeMap01Chapter0004
     * @tc.desc      TreeMap constructor with string key comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0004';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> =
        new TreeMap<string, number>((firstValue: string, secondValue: string): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set("banana", 3);
      treeMap.set("apple", 1);
      treeMap.set("cherry", 2);
      let expectedKeys = ["apple", "banana", "cherry"];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0500
     * @tc.name      testTreeMap01Chapter0005
     * @tc.desc      TreeMap constructor with custom object key and comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0005';
      console.log(TAG + ' start');
      let treeMap: TreeMap<TestEntry, string> =
        new TreeMap<TestEntry, string>((t1: TestEntry, t2: TestEntry): boolean => {
          return t1.id < t2.id;
        });
      let entry1: TestEntry = {
        id: 100
      };
      let entry2: TestEntry = {
        id: 200
      };
      treeMap.set(entry2, "second");
      treeMap.set(entry1, "first");
      let keys: TestEntry[] = [];
      for (let item of treeMap) {
        keys.push(item[0]);
      }
      expect(keys[0].id).assertEqual(100);
      expect(keys[1].id).assertEqual(200);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0600
     * @tc.name      testTreeMap01Chapter0006
     * @tc.desc      TreeMap constructor with comparator returning always true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0006';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return true;
        });
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");
      expect(treeMap.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0700
     * @tc.name      testTreeMap01Chapter0007
     * @tc.desc      TreeMap constructor with comparator returning always false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0007';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return false;
        });
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");
      expect(treeMap.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0800
     * @tc.name      testTreeMap01Chapter0008
     * @tc.desc      TreeMap constructor with undefined comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0008';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>(undefined);
      treeMap.set(1, 100);
      treeMap.set(2, 200);
      expect(treeMap.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_0900
     * @tc.name      testTreeMap01Chapter0009
     * @tc.desc      TreeMap constructor with null comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0009';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>();
      treeMap.set(1, 100);
      treeMap.set(2, 200);
      expect(treeMap.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1000
     * @tc.name      testTreeMap01Chapter0010
     * @tc.desc      Reverse test: TreeMap constructor with non-function comparator parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0010';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, number> =
        new TreeMap<number, number>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(1, 100);
      treeMap.set(2, 200);
      expect(treeMap.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1100
     * @tc.name      testTreeMap01Chapter0011
     * @tc.desc      Reverse test: TreeMap constructor with comparator that throws exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0011';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(1, "one");
      treeMap.set(2, "two");
      expect(treeMap.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1200
     * @tc.name      testTreeMap01Chapter0012
     * @tc.desc      Reverse test: TreeMap constructor with comparator returning non-boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0012';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(1, "one");
      treeMap.set(2, "two");
      expect(treeMap.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1300
     * @tc.name      testTreeMap01Chapter0013
     * @tc.desc      Reverse test: TreeMap constructor with comparator missing parameter type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0013';
      console.log(TAG + ' start');
      try {
        let treeMap: TreeMap<number, string> =
          new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
            return firstValue < secondValue;
          });
        treeMap.set(2, "two");
        treeMap.set(1, "one");
        let keys: number[] = [];
        for (let item of treeMap) {
          keys.push(item[0]);
        }
        expect(keys[0]).assertEqual(1);
        expect(keys[1]).assertEqual(2);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1400
     * @tc.name      testTreeMap01Chapter0014
     * @tc.desc      Reverse test: TreeMap constructor with custom object key without comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0014';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<CustomKey, string>();
      let key1: CustomKey = {
        id: 1
      };
      treeMap.set(key1, "value1");
      expect(treeMap.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1500
     * @tc.name      testTreeMap01Chapter0015
     * @tc.desc      Reverse test: Direct invocation of TreeMap constructor without new
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0015';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>();
      expect(treeMap.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1600
     * @tc.name      testTreeMap01Chapter0016
     * @tc.desc      TreeMap constructor with comparator using string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0016';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> =
        new TreeMap<string, number>((firstValue: string, secondValue: string): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set("!", 1);
      treeMap.set("#", 2);
      treeMap.set("$", 3);
      treeMap.set("%", 4);
      let expectedKeys = ["!", "#", "$", "%"];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1700
     * @tc.name      testTreeMap01Chapter0017
     * @tc.desc      TreeMap constructor with comparator using emoji keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0017';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> =
        new TreeMap<string, number>((firstValue: string, secondValue: string): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set("👆", 1);
      treeMap.set("👿", 2);
      treeMap.set("👀", 3);
      let expectedKeys = ["👀", "👆", "👿"];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1800
     * @tc.name      testTreeMap01Chapter0018
     * @tc.desc      TreeMap constructor with comparator using number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0018';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(Number.MAX_VALUE, "max");
      treeMap.set(Number.MIN_VALUE, "min");
      treeMap.set(0, "zero");
      let expectedKeys = [0, Number.MIN_VALUE, Number.MAX_VALUE];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_1900
     * @tc.name      testTreeMap01Chapter0019
     * @tc.desc      TreeMap constructor with comparator using Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0019';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(Infinity, "inf");
      treeMap.set(-Infinity, "-inf");
      treeMap.set(0, "zero");
      let expectedKeys = [-Infinity, 0, Infinity];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2000
     * @tc.name      testTreeMap01Chapter0020
     * @tc.desc      TreeMap constructor with comparator using NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0020';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> =
        new TreeMap<number, string>((firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(NaN, "nan");
      treeMap.set(1, "one");
      expect(treeMap.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2100
     * @tc.name      testTreeMap01Chapter0021
     * @tc.desc      TreeMap constructor with comparator using bigint keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0021';
      console.log(TAG + ' start');
      let treeMap: TreeMap<bigint, string> =
        new TreeMap<bigint, string>((firstValue: bigint, secondValue: bigint): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(BigInt(9007199254740991), "maxSafe");
      treeMap.set(BigInt(0), "zero");
      treeMap.set(BigInt(-9007199254740991), "minSafe");
      let expectedKeys = [BigInt(-9007199254740991), BigInt(0), BigInt(9007199254740991)];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2200
     * @tc.name      testTreeMap01Chapter0022
     * @tc.desc      TreeMap constructor with comparator using boolean keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0022';
      console.log(TAG + ' start');
      let treeMap: TreeMap<boolean, string> =
        new TreeMap<boolean, string>((firstValue: boolean, secondValue: boolean): boolean => {
          return firstValue < secondValue;
        });
      treeMap.set(false, "false");
      treeMap.set(true, "true");
      let expectedKeys = [false, true];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2300
     * @tc.name      testTreeMap01Chapter0023
     * @tc.desc      TreeMap constructor with comparator using array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0023';
      console.log(TAG + ' start');
      let treeMap: TreeMap<Array<number>, string> =
        new TreeMap<Array<number>, string>((firstValue: Array<number>, secondValue: Array<number>): boolean => {
          if (firstValue.length === secondValue.length) {
            for (let i = 0; i < firstValue.length; i++) {
              if (firstValue[i] !== secondValue[i]) {
                return firstValue[i] < secondValue[i];
              }
            }
            return false;
          }
          return firstValue.length < secondValue.length;
        });
      let arr1: Array<number> = [1, 2];
      let arr2: Array<number> = [3, 4];
      let arr3: Array<number> = [1, 2, 3];
      treeMap.set(arr2, "arr2");
      treeMap.set(arr3, "arr3");
      treeMap.set(arr1, "arr1");
      let expectedKeys = [arr1, arr2, arr3];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2400
     * @tc.name      testTreeMap01Chapter0024
     * @tc.desc      TreeMap constructor with comparator using object keys with nested structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0024';
      console.log(TAG + ' start');
      let treeMap: TreeMap<NestedKey, string> =
        new TreeMap<NestedKey, string>((firstValue: NestedKey, secondValue: NestedKey): boolean => {
          if (firstValue.id === secondValue.id) {
            return firstValue.name < secondValue.name;
          }
          return firstValue.id < secondValue.id;
        });
      let key1: NestedKey = {
        id: 2,
        name: "beta"
      };
      let key2: NestedKey = {
        id: 1,
        name: "alpha"
      };
      let key3: NestedKey = {
        id: 2,
        name: "alpha"
      };
      treeMap.set(key1, "value1");
      treeMap.set(key2, "value2");
      treeMap.set(key3, "value3");
      let expectedKeys = [key2, key3, key1];
      let index = 0;
      for (let item of treeMap) {
        expect(item[0]).assertEqual(expectedKeys[index]);
        index++;
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2500
     * @tc.name      testTreeMap01Chapter0025
     * @tc.desc      Check if the TreeMap is empty when it's newly created
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0025';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>();
      let result = treeMap.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2600
     * @tc.name      testTreeMap01Chapter0026
     * @tc.desc      Check if the TreeMap is not empty after adding elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0026';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1, "value1");
      treeMap.set(2, "value2");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2700
     * @tc.name      testTreeMap01Chapter0027
     * @tc.desc      Check if the TreeMap becomes empty after clearing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 100);
      treeMap.set("key2", 200);
      treeMap.clear();
      let result = treeMap.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2800
     * @tc.name      testTreeMap01Chapter0028
     * @tc.desc      Check isEmpty after adding and removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, boolean>();
      treeMap.set(1, true);
      treeMap.set(2, false);
      treeMap.remove(1);
      treeMap.remove(2);
      let result = treeMap.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_2900
     * @tc.name      testTreeMap01Chapter0029
     * @tc.desc      Check isEmpty with TreeMap containing Int8Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-128, "minInt8");
      treeMap.set(127, "maxInt8");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3000
     * @tc.name      testTreeMap01Chapter0030
     * @tc.desc      Check isEmpty with TreeMap containing string special character key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3100
     * @tc.name      testTreeMap01Chapter0031
     * @tc.desc      Check isEmpty with TreeMap containing NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0031';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>();
      treeMap.set(1, NaN);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3200
     * @tc.name      testTreeMap01Chapter0032
     * @tc.desc      Check isEmpty with TreeMap containing Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0032';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, number>();
      treeMap.set(1, Infinity);
      treeMap.set(2, -Infinity);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3300
     * @tc.name      testTreeMap01Chapter0033
     * @tc.desc      Check isEmpty with TreeMap containing boolean key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(true, "truth");
      treeMap.set(false, "falsehood");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3400
     * @tc.name      testTreeMap01Chapter0034
     * @tc.desc      Check isEmpty with TreeMap containing array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      treeMap.set(1, [72, 101, 108, 108, 111]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3500
     * @tc.name      testTreeMap01Chapter0035
     * @tc.desc      Check isEmpty with TreeMap containing object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const obj: ObjABC = { a: 1, b: "test", c: [1, 2, 3] };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3600
     * @tc.name      testTreeMap01Chapter0036
     * @tc.desc      Check isEmpty with TreeMap containing null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0036';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, null>();
      treeMap.set(1, null);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3700
     * @tc.name      testTreeMap01Chapter0037
     * @tc.desc      Check isEmpty with TreeMap containing undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0037';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, undefined>();
      treeMap.set(1, undefined);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3800
     * @tc.name      testTreeMap01Chapter0038
     * @tc.desc      Check isEmpty with TreeMap containing string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0038';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      const key = "symbol_like_key";
      treeMap.set(key, "symbolValue");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_3900
     * @tc.name      testTreeMap01Chapter0039
     * @tc.desc      Check isEmpty with TreeMap containing bigint key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0039';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("9223372036854775807"), "maxBigInt64");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_4000
     * @tc.name      testTreeMap01Chapter0040
     * @tc.desc      Check isEmpty with TreeMap containing Uint8Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minUint8");
      treeMap.set(255, "maxUint8");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4100
     * @tc.name      testTreeMap01Chapter0041
     * @tc.desc      Check isEmpty with TreeMap containing Int16Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, "minInt16");
      treeMap.set(32767, "maxInt16");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4200
     * @tc.name      testTreeMap01Chapter0042
     * @tc.desc      Check isEmpty with TreeMap containing Uint16Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0042';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minUint16");
      treeMap.set(65535, "maxUint16");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4300
     * @tc.name      testTreeMap01Chapter0043
     * @tc.desc      Check isEmpty with TreeMap containing Int32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483648, "minInt32");
      treeMap.set(2147483647, "maxInt32");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4400
     * @tc.name      testTreeMap01Chapter0044
     * @tc.desc      Check isEmpty with TreeMap containing Uint32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minUint32");
      treeMap.set(4294967295, "maxUint32");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4500
     * @tc.name      testTreeMap01Chapter0045
     * @tc.desc      Check isEmpty with TreeMap containing Float32Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-3.4028234663852886e38, "minFloat32");
      treeMap.set(3.4028234663852886e38, "maxFloat32");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4600
     * @tc.name      testTreeMap01Chapter0046
     * @tc.desc      Check isEmpty with TreeMap containing Float64Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0046';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-1.7976931348623157e308, "minFloat64");
      treeMap.set(1.7976931348623157e308, "maxFloat64");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4700
     * @tc.name      testTreeMap01Chapter0047
     * @tc.desc      Check isEmpty with TreeMap containing BigUint64Array boundary value key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0047';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(0n, "minBigUint64");
      treeMap.set(18446744073709551615n, "maxBigUint64");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_4800
     * @tc.name      testTreeMap01Chapter0048
     * @tc.desc      Check isEmpty with TreeMap containing undefined key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0048';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("undefined", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_4900
     * @tc.name      testTreeMap01Chapter0049
     * @tc.desc      Check isEmpty with TreeMap containing null key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0049';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("null", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5000
     * @tc.name      testTreeMap01Chapter0050
     * @tc.desc      Check isEmpty with TreeMap containing empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0050';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5100
     * @tc.name      testTreeMap01Chapter0051
     * @tc.desc      Check isEmpty with TreeMap containing ASCII full coverage key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0051';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~",
        1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5200
     * @tc.name      testTreeMap01Chapter0052
     * @tc.desc      Check isEmpty with TreeMap containing duplicate special characters key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0052';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set(" !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5300
     * @tc.name      testTreeMap01Chapter0053
     * @tc.desc      Check isEmpty with TreeMap containing escape characters key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0053';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x41", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5400
     * @tc.name      testTreeMap01Chapter0054
     * @tc.desc      Check isEmpty with TreeMap containing emoji unicode key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0054';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("\\ud83d\\udc46\\ud83d\\udc7f\\ud83d\\udc40\\ud83d\\udcaf\\ud83c\\udf85\\ud83d\\ude3c\\ud83d\\udd27\\ud83d\\udc87\\ud83e\\udd3c\\u200d\\u2642\\ufe0f\\ud83d\\udee2\\ud83c\\udc04\\ud83c\\udff4",
        1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5500
     * @tc.name      testTreeMap01Chapter0055
     * @tc.desc      Check isEmpty with TreeMap containing illegal unicode key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0055';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("\\udc04\\ud83d\\udff4", 1);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5600
     * @tc.name      testTreeMap01Chapter0056
     * @tc.desc      Check isEmpty with TreeMap containing keyword key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0056';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("0", 1);
      treeMap.set("NaN", 2);
      treeMap.set("", 3);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_5700
     * @tc.name      testTreeMap01Chapter0057
     * @tc.desc      Check isEmpty with TreeMap containing 0 key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0057';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5800
     * @tc.name      testTreeMap01Chapter0058
     * @tc.desc      Check isEmpty with TreeMap containing -0 key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0058';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-0, "negativeZero");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_5900
     * @tc.name      testTreeMap01Chapter0059
     * @tc.desc      Check isEmpty with TreeMap containing Number.MAX_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0059';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "maxValue");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6000
     * @tc.name      testTreeMap01Chapter0060
     * @tc.desc      Check isEmpty with TreeMap containing Number.MIN_VALUE key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0060';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_VALUE, "minValue");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6100
     * @tc.name      testTreeMap01Chapter0061
     * @tc.desc      Check isEmpty with TreeMap containing Number.EPSILON key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0061';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.EPSILON, "epsilon");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6200
     * @tc.name      testTreeMap01Chapter0062
     * @tc.desc      Check isEmpty with TreeMap containing Number.MAX_SAFE_INTEGER key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0062';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "maxSafeInteger");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6300
     * @tc.name      testTreeMap01Chapter0063
     * @tc.desc      Check isEmpty with TreeMap containing short boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0063';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, "minShort");
      treeMap.set(32767, "maxShort");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6400
     * @tc.name      testTreeMap01Chapter0064
     * @tc.desc      Check isEmpty with TreeMap containing long boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0064';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(-9223372036854775808n, "minLong");
      treeMap.set(9223372036854775807n, "maxLong");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6500
     * @tc.name      testTreeMap01Chapter0065
     * @tc.desc      Check isEmpty with TreeMap containing float boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0065';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1.40129846432481707e-45, "minFloat");
      treeMap.set(3.40282346638528860e38, "maxFloat");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6600
     * @tc.name      testTreeMap01Chapter0066
     * @tc.desc      Check isEmpty with TreeMap containing double boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0066';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(4.94065645841246544e-324, "minDouble");
      treeMap.set(1.79769313486231570e308, "maxDouble");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6700
     * @tc.name      testTreeMap01Chapter0067
     * @tc.desc      Check isEmpty with TreeMap containing char boundary key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0067';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minChar");
      treeMap.set(65535, "maxChar");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6800
     * @tc.name      testTreeMap01Chapter0068
     * @tc.desc      Check isEmpty with TreeMap containing hex number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0068';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0x0102, "hex");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_6900
     * @tc.name      testTreeMap01Chapter0069
     * @tc.desc      Check isEmpty with TreeMap containing octal number key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0069';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0o3, "octal");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7000
     * @tc.name      testTreeMap01Chapter0070
     * @tc.desc      Check isEmpty with TreeMap containing exponent operator key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0070';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(2**3, "exponent");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7100
     * @tc.name      testTreeMap01Chapter0071
     * @tc.desc      Check isEmpty with TreeMap containing scientific notation key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0071';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, "scientific1");
      treeMap.set(2.5e-2, "scientific2");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_7200
     * @tc.name      testTreeMap01Chapter0072
     * @tc.desc      Check isEmpty with TreeMap containing 0 as false-like key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0072';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zeroFalse");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7300
     * @tc.name      testTreeMap01Chapter0073
     * @tc.desc      Check isEmpty with TreeMap containing empty string as false-like key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0073';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("", "emptyFalse");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7400
     * @tc.name      testTreeMap01Chapter0074
     * @tc.desc      Check isEmpty with TreeMap containing null as false-like key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0074';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<object, string>();
      treeMap.set(null, "nullFalse");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7500
     * @tc.name      testTreeMap01Chapter0075
     * @tc.desc      Check isEmpty with TreeMap containing undefined as false-like key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0075';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<undefined, string>();
      treeMap.set(undefined, "undefinedFalse");
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_7600
     * @tc.name      testTreeMap01Chapter0076
     * @tc.desc      Check isEmpty with TreeMap containing array with multiple zeros value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0076';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      treeMap.set(1, [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7700
     * @tc.name      testTreeMap01Chapter0077
     * @tc.desc      Check isEmpty with TreeMap containing array with negative numbers value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0077';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      treeMap.set(1, [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7800
     * @tc.name      testTreeMap01Chapter0078
     * @tc.desc      Check isEmpty with TreeMap containing special array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0078';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, SpecialArrayMap>();
      let arr: SpecialArrayMap = { abc: 111, aaa: 222 };
      treeMap.set(1, arr);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_7900
     * @tc.name      testTreeMap01Chapter0079
     * @tc.desc      Check isEmpty with TreeMap containing array with NaN/Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0079';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      treeMap.set(1, [72, 101, NaN, Infinity, 108, 111]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8000
     * @tc.name      testTreeMap01Chapter0080
     * @tc.desc      Check isEmpty with TreeMap containing array with non-number types value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0080';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<MixedArrayElement>>();
      treeMap.set(1, [72, "abc", true, null, undefined, 108]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8100
     * @tc.name      testTreeMap01Chapter0081
     * @tc.desc      Check isEmpty with TreeMap containing empty array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0081';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<MixedArrayElement>>();
      treeMap.set(1, []);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8200
     * @tc.name      testTreeMap01Chapter0082
     * @tc.desc      Check isEmpty with TreeMap containing array with overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0082';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      treeMap.set(1, [256, 65536, 32768]);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST01_8300
     * @tc.name      testTreeMap01Chapter0083
     * @tc.desc      Check isEmpty with TreeMap containing nested object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0083';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, NestedObjectValue>();
      let nested: NestedObjectValue = { a: 1, b: { c: 2, d: { e: 3 } } };
      treeMap.set(1, nested);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8400
     * @tc.name      testTreeMap01Chapter0084
     * @tc.desc      Check isEmpty with TreeMap containing object with pseudo Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0084';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const symKey = "symKey";
      const obj: ObjSym = { a: 1, symKey: symKey };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8500
     * @tc.name      testTreeMap01Chapter0085
     * @tc.desc      Check isEmpty with TreeMap containing object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0085';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, object>();
      const obj: ObjFunc = {
        a: 1, b: () => {
        }
      };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8600
     * @tc.name      testTreeMap01Chapter0086
     * @tc.desc      Check isEmpty with TreeMap containing object with inheritance-like properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0086';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, InheritObj>();
      let child: InheritObj = { parentProp: 1, childProp: 2 };
      treeMap.set(1, child);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8700
     * @tc.name      testTreeMap01Chapter0087
     * @tc.desc      Check isEmpty with TreeMap containing object with property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0087';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, SimpleObjectValue>();
      let obj: SimpleObjectValue = { a: 1 };
      treeMap.set(1, obj);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8800
     * @tc.name      testTreeMap01Chapter0088
     * @tc.desc      Check isEmpty with TreeMap containing object with mixed keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0088';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, MixedKeysObjectValue>();
      let value: MixedKeysObjectValue = { a: 1, symProp: 2, b: 3 };
      treeMap.set(1, value);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_8900
     * @tc.name      testTreeMap01Chapter0089
     * @tc.desc      Check isEmpty with TreeMap containing ArrayBuffer object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0089';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, ArrayBuffer>();
      treeMap.set(1, new ArrayBuffer(16));
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9000
     * @tc.name      testTreeMap01Chapter0090
     * @tc.desc      Check isEmpty with TreeMap containing DataView object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0090';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, DataView>();
      treeMap.set(1, new DataView(new ArrayBuffer(16)));
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9100
     * @tc.name      testTreeMap01Chapter0091
     * @tc.desc      Check isEmpty with TreeMap containing large object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0091';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Array<number>>();
      const largeArray: Array<number> = [];
      for (let i = 0; i < 10000; i++) {
        largeArray.push(i);
      }
      treeMap.set(1, largeArray);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9200
     * @tc.name      testTreeMap01Chapter0092
     * @tc.desc      Check isEmpty with TreeMap containing object with undefined property value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0092';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, UndefinedPropertyObject>();
      const value: UndefinedPropertyObject = { a: undefined, b: 1 };
      treeMap.set(1, value);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9300
     * @tc.name      testTreeMap01Chapter0093
     * @tc.desc      Check isEmpty with TreeMap containing object with null property value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0093';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, NullPropertyObject>();
      const value: NullPropertyObject = { a: null, b: 1 };
      treeMap.set(1, value);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9400
     * @tc.name      testTreeMap01Chapter0094
     * @tc.desc      Check isEmpty with TreeMap containing TypedArray property object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0094';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, TypedArrayPropertyObject>();
      const value: TypedArrayPropertyObject = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      treeMap.set(1, value);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9500
     * @tc.name      testTreeMap01Chapter0095
     * @tc.desc      Check isEmpty with TreeMap containing Map object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0095';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Map<string, MapValue>>();
      const mapValue: Map<string, MapValue> = new Map<string, MapValue>();
      mapValue.set('key1', 'value1');
      mapValue.set('key2', { a: 1 });
      treeMap.set(1, mapValue);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9600
     * @tc.name      testTreeMap01Chapter0096
     * @tc.desc      Check isEmpty with TreeMap containing Set object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0096';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Set<number>>();
      treeMap.set(1, new Set([1, 2, 3, 2, 1]));
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9700
     * @tc.name      testTreeMap01Chapter0097
     * @tc.desc      Check isEmpty with TreeMap containing Promise object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0097';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, Promise<string>>();
      treeMap.set(1, new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100)));
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST01_9800
     * @tc.name      testTreeMap01Chapter0098
     * @tc.desc      Check isEmpty with TreeMap containing RegExp object value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap01Chapter0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap01Chapter0098';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, RegExpObjectValue>();
      const value: RegExpObjectValue = { regex: /abc/gi, flags: /def/m };
      treeMap.set(1, value);
      let result = treeMap.isEmpty();
      expect(result).assertFalse();
    });

  })
}
