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
import { HashSet } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

interface TestObject06 {
  id: number;
  name: string;
}

interface ProcessingObject {
  processItem: (value: string) => void;
}

interface ContextObject {
  maxValue: number;
  processValue: (value: number) => void;
}

interface DeepNestedObject {
  e: number;
}

interface MiddleNestedObject {
  c: number;
  d: DeepNestedObject;
}

interface NestedObject06 {
  a: number;
  b: MiddleNestedObject;
}

interface ObjectWithFunction {
  id: number;
  process: () => string;
}

interface ObjectWithOptionalProps {
  a: number | undefined;
  b: number | null;
  c: number;
}

interface ObjectWithMap {
  id: number;
  map: Map<string, number>;
}

interface ObjectWithSetContainer {
  id: number;
  setData: Set<number>;
}

interface ObjectWithRegex {
  id: number;
  regex: RegExp;
}

interface LargeObject06 {
  id: number;
  data: string;
}

interface MathUtils {
  square: (x: number) => number;
  sum: number;
}

type MixedValueType06 = number | string | boolean | null | undefined;

interface InvalidContext {
  invalidProperty: undefined;
}

interface ObjectWithBuffer {
  id: number;
  buffer: ArrayBuffer;
}

interface ObjectWithDataView {
  id: number;
  view: DataView;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashSet06Test(): void {
  describe('HashSet06Test', (): void => {
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0100
     * @tc.name      testHashSet06Chapter0001
     * @tc.desc      Test forEach method with object type HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0001';
      console.log(TAG + ' start');

      const hashSet = new HashSet<TestObject06>();
      const obj1: TestObject06 = { id: 1, name: "object1" };
      const obj2: TestObject06 = { id: 2, name: "object2" };

      hashSet.add(obj1);
      hashSet.add(obj2);

      const visited: Array<TestObject06> = [];
      hashSet.forEach((value: TestObject06, key: TestObject06): void => {
        visited.push(value);
        expect(key).assertEqual(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(obj1)).assertTrue();
      expect(visited.includes(obj2)).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0200
     * @tc.name      testHashSet06Chapter0002
     * @tc.desc      Test forEach method with array type HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0002';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];

      hashSet.add(arr1);
      hashSet.add(arr2);

      let count: int = 0;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        count++;
        expect(key).assertEqual(value);
      });

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0300
     * @tc.name      testHashSet06Chapter0003
     * @tc.desc      Test forEach method with Unicode emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0003';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("👆");
      hashSet.add("👿");
      hashSet.add("👀");
      hashSet.add("💯");

      const visited: Array<string> = [];
      hashSet.forEach((value: string, key: string): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(4);
      expect(visited.includes("👆")).assertTrue();
      expect(visited.includes("💯")).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0400
     * @tc.name      testHashSet06Chapter0004
     * @tc.desc      Test forEach method with large HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0004';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      const size: int = 100;

      for (let i: int = 0; i < size; i++) {
        hashSet.add(i);
      }

      let count: int = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
        expect(value >= 0 && value < size).assertTrue();
      });

      expect(count).assertEqual(size);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0500
     * @tc.name      testHashSet06Chapter0005
     * @tc.desc      Negative test: forEach with callback that throws error when called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0005';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("test");

      const invalidCallback = (): void => {
        throw new Error("Invalid callback execution");
      };

      let errorCaught: boolean = false;
      try {
        hashSet.forEach(invalidCallback);
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("Invalid callback execution");
      }
      expect(errorCaught).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0600
     * @tc.name      testHashSet06Chapter0006
     * @tc.desc      Negative test: forEach with callback that processes values incorrectly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0006';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("test1");
      hashSet.add("test2");

      const callbackThatThrowsOnString = (value: string, key: string): void => {
        const numValue = Number(value);
        if (isNaN(numValue)) {
          throw new Error("Cannot convert string to number");
        }
        console.log("Converted value: " + numValue);
      };

      let errorCaught: boolean = false;
      try {
        hashSet.forEach(callbackThatThrowsOnString);
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("Cannot convert string to number");
      }
      expect(errorCaught).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0700
     * @tc.name      testHashSet06Chapter0007
     * @tc.desc      Negative test: forEach with thisArg that causes callback to fail
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0007';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");

      const brokenObject: ProcessingObject = {
        processItem: (value: string): void => {
          throw new Error("Method not available on this object");
        }
      };

      const callback = (value: string): void => {
        brokenObject.processItem(value);
      };

      let errorCaught: boolean = false;
      try {
        hashSet.forEach(callback);
      } catch (error) {
        errorCaught = true;
        expect(error.message.includes("not available")).assertTrue();
      }
      expect(errorCaught).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0800
     * @tc.name      testHashSet06Chapter0008
     * @tc.desc      Negative test: forEach callback accessing invalid set methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0008';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      expect(hashSet.length).assertEqual(0);

      for (let i: int = 0; i < 5; i++) {
        hashSet.add("value" + i);
      }
      expect(hashSet.length).assertEqual(5);

      const dangerousCallback = (value: string, key: string, hashSetRef: HashSet<string>): void => {
        hashSetRef.add("newItem");
        if (hashSetRef.length > 10) {
          throw new Error("Potential infinite loop detected");
        }
      };

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach(dangerousCallback);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Safe execution check: " + errorMessage);
        expect(error.message !== undefined).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.includes("Potential infinite loop detected")).assertTrue();
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_0900
     * @tc.name      testHashSet06Chapter0009
     * @tc.desc      Negative test: forEach with callback that throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0009';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(100);
      hashSet.add(200);
      hashSet.add(300);

      let maxValueHolder: number = 150;
      const context: ContextObject = {
        maxValue: 150,
        processValue: (value: number): void => {
          if (value > maxValueHolder) {
            throw new TypeError(`Value ${value} exceeds maximum allowed value ${maxValueHolder}`);
          }
        }
      };

      const callback = (value: number): void => {
        context.processValue(value);
      };

      let errorCaught: boolean = false;
      try {
        hashSet.forEach(callback);
      } catch (error) {
        errorCaught = true;
        expect(error.message !== undefined).assertTrue();
        expect(error.message.includes("exceeds maximum")).assertTrue();
      }
      expect(errorCaught).assertTrue();

    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1000
     * @tc.name      testHashSet06Chapter0010
     * @tc.desc      Test forEach method with set parameter verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0010';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(10);
      hashSet.add(20);
      hashSet.add(30);

      let receivedSet: HashSet<number> | undefined;
      hashSet.forEach((value: number, key: number, hashSetRef: HashSet<number>): void => {
        receivedSet = hashSetRef;
      });

      expect(receivedSet).assertEqual(hashSet);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1100
     * @tc.name      testHashSet06Chapter0011
     * @tc.desc      Test forEach method with TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0011';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint8Array>();
      const array1 = new Uint8Array([72, 101, 108, 108, 111]);
      const array2 = new Uint8Array([87, 111, 114, 108, 100]);

      hashSet.add(array1);
      hashSet.add(array2);

      let count: int = 0;
      hashSet.forEach((value: Uint8Array, key: Uint8Array): void => {
        count++;
        expect(value !== null && value !== undefined).assertTrue();
      });

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1200
     * @tc.name      testHashSet06Chapter0012
     * @tc.desc      Test forEach method with different numeric types boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0012';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();

      hashSet.add(127);
      hashSet.add(128);
      hashSet.add(-128);
      hashSet.add(-129);
      hashSet.add(32767);
      hashSet.add(32768);
      hashSet.add(-32768);
      hashSet.add(-32769);

      const visited: Array<number> = [];
      hashSet.forEach((value: number, key: number): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(8);
      expect(visited.includes(127)).assertTrue();
      expect(visited.includes(-128)).assertTrue();
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1300
     * @tc.name      testHashSet06Chapter0013
     * @tc.desc      Test forEach with TypedArray containing boundary values (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0013';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Int8Array>();
      const array1 = Int8Array.of(-128);
      const array2 = Int8Array.of(127);
      const array3 = Int8Array.of(-129, 128);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Int8Array, key: Int8Array): void => {
        count++;
        expect(value !== null && value !== undefined).assertTrue();
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1400
     * @tc.name      testHashSet06Chapter0014
     * @tc.desc      Test forEach with TypedArray containing boundary values (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0014';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint8Array>();
      const array1 = Uint8Array.of(0);
      const array2 = Uint8Array.of(255);
      const array3 = Uint8Array.of(256);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      const visited: Array<number> = [];
      hashSet.forEach((value: Uint8Array, key: Uint8Array): void => {
        visited.push(value[0]);
      });

      expect(visited.length).assertEqual(3);
      expect(visited.includes(0)).assertTrue();
      expect(visited.includes(255)).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1500
     * @tc.name      testHashSet06Chapter0015
     * @tc.desc      Test forEach with TypedArray containing Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0015';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Float32Array>();
      const array1 = Float32Array.of(Infinity);
      const array2 = Float32Array.of(-Infinity);
      const array3 = Float32Array.of(NaN);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Float32Array, key: Float32Array): void => {
        count++;
        expect(isFinite(value[0]) || isNaN(value[0]) || !isFinite(value[0])).assertTrue();
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1600
     * @tc.name      testHashSet06Chapter0016
     * @tc.desc      Test forEach with string containing ASCII full range characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0016';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      for (let i: int = 0; i < asciiChars.length; i++) {
        hashSet.add(asciiChars[i]);
      }

      const visited: Array<string> = [];
      hashSet.forEach((value: string, key: string): void => {
        visited.push(value);
        expect(asciiChars.includes(value)).assertTrue();
      });

      expect(visited.length).assertEqual(asciiChars.length);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1700
     * @tc.name      testHashSet06Chapter0017
     * @tc.desc      Test forEach with string containing repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0017';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const repeatedChars = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";

      for (let i: int = 0; i < repeatedChars.length; i += 2) {
        hashSet.add(repeatedChars.substring(i, i + 2));
      }

      let count: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        count++;
        expect(value.length).assertEqual(2);
      });

      expect(count).assertEqual(repeatedChars.length / 2.0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1800
     * @tc.name      testHashSet06Chapter0018
     * @tc.desc      Test forEach with string containing keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0018';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("0");
      hashSet.add("NaN");
      hashSet.add("null");
      hashSet.add("undefined");
      hashSet.add("true");
      hashSet.add("false");

      const visited: Array<string> = [];
      hashSet.forEach((value: string, key: string): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(6);
      expect(visited.includes("NaN")).assertTrue();
      expect(visited.includes("null")).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_1900
     * @tc.name      testHashSet06Chapter0019
     * @tc.desc      Test forEach with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0019';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const array1: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const array2: Array<number> = [0, 0, 0, 0, 0];

      hashSet.add(array1);
      hashSet.add(array2);

      let totalLength: int = 0;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        totalLength += value.length;
      });

      expect(totalLength).assertEqual(array1.length + array2.length);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2000
     * @tc.name      testHashSet06Chapter0020
     * @tc.desc      Test forEach with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0020';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const array1: Array<number> = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];

      hashSet.add(array1);

      let hasNegative = false;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        for (const num of value) {
          if (num < 0) {
            hasNegative = true;
          }
        }
      });

      expect(hasNegative).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2100
     * @tc.name      testHashSet06Chapter0021
     * @tc.desc      Test forEach with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0021';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const array1: Array<number> = [72, 101, NaN, Infinity, 108, 111];

      hashSet.add(array1);

      let hasSpecialValues = false;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        for (const num of value) {
          if (isNaN(num) || !isFinite(num)) {
            hasSpecialValues = true;
          }
        }
      });

      expect(hasSpecialValues).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2200
     * @tc.name      testHashSet06Chapter0022
     * @tc.desc      Test forEach with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0022';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const array1: Array<number> = [];

      hashSet.add(array1);

      let count: int = 0;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        count++;
        expect(value.length).assertEqual(0);
      });

      expect(count).assertEqual(1);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2300
     * @tc.name      testHashSet06Chapter0023
     * @tc.desc      Test forEach with object containing nested structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0023';
      console.log(TAG + ' start');

      const hashSet = new HashSet<NestedObject06>();

      const deepObj1: DeepNestedObject = { e: 3 };
      const middleObj1: MiddleNestedObject = { c: 2, d: deepObj1 };
      const obj1: NestedObject06 = { a: 1, b: middleObj1 };

      const deepObj2: DeepNestedObject = { e: 6 };
      const middleObj2: MiddleNestedObject = { c: 5, d: deepObj2 };
      const obj2: NestedObject06 = { a: 4, b: middleObj2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let totalA: int = 0;
      hashSet.forEach((value: NestedObject06, key: NestedObject06): void => {
        totalA += value.a;
      });

      expect(totalA).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2400
     * @tc.name      testHashSet06Chapter0024
     * @tc.desc      Test forEach with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0024';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithFunction>();
      const obj1: ObjectWithFunction = {
        id: 1,
        process: (): string => {
          return "processed1";
        }
      };
      const obj2: ObjectWithFunction = {
        id: 2,
        process: (): string => {
          return "processed2";
        }
      };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithFunction, key: ObjectWithFunction): void => {
        idSum += value.id;
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2500
     * @tc.name      testHashSet06Chapter0025
     * @tc.desc      Test forEach with object containing undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0025';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithOptionalProps>();
      const obj1: ObjectWithOptionalProps = { a: undefined, b: null, c: 1 };
      const obj2: ObjectWithOptionalProps = { a: 2, b: 3, c: 4 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let count: int = 0;
      hashSet.forEach((value: ObjectWithOptionalProps, key: ObjectWithOptionalProps): void => {
        count++;
      });

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2600
     * @tc.name      testHashSet06Chapter0026
     * @tc.desc      Test forEach with object containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0026';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithMap>();
      const map1 = new Map<string, number>();
      map1.set('key1', 1);
      map1.set('key2', 2);

      const map2 = new Map<string, number>();
      map2.set('key3', 3);
      map2.set('key4', 4);

      const obj1: ObjectWithMap = { id: 1, map: map1 };
      const obj2: ObjectWithMap = { id: 2, map: map2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithMap, key: ObjectWithMap): void => {
        idSum += value.id;
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2700
     * @tc.name      testHashSet06Chapter0027
     * @tc.desc      Test forEach with object containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0027';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithSetContainer>();
      const set1 = new Set<number>([1, 2, 3, 2, 1]);
      const set2 = new Set<number>([4, 5, 6]);

      const obj1: ObjectWithSetContainer = { id: 1, setData: set1 };
      const obj2: ObjectWithSetContainer = { id: 2, setData: set2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let totalSetSize: int = 0;
      hashSet.forEach((value: ObjectWithSetContainer, key: ObjectWithSetContainer): void => {
        totalSetSize += value.setData.size;
      });

      expect(totalSetSize).assertEqual(6);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2800
     * @tc.name      testHashSet06Chapter0028
     * @tc.desc      Test forEach with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0028';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithRegex>();
      const obj1: ObjectWithRegex = { id: 1, regex: new RegExp("abc", "gi") };
      const obj2: ObjectWithRegex = { id: 2, regex: new RegExp("def", "m") };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithRegex, key: ObjectWithRegex): void => {
        idSum += value.id;
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_2900
     * @tc.name      testHashSet06Chapter0029
     * @tc.desc      Test forEach with large object (performance test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0029';
      console.log(TAG + ' start');

      const hashSet = new HashSet<LargeObject06>();
      const size: int = 500;

      for (let i: int = 0; i < size; i++) {
        const obj: LargeObject06 = {
          id: i,
          data: `data${i}`.repeat(10)
        };
        hashSet.add(obj);
      }

      let count: int = 0;
      let idSum: int = 0;
      hashSet.forEach((value: LargeObject06, key: LargeObject06): void => {
        count++;
        idSum += value.id;
      });

      expect(count).assertEqual(size);
      expect(idSum).assertEqual((size - 1) * size / 2.0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3000
     * @tc.name      testHashSet06Chapter0030
     * @tc.desc      Test forEach with various number types (byte, short, int, long ranges)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0030';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();


      hashSet.add(-128);
      hashSet.add(127);


      hashSet.add(-32768);
      hashSet.add(32767);


      hashSet.add(-2147483648);
      hashSet.add(2147483647);


      hashSet.add(-9007199254740991);
      hashSet.add(9007199254740991);


      hashSet.add(1.40129846432481707e-45);
      hashSet.add(3.40282346638528860e+38);
      hashSet.add(4.94065645841246544e-324);
      hashSet.add(1.79769313486231570e+308);

      let count: int = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
      });

      expect(count).assertEqual(12);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3100
     * @tc.name      testHashSet06Chapter0031
     * @tc.desc      Negative test: forEach callback modifying the set during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0031';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      expect(hashSet.length).assertEqual(0);

      for (let i: int = 0; i < 5; i++) {
        hashSet.add(i);
      }
      expect(hashSet.length).assertEqual(5);

      let iterationCount: int = 0;
      const dangerousCallback = (value: number, key: number, hashSetRef: HashSet<number>): void => {
        iterationCount++;
        if (iterationCount === 2) {
          hashSetRef.add(100);
        }
      };

      let errorCaught = false;
      let errorMessage = '';

      try {
        hashSet.forEach(dangerousCallback);
        expect(iterationCount).assertLargerOrEqual(5);
        expect(typeof hashSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        const err = error as Error;
        errorMessage = err.message;
        console.log("Iteration behavior: " + errorMessage);
        expect(error.message !== undefined).assertTrue();
      }

      if (errorCaught) {
        expect(errorMessage.length).assertLarger(0);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3200
     * @tc.name      testHashSet06Chapter0032
     * @tc.desc      Test forEach with thisArg that provides utility methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0032';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(10);
      hashSet.add(20);
      hashSet.add(30);
      hashSet.add(40);
      hashSet.add(50);

      const mathUtils: MathUtils = {
        square: (x: number): number => {
          return x * x;
        },
        sum: 0
      };

      const callback = (value: number): void => {
        const squared = mathUtils.square(value);
        mathUtils.sum += squared;
      };

      hashSet.forEach(callback);

      expect(mathUtils.sum).assertEqual(5500);
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3300
     * @tc.name      testHashSet06Chapter0033
     * @tc.desc      Test forEach with Uint8ClampedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0033';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint8ClampedArray>();
      const array1 = Uint8ClampedArray.of(0);
      const array2 = Uint8ClampedArray.of(255);
      const array3 = Uint8ClampedArray.of(300);
      const array4 = Uint8ClampedArray.of(-10);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);
      hashSet.add(array4);

      let count: int = 0;
      hashSet.forEach((value: Uint8ClampedArray, key: Uint8ClampedArray): void => {
        count++;
      });

      expect(count).assertEqual(4);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3400
     * @tc.name      testHashSet06Chapter0034
     * @tc.desc      Test forEach with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0034';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Int16Array>();
      const array1 = Int16Array.of(-32768);
      const array2 = Int16Array.of(32767);
      const array3 = Int16Array.of(-32769, 32768);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Int16Array, key: Int16Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3500
     * @tc.name      testHashSet06Chapter0035
     * @tc.desc      Test forEach with BigInt64Array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0035';
      console.log(TAG + ' start');

      const hashSet = new HashSet<BigInt64Array>();
      const array1 = BigInt64Array.of(-9223372036854775808n);
      const array2 = BigInt64Array.of(9223372036854775807n);

      hashSet.add(array1);
      hashSet.add(array2);

      let count: int = 0;
      hashSet.forEach((value: BigInt64Array, key: BigInt64Array): void => {
        count++;
      });

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3600
     * @tc.name      testHashSet06Chapter0036
     * @tc.desc      Test forEach with very long string (treeString type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0036';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();

      const generateLongString = (size: number): string => {
        let result = '[';
        while (result.length < size) {
          result += '{"a":1},';
        }
        result += '{"a":1}]';
        return result;
      }

      const longString = generateLongString(1000);
      hashSet.add(longString);

      let receivedLength: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        receivedLength = value.length;
      });

      expect(receivedLength >= 1000).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3700
     * @tc.name      testHashSet06Chapter0037
     * @tc.desc      Test forEach with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0037';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const originalStr = "{k1:value1,k2:value2}";
      const slicedStr = originalStr.substring(0, originalStr.length - 2);

      hashSet.add(originalStr);
      hashSet.add(slicedStr);

      const visited: Array<string> = [];
      hashSet.forEach((value: string, key: string): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(originalStr)).assertTrue();
      expect(visited.includes(slicedStr)).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3800
     * @tc.name      testHashSet06Chapter0038
     * @tc.desc      Test forEach with different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0038';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();


      hashSet.add(0x0102);


      hashSet.add(0x01020304);


      hashSet.add(0o377);


      hashSet.add(2**3);


      hashSet.add(1e3);
      hashSet.add(2.5e-2);

      let count: int = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
      });

      expect(count).assertEqual(6);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_3900
     * @tc.name      testHashSet06Chapter0039
     * @tc.desc      Test forEach with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0039';
      console.log(TAG + ' start');

      const hashSet = new HashSet<bigint>();


      hashSet.add(BigInt("0xdecafafecacefade"));


      hashSet.add(9007199254740991n);


      hashSet.add(123456789012345678901234567890n);

      let count: int = 0;
      hashSet.forEach((value: bigint, key: bigint): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4000
     * @tc.name      testHashSet06Chapter0040
     * @tc.desc      Test forEach with array containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0040';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<MixedValueType06>>();
      const mixedArray: Array<MixedValueType06> = [72, "abc", true, null, undefined, 108];

      hashSet.add(mixedArray);

      let count: int = 0;
      hashSet.forEach((value: Array<MixedValueType06>, key: Array<MixedValueType06>): void => {
        count++;
        expect(value.length).assertEqual(6);

        let hasNumber = false;
        let hasString = false;
        let hasBoolean = false;
        let hasNull = false;
        let hasUndefined = false;

        for (const item of value) {
          if (typeof item === 'number') {
            hasNumber = true;
          } else if (typeof item === 'string') {
            hasString = true;
          } else if (typeof item === 'boolean') {
            hasBoolean = true;
          } else if (item === null) {
            hasNull = true;
          } else if (item === undefined) {
            hasUndefined = true;
          }
        }

        expect(hasNumber).assertTrue();
        expect(hasString).assertTrue();
        expect(hasBoolean).assertTrue();
        expect(hasNull).assertTrue();
        expect(hasUndefined).assertTrue();
      });

      expect(count).assertEqual(1);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4100
     * @tc.name      testHashSet06Chapter0041
     * @tc.desc      Test forEach with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0041';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();
      const overflowArray: Array<number> = [256, 65536, 32768];

      hashSet.add(overflowArray);

      let hasLargeValues = false;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        for (const num of value) {
          if (num > 255) {
            hasLargeValues = true;
          }
        }
      });

      expect(hasLargeValues).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4200
     * @tc.name      testHashSet06Chapter0042
     * @tc.desc      Test forEach with different callback parameter combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0042';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");
      hashSet.add("item3");


      let count1: int = 0;
      hashSet.forEach((value: string): void => {
        count1++;
      });


      let count2: int = 0;
      let keysMatch = true;
      hashSet.forEach((value: string, key: string): void => {
        count2++;
        if (value !== key) {
          keysMatch = false;
        }
      });


      let count3: int = 0;
      let setReference: HashSet<string> | undefined;
      hashSet.forEach((value: string, key: string, hashSetRef: HashSet<string>): void => {
        count3++;
        setReference = hashSetRef;
      });

      expect(count1).assertEqual(3);
      expect(count2).assertEqual(3);
      expect(count3).assertEqual(3);
      expect(keysMatch).assertTrue();
      expect(setReference).assertEqual(hashSet);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4300
     * @tc.name      testHashSet06Chapter0043
     * @tc.desc      Test forEach with illegal Unicode encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0043';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();


      const illegalStrings = ["\\udc04", "\\ud83d", "\\udff4"];

      for (const str of illegalStrings) {
        hashSet.add(str);
      }

      let count: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4400
     * @tc.name      testHashSet06Chapter0044
     * @tc.desc      Negative test: forEach with callback that throws binding-related error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0044';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");

      const invalidContext: InvalidContext = {
        invalidProperty: undefined
      };

      const callback = (value: string): void => {

        if (invalidContext.invalidProperty === undefined) {
          throw new Error("Property access error - simulated binding failure");
        }
        console.log(value);
      };

      let errorCaught: boolean = false;
      try {
        hashSet.forEach(callback);
      } catch (error) {
        errorCaught = true;
        expect(error.message.includes("Property access error")).assertTrue();
      }
      expect(errorCaught).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4500
     * @tc.name      testHashSet06Chapter0045
     * @tc.desc      Test forEach with object containing ArrayBuffer property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0045';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithBuffer>();

      const buffer1 = new ArrayBuffer(16);
      const obj1: ObjectWithBuffer = { id: 1, buffer: buffer1 };

      const buffer2 = new ArrayBuffer(32);
      const obj2: ObjectWithBuffer = { id: 2, buffer: buffer2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithBuffer, key: ObjectWithBuffer): void => {
        idSum += value.id;
      });

      expect(idSum).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4600
     * @tc.name      testHashSet06Chapter0046
     * @tc.desc      Test forEach with object containing DataView property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0046';
      console.log(TAG + ' start');

      const hashSet = new HashSet<ObjectWithDataView>();

      const buffer1 = new ArrayBuffer(16);
      const view1 = new DataView(buffer1);
      const obj1: ObjectWithDataView = { id: 1, view: view1 };

      const buffer2 = new ArrayBuffer(16);
      const view2 = new DataView(buffer2);
      const obj2: ObjectWithDataView = { id: 2, view: view2 };

      hashSet.add(obj1);
      hashSet.add(obj2);

      let idSum: int = 0;
      hashSet.forEach((value: ObjectWithDataView, key: ObjectWithDataView): void => {
        idSum += value.id;
      });

      expect(idSum).assertEqual(3);
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4700
     * @tc.name      testHashSet06Chapter0047
     * @tc.desc      Test forEach with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0047';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint16Array>();
      const array1 = Uint16Array.of(0);
      const array2 = Uint16Array.of(65535);
      const array3 = Uint16Array.of(65536);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Uint16Array, key: Uint16Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4800
     * @tc.name      testHashSet06Chapter0048
     * @tc.desc      Test forEach with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0048';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Int32Array>();
      const array1 = Int32Array.of(-2147483648);
      const array2 = Int32Array.of(2147483647);
      const array3 = Int32Array.of(-2147483649, 2147483648);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Int32Array, key: Int32Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_4900
     * @tc.name      testHashSet06Chapter0049
     * @tc.desc      Test forEach with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0049';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Uint32Array>();
      const array1 = Uint32Array.of(0);
      const array2 = Uint32Array.of(4294967295);
      const array3 = Uint32Array.of(4294967296);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Uint32Array, key: Uint32Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_5000
     * @tc.name      testHashSet06Chapter0050
     * @tc.desc      Test forEach with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0050';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Float64Array>();
      const array1 = Float64Array.of(-1.7976931348623157e308);
      const array2 = Float64Array.of(1.7976931348623157e308);
      const array3 = Float64Array.of(-Infinity, Infinity);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: Float64Array, key: Float64Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_5100
     * @tc.name      testHashSet06Chapter0051
     * @tc.desc      Test forEach with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0051';
      console.log(TAG + ' start');

      const hashSet = new HashSet<BigUint64Array>();
      const array1 = BigUint64Array.of(0n);
      const array2 = BigUint64Array.of(18446744073709551615n);
      const array3 = BigUint64Array.of(18446744073709551616n);

      hashSet.add(array1);
      hashSet.add(array2);
      hashSet.add(array3);

      let count: int = 0;
      hashSet.forEach((value: BigUint64Array, key: BigUint64Array): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_5200
     * @tc.name      testHashSet06Chapter0052
     * @tc.desc      Test forEach with TypedArray special value storage rules
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0052';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();


      const testArrays: Array<Array<number>> = [];


      const specialValues: Array<number> = [];


      const infinityValue: number = 1.7976931348623157e308 * 2;
      const negInfinityValue: number = -1.7976931348623157e308 * 2;
      const nanValue: number = 0.0 / 0;


      const sourceArray = [infinityValue, nanValue, negInfinityValue];


      const int8ArrayBuffer = new ArrayBuffer(3);
      const int8Array = new Int8Array(int8ArrayBuffer);
      for (let i: int = 0; i < sourceArray.length; i++) {
        int8Array[i] = sourceArray[i];
      }
      testArrays.push(Array.from(int8Array));


      const uint8ArrayBuffer = new ArrayBuffer(3);
      const uint8Array = new Uint8Array(uint8ArrayBuffer);
      for (let i: int = 0; i < sourceArray.length; i++) {
        uint8Array[i] = sourceArray[i];
      }
      testArrays.push(Array.from(uint8Array));


      const uint8ClampedArrayBuffer = new ArrayBuffer(3);
      const uint8ClampedArray = new Uint8ClampedArray(uint8ClampedArrayBuffer);
      for (let i: int = 0; i < sourceArray.length; i++) {
        uint8ClampedArray[i] = sourceArray[i];
      }
      testArrays.push(Array.from(uint8ClampedArray));

      for (const arr of testArrays) {
        hashSet.add(arr);
      }

      let count: int = 0;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        count++;

        for (const num of value) {
          expect(num >= 0 && num <= 255).assertTrue();
        }
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_5300
     * @tc.name      testHashSet06Chapter0053
     * @tc.desc      Test forEach with special array (non-numeric indices)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0053';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();


      const arr: Array<number> = [];

      arr.push(100);
      arr.push(200);


      const arr2: Array<number> = [300, 400];

      hashSet.add(arr);
      hashSet.add(arr2);

      let totalLength: int = 0;
      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        totalLength += value.length;
      });

      expect(totalLength).assertEqual(4);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTSIX_5400
     * @tc.name      testHashSet06Chapter0054
     * @tc.desc      Test forEach with array converted to typed array scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet06Chapter0054';
      console.log(TAG + ' start');

      const hashSet = new HashSet<Array<number>>();


      const sourceArray: Array<number> = [72, 101, 108, 108, 111];
      const typedArray = new Uint8Array(sourceArray);


      hashSet.add(sourceArray);
      hashSet.add(Array.from(typedArray));

      let foundSourceArray = false;
      let foundTypedArray = false;

      hashSet.forEach((value: Array<number>, key: Array<number>): void => {
        if (value.length === 5 && value[0] === 72 && value[4] === 111) {
          if (JSON.stringify(value) === JSON.stringify(sourceArray)) {
            foundSourceArray = true;
          }
          if (JSON.stringify(value) === JSON.stringify(Array.from(typedArray))) {
            foundTypedArray = true;
          }
        }
      });

      expect(foundSourceArray).assertTrue();
      expect(foundTypedArray).assertTrue();
    });


  })
}
