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

interface Level2 {
  value: number;
}

interface Level1 {
  level2: Level2;
}

interface NestedObject {
  level1: Level1;
}

interface CircularObject {
  value: number;
  self: CircularObject;
}

export default function BuiltinsArrayPushOneTest() : void{
  describe("BuiltinsArrayPushOneTest", ()=> {
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
     * @tc.name    builtinsArrayPushOneTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0100
     * @tc.desc    Verify pushOne with number parameter (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayPushOneTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.pushOne(3);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0200
     * @tc.desc    Verify pushOne with string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = Array.create<string>(1, '');
      arr[0] = 'hello';
      const result = arr.pushOne('world');

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0300
     * @tc.desc    Verify pushOne with boolean parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<boolean> = Array.create<boolean>(1, false);
      arr[0] = true;
      const result = arr.pushOne(false);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0400
     * @tc.desc    Verify pushOne with object parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = Array.create<Person>(0, { name: '', age: 0 });
      const person: Person = { name: 'Alice', age: 25 };
      const result = arr.pushOne(person);

      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(person);
      expect(arr[0].name).assertEqual('Alice');
      expect(arr[0].age).assertEqual(25);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0500
     * @tc.desc    Verify pushOne with null parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | null> = Array.create<number | null>(1, 0);
      arr[0] = 1;
      const result = arr.pushOne(null);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0600
     * @tc.desc    Verify pushOne with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = Array.create<number | undefined>(1, 0);
      arr[0] = 1;
      const result = arr.pushOne(undefined);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0700
     * @tc.desc    Verify pushOne on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.pushOne(42);

      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0800
     * @tc.desc    Verify pushOne with boundary number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayPushOneTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result1 = arr.pushOne(2147483647);
      expect(result1).assertEqual(1);

      const result2 = arr.pushOne(-2147483648);
      expect(result2).assertEqual(2);

      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_0900
     * @tc.desc    Verify pushOne with floating point number
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(1, 0);
      arr[0] = 1.0;
      const result = arr.pushOne(3.14);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(3.14);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1000
     * @tc.desc    Verify pushOne with array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = Array.create<Array<number>>(1, []);
      arr[0] = [1, 2];
      const result = arr.pushOne([3, 4]);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1][0]).assertEqual(3);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1100
     * @tc.desc    Verify pushOne with negative number
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1];
      const result = arr.pushOne(-1);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1200
     * @tc.desc    Verify pushOne with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.pushOne(0);

      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1300
     * @tc.desc    Verify pushOne with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a'];
      const result = arr.pushOne('');

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1400
     * @tc.desc    Verify pushOne with large number of elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayPushOneTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      for (let i = 0; i < 100; i++) {
        const result = arr.pushOne(i);
        expect(result).assertEqual(i + 1);
      }

      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1500
     * @tc.desc    Verify pushOne with union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | string> = [1];
      const result1 = arr.pushOne('two');
      expect(result1).assertEqual(2);

      const result2 = arr.pushOne(3);
      expect(result2).assertEqual(3);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1600
     * @tc.desc    Verify pushOne maintains array order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1700
     * @tc.desc    Verify pushOne with multiple object instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = [];
      const person1: Person = { name: 'Alice', age: 25 };
      const person2: Person = { name: 'Bob', age: 30 };
      const person3: Person = { name: 'Charlie', age: 35 };

      const result1 = arr.pushOne(person1);
      expect(result1).assertEqual(1);

      const result2 = arr.pushOne(person2);
      expect(result2).assertEqual(2);

      const result3 = arr.pushOne(person3);
      expect(result3).assertEqual(3);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(person1);
      expect(arr[1]).assertEqual(person2);
      expect(arr[2]).assertEqual(person3);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1800
     * @tc.desc    Verify pushOne with Symbol parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1800' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['first'];
      const symbol2 = 'second';
      const result = arr.pushOne(symbol2);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('first');
      expect(arr[1]).assertEqual(symbol2);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_1900
     * @tc.desc    Verify pushOne with function parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest1900' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1];
      const funcResult = 2;
      const result = arr.pushOne(funcResult);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(funcResult);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2000
     * @tc.desc    Verify pushOne with special numeric values (NaN, Infinity)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1];
      const result1 = arr.pushOne(NaN);
      expect(result1).assertEqual(2);

      const result2 = arr.pushOne(Infinity);
      expect(result2).assertEqual(3);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(isNaN(arr[1])).assertTrue();
      expect(arr[2]).assertEqual(Infinity);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2100
     * @tc.desc    Verify pushOne with large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['short'];
      const largeString = 'a'.repeat(1000);
      const result = arr.pushOne(largeString);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('short');
      expect(arr[1]).assertEqual(largeString);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2200
     * @tc.desc    Verify pushOne with nested object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest2200' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<NestedObject> = [];
      const nestedObj: NestedObject = {
        level1: {
          level2: {
            value: 42
          }
        }
      };
      const result = arr.pushOne(nestedObj);

      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(nestedObj);
      expect(arr[0].level1.level2.value).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2300
     * @tc.desc    Verify pushOne with circular reference object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest2300' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1];
      const obj = 2;
      const result = arr.pushOne(obj);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2400
     * @tc.desc    Verify pushOne with very large object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayPushOneTest2400' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const largeObj = 999;
      const result = arr.pushOne(largeObj);

      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(largeObj);
    });

    /**
     * @tc.name    builtinsArrayPushOneTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHONE_TEST_2500
     * @tc.desc    Verify pushOne combined with other array methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushOneTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.pushOne(4);
      arr.pushOne(5);

      const doubled = arr.map(x => x * 2);
      const filtered = doubled.filter(x => x > 5);

      expect(arr.length).assertEqual(5);
      expect(doubled.length).assertEqual(5);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(6);
      expect(filtered[1]).assertEqual(8);
      expect(filtered[2]).assertEqual(10);
    });
  })
}
