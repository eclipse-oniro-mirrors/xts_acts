/*
* Copyright (c) 2026 RKH Corp.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

interface Person {
  name: string;
  age: number;
}

export default function BuiltinsArrayEveryTest(): void {
  describe("BuiltinsArrayEveryTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name    builtinsArrayEveryTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0100
     * @tc.desc    Verify every with all elements satisfying condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEveryTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        return value > 0;
      });
      
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0200
     * @tc.desc    Verify every with some elements not satisfying condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = -4;
      arr[4] = 5;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        return value > 0;
      });
      
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0400
     * @tc.desc    Verify every with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, 0);
      arr[0] = 42;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        return value > 0;
      });
      
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0500
     * @tc.desc    Verify every with predicate parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let calledWithCorrectValue = false;
      let calledWithCorrectIndex = false;
      let calledWithCorrectArray = false;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        if (index === 0 && value === 1 && array === arr) {
          calledWithCorrectValue = true;
          calledWithCorrectIndex = true;
          calledWithCorrectArray = true;
        }
        return value > 0;
      });
      
      expect(result).assertEqual(true);
      expect(calledWithCorrectValue).assertEqual(true);
      expect(calledWithCorrectIndex).assertEqual(true);
      expect(calledWithCorrectArray).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0600
     * @tc.desc    Verify every with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Person>(3, { name: '', age: 0 } as Person);
      arr[0] = { name: "Alice", age: 25 };
      arr[1] = { name: "Bob", age: 30 };
      arr[2] = { name: "Charlie", age: 35 };
      
      const result = arr.every((value: Person, index: int, array: Array<Person>) => {
        return value.age > 20;
      });
      
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0700
     * @tc.desc    Verify every with index parameter testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        return index < 3;
      });
      
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0800
     * @tc.desc    Verify every with array parameter testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let passedArray: Array<number> | null = null;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        if (index === 0) {
          passedArray = array;
        }
        return value > 0;
      });
      
      expect(result).assertEqual(true);
      expect(passedArray).assertEqual(arr);
      expect(passedArray!.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayEveryTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_0900
     * @tc.desc    Verify every with first element failing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = -1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      let callCount = 0;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        callCount++;
        return value > 0;
      });
      
      expect(result).assertEqual(false);
      expect(callCount).assertEqual(1); // Should only call once
    });

    /**
     * @tc.name    builtinsArrayEveryTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_1000
     * @tc.desc    Verify every with last element failing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEveryTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = -5;
      
      let callCount = 0;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        callCount++;
        return value > 0;
      });
      
      expect(result).assertEqual(false);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayEveryTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_1100
     * @tc.desc    Verify every with index parameter using minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayEveryTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let minIntCalled = false;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        if (index === -2147483648) {
          minIntCalled = true;
        }
        return value > 0;
      });
      
      expect(result).assertEqual(true);
      expect(minIntCalled).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayEveryTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_EVERY_TEST_1200
     * @tc.desc    Verify every with index parameter using maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayEveryTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let maxIntCalled = false;
      
      const result = arr.every((value: number, index: int, array: Array<number>) => {
        if (index === 2147483647) {
          maxIntCalled = true;
        }
        return value > 0;
      });
      
      expect(result).assertEqual(true);
      expect(maxIntCalled).assertEqual(false);
    });
  })
}