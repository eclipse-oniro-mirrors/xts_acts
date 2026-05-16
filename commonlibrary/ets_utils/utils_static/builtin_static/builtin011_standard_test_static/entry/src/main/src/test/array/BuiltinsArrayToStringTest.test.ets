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
type MixedType = number | string | boolean;
export default function BuiltinsArrayToStringTest() : void{
  describe("BuiltinsArrayToStringTest", () => {
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
     * @tc.name    builtinsArrayToStringTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0100
     * @tc.desc    Verify toString on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToStringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toString();

      expect(result).assertEqual('');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0200
     * @tc.desc    Verify toString on array with numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.toString();

      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0300
     * @tc.desc    Verify toString on array with strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(3, '');
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = 'test';

      const result = arr.toString();

      expect(result).assertEqual('hello,world,test');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0400
     * @tc.desc    Verify toString on array with booleans
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<boolean>(3, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;

      const result = arr.toString();

      expect(result).assertEqual('true,false,true');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0500
     * @tc.desc    Verify toString on array with mixed types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: MixedType[] = Array.create<MixedType>(4, 0);
      arr[0] = 1;
      arr[1] = 'string';
      arr[2] = true;
      arr[3] = 3.14;

      const result = arr.toString();

      expect(result).assertEqual('1,string,true,3.14');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0600
     * @tc.desc    Verify toString on array with single element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);
      const result = arr.toString();
      expect(result).assertEqual('42');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0700
     * @tc.desc    Verify toString on array with undefined and null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined | null)[] = Array.create<number | undefined | null>(5, 0);
      arr[0] = 1;
      arr[1] = undefined;
      arr[2] = 3;
      arr[3] = null;
      arr[4] = 5;

      const result = arr.toString();

      expect(result).assertEqual('1,,3,,5');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0800
     * @tc.desc    Verify toString on array with empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(3, '');
      arr[0] = 'hello';
      arr[1] = '';
      arr[2] = 'world';

      const result = arr.toString();

      expect(result).assertEqual('hello,,world');
    });

    /**
     * @tc.name    builtinsArrayToStringTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_0900
     * @tc.desc    Verify toString on array with int max and min values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToStringTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 2147483647;
      arr[1] = -2147483648;
      arr[2] = 0;

      const result = arr.toString();

      expect(result).assertEqual('2147483647,-2147483648,0');
    });

    /**
     * @tc.name    builtinsArrayToStringTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_1000
     * @tc.desc    Verify toString on array with floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1.1;
      arr[1] = 2.22;
      arr[2] = 3.333;

      const result = arr.toString();

      expect(result).assertEqual('1.1,2.22,3.333');
    });

    /**
     * @tc.name    builtinsArrayToStringTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_1100
     * @tc.desc    Verify toString on array with negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = -1;
      arr[1] = -2;
      arr[2] = -3;

      const result = arr.toString();

      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.name    builtinsArrayToStringTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_TOSTRING_TEST_1200
     * @tc.desc    Verify toString on array with large number of elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToStringTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      for (let i = 0; i < 100; i++) {
        arr.pushOne(i);
      }

      const result = arr.toString();
      let expected = '';
      for (let i = 0; i < 100; i++) {
        expected += i;
        if (i < 99) {
          expected += ',';
        }
      }

      expect(result).assertEqual(expected);
    });

  })
}