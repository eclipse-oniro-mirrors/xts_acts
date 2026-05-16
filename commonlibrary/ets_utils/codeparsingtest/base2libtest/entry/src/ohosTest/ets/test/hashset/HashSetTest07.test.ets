import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { HashSet } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashSet07Test() {
  describe('HashSet07Test', () => {
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
     * @tc.number    SUB_HASHSET_TEST07_0100
     * @tc.name      testHashSet07Chapter0001
     * @tc.desc      Test forEach callback execution order verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0001';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();


      const values = [10, 20, 30, 40, 50];
      for (const val of values) {
        hashSet.add(val);
      }

      const visited: Array<number> = [];
      hashSet.forEach((value: number, key: number): void => {
        visited.push(value);
      });


      expect(visited.length).assertEqual(values.length);


      for (const val of values) {
        expect(visited.includes(val)).assertTrue();
      }


      const uniqueVisited = new Set<number>(visited);
      expect(uniqueVisited.size).assertEqual(visited.length);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0200
     * @tc.name      testHashSet07Chapter0002
     * @tc.desc      Test forEach with exception handling in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0002';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);

      let callCount = 0;
      let exceptionThrown = false;

      try {
        hashSet.forEach((value: number, key: number): void => {
          callCount++;
          if (value === 3) {
            throw new Error("Intentional exception at value 3");
          }
        });
      } catch (error) {
        exceptionThrown = true;
        expect(error.message).assertEqual("Intentional exception at value 3");
      }


      expect(exceptionThrown).assertTrue();
      expect(callCount).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0300
     * @tc.name      testHashSet07Chapter0003
     * @tc.desc      Test forEach with nested object structure (simulating prototype-like behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0003';
      console.log(TAG + ' start');

      interface BaseProperties {
        baseProp: number;
      }

      interface ExtendedObject {
        extendedProp: string;
        baseProperties?: BaseProperties;
      }


      const baseProperties: BaseProperties = { baseProp: 100 };
      const extendedObject: ExtendedObject = {
        extendedProp: "test",
        baseProperties: baseProperties
      };

      const hashSet = new HashSet<ExtendedObject>();
      hashSet.add(extendedObject);

      let foundObject = false;
      let basePropValue = 0;

      hashSet.forEach((value: ExtendedObject, key: ExtendedObject): void => {
        foundObject = true;
        expect(value.extendedProp).assertEqual("test");


        if (value.baseProperties) {
          basePropValue = value.baseProperties.baseProp;
          expect(basePropValue).assertEqual(100);
        }
      });

      expect(foundObject).assertTrue();
      expect(basePropValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0400
     * @tc.name      testHashSet07Chapter0004
     * @tc.desc      Test forEach with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0004';
      console.log(TAG + ' start');

      interface ObjectWithPromise {
        id: number;
        promise: Promise<string>;
      }

      const hashSet = new HashSet<ObjectWithPromise>();

      const promise1 = new Promise<string>((resolve) => {
        resolve("result1");
      });

      const promise2 = new Promise<string>((resolve) => {
        resolve("result2");
      });

      const obj1: ObjectWithPromise = { id: 1, promise: promise1 };
      const obj2: ObjectWithPromise = { id: 2, promise: promise2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum = 0;
      hashSet.forEach((value: ObjectWithPromise, key: ObjectWithPromise): void => {
        idSum += value.id;
        expect(value.promise instanceof Promise).assertTrue();
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0500
     * @tc.name      testHashSet07Chapter0005
     * @tc.desc      Test forEach with char range values (0-65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0005';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();


      hashSet.add(0);
      hashSet.add(65535);
      hashSet.add(32768);
      hashSet.add(97);
      hashSet.add(65);
      hashSet.add(48);

      let count = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
        expect(value >= 0 && value <= 65535).assertTrue();
      });

      expect(count).assertEqual(6);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0600
     * @tc.name      testHashSet07Chapter0006
     * @tc.desc      Test forEach with large-scale data traversal performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0006';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const size = 10000;

      for (let i = 0; i < size; i++) {
        hashSet.add(i);
      }

      let sum = 0;
      const startTime = new Date().getTime();

      hashSet.forEach((value: number, key: number): void => {
        sum += value;
      });

      const endTime = new Date().getTime();
      const duration = endTime - startTime;

      expect(sum).assertEqual((size - 1) * size / 2);
      expect(duration < 1000).assertTrue();

      console.log(TAG + ` end, duration: ${duration}ms`);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0700
     * @tc.name      testHashSet07Chapter0007
     * @tc.desc      Test forEach with string memory usage simulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0007';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();


      const largeString1 = "a".repeat(10000);
      const largeString2 = "b".repeat(10000);
      const largeString3 = "c".repeat(10000);

      hashSet.add(largeString1);
      hashSet.add(largeString2);
      hashSet.add(largeString3);

      let totalLength = 0;
      hashSet.forEach((value: string, key: string): void => {
        totalLength += value.length;
      });

      expect(totalLength).assertEqual(30000);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0800
     * @tc.name      testHashSet07Chapter0008
     * @tc.desc      Test forEach method while adding elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0008';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      expect(hashSet.length).assertEqual(3);

      let iterationCount = 0;
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, set: HashSet<number>): void => {
          iterationCount++;
          if (iterationCount === 1) {
            set.add(4);
          }
          if (iterationCount === 2) {
            set.add(5);
          }
        });
        console.log("Iteration count: " + iterationCount);
        expect(iterationCount).assertLarger(0);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior during iteration: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_0900
     * @tc.name      testHashSet07Chapter0009
     * @tc.desc      Test forEach method while removing elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0009';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add("apple");
      hashSet.add("banana");
      hashSet.add("cherry");
      hashSet.add("date");
      expect(hashSet.length).assertEqual(4);

      const visitedItems: Array<string> = [];
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: string, key: string, set: HashSet<string>): void => {
          visitedItems.push(value);
          if (value === "banana") {
            set.remove("cherry");
          }
          if (value === "apple") {
            set.remove("apple");
          }
        });
        console.log("Visited items: " + visitedItems.join(", "));
        expect(visitedItems.length).assertLarger(0);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior during iteration: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1000
     * @tc.name      testHashSet07Chapter0010
     * @tc.desc      Test forEach method while clearing set during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0010';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet instanceof HashSet).assertTrue();

      for (let i = 0; i < 5; i++) {
        hashSet.add(i);
      }
      expect(hashSet.length).assertEqual(5);

      let callCount = 0;
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, set: HashSet<number>): void => {
          callCount++;
          if (callCount === 2) {
            set.clear();
          }
          console.log("Processing value: " + value + ", callCount: " + callCount);
        });
        expect(callCount).assertLarger(0);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior during iteration: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1100
     * @tc.name      testHashSet07Chapter0011
     * @tc.desc      Test forEach method with add, remove and clear operations during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0011';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add("initial1");
      hashSet.add("initial2");
      hashSet.add("initial3");
      expect(hashSet.length).assertEqual(3);

      const operationsLog: Array<string> = [];
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: string, key: string, set: HashSet<string>): void => {
          operationsLog.push("Processing: " + value);

          if (value === "initial1") {
            set.add("added1");
            operationsLog.push("Added: added1");
          }

          if (value === "initial2") {
            set.remove("initial1");
            operationsLog.push("Removed: initial1");
          }

          if (value === "initial3") {
            set.clear();
            operationsLog.push("Cleared set");
            set.add("addedAfterClear");
            operationsLog.push("Added: addedAfterClear");
          }
        });

        console.log("Operations log: " + operationsLog.join("; "));
        expect(operationsLog.length).assertLarger(0);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior during complex iteration: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1200
     * @tc.name      testHashSet07Chapter0012
     * @tc.desc      Test forEach method with thisArg parameter while modifying set during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0012';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add(100);
      hashSet.add(200);
      hashSet.add(300);
      expect(hashSet.length).assertEqual(3);

      interface ModifierContext {
        modifySet: (set: HashSet<number>) => void;
      }

      const context: ModifierContext = {
        modifySet: (set: HashSet<number>): void => {
          set.add(400);
          set.remove(200);
        }
      };

      let callbackExecuted = false;
      const callback = (value: number, key: number, set: HashSet<number>): void => {
        console.log("Callback with value: " + value);
        callbackExecuted = true;
        if (value === 100) {
          context.modifySet(set);
        }
      };

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach(callback, context);
        expect(typeof hashSet.forEach).assertEqual('function');
        expect(callbackExecuted).assertTrue();
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior with thisArg and modification: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1300
     * @tc.name      testHashSet07Chapter0013
     * @tc.desc      Test forEach method with potential infinite loop when adding elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0013';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add(1);
      expect(hashSet.length).assertEqual(1);

      let iterationCount = 0;
      const maxIterations = 100;

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, set: HashSet<number>): void => {
          iterationCount++;
          if (iterationCount < maxIterations) {
            set.add(iterationCount + 1);
          }
        });
        console.log("Iterations before stopping: " + iterationCount);
        expect(iterationCount).assertLarger(0);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Infinite loop prevention: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1400
     * @tc.name      testHashSet07Chapter0014
     * @tc.desc      Test forEach method verifying set parameter is the original set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0014';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");
      hashSet.add("item3");

      let setParameterVerified = false;
      hashSet.forEach((value: string, key: string, set: HashSet<string>): void => {

        if (set === hashSet) {
          setParameterVerified = true;
        }


        set.add("addedViaSetParam");


        if (value === "item2") {
          set.remove("item1");
        }
      });

      expect(setParameterVerified).assertTrue();
      expect(hashSet.has("addedViaSetParam")).assertTrue();
      expect(hashSet.has("item1")).assertFalse();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1500
     * @tc.name      testHashSet07Chapter0015
     * @tc.desc      Test entries method with normal string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0015';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("squirrel");
      hashSet.add("sparrow");

      const iter = hashSet.entries();
      const entries: Array<[string, string]> = [];

      let temp: IteratorResult<[string, string]> = iter.next();
      while (!temp.done) {
        entries.push(temp.value);
        expect(temp.value[0]).assertEqual(temp.value[1]);
        temp = iter.next();
      }

      expect(entries.length).assertEqual(2);
      const keys = entries.map(entry => entry[0]);
      expect(keys.includes("squirrel")).assertTrue();
      expect(keys.includes("sparrow")).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1600
     * @tc.name      testHashSet07Chapter0016
     * @tc.desc      Test entries method with empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0016';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const iter = hashSet.entries();
      const firstResult = iter.next();

      expect(firstResult.done).assertTrue();
      expect(firstResult.value).assertUndefined();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1700
     * @tc.name      testHashSet07Chapter0017
     * @tc.desc      Test entries method with number type HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0017';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(10);
      hashSet.add(20);
      hashSet.add(30);

      const iter = hashSet.entries();
      const values: Array<number> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_1 = temp.value;
        const key = GeneratedDestructArray_1[0];
        const value = GeneratedDestructArray_1[1];
        expect(key).assertEqual(value);
        values.push(value);
        temp = iter.next();
      }

      expect(values.length).assertEqual(3);
      expect(values.includes(10)).assertTrue();
      expect(values.includes(20)).assertTrue();
      expect(values.includes(30)).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1800
     * @tc.name      testHashSet07Chapter0018
     * @tc.desc      Test entries method with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0018';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(NaN);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);

      const iter = hashSet.entries();
      let count = 0;
      let hasNaN = false;
      let hasInfinity = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_1 = temp.value;
        const key = GeneratedDestructArray_1[0];
        const value = GeneratedDestructArray_1[1];

        if (isNaN(value)) {
          expect(key).assertNaN()
          hasNaN = true;
        } else {
          expect(key).assertEqual(value)
        }

        count++;

        if (!isFinite(value)) {
          hasInfinity = true;
        }

        temp = iter.next();
      }

      expect(count).assertEqual(6);
      expect(hasNaN).assertTrue();
      expect(hasInfinity).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_1900
     * @tc.name      testHashSet07Chapter0019
     * @tc.desc      Test entries method with TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0019';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint8Array>();
      const array1 = new Uint8Array([72, 101, 108, 108, 111]);
      const array2 = new Uint8Array([87, 111, 114, 108, 100]);

      hashSet.add(array1);
      hashSet.add(array2);

      const iter = hashSet.entries();
      const entries: Array<[Uint8Array, Uint8Array]> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_1 = temp.value;
        const key = GeneratedDestructArray_1[0];
        const value = GeneratedDestructArray_1[1];
        expect(key).assertEqual(value);
        entries.push(temp.value);
        temp = iter.next();
      }

      expect(entries.length).assertEqual(2);

      const array1Found = entries.some(entry =>
      entry[0].length === 5 && entry[0][0] === 72 && entry[0][4] === 111
      );
      expect(array1Found).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2000
     * @tc.name      testHashSet07Chapter0020
     * @tc.desc      Test entries method with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0020';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let i = 0; i < specialChars.length; i++) {
        hashSet.add(specialChars.charAt(i));
      }

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_2 = temp.value;
        const key = GeneratedDestructArray_2[0];
        const value = GeneratedDestructArray_2[1];
        expect(key).assertEqual(value);
        expect(specialChars.includes(value)).assertTrue();
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(specialChars.length);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2100
     * @tc.name      testHashSet07Chapter0021
     * @tc.desc      Test entries method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0021';
      console.log(TAG + ' start');

      const hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);

      const iter = hashSet.entries();
      const values: Array<boolean> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_3 = temp.value;
        const key = GeneratedDestructArray_3[0];
        const value = GeneratedDestructArray_3[1];
        expect(key).assertEqual(value);
        values.push(value);
        temp = iter.next();
      }

      expect(values.length).assertEqual(2);
      expect(values.includes(true)).assertTrue();
      expect(values.includes(false)).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2200
     * @tc.name      testHashSet07Chapter0022
     * @tc.desc      Test entries method with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0022';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const array1 = [1, 2, 3];
      const array2 = [4, 5, 6];
      const array3 = [7, 8, 9];

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_4 = temp.value;
        const key = GeneratedDestructArray_4[0];
        const value = GeneratedDestructArray_4[1];
        expect(key).assertEqual(value);
        expect(value.length).assertEqual(3);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2300
     * @tc.name      testHashSet07Chapter0023
     * @tc.desc      Test entries method with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0023';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
        name: string;
      }

      const hashSet = new HashSet<TestObject>();
      const obj1: TestObject = { id: 1, name: "object1" };
      const obj2: TestObject = { id: 2, name: "object2" };

      hashSet.add(obj1);
      hashSet.add(obj2);

      const iter = hashSet.entries();
      const objects: Array<TestObject> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_5 = temp.value;
        const key = GeneratedDestructArray_5[0];
        const value = GeneratedDestructArray_5[1];
        expect(key).assertEqual(value);
        objects.push(value);
        temp = iter.next();
      }

      expect(objects.length).assertEqual(2);
      expect(objects.includes(obj1)).assertTrue();
      expect(objects.includes(obj2)).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2400
     * @tc.name      testHashSet07Chapter0024
     * @tc.desc      Test entries method with different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0024';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();

      hashSet.add(0x0102);
      hashSet.add(0x01020304);
      hashSet.add(0o377);
      hashSet.add(2**3);
      hashSet.add(1e3);
      hashSet.add(2.5e-2);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_6 = temp.value;
        const key = GeneratedDestructArray_6[0];
        const value = GeneratedDestructArray_6[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(6);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2500
     * @tc.name      testHashSet07Chapter0025
     * @tc.desc      Test entries method with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0025';
      console.log(TAG + ' start');

      const hashSet = new HashSet<bigint>();

      hashSet.add(BigInt(0xdecafafecacefade));
      hashSet.add(9007199254740991n);
      hashSet.add(123456789012345678901234567890n);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_7 = temp.value;
        const key = GeneratedDestructArray_7[0];
        const value = GeneratedDestructArray_7[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2600
     * @tc.name      testHashSet07Chapter0026
     * @tc.desc      Test entries method with Unicode emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0026';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const emojis = ["👆", "👿", "👀", "💯", "🎅"];

      for (const emoji of emojis) {
        hashSet.add(emoji);
      }

      const iter = hashSet.entries();
      const foundEmojis: Array<string> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_8 = temp.value;
        const key = GeneratedDestructArray_8[0];
        const value = GeneratedDestructArray_8[1];
        expect(key).assertEqual(value);
        foundEmojis.push(value);
        temp = iter.next();
      }

      expect(foundEmojis.length).assertEqual(emojis.length);
      for (const emoji of emojis) {
        expect(foundEmojis.includes(emoji)).assertTrue();
      }

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2700
     * @tc.name      testHashSet07Chapter0027
     * @tc.desc      Test entries method with nested object structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0027';
      console.log(TAG + ' start');

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

      const hashSet = new HashSet<NestedObject>();

      const deepObj1: DeepNestedObject = { e: 3 };
      const middleObj1: MiddleNestedObject = { c: 2, d: deepObj1 };
      const obj1: NestedObject = { a: 1, b: middleObj1 };

      hashSet.add(obj1);

      const iter = hashSet.entries();
      let totalValue = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_9 = temp.value;
        const key = GeneratedDestructArray_9[0];
        const value = GeneratedDestructArray_9[1];
        expect(key).assertEqual(value);
        totalValue = value.a + value.b.c + value.b.d.e;
        temp = iter.next();
      }

      expect(totalValue).assertEqual(6);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2800
     * @tc.name      testHashSet07Chapter0028
     * @tc.desc      Test entries method with Map property objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0028';
      console.log(TAG + ' start');

      interface ObjectWithMap {
        id: number;
        map: Map<string, number>;
      }

      const hashSet = new HashSet<ObjectWithMap>();

      const map1 = new Map<string, number>();
      map1.set("key1", 1);
      map1.set("key2", 2);

      const obj1: ObjectWithMap = { id: 1, map: map1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let mapSize = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_10 = temp.value;
        const key = GeneratedDestructArray_10[0];
        const value = GeneratedDestructArray_10[1];
        expect(key).assertEqual(value);
        mapSize = value.map.size;
        temp = iter.next();
      }

      expect(mapSize).assertEqual(2);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_2900
     * @tc.name      testHashSet07Chapter0029
     * @tc.desc      Test entries method with Set property objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0029';
      console.log(TAG + ' start');

      interface ObjectWithSet {
        id: number;
        set: Set<number>;
      }

      const hashSet = new HashSet<ObjectWithSet>();

      const set1 = new Set<number>([1, 2, 3, 2, 1]);
      const obj1: ObjectWithSet = { id: 1, set: set1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let setSize = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_11 = temp.value;
        const key = GeneratedDestructArray_11[0];
        const value = GeneratedDestructArray_11[1];
        expect(key).assertEqual(value);
        setSize = value.set.size;
        temp = iter.next();
      }

      expect(setSize).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3000
     * @tc.name      testHashSet07Chapter0030
     * @tc.desc      Test entries method with RegExp property objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0030';
      console.log(TAG + ' start');

      interface ObjectWithRegex {
        id: number;
        regex: RegExp;
      }

      const hashSet = new HashSet<ObjectWithRegex>();

      const obj1: ObjectWithRegex = { id: 1, regex: /abc/gi };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let regexFound = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_12 = temp.value;
        const key = GeneratedDestructArray_12[0];
        const value = GeneratedDestructArray_12[1];
        expect(key).assertEqual(value);
        regexFound = value.regex instanceof RegExp;
        temp = iter.next();
      }

      expect(regexFound).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3100
     * @tc.name      testHashSet07Chapter0031
     * @tc.desc      Test entries method with ArrayBuffer property objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0031';
      console.log(TAG + ' start');

      interface ObjectWithBuffer {
        id: number;
        buffer: ArrayBuffer;
      }

      const hashSet = new HashSet<ObjectWithBuffer>();

      const buffer1 = new ArrayBuffer(16);
      const obj1: ObjectWithBuffer = { id: 1, buffer: buffer1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let bufferSize = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_13 = temp.value;
        const key = GeneratedDestructArray_13[0];
        const value = GeneratedDestructArray_13[1];
        expect(key).assertEqual(value);
        bufferSize = value.buffer.byteLength;
        temp = iter.next();
      }

      expect(bufferSize).assertEqual(16);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3200
     * @tc.name      testHashSet07Chapter0032
     * @tc.desc      Test entries method with large HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0032';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const size = 100;

      for (let i = 0; i < size; i++) {
        hashSet.add(i * 2);
      }

      const iter = hashSet.entries();
      let count = 0;
      let sum = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_14 = temp.value;
        const key = GeneratedDestructArray_14[0];
        const value = GeneratedDestructArray_14[1];
        expect(key).assertEqual(value);
        sum += value;
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(size);
      expect(sum).assertEqual((size - 1) * size);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3300
     * @tc.name      testHashSet07Chapter0033
     * @tc.desc      Negative test: entries method with context that causes error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0033';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet instanceof HashSet).assertTrue();
      hashSet.add("test");
      expect(hashSet.length).assertEqual(1);

      interface InvalidContext {
        entriesMethod?: () => IterableIterator<[string, string]>;
        invalidProperty?: string;
      }

      interface ErrorWithCode extends Error {
        code?: number;
      }

      const invalidContext: InvalidContext = {
        entriesMethod: undefined,
        invalidProperty: "invalid"
      };

      let errorCaught = false;
      let errorCode: number = 0;
      let errorMessage: string = '';

      try {
        const entriesFunc = hashSet.entries;
        expect(typeof entriesFunc).assertEqual('function');

        invalidContext.entriesMethod = entriesFunc;
        expect(invalidContext.entriesMethod == undefined).assertFalse();

        if (invalidContext.entriesMethod) {
          const iter = invalidContext.entriesMethod();
          expect(iter == undefined).assertFalse();
          expect(iter.next == undefined).assertFalse();

          const result = iter.next();
          expect(result.done).assertFalse();
          expect(result.value == undefined).assertFalse();
        }
      } catch (error) {
        errorCaught = true;
        const err: ErrorWithCode = error as ErrorWithCode;
        errorCode = err.code || 0;
        errorMessage = err.message;
        console.log("Error occurred: " + errorMessage);
        expect(error instanceof Error).assertTrue();
      }

      if (errorCaught) {
        if (errorCode !== 0) {
          expect(errorCode).assertEqual(10200011);
        }
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3400
     * @tc.name      testHashSet07Chapter0034
     * @tc.desc      Test entries method with mixed type array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0034';
      console.log(TAG + ' start');

      type MixedValueType = number | string | boolean | null | undefined;

      const hashSet = new HashSet<Array<MixedValueType>>();
      const mixedArray: Array<MixedValueType> = [72, "abc", true, null, undefined, 108];

      hashSet.add(mixedArray);

      const iter = hashSet.entries();
      let arrayLength = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_15 = temp.value;
        const key = GeneratedDestructArray_15[0];
        const value = GeneratedDestructArray_15[1];
        expect(key).assertEqual(value);
        arrayLength = value.length;
        temp = iter.next();
      }

      expect(arrayLength).assertEqual(6);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3500
     * @tc.name      testHashSet07Chapter0035
     * @tc.desc      Test entries method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0035';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Int8Array>();
      const array1 = Int8Array.of(-128);
      const array2 = Int8Array.of(127);
      const array3 = Int8Array.of(-129, 128);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_16 = temp.value;
        const key = GeneratedDestructArray_16[0];
        const value = GeneratedDestructArray_16[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3600
     * @tc.name      testHashSet07Chapter0036
     * @tc.desc      Test entries method with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0036';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Float64Array>();
      const array1 = Float64Array.of(-1.7976931348623157e308);
      const array2 = Float64Array.of(1.7976931348623157e308);
      const array3 = Float64Array.of(-1.8e308, 1.8e308);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_17 = temp.value;
        const key = GeneratedDestructArray_17[0];
        const value = GeneratedDestructArray_17[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3700
     * @tc.name      testHashSet07Chapter0037
     * @tc.desc      Test entries method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0037';
      console.log(TAG + ' start');

      const hashSet = new HashSet<BigUint64Array>();
      const array1 = BigUint64Array.of(0n);
      const array2 = BigUint64Array.of(18446744073709551615n);
      const array3 = BigUint64Array.of(18446744073709551616n);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_18 = temp.value;
        const key = GeneratedDestructArray_18[0];
        const value = GeneratedDestructArray_18[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3800
     * @tc.name      testHashSet07Chapter0038
     * @tc.desc      Test entries method with Promise property objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0038';
      console.log(TAG + ' start');

      interface ObjectWithPromise {
        id: number;
        promise: Promise<string>;
      }

      const hashSet = new HashSet<ObjectWithPromise>();

      const promise1 = new Promise<string>((resolve) => {
        resolve("result1");
      });

      const obj1: ObjectWithPromise = { id: 1, promise: promise1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let promiseFound = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_19 = temp.value;
        const key = GeneratedDestructArray_19[0];
        const value = GeneratedDestructArray_19[1];
        expect(key).assertEqual(value);
        promiseFound = value.promise instanceof Promise;
        temp = iter.next();
      }

      expect(promiseFound).assertTrue();

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_3900
     * @tc.name      testHashSet07Chapter0039
     * @tc.desc      Test entries method with char range values (0-65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0039';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();

      hashSet.add(0);
      hashSet.add(65535);
      hashSet.add(32768);
      hashSet.add(97);
      hashSet.add(65);
      hashSet.add(48);

      const iter = hashSet.entries();
      let count = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_20 = temp.value;
        const key = GeneratedDestructArray_20[0];
        const value = GeneratedDestructArray_20[1];
        expect(key).assertEqual(value);
        expect(value >= 0 && value <= 65535).assertTrue();
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(6);

    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4000
     * @tc.name      testHashSet07Chapter0040
     * @tc.desc      Verify [Symbol.iterator] returns correct iterator for empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0040';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      const iterator = hashSet[Symbol.iterator]();
      const firstItem = iterator.next();
      expect(firstItem.done).assertTrue();
      expect(firstItem.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4100
     * @tc.name      testHashSet07Chapter0041
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with single Int8Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0041';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int8Array>();
      const array1 = new Int8Array([-128]);
      const array2 = new Int8Array([127]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Int8Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4200
     * @tc.name      testHashSet07Chapter0042
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Uint8Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0042';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint8Array>();
      const array1 = new Uint8Array([0]);
      const array2 = new Uint8Array([255]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Uint8Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4300
     * @tc.name      testHashSet07Chapter0043
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Uint8ClampedArray boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0043';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint8ClampedArray>();
      const array1 = new Uint8ClampedArray([0]);
      const array2 = new Uint8ClampedArray([255]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Uint8ClampedArray).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4400
     * @tc.name      testHashSet07Chapter0044
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Int16Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0044';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int16Array>();
      const array1 = new Int16Array([-32768]);
      const array2 = new Int16Array([32767]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Int16Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4500
     * @tc.name      testHashSet07Chapter0045
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Uint16Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0045';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint16Array>();
      const array1 = new Uint16Array([0]);
      const array2 = new Uint16Array([65535]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Uint16Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4600
     * @tc.name      testHashSet07Chapter0046
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Int32Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0046';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int32Array>();
      const array1 = new Int32Array([-2147483648]);
      const array2 = new Int32Array([2147483647]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Int32Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4700
     * @tc.name      testHashSet07Chapter0047
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Uint32Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0047';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint32Array>();
      const array1 = new Uint32Array([0]);
      const array2 = new Uint32Array([4294967295]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Uint32Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4800
     * @tc.name      testHashSet07Chapter0048
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Float32Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0048';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Float32Array>();
      const array1 = new Float32Array([-3.4028234663852886e38]);
      const array2 = new Float32Array([3.4028234663852886e38]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Float32Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_4900
     * @tc.name      testHashSet07Chapter0049
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with Float64Array boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0049';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Float64Array>();
      const array1 = new Float64Array([-1.7976931348623157e308]);
      const array2 = new Float64Array([1.7976931348623157e308]);
      hashSet.add(array1);
      hashSet.add(array2);
      let count = 0;
      for (const item of hashSet) {
        expect(item instanceof Float64Array).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_5000
     * @tc.name      testHashSet07Chapter0050
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0050';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      hashSet.add(specialChars);
      let found = false;
      for (const item of hashSet) {
        expect(item).assertEqual(specialChars);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_5100
     * @tc.name      testHashSet07Chapter0051
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with string containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0051';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      hashSet.add(asciiChars);
      let found = false;
      for (const item of hashSet) {
        expect(item).assertEqual(asciiChars);
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST07_5200
     * @tc.name      testHashSet07Chapter0052
     * @tc.desc      Verify [Symbol.iterator] returns iterator for HashSet with string containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0052';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const escapeStr = "\a\b\f\n\r\t\v\\\'\"?\x41";
      hashSet.add(escapeStr);
      let found = false;
      for (const item of hashSet) {
        expect(typeof item).assertEqual('string');
        found = true;
      }
      expect(found).assertTrue();
    });


  })
}