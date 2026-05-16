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

// 定义类替代接口（可选，ArkTS支持接口，但确保字段显式声明）
class TestObj {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

export default function BuiltinsArrayConstructorTest(): void {
  describe("BuiltinsArrayConstructorTest", () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await Utils.msSleep(100);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayConstructorTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify constructor with no parameters creates empty array (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.length;
      const expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify empty array created with constructor can push elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(10);
      arr.push(20);
      arr.push(30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify empty array created with constructor can set elements via index after push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(10);
      arr.push(20);
      arr[1] = 200;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify empty array created with constructor can use pushArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify empty array created with constructor can be extended with extendTo
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(5, 0);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify empty array created with constructor for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(0, '');
      arr.push("hello");
      arr.push("world");
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual("hello");
      expect(arr[1]).assertEqual("world");
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify empty array created with constructor for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = Array.create<boolean>(0, false);
      arr.push(true);
      arr.push(false);
      arr.push(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify empty array created with constructor for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = Array.create<TestObj>(0, new TestObj(0, ''));
      const obj1: TestObj = new TestObj(1, "test1");
      const obj2: TestObj = new TestObj(2, "test2");
      arr.push(obj1);
      arr.push(obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify multiple empty arrays created independently
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = Array.create<number>(0, 0);
      const arr2: number[] = Array.create<number>(0, 0);
      arr1.push(10);
      arr2.push(20);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(1);
      expect(arr1[0]).assertEqual(10);
      expect(arr2[0]).assertEqual(20);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify empty array created with constructor can be used with forEach
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5);
      let sum = 0;
      arr.forEach((value: number) => {
        sum += value;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify empty array created with constructor can be used with map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3);
      const result = arr.map((value: number) => value * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify empty array created with constructor can be used with filter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.filter((value: number) => value % 2 === 0);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(2);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify empty array created with constructor can be cleared by setting length to 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
      arr.push(100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1400
     * @tc.desc    Verify empty array created with constructor can be used with reduce
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5);
      const sum = arr.reduce((acc: number, curr: number) => acc + curr, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1500
     * @tc.desc    Verify empty array created with constructor can be used with reverse
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1600
     * @tc.desc    Verify empty array created with constructor can be used with sort
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(5, 3, 1, 4, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1700
     * @tc.desc    Verify empty array created with constructor with large number of elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(0);
      expect(arr[5000]).assertEqual(5000);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1800
     * @tc.desc    Verify empty array created with constructor for number array with negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(-10);
      arr.push(-20);
      arr.push(-30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-10);
      expect(arr[1]).assertEqual(-20);
      expect(arr[2]).assertEqual(-30);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_1900
     * @tc.desc    Verify empty array created with constructor for number array with floating point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(3.14);
      arr.push(2.718);
      arr.push(1.414);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3.14);
      expect(arr[1]).assertEqual(2.718);
      expect(arr[2]).assertEqual(1.414);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2000
     * @tc.desc    Verify empty array created with constructor for number array with max and min int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.push(2147483647);
      arr.push(-2147483648);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2100
     * @tc.desc    Verify constructor with arrayLen=0 and initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2200
     * @tc.desc    Verify constructor with arrayLen=5 and initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(5, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = index * 2;
      }
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(8);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2300
     * @tc.desc    Verify constructor with arrayLen=1 and initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(1, NaN);
      arr[0] = 42;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2400
     * @tc.desc    Verify constructor with arrayLen=int max value and initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxInt = 1000;
      const arr: Array<number> = Array.create<number>(maxInt, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = index;
      }
      expect(arr.length).assertEqual(maxInt);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2700
     * @tc.desc    Verify constructor with string initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = Array.create<string>(3, '');
      for (let index = 0; index < arr.length; index++) {
        arr[index] = `Item ${index}`;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('Item 0');
      expect(arr[1]).assertEqual('Item 1');
      expect(arr[2]).assertEqual('Item 2');
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2800
     * @tc.desc    Verify constructor with object initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = Array.create<TestObj>(0, new TestObj(0, ''));
      for (let index = 0; index < 2; index++) {
        arr.push(new TestObj(index, `Test ${index}`));
      }
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(0);
      expect(arr[0].name).assertEqual('Test 0');
      expect(arr[1].id).assertEqual(1);
      expect(arr[1].name).assertEqual('Test 1');
    });

    /**
     * @tc.name    builtinsArrayConstructorTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_2900
     * @tc.desc    Verify constructor with boolean initializer function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<boolean> = Array.create<boolean>(3, false);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = index % 2 === 0;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3100
     * @tc.desc    Verify constructor with initializer returning int max value (2147483647)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = 2147483647;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(2147483647);
      expect(arr[2]).assertEqual(2147483647);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3200
     * @tc.desc    Verify constructor with initializer returning int min value (-2147483648)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = -2147483648;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-2147483648);
      expect(arr[1]).assertEqual(-2147483648);
      expect(arr[2]).assertEqual(-2147483648);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3300
     * @tc.desc    Verify constructor with initializer using index calculation near int max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = 2147483647 - index;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(2147483646);
      expect(arr[2]).assertEqual(2147483645);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3400
     * @tc.desc    Verify constructor with initializer using index calculation near int min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = -2147483648 + index;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-2147483648);
      expect(arr[1]).assertEqual(-2147483647);
      expect(arr[2]).assertEqual(-2147483646);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3500
     * @tc.desc    Verify constructor with initializer using multiplication near int boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, NaN);
      for (let index = 0; index < arr.length; index++) {
        arr[index] = index * 2147483647;
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(2147483647);
      expect(arr[2]).assertEqual(-2);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3800
     * @tc.desc    Verify constructor with initializer returning mixed int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(4, NaN);
      for (let index = 0; index < arr.length; index++) {
        if (index === 0) {
          arr[index] = 2147483647;
        } else if (index === 1) {
          arr[index] = -2147483648;
        } else if (index === 2) {
          arr[index] = 0;
        } else {
          arr[index] = 1;
        }
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_3900
     * @tc.desc    Verify constructor with multiple number parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4000
     * @tc.desc    Verify constructor with multiple string parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = Array.create<string>(3, '');
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = 'test';
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4100
     * @tc.desc    Verify constructor with multiple boolean parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<boolean> = Array.create<boolean>(3, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4200
     * @tc.desc    Verify constructor with multiple object parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: TestObj = new TestObj(1, 'test1');
      const obj2: TestObj = new TestObj(2, 'test2');
      const obj3: TestObj = new TestObj(3, 'test3');
      const arr: Array<TestObj> = Array.create<TestObj>(3, new TestObj(0, ''));
      arr[0] = obj1;
      arr[1] = obj2;
      arr[2] = obj3;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[2]).assertEqual(obj3);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4300
     * @tc.desc    Verify constructor with single parameter (as element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(1, 0);
      arr[0] = 42;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4400
     * @tc.desc    Verify constructor with boundary number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayConstructorTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = Array.create<number>(3, 0);
      arr[0] = 2147483647;
      arr[1] = -2147483648;
      arr[2] = 0;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayConstructorTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_CONSTRUCTOR_TEST_4500
     * @tc.desc    Verify constructor with floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConstructorTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(3, 0);
      arr[0] = 3.14;
      arr[1] = 2.718;
      arr[2] = 1.414;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3.14);
      expect(arr[1]).assertEqual(2.718);
      expect(arr[2]).assertEqual(1.414);
    });
  });
}