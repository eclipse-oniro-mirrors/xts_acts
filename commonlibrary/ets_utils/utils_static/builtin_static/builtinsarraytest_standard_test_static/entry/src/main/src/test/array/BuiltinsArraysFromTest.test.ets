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

export default function builtinsArrayFromTest() {
  describe('BuiltinsArrayFromTest', () => {
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
     * @tc.name   builtinsArrayFromTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0100
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFromTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const map: Map<number, string> = new Map<number, string>([
        [1, 'a'],
        [2, 'b'],
      ]);
      const result: Array<[number, string]> = Array.from(map);
      const expectedResult = [[1, 'a'], [2, 'b']];
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
    });

    /**
     * @tc.name   builtinsArrayFromTest0101
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0101
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = (num: int) => num * 2;
      const result = Array.from(inputArray, mapFn);
      const expectedResult = [2, 4, 6];
      expect(result).assertDeepEquals(expectedResult);

    });

    /**
     * @tc.name   builtinsArrayFromTest0102
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0102
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = (num: int) => {
        return num * 2;
      };
      const result = Array.from(inputArray, mapFn);
      const expectedResult = [2, 4, 6];
      expect(result).assertDeepEquals(expectedResult);

    });

    /**
     * @tc.name   builtinsArrayFromTest0104
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0104
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = () => undefined;
      const result = Array.from(inputArray, mapFn);
      expect(result).assertDeepEquals([undefined, undefined, undefined]);
    })

    /**
     * @tc.name   builtinsArrayFromTest0105
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0105
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Array.from('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      console.log('result:', JSON.stringify(result));
      const expectedResult =
        ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-",
          ".", "/", ":", ";", "<", "=", ">", "?", "@",
          "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFromTest0107
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0107
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string[] = Array.from('undefined');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["u", "n", "d", "e", "f", "i", "n", "e", "d"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.name   builtinsArrayFromTest0108
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0108
     * @tc.desc   Test with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFromTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string[] = Array.from('null');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["n", "u", "l", "l"]
      expect(result).assertDeepEquals(expectedResult);
    });
  })
}
