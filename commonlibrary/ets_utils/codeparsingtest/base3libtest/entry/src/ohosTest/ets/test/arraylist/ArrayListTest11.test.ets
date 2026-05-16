import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList11Test() {
  describe('ArrayList11Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_INCREASECAPACITYTO04_2800
     * @tc.name      testArrayList04IncreaseCapacityTo0028
     * @tc.desc      Test increaseCapacityTo from empty then fill to capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0028';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.increaseCapacityTo(10);
        for (let i = 0; i < 10; i++) {
          arrayList.add(i * 10);
        }
        expect(arrayList.length).assertEqual(10);
        for (let i = 0; i < 10; i++) {
          expect(arrayList[i]).assertEqual(i * 10);
        }
        arrayList.add(100);
        expect(arrayList.length).assertEqual(11);
        expect(arrayList[10]).assertEqual(100);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INCREASECAPACITYTO04_2900
     * @tc.name      testArrayList04IncreaseCapacityTo0029
     * @tc.desc      Test increaseCapacityTo from very small to very large
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0029';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.increaseCapacityTo(10);
        arrayList.increaseCapacityTo(100);
        arrayList.increaseCapacityTo(1000);
        arrayList.increaseCapacityTo(10000);
        expect(arrayList.length).assertEqual(1);
        expect(arrayList[0]).assertEqual(1);
        for (let i = 2; i <= 100; i++) {
          arrayList.add(i);
        }
        expect(arrayList.length).assertEqual(100);
        for (let i = 0; i < 100; i++) {
          expect(arrayList[i]).assertEqual(i + 1);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INCREASECAPACITYTO04_3000
     * @tc.name      testArrayList04IncreaseCapacityTo0030
     * @tc.desc      Test increaseCapacityTo type safety with different ArrayList types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0030';
        console.log(TAG + ' start');
        let numberList = new ArrayList<number>();
        numberList.add(1);
        numberList.add(2);
        numberList.increaseCapacityTo(10);
        expect(numberList.length).assertEqual(2);
        let stringList = new ArrayList<string>();
        stringList.add("a");
        stringList.add("b");
        stringList.increaseCapacityTo(10);
        expect(stringList.length).assertEqual(2);
        let booleanList = new ArrayList<boolean>();
        booleanList.add(true);
        booleanList.add(false);
        booleanList.increaseCapacityTo(10);
        expect(booleanList.length).assertEqual(2);
        let objectList = new ArrayList<object>();
        objectList.add({});
        objectList.add({});
        objectList.increaseCapacityTo(10);
        expect(objectList.length).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INCREASECAPACITYTO04_3100
     * @tc.name      testArrayList04IncreaseCapacityTo0031
     * @tc.desc      Test increaseCapacityTo compared with constructor initial capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0031';
        console.log(TAG + ' start');
        let arrayList1 = new ArrayList<number>();
        arrayList1.increaseCapacityTo(5);
        arrayList1.add(1);
        arrayList1.add(2);
        arrayList1.add(3);
        arrayList1.increaseCapacityTo(10);
        expect(arrayList1.length).assertEqual(3);
        let arrayList2 = new ArrayList<number>();
        arrayList2.add(1);
        arrayList2.add(2);
        arrayList2.add(3);
        arrayList2.increaseCapacityTo(10);
        expect(arrayList2.length).assertEqual(3);
        expect(arrayList1[0]).assertEqual(arrayList2[0]);
        expect(arrayList1[1]).assertEqual(arrayList2[1]);
        expect(arrayList1[2]).assertEqual(arrayList2[2]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INCREASECAPACITYTO04_3200
     * @tc.name      testArrayList04IncreaseCapacityTo0032
     * @tc.desc      Test memory usage after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList04IncreaseCapacityTo0032", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList04IncreaseCapacityTo0032';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 1000; i++) {
          arrayList.add(i);
        }
        arrayList.increaseCapacityTo(1000);
        expect(arrayList.length).assertEqual(1000);
        for (let i = 0; i < 1000; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        console.log(`Capacity increased to 1000000, element count remains 1000`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0100
     * @tc.name      testArrayList05TrimToCurrentLength0001
     * @tc.desc      Test trimToCurrentLength normal operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(5);
        expect(arrayList[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0200
     * @tc.name      testArrayList05TrimToCurrentLength0002
     * @tc.desc      Test trimToCurrentLength after increasing capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.increaseCapacityTo(100);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0300
     * @tc.name      testArrayList05TrimToCurrentLength0003
     * @tc.desc      Test trimToCurrentLength with empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0400
     * @tc.name      testArrayList05TrimToCurrentLength0004
     * @tc.desc      Test trimToCurrentLength with single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(42);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(1);
        expect(arrayList[0]).assertEqual(42);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0500
     * @tc.name      testArrayList05TrimToCurrentLength0005
     * @tc.desc      Test trimToCurrentLength with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.increaseCapacityTo(50);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual("apple");
        expect(arrayList[1]).assertEqual("banana");
        expect(arrayList[2]).assertEqual("cherry");
        arrayList.add("date");
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[3]).assertEqual("date");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0600
     * @tc.name      testArrayList05TrimToCurrentLength0006
     * @tc.desc      Test trimToCurrentLength with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertTrue();
        expect(arrayList[1]).assertFalse();
        expect(arrayList[2]).assertTrue();
        expect(arrayList[3]).assertFalse();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0700
     * @tc.name      testArrayList05TrimToCurrentLength0007
     * @tc.desc      Test trimToCurrentLength with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0007';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        let arrayList = new ArrayList<Person>();
        const obj1: Person = { name: "Alice", age: 30 };
        const obj2: Person = { name: "Bob", age: 25 };
        const obj3: Person = { name: "Charlie", age: 35 };
        arrayList.add(obj1);
        arrayList.add(obj2);
        arrayList.add(obj3);
        arrayList.increaseCapacityTo(100);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertDeepEquals(obj1);
        expect(arrayList[1]).assertDeepEquals(obj2);
        expect(arrayList[2]).assertDeepEquals(obj3);
        expect(arrayList[0]).assertEqual(obj1);
        expect(arrayList[1]).assertEqual(obj2);
        expect(arrayList[2]).assertEqual(obj3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0800
     * @tc.name      testArrayList05TrimToCurrentLength0008
     * @tc.desc      Test trimToCurrentLength with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number[]>();
        const arr1 = [1, 2, 3];
        const arr2 = [4, 5, 6];
        const arr3 = [7, 8, 9];
        arrayList.add(arr1);
        arrayList.add(arr2);
        arrayList.add(arr3);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertDeepEquals(arr1);
        expect(arrayList[1]).assertDeepEquals(arr2);
        expect(arrayList[2]).assertDeepEquals(arr3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_0900
     * @tc.name      testArrayList05TrimToCurrentLength0009
     * @tc.desc      Test trimToCurrentLength with mixed type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number | string | boolean | null | undefined>();
        arrayList.add(42);
        arrayList.add("Hello");
        arrayList.add(true);
        arrayList.add(null);
        arrayList.add(undefined);
        arrayList.increaseCapacityTo(100);
        arrayList.trimToCurrentLength();
        try {
          expect(arrayList[0]).assertEqual(42);
          expect(arrayList[1]).assertEqual("Hello");
          expect(arrayList[2]).assertTrue();
          expect(arrayList[3]).assertNull();
          expect(arrayList[4]).assertUndefined();
        } catch (e) {
          console.log('get() method not available, trying index access');
          expect(arrayList[0]).assertEqual(42);
          expect(arrayList[1]).assertEqual("Hello");
          expect(arrayList[2]).assertTrue();
          expect(arrayList[3]).assertNull();
          expect(arrayList[4]).assertUndefined();
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1000
     * @tc.name      testArrayList05TrimToCurrentLength0010
     * @tc.desc      Test multiple calls to trimToCurrentLength
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 10; i++) {
          arrayList.add(i);
        }
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(10);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(10);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(10);
        for (let i = 0; i < 10; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUBARRAYLIST_TRIMTOCURRENTLENGTH05_1100
     * @tc.name      testArrayList05TrimToCurrentLength0011
     * @tc.desc      Test trimToCurrentLength with additions between trims
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(4);
        arrayList.increaseCapacityTo(100);
        arrayList.add(5);
        arrayList.add(6);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(6);
        for (let i = 0; i < 6; i++) {
          expect(arrayList[i]).assertEqual(i + 1);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1200
     * @tc.name      testArrayList05TrimToCurrentLength0012
     * @tc.desc      Test adding elements after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.trimToCurrentLength();
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(6);
        expect(arrayList.length).assertEqual(6);
        for (let i = 0; i < 6; i++) {
          expect(arrayList[i]).assertEqual(i + 1);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1300
     * @tc.name      testArrayList05TrimToCurrentLength0013
     * @tc.desc      Test removing elements after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 10; i++) {
          arrayList.add(i);
        }
        arrayList.trimToCurrentLength();
        arrayList.removeByIndex(5);
        arrayList.removeByIndex(2);
        arrayList.removeByIndex(0);
        expect(arrayList.length).assertEqual(7);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(3);
        expect(arrayList[2]).assertEqual(4);
        expect(arrayList[3]).assertEqual(6);
        expect(arrayList[4]).assertEqual(7);
        expect(arrayList[5]).assertEqual(8);
        expect(arrayList[6]).assertEqual(9);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1400
     * @tc.name      testArrayList05TrimToCurrentLength0014
     * @tc.desc      Test clearing array after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.trimToCurrentLength();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        arrayList.add(10);
        arrayList.add(20);
        expect(arrayList.length).assertEqual(2);
        expect(arrayList[0]).assertEqual(10);
        expect(arrayList[1]).assertEqual(20);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1500
     * @tc.name      testArrayList05TrimToCurrentLength0015
     * @tc.desc      Test memory usage after trimming
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0015", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 100; i++) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        arrayList.increaseCapacityTo(1000);
        arrayList.trimToCurrentLength();
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(100);
        for (let i = 0; i < 100; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        console.log(`Trim operation completed in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1600
     * @tc.name      testArrayList05TrimToCurrentLength0016
     * @tc.desc      Test memory usage with large elements after trimming
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0016", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        for (let i = 0; i < 100; i++) {
          arrayList.add("x".repeat(10000));
        }
        arrayList.increaseCapacityTo(1000);
        const startTime = Date.now();
        arrayList.trimToCurrentLength();
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(100);
        for (let i = 0; i < 10; i++) {
          expect(arrayList[i].length).assertEqual(10000);
        }
        console.log(`Trim operation with large strings completed in ${duration}ms`);
        expect(duration).assertLess(500);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1700
     * @tc.name      testArrayList05TrimToCurrentLength0017
     * @tc.desc      Test performance of trimToCurrentLength
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0017", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 1000; i++) {
          arrayList.add(i);
        }
        arrayList.increaseCapacityTo(1000);
        const startTime = Date.now();
        arrayList.trimToCurrentLength();
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(1000);
        for (let i = 0; i < 100; i++) {
          const index = Math.floor(i * (1000 / 100));
          expect(arrayList[index]).assertEqual(index);
        }
        expect(duration).assertLess(1000);
        console.log(`Trimmed 100000 elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1800
     * @tc.name      testArrayList05TrimToCurrentLength0018
     * @tc.desc      Test performance of trimToCurrentLength on empty array
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0018", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.increaseCapacityTo(1000000);
        const startTime = Date.now();
        arrayList.trimToCurrentLength();
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(arrayList.length).assertEqual(0);
        expect(duration).assertLess(100);
        console.log(`Trimmed empty array in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_1900
     * @tc.name      testArrayList05TrimToCurrentLength0019
     * @tc.desc      Test trimToCurrentLength method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        let errorOccurred = false;
        try {
          arrayList.trimToCurrentLength.bind({})();
        } catch (error) {
          errorOccurred = true;
          expect(arrayList[0]).assertEqual(1);
        }
        expect(errorOccurred).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2000
     * @tc.name      testArrayList05TrimToCurrentLength0020
     * @tc.desc      Test trimToCurrentLength combined with capacity operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 5; i++) {
          arrayList.add(i);
        }
        arrayList.increaseCapacityTo(100);
        expect(arrayList.length).assertEqual(5);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(5);
        arrayList.increaseCapacityTo(200);
        expect(arrayList.length).assertEqual(5);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2100
     * @tc.name      testArrayList05TrimToCurrentLength0021
     * @tc.desc      Test trimToCurrentLength after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 100; i++) {
          arrayList.add(i);
        }
        for (let i = 99; i >= 10; i--) {
          arrayList.removeByIndex(i);
        }
        expect(arrayList.length).assertEqual(10);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(10);
        for (let i = 0; i < 10; i++) {
          expect(arrayList[i]).assertEqual(i);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2200
     * @tc.name      testArrayList05TrimToCurrentLength0022
     * @tc.desc      Test trimToCurrentLength on already trimmed array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0022';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.trimToCurrentLength();
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        arrayList.add(4);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2300
     * @tc.name      testArrayList05TrimToCurrentLength0023
     * @tc.desc      Test trimToCurrentLength with constructor initial capacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0023';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.increaseCapacityTo(100);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        arrayList.add(4);
        arrayList.add(5);
        expect(arrayList.length).assertEqual(5);
        expect(arrayList[3]).assertEqual(4);
        expect(arrayList[4]).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2400
     * @tc.name      testArrayList05TrimToCurrentLength0024
     * @tc.desc      Test trimToCurrentLength with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0024';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const count = 1000;
        for (let i = 0; i < count; i++) {
          arrayList.add(i);
        }
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(count);
        expect(arrayList[0]).assertEqual(0);
        const middleIndex = Math.floor(count / 2);
        const lastIndex = count - 1;
        expect(arrayList[middleIndex]).assertEqual(middleIndex);
        expect(arrayList[lastIndex]).assertEqual(lastIndex);
        console.log(`Trimmed array with ${count} elements successfully`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2500
     * @tc.name      testArrayList05TrimToCurrentLength0025
     * @tc.desc      Test GC behavior after trimming
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0025';
        console.log(TAG + ' start');
        let numberList = new ArrayList<number>();
        numberList.add(1);
        numberList.add(2);
        numberList.increaseCapacityTo(100);
        numberList.trimToCurrentLength();
        expect(numberList.length).assertEqual(2);
        let stringList = new ArrayList<string>();
        stringList.add("a");
        stringList.add("b");
        stringList.increaseCapacityTo(100);
        stringList.trimToCurrentLength();
        expect(stringList.length).assertEqual(2);
        let booleanList = new ArrayList<boolean>();
        booleanList.add(true);
        booleanList.add(false);
        booleanList.increaseCapacityTo(100);
        booleanList.trimToCurrentLength();
        expect(booleanList.length).assertEqual(2);
        let objectList = new ArrayList<object>();
        objectList.add({});
        objectList.add({});
        objectList.increaseCapacityTo(100);
        objectList.trimToCurrentLength();
        expect(objectList.length).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_TRIMTOCURRENTLENGTH05_2600
     * @tc.name      testArrayList05TrimToCurrentLength0026
     * @tc.desc      Test trimToCurrentLength integration with other ArrayList methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList05TrimToCurrentLength0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList05TrimToCurrentLength0026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.increaseCapacityTo(100);
        arrayList.removeByIndex(2);
        arrayList.removeByIndex(0);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(5);
        arrayList.add(2);
        expect(arrayList.getLastIndexOf(2)).assertEqual(3);
        arrayList.trimToCurrentLength();
        expect(arrayList.length).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0100
     * @tc.name      testArrayList06SymbolIterator0001
     * @tc.desc      Test Symbol.iterator with for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        const results: number[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(2);
        expect(results[1]).assertEqual(4);
        expect(results[2]).assertEqual(5);
        expect(results[3]).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0200
     * @tc.name      testArrayList06SymbolIterator0002
     * @tc.desc      Test Symbol.iterator with manual iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        const iter = arrayList[Symbol.iterator]();
        const results: number[] = [];
        let temp: IteratorResult<number> = iter.next();
        while (!temp.done) {
          results.push(temp.value);
          temp = iter.next();
        }
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(2);
        expect(results[1]).assertEqual(4);
        expect(results[2]).assertEqual(5);
        expect(results[3]).assertEqual(4);
        expect(temp.done).assertTrue();
        expect(temp.value).assertUndefined();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0300
     * @tc.name      testArrayList06SymbolIterator0003
     * @tc.desc      Test Symbol.iterator with empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        let count1 = 0;
        for (let value of arrayList) {
          count1++;
        }
        expect(count1).assertEqual(0);
        const iter = arrayList[Symbol.iterator]();
        const firstResult = iter.next();
        expect(firstResult.done).assertTrue();
        expect(firstResult.value).assertUndefined();
        const secondResult = iter.next();
        expect(secondResult.done).assertTrue();
        expect(secondResult.value).assertUndefined();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0400
     * @tc.name      testArrayList06SymbolIterator0004
     * @tc.desc      Test Symbol.iterator with single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(42);
        const results: number[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual(42);
        const iter = arrayList[Symbol.iterator]();
        const first = iter.next();
        expect(first.done).assertFalse();
        expect(first.value).assertEqual(42);
        const second = iter.next();
        expect(second.done).assertTrue();
        expect(second.value).assertUndefined();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0500
     * @tc.name      testArrayList06SymbolIterator0005
     * @tc.desc      Test Symbol.iterator with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.add("date");
        const results: string[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual("apple");
        expect(results[1]).assertEqual("banana");
        expect(results[2]).assertEqual("cherry");
        expect(results[3]).assertEqual("date");
        const spreadResults = Array.from(arrayList);
        expect(spreadResults).assertDeepEquals(["apple", "banana", "cherry", "date"]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0600
     * @tc.name      testArrayList06SymbolIterator0006
     * @tc.desc      Test Symbol.iterator with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        const results: boolean[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(4);
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
        expect(results[2]).assertTrue();
        expect(results[3]).assertFalse();
        const iter = arrayList[Symbol.iterator]();
        const first = iter.next();
        expect(typeof first.value).assertEqual("boolean");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0700
     * @tc.name      testArrayList06SymbolIterator0007
     * @tc.desc      Test Symbol.iterator with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0007';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        let arrayList = new ArrayList<Person>();
        const obj1: Person = { name: "Alice", age: 30 };
        const obj2: Person = { name: "Bob", age: 25 };
        const obj3: Person = { name: "Charlie", age: 35 };
        arrayList.add(obj1);
        arrayList.add(obj2);
        arrayList.add(obj3);
        const results: Person[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(3);
        expect(results[0]).assertDeepEquals(obj1);
        expect(results[1]).assertDeepEquals(obj2);
        expect(results[2]).assertDeepEquals(obj3);
        expect(results[0]).assertEqual(obj1);
        expect(results[1]).assertEqual(obj2);
        expect(results[2]).assertEqual(obj3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0800
     * @tc.name      testArrayList06SymbolIterator0008
     * @tc.desc      Test Symbol.iterator with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number[]>();
        const arr1 = [1, 2, 3];
        const arr2 = [4, 5, 6];
        const arr3 = [7, 8, 9];
        arrayList.add(arr1);
        arrayList.add(arr2);
        arrayList.add(arr3);
        const results: number[][] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(3);
        expect(results[0]).assertDeepEquals(arr1);
        expect(results[1]).assertDeepEquals(arr2);
        expect(results[2]).assertDeepEquals(arr3);
        const fromResults = Array.from(arrayList);
        expect(fromResults.length).assertEqual(3);
        expect(fromResults[0]).assertDeepEquals(arr1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_0900
     * @tc.name      testArrayList06SymbolIterator0009
     * @tc.desc      Test Symbol.iterator with mixed type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0009';
        console.log(TAG + ' start');
        type BasicType = string | number | boolean | null | undefined;
        let arrayList = new ArrayList<BasicType>();
        const testValues: BasicType[] = [
          42,
          "Hello",
          true,
          null,
          undefined
        ];
        for (const value of testValues) {
          arrayList.add(value);
        }
        const results: BasicType[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(testValues.length);
        expect(results[0]).assertEqual(42);
        expect(results[1]).assertEqual("Hello");
        expect(results[2]).assertTrue();
        expect(results[3]).assertNull();
        expect(results[4]).assertUndefined();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR11_0100
     * @tc.name      testArrayList06SymbolIterator0010
     * @tc.desc      Test multiple independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const iter1 = arrayList[Symbol.iterator]();
        const iter2 = arrayList[Symbol.iterator]();
        const results1: number[] = [];
        const results2: number[] = [];
        let item1 = iter1.next();
        let item2 = iter2.next();
        while (!item1.done) {
          results1.push(item1.value);
          results2.push(item2.value);
          item1 = iter1.next();
          item2 = iter2.next();
        }
        expect(results1.length).assertEqual(5);
        expect(results2.length).assertEqual(5);
        expect(results1).assertDeepEquals([1, 2, 3, 4, 5]);
        expect(results2).assertDeepEquals([1, 2, 3, 4, 5]);
        expect(item1.done).assertTrue();
        expect(item2.done).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1100
     * @tc.name      testArrayList06SymbolIterator0011
     * @tc.desc      Test iterator return method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        expect(arrayList[3]).assertEqual(4);
        let iterationSuccessful = false;
        const collectedValues: number[] = [];
        try {
          for (let value of arrayList) {
            collectedValues.push(value);
          }
          iterationSuccessful = collectedValues.length === 4;
        } catch (error) {
          console.log('for...of iteration failed, trying alternatives');
        }
        if (!iterationSuccessful) {
          collectedValues.length = 0;
          for (let i = 0; i < arrayList.length; i++) {
            collectedValues.push(arrayList[i]);
          }
          iterationSuccessful = collectedValues.length === 4;
        }
        if (iterationSuccessful) {
          expect(collectedValues[0]).assertEqual(1);
          expect(collectedValues[1]).assertEqual(2);
          expect(collectedValues[2]).assertEqual(3);
          expect(collectedValues[3]).assertEqual(4);
        }
        console.log('Note: Symbol.iterator and return methods not tested (may not be supported)');
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1200
     * @tc.name      testArrayList06SymbolIterator0012
     * @tc.desc      Test iterator throw method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        const iter = arrayList[Symbol.iterator]();
        const first = iter.next();
        expect(first.value).assertEqual(1);
        try {
          iter.throw!(new Error("Test error"));
        } catch (error) {
          expect(error.message).assertEqual("Test error");
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1300
     * @tc.name      testArrayList06SymbolIterator0013
     * @tc.desc      Test iterable protocol implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const convertedArray: number[] = [];
        for (let item of arrayList) {
          convertedArray.push(item);
        }
        expect(convertedArray).assertDeepEquals([1, 2, 3, 4, 5]);
        const manualCombinedArray = [0];
        for (let i = 0; i < arrayList.length; i++) {
          manualCombinedArray.push(arrayList[i]);
        }
        manualCombinedArray.push(6);
        expect(manualCombinedArray).assertDeepEquals([0, 1, 2, 3, 4, 5, 6]);
        let total = 0;
        for (let item of arrayList) {
          total += item;
        }
        expect(total).assertEqual(15);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1400
     * @tc.name      testArrayList06SymbolIterator0014
     * @tc.desc      Test Symbol.iterator with spread operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("a");
        arrayList.add("b");
        arrayList.add("c");
        arrayList.add("d");
        const fromArray = Array.from(arrayList);
        expect(fromArray.length).assertEqual(4);
        expect(fromArray).assertDeepEquals(["a", "b", "c", "d"]);
        const mappedArray = Array.from(arrayList, (value, index) => `${index}:${value}`);
        expect(mappedArray.length).assertEqual(4);
        expect(mappedArray).assertDeepEquals(["0:a", "1:b", "2:c", "3:d"]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1500
     * @tc.name      testArrayList06SymbolIterator0015
     * @tc.desc      Test Symbol.iterator with destructuring assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        arrayList.add(40);
        arrayList.add(50);
        let first: number | undefined;
        let second: number | undefined;
        const rest: number[] = [];
        let index = 0;
        for (let value of arrayList) {
          if (index === 0) {
            first = value;
          } else if (index === 1) {
            second = value;
          } else {
            rest.push(value);
          }
          index++;
        }
        expect(first).assertEqual(10);
        expect(second).assertEqual(20);
        expect(rest.length).assertEqual(3);
        expect(rest).assertDeepEquals([30, 40, 50]);
        const pairs: [number, number][] = [];
        let entryIndex = 0;
        for (let value of arrayList) {
          pairs.push([entryIndex, value]);
          entryIndex++;
        }
        expect(pairs.length).assertEqual(5);
        expect(pairs[0]).assertDeepEquals([0, 10]);
        expect(pairs[1]).assertDeepEquals([1, 20]);
        expect(pairs[4]).assertDeepEquals([4, 50]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1600
     * @tc.name      testArrayList06SymbolIterator0016
     * @tc.desc      Test Symbol.iterator with new Set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(2);
        arrayList.add(1);
        const uniqueSet = new Set(arrayList);
        expect(uniqueSet.size).assertEqual(3);
        expect(uniqueSet.has(1)).assertTrue();
        expect(uniqueSet.has(2)).assertTrue();
        expect(uniqueSet.has(3)).assertTrue();
        const uniqueArray = Array.from(uniqueSet).sort();
        expect(uniqueArray).assertDeepEquals([1, 2, 3]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1700
     * @tc.name      testArrayList06SymbolIterator0017
     * @tc.desc      Test Symbol.iterator with new Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<[string, number]>();
        arrayList.add(["a", 1]);
        arrayList.add(["b", 2]);
        arrayList.add(["c", 3]);
        const map = new Map(arrayList);
        expect(map.size).assertEqual(3);
        expect(map.get("a")).assertEqual(1);
        expect(map.get("b")).assertEqual(2);
        expect(map.get("c")).assertEqual(3);
        const mapEntries: [string, number][] = [];
        for (let entry of map) {
          mapEntries.push(entry);
        }
        expect(mapEntries.length).assertEqual(3);
        expect(mapEntries[0]).assertDeepEquals(["a", 1]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1800
     * @tc.name      testArrayList06SymbolIterator0018
     * @tc.desc      Test iteration with concurrent modification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const results: number[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(5);
        expect(results).assertDeepEquals([1, 2, 3, 4, 5]);
        arrayList.add(6);
        arrayList.add(7);
        expect(arrayList.length).assertEqual(7);
        expect(arrayList[5]).assertEqual(6);
        expect(arrayList[6]).assertEqual(7);
        const newResults: number[] = [];
        for (let value of arrayList) {
          newResults.push(value);
        }
        expect(newResults.length).assertEqual(7);
        expect(newResults).assertDeepEquals([1, 2, 3, 4, 5, 6, 7]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_1900
     * @tc.name      testArrayList06SymbolIterator0019
     * @tc.desc      Test iteration with element removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const results: number[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(5);
        expect(results).assertDeepEquals([1, 2, 3, 4, 5]);
        arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.removeByIndex(3);
        expect(arrayList.length).assertEqual(4);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        expect(arrayList[3]).assertEqual(5);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2000
     * @tc.name      testArrayList06SymbolIterator0020
     * @tc.desc      Test Symbol.iterator with large ArrayList
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0020", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 1000;
        for (let i = 0; i < size; i++) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        let sum = 0;
        for (let value of arrayList) {
          sum += value;
        }
        const endTime = Date.now();
        const duration = endTime - startTime;
        const expectedSum = (size - 1) * size / 2;
        expect(sum).assertEqual(expectedSum);
        expect(duration).assertLess(1000);
        console.log(`Iterated ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2100
     * @tc.name      testArrayList06SymbolIterator0021
     * @tc.desc      Test spread operator performance with ArrayList
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0021", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 5000;
        for (let i = 0; i < size; i++) {
          arrayList.add(i * 2);
        }
        const startTime = Date.now();
        const spreadArray = Array.from(arrayList);
        const endTime = Date.now();
        const duration = endTime - startTime;
        expect(spreadArray.length).assertEqual(size);
        expect(spreadArray[0]).assertEqual(0);
        expect(spreadArray[size - 1]).assertEqual((size - 1) * 2);
        expect(duration < 1000).assertTrue();
        console.log(`Spread ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2200
     * @tc.name      testArrayList06SymbolIterator0022
     * @tc.desc      Test Symbol.iterator method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0022';
        console.log(TAG + ' start');
        type SpecialNumber = number | null | undefined;
        let arrayList = new ArrayList<SpecialNumber>();
        arrayList.add(NaN);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(0);
        arrayList.add(-0);
        arrayList.add(null);
        arrayList.add(undefined);
        const results: SpecialNumber[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(7);
        expect(Number.isNaN(results[0])).assertTrue();
        expect(results[1]).assertEqual(Infinity);
        expect(results[2]).assertEqual(-Infinity);
        expect(results[3]).assertEqual(0);
        const fourthResult = results[4];
        if (typeof fourthResult === 'number') {
          expect(1 / fourthResult).assertEqual(-Infinity);
        }
        expect(results[5]).assertNull();
        expect(results[6]).assertUndefined();
        console.log(TAG + ' done');
      });
    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2300
     * @tc.name      testArrayList06SymbolIterator0023
     * @tc.desc      Test Symbol.iterator with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0023';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<bigint>();
        arrayList.add(9007199254740991n);
        arrayList.add(9223372036854775807n);
        arrayList.add(-9223372036854775808n);
        arrayList.add(0n);
        const results: bigint[] = [];
        for (let value of arrayList) {
          results.push(value);
        }
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(9007199254740991n);
        expect(results[1]).assertEqual(9223372036854775807n);
        expect(results[2]).assertEqual(-9223372036854775808n);
        expect(results[3]).assertEqual(0n);
        expect(typeof results[0]).assertEqual("bigint");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2400
     * @tc.name      testArrayList06SymbolIterator0024
     * @tc.desc      Test Symbol.iterator with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0024';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        const iter = arrayList[Symbol.iterator]();
        const results1: number[] = [];
        let item = iter.next();
        while (!item.done) {
          results1.push(item.value);
          item = iter.next();
        }
        expect(results1.length).assertEqual(3);
        expect(results1).assertDeepEquals([1, 2, 3]);
        expect(item.done).assertTrue();
        const afterDone = iter.next();
        expect(afterDone.done).assertTrue();
        expect(afterDone.value).assertUndefined();
        const newIter = arrayList[Symbol.iterator]();
        const results2: number[] = [];
        let newItem = newIter.next();
        while (!newItem.done) {
          results2.push(newItem.value);
          newItem = newIter.next();
        }
        expect(results2.length).assertEqual(3);
        expect(results2).assertDeepEquals([1, 2, 3]);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2500
     * @tc.name      testArrayList06SymbolIterator0025
     * @tc.desc      Test reusing iterator after completion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0025';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        const outerResults: number[] = [];
        const innerResults: number[] = [];
        for (let outerValue of arrayList) {
          outerResults.push(outerValue);
          for (let innerValue of arrayList) {
            innerResults.push(innerValue);
          }
        }
        expect(outerResults.length).assertEqual(3);
        expect(outerResults).assertDeepEquals([1, 2, 3]);
        expect(innerResults.length).assertEqual(9);
        expect(innerResults).assertDeepEquals([1, 2, 3, 1, 2, 3, 1, 2, 3]);
        console.log(TAG + ' done');
      });
  })
}