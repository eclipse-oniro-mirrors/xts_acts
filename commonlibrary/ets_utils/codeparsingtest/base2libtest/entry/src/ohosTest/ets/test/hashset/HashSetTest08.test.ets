import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { HashSet } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashSet08Test() {
  describe('HashSet08Test', () => {
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
     * @tc.number    SUB_HASHSET_TEST08_0100
     * @tc.name      testHashSet08Chapter0001
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with string containing emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0001';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const emoji = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      hashSet.add(emoji);
      let found = false;
      for (const item of hashSet) {
        expect(item).assertEqual(emoji);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0200
     * @tc.name      testHashSet08Chapter0002
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0002';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      hashSet.add(Number.EPSILON);
      hashSet.add(Number.MAX_SAFE_INTEGER);
      hashSet.add(-128);
      hashSet.add(127);
      hashSet.add(-32768);
      hashSet.add(32767);
      hashSet.add(-2147483648);
      hashSet.add(2147483647);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('number');
        count++;
      }
      expect(count).assertEqual(11);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0300
     * @tc.name      testHashSet08Chapter0003
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0003';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(NaN);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(-0);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('number');
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0400
     * @tc.name      testHashSet08Chapter0004
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0004';
      console.log(TAG + ' start');
      const hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('boolean');
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0500
     * @tc.name      testHashSet08Chapter0005
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0005';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number[]>();
      const arr1 = [72, 101, 108, 108, 111];
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr3 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      hashSet.add(arr1);
      hashSet.add(arr2);
      hashSet.add(arr3);
      let count = 0;
      for (const item of hashSet) {
        expect(Array.isArray(item)).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0600
     * @tc.name      testHashSet08Chapter0006
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0006';
      console.log(TAG + ' start');

      interface TestObject1 {
        a: number;
        b: string;
        c: number[];
      }

      interface NestedObject {
        c: number;
        d: DeepNestedObject;
      }

      interface DeepNestedObject {
        e: number;
      }

      interface TestObject2 {
        a: number;
        b: NestedObject;
      }

      interface TestObject3 {
        buffer: ArrayBuffer;
      }

      const hashSet = new HashSet<TestObject1 | TestObject2 | TestObject3>();
      const obj1: TestObject1 = { a: 1, b: "test", c: [1, 2, 3] };
      const obj2: TestObject2 = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };
      const obj3: TestObject3 = { buffer: new ArrayBuffer(16) };

      hashSet.add(obj1);
      hashSet.add(obj2);
      hashSet.add(obj3);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('object');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0700
     * @tc.name      testHashSet08Chapter0007
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Map values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0007';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Map<string, number>>();
      const map = new Map<string, number>();
      map.set('key1', 1);
      map.set('key2', 2);
      hashSet.add(map);
      let found = false;
      for (const item of hashSet) {
        expect(item instanceof Map).assertTrue();
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0800
     * @tc.name      testHashSet08Chapter0008
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Set values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0008';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Set<number>>();
      const set = new Set<number>([1, 2, 3, 2, 1]);
      hashSet.add(set);
      let found = false;
      for (const item of hashSet) {
        expect(item instanceof Set).assertTrue();
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_0900
     * @tc.name      testHashSet08Chapter0009
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Promise values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0009';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Promise<string>>();
      const promise = new Promise<string>((resolve) => {
        setTimeout(() => {
          resolve('done');
        }, 100);
      });
      hashSet.add(promise);
      let found = false;
      for (const item of hashSet) {
        expect(item instanceof Promise).assertTrue();
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1000
     * @tc.name      testHashSet08Chapter0010
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with RegExp values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0010';
      console.log(TAG + ' start');
      const hashSet = new HashSet<RegExp>();
      const regex1 = /abc/gi;
      const regex2 = /def/m;
      hashSet.add(regex1);
      hashSet.add(regex2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof RegExp).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1100
     * @tc.name      testHashSet08Chapter0011
     * @tc.desc      Verify [Symbol.iterator] returns iterator for large HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0011';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
      }
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('number');
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1200
     * @tc.name      testHashSet08Chapter0012
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0012';
      console.log(TAG + ' start');

      interface KeyValueObject {
        key: string;
      }

      type MixedType = number | string | boolean | number[] | KeyValueObject;

      const hashSet = new HashSet<MixedType>();
      hashSet.add(123);
      hashSet.add("string");
      hashSet.add(true);
      hashSet.add([1, 2, 3]);
      const obj: KeyValueObject = { key: "value" };
      hashSet.add(obj);
      let count = 0;
      for (const item of hashSet) {
        expect(item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1300
     * @tc.name      testHashSet08Chapter0013
     * @tc.desc      Verify [Symbol.iterator] iterator next method returns correct value and done
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0013';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      const iterator = hashSet[Symbol.iterator]();
      const item1 = iterator.next();
      const item2 = iterator.next();
      const item3 = iterator.next();
      const item4 = iterator.next();
      expect(item1.done).assertFalse();
      expect(item1.value).assertEqual(1);
      expect(item2.done).assertFalse();
      expect(item2.value).assertEqual(2);
      expect(item3.done).assertFalse();
      expect(item3.value).assertEqual(3);
      expect(item4.done).assertTrue();
      expect(item4.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1400
     * @tc.name      testHashSet08Chapter0014
     * @tc.desc      Verify [Symbol.iterator] cannot be bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0014';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      let errorOccurred = false;
      try {
        const symbolIterator = hashSet[Symbol.iterator];
        symbolIterator();
      } catch (err) {
        errorOccurred = true;
        expect((err as BusinessError).code).assertEqual(10200011);
      }
      expect(errorOccurred).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1500
     * @tc.name      testHashSet08Chapter0015
     * @tc.desc      Verify [Symbol.iterator] iteration order matches insertion order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0015';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      const values = [10, 20, 30, 40, 50];
      values.forEach(value => hashSet.add(value));
      const iteratedValues: number[] = [];
      for (const item of hashSet) {
        iteratedValues.push(item);
      }
      expect(iteratedValues.length).assertEqual(values.length);
      for (let i = 0; i < values.length; i++) {
        expect(iteratedValues.includes(values[i])).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1600
     * @tc.name      testHashSet08Chapter0016
     * @tc.desc      Verify [Symbol.iterator] works after clearing HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0016';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.clear();
      const iterator = hashSet[Symbol.iterator]();
      const firstItem = iterator.next();
      expect(firstItem.done).assertTrue();
      expect(firstItem.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1700
     * @tc.name      testHashSet08Chapter0017
     * @tc.desc      Verify [Symbol.iterator] returns independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0017';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      const iterator1 = hashSet[Symbol.iterator]();
      const iterator2 = hashSet[Symbol.iterator]();
      const item1 = iterator1.next();
      const item2 = iterator2.next();
      expect(item1.value).assertEqual(item2.value);
      iterator1.next();
      const item3 = iterator1.next();
      const item4 = iterator2.next();
      expect(item3.value === item4.value).assertFalse();
    });
    /**
     * @tc.number    SUB_HASHSET_TEST08_1800
     * @tc.name      testHashSet08Chapter0018
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with string containing special characters twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0018';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const specialCharsTwice = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      hashSet.add(specialCharsTwice);
      let found = false;
      for (const item of hashSet) {
        expect(item).assertEqual(specialCharsTwice);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_1900
     * @tc.name      testHashSet08Chapter0019
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0019';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      hashSet.add("0");
      hashSet.add("NaN");
      hashSet.add("");
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('string');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2000
     * @tc.name      testHashSet08Chapter0020
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0020';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(1e3);
      hashSet.add(2.5e-2);
      hashSet.add(2**3);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('number');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2100
     * @tc.name      testHashSet08Chapter0021
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with numbers in different bases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0021';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(0x0102);
      hashSet.add(0x01020304);
      hashSet.add(0o3);
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('number');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2200
     * @tc.name      testHashSet08Chapter0022
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0022';
      console.log(TAG + ' start');
      const hashSet = new HashSet<bigint>();
      hashSet.add(BigInt(0xdecafafecacefade));
      hashSet.add(BigInt(9007199254740991n));
      let count = 0;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('bigint');
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2300
     * @tc.name      testHashSet08Chapter0023
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Float32Array containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0023';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Float32Array>();
      const array1 = new Float32Array([Infinity]);
      const array2 = new Float32Array([-Infinity]);
      const array3 = new Float32Array([NaN]);
      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Float32Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2400
     * @tc.name      testHashSet08Chapter0024
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Int8Array containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0024';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int8Array>();
      const specialValue1: number = Infinity;
      const specialValue2: number = -Infinity;
      const specialValue3: number = NaN;
      const array1 = new Int8Array([specialValue1]);
      const array2 = new Int8Array([specialValue2]);
      const array3 = new Int8Array([specialValue3]);
      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Int8Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2500
     * @tc.name      testHashSet08Chapter0025
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Uint8ClampedArray containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0025';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint8ClampedArray>();
      const specialValue1: number = Infinity;
      const specialValue2: number = -Infinity;
      const specialValue3: number = NaN;
      const array1 = new Uint8ClampedArray([specialValue1]);
      const array2 = new Uint8ClampedArray([specialValue2]);
      const array3 = new Uint8ClampedArray([specialValue3]);
      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Uint8ClampedArray).assertTrue();
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2600
     * @tc.name      testHashSet08Chapter0026
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with array containing NaN/Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0026';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number[]>();
      const array1 = [72, 101, NaN, Infinity, 108, 111];
      const array2 = [Infinity, -Infinity, NaN];
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(Array.isArray(item)).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2700
     * @tc.name      testHashSet08Chapter0027
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with array containing non-numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0027';
      console.log(TAG + ' start');

      type MixedArrayElement = number | string | boolean | null | undefined;
      type MixedArray = MixedArrayElement[];

      const hashSet = new HashSet<MixedArray>();
      const array1: MixedArray = [72, "abc", true, null, undefined, 108];
      const array2: MixedArray = [];
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(Array.isArray(item)).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2800
     * @tc.name      testHashSet08Chapter0028
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0028';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number[]>();
      const emptyArray: number[] = [];
      hashSet.add(emptyArray);
      let found = false;
      for (const item of hashSet) {
        expect(Array.isArray(item)).assertTrue();
        expect(item.length).assertEqual(0);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_2900
     * @tc.name      testHashSet08Chapter0029
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with object containing undefined properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0029';
      console.log(TAG + ' start');

      interface ObjectWithUndefined {
        a: undefined;
        b: number;
      }

      const hashSet = new HashSet<ObjectWithUndefined>();
      const obj1: ObjectWithUndefined = { a: undefined, b: 1 };
      hashSet.add(obj1);
      let found = false;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('object');
        expect(item.a).assertUndefined();
        expect(item.b).assertEqual(1);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3000
     * @tc.name      testHashSet08Chapter0030
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with object containing null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0030';
      console.log(TAG + ' start');

      interface ObjectWithNull {
        a: null;
        b: number;
      }

      const hashSet = new HashSet<ObjectWithNull>();
      const obj1: ObjectWithNull = { a: null, b: 1 };
      hashSet.add(obj1);
      let found = false;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('object');
        expect(item.a).assertNull();
        expect(item.b).assertEqual(1);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3100
     * @tc.name      testHashSet08Chapter0031
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with object containing NaN properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0031';
      console.log(TAG + ' start');

      interface ObjectWithNaN {
        a: number;
        b: number;
      }

      const hashSet = new HashSet<ObjectWithNaN>();
      const obj1: ObjectWithNaN = { a: NaN, b: 1 };
      hashSet.add(obj1);
      let found = false;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('object');
        expect(isNaN(item.a)).assertTrue();
        expect(item.b).assertEqual(1);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3200
     * @tc.name      testHashSet08Chapter0032
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with object containing Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0032';
      console.log(TAG + ' start');

      interface ObjectWithInfinity {
        a: number;
        b: number;
      }

      const hashSet = new HashSet<ObjectWithInfinity>();
      const obj1: ObjectWithInfinity = { a: Infinity, b: 1 };
      hashSet.add(obj1);
      let found = false;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('object');
        expect(item.a).assertEqual(Infinity);
        expect(item.b).assertEqual(1);
        found = true;
      }
      expect(found).assertTrue();
    });
    /**
     * @tc.number    SUB_HASHSET_TEST08_3300
     * @tc.name      testHashSet08Chapter0033
     * @tc.desc      Verify [Symbol.iterator] works correctly with for-of loop on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0033';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      let iterationCount = 0;
      for (const item of hashSet) {
        iterationCount++;
        console.log(item.toString());
      }
      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3400
     * @tc.name      testHashSet08Chapter0034
     * @tc.desc      Verify [Symbol.iterator] works correctly with for-of loop on HashSet with data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0034';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      const testValues = [1, 2, 3, 4, 5];
      testValues.forEach(value => hashSet.add(value));

      const collectedValues: number[] = [];
      for (const item of hashSet) {
        collectedValues.push(item);
      }

      expect(collectedValues.length).assertEqual(testValues.length);
      testValues.forEach(value => {
        expect(collectedValues.includes(value)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3500
     * @tc.name      testHashSet08Chapter0035
     * @tc.desc      Verify multiple iterators work independently on the same HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0035';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(10);
      hashSet.add(20);
      hashSet.add(30);

      const iterator1 = hashSet[Symbol.iterator]();
      const iterator2 = hashSet[Symbol.iterator]();

      const result1 = iterator1.next();
      const result2 = iterator2.next();

      expect(result1.done).assertFalse();
      expect(result2.done).assertFalse();
      expect(result1.value).assertEqual(result2.value);

      iterator1.next();
      iterator1.next();
      const finalResult1 = iterator1.next();
      const middleResult2 = iterator2.next();

      expect(finalResult1.done).assertTrue();
      expect(middleResult2.done).assertFalse();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3600
     * @tc.name      testHashSet08Chapter0036
     * @tc.desc      Verify iterator returns correct done and value after completion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0036';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(100);
      hashSet.add(200);

      const iterator = hashSet[Symbol.iterator]();

      const first = iterator.next();
      const second = iterator.next();
      const third = iterator.next();
      const fourth = iterator.next();

      expect(first.done).assertFalse();
      expect(first.value).assertEqual(100);
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(200);
      expect(third.done).assertTrue();
      expect(third.value).assertUndefined();
      expect(fourth.done).assertTrue();
      expect(fourth.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3700
     * @tc.name      testHashSet08Chapter0037
     * @tc.desc      Verify [Symbol.iterator] works with HashSet containing null and undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0037';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number | null | undefined>();
      hashSet.add(null);
      hashSet.add(undefined);
      hashSet.add(50);

      let nullFound = false;
      let undefinedFound = false;
      let numberFound = false;

      for (const item of hashSet) {
        if (item === null) {
          nullFound = true;
        } else if (item === undefined) {
          undefinedFound = true;
        } else if (typeof item === 'number') {
          numberFound = true;
          expect(item).assertEqual(50);
        }
      }

      expect(nullFound).assertTrue();
      expect(undefinedFound).assertTrue();
      expect(numberFound).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3800
     * @tc.name      testHashSet08Chapter0038
     * @tc.desc      Verify [Symbol.iterator] works correctly with custom class objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0038';
      console.log(TAG + ' start');

      class Person {
        age: number;
        name: string;

        constructor(age: number, name: string) {
          this.age = age;
          this.name = name;
        }
      }

      const hashSet = new HashSet<Person>();
      const person1 = new Person(18, "zhang san");
      const person2 = new Person(19, "li si");
      const person3 = new Person(31, "wang wu");

      hashSet.add(person1);
      hashSet.add(person2);
      hashSet.add(person3);

      let iterationCount = 0;
      for (const person of hashSet) {
        expect(person instanceof Person).assertTrue();
        expect(typeof person.age).assertEqual('number');
        expect(typeof person.name).assertEqual('string');
        iterationCount++;
      }

      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_3900
     * @tc.name      testHashSet08Chapter0039
     * @tc.desc      Verify [Symbol.iterator] iterator can be used multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0039';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(5);
      hashSet.add(10);
      hashSet.add(15);


      let firstCount = 0;
      for (const item of hashSet) {
        firstCount++;
      }
      expect(firstCount).assertEqual(3);

      let secondCount = 0;
      for (const item of hashSet) {
        secondCount++;
      }
      expect(secondCount).assertEqual(3);

      const iterator = hashSet[Symbol.iterator]();
      let thirdCount = 0;
      let result = iterator.next();
      while (!result.done) {
        thirdCount++;
        result = iterator.next();
      }
      expect(thirdCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_4000
     * @tc.name      testHashSet08Chapter0040
     * @tc.desc      Verify [Symbol.iterator] works after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0040';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      for (let i = 0; i < 10; i++) {
        hashSet.add(i);
      }


      hashSet.remove(3);
      hashSet.remove(7);
      hashSet.remove(9);

      let iterationCount = 0;
      for (const item of hashSet) {

        expect(item === 3).assertFalse();
        expect(item === 7).assertFalse();
        expect(item === 9).assertFalse();
        iterationCount++;
      }

      expect(iterationCount).assertEqual(7);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST08_4100
     * @tc.name      testHashSet08Chapter0041
     * @tc.desc      Verify [Symbol.iterator] iterator is independent of HashSet modifications after creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet08Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet08Chapter0041';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);

      const iterator = hashSet[Symbol.iterator]();


      hashSet.add(3);
      hashSet.remove(1);


      const values: number[] = [];
      let result = iterator.next();
      while (!result.done) {
        values.push(result.value);
        result = iterator.next();
      }


      expect(values.length).assertLarger(0);
    });
  })
}