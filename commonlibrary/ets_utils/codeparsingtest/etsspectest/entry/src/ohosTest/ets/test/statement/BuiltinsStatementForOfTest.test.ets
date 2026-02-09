/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import {
  processArray,
  processMap,
  processSet,
  processSetWithIterator,
  processString
} from '../../testability/pages/ThrowMethod';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function builtinsStatementForOfTest() {
  describe('builtinsStatementForOfTest', () => {
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
     * @tc.name   builtinsStatementForOfTest0100
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0100
     * @tc.desc   test let declare variables
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementForOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: number[] = [10, 20, 30];
      let doubledArr: number[] = [];
      for (let value of arr) {
        let doubled = value * 2;
        doubledArr.push(doubled);
        console.log(`Value: ${value}, Doubled: ${doubled}`);
      }
      ;
      console.log('Doubled array:', doubledArr);
      await sleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0200
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0200
     * @tc.desc   test let declare variables
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementForOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: number[] = [10, 20, 30];
      let doubledArr: number[] = [];
      for (const value of arr) {
        const doubled = value * 2;
        doubledArr.push(doubled);
      }
      ;
      await sleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0300
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0300
     * @tc.desc   test The array is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementForOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: number[] = [10, 20, 30];
      let processedResults = processArray(arr);
      await sleep(100);
      expect('Value: 10, Max so far: 10,Value: 20, Max so far: 20,Value: 30, Max so far: 30')
        .assertEqual(processedResults.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0400
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0400
     * @tc.desc   test The let array is undfined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementForOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      let arr = [1, 2, undefined, 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === undefined) {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(2).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0500
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0500
     * @tc.desc   test The let array is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let arr = [1, 2, 3, null, 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === null) {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(3).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0600
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0600
     * @tc.desc   test The let array is ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let arr = [1, 2, '', 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === '') {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(2).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0700
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0700
     * @tc.desc   test The let string is ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let str: string = '';
      let str2: string = ''
      if (str.length === 0) {
        str2 = 'The string is empty.';
      } else {
        for (let char of str) {
          console.log(char);
        }
        ;
      }
      ;
      await sleep(100);
      expect('The string is empty.').assertEqual(str2);
      Done();
    })
    /**
     * @tc.name   builtinsStatementForOfTest0800
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0800
     * @tc.desc   test The let string is normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let str: string = 'Hello';
      let str2: string = '';
      if (str.length > 0) {
        str2 = str[0];
      }
      ;
      expect('H').assertEqual(str2);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest0900
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0900
     * @tc.desc   test The let string is undfined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let str = 'Hello undefined World';
      let specialSubstr = 'undefined';
      let foundIndices: number[] = [];
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str[i + j] !== specialSubstr[j]) {
            match = false;
            break;
          }
          ;
        }
        ;
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      await sleep(100);
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1000
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1000
     * @tc.desc   test The string is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let str = 'Hello null World';
      let specialSubstr = 'null';
      let foundIndices: number[] = [];
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str[i + j] !== specialSubstr[j]) {
            match = false;
            break;
          }
          ;
        }
        ;
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      await sleep(100);
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1100
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1100
     * @tc.desc   test The string is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let str = 'Hello \'\' World';
      let specialSubstr = '\'\'';
      let foundIndices: number[] = [];
      let newStr = str; // 初始化新字符串为原始字符串
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str[i + j] !== specialSubstr[j]) {
            match = false;
            break;
          }
          ;
        }
        ;
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      console.log('New string after removing \'\':', newStr);
      await sleep(110);
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1200
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1200
     * @tc.desc   test For (const char of string) {joinedString += char;}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let originalString = 'Hello World';
      let joinedString = '';
      for (const char of originalString) {
        joinedString += char;
      }
      ;
      await sleep(120);
      expect('Hello World').assertEqual(joinedString);
      Done();
    })
    /**
     * @tc.name   builtinsStatementForOfTest1300
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1300
     * @tc.desc   test Let exception handling normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testCases = [
        'Hello World'
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await sleep(120);
      expect('Hello World').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1400
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1400
     * @tc.desc   test Exception handling undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testCases = [
        undefined
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await sleep(120);
      expect('').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1500
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1500
     * @tc.desc   test Let exception handling null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testCases = [
        null
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await sleep(120);
      expect('').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1600
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1600
     * @tc.desc   test Let exception handling ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testCases = [
        ''
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await sleep(120)
      expect('').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1700
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1700
     * @tc.desc   test Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testMapWithException = new Map([
        ['name', 'Alice'],
      ]);
      const processedResultsWithException = processMap(testMapWithException);
      await sleep(120);
      expect('Processed name: Alice').assertEqual(processedResultsWithException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1800
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1800
     * @tc.desc   test Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let testSetWithException = new Set(['Alice', 'Bob', 'Charlie']);
      const setException = processSet(testSetWithException);
      await sleep(120);
      expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
        .assertEqual(setException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest1900
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1900
     * @tc.desc   test Iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {

      let testIteratorWithException = new Set(['abc', 'Tom', 'Sala']);
      const iteratorException = processSetWithIterator(testIteratorWithException);
      await sleep(120);
      expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
        .assertEqual(iteratorException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2000
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2000
     * @tc.desc   test Let Untyped
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let mixedArray = [1, [5, 6, 7]];
      let a: number = 1;
      for (let item of mixedArray) {
        console.log(`Item type: ${typeof item}, Item value:`, item);
        if (Array.isArray(item)) {
          console.log('This is an array with elements:');
          for (let subItem of item) {
            console.log(`Sub-item: ${subItem}`);
          }
          ;
          if (item === mixedArray[1]) {
            a = item[0];
          }
          ;
        } else {
          console.log('This is a non-array item.');
        }
        ;
      }
      ;
      await sleep(120);
      expect(a).assertEqual(5);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2100
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2100
     * @tc.desc   test Let Untyped
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const emptyArray = [];
      for (const item of emptyArray) {
        console.log(`Item: ${item}`);
      }
      ;
      Done();
    });

    /**
     * @tc.name   builtinsStatementForOfTest2200
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2200
     * @tc.desc   test Const normal variables
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const arr: number[] = [10, 20, 30];
      const doubledArr: number[] = [];
      for (const value of arr) {
        const doubled = value * 2;
        doubledArr.push(doubled);
        console.log(`Value: ${value}, Doubled: ${doubled}`);
      }
      ;
      console.log('Doubled array:', doubledArr);
      await sleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2300
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2300
     * @tc.desc   test The const array is undfined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const arr = [1, 2, undefined, 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === undefined) {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(2).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2400
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2400
     * @tc.desc   test The const array is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const arr = [1, 2, null, 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === null) {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(2).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2500
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2500
     * @tc.desc   test The const array is ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const arr = [1, 2, '', 4, 5];
      let undefinedIndexes: number = 0;
      for (let i = 0; i < arr.length; i++) {
        let element = arr[i];
        if (element === '') {
          undefinedIndexes = i;
        }
        ;
      }
      ;
      await sleep(100);
      expect(2).assertEqual(undefinedIndexes);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2600
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2600
     * @tc.desc   test The const string is ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const str: string = '';
      let str2: string = ''
      if (str.length === 0) {
        str2 = 'The string is empty.';
      } else {
        for (let char of str) {
          console.log(char);
        }
        ;
      }
      ;
      await sleep(100);
      expect('The string is empty.').assertEqual(str2);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2700
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2700
     * @tc.desc   test The const string is normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const str: string = 'Hello';
      let str2: string = '';
      if (str.length > 0) {
        str2 = str[0];
      }
      expect('H').assertEqual(str2);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2800
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2800
     * @tc.desc   test The const string is undfined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const str = 'Hello undefined World';
      let specialSubstr = 'undefined';
      let foundIndices: number[] = [];
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str.charAt(i + j) !== specialSubstr[j]) {
            match = false;
            break;
          }
          ;
        }
        ;
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      console.log('New string after removing undefined:', newStr);
      await sleep(100);
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest2900
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2900
     * @tc.desc   test The const string is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const str = 'Hello null World';
      let specialSubstr = 'null';
      let foundIndices: number[] = [];
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str.charAt(i + j) !== specialSubstr[j]) {
            match = false;
            break;
          }
          ;
        }
        ;
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      await sleep(100);
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3000
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3000
     * @tc.desc   test The const string is ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const str = 'Hello \'\' World';
      let specialSubstr = '\'\'';
      let foundIndices: number[] = [];
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (str.charAt(i + j) !== specialSubstr[j]) {
            match = false;
            break;
          }
        }
        if (match) {
          foundIndices.push(i);
        }
        ;
      }
      ;
      foundIndices.sort((a, b) => b - a);
      for (let index of foundIndices) {
        newStr = newStr.slice(0, index) + newStr.slice(index + specialSubstr.length);
      }
      ;
      await sleep(100)
      expect('Hello  World').assertEqual(newStr);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3100
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3100
     * @tc.desc   test For (const char of string) {joinedString += char;}
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const originalString = 'Hello World';
      let joinedString = '';
      for (const char of originalString) {
        joinedString += char;
      }
      ;
      await sleep(120);
      expect('Hello World').assertEqual(joinedString);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3200
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3200
     * @tc.desc   test Const exception handling normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testCases = [
        'Hello World'
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await sleep(120);
      expect('Hello World').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3300
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3300
     * @tc.desc   test Const exception handling null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testCases = [
        null
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await sleep(120);
      expect('').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3400
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3400
     * @tc.desc   test Const exception handling ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testCases = [
        ''
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await sleep(120);
      expect('').assertEqual(result);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3500
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3500
     * @tc.desc   test Const map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testMapWithException = new Map([
        ['name', 'Alice'],
      ]);
      const processedResultsWithException = processMap(testMapWithException);
      console.log('Processed results with exception handling:', processedResultsWithException);
      await sleep(120);
      expect('Processed name: Alice').assertEqual(processedResultsWithException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3600
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3600
     * @tc.desc   test Const set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testSetWithException = new Set(['Alice', 'Bob', 'Charlie']);
      const setException = processSet(testSetWithException);
      await sleep(120);
      expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
        .assertEqual(setException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3700
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3700
     * @tc.desc   test COnst iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testIteratorWithException = new Set(['abc', 'Tom', 'Sala']);
      const iteratorException = processSetWithIterator(testIteratorWithException);
      await sleep(120);
      expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
        .assertEqual(iteratorException.toString());
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3800
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3800
     * @tc.desc   test Const Untyped
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const mixedArray = [1, [5, 6, 7]];
      let a: number = 1
      for (let item of mixedArray) {
        console.log(`Item type: ${typeof item}, Item value:`, item);
        if (Array.isArray(item)) {
          console.log('This is an array with elements:');
          for (let subItem of item) {
            console.log(`Sub-item: ${subItem}`);
          }
          if (item === mixedArray[1]) {
            a = item[0];
          }
          ;
        } else {
          console.log('This is a non-array item.');
        }
        ;
      }
      ;
      await sleep(120);
      expect(a).assertEqual(5);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest3900
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3900
     * @tc.desc   test For-of nesting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      let stringElements: number[] = [];
      for (const row of matrix) {
        for (const element of row) {
          console.log('==========', element.toString());
          stringElements.push(element);
        }
      }
      ;
      await sleep(100);
      expect(stringElements.toString()).assertEqual('1,2,3,4,5,6,7,8,9');
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest4000
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4000
     * @tc.desc   test Nesting order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      let rowIndex = 0;
      const positions: string[] = [];
      for (const row of matrix) {
        let colIndex = 0;
        for (const element of row) {
          const position = `${rowIndex}, ${colIndex}`;
          positions.push(position);
          colIndex++;
        }
        rowIndex++;
      }
      ;
      await sleep(120);
      expect('0, 0,0, 1,0, 2,1, 0,1, 1,1, 2,2, 0,2, 1,2, 2')
        .assertEqual(positions.toString());
      Done();

    })

    /**
     * @tc.name   builtinsStatementForOfTest4100
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4100
     * @tc.desc   test Number of layers: 5 layers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0
      const array5D = [
        [
          [
            [
              [1, 2],
              [3, 4]
            ],
            [
              [5, 6],
              [7, 8]
            ]
          ]
        ],
        [
          [
            [
              [9, 10],
              [11, 12]
            ],
            [
              [13, 14],
              [15, 16]
            ]
          ]
        ]
      ];
      let indices: number[] = [];
      for (const dim1 of array5D) {
        let index1 = 0;
        for (const dim2 of dim1) {
          let index2 = 0;
          for (const dim3 of dim2) {
            let index3 = 0;
            for (const dim4 of dim3) {
              let index4 = 0;
              for (let element of dim4) {
                indices = [index1, index2, index3, index4];
                console.log(`Value: ${element} at indices: ${indices.join(', ')}`);
                num++
                index4++;
              }
              index3++;
            }
            index2++;
          }
          index1++;
        }
      }
      await sleep(120);
      expect(16).assertEqual(num);
      Done();

    })

    /**
     * @tc.name   builtinsStatementForOfTest4200
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4200
     * @tc.desc   test Number of layers: 10 layers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0;
      let indices: number[] = [];
      const array10D = [
        [
          [
            [
              [
                [
                  [
                    [
                      [
                        [[1, 2], [3, 4]],
                        [[5, 6], [7, 8]]
                      ],
                      [
                        [[9, 10], [11, 12]],
                        [[13, 14], [15, 16]]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ];

      for (const dim1 of array10D) {
        let index1 = 0;
        for (const dim2 of dim1) {
          let index2 = 0;
          for (const dim3 of dim2) {
            let index3 = 0;
            for (const dim4 of dim3) {
              let index4 = 0;
              for (const dim5 of dim4) {
                let index5 = 0;
                for (const dim6 of dim5) {
                  let index6 = 0;
                  for (const dim7 of dim6) {
                    let index7 = 0;
                    for (const dim8 of dim7) {
                      let index8 = 0;
                      for (const dim9 of dim8) {
                        let index9 = 0;
                        for (const element of dim9) {
                          indices = [index1, index2, index3, index4, index5, index6, index7, index8, index9];
                          console.log(`Value: ${element} at indices: ${indices.join(', ')}`);
                          num++;
                          index9++;
                        }
                        index8++;
                      }
                      index7++;
                    }
                    index6++;
                  }
                  index5++;
                }
                index4++;
              }
              index3++;
            }
            index2++;
          }
          index1++;
        }
      }
      await sleep(120);
      expect(8).assertEqual(num); // 确保遍历了所有的元素
      Done();

    })

    /**
     * @tc.name   builtinsStatementForOfTest4300
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4300
     * @tc.desc   test Define variables on the outer layer and assign values in the loop to see if they can be obtained
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let foundValue: number | null = null;
      let foundIndex: number | null = null;
      const array1D = [10, 20, 30, 40, 50];
      for (const element of array1D) {
        const currentIndex = array1D.indexOf(element);
        if (element === 30) {
          foundValue = element;
          foundIndex = currentIndex;
          break;
        }
      }
      await sleep(120);
      expect(30).assertEqual(foundValue);
      expect(2).assertEqual(foundIndex);
      Done();
    })

    /**
     * @tc.name   builtinsStatementForOfTest4400
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4400
     * @tc.desc   test Define variables on the outer layer and assign values in the loop to see if they can be obtained
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementForOfTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const currentIndex: string = ''
      const array = [10, 20, 30, 40, 50];
      let foundValue: number | null = null;
      for (const element of array) {
        const currentIndex = array.indexOf(element);
        const innerVariable = `Current element is ${element}, at index ${currentIndex}`;
        if (element === 30) {
          foundValue = element;
          break;
        }
      }
      ;
      expect(30).assertEqual(foundValue);
      expect('').assertEqual(currentIndex);
      Done();
    })
  })
}