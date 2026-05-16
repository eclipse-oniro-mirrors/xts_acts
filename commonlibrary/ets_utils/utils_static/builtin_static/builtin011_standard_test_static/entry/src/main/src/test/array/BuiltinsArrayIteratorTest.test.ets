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

export default function BuiltinsArrayIteratorTest() : void{
  describe("BuiltinsArrayIteratorTest", () => {
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
     * @tc.name    builtinsArrayIteratorTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0100
     * @tc.desc    Verify $_iterator on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayIteratorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const iterator = arr.$_iterator();
      
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIteratorTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0200
     * @tc.desc    Verify $_iterator on non-empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayIteratorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const iterator = arr.$_iterator();
      
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIteratorTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0300
     * @tc.desc    Verify $_iterator with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIteratorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(2, '');
      arr[0] = 'a';
      arr[1] = 'b';
      const iterator = arr.$_iterator();
      
      expect(iterator.next().value).assertEqual('a');
      expect(iterator.next().value).assertEqual('b');
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIteratorTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0400
     * @tc.desc    Verify $_iterator with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIteratorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const arr: Record<string, string>[] = [obj1, obj2];
      const iterator = arr.$_iterator();
      
      expect(iterator.next().value).assertDeepEquals(obj1);
      expect(iterator.next().value).assertDeepEquals(obj2);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIteratorTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0500
     * @tc.desc    Verify $_iterator using for...of loop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIteratorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(4, NaN);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const values: number[] = [];
      
      for (const value of arr) {
        values.push(value);
      }
      
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(values[3]).assertEqual(40);
    });

    /**
     * @tc.name    builtinsArrayIteratorTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_ITERATOR_TEST_0600
     * @tc.desc    Verify $_iterator return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIteratorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, NaN);
      const iterator = arr.$_iterator();

      expect(iterator !== undefined && iterator !== null).assertTrue();
      expect(typeof iterator.next).assertEqual('function');
    });
  })
}