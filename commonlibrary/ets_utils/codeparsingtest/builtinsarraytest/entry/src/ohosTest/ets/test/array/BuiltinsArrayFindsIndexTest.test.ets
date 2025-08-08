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

export default function builtinsArrayFindIndexTest() {
  describe('BuiltinsArrayFindIndexTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0100
     * @tc.name builtinsArrayFindIndexTest0100
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number) => element > 2;
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = 2;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0101
     * @tc.name builtinsArrayFindIndexTest0101
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayFindIndexTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number, index: number) => index === 2;
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = 2;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0102
     * @tc.name builtinsArrayFindIndexTest0102
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const createCallbackFn = (value: number) => {
        return (element: number) => element > value;
      };
      const callbackFn = createCallbackFn(2); // 传递 value = 2
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 2;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0103
     * @tc.name builtinsArrayFindIndexTest0103
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, , 3];
      const callbackFn = (element: number | undefined) => element !== undefined;
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 0;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0104
     * @tc.name builtinsArrayFindIndexTest0104
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [];
      const callbackFn = (element: number) => element > 0;
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = -1;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0105
     * @tc.name builtinsArrayFindIndexTest0105
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [5];
      const callbackFn = (element: number) => element > 3
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 0;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0106
     * @tc.name builtinsArrayFindIndexTest0106
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number) => element > 10
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = -1;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0107
     * @tc.name builtinsArrayFindIndexTest0107
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: number, index: number, arr: number[]) => {
        if (element === 3) {
          arr.splice(index, 1);
        }
        return element > 2;
      }
      const result = inputArray.findIndex(callbackFn,);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 2;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0108
     * @tc.name builtinsArrayFindIndexTest0108
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const callbackFn = (element: number, index: number, arr: number[]) => {
        if (element === 3) {
          arr.push(4);
        }
        return element < 4;
      }
      const result = inputArray.findIndex(callbackFn,);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 0;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0109
     * @tc.name builtinsArrayFindIndexTest0109
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = ['a', 'b', 'c'];
      const callbackFn = (element: string) => element === 'b'
      const result = inputArray.findIndex(callbackFn,);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 1;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0110
     * @tc.name builtinsArrayFindIndexTest0110
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 1;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0111
     * @tc.name builtinsArrayFindIndexTest0111
     * @tc.desc Test findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFindIndexTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [null, undefined, 3]
      const callbackFn = (element: null | undefined | number) => element !== null;
      const result = inputArray.findIndex(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 1
      expect(result).assertDeepEquals(expectedResult);
    });

  })
}
