/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayFillTest() {
  describe('BuiltinsArrayFillTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   builtinsArrayFillTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0100
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFillTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0);
      console.log('result:', JSON.stringify(result))
      const expectedResult = [0, 0, 0, 0, 0];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0101
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0101
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFillTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, 1);
      console.log('result:', JSON.stringify(result))
      const expectedResult = [1, 0, 0, 0, 0];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0102
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0102
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFillTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, 1, 3);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 0, 0, 4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0103
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0103
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, -2);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 0, 0];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0104
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0104
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, -3, -1);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 0, 0, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0105
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0105
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, 5);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0106
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0106
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const result = inputArray.fill(0, 1, 10);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 0, 0, 0, 0];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0107
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0107
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: (number | string)[] = [1, 2, 3, 4, 5];
      const result = inputArray.fill('x', 1, 3);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 'x', 'x', 4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0108
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0108
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Item {
        a: number;
      }
      const inputArray: Item[] = [{
        a: 1
      }, {
        a: 2
      }, {
        a: 3
      }, {
        a: 4
      }, {
        a: 5
      }];
      const obj: Item = {
        a: 1
      };
      const result = inputArray.fill(obj);
      const expectedResult: Item[] = [{
        a: 1
      }, {
        a: 1
      }, {
        a: 1
      }, {
        a: 1
      }, {
        a: 1
      }];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0109
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0109
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface EmptyObject {
      }
      const inputArray: EmptyObject[] = [{}, {}, {}, {}, {}];
      const obj: EmptyObject = {};
      const result = inputArray.fill(obj);
      console.log('result:', JSON.stringify(result));
      const expectedResult: EmptyObject[] = [{}, {}, {}, {}, {}];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0110
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0110
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, 0);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [0, 0, 0, 0, 0];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0111
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0111
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, 0, 5);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [0, 0, 0, 0, 0]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0112
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0112
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, 2, 2);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 4, 5]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0113
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0113
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, 3, 2);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 4, 5]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0114
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0114
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, -10, -5);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 4, 5]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0115
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0115
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(0, NaN, NaN);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3, 4, 5]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0116
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0116
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5]
      const result = inputArray.fill(-0);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [-0, -0, -0, -0, -0]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0117
     * @tc.number builtinsArrayFillTest0117
     * @tc.desc   builtinsArrayFillTest0117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: undefined[] = new Array(3);
      const result: undefined[] = arr.fill(undefined);
      const expectedResult = [undefined, undefined, undefined];
      expect(result).assertDeepEquals(expectedResult);
    });


    /**
     * @tc.name   builtinsArrayFillTest0118
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0118
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: null[] = new Array(3);
      const result: null[] = inputArray.fill(null);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [null, null, null]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFillTest0119
     * @tc.number SUB_BUILTINS_ARRAY_FILL_TEST_0119
     * @tc.desc   Test fill method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFillTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1];
      const result = inputArray.fill(NaN);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [NaN];
      expect(result.toString()).assertEqual(expectedResult.toString());
    });

    /**
     * @tc.name   builtinsArrayWithTest0120
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0120
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(1);
      const result: string[] = inputArray.fill('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      console.log('resultwith:', JSON.stringify(result));
      const expectedResult = ["!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0121
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0121
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(3);
      const result = inputArray.fill('undefined');
      console.log('result11:', JSON.stringify(result));
      const expectedResult = ['undefined', 'undefined', 'undefined']
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0122
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0122
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(3);
      const result = inputArray.fill('null');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["null", "null", "null"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0123
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0123
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(3);
      const result = inputArray.fill('');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["", "", ""]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0124
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0124
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(3);
      const unicodeCodePoint = 0x1F60A;
      const char = String.fromCodePoint(unicodeCodePoint);
      const result: string[] = inputArray.fill(char);
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["😊", "😊", "😊"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0125
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0125
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: string[] = new Array(3);
      try {
        const char = String.fromCodePoint(0x110000)
        const result: string[] = inputArray.fill(char);
        console.log('result:', JSON.stringify(char));
      } catch (e) {
        console.log('result11:', e);
        expect(e instanceof RangeError).assertTrue();
      }
    });


    /**
     * @tc.name   builtinsArrayWithTest0126
     * @tc.number builtinsArrayWithTest0126
     * @tc.desc   builtinsArrayWithTest0126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array(3);
      const specialNumbers = [
        Math.floor(1.5),
        0,
        -0,
      ];
      specialNumbers.forEach((value) => {
        const result = arr.fill(value);
        expect(result).assertDeepEquals([value, value, value]);
        expect(arr).assertDeepEquals([value, value, value]);
      });
    });

    // /**
    //  * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0127
    //  * @tc.name builtinsArrayWithTest0127
    //  * @tc.desc Test with method
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    /**
     * @tc.name   builtinsArrayWithTest0127
     * @tc.number builtinsArrayWithTest0127
     * @tc.desc   builtinsArrayWithTest0127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array(5);
      const specialNumbers = [
        Number.EPSILON,
        Number.MIN_VALUE,
        Number.MAX_VALUE,
        -Infinity,
        Infinity,
      ];
      specialNumbers.forEach((value) => {
        const result = arr.fill(value);
        expect(result).assertDeepEquals([value, value, value, value, value]);
      })
    });

    /**
     * @tc.name   builtinsArrayWithTest0128
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0128
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array(5);
      const specialNumbers = [
        123.456,
        0xcafebabe,
        0x0102,
        0x01020304,
        0x3,
      ];
      specialNumbers.forEach((value) => {
        const result = arr.fill(value);
        expect(result).assertDeepEquals([value, value, value, value, value]);
      });
    });

    /**
     * @tc.name   builtinsArrayWithTest0129
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0129
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: boolean[] = new Array(3);
      const result = inputArray.fill(true);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [true, true, true]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0130
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0130
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: boolean[] = new Array(3);
      const result = inputArray.fill(false);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [false, false, false]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0131
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0131
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: boolean[] = new Array(3);
      const result = inputArray.fill(!'s');
      console.log('result:', JSON.stringify(result));
      const expectedResult = [false, false, false]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0132
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_013
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: boolean[] = new Array(3);
      const result = inputArray.fill(!0);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [true, true, true]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayWithTest0133
     * @tc.number SUB_BUILTINS_ARRAY_WITH_TEST_0133
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayWithTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array(3);
      const result = arr.fill(NaN);
      expect(result).assertDeepEquals([NaN, NaN, NaN]);
    });
  })
}