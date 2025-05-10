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
import { MyArray } from '../../testability/pages/MyArry';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayFromTest() {
  describe('BuiltinsArrayFromTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0100
     * @tc.name builtinsArrayFromTest0100
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map([
        [1, 'a'],
        [2, 'b'],
      ]);
      const result: Array<[number, string]> = Array.from(map);
      const expectedResult = [[1, 'a'], [2, 'b']];
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0101
     * @tc.name builtinsArrayFromTest0101
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = (num: number) => num * 2;
      const result = Array.from(inputArray, mapFn);
      const expectedResult = [2, 4, 6];
      expect(result).assertDeepEquals(expectedResult);

    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0102
     * @tc.name builtinsArrayFromTest0102
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = (num: number) => {
        return num * 2;
      };
      const result = Array.from(inputArray, mapFn);
      const expectedResult = [2, 4, 6];
      expect(result).assertDeepEquals(expectedResult);

    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0103
     * @tc.name builtinsArrayFromTest0103
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArray = [1, 2, 3];
      const customArr = Array.from(originalArray, () => new MyArray());
      customArr.forEach(element => {
        const result = element instanceof MyArray;
        expect(result).assertTrue()
      });
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0104
     * @tc.name builtinsArrayFromTest0104
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputArray = [1, 2, 3];
      const mapFn = () => undefined;
      const result = Array.from(inputArray, mapFn);
      expect(result).assertDeepEquals([undefined, undefined, undefined]);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0105
     * @tc.name builtinsArrayFromTest0105
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0107
     * @tc.name builtinsArrayFromTest0107
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string[] = Array.from('undefined');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["u", "n", "d", "e", "f", "i", "n", "e", "d"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0108
     * @tc.name builtinsArrayFromTest0108
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string[] = Array.from('null');
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["n", "u", "l", "l"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0109
     * @tc.name builtinsArrayFromTest0109
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const unicodeCodePoint = 0x1F60A;
      const char = String.fromCodePoint(unicodeCodePoint);
      const result = Array.from(char);
      console.log('result:', JSON.stringify(result));
      const expectedResult = ["\ud83d", "\ude0a"]
      expect(result).assertDeepEquals(expectedResult);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FROM_TEST_0110
     * @tc.name builtinsArrayFromTest0110
     * @tc.desc Test with method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFromTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inputString = 'a\uD800b\uD800\uDC00c';
      const result = Array.from(inputString);
      const expectedResult = ["a", "\ud800", "b", "\ud800", "\udc00", "c"]
      expect(result).assertDeepEquals(expectedResult);
    });
  })
}
