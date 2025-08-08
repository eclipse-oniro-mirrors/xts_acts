/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function getIterator(s: string) {
  return s[Symbol.iterator]();
}

export default function builtinsStringPrototypeTest() {
  describe('builtinsStringPrototypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0101
     * @tc.name builtinsStringPrototypeTest0101
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0101";
        console.info(`${caseName}, test start`);
        const input = "Mozilla";
        const expected = 7;
        const actual = input.length;
        const TAG = 'StringLengthTest';
        console.info(TAG, `Testing string: ${input}`);
        console.info(TAG, `Expected length: ${expected}, Actual length: ${actual}`);
        expect(actual).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0102
     * @tc.name builtinsStringPrototypeTest0102
     * @tc.desc execute sendable function
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0102";
        console.info(`${caseName}, test start`);
        const input = "";
        const expected = 0;
        const actual = input.length;
        const TAG = 'StringLengthTest';
        console.info(TAG, `Testing string: ${input}`);
        console.info(TAG, `Expected length: ${expected}, Actual length: ${actual}`);
        expect(actual).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0103
     * @tc.name builtinsStringPrototypeTest0103
     * @tc.desc Test string iteration using for...of loop with surrogate pairs
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0103";
        console.info(`${caseName}, test start`);
        const str = "A\uD835\uDC68B\uD835\uDC69C\uD835\uDC6A";
        const expected = ["A", "\uD835\uDC68", "B", "\uD835\uDC69", "C", "\uD835\uDC6A"];
        const actual: string[] = [];
        for (const v of str) {
          actual.push(v);
        }
        console.info(`Input string: ${str}`);
        console.info(`Expected iteration result: ${JSON.stringify(expected)}`);
        console.info(`Actual iteration result: ${JSON.stringify(actual)}`);
        expect(actual.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(actual[i]).assertEqual(expected[i]);
        }
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0104
     * @tc.name builtinsStringPrototypeTest0104
     * @tc.desc Test manual string iteration using Symbol.iterator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0104";
        console.info(`${caseName}, test start`);
        const str = "A\uD835\uDC68";
        const strIter = getIterator(str);
        const firstIter = strIter.next();
        console.info(`First iteration: value=${firstIter.value}, done=${firstIter.done}`);
        expect(firstIter.value).assertEqual("A");
        expect(firstIter.done).assertFalse();
        const secondIter = strIter.next();
        console.info(`Second iteration: value=${secondIter.value}, done=${secondIter.done}`);
        expect(secondIter.value).assertEqual("\uD835\uDC68");
        expect(secondIter.done).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0105
     * @tc.name builtinsStringPrototypeTest0105
     * @tc.desc Test String.prototype.trim()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0105";
        console.info(`${caseName}, test start`);
        const input = "   foo  ";
        const expected = "foo";
        const actual = input.trim();
        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0106
     * @tc.name builtinsStringPrototypeTest0106
     * @tc.desc Test String.prototype.trimEnd()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0106";
        console.info(`${caseName}, test start`);
        const input = "   foo  ";
        const expected = "   foo";
        const actual = input.trimEnd();
        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0107
     * @tc.name builtinsStringPrototypeTest0107
     * @tc.desc Test String.prototype.trimStart()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0107";
        console.info(`${caseName}, test start`);
        const input = "   foo  ";
        const expected = "foo  ";
        const actual = input.trimStart();
        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0108
     * @tc.name builtinsStringPrototypeTest0108
     * @tc.desc Test String.prototype.valueOf()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0108";
        console.info(`${caseName}, test start`);
        const input = new String("Hello world");
        const expected = "Hello world";
        const actual = input.valueOf();
        console.info(`Input type: ${typeof input}`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual("string");
        expect(input instanceof String).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0109
     * @tc.name builtinsStringPrototypeTest0109
     * @tc.desc Test String.prototype.toLocaleLowerCase()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0109";
        console.info(`${caseName}, test start`);

        const input = "ALPHABET";
        const expected = "alphabet";
        const actual = input.toLocaleLowerCase();

        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(input.length);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0110
     * @tc.name builtinsStringPrototypeTest0110
     * @tc.desc Test String.prototype.toLocaleUpperCase()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0110";
        console.info(`${caseName}, test start`);

        const input = "alphabet";
        const expected = "ALPHABET";
        const actual = input.toLocaleUpperCase();

        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(input.length);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0111
     * @tc.name builtinsStringPrototypeTest0111
     * @tc.desc Test String.prototype.toLowerCase()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0111";
        console.info(`${caseName}, test start`);

        const input = "ALPHABET";
        const expected = "alphabet";
        const actual = input.toLowerCase();

        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(input.length);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0112
     * @tc.name builtinsStringPrototypeTest0112
     * @tc.desc Test String.prototype.toString()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0112";
        console.info(`${caseName}, test start`);

        const input = new String("Hello world");
        const expected = "Hello world";
        const actual = input.toString();

        console.info(`Input type: ${typeof input}`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual("string");
        expect(input instanceof String).assertTrue();

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0113
     * @tc.name builtinsStringPrototypeTest0113
     * @tc.desc Test String.prototype.toUpperCase()
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0113";
        console.info(`${caseName}, test start`);

        const input = "alphabet";
        const expected = "ALPHABET";
        const actual = input.toUpperCase();

        console.info(`Input: "${input}"`);
        console.info(`Expected: "${expected}", Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(input.length);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0114
     * @tc.name builtinsStringPrototypeTest0114
     * @tc.desc Test String.prototype.startsWith() with empty string
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0114";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "";
        const result = str.startsWith(searchStr);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0115
     * @tc.name builtinsStringPrototypeTest0115
     * @tc.desc Test String.prototype.startsWith() with empty string and position 24
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0115";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "";
        const position = 24;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: false`);
        console.info(`Actual result: ${result}`);

        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0116
     * @tc.name builtinsStringPrototypeTest0116
     * @tc.desc Test String.prototype.startsWith() with empty string and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0116";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "";
        const position = 15;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0117
     * @tc.name builtinsStringPrototypeTest0117
     * @tc.desc Test String.prototype.startsWith() with "one"
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0117";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "one";
        const result = str.startsWith(searchStr);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Expected result: false`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0118
     * @tc.name builtinsStringPrototypeTest0118
     * @tc.desc Test String.prototype.startsWith() with "one" and position 24
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0118";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "one";
        const position = 24;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: false`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0119
     * @tc.name builtinsStringPrototypeTest0119
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0119";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = "one";
        const position = 15;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0120
     * @tc.name builtinsStringPrototypeTest0120
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0120";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = 'abcd';
        const position = 15;
        const result = str.startsWith(searchStr);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0121
     * @tc.name builtinsStringPrototypeTest0121
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0121";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = 'abcd';
        const position = 24;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0122
     * @tc.name builtinsStringPrototypeTest0122
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0122";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = 'abcd';
        const position = 15;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0123
     * @tc.name builtinsStringPrototypeTest0123
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0123";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = 'world';
        const position = 15;
        const result = str.startsWith(searchStr, position);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0124
     * @tc.name builtinsStringPrototypeTest0124
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0124";
        console.info(`${caseName}, test start`);

        const str = "Hello world everyone";
        const searchStr = '/o/';
        const position = 15;
        const result = str.startsWith(searchStr);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0126
     * @tc.name builtinsStringPrototypeTest0126
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0126";
        console.info(`${caseName}, test start`);

        const str = "";
        const searchStr = "";
        const position = 15;
        const result = str.startsWith(searchStr);

        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);

        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0127
     * @tc.name builtinsStringPrototypeTest0127
     * @tc.desc Test String.prototype.startsWith() with "one" and position 15
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0127";
        console.info(`${caseName}, test start`);
        const str = "";
        const searchStr = "hello";
        const position = 15;
        const result = str.startsWith(searchStr, position);
        console.info(`Input string: "${str}"`);
        console.info(`Search string: "${searchStr}"`);
        console.info(`Position: ${position}`);
        console.info(`Expected result: true`);
        console.info(`Actual result: ${result}`);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      });

    // substring

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0128
     * @tc.name builtinsStringPrototypeTest0128
     * @tc.desc Test String.prototype.substring() with (0, 1)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0128";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 0;
        const end = 1;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual("M");
        expect(result.length).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0129
     * @tc.name builtinsStringPrototypeTest0129
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0129";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 1;
        const end = 0;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual("M");
        expect(result.length).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0130
     * @tc.name builtinsStringPrototypeTest0130
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0130";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 0;
        const end = 6;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual("Mozill");
        expect(result.length).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0131
     * @tc.name builtinsStringPrototypeTest0131
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0131";
        console.info(`${caseName}, test start`);
        const str = "Mozilla";
        const start = 4;
        const end = 0;
        const result = str.substring(start);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual('lla');
        expect(result.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0132
     * @tc.name builtinsStringPrototypeTest0132
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0132";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 4;
        const end = 7;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual('lla');
        expect(result.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0133
     * @tc.name builtinsStringPrototypeTest0133
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0125";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 7;
        const end = 4;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual('lla');
        expect(result.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0134
     * @tc.name builtinsStringPrototypeTest0134
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0134";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 0;
        const end = 7;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual('Mozilla');
        expect(result.length).assertEqual(7);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0135
     * @tc.name builtinsStringPrototypeTest0135
     * @tc.desc Test String.prototype.substring() with (1, 0)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0135";
        console.info(`${caseName}, test start`);

        const str = "Mozilla";
        const start = 0;
        const end = 10;
        const result = str.substring(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start position: ${start}`);
        console.info(`End position: ${end}`);
        console.info(`Expected result: "M"`);
        console.info(`Actual result: "${result}"`);

        expect(result).assertEqual('Mozilla');
        expect(result.length).assertEqual(7);
        console.info(`${caseName}, test end`);
        Done();
      });
    // 21个 613行

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0136
     * @tc.name builtinsStringPrototypeTest0136
     * @tc.desc Test String.prototype.split() with empty string and empty separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0136";
        console.info(`${caseName}, test start`);

        const str = "";
        const separator = "";
        const expected: string[] = [];
        const actual = str.split(separator);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: "${separator}"`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);

        expect(actual.length).assertEqual(expected.length);
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0137
     * @tc.name builtinsStringPrototypeTest0137
     * @tc.desc Test String.prototype.split() with empty string and non-empty separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0137";
        console.info(`${caseName}, test start`);

        const str = "";
        const separator = "a";
        const expected = [""];
        const actual = str.split(separator);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: "${separator}"`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);

        expect(actual.length).assertEqual(expected.length);
        expect(actual[0]).assertEqual(expected[0]);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0138
     * @tc.name builtinsStringPrototypeTest0138
     * @tc.desc Test String.prototype.split() with space separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0138";
        console.info(`${caseName}, test start`);

        const str = "Oh brave new world that has such people in it.";
        const separator = " ";
        const expectedWordCount = 10;
        const actual = str.split(separator);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: "${separator}"`);
        console.info(`Expected array length: ${expectedWordCount}`);
        console.info(`Actual array length: ${actual.length}`);
        console.info(`Result array: ${JSON.stringify(actual)}`);

        expect(actual.length).assertEqual(expectedWordCount);
        expect(actual[0]).assertEqual("Oh");
        expect(actual[9]).assertEqual("it.");

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0139
     * @tc.name builtinsStringPrototypeTest0139
     * @tc.desc Test String.prototype.split() with no separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0139";
        console.info(`${caseName}, test start`);
        const str = "Oh brave new world that has such people in it.";
        const expected = [str];
        const actual = str.split('');
        console.info(`Input string: "${str}"`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);
        expect(actual.length).assertEqual(46);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0140
     * @tc.name builtinsStringPrototypeTest0140
     * @tc.desc Test String.prototype.split() with comma separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0140";
        console.info(`${caseName}, test start`);

        const str = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec";
        const separator = ",";
        const expectedMonthCount = 12;
        const actual = str.split(separator);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: "${separator}"`);
        console.info(`Expected array length: ${expectedMonthCount}`);
        console.info(`Actual array length: ${actual.length}`);
        console.info(`First element: "${actual[0]}"`);
        console.info(`Last element: "${actual[11]}"`);

        expect(actual.length).assertEqual(expectedMonthCount);
        expect(actual[0]).assertEqual("Jan");
        expect(actual[11]).assertEqual("Dec");

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0141
     * @tc.name builtinsStringPrototypeTest0141
     * @tc.desc Test String.prototype.split() with regex separator
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0141";
        console.info(`${caseName}, test start`);

        const str = "Harry Trump ;Fred Barney; Helen Rigby ; Bill Abel ;Chris Hand ";
        const separator = /\s*(?:;|$)\s*/;
        const expected = ["Harry Trump", "Fred Barney", "Helen Rigby", "Bill Abel", "Chris Hand", ""];
        const actual = str.split(separator);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: ${separator}`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);

        expect(actual.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(actual[i]).assertEqual(expected[i]);
        }

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0142
     * @tc.name builtinsStringPrototypeTest0142
     * @tc.desc Test String.prototype.split() with limit parameter
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0142";
        console.info(`${caseName}, test start`);

        const str = "Hello World. How are you doing?";
        const separator = " ";
        const limit = 3;
        const expected = ["Hello", "World.", "How"];
        const actual = str.split(separator, limit);

        console.info(`Input string: "${str}"`);
        console.info(`Separator: "${separator}"`);
        console.info(`Limit: ${limit}`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);

        expect(actual.length).assertEqual(limit);
        expect(actual[0]).assertEqual(expected[0]);
        expect(actual[2]).assertEqual(expected[2]);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0143
     * @tc.name builtinsStringPrototypeTest0143
     * @tc.desc Test String.prototype.split() with capturing group regex
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0143";
        console.info(`${caseName}, test start`);
        const str = "Hello 1 word. Sentence number 2.";
        const separator = /(\d)/;
        const expected = ["Hello ", "1", " word. Sentence number ", "2", "."];
        const actual = str.split(separator);
        console.info(`Input string: "${str}"`);
        console.info(`Separator: ${separator}`);
        console.info(`Expected result: ${JSON.stringify(expected)}`);
        console.info(`Actual result: ${JSON.stringify(actual)}`);
        expect(actual.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(actual[i]).assertEqual(expected[i]);
        }
        console.info(`${caseName}, test end`);
        Done();
      });
    // 8 250

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0144
     * @tc.name builtinsStringPrototypeTest0144
     * @tc.desc Test String.prototype.slice(1, 8)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0144";
        console.info(`${caseName}, test start`);

        const str = "The morning is upon us.";
        const start = 1;
        const end = 8;
        const expected = "he morn";
        const actual = str.slice(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end}`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(7);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0145
     * @tc.name builtinsStringPrototypeTest0145
     * @tc.desc Test String.prototype.slice(4, -2)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0145";
        console.info(`${caseName}, test start`);

        const str = "The morning is upon us.";
        const start = 4;
        const end = -2;
        const expected = "morning is upon u";
        const actual = str.slice(start, end);

        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end}`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);

        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(17);

        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0146
     * @tc.name builtinsStringPrototypeTest0146
     * @tc.desc Test String.prototype.slice(12)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0146";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = 12;
        const expected = "is upon us.";
        const actual = str.slice(start);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(11);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0147
     * @tc.name builtinsStringPrototypeTest0147
     * @tc.desc Test String.prototype.slice(30) with out-of-range index
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0147";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = 30;
        const expected = "";
        const actual = str.slice(start);
        console.info(`Input string: "${str}" (length: ${str.length})`);
        console.info(`Start index: ${start}`);
        console.info(`Expected: "${expected}" (empty string)`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0148
     * @tc.name builtinsStringPrototypeTest0148
     * @tc.desc Test String.prototype.slice(-3)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0148";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = -3;
        const expected = "us.";
        const actual = str.slice(start);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start} (negative index)`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0149
     * @tc.name builtinsStringPrototypeTest0149
     * @tc.desc Test String.prototype.slice(-3, -1)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0149";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = -3;
        const end = -1;
        const expected = "us";
        const actual = str.slice(start, end);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end} (both negative)`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0150
     * @tc.name builtinsStringPrototypeTest0150
     * @tc.desc Test String.prototype.slice(0, -1)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0150";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = 0;
        const end = -1;
        const expected = "The morning is upon us";
        const actual = str.slice(start, end);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end}`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(str.length - 1);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0151
     * @tc.name builtinsStringPrototypeTest0151
     * @tc.desc Test String.prototype.slice(-11, 16)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0151";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = -11;
        const end = 16;
        const expected = "is u";
        const actual = str.slice(start, end);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start} (negative), End index: ${end}`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0152
     * @tc.name builtinsStringPrototypeTest0152
     * @tc.desc Test String.prototype.slice(11, -7)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0152";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = 11;
        const end = -7;
        const expected = " is u";
        const actual = str.slice(start, end);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end} (negative)`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0153
     * @tc.name builtinsStringPrototypeTest0153
     * @tc.desc Test String.prototype.slice(-5, -1)
     * @tc.size SMALLTEST
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStringPrototypeTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = "builtinsStringPrototypeTest0153";
        console.info(`${caseName}, test start`);
        const str = "The morning is upon us.";
        const start = -5;
        const end = -1;
        const expected = "n us";
        const actual = str.slice(start, end);
        console.info(`Input string: "${str}"`);
        console.info(`Start index: ${start}, End index: ${end} (both negative)`);
        console.info(`Expected: "${expected}"`);
        console.info(`Actual: "${actual}"`);
        expect(actual).assertEqual(expected);
        expect(actual.length).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      });
    // 11 273
    //
    // /**
    //  * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0154
    //  * @tc.name builtinsStringPrototypeTest0154
    //  * @tc.desc Test String.prototype.replaceAll() with string pattern
    //  * @tc.size SMALLTEST
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStringPrototypeTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (Done: Function) => {
    //     const caseName = "builtinsStringPrototypeTest0154";
    //     console.info(`${caseName}, test start`);
    //
    //     const str = "aabbcc";
    //     const pattern = "b";
    //     const replacement = ".";
    //     const expected = "aa..cc";
    //     const actual = str.replaceAll(pattern, replacement);
    //
    //     console.info(`Input string: "${str}"`);
    //     console.info(`Pattern: "${pattern}", Replacement: "${replacement}"`);
    //     console.info(`Expected: "${expected}"`);
    //     console.info(`Actual: "${actual}"`);
    //
    //     expect(actual).assertEqual(expected);
    //     expect(actual.length).assertEqual(str.length);
    //
    //     console.info(`${caseName}, test end`);
    //     Done();
    //   });
    //
    // /**
    //  * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0155
    //  * @tc.name builtinsStringPrototypeTest0155
    //  * @tc.desc Test String.prototype.replaceAll() with non-global regex
    //  * @tc.size SMALLTEST
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStringPrototypeTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (Done: Function) => {
    //     const caseName = "builtinsStringPrototypeTest0155";
    //     console.info(`${caseName}, test start`);
    //
    //     const str = "aabbcc";
    //     const pattern = /b/;
    //     let errorOccurred = false;
    //
    //     try {
    //       str.replaceAll(pattern, ".");
    //     } catch (e) {
    //       errorOccurred = true;
    //       console.info(`Expected error thrown: ${e.message}`);
    //       expect(e instanceof TypeError).assertTrue();
    //     }
    //
    //     console.info(`Input string: "${str}"`);
    //     console.info(`Pattern: ${pattern}`);
    //     console.info(`Expected: throw TypeError`);
    //     console.info(`Actual: ${errorOccurred ? "Error thrown" : "No error"}`);
    //
    //     expect(errorOccurred).assertTrue();
    //
    //     console.info(`${caseName}, test end`);
    //     Done();
    //   });
    //
    // /**
    //  * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0156
    //  * @tc.name builtinsStringPrototypeTest0156
    //  * @tc.desc Test String.prototype.replaceAll() with global regex
    //  * @tc.size SMALLTEST
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStringPrototypeTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (Done: Function) => {
    //     const caseName = "builtinsStringPrototypeTest0156";
    //     console.info(`${caseName}, test start`);
    //
    //     const str = "aabbcc";
    //     const pattern = /b/g;
    //     const replacement = ".";
    //     const expected = "aa..cc";
    //     const actual = str.replaceAll(pattern, replacement);
    //
    //     console.info(`Input string: "${str}"`);
    //     console.info(`Pattern: ${pattern}, Replacement: "${replacement}"`);
    //     console.info(`Expected: "${expected}"`);
    //     console.info(`Actual: "${actual}"`);
    //
    //     expect(actual).assertEqual(expected);
    //     expect(actual.length).assertEqual(str.length);
    //
    //     console.info(`${caseName}, test end`);
    //     Done();
    //   });
    //
    // /**
    //  * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0157
    //  * @tc.name builtinsStringPrototypeTest0157
    //  * @tc.desc Test String.prototype.search() with uppercase pattern
    //  * @tc.size SMALLTEST
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStringPrototypeTest0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (Done: Function) => {
    //     const caseName = "builtinsStringPrototypeTest0157";
    //     console.info(`${caseName}, test start`);
    //
    //     const str = "hey JudE";
    //     const pattern = /[A-Z]/;
    //     const expected = 4;
    //     const actual = str.search(pattern);
    //
    //     console.info(`Input string: "${str}"`);
    //     console.info(`Pattern: ${pattern}`);
    //     console.info(`Expected index: ${expected} (J at position 4)`);
    //     console.info(`Actual index: ${actual}`);
    //
    //     expect(actual).assertEqual(expected);
    //
    //     console.info(`${caseName}, test end`);
    //     Done();
    //   });
    //
    // /**
    //  * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_TEST_0158
    //  * @tc.name builtinsStringPrototypeTest0158
    //  * @tc.desc Test String.prototype.search() with unmatched pattern
    //  * @tc.size SMALLTEST
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStringPrototypeTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (Done: Function) => {
    //     const caseName = "builtinsStringPrototypeTest0158";
    //     console.info(`${caseName}, test start`);
    //
    //     const str = "hey JudE";
    //     const pattern = /[.]/;
    //     const expected = -1;
    //     const actual = str.search(pattern);
    //
    //     console.info(`Input string: "${str}"`);
    //     console.info(`Pattern: ${pattern}`);
    //     console.info(`Expected index: ${expected} (no match)`);
    //     console.info(`Actual index: ${actual}`);
    //
    //     expect(actual).assertEqual(expected);
    //
    //     console.info(`${caseName}, test end`);
    //     Done();
    //   });
  })
}