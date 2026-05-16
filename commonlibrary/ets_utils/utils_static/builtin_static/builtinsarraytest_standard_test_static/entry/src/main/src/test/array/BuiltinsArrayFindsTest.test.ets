/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

interface Item {
  a: number;
}

export default function builtinsArrayFindTest() {
  describe('BuiltinsArrayFindTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   builtinsArrayFindTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0100
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFindTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: int) => element > 2;
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = 3;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0101
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0101
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: int, index: int) => index === 2;
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result))
      const expectedResult = 3;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0102
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0102
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const createCallbackFn = (value: int) => {
        return (element: int) => element > value;
      };
      const callbackFn = createCallbackFn(2);
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 3;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0103
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0103
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: (number | undefined)[] = [1, undefined, 3];
      const callbackFn = (element: number | undefined) => element !== undefined;
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 1;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0104
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0104
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: number[] = [];
      const callbackFn = (element: number) => element > 0;
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = undefined;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFindTest0105
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0105
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [5];
      const callbackFn = (element: int) => element > 3
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 5;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0106
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0106
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const callbackFn = (element: int) => element > 10
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = undefined;
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFindTest0107
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0107
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3, 4, 5];
      const indexToRemove = inputArray.indexOf(3);
      if (indexToRemove !== -1) {
        inputArray.splice(indexToRemove, 1);
      }
      const result = inputArray.find((element) => element > 2,);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 4;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0108
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0108
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const callbackFn = (element: int, index: int, arr: int[]) => {
        if (element === 3) {
          arr.push(4);
        }
        return element < 4;
      }
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 1;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFindTest0109
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0109
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = ['a', 'b', 'c'];
      const callbackFn = (element: string) => element === 'b'
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = 'b';
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFindTest0110
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0110
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: Item[] = [{
        a: 1
      }, {
        a: 2
      }, {
        a: 3
      }]
      const callbackFn = (element: Item) => element.a > 1
      const result = inputArray.find(callbackFn,);
      console.log('result:', JSON.stringify(result));
      const expectedResult: Item = {
        a: 2
      };
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFindTest0111
     * @tc.number SUB_BUILTINS_ARRAY_FIND_TEST_0111
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFindTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray: (null | undefined | number)[] = [null, undefined, 3]
      const callbackFn = (element: null | undefined | number) => element == null;
      const result = inputArray.find(callbackFn);
      console.log('result:', JSON.stringify(result));
      const expectedResult = null
      expect(result).assertEqual(expectedResult);
    });

  })
}
