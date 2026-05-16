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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium/index';
import Utils from '../Util.test';

function isPositive(element: number): boolean {
  return element > 0;
}

interface Task {
  id: number;
  status: string;
}

interface FormData {
  field: string;
  value: string;
}

interface TestObj {
  a?: number;
  b?: number;
  c?: number;
}

interface Person {
  name: string;
  age: number;
}

interface Product {
  name: string;
  price: number;
}

interface GeneratedObjectLiteralInterface_1 {
  min: number;
  max: number;
}

interface TestObj2 {
  a: number;
}

interface GeneratedTypeLiteralInterface_2 {
  element: number;
  index: number;
}

interface User {
  id: number;
  online: boolean;
}

interface CartItem {
  id: number;
  name: string;
  inStock: boolean;
}

interface FormField {
  name: string;
  value: string;
  required: boolean;
}

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function BuiltinsArrayPrototypeEveryTest(): void {
  describe("BuiltinsArrayPrototypeEveryTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayPrototypeEveryTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0100
     * @tc.desc    Verify all elements satisfy condition returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [2, 4, 6, 8, 10];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0200
     * @tc.desc    Verify some elements not satisfy condition returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [2, 4, 5, 8, 10];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0300
     * @tc.desc    Verify short-circuit evaluation behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let count = 0;
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.every(x => {
        count++;
        return x > 10;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0400
     * @tc.desc    Verify arrow function as callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.every((element) => element > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0500
     * @tc.desc    Verify regular function as callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.every(isPositive);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0600
     * @tc.desc    Verify inline function as callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30];
      const result = arr.every((element: number): boolean => {
        return element >= 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0700
     * @tc.desc    Verify returns true when all elements satisfy condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [2, 4, 6, 8];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0800
     * @tc.desc    Verify empty array returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_0900
     * @tc.desc    Verify single element array returns true when element satisfies condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [5];
      const result = arr.every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1000
     * @tc.desc    Verify returns false when some elements not satisfy condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [2, 4, 5, 8];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1100
     * @tc.desc    Verify single element array returns false when element not satisfies condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [-5];
      const result = arr.every(x => x > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1200
     * @tc.desc    Verify empty array returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1300
     * @tc.desc    Verify empty array doesn't execute callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let executed = false;
      const arr: number[] = [];
      const result = arr.every(x => {
        executed = true;
        return x > 0;
      });
      expect(result).assertTrue();
      expect(executed).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1400
     * @tc.desc    Verify single element array returns true when element satisfies condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10];
      const result = arr.every(x => x > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1500
     * @tc.desc    Verify single element array returns false when element not satisfies condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [3];
      const result = arr.every(x => x > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1600
     * @tc.desc    Verify large array returns true when all elements satisfy condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = new Array<number>(10000).fill(1);
      const result = arr.every(x => x === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1700
     * @tc.desc    Verify large array returns false immediately when element not satisfies condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = new Array<number>(10000).fill(1);
      arr[5000] = 2;
      let count = 0;
      const result = arr.every(x => {
        count++;
        return x === 1;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(5001);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1800
     * @tc.desc    Verify callback element parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30];
      const elements: number[] = [];
      arr.every(element => {
        elements.push(element);
        return true;
      });
      expect(elements.length).assertEqual(3);
      expect(elements[0]).assertEqual(10);
      expect(elements[1]).assertEqual(20);
      expect(elements[2]).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_1900
     * @tc.desc    Verify callback index parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const indices: number[] = [];
      arr.every((element, index) => {
        indices.push(index);
        return true;
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2000
     * @tc.desc    Verify callback array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let arrayMatch = true;
      arr.every((element, index, array) => {
        if (array !== arr) {
          arrayMatch = false;
        }
        return true;
      });
      expect(arrayMatch).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2100
     * @tc.desc    Verify callback returns non-empty string (truthy)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.every(x => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2200
     * @tc.desc    Verify callback returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.every(x => false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2300
     * @tc.desc    Verify modifying visited elements affects subsequent reads
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      const iterations: number[] = [];
      arr.every((element, index) => {
        iterations.push(element);
        arr[index] = element * 10;
        return element < 3;
      });
      expect(iterations.length).assertEqual(3);
      expect(iterations[0]).assertEqual(1);
      expect(iterations[1]).assertEqual(2);
      expect(iterations[2]).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2400
     * @tc.desc    Verify modifying unvisited elements affects subsequent traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      const iterations: number[] = [];
      arr.every((element, index) => {
        iterations.push(element);
        if (index === 0) {
          arr[2] = 100;
        }
        return true;
      });
      expect(iterations.length).assertEqual(4);
      expect(iterations[0]).assertEqual(1);
      expect(iterations[1]).assertEqual(2);
      expect(iterations[2]).assertEqual(100);
      expect(iterations[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2500
     * @tc.desc    Verify adding elements in callback doesn't increase traversal count
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let iterations = 0;
      arr.every((element) => {
        iterations++;
        arr.push(element * 10);
        return true;
      });
      expect(iterations).assertEqual(3);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
      expect(arr[5]).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2600
     * @tc.desc    Verify deleting elements reduces subsequent traversal count
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iterations: number[] = [];
      arr.every((element, index) => {
        iterations.push(element);
        arr.pop();
        return true;
      });
      expect(iterations.length).assertEqual(3);
      expect(iterations[0]).assertEqual(1);
      expect(iterations[1]).assertEqual(2);
      expect(iterations[2]).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2700
     * @tc.desc    Verify clearing array stops traversal immediately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let iterations = 0;
      const result = arr.every((element) => {
        iterations++;
        if (iterations === 2) {
          arr.length = 0;
        }
        return true;
      });
      expect(iterations).assertEqual(2);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2800
     * @tc.desc    Verify positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 100, 1000];
      const result = arr.every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_2900
     * @tc.desc    Verify negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [-1, -2, -3, -100];
      const result = arr.every(x => x < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3000
     * @tc.desc    Verify zeros
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [0, 0, 0];
      const result = arr.every(x => x === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3100
     * @tc.desc    Verify floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1.1, 2.5, 3.14];
      const result = arr.every(x => x > 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3200
     * @tc.desc    Verify empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['', '', ''];
      const result = arr.every(x => x === '');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3300
     * @tc.desc    Verify non-empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'ab', 'abc'];
      const result = arr.every(x => x.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3400
     * @tc.desc    Verify boolean true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, true, true];
      const result = arr.every(x => x === true);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3500
     * @tc.desc    Verify boolean false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [false, false, false];
      const result = arr.every(x => x === false);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3600
     * @tc.desc    Verify null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (null | number)[] = [null, null, null];
      const result = arr.every(x => x === null);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3700
     * @tc.desc    Verify undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (undefined | number)[] = [undefined, undefined, undefined];
      const result = arr.every(x => x === undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3800
     * @tc.desc    Verify plain objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = [{a: 1}, {b: 2}, {c: 3}];
      const result = arr.every(x => typeof x === 'object');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_3900
     * @tc.desc    Verify nested arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1], [2, 3], [4, 5, 6]];
      const result = arr.every(x => Array.isArray(x));
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4000
     * @tc.desc    Verify callback throws error stops traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let count = 0;
      let errorCaught = false;

      try {
        arr.every(x => {
          count++;
          if (x === 3) throw new Error('Test error');
          return true;
        });
      } catch (e) {
        errorCaught = true;
      }

      expect(errorCaught).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4100
     * @tc.desc    Verify all form fields are filled
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const formData: FormData[] = [
        {field: 'name', value: 'John'},
        {field: 'email', value: 'john@example.com'},
        {field: 'age', value: '25'}
      ];
      const allFilled = formData.every(item => item.value !== '' && item.value !== null);
      expect(allFilled).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4200
     * @tc.desc    Verify all scores are within valid range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const scores: number[] = [85, 92, 78, 90, 88];
      const allValid = scores.every(score => score >= 0 && score <= 100);
      expect(allValid).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4300
     * @tc.desc    Verify array is subset of another array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const array1: number[] = [1, 2, 3, 4, 5, 6, 7];
      const array2: number[] = [5, 7, 6];
      const isSubset = array2.every(element => array1.includes(element));
      expect(isSubset).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4400
     * @tc.desc    Verify all tasks are completed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const tasks: Task[] = [
        {id: 1, status: 'completed'},
        {id: 2, status: 'completed'},
        {id: 3, status: 'completed'}
      ];
      const allCompleted = tasks.every(task => task.status === 'completed');
      expect(allCompleted).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4500
     * @tc.desc    Verify all numbers are positive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numbers: number[] = [1, 2, 3, 4, 5];
      const allPositive = numbers.every(num => num > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4600
     * @tc.desc    Verify all numbers are even
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numbers: number[] = [2, 4, 6, 8, 10];
      const allEven = numbers.every(num => num % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4700
     * @tc.desc    Verify all elements are strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const allStrings = arr.every(item => typeof item === 'string');
      expect(allStrings).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4800
     * @tc.desc    Verify all elements are objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = [{a: 1}, {b: 2}, {c: 3}];
      const allObjects = arr.every(item => typeof item === 'object' && item !== null);
      expect(allObjects).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_4900
     * @tc.desc    Verify all objects have specific property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objects: Person[] = [
        {name: 'Alice', age: 25},
        {name: 'Bob', age: 30},
        {name: 'Charlie', age: 35}
      ];
      const allHaveName = objects.every(obj => obj.name !== undefined);
      expect(allHaveName).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5000
     * @tc.desc    Verify all objects property values satisfy condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const products: Product[] = [
        {name: 'Product 1', price: 100},
        {name: 'Product 2', price: 200},
        {name: 'Product 3', price: 150}
      ];
      const allAffordable = products.every(product => product.price < 500);
      expect(allAffordable).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5100
     * @tc.desc    Verify multiple elements not satisfy condition returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 3, 5, 7, 9];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5200
     * @tc.desc    Verify middle element not satisfy condition stops traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let count = 0;
      const arr: number[] = [10, 20, 5, 30, 40];
      const result = arr.every(x => {
        count++;
        return x > 8;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5300
     * @tc.desc    Verify custom thisArg
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const context: GeneratedObjectLiteralInterface_1 = { min: 0, max: 10 };
      const result = arr.every((element: number): boolean => {
        return element > context.min && element < context.max;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5400
     * @tc.desc    Verify all elements not satisfy condition returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 3, 5, 7];
      const result = arr.every(x => x % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5500
     * @tc.desc    Verify sparse array skips empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [1, undefined, undefined, 4];
      let count = 0;
      const result = arr.every(x => {
        count++;
        return x !== undefined;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5600
     * @tc.desc    Verify sparse array all elements pass
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [2, undefined, undefined, 8];
      const result = arr.every(x => x !== undefined && x % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5700
     * @tc.desc    Verify sparse array some elements fail
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [2, undefined, undefined, 9];
      const result = arr.every(x => x !== undefined && x % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5800
     * @tc.desc    Verify element parameter with various data types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCases: (number | string | boolean | null | undefined | TestObj2 | number[])[] = [];
      testCases.push(1);
      testCases.push('string');
      testCases.push(true);
      testCases.push(null);
      testCases.push(undefined);
      testCases.push({a: 1});
      testCases.push([1, 2]);

      const types: string[] = [];
      testCases.every(element => {
        types.push(typeof element);
        return true;
      });

      expect(types.length).assertEqual(7);
      expect(types[0]).assertEqual('number');
      expect(types[1]).assertEqual('string');
      expect(types[2]).assertEqual('boolean');
      expect(types[3]).assertEqual('object');
      expect(types[4]).assertEqual('undefined');
      expect(types[5]).assertEqual('object');
      expect(types[6]).assertEqual('object');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_5900
     * @tc.desc    Verify index parameter starts from 0 and increments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30, 40];
      let indices: number[] = [];
      arr.every((element, index) => {
        indices.push(index);
        return index < 3;
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6000
     * @tc.desc    Verify access other elements via array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      let previousValues: number[] = [];
      arr.every((element, index, array) => {
        if (index > 0) {
          previousValues.push(array[index - 1]);
        }
        return element < 10;
      });
      expect(previousValues.length).assertEqual(4);
      expect(previousValues[0]).assertEqual(1);
      expect(previousValues[1]).assertEqual(2);
      expect(previousValues[2]).assertEqual(3);
      expect(previousValues[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6100
     * @tc.desc    Verify array parameter reflects modified array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let modifiedValues: number[] = [];
      arr.every((element, index, array) => {
        if (index === 0) {
          array[0] = 100;
        }
        modifiedValues.push(array[0]);
        return true;
      });
      expect(modifiedValues[0]).assertEqual(100);
      expect(modifiedValues[1]).assertEqual(100);
      expect(modifiedValues[2]).assertEqual(100);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6200
     * @tc.desc    Verify thisArg is number
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.every((element: number): boolean => {
        return element > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6300
     * @tc.desc    Verify thisArg is string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const result = arr.every((element: string): boolean => {
        return element.length === 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6400
     * @tc.desc    Verify thisArg is boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false];
      const result = arr.every((element: boolean): boolean => {
        return typeof element === 'boolean';
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6500
     * @tc.desc    Verify no thisArg provided
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.every((element: number): boolean => {
        return element > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6600
     * @tc.desc    Verify modifying already visited elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let callCount = 0;
      arr.every((element, index) => {
        callCount++;
        if (index > 0) {
          arr[index - 1] = 100;
        }
        return true;
      });
      expect(callCount).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6700
     * @tc.desc    Verify adding elements during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.every((element, index) => {
        arr.push(0);
        return element > 0;
      });
      expect(result).assertTrue();
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6800
     * @tc.desc    Verify deleting current element during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let iterations: number[] = [];
      arr.every((element, index) => {
        iterations.push(element);
        arr.splice(index, 1);
        return true;
      });
      expect(iterations.length).assertEqual(2);
      expect(iterations[0]).assertEqual(1);
      expect(iterations[1]).assertEqual(3);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_6900
     * @tc.desc    Verify deleting elements with shift affects indexing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      let iterations: GeneratedTypeLiteralInterface_2[] = [];
      arr.every((element, index) => {
        iterations.push({element, index});
        arr.shift();
        return element < 3;
      });
      expect(iterations.length).assertEqual(2);
      expect(iterations[0].element).assertEqual(1);
      expect(iterations[0].index).assertEqual(0);
      expect(iterations[1].element).assertEqual(3);
      expect(iterations[1].index).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7000
     * @tc.desc    Verify array contains Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [Infinity, Infinity];
      const result = arr.every(x => x === Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7100
     * @tc.desc    Verify array contains NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [NaN, NaN];
      const result = arr.every(x => Number.isNaN(x));
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7200
     * @tc.desc    Verify array contains Number.MAX_VALUE and Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [Number.MAX_VALUE, Number.MIN_VALUE];
      const result = arr.every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7300
     * @tc.desc    Verify array contains special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['\n', '\t', '\\'];
      const result = arr.every(x => typeof x === 'string');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7400
     * @tc.desc    Verify array contains Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['你好', '世界', '🌍'];
      const result = arr.every(x => x.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7500
     * @tc.desc    Verify array contains mixed boolean values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true];
      const result = arr.every(x => typeof x === 'boolean');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7600
     * @tc.desc    Verify array contains mixed null and undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (null | undefined)[] = [null, undefined, null];
      const result = arr.every(x => x == null);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7700
     * @tc.desc    Verify array contains function objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Function[] = [() => {}, () => {
      }];
      const result = arr.every(x => typeof x === 'function');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7800
     * @tc.desc    Verify array contains Date objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Date[] = [new Date(), new Date(2020, 1, 1)];
      const result = arr.every(x => x instanceof Date);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest7900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_7900
     * @tc.desc    Verify array contains RegExp objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: RegExp[] = [new RegExp('a'), new RegExp('b'), new RegExp('c')];
      const result = arr.every(x => x instanceof RegExp);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8000
     * @tc.desc    Verify array contains BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: bigint[] = [1n, 2n, 3n];
      const result = arr.every(x => typeof x === 'bigint');
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8100
     * @tc.desc    Verify array contains large BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: bigint[] = [9007199254740991n, 9007199254740992n];
      const result = arr.every(x => x > 9007199254740990n);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8200
     * @tc.desc    Verify array modified to null during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      let count = 0;
      arr.every((x, index, array) => {
        count++;
        if (index === 1) {

        }
        return true;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8300
     * @tc.desc    Verify all strings match format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emails: string[] = ['a@example.com', 'b@example.com', 'c@example.com'];
      const emailRegex = new RegExp('^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$');
      const allValidEmails = emails.every(email => emailRegex.test(email));
      expect(allValidEmails).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8400
     * @tc.desc    Verify permission subset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const userPermissions: string[] = ['read', 'write', 'delete'];
      const requiredPermissions: string[] = ['read', 'write'];
      const hasAllPermissions = requiredPermissions.every(perm => userPermissions.includes(perm));
      expect(hasAllPermissions).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8500
     * @tc.desc    Verify all users are online
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const users: User[] = [
        {id: 1, online: true},
        {id: 2, online: true},
        {id: 3, online: true}
      ];
      const allOnline = users.every(user => user.online);
      expect(allOnline).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8600
     * @tc.desc    Verify all elements are within range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ages: number[] = [18, 25, 30, 45, 60];
      const allAdults = ages.every(age => age >= 18 && age <= 65);
      expect(allAdults).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8700
     * @tc.desc    Verify all elements are arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const allArrays = arr.every(item => Array.isArray(item));
      expect(allArrays).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8800
     * @tc.desc    Verify every() with filter()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const evenNumbers = numbers.filter(n => n % 2 === 0);
      const allEvenPositive = evenNumbers.every(n => n > 0);
      expect(allEvenPositive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest8900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_8900
     * @tc.desc    Verify every() with map()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numbers: number[] = [1, 2, 3, 4, 5];
      const doubled = numbers.map(n => n * 2);
      const allGreaterThanOne = doubled.every(n => n > 1);
      expect(allGreaterThanOne).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest9000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_9000
     * @tc.desc    Verify every() with reduce()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrays: number[][] = [[1, 2], [3, 4], [5, 6]];
      const flattened = arrays.reduce((acc, arr) => acc.concat(arr), [] as number[]);
      const allPositive = flattened.every(n => n > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest9100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_9100
     * @tc.desc    Verify shopping cart checkout
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cart: CartItem[] = [
        {id: 1, name: 'Product 1', inStock: true},
        {id: 2, name: 'Product 2', inStock: true},
        {id: 3, name: 'Product 3', inStock: true}
      ];
      const canCheckout = cart.every(item => item.inStock);
      expect(canCheckout).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEveryTest9200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_EVERY_TEST_9200
     * @tc.desc    Verify form validation combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEveryTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const formFields: FormField[] = [
        {name: 'username', value: 'john_doe', required: true},
        {name: 'email', value: 'john@example.com', required: true},
        {name: 'age', value: '25', required: false}
      ];
      const isValid = formFields.every(field => {
        if (field.required) {
          return field.value !== '' && field.value !== null && field.value !== undefined;
        }
        return true;
      });
      expect(isValid).assertTrue();
    });

  })
}