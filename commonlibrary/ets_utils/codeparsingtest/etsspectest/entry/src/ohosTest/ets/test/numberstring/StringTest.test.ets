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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'


export default function stringTest() {
  describe('StringTest', () => {
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
     * @tc.name   StringTest0001
     * @tc.number SUB_BUILDINS_STRING_TEST_0001
     * @tc.desc   Verify that the type of string created with single quotes is string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'test';
        expect(typeof str).assertEqual('string');
      });

    /**
     * @tc.name   StringTest0002
     * @tc.number SUB_BUILDINS_STRING_TEST_0002
     * @tc.desc   Verify that the type of string created with double quotes is string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = "test";
        expect(typeof str).assertEqual('string');
      });

    /**
     * @tc.name   StringTest0003
     * @tc.number SUB_BUILDINS_STRING_TEST_0003
     * @tc.desc   Verify that the type of string created with template literals is string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = `test`;
        expect(typeof str).assertEqual('string');
      });

    /**
     * @tc.name   StringTest0004
     * @tc.number SUB_BUILDINS_STRING_TEST_0004
     * @tc.desc   Verify that the type of object created with new String() is object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const strObj = new String('test');
        expect(typeof strObj).assertEqual('object');
      });

    /**
     * @tc.name   StringTest0005
     * @tc.number SUB_BUILDINS_STRING_TEST_0005
     * @tc.desc   Verify that the length property returns the correct length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello';
        expect(str.length).assertEqual(5);
      });

    /**
     * @tc.name   StringTest0006
     * @tc.number SUB_BUILDINS_STRING_TEST_0006
     * @tc.desc   Verify that the length of an empty string is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = '';
        expect(str.length).assertEqual(0);
      });

    /**
     * @tc.name   StringTest0007
     * @tc.number SUB_BUILDINS_STRING_TEST_0007
     * @tc.desc   Verify that charAt method returns the correct character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello';
        expect(str.charAt(1)).assertEqual('e');
      });

    /**
     * @tc.name   StringTest0008
     * @tc.number SUB_BUILDINS_STRING_TEST_0008
     * @tc.desc   Verify that charAt returns empty string when index is out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello';
        expect(str.charAt(10)).assertEqual('');
      });

    /**
     * @tc.name   StringTest0009
     * @tc.number SUB_BUILDINS_STRING_TEST_0009
     * @tc.desc   Verify that index access returns the correct character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str: string = 'hello';
        expect(str[0]).assertEqual('h');
      });

    /**
     * @tc.name   StringTest0010
     * @tc.number SUB_BUILDINS_STRING_TEST_0010
     * @tc.desc   Verify that + operator concatenates strings correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str1 = 'hello';
        const str2 = 'world';
        expect(str1 + ' ' + str2).assertEqual('hello world');
      });

    /**
     * @tc.name   StringTest0011
     * @tc.number SUB_BUILDINS_STRING_TEST_0011
     * @tc.desc   Verify that concat method concatenates strings correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello'.concat(' ', 'world');
        expect(str).assertEqual('hello world');
      });

    /**
     * @tc.name   StringTest0012
     * @tc.number SUB_BUILDINS_STRING_TEST_0012
     * @tc.desc   Verify that slice method extracts substring correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'abcdef'.slice(1, 4);
        expect(str).assertEqual('bcd');
      });

    /**
     * @tc.name   StringTest0013
     * @tc.number SUB_BUILDINS_STRING_TEST_0013
     * @tc.desc   Verify that substring method extracts substring correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'abcdef'.substring(1, 4);
      expect(str).assertEqual('bcd');
    });

    /**
     * @tc.name   StringTest0014
     * @tc.number SUB_BUILDINS_STRING_TEST_0014
     * @tc.desc   Verify that indexOf method returns correct index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(str.indexOf('o')).assertEqual(4);
      });

    /**
     * @tc.name   StringTest0015
     * @tc.number SUB_BUILDINS_STRING_TEST_0015
     * @tc.desc   Verify that indexOf returns -1 when substring not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello';
        expect(str.indexOf('x')).assertEqual(-1);
      });

    /**
     * @tc.name   StringTest0016
     * @tc.number SUB_BUILDINS_STRING_TEST_0016
     * @tc.desc   Verify that lastIndexOf returns correct last occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(str.lastIndexOf('o')).assertEqual(7);
      });

    /**
     * @tc.name   StringTest0017
     * @tc.number SUB_BUILDINS_STRING_TEST_0017
     * @tc.desc   Verify that includes method correctly identifies containment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(str.includes('world')).assertTrue();
      });

    /**
     * @tc.name   StringTest0018
     * @tc.number SUB_BUILDINS_STRING_TEST_0018
     * @tc.desc   Verify that startsWith method correctly identifies prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(str.startsWith('hello')).assertTrue();
      });

    /**
     * @tc.name   StringTest0019
     * @tc.number SUB_BUILDINS_STRING_TEST_0019
     * @tc.desc   Verify that endsWith method correctly identifies suffix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(str.endsWith('world')).assertTrue();
      });

    /**
     * @tc.name   StringTest0020
     * @tc.number SUB_BUILDINS_STRING_TEST_0020
     * @tc.desc   Verify that replace method replaces substring correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world'.replace('world', 'there');
        expect(str).assertEqual('hello there');
      });
    /**
     * @tc.name   StringTest0021
     * @tc.number SUB_BUILDINS_STRING_TEST_0021
     * @tc.desc   Verify that replace method with global flag replaces all occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello world'.replace(/o/g, '0');
        expect(str).assertEqual('hell0 w0rld');
      });

    /**
     * @tc.name   StringTest0022
     * @tc.number SUB_BUILDINS_STRING_TEST_0022
     * @tc.desc   Verify that toUpperCase converts string to uppercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'hello'.toUpperCase();
        expect(str).assertEqual('HELLO');
      });

    /**
     * @tc.name   StringTest0023
     * @tc.number SUB_BUILDINS_STRING_TEST_0023
     * @tc.desc   Verify that toLowerCase converts string to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'HELLO'.toLowerCase();
        expect(str).assertEqual('hello');
      });

    /**
     * @tc.name   StringTest0024
     * @tc.number SUB_BUILDINS_STRING_TEST_0024
     * @tc.desc   Verify that trim removes whitespace from both ends
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = '  hello  '.trim();
        expect(str).assertEqual('hello');
      });

    /**
     * @tc.name   StringTest0025
     * @tc.number SUB_BUILDINS_STRING_TEST_0025
     * @tc.desc   Verify that trimStart removes leading whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = '  hello  '.trimStart();
        expect(str).assertEqual('hello  ');
      });

    /**
     * @tc.name   StringTest0026
     * @tc.number SUB_BUILDINS_STRING_TEST_0026
     * @tc.desc   Verify that trimEnd removes trailing whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = '  hello  '.trimEnd();
        expect(str).assertEqual('  hello');
      });

    /**
     * @tc.name   StringTest0027
     * @tc.number SUB_BUILDINS_STRING_TEST_0027
     * @tc.desc   Verify that split method splits string into array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const arr = 'a,b,c'.split(',');
        expect(arr.toString()).assertEqual(['a', 'b', 'c'].toString());
      });

    /**
     * @tc.name   StringTest0028
     * @tc.number SUB_BUILDINS_STRING_TEST_0028
     * @tc.desc   Verify that split with limit parameter works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const arr = 'a,b,c,d'.split(',', 2);
        expect(arr.toString()).assertEqual(['a', 'b'].toString());
      });

    /**
     * @tc.name   StringTest0029
     * @tc.number SUB_BUILDINS_STRING_TEST_0029
     * @tc.desc   Verify that split with empty string splits into characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const arr = 'test'.split('');
        expect(arr.toString()).assertEqual(['t', 'e', 's', 't'].toString());
      });

    /**
     * @tc.name   StringTest0030
     * @tc.number SUB_BUILDINS_STRING_TEST_0030
     * @tc.desc   Verify that substr method extracts substring with length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'abcdef'.substr(1, 3);
        expect(str).assertEqual('bcd');
      });

    /**
     * @tc.name   StringTest0031
     * @tc.number SUB_BUILDINS_STRING_TEST_0031
     * @tc.desc   Verify that slice with negative start works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'abcdef'.slice(-3);
        expect(str).assertEqual('def');
      });

    /**
     * @tc.name   StringTest0032
     * @tc.number SUB_BUILDINS_STRING_TEST_0032
     * @tc.desc   Verify that slice with negative end works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'abcdef'.slice(1, -2);
        expect(str).assertEqual('bcd');
      });

    /**
     * @tc.name   StringTest0033
     * @tc.number SUB_BUILDINS_STRING_TEST_0033
     * @tc.desc   Verify that substr with negative start works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'abcdef'.substr(-2, 2);
        expect(str).assertEqual('ef');
      });

    /**
     * @tc.name   StringTest0034
     * @tc.number SUB_BUILDINS_STRING_TEST_0034
     * @tc.desc   Verify that includes with position parameter works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello world'.includes('o', 5);
        expect(result).assertTrue();
      });

    /**
     * @tc.name   StringTest0035
     * @tc.number SUB_BUILDINS_STRING_TEST_0035
     * @tc.desc   Verify that startsWith with position parameter works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello world'.startsWith('world', 6);
        expect(result).assertTrue();
      });

    /**
     * @tc.name   StringTest0036
     * @tc.number SUB_BUILDINS_STRING_TEST_0036
     * @tc.desc   Verify that endsWith with length parameter works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello world'.endsWith('lo', 5);
        expect(result).assertTrue();
      });

    /**
     * @tc.name   StringTest0037
     * @tc.number SUB_BUILDINS_STRING_TEST_0037
     * @tc.desc   Verify that indexOf with fromIndex works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello world'.indexOf('o', 5);
        expect(index).assertEqual(7);
      });

    /**
     * @tc.name   StringTest0038
     * @tc.number SUB_BUILDINS_STRING_TEST_0038
     * @tc.desc   Verify that lastIndexOf with fromIndex works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello world'.lastIndexOf('o', 5);
        expect(index).assertEqual(4);
      });

    /**
     * @tc.name   StringTest0039
     * @tc.number SUB_BUILDINS_STRING_TEST_0039
     * @tc.desc   Verify that replace with regex groups works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'name: Alice'.replace(/name: (\w+)/, '$1 is the name');
        expect(str).assertEqual('Alice is the name');
      });

    /**
     * @tc.name   StringTest0040
     * @tc.number SUB_BUILDINS_STRING_TEST_0040
     * @tc.desc   Verify that replace with function works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '123'.replace(/\d/g, m => (parseInt(m) * 2).toString());
        expect(str).assertEqual('246');
      });

    /**
     * @tc.name   StringTest0041
     * @tc.number SUB_BUILDINS_STRING_TEST_0041
     * @tc.desc   Verify that split with regex works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a,b|c'.split(/[,|]/);
        expect(arr.toString()).assertEqual(['a', 'b', 'c'].toString());
      });

    /**
     * @tc.name   StringTest0042
     * @tc.number SUB_BUILDINS_STRING_TEST_0042
     * @tc.desc   Verify that split handles consecutive separators correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a,,b'.split(',');
        expect(arr.toString()).assertEqual(['a', '', 'b'].toString());
      });

    /**
     * @tc.name   StringTest0043
     * @tc.number SUB_BUILDINS_STRING_TEST_0043
     * @tc.desc   Verify that string with escape characters has correct length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'a\nb\tc';
        expect(str.length).assertEqual(5);
      });

    /**
     * @tc.name   StringTest0044
     * @tc.number SUB_BUILDINS_STRING_TEST_0044
     * @tc.desc   Verify that string with Unicode escape is correct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '\u0041'; // Unicode for 'A'
        expect(str).assertEqual('A');
      });

    /**
     * @tc.name   StringTest0045
     * @tc.number SUB_BUILDINS_STRING_TEST_0045
     * @tc.desc   Verify that string with emoji has correct length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '😊'; // Emoji character
        expect(str.length).assertEqual(2);
      });
    /**
     * @tc.name   StringTest0047
     * @tc.number SUB_BUILDINS_STRING_TEST_0047
     * @tc.desc   Verify that template string with expressions works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const x = 5;
        const str = `${x} + 3 = ${x + 3}`;
        expect(str).assertEqual('5 + 3 = 8');
      });

    /**
     * @tc.name   StringTest0048
     * @tc.number SUB_BUILDINS_STRING_TEST_0048
     * @tc.desc   Verify that template string preserves line breaks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = `line1
line2`;
        expect(str).assertEqual('line1\nline2');
      });

    /**
     * @tc.name   StringTest0049
     * @tc.number SUB_BUILDINS_STRING_TEST_0049
     * @tc.desc   Verify that localeCompare sorts strings correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'apple'.localeCompare('banana');
        expect(result).assertEqual(-1); // apple comes before banana

      });

    /**
     * @tc.name   StringTest0050
     * @tc.number SUB_BUILDINS_STRING_TEST_0050
     * @tc.desc   Verify that Number conversion works for numeric strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const num = Number('123');
        expect(num).assertEqual(123);
      });
    /**
     * @tc.name   StringTest0051
     * @tc.number SUB_BUILDINS_STRING_TEST_0051
     * @tc.desc   Verify that Number conversion returns NaN for non-numeric strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const num = Number('12a3');
        expect(isNaN(num)).assertTrue();
      });

    /**
     * @tc.name   StringTest0052
     * @tc.number SUB_BUILDINS_STRING_TEST_0052
     * @tc.desc   Verify that parseInt works correctly with string input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const num = parseInt('123');
        expect(num).assertEqual(123);
      });

    /**
     * @tc.name   StringTest0053
     * @tc.number SUB_BUILDINS_STRING_TEST_0053
     * @tc.desc   Verify that parseFloat works correctly with string input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const num = parseFloat('123.45');
        expect(num).assertEqual(123.45);
      });

    /**
     * @tc.name   StringTest0054
     * @tc.number SUB_BUILDINS_STRING_TEST_0054
     * @tc.desc   Verify that String.fromCharCode creates correct string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String.fromCharCode(65, 66, 67);
        expect(str).assertEqual('ABC');
      });

    /**
     * @tc.name   StringTest0055
     * @tc.number SUB_BUILDINS_STRING_TEST_0055
     * @tc.desc   Verify that charCodeAt returns correct Unicode value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const code = 'ABC'.charCodeAt(1);
        expect(code).assertEqual(66);
      });

    /**
     * @tc.name   StringTest0056
     * @tc.number SUB_BUILDINS_STRING_TEST_0056
     * @tc.desc   Verify that codePointAt returns correct code point for emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const code = '😊'.codePointAt(0);
        expect(code).assertEqual(128522);
      });

    /**
     * @tc.name   StringTest0057
     * @tc.number SUB_BUILDINS_STRING_TEST_0057
     * @tc.desc   Verify that repeat method creates correct repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'ab'.repeat(3);
        expect(str).assertEqual('ababab');
      });

    /**
     * @tc.name   StringTest0058
     * @tc.number SUB_BUILDINS_STRING_TEST_0058
     * @tc.desc   Verify that repeat with 0 returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'ab'.repeat(0);
        expect(str).assertEqual('');
      });

    /**
     * @tc.name   StringTest0059
     * @tc.number SUB_BUILDINS_STRING_TEST_0059
     * @tc.desc   Verify that padStart adds padding correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '5'.padStart(3, '0');
        expect(str).assertEqual('005');
      });

    /**
     * @tc.name   StringTest0060
     * @tc.number SUB_BUILDINS_STRING_TEST_0060
     * @tc.desc   Verify that padEnd adds padding correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '5'.padEnd(3, '0');
        expect(str).assertEqual('500');
      });

    /**
     * @tc.name   StringTest0061
     * @tc.number SUB_BUILDINS_STRING_TEST_0061
     * @tc.desc   Verify that padStart doesn't pad if string is longer than target length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '1234'.padStart(3, '0');
        expect(str).assertEqual('1234');
      });

    /**
     * @tc.name   StringTest0062
     * @tc.number SUB_BUILDINS_STRING_TEST_0062
     * @tc.desc   Verify that localeCompare with options works for accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'café'.localeCompare('cafe', undefined, { sensitivity: 'base' });
        expect(result).assertEqual(0); // Considered equal with base sensitivity

      });

    /**
     * @tc.name   StringTest0063
     * @tc.number SUB_BUILDINS_STRING_TEST_0063
     * @tc.desc   Verify that string concatenation with number works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = '10' + 5;
        expect(result).assertEqual('105');
      });

    /**
     * @tc.name   StringTest0064
     * @tc.number SUB_BUILDINS_STRING_TEST_0064
     * @tc.desc   Verify that string comparison with === works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = 'hello' === 'hello';
        expect(result).assertTrue();
      });

    /**
     * @tc.name   StringTest0065
     * @tc.number SUB_BUILDINS_STRING_TEST_0065
     * @tc.desc   Verify that string comparison with == works with type coercion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = Number('123') == 123;
        expect(result).assertTrue();
      });

    /**
     * @tc.name   StringTest0066
     * @tc.number SUB_BUILDINS_STRING_TEST_0066
     * @tc.desc   Verify that string with mixed quotes is handled correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'He said "Hello"';
        expect(str).assertEqual('He said "Hello"');
      });

    /**
     * @tc.name   StringTest0067
     * @tc.number SUB_BUILDINS_STRING_TEST_0067
     * @tc.desc   Verify that string with escaped quotes is handled correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = "He said 'Hello'";
        expect(str).assertEqual("He said 'Hello'");
      });

    /**
     * @tc.name   StringTest0068
     * @tc.number SUB_BUILDINS_STRING_TEST_0068
     * @tc.desc   Verify that very long string is handled correctly
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('StringTest0068', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      () => {
        const str = 'a'.repeat(100000);
        expect(str.length).assertEqual(100000);
      });

    /**
     * @tc.name   StringTest0069
     * @tc.number SUB_BUILDINS_STRING_TEST_0069
     * @tc.desc   Verify that split on empty string with empty string returns empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = ''.split('');
        expect(arr.toString()).assertEqual([].toString());
      });

    /**
     * @tc.name   StringTest0070
     * @tc.number SUB_BUILDINS_STRING_TEST_0070
     * @tc.desc   Verify that match method works with regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello world'.match(/o/g);
        expect(result!.toString()).assertEqual(['o', 'o'].toString());
      });

    /**
     * @tc.name   StringTest0071
     * @tc.number SUB_BUILDINS_STRING_TEST_0071
     * @tc.desc   Verify that search method returns correct index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello world'.search(/world/);
        expect(index).assertEqual(6);
      });

    /**
     * @tc.name   StringTest0072
     * @tc.number SUB_BUILDINS_STRING_TEST_0072
     * @tc.desc   Verify that replace with case-insensitive flag works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'Hello World'.replace(/hello/i, 'hi');
        expect(str).assertEqual('hi World');
      });


    /**
     * @tc.name   StringTest0074
     * @tc.number SUB_BUILDINS_STRING_TEST_0074
     * @tc.desc   Verify that null converted to string is 'null'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String(null);
        expect(str).assertEqual('null');
      });

    /**
     * @tc.name   StringTest0075
     * @tc.number SUB_BUILDINS_STRING_TEST_0075
     * @tc.desc   Verify that undefined converted to string is 'undefined'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String(undefined);
        expect(str).assertEqual('undefined');
      });

    /**
     * @tc.name   StringTest0076
     * @tc.number SUB_BUILDINS_STRING_TEST_0076
     * @tc.desc   Verify that boolean true converted to string is 'true'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String(true);
        expect(str).assertEqual('true');
      });

    /**
     * @tc.name   StringTest0077
     * @tc.number SUB_BUILDINS_STRING_TEST_0077
     * @tc.desc   Verify that object converted to string is '[object Object]'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String({ a: 1 });
        expect(str).assertEqual('[object Object]');
      });

    /**
     * @tc.name   StringTest0078
     * @tc.number SUB_BUILDINS_STRING_TEST_0078
     * @tc.desc   Verify that array converted to string joins elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String([1, 2, 3]);
        expect(str).assertEqual('1,2,3');
      });

    /**
     * @tc.name   StringTest0079
     * @tc.number SUB_BUILDINS_STRING_TEST_0079
     * @tc.desc   Verify that date object converted to string works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const date = new Date(2023, 0, 1);
        const str = String(date);
        expect(str).assertContain('Jan 01 2023');
      });

    /**
     * @tc.name   StringTest0081
     * @tc.number SUB_BUILDINS_STRING_TEST_0081
     * @tc.desc   Verify that split with empty string on multi-character string works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'test'.split('');
        expect(arr.toString()).assertEqual(['t', 'e', 's', 't'].toString());
      });

    /**
     * @tc.name   StringTest0082
     * @tc.number SUB_BUILDINS_STRING_TEST_0082
     * @tc.desc   Verify that split with comma separator works on csv-like string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'apple,banana,orange'.split(',');
        expect(arr.toString()).assertEqual(['apple', 'banana', 'orange'].toString());
      });

    /**
     * @tc.name   StringTest0083
     * @tc.number SUB_BUILDINS_STRING_TEST_0083
     * @tc.desc   Verify that split with limit parameter stops at specified count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a,b,c,d,e'.split(',', 3);
        expect(arr.toString()).assertEqual(['a', 'b', 'c'].toString());
      });

    /**
     * @tc.name   StringTest0084
     * @tc.number SUB_BUILDINS_STRING_TEST_0084
     * @tc.desc   Verify that match returns correct array for regex with groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'Name: John'.match(/Name: (\w+)/);
        expect(arr!.toString()).assertEqual(['Name: John', 'John'].toString());
      });

    /**
     * @tc.name   StringTest0085
     * @tc.number SUB_BUILDINS_STRING_TEST_0085
     * @tc.desc   Verify that split handles regex with capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a1b2c3'.split(/(\d)/);
        expect(arr.toString()).assertEqual(['a', '1', 'b', '2', 'c', '3', ''].toString());
      });

    /**
     * @tc.name   StringTest0086
     * @tc.number SUB_BUILDINS_STRING_TEST_0086
     * @tc.desc   Verify that Array.from converts string to correct array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = Array.from('hello');
        expect(arr.toString()).assertEqual(['h', 'e', 'l', 'l', 'o'].toString());
      });

    /**
     * @tc.name   StringTest0088
     * @tc.number SUB_BUILDINS_STRING_TEST_0088
     * @tc.desc   Verify that split with whitespace regex works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'hello   world  test'.split(/\s+/);
        expect(arr.toString()).assertEqual(['hello', 'world', 'test'].toString());
      });

    /**
     * @tc.name   StringTest0089
     * @tc.number SUB_BUILDINS_STRING_TEST_0089
     * @tc.desc   Verify that split handles trailing empty strings correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a,b,c,'.split(',');
        expect(arr.toString()).assertEqual(['a', 'b', 'c', ''].toString());
      });

    /**
     * @tc.name   StringTest0090
     * @tc.number SUB_BUILDINS_STRING_TEST_0090
     * @tc.desc   Verify that getOwnPropertyNames returns correct properties for string object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const strObj = new String('test');
        const props = Object.getOwnPropertyNames(strObj);
        expect(props.toString()).assertEqual(['0', '1', '2', '3', 'length'].toString());
      });

    /**
     * @tc.name   StringTest0091
     * @tc.number SUB_BUILDINS_STRING_TEST_0091
     * @tc.desc   Verify that string with zero-width characters is handled correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'a\u200Bb'; // Zero-width space between a and b
        expect(str.length).assertEqual(3);
        expect(str.split('').toString()).assertEqual(['a', '\u200B', 'b'].toString());
      });

    /**
     * @tc.name   StringTest0092
     * @tc.number SUB_BUILDINS_STRING_TEST_0092
     * @tc.desc   Verify that normalize method returns correct normalized string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        // é can be represented as a single code point or e + acute accent
        const str1 = '\u00E9';
        const str2 = '\u0065\u0301';
        expect(str1.normalize()).assertEqual(str2.normalize());
      });

    /**
     * @tc.name   StringTest0093
     * @tc.number SUB_BUILDINS_STRING_TEST_0093
     * @tc.desc   Verify that split with empty string on empty string returns empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = ''.split('');
        expect(arr.toString()).assertEqual([].toString());
      });

    /**
     * @tc.name   StringTest0094
     * @tc.number SUB_BUILDINS_STRING_TEST_0094
     * @tc.desc   Verify that matchAll returns correct iterator results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test1test2';
        const matches = Array.from(str.matchAll(/test(\d)/g));
        const results = matches.map(m => m[0]);
        expect(results.toString()).assertEqual(['test1', 'test2'].toString());
      });

    /**
     * @tc.name   StringTest0096
     * @tc.number SUB_BUILDINS_STRING_TEST_0096
     * @tc.desc   Verify that split with regex lookahead works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = '100020003000'.split(/(?=000)/);
        expect(arr.toString()).assertEqual(['1', '0002', '0003', '000'].toString());
      });

    /**
     * @tc.name   StringTest0097
     * @tc.number SUB_BUILDINS_STRING_TEST_0097
     * @tc.desc   Verify that string with combining characters has correct length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'e\u0301'; // e + acute accent = é
        expect(str.length).assertEqual(2);
      });

    /**
     * @tc.name   StringTest0098
     * @tc.number SUB_BUILDINS_STRING_TEST_0098
     * @tc.desc   Verify that split with numeric separator works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a1b2c3d'.split(/\d/);
        expect(arr.toString()).assertEqual(['a', 'b', 'c', 'd'].toString());
      });

    /**
     * @tc.name   StringTest0099
     * @tc.number SUB_BUILDINS_STRING_TEST_0099
     * @tc.desc   Verify that Object.keys returns correct indices for string object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const strObj = new String('abc');
        const keys = Object.keys(strObj);
        expect(keys.toString()).assertEqual(['0', '1', '2'].toString());
      });

    /**
     * @tc.name   StringTest0100
     * @tc.number SUB_BUILDINS_STRING_TEST_0100
     * @tc.desc   Verify that split with backslash separator works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a\\b\\c'.split('\\');
        expect(arr.toString()).assertEqual(['a', 'b', 'c'].toString());
      });

    /**
     * @tc.name   StringTest0101
     * @tc.number SUB_BUILDINS_STRING_TEST_0101
     * @tc.desc   Verify that trim works with non-breaking spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '\u00A0hello\u00A0'.trim(); // \u00A0 is non-breaking space
        expect(str).assertEqual('hello');
      });

    /**
     * @tc.name   StringTest0102
     * @tc.number SUB_BUILDINS_STRING_TEST_0102
     * @tc.desc   Verify that replace with empty string replacement works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello world'.replace(' ', '');
        expect(str).assertEqual('helloworld');
      });

    /**
     * @tc.name   StringTest0103
     * @tc.number SUB_BUILDINS_STRING_TEST_0103
     * @tc.desc   Verify that toLocaleUpperCase works for special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'istanbul'.toLocaleUpperCase('tr');
        expect(str).assertEqual('İSTANBUL');
      });

    /**
     * @tc.name   StringTest0104
     * @tc.number SUB_BUILDINS_STRING_TEST_0104
     * @tc.desc   Verify that toLocaleLowerCase works for special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'İSTANBUL'.toLocaleLowerCase('tr');
        expect(str).assertEqual('istanbul');
      });

    /**
     * @tc.name   StringTest0105
     * @tc.number SUB_BUILDINS_STRING_TEST_0105
     * @tc.desc   Verify that includes returns false for non-existent substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = 'hello'.includes('xyz');
        expect(result).assertFalse();
      });

    /**
     * @tc.name   StringTest0106
     * @tc.number SUB_BUILDINS_STRING_TEST_0106
     * @tc.desc   Verify that startsWith returns false for incorrect prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = 'hello'.startsWith('helo');
        expect(result).assertFalse();
      });

    /**
     * @tc.name   StringTest0107
     * @tc.number SUB_BUILDINS_STRING_TEST_0107
     * @tc.desc   Verify that endsWith returns false for incorrect suffix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = 'hello'.endsWith('elo');
        expect(result).assertFalse();
      });

    /**
     * @tc.name   StringTest0108
     * @tc.number SUB_BUILDINS_STRING_TEST_0108
     * @tc.desc   Verify that repeat with large count works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'x'.repeat(1000);
        expect(str.length).assertEqual(1000);
      });

    /**
     * @tc.name   StringTest0109
     * @tc.number SUB_BUILDINS_STRING_TEST_0109
     * @tc.desc   Verify that padStart uses space as default padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test'.padStart(8);
        expect(str).assertEqual('    test');
      });

    /**
     * @tc.name   StringTest0110
     * @tc.number SUB_BUILDINS_STRING_TEST_0110
     * @tc.desc   Verify that padEnd uses space as default padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test'.padEnd(8);
        expect(str).assertEqual('test    ');
      });

    /**
     * @tc.name   StringTest0111
     * @tc.number SUB_BUILDINS_STRING_TEST_0111
     * @tc.desc   Verify that padStart truncates padding string if necessary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '5'.padStart(5, '0123456');
        expect(str).assertEqual('01235');
      });

    /**
     * @tc.name   StringTest0112
     * @tc.number SUB_BUILDINS_STRING_TEST_0112
     * @tc.desc   Verify that padEnd truncates padding string if necessary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '5'.padEnd(5, '0123456');
        expect(str).assertEqual('50123');
      });

    /**
     * @tc.name   StringTest0113
     * @tc.number SUB_BUILDINS_STRING_TEST_0113
     * @tc.desc   Verify that search returns -1 for non-matching regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello'.search(/xyz/);
        expect(index).assertEqual(-1);
      });

    /**
     * @tc.name   StringTest0114
     * @tc.number SUB_BUILDINS_STRING_TEST_0114
     * @tc.desc   Verify that match returns null for non-matching regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello'.match(/xyz/);
        expect(result).assertNull();
      });

    /**
     * @tc.name   StringTest0115
     * @tc.number SUB_BUILDINS_STRING_TEST_0115
     * @tc.desc   Verify that replace with non-string replacement converts correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.replace('o', '0');
        expect(str).assertEqual('hell0');
      });

    /**
     * @tc.name   StringTest0116
     * @tc.number SUB_BUILDINS_STRING_TEST_0116
     * @tc.desc   Verify that String.fromCodePoint creates correct string for emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String.fromCodePoint(128522); // Code point for 😊
        expect(str).assertEqual('😊');
      });

    /**
     * @tc.name   StringTest0117
     * @tc.number SUB_BUILDINS_STRING_TEST_0117
     * @tc.desc   Verify that normalize with NFC form works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '\u0065\u0301'; // e + acute accent
        expect(str.normalize('NFC')).assertEqual('\u00E9'); // Combined é

      });

    /**
     * @tc.name   StringTest0118
     * @tc.number SUB_BUILDINS_STRING_TEST_0118
     * @tc.desc   Verify that normalize with NFD form works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '\u00E9'; // Combined é
        expect(str.normalize('NFD')).assertEqual('\u0065\u0301'); // e + acute accent

      });

    /**
     * @tc.name   StringTest0119
     * @tc.number SUB_BUILDINS_STRING_TEST_0119
     * @tc.desc   Verify that matchAll returns empty iterator for no matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test';
        const matches = Array.from(str.matchAll(/xyz/g));
        expect(matches.toString()).assertEqual([].toString());
      });

    /**
     * @tc.name   StringTest0120
     * @tc.number SUB_BUILDINS_STRING_TEST_0120
     * @tc.desc   Verify that split with empty separator on long string works
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('StringTest0120', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      () => {
        const longStr = 'abcdefghijklmnopqrstuvwxyz'.repeat(100);
        const arr = longStr.split('');
        expect(arr.length).assertEqual(longStr.length);
      });

    /**
     * @tc.name   StringTest0121
     * @tc.number SUB_BUILDINS_STRING_TEST_0121
     * @tc.desc   Verify that charAt returns empty string for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = ''.charAt(0);
        expect(result).assertEqual('');
      });

    /**
     * @tc.name   StringTest0122
     * @tc.number SUB_BUILDINS_STRING_TEST_0122
     * @tc.desc   Verify that charCodeAt returns NaN for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const code = ''.charCodeAt(0);
        expect(isNaN(code)).assertTrue();
      });

    /**
     * @tc.name   StringTest0123
     * @tc.number SUB_BUILDINS_STRING_TEST_0123
     * @tc.desc   Verify that codePointAt returns undefined for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const code = ''.codePointAt(0);
        expect(code).assertEqual(undefined);
      });

    /**
     * @tc.name   StringTest0124
     * @tc.number SUB_BUILDINS_STRING_TEST_0124
     * @tc.desc   Verify that concat with multiple arguments works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const str = 'a'.concat('b', 'c', 'd');
        expect(str).assertEqual('abcd');
      });

    /**
     * @tc.name   StringTest0125
     * @tc.number SUB_BUILDINS_STRING_TEST_0125
     * @tc.desc   Verify that concat with non-string arguments converts them
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'Number: '.concat('123', ' Bool: ', 'true');
        expect(str).assertEqual('Number: 123 Bool: true');
      });

    /**
     * @tc.name   StringTest0126
     * @tc.number SUB_BUILDINS_STRING_TEST_0126
     * @tc.desc   Verify that slice with start equal to end returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.slice(2, 2);
        expect(str).assertEqual('');
      });

    /**
     * @tc.name   StringTest0127
     * @tc.number SUB_BUILDINS_STRING_TEST_0127
     * @tc.desc   Verify that substring with start equal to end returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.substring(2, 2);
        expect(str).assertEqual('');
      });

    /**
     * @tc.name   StringTest0128
     * @tc.number SUB_BUILDINS_STRING_TEST_0128
     * @tc.desc   Verify that substr with zero length returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.substr(2, 0);
        expect(str).assertEqual('');
      });

    /**
     * @tc.name   StringTest0129
     * @tc.number SUB_BUILDINS_STRING_TEST_0129
     * @tc.desc   Verify that indexOf with fromIndex larger than string length returns -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello'.indexOf('l', 10);
        expect(index).assertEqual(-1);
      });

    /**
     * @tc.name   StringTest0130
     * @tc.number SUB_BUILDINS_STRING_TEST_0130
     * @tc.desc   Verify that lastIndexOf with fromIndex negative returns -1 for non-existent substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'hello'.lastIndexOf('x', -1);
        expect(index).assertEqual(-1);
      });

    /**
     * @tc.name   StringTest0131
     * @tc.number SUB_BUILDINS_STRING_TEST_0131
     * @tc.desc   Verify that includes with position larger than string length returns false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello'.includes('l', 10);
        expect(result).assertFalse();
      });

    /**
     * @tc.name   StringTest0132
     * @tc.number SUB_BUILDINS_STRING_TEST_0132
     * @tc.desc   Verify that startsWith with position larger than string length returns false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'hello'.startsWith('l', 10);
        expect(result).assertFalse();
      });

    /**
     * @tc.name   StringTest0133
     * @tc.number SUB_BUILDINS_STRING_TEST_0133
     * @tc.desc   Verify that endsWith with length 0 returns true only for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result1 = 'hello'.endsWith('', 0);
        const result2 = ''.endsWith('', 0);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
      });

    /**
     * @tc.name   StringTest0134
     * @tc.number SUB_BUILDINS_STRING_TEST_0134
     * @tc.desc   Verify that replace with regex and empty string removes matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello world'.replace(/\s/g, '');
        expect(str).assertEqual('helloworld');
      });

    /**
     * @tc.name   StringTest0135
     * @tc.number SUB_BUILDINS_STRING_TEST_0135
     * @tc.desc   Verify that toUpperCase preserves non-alphabetic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello! 123'.toUpperCase();
        expect(str).assertEqual('HELLO! 123');
      });

    /**
     * @tc.name   StringTest0136
     * @tc.number SUB_BUILDINS_STRING_TEST_0136
     * @tc.desc   Verify that toLowerCase preserves non-alphabetic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'HELLO! 123'.toLowerCase();
        expect(str).assertEqual('hello! 123');
      });

    /**
     * @tc.name   StringTest0137
     * @tc.number SUB_BUILDINS_STRING_TEST_0137
     * @tc.desc   Verify that trim with only whitespace returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '   \t\n\r'.trim();
        expect(str).assertEqual('');
      });
    /**
     * @tc.name   StringTest0139
     * @tc.number SUB_BUILDINS_STRING_TEST_0139
     * @tc.desc   Verify that repeat with negative number throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let errorThrown = false;
        try {
          'test'.repeat(-1);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertTrue();
      });

    /**
     * @tc.name   StringTest0140
     * @tc.number SUB_BUILDINS_STRING_TEST_0140
     * @tc.desc   verify that padStart with negative target length returns original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test'.padStart(-5);
        expect(str).assertEqual('test');
      });

    /**
     * @tc.name   StringTest0141
     * @tc.number SUB_BUILDINS_STRING_TEST_0141
     * @tc.desc   Verify that padEnd with negative target length returns original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test'.padEnd(-5);
        expect(str).assertEqual('test');
      });

    /**
     * @tc.name   StringTest0142
     * @tc.number SUB_BUILDINS_STRING_TEST_0142
     * @tc.desc   Verify that match with global flag returns all matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'ababa'.match(/a/g);
        expect(result!.toString()).assertEqual(['a', 'a', 'a'].toString());
      });

    /**
     * @tc.name   StringTest0143
     * @tc.number SUB_BUILDINS_STRING_TEST_0143
     * @tc.desc   Verify that match with case-insensitive flag works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'Hello HELLO hello'.match(/hello/gi);
        expect(result!.toString()).assertEqual(['Hello', 'HELLO', 'hello'].toString());
      });

    /**
     * @tc.name   StringTest0144
     * @tc.number SUB_BUILDINS_STRING_TEST_0144
     * @tc.desc   Verify that search with case-insensitive flag works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'Hello World'.search(/world/i);
        expect(index).assertEqual(6);
      });

    /**
     * @tc.name   StringTest0145
     * @tc.number SUB_BUILDINS_STRING_TEST_0145
     * @tc.desc   Verify that split with empty string and limit 0 returns empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'hello'.split('', 0);
        expect(arr.toString()).assertEqual([].toString());
      });

    /**
     * @tc.name   StringTest0146
     * @tc.number SUB_BUILDINS_STRING_TEST_0146
     * @tc.desc   Verify that fromCharCode handles multiple code points
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String.fromCharCode(72, 101, 108, 108, 111);
        expect(str).assertEqual('Hello');
      });

    /**
     * @tc.name   StringTest0147
     * @tc.number SUB_BUILDINS_STRING_TEST_0147
     * @tc.desc   Verify that charCodeAt returns correct value for high-order characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '€'; // Euro symbol, Unicode code point 8364
        expect(str.charCodeAt(0)).assertEqual(8364);
      });

    /**
     * @tc.name   StringTest0148
     * @tc.number SUB_BUILDINS_STRING_TEST_0148
     * @tc.desc   Verify that localeCompare returns 0 for equal strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'test'.localeCompare('test');
        expect(result).assertEqual(0);
      });

    /**
     * @tc.name   StringTest0149
     * @tc.number SUB_BUILDINS_STRING_TEST_0149
     * @tc.desc   Verify that localeCompare returns positive number when string comes after
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'zebra'.localeCompare('apple');
        expect(result).assertEqual(1);
      });

    /**
     * @tc.name   StringTest0150
     * @tc.number SUB_BUILDINS_STRING_TEST_0150
     * @tc.desc   Verify that replace with $& inserts matched substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.replace(/ell/, '[$&]');
        expect(str).assertEqual('h[ell]o');
      });

    /**
     * @tc.name   StringTest0151
     * @tc.number SUB_BUILDINS_STRING_TEST_0151
     * @tc.desc   Verify that replace with $` inserts substring before match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.replace(/l/, '[$`]');
        expect(str).assertEqual('he[he]lo');
      });

    /**
     * @tc.name   StringTest0152
     * @tc.number SUB_BUILDINS_STRING_TEST_0152
     * @tc.desc   Verify that replace with $' inserts substring after match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'hello'.replace(/l/, '[$\']');
        expect(str).assertEqual('he[lo]lo');
      });

    /**
     * @tc.name   StringTest0153
     * @tc.number SUB_BUILDINS_STRING_TEST_0153
     * @tc.desc   Verify that replace with $$ inserts dollar sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'cost: 5'.replace(/5/, '$$$&');
        expect(str).assertEqual('cost: $5');
      });

    /**
     * @tc.name   StringTest0154
     * @tc.number SUB_BUILDINS_STRING_TEST_0154
     * @tc.desc   Verify that split with regex and limit works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = 'a1b2c3d4'.split(/\d/, 3);
        expect(arr.toString()).assertEqual(['a', 'b', 'c'].toString());
      });

    /**
     * @tc.name   StringTest0155
     * @tc.number SUB_BUILDINS_STRING_TEST_0155
     * @tc.desc   Verify that toLocaleUpperCase uses default locale when not specified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'istanbul'.toLocaleUpperCase();
        // Will vary by environment, but should be consistent with standard uppercase
        expect(str).assertEqual('ISTANBUL');
      });

    /**
     * @tc.name   StringTest0156
     * @tc.number SUB_BUILDINS_STRING_TEST_0156
     * @tc.desc   Verify that codePointAt returns correct value for supplementary characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '𝌆'; // Musical symbol, code point U+1D306
        expect(str.codePointAt(0)).assertEqual(0x1D306);
      });

    /**
     * @tc.name   StringTest0157
     * @tc.number SUB_BUILDINS_STRING_TEST_0157
     * @tc.desc   Verify that fromCodePoint handles supplementary characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String.fromCodePoint(0x1D306);
        expect(str).assertEqual('𝌆');
      });

    /**
     * @tc.name   StringTest0158
     * @tc.number SUB_BUILDINS_STRING_TEST_0158
     * @tc.desc   Verify that repeat with Infinity throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let errorThrown = false;
        try {
          'test'.repeat(Infinity);
        } catch (e) {
          errorThrown = true;
        }
        expect(errorThrown).assertTrue();
      });

    /**
     * @tc.name   StringTest0159
     * @tc.number SUB_BUILDINS_STRING_TEST_0159
     * @tc.desc   Verify that padStart with large target length works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'x'.padStart(1000, 'ab');
        expect(str.length).assertEqual(1000);
      });

    /**
     * @tc.name   StringTest0160
     * @tc.number SUB_BUILDINS_STRING_TEST_0160
     * @tc.desc   Verify that split with empty string on emoji returns correct array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = '😊👍👎'.split('');
        // Emojis are represented as surrogate pairs, so we get 6 elements instead of 3
        expect(arr.length).assertEqual(6);
      });
    /**
     * @tc.name   StringTest0161
     * @tc.number SUB_BUILDINS_STRING_TEST_0161
     * @tc.desc   Verify that split with emoji and limit works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = '😊,👍,👎'.split(',', 2);
        expect(arr.toString()).assertEqual(['😊', '👍'].toString());
      });
    /**
     * @tc.name   StringTest0162
     * @tc.number SUB_BUILDINS_STRING_TEST_0162
     * @tc.desc   Verify that includes works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'Hello 😊 World'.includes('😊');
        expect(result).assertTrue();
      });
    /**
     * @tc.name   StringTest0163
     * @tc.number SUB_BUILDINS_STRING_TEST_0163
     * @tc.desc   Verify that startsWith works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = '😊 Hello'.startsWith('😊');
        expect(result).assertTrue();
      });
    /**
     * @tc.name   StringTest0164
     * @tc.number SUB_BUILDINS_STRING_TEST_0164
     * @tc.desc   Verify that endsWith works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = 'Hello 😊'.endsWith('😊');
        expect(result).assertTrue();
      });
    /**
     * @tc.name   StringTest0165
     * @tc.number SUB_BUILDINS_STRING_TEST_0165
     * @tc.desc   Verify that indexOf works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'A😊B😊C'.indexOf('😊', 2);
        expect(index).assertEqual(4);
      });
    /**
     * @tc.name   StringTest0166
     * @tc.number SUB_BUILDINS_STRING_TEST_0166
     * @tc.desc   Verify that lastIndexOf works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const index = 'A😊B😊C'.lastIndexOf('😊');
        expect(index).assertEqual(4);
      });
    /**
     * @tc.name   StringTest0167
     * @tc.number SUB_BUILDINS_STRING_TEST_0167
     * @tc.desc   Verify that replace works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'Hello 😊'.replace('😊', '👍');
        expect(str).assertEqual('Hello 👍');
      });
    /**
     * @tc.name   StringTest0168
     * @tc.number SUB_BUILDINS_STRING_TEST_0168
     * @tc.desc   Verify that concat works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'Hello'.concat(' ', '😊');
        expect(str).assertEqual('Hello 😊');
      });
    /**
     * @tc.name   StringTest0169
     * @tc.number SUB_BUILDINS_STRING_TEST_0169
     * @tc.desc   Verify that slice works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'A😊B😊C'.slice(1, 4);
        expect(str).assertEqual('😊B');
      });
    /**
     * @tc.name   StringTest0170
     * @tc.number SUB_BUILDINS_STRING_TEST_0170
     * @tc.desc   Verify that substring works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'A😊B😊C'.substring(1, 4);
        expect(str).assertEqual('😊B');
      });
    /**
     * @tc.name   StringTest0171
     * @tc.number SUB_BUILDINS_STRING_TEST_0171
     * @tc.desc   Verify that substr works with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'A😊B😊C'.substr(1, 3);
        expect(str).assertEqual('😊B');
      });
    /**
     * @tc.name   StringTest0172
     * @tc.number SUB_BUILDINS_STRING_TEST_0172
     * @tc.desc   Verify that toUpperCase works with accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'café à la carte'.toUpperCase();
        expect(str).assertEqual('CAFÉ À LA CARTE');
      });
    /**
     * @tc.name   StringTest0173
     * @tc.number SUB_BUILDINS_STRING_TEST_0173
     * @tc.desc   Verify that toLowerCase works with accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'CAFÉ À LA CARTE'.toLowerCase();
        expect(str).assertEqual('café à la carte');
      });
    /**
     * @tc.name   StringTest0174
     * @tc.number SUB_BUILDINS_STRING_TEST_0174
     * @tc.desc   Verify that trimStart works with non-breaking spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '\u00A0\u00A0test'.trimStart();
        expect(str).assertEqual('test');
      });
    /**
     * @tc.name   StringTest0175
     * @tc.number SUB_BUILDINS_STRING_TEST_0175
     * @tc.desc   Verify that trimEnd works with non-breaking spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'test\u00A0\u00A0'.trimEnd();
        expect(str).assertEqual('test');
      });
    /**
     * @tc.name   StringTest0176
     * @tc.number SUB_BUILDINS_STRING_TEST_0176
     * @tc.desc   Verify that repeat works with multi-character strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'ab'.repeat(5);
        expect(str).assertEqual('ababababab');
      });
    /**
     * @tc.name   StringTest0177
     * @tc.number SUB_BUILDINS_STRING_TEST_0177
     * @tc.desc   Verify that padStart works with multi-character padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'x'.padStart(5, 'ab');
        expect(str).assertEqual('ababx');
      });
    /**
     * @tc.name   StringTest0178
     * @tc.number SUB_BUILDINS_STRING_TEST_0178
     * @tc.desc   Verify that padEnd works with multi-character padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'x'.padEnd(5, 'ab');
        expect(str).assertEqual('xabab');
      });
    /**
     * @tc.name   StringTest0179
     * @tc.number SUB_BUILDINS_STRING_TEST_0179
     * @tc.desc   Verify that matchAll returns correct groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'a1b2c3';
        const matches = Array.from(str.matchAll(/(\w)(\d)/g));
        const groups = matches.map(m => m[1] + m[2]);
        expect(groups.toString()).assertEqual(['a1', 'b2', 'c3'].toString());
      });
    /**
     * @tc.name   StringTest0180
     * @tc.number SUB_BUILDINS_STRING_TEST_0180
     * @tc.desc   Verify that normalize with NFKC form works for compatibility characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '①'; // Circled number 1
        expect(str.normalize('NFKC')).assertEqual('1');
      });
    /**
     * @tc.name   StringTest0181
     * @tc.number SUB_BUILDINS_STRING_TEST_0181
     * @tc.desc   Verify that split with line breaks works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'line1\nline2\r\nline3';
        const arr = str.split(/\r?\n/);
        expect(arr.toString()).assertEqual(['line1', 'line2', 'line3'].toString());
      });

    /**
     * @tc.name   StringTest0183
     * @tc.number SUB_BUILDINS_STRING_TEST_0183
     * @tc.desc   Verify that localeCompare with numeric option works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const result = '10'.localeCompare('2', undefined, { numeric: true });
        expect(result).assertEqual(1);

      });
    /**
     * @tc.name   StringTest0184
     * @tc.number SUB_BUILDINS_STRING_TEST_0184
     * @tc.desc   Verify that String.fromCodePoint handles multiple code points
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = String.fromCodePoint(0x41, 0x20, 0x1F600); // A + space + 😀
        expect(str).assertEqual('A 😀');
      });
    /**
     * @tc.name   StringTest0185
     * @tc.number SUB_BUILDINS_STRING_TEST_0185
     * @tc.desc   Verify that codePointAt returns correct values for multiple code points
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'A😀B';
        const codes = [str.codePointAt(0), str.codePointAt(1), str.codePointAt(3)];
        expect(codes.toString()).assertEqual([65, 128512, 66].toString());
      });
    /**
     * @tc.name   StringTest0186
     * @tc.number SUB_BUILDINS_STRING_TEST_0186
     * @tc.desc   Verify that very long string concatenation works
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('StringTest0186', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      () => {
        const part = 'a'.repeat(1000);
        const str = part + part + part + part + part; // 5,000 characters
        expect(str.length).assertEqual(5000);
      });
    /**
     * @tc.name   StringTest0187
     * @tc.number SUB_BUILDINS_STRING_TEST_0187
     * @tc.desc   Verify that replace with global and case-insensitive flags works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = 'Hello hello HELLO'.replace(/hello/gi, 'hi');
        expect(str).assertEqual('hi hi hi');
      });
    /**
     * @tc.name   StringTest0188
     * @tc.number SUB_BUILDINS_STRING_TEST_0188
     * @tc.desc   Verify that split with empty string on string with zero-width joiners works
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const str = '👨‍👩‍👧'; // Family: man, woman, girl
        const arr = str.split('');
        expect(arr.length).assertEqual(8); // Contains zero-width joiners

      });
    /**
     * @tc.name   StringTest0189
     * @tc.number SUB_BUILDINS_STRING_TEST_0189
     * @tc.desc   Verify that includes works with case sensitivity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTest0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        const result = 'Hello'.includes('h');
        expect(result).assertFalse();
      });

  })
}