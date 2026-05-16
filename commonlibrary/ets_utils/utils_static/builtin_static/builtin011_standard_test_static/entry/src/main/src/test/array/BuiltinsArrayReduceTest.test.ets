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

export default function BuiltinsArrayReduceTest(): void {
  describe('BuiltinsArrayReduceTest', () => {
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
     * @tc.name    builtinsArrayReduceTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0100
     * @tc.desc    Verify reduce without initial value - sum of numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReduceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.reduce((previousValue: number, currentValue: number, index: int, array: Array<number>): number => {
        return previousValue + currentValue;
      });
      const expected = 15;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0200
     * @tc.desc    Verify reduce without initial value - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(10);

      const result = arr.reduce((previousValue: number, currentValue: number, index: int, array: Array<number>): number => {
        return previousValue + currentValue;
      });
      const expected = 10;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0300
     * @tc.desc    Verify reduce with initial value - sum of numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.reduce((previousValue: number, currentValue: number, index: int, array: Array<number>): number => {
        return previousValue + currentValue;
      }, 10);
      const expected = 25;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0400
     * @tc.desc    Verify reduce with initial value - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.reduce((previousValue: number, currentValue: number, index: int, array: Array<number>): number => {
        return previousValue + currentValue;
      }, 0);
      const expected = 0;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0500
     * @tc.desc    Verify reduce with initial value - concatenate strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['Hello', ' ', 'World', '!'];

      const result = arr.reduce((previousValue: string, currentValue: string, index: int, array: Array<string>): string => {
        return previousValue + currentValue;
      }, '');
      const expected = 'Hello World!';

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0600
     * @tc.desc    Verify reduce with initial value - different type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.reduce((previousValue: string, currentValue: number, index: int, array: Array<number>): string => {
        return previousValue + currentValue.toString();
      }, 'Numbers: ');
      const expected = 'Numbers: 12345';

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCE_TEST_0700
     * @tc.desc    Verify reduce with initial value - accumulate into object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];

      const result = arr.reduce((previousValue: Record<string, number>, currentValue: string, index: int, array: Array<string>): Record<string, number> => {
        previousValue[currentValue] = index;
        return previousValue;
      }, {});

      expect(result['a']).assertEqual(0);
      expect(result['b']).assertEqual(1);
      expect(result['c']).assertEqual(2);
    });
  });
}
