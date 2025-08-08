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
import { sleep } from '../testability/pages/Utils';

export default function builtinsArrayFilterTest() {
  describe('BuiltinsArrayFilterTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0100
     * @tc.name builtinsArrayFilterTest0100
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number) => element > 2;
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = [3, 4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0101
     * @tc.name builtinsArrayFilterTest0101
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: number[] = [1, 2, 3, 4, 5];
      const callbackFn = (element: number, index: number) => index % 2 === 0;
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = [1, 3, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0102
     * @tc.name builtinsArrayFilterTest0102
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const createCallbackFn = (value: number) => {
        return (element: number) => element > value;
      };
      const callbackFn = createCallbackFn(2);
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [3, 4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0103
     * @tc.name builtinsArrayFilterTest0103
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, , 3];
      const callbackFn = (element: number | undefined) => element !== undefined;
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 3];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0104
     * @tc.name builtinsArrayFilterTest0104
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [];
      const callbackFn = (element: number) => element > 0;
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result)); // 输出结果
      const expectedResult = [];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0105
     * @tc.name builtinsArrayFilterTest0105
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [5];
      const callbackFn = (element: number) => element > 3
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0106
     * @tc.name builtinsArrayFilterTest0106
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number) => element > 10
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0107
     * @tc.name builtinsArrayFilterTest0107
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const indexToRemove = inputArray.indexOf(3);
      if (indexToRemove !== -1) {
        inputArray.splice(indexToRemove, 1);
      }
      const result = inputArray.filter((element) => element > 2);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [4, 5];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0108
     * @tc.name builtinsArrayFilterTest0108
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const callbackFn = (element: number, index: number, arr: number[]) => {
        if (element === 3) {
          arr.push(4);
        }
        return element < 4;
      }
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [1, 2, 3];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0109
     * @tc.name builtinsArrayFilterTest0109
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = ['a', 'b', 'c'];
      const callbackFn = (element: string) => element === 'b'
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = ['b'];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0110
     * @tc.name builtinsArrayFilterTest0110
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Item {
        a: number;
      }
      const inputArray: Item[] = [{
        a: 1
      }, {
        a: 2
      }, {
        a: 3
      }]
      const callbackFn = (element: Item) => element.a > 1
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult: Item[] = [{
        a: 2
      }, {
        a: 3
      }];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0111
     * @tc.name builtinsArrayFilterTest0111
     * @tc.desc Test filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [null, undefined, 3]
      const callbackFn = (element: null | undefined | number) => element !== null;
      const result = inputArray.filter(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = [undefined, 3]
      expect(result).assertDeepEquals(expectedResult);
    });

  })
}
