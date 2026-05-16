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

export default function BuiltinsArrayFindLastTest(): void {
  describe("BuiltinsArrayFindLastTest", () => {
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
     * @tc.name    builtinsArrayFindLastTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0100
     * @tc.desc    Verify findLast with positive match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFindLastTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return value === 3;
      });
      
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0200
     * @tc.desc    Verify findLast with no match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return value === 4;
      });
      
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0300
     * @tc.desc    Verify findLast with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return value === 1;
      });
      
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0400
     * @tc.desc    Verify findLast with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, 0);
      arr[0] = 42;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return value === 42;
      });
      
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0500
     * @tc.desc    Verify findLast with predicate parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let calledWithCorrectValue = false;
      let calledWithCorrectIndex = false;
      let calledWithCorrectArray = false;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        if (value === 2 && index === 1 && array === arr) {
          calledWithCorrectValue = true;
          calledWithCorrectIndex = true;
          calledWithCorrectArray = true;
          return true;
        }
        return false;
      });
      
      expect(result).assertEqual(2);
      expect(calledWithCorrectValue).assertEqual(true);
      expect(calledWithCorrectIndex).assertEqual(true);
      expect(calledWithCorrectArray).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0600
     * @tc.desc    Verify findLast with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = Array.create<Person>(3, { name: "", age: 0 });
      arr[0] = { name: "Alice", age: 25 };
      arr[1] = { name: "Bob", age: 30 };
      arr[2] = { name: "Charlie", age: 35 };
      
      const result = arr.findLast((value: Person, index: int, array: Array<Person>) => {
        return value.age === 30;
      });
      
      expect(result).assertEqual(arr[1]);
      expect(result!.name).assertEqual("Bob");
      expect(result!.age).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0700
     * @tc.desc    Verify findLast with index parameter testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return index === 2;
      });
      
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0800
     * @tc.desc    Verify findLast with array parameter testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let passedArray: Array<number> | null = null;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        passedArray = array;
        return value === 2;
      });
      
      expect(result).assertEqual(2);
      expect(passedArray).assertEqual(arr);
      expect(passedArray!.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_0900
     * @tc.desc    Verify findLast with first element match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      let callCount = 0;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        callCount++;
        return value === 1;
      });
      
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1000
     * @tc.desc    Verify findLast with last element match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      let callCount = 0;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        callCount++;
        return value === 5;
      });
      
      expect(result).assertEqual(5);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1100
     * @tc.desc    Verify findLast with multiple matching elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 2;
      arr[1] = 3;
      arr[2] = 2;
      arr[3] = 4;
      arr[4] = 2;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        return value === 2;
      });
      
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1200
     * @tc.desc    Verify findLast with index parameter using minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFindLastTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let minIntCalled = false;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        if (index === -2147483648) {
          minIntCalled = true;
        }
        return value === 2;
      });
      
      expect(result).assertEqual(2);
      expect(minIntCalled).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayFindLastTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_TEST_1300
     * @tc.desc    Verify findLast with index parameter using maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFindLastTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      let maxIntCalled = false;
      
      const result = arr.findLast((value: number, index: int, array: Array<number>) => {
        if (index === 2147483647) {
          maxIntCalled = true;
        }
        return value === 2;
      });
      
      expect(result).assertEqual(2);
      expect(maxIntCalled).assertEqual(false);
    });
  })
}