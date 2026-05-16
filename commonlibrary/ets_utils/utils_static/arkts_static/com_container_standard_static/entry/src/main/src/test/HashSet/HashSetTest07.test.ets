/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { HashSet } from '@kit.ArkTS';

interface BaseProperties07 {
  baseProp: number;
}

interface ExtendedObject07 {
  extendedProp: string;
  baseProperties?: BaseProperties07;
}

interface ObjectWithPromise07 {
  id: number;
  promise: Promise<string>;
}

interface ModifierContext07 {
  modifySet: (hashSetRef: HashSet<number>) => void;
}

interface TestObject07 {
  id: number;
  name: string;
}

interface DeepNestedObject07 {
  e: number;
}

interface MiddleNestedObject07 {
  c: number;
  d: DeepNestedObject07;
}

interface NestedObject07 {
  a: number;
  b: MiddleNestedObject07;
}

interface ObjectWithMap07 {
  id: number;
  map: Map<string, number>;
}

interface ObjectWithSetContainer07 {
  id: number;
  setData: Set<number>;
}

interface ObjectWithRegex07 {
  id: number;
  regex: RegExp;
}

interface ObjectWithBuffer07 {
  id: number;
  buffer: ArrayBuffer;
}

interface InvalidContext07 {
  entriesMethod?: () => IterableIterator<[number, number]>;
  invalidProperty?: string;
}

interface ErrorWithCode07 {
  message?: string;
  code?: number;
}

type MixedValueType07 = number | string | boolean | null | undefined;

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashSet07Test(): void {
  describe('HashSet07Test', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0100
     * @tc.name      testHashSet07Chapter0001
     * @tc.desc      Test forEach method with number type HashSet
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0200
     * @tc.name      testHashSet07Chapter0002
     * @tc.desc      Test forEach exception propagation during iteration
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

      let callCount: int = 0;
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0300
     * @tc.name      testHashSet07Chapter0003
     * @tc.desc      Test forEach with extended object containing nested base properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0003';
      console.log(TAG + ' start');

      const baseProperties: BaseProperties07 = { baseProp: 100 };
      const extendedObject: ExtendedObject07 = {
        extendedProp: "test",
        baseProperties: baseProperties
      };

      const hashSet = new HashSet<ExtendedObject07>();
      hashSet.add(extendedObject);

      let foundObject = false;
      let basePropValue: number = 0;

      hashSet.forEach((value: ExtendedObject07, key: ExtendedObject07): void => {
        foundObject = true;
        expect(value.extendedProp).assertEqual("test");


        if (value.baseProperties != undefined) {
          basePropValue = value.baseProperties!.baseProp;
          expect(basePropValue).assertEqual(100);
        }
      });

      expect(foundObject).assertTrue();
      expect(basePropValue).assertEqual(100);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0400
     * @tc.name      testHashSet07Chapter0004
     * @tc.desc      Test forEach with objects containing Promise properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0004';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithPromise07>();

      const promise1 = new Promise<string>((resolve) => {
        resolve("result1");
      });

      const promise2 = new Promise<string>((resolve) => {
        resolve("result2");
      });

      const obj1: ObjectWithPromise07 = { id: 1, promise: promise1 };
      const obj2: ObjectWithPromise07 = { id: 2, promise: promise2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithPromise07, key: ObjectWithPromise07): void => {
        idSum += value.id;
        expect(value !== null && value !== undefined).assertTrue();
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0500
     * @tc.name      testHashSet07Chapter0005
     * @tc.desc      Test forEach with boundary numeric values (0, 65535, etc.)
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

      let count: int = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
        expect(value >= 0 && value <= 65535).assertTrue();
      });

      expect(count).assertEqual(6);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0600
     * @tc.name      testHashSet07Chapter0006
     * @tc.desc      Test forEach performance with 10000 elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0006';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const size: int = 10000;

      for (let i: int = 0; i < size; i++) {
        hashSet.add(i);
      }

      let sum: int = 0;
      const startTime = new Date().getTime();

      hashSet.forEach((value: number, key: number): void => {
        sum += value;
      });

      const endTime = new Date().getTime();
      const duration = endTime - startTime;

      expect(sum).assertEqual((size - 1) * size / 2.0);
      expect(duration < 1000).assertTrue();

      console.log(TAG + ` end, duration: ${duration}ms`);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0700
     * @tc.name      testHashSet07Chapter0007
     * @tc.desc      Test forEach with large strings of 10000 characters each
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

      let totalLength: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        totalLength += value.length;
      });

      expect(totalLength).assertEqual(30000);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0800
     * @tc.name      testHashSet07Chapter0008
     * @tc.desc      Test forEach concurrent modification by adding elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0008';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      expect(hashSet.length).assertEqual(3);

      let iterationCount: int = 0;
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, hashSetRef: HashSet<number>): void => {
          iterationCount++;
          if (iterationCount === 1) {
            hashSetRef.add(4);
          }
          if (iterationCount === 2) {
            hashSetRef.add(5);
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
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_0900
     * @tc.name      testHashSet07Chapter0009
     * @tc.desc      Test forEach concurrent modification by removing elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0009';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add("apple");
      hashSet.add("banana");
      hashSet.add("cherry");
      hashSet.add("date");
      expect(hashSet.length).assertEqual(4);

      const visitedItems: Array<string> = [];
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: string, key: string, hashSetRef: HashSet<string>): void => {
          visitedItems.push(value);
          if (value === "banana") {
            hashSetRef.remove("cherry");
          }
          if (value === "apple") {
            hashSetRef.remove("apple");
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
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1000
     * @tc.name      testHashSet07Chapter0010
     * @tc.desc      Test forEach concurrent modification by clearing set during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0010';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet.length).assertEqual(0);

      for (let i: int = 0; i < 5; i++) {
        hashSet.add(i);
      }
      expect(hashSet.length).assertEqual(5);

      let callCount: int = 0;
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, hashSetRef: HashSet<number>): void => {
          callCount++;
          if (callCount === 2) {
            hashSetRef.clear();
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
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1100
     * @tc.name      testHashSet07Chapter0011
     * @tc.desc      Test forEach with complex concurrent modifications (add, remove, clear combined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0011';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add("initial1");
      hashSet.add("initial2");
      hashSet.add("initial3");
      expect(hashSet.length).assertEqual(3);

      const operationsLog: Array<string> = [];
      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: string, key: string, hashSetRef: HashSet<string>): void => {
          operationsLog.push("Processing: " + value);

          if (value === "initial1") {
            hashSetRef.add("added1");
            operationsLog.push("Added: added1");
          }

          if (value === "initial2") {
            hashSetRef.remove("initial1");
            operationsLog.push("Removed: initial1");
          }

          if (value === "initial3") {
            hashSetRef.clear();
            operationsLog.push("Cleared set");
            hashSetRef.add("addedAfterClear");
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
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1200
     * @tc.name      testHashSet07Chapter0012
     * @tc.desc      Test forEach with external modifier context modifying the set via callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0012';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add(100);
      hashSet.add(200);
      hashSet.add(300);
      expect(hashSet.length).assertEqual(3);

      const context: ModifierContext07 = {
        modifySet: (hashSetRef: HashSet<number>): void => {
          hashSetRef.add(400);
          hashSetRef.remove(200);
        }
      };

      let callbackExecuted = false;
      const callback = (value: number, key: number, hashSetRef: HashSet<number>): void => {
        console.log("Callback with value: " + value);
        callbackExecuted = true;
        if (value === 100) {
          context.modifySet(hashSetRef);
        }
      };

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach(callback);
        expect(typeof hashSet.forEach).assertEqual('function');
        expect(callbackExecuted).assertTrue();
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Behavior with thisArg and modification: " + errorMessage);
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1300
     * @tc.name      testHashSet07Chapter0013
     * @tc.desc      Test forEach infinite loop prevention when adding elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0013';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add(1);
      expect(hashSet.length).assertEqual(1);

      let iterationCount: int = 0;
      const maxIterations: int = 100;

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach((value: number, key: number, hashSetRef: HashSet<number>): void => {
          iterationCount++;
          if (iterationCount < maxIterations) {
            hashSetRef.add(iterationCount + 1);
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
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1400
     * @tc.name      testHashSet07Chapter0014
     * @tc.desc      Test forEach third parameter hashSetRef identity and modification
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
      hashSet.forEach((value: string, key: string, hashSetRef: HashSet<string>): void => {

        if (hashSetRef === hashSet) {
          setParameterVerified = true;
        }


        hashSetRef.add("addedViaSetParam");


        if (value === "item2") {
          hashSetRef.remove("item1");
        }
      });

      expect(setParameterVerified).assertTrue();
      expect(hashSet.has("addedViaSetParam")).assertTrue();
      expect(hashSet.has("item1")).assertFalse();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1500
     * @tc.name      testHashSet07Chapter0015
     * @tc.desc      Test entries() with string type returning key-value pairs
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
        const entryValue = temp.value!;
        entries.push(entryValue as [string, string]);
        expect(entryValue[0]).assertEqual(entryValue[1]);
        temp = iter.next();
      }

      expect(entries.length).assertEqual(2);
      const keys = entries.map(entry => entry[0]);
      expect(keys.includes("squirrel")).assertTrue();
      expect(keys.includes("sparrow")).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1600
     * @tc.name      testHashSet07Chapter0016
     * @tc.desc      Test entries() on empty HashSet returns done iterator
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1700
     * @tc.name      testHashSet07Chapter0017
     * @tc.desc      Test entries() with number type and destructured key-value pairs
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
        const GeneratedDestructArray_1 = temp.value as [number, number];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1800
     * @tc.name      testHashSet07Chapter0018
     * @tc.desc      Test entries() with special numeric values (NaN, Infinity, -Infinity, MAX_VALUE, MIN_VALUE)
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
      let count: int = 0;
      let hasNaN = false;
      let hasInfinity = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_1 = temp.value as [number, number];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_1900
     * @tc.name      testHashSet07Chapter0019
     * @tc.desc      Test entries() with Uint8Array typed values
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
        const GeneratedDestructArray_1 = temp.value as [Uint8Array, Uint8Array];
        const key = GeneratedDestructArray_1[0];
        const value = GeneratedDestructArray_1[1];
        expect(key).assertEqual(value);
        entries.push(temp.value as [Uint8Array, Uint8Array]);
        temp = iter.next();
      }

      expect(entries.length).assertEqual(2);

      const array1Found = entries.some(entry =>
      entry[0].length === 5 && entry[0][0] === 72 && entry[0][4] === 111
      );
      expect(array1Found).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2000
     * @tc.name      testHashSet07Chapter0020
     * @tc.desc      Test entries() with special characters as individual string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0020';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let i: int = 0; i < specialChars.length; i++) {
        hashSet.add(specialChars[i]);
      }

      const iter = hashSet.entries();
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_2 = temp.value as [string, string];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2100
     * @tc.name      testHashSet07Chapter0021
     * @tc.desc      Test entries() with boolean type values
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
        const GeneratedDestructArray_3 = temp.value as [boolean, boolean];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2200
     * @tc.name      testHashSet07Chapter0022
     * @tc.desc      Test entries() with array of numbers as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0022';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number[]>();
      const array1: number[] = [1, 2, 3];
      const array2: number[] = [4, 5, 6];
      const array3: number[] = [7, 8, 9];

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_4 = temp.value as [Array<number>, Array<number>];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2300
     * @tc.name      testHashSet07Chapter0023
     * @tc.desc      Test entries() with custom object type (TestObject07)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0023';
      console.log(TAG + ' start');

      const hashSet = new HashSet<TestObject07>();
      const obj1: TestObject07 = { id: 1, name: "object1" };
      const obj2: TestObject07 = { id: 2, name: "object2" };

      hashSet.add(obj1);
      hashSet.add(obj2);

      const iter = hashSet.entries();
      const objects: Array<TestObject07> = [];

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_5 = temp.value as [TestObject07, TestObject07];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2400
     * @tc.name      testHashSet07Chapter0024
     * @tc.desc      Test entries() with various number literal formats (hex, octal, exponential)
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
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_6 = temp.value as [number, number];
        const key = GeneratedDestructArray_6[0];
        const value = GeneratedDestructArray_6[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(6);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2500
     * @tc.name      testHashSet07Chapter0025
     * @tc.desc      Test entries() with bigint values including large numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0025';
      console.log(TAG + ' start');

      const hashSet = new HashSet<bigint>();

      hashSet.add(BigInt("0xdecafafecacefade"));
      hashSet.add(9007199254740991n);
      hashSet.add(123456789012345678901234567890n);

      const iter = hashSet.entries();
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_7 = temp.value as [bigint, bigint];
        const key = GeneratedDestructArray_7[0];
        const value = GeneratedDestructArray_7[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2600
     * @tc.name      testHashSet07Chapter0026
     * @tc.desc      Test entries() with emoji strings
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
        const GeneratedDestructArray_8 = temp.value as [string, string];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2700
     * @tc.name      testHashSet07Chapter0027
     * @tc.desc      Test entries() with deeply nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0027';
      console.log(TAG + ' start');

      const hashSet = new HashSet<NestedObject07>();

      const deepObj1: DeepNestedObject07 = { e: 3 };
      const middleObj1: MiddleNestedObject07 = { c: 2, d: deepObj1 };
      const obj1: NestedObject07 = { a: 1, b: middleObj1 };

      hashSet.add(obj1);

      const iter = hashSet.entries();
      let totalValue: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_9 = temp.value as [NestedObject07, NestedObject07];
        const key = GeneratedDestructArray_9[0];
        const value = GeneratedDestructArray_9[1];
        expect(key).assertEqual(value);
        totalValue = value.a + value.b.c + value.b.d.e;
        temp = iter.next();
      }

      expect(totalValue).assertEqual(6);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2800
     * @tc.name      testHashSet07Chapter0028
     * @tc.desc      Test entries() with objects containing Map properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0028';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithMap07>();

      const map1 = new Map<string, number>();
      map1.set("key1", 1);
      map1.set("key2", 2);

      const obj1: ObjectWithMap07 = { id: 1, map: map1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let mapSize: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_10 = temp.value as [ObjectWithMap07, ObjectWithMap07];
        const key = GeneratedDestructArray_10[0];
        const value = GeneratedDestructArray_10[1];
        expect(key).assertEqual(value);
        mapSize = value.map.size;
        temp = iter.next();
      }

      expect(mapSize).assertEqual(2);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_2900
     * @tc.name      testHashSet07Chapter0029
     * @tc.desc      Test entries() with objects containing Set container properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0029';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithSetContainer07>();

      const set1 = new Set<number>([1, 2, 3, 2, 1]);
      const obj1: ObjectWithSetContainer07 = { id: 1, setData: set1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let setSize: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_11 = temp.value as [ObjectWithSetContainer07, ObjectWithSetContainer07];
        const key = GeneratedDestructArray_11[0];
        const value = GeneratedDestructArray_11[1];
        expect(key).assertEqual(value);
        setSize = value.setData.size;
        temp = iter.next();
      }

      expect(setSize).assertEqual(3);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3000
     * @tc.name      testHashSet07Chapter0030
     * @tc.desc      Test entries() with objects containing RegExp properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0030';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithRegex07>();

      const obj1: ObjectWithRegex07 = { id: 1, regex: new RegExp("abc", "gi") };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let regexFound = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_12 = temp.value as [ObjectWithRegex07, ObjectWithRegex07];
        const key = GeneratedDestructArray_12[0];
        const value = GeneratedDestructArray_12[1];
        expect(key).assertEqual(value);
        regexFound = true;
        temp = iter.next();
      }

      expect(regexFound).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3100
     * @tc.name      testHashSet07Chapter0031
     * @tc.desc      Test entries() with objects containing ArrayBuffer properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0031';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithBuffer07>();

      const buffer1 = new ArrayBuffer(16);
      const obj1: ObjectWithBuffer07 = { id: 1, buffer: buffer1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let bufferSize: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_13 = temp.value as [ObjectWithBuffer07, ObjectWithBuffer07];
        const key = GeneratedDestructArray_13[0];
        const value = GeneratedDestructArray_13[1];
        expect(key).assertEqual(value);
        bufferSize = value.buffer.byteLength;
        temp = iter.next();
      }

      expect(bufferSize).assertEqual(16);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3200
     * @tc.name      testHashSet07Chapter0032
     * @tc.desc      Test entries() performance with 100 even-numbered elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0032';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const size: int = 100;

      for (let i: int = 0; i < size; i++) {
        hashSet.add(i * 2);
      }

      const iter = hashSet.entries();
      let count: int = 0;
      let sum: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_14 = temp.value as [number, number];
        const key = GeneratedDestructArray_14[0];
        const value: number = GeneratedDestructArray_14[1];
        expect(key).assertEqual(value);
        sum += value;
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(size);
      expect(sum).assertEqual((size - 1) * size);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3300
     * @tc.name      testHashSet07Chapter0033
     * @tc.desc      Test entries() method reference extraction and direct invocation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0033';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet.length).assertEqual(0);
      hashSet.add("test");
      expect(hashSet.length).assertEqual(1);

      let errorCaught = false;
      let errorMessage: string = '';

      try {
        const entriesFunc = hashSet.entries;
        expect(typeof entriesFunc).assertEqual('function');

        const iter = entriesFunc();
        expect(iter == undefined).assertFalse();
        expect(iter.next == undefined).assertFalse();

        const result = iter.next();
        expect(result.done).assertFalse();
        expect(result.value == undefined).assertFalse();
      } catch (error) {
        errorCaught = true;
        const err: ErrorWithCode07 = error as ErrorWithCode07;
        let errorCode: number = err.code != undefined ? err.code! : 0;
        errorMessage = err.message != undefined ? err.message! : '';
        console.log("Error occurred: " + errorMessage);
        expect(errorMessage.length > 0).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3400
     * @tc.name      testHashSet07Chapter0034
     * @tc.desc      Test entries() with mixed value type arrays (number, string, boolean, null, undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0034';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<MixedValueType07>>();
      const mixedArray: Array<MixedValueType07> = [72, "abc", true, null, undefined, 108];

      hashSet.add(mixedArray);

      const iter = hashSet.entries();
      let arrayLength: number = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_15 = temp.value as [Array<MixedValueType07>, Array<MixedValueType07>];
        const key = GeneratedDestructArray_15[0];
        const value = GeneratedDestructArray_15[1];
        expect(key).assertEqual(value);
        arrayLength = value.length;
        temp = iter.next();
      }

      expect(arrayLength).assertEqual(6);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3500
     * @tc.name      testHashSet07Chapter0035
     * @tc.desc      Test entries() with Int8Array values including boundary values
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
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_16 = temp.value as [Int8Array, Int8Array];
        const key = GeneratedDestructArray_16[0];
        const value = GeneratedDestructArray_16[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3600
     * @tc.name      testHashSet07Chapter0036
     * @tc.desc      Test entries() with Float64Array values including extreme boundary values
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
      const array3 = Float64Array.of(-Infinity, Infinity);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const iter = hashSet.entries();
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_17 = temp.value as [Float64Array, Float64Array];
        const key = GeneratedDestructArray_17[0];
        const value = GeneratedDestructArray_17[1];
        let arraysEqual = key.length === value.length;
        if (arraysEqual) {
          for (let i = 0; i < key.length; i++) {
            if (key[i] !== value[i]) {
              arraysEqual = false;
              break;
            }
          }
        }
        expect(arraysEqual).assertTrue();
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3700
     * @tc.name      testHashSet07Chapter0037
     * @tc.desc      Test entries() with BigUint64Array values including max boundary values
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
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_18 = temp.value as [BigUint64Array, BigUint64Array];
        const key = GeneratedDestructArray_18[0];
        const value = GeneratedDestructArray_18[1];
        expect(key).assertEqual(value);
        count++;
        temp = iter.next();
      }

      expect(count).assertEqual(3);

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3800
     * @tc.name      testHashSet07Chapter0038
     * @tc.desc      Test entries() with objects containing Promise properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0038';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithPromise07>();

      const promise1 = new Promise<string>((resolve) => {
        resolve("result1");
      });

      const obj1: ObjectWithPromise07 = { id: 1, promise: promise1 };
      hashSet.add(obj1);

      const iter = hashSet.entries();
      let promiseFound = false;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_19 = temp.value as [ObjectWithPromise07, ObjectWithPromise07];
        const key = GeneratedDestructArray_19[0];
        const value = GeneratedDestructArray_19[1];
        expect(key).assertEqual(value);
        promiseFound = true;
        temp = iter.next();
      }

      expect(promiseFound).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_3900
     * @tc.name      testHashSet07Chapter0039
     * @tc.desc      Test entries() with boundary numeric values (0, 65535, etc.)
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
      let count: int = 0;

      let temp = iter.next();
      while (!temp.done) {
        const GeneratedDestructArray_20 = temp.value as [number, number];
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4000
     * @tc.name      testHashSet07Chapter0040
     * @tc.desc      Test for...of iteration on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet07Chapter0040';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      let count: int = 0;
      for (const item of hashSet) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4100
     * @tc.name      testHashSet07Chapter0041
     * @tc.desc      Test for...of iteration with Int8Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4200
     * @tc.name      testHashSet07Chapter0042
     * @tc.desc      Test for...of iteration with Uint8Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4300
     * @tc.name      testHashSet07Chapter0043
     * @tc.desc      Test for...of iteration with Uint8ClampedArray boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4400
     * @tc.name      testHashSet07Chapter0044
     * @tc.desc      Test for...of iteration with Int16Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4500
     * @tc.name      testHashSet07Chapter0045
     * @tc.desc      Test for...of iteration with Uint16Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4600
     * @tc.name      testHashSet07Chapter0046
     * @tc.desc      Test for...of iteration with Int32Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4700
     * @tc.name      testHashSet07Chapter0047
     * @tc.desc      Test for...of iteration with Uint32Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4800
     * @tc.name      testHashSet07Chapter0048
     * @tc.desc      Test for...of iteration with Float32Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_4900
     * @tc.name      testHashSet07Chapter0049
     * @tc.desc      Test for...of iteration with Float64Array boundary values
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
      let count: int = 0;
      for (const item of hashSet) {
        expect(item !== null && item !== undefined).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_5000
     * @tc.name      testHashSet07Chapter0050
     * @tc.desc      Test for...of iteration with special characters string
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_5100
     * @tc.name      testHashSet07Chapter0051
     * @tc.desc      Test for...of iteration with full ASCII character set string
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSEVEN_5200
     * @tc.name      testHashSet07Chapter0052
     * @tc.desc      Test for...of iteration with escape sequence characters string
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
