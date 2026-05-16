import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList05Test() {
  describe('ArrayList05Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0100
     * @tc.name      testArrayList01GetIndexOf0001
     * @tc.desc      Get index of existing number element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(2);
        list.add(4);
        list.add(5);
        list.add(2);
        list.add(1);
        const result = list.getIndexOf(2);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0200
     * @tc.name      testArrayList01GetIndexOf0002
     * @tc.desc      Get index of non-existent number element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0002';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        const result = list.getIndexOf(99);
        expect(result).assertEqual(-1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0300
     * @tc.name      testArrayList01GetIndexOf0003
     * @tc.desc      Get index of string element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0003';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add("apple");
        list.add("banana");
        list.add("apple");
        list.add("cherry");
        const result = list.getIndexOf("apple");
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0400
     * @tc.name      testArrayList01GetIndexOf0004
     * @tc.desc      Get index of boolean element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0004';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.add(true);
        list.add(false);
        list.add(true);
        const result = list.getIndexOf(false);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0500
     * @tc.name      testArrayList01GetIndexOf0005
     * @tc.desc      Get index of empty string in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0005';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add("");
        list.add("text");
        list.add("");
        const result = list.getIndexOf("");
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0600
     * @tc.name      testArrayList01GetIndexOf0006
     * @tc.desc      Get index of number special values in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0006';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(Infinity);
        list.add(-Infinity);
        list.add(Number.MAX_VALUE);
        list.add(Infinity);
        const result1 = list.getIndexOf(Infinity);
        const result2 = list.getIndexOf(-Infinity);
        const result3 = list.getIndexOf(Number.MAX_VALUE);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0700
     * @tc.name      testArrayList01GetIndexOf0007
     * @tc.desc      Get index of NaN in ArrayList (special case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0007';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(NaN);
        list.add(1);
        list.add(NaN);
        const result = list.getIndexOf(NaN);
        expect(result).assertEqual(-1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0800
     * @tc.name      testArrayList01GetIndexOf0008
     * @tc.desc      Get index of number boundary values in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0008';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(0);
        list.add(-0);
        list.add(Number.MIN_VALUE);
        list.add(Number.MAX_SAFE_INTEGER);
        list.add(Number.MIN_SAFE_INTEGER);
        const result1 = list.getIndexOf(0);
        const result2 = list.getIndexOf(-0);
        const result3 = list.getIndexOf(Number.MIN_VALUE);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        expect(result3).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_0900
     * @tc.name      testArrayList01GetIndexOf0009
     * @tc.desc      Get index of numbers in various formats in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0009';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(123.456);
        list.add(0xcafebabe);
        list.add(0o777);
        list.add(1e6);
        const result1 = list.getIndexOf(123.456);
        const result2 = list.getIndexOf(0xcafebabe);
        const result3 = list.getIndexOf(0o777);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1000
     * @tc.name      testArrayList01GetIndexOf0010
     * @tc.desc      Get index of BigInt element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0010';
        console.log(TAG + ' start');
        const list = new ArrayList<bigint>();
        list.add(BigInt(9007199254740991));
        list.add(BigInt(0xdecafafecacefade));
        list.add(BigInt(9007199254740991));
        const result = list.getIndexOf(BigInt(9007199254740991));
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1100
     * @tc.name      testArrayList01GetIndexOf0011
     * @tc.desc      Get index of string with special characters in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0011';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        list.add("normal");
        list.add(specialChars);
        list.add("text");
        const result = list.getIndexOf(specialChars);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1200
     * @tc.name      testArrayList01GetIndexOf0012
     * @tc.desc      Get index of string with emoji characters in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0012';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const emojis = "👆👿👀💯🎅";
        list.add("text");
        list.add(emojis);
        list.add("more");
        const result = list.getIndexOf(emojis);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1300
     * @tc.name      testArrayList01GetIndexOf0013
     * @tc.desc      Get index of array element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0013';
        console.log(TAG + ' start');
        const list = new ArrayList<number[]>();
        const array1 = [1, 2, 3];
        const array2 = [4, 5, 6];
        list.add(array1);
        list.add(array2);
        list.add(array1);
        const result = list.getIndexOf(array1);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1400
     * @tc.name      testArrayList01GetIndexOf0014
     * @tc.desc      Get index of TypedArray element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0014';
        console.log(TAG + ' start');
        const list = new ArrayList<Int8Array>();
        const typedArray1 = new Int8Array([-128, 0, 127]);
        const typedArray2 = new Int8Array([1, 2, 3]);
        list.add(typedArray1);
        list.add(typedArray2);
        const result = list.getIndexOf(typedArray1);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1500
     * @tc.name      testArrayList01GetIndexOf0015
     * @tc.desc      Get index of null element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0015';
        console.log(TAG + ' start');
        const list = new ArrayList<number | null>();
        list.add(1);
        list.add(null);
        list.add(2);
        list.add(null);
        const result = list.getIndexOf(null);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1600
     * @tc.name      testArrayList01GetIndexOf0016
     * @tc.desc      Get index of undefined element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0016';
        console.log(TAG + ' start');
        const list = new ArrayList<number | undefined>();
        list.add(undefined);
        list.add(1);
        list.add(2);
        list.add(undefined);
        const result = list.getIndexOf(undefined);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1700
     * @tc.name      testArrayList01GetIndexOf0017
     * @tc.desc      Get index of custom object element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0017';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        const list = new ArrayList<Person>();
        const person1: Person = { name: "Alice", age: 25 };
        const person2: Person = { name: "Bob", age: 30 };
        list.add(person1);
        list.add(person2);
        list.add(person1);
        const result = list.getIndexOf(person1);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1800
     * @tc.name      testArrayList01GetIndexOf0018
     * @tc.desc      Get index of elements of multiple types in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0018';
        console.log(TAG + ' start');
        const list = new ArrayList<number | string | boolean>();
        list.add(1);
        list.add("text");
        list.add(true);
        list.add(1);
        list.add("text");
        const result1 = list.getIndexOf(1);
        const result2 = list.getIndexOf("text");
        const result3 = list.getIndexOf(true);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_1900
     * @tc.name      testArrayList01GetIndexOf0019
     * @tc.desc      Get index when element appears only once in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0019';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        const result = list.getIndexOf(3);
        expect(result).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_2000
     * @tc.name      testArrayList01GetIndexOf0020
     * @tc.desc      Get index of first occurrence in ArrayList with duplicates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0020';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(2);
        list.add(4);
        list.add(5);
        list.add(2);
        list.add(1);
        list.add(2);
        list.add(4);
        const result = list.getIndexOf(2);
        expect(result).assertEqual(0);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_2100
     * @tc.name      testArrayList01GetIndexOf0021
     * @tc.desc      Get index of last element in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0021';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        const result = list.getIndexOf(5);
        expect(result).assertEqual(4);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_2200
     * @tc.name      testArrayList01GetIndexOf0022
     * @tc.desc      Get index in empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0022';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        const result = list.getIndexOf(1);
        expect(result).assertEqual(-1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_2300
     * @tc.name      testArrayList01GetIndexOf0023
     * @tc.desc      Verify getIndexOf uses reference equality for objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0023';
        console.log(TAG + ' start');
        interface Data {
          value: number;
        }
        const list = new ArrayList<Data>();
        const obj1: Data = { value: 1 };
        const obj2: Data = { value: 1 };
        list.add(obj1);
        list.add(obj2);
        const result1 = list.getIndexOf(obj1);
        const result2 = list.getIndexOf(obj2);
        const result3 = list.getIndexOf({ value: 1 } as Data);
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(1);
        expect(result3).assertEqual(-1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_GETINDEXOF01_2400
     * @tc.name      testArrayList01GetIndexOf0024
     * @tc.desc      Get index after list modification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01GetIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01GetIndexOf0024';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(2);
        list.add(4);
        list.remove(2);
        const result = list.getIndexOf(2);
        expect(result).assertEqual(2);
        console.log(TAG + ' done');

      });
  })
}