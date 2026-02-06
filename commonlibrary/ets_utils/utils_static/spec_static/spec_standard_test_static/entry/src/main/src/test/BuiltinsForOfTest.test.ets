/*
* Copyright (C) 2024-2026 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import Utils from './Util.test';

import {
  processArray,
  processMap,
  processSet,
  processSetWithIterator,
  processString
} from './pages/ThrowMethod';

export default function builtinsForOfTest() {
  describe('builtinsStatementForOfTest', (): void => {
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll((): void => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(async () : Promise<void> => {
    //   await Utils.msSleep(100);
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach((): void => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    // })
    // afterAll((): void => {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0100
     * @tc.name builtinsStatementForOfTest0100
     * @tc.desc test let declare variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let arr: number[] = [10, 20, 30];
      let doubledArr = new Array<number>();
      for (let value of arr) {
        let doubled = value * 2;
        doubledArr.push(doubled);
        console.log(`Value: ${value}, Doubled: ${doubled}`);
      }
      ;
      console.log('Doubled array:', doubledArr);
      await Utils.msSleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0200
     * @tc.name builtinsStatementForOfTest0200
     * @tc.desc test let declare variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let arr: number[] = [10, 20, 30];
      let doubledArr = new Array<number>();
      for (const value of arr) {
        const doubled = value * 2;
        doubledArr.push(doubled);
      }
      ;
      await Utils.msSleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0300
     * @tc.name builtinsStatementForOfTest0300
     * @tc.desc test The array is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let arr: number[] = [10, 20, 30];
      let processedResults = processArray(arr);
      await Utils.msSleep(100);
      expect('Value: 10, Max so far: 10,Value: 20, Max so far: 20,Value: 30, Max so far: 30')
        .assertEqual(processedResults.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0400
     * @tc.name builtinsStatementForOfTest0400
     * @tc.desc test The let array is undfined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(2).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0500
     * @tc.name builtinsStatementForOfTest0500
     * @tc.desc test The let array is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(3).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0600
     * @tc.name builtinsStatementForOfTest0600
     * @tc.desc test The let array is ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(2).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0700
     * @tc.name builtinsStatementForOfTest0700
     * @tc.desc test The let string is ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let str: string = '';
      let str2: string = ''
      if (str.length === 0) {
        str2 = 'The string is empty.';
      } else {
        for (let cha of str) {
          console.log(cha);
        }
        ;
      }
      ;
      await Utils.msSleep(100);
      expect('The string is empty.').assertEqual(str2);
      done();
    })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0800
     * @tc.name builtinsStatementForOfTest0800
     * @tc.desc test The let string is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let str: string = 'Hello';
      let str2: string = '';
      if (str.length > 0) {
        str2 = `${str[0]}`;
      }
      ;
      expect('H').assertEqual(str2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_0900
     * @tc.name builtinsStatementForOfTest0900
     * @tc.desc test The let string is undfined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let str = 'Hello undefined World';
      let specialSubstr = 'undefined';
      let foundIndices = new Array<int>();
      let newStr: string = str;
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
      await Utils.msSleep(100);
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1000
     * @tc.name builtinsStatementForOfTest1000
     * @tc.desc test The string is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let str = 'Hello null World';
      let specialSubstr = 'null';
      let foundIndices = new Array<int>();
      let newStr: string = str;
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
      await Utils.msSleep(100);
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1100
     * @tc.name builtinsStatementForOfTest1100
     * @tc.desc test The string is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let str = 'Hello \'\' World';
      let specialSubstr = '\'\'';
      let foundIndices = new Array<int>();
      let newStr: string = str; // 初始化新字符串为原始字符串
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
      await Utils.msSleep(110);
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1200
     * @tc.name builtinsStatementForOfTest1200
     * @tc.desc test For (const char of string) {joinedString += char;}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let originalString = 'Hello World';
      let joinedString = '';
      for (const cha of originalString) {
        joinedString += cha;
      }
      ;
      await Utils.msSleep(120);
      expect('Hello World').assertEqual(joinedString);
      done();
    })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1300
     * @tc.name builtinsStatementForOfTest1300
     * @tc.desc test Let exception handling normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = new Array<string>('Hello World');
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await Utils.msSleep(120);
      expect('Hello World').assertEqual(result);
      done();
    })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1400
     * @tc.name builtinsStatementForOfTest1400
     * @tc.desc test Exception handling undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = [
         undefined
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await Utils.msSleep(120);
      expect('').assertEqual(result);
      done();
    })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1500
     * @tc.name builtinsStatementForOfTest1500
     * @tc.desc test Let exception handling null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = [
          null
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await Utils.msSleep(120);
      expect('').assertEqual(result);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1600
     * @tc.name builtinsStatementForOfTest1600
     * @tc.desc test Let exception handling ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = new Array<string>('');
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await Utils.msSleep(120)
      expect('').assertEqual(result);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1700
     * @tc.name builtinsStatementForOfTest1700
     * @tc.desc test Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testMapWithException = new Map<string, string>([
        ['name', 'Alice'],
      ]);
      const processedResultsWithException = processMap(testMapWithException);
      await Utils.msSleep(120);
      expect('Processed name: Alice').assertEqual(processedResultsWithException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1800
     * @tc.name builtinsStatementForOfTest1800
     * @tc.desc test Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testSetWithException = new Set<string>(['Alice', 'Bob', 'Charlie']);
      const setException = processSet(testSetWithException);
      await Utils.msSleep(120);
      expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
        .assertEqual(setException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_1900
     * @tc.name builtinsStatementForOfTest1900
     * @tc.desc test Iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testIteratorWithException = new Set<string>(['abc', 'Tom', 'Sala']);
      const iteratorException = processSetWithIterator(testIteratorWithException);
      await Utils.msSleep(120);
      expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
        .assertEqual(iteratorException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2000
     * @tc.name builtinsStatementForOfTest2000
     * @tc.desc test Let Untyped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mixedArray = new Array<Int | Array<Int>>();
      mixedArray.push(1);
      let element2 = new Array<Int>(5, 6, 7);
      mixedArray.push(element2);
      let a: number = 1;
      for (let item of mixedArray) {
        console.log(`Item type: ${typeof item}, Item value:`, item);
        if (Array.isArray(item)) {
          console.log('This is an array with elements:');
          let childItem = item as Array<Int>;
          for (let subItem of childItem) {
            console.log(`Sub-item: ${subItem}`);
          }
          ;
          if (childItem === mixedArray[1]) {
            a = childItem[0] as number;
          }
          ;
        } else {
          console.log('This is a non-array item.');
        }
        ;
      }
      ;
      await Utils.msSleep(120);
      expect(a).assertEqual(5);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2200
     * @tc.name builtinsStatementForOfTest2200
     * @tc.desc test Const normal variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const arr: number[] = [10, 20, 30];
      let doubledArr = new Array<number>();
      for (const value of arr) {
        const doubled = value * 2;
        doubledArr.push(doubled);
        console.log(`Value: ${value}, Doubled: ${doubled}`);
      }
      ;
      console.log('Doubled array:', doubledArr);
      await Utils.msSleep(100);
      expect('20,40,60').assertEqual(doubledArr.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2300
     * @tc.name builtinsStatementForOfTest2300
     * @tc.desc test The const array is undfined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(2).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2400
     * @tc.name builtinsStatementForOfTest2400
     * @tc.desc test The const array is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(2).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2500
     * @tc.name builtinsStatementForOfTest2500
     * @tc.desc test The const array is ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(100);
      expect(2).assertEqual(undefinedIndexes);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2600
     * @tc.name builtinsStatementForOfTest2600
     * @tc.desc test The const string is ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str: string = '';
      let str2: string = ''
      if (str.length === 0) {
        str2 = 'The string is empty.';
      } else {
        for (let cha of str) {
          console.log(cha);
        }
        ;
      }
      ;
      await Utils.msSleep(100);
      expect('The string is empty.').assertEqual(str2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2700
     * @tc.name builtinsStatementForOfTest2700
     * @tc.desc test The const string is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str: string = 'Hello';
      let str2: string = '';
      if (str.length > 0) {
        str2 = `${str[0]}`
      }
      expect('H').assertEqual(str2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2800
     * @tc.name builtinsStatementForOfTest2800
     * @tc.desc test The const string is undfined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str = 'Hello undefined World';
      let specialSubstr = 'undefined';
      let foundIndices = new Array<int>();
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (String(str.charAt(i + j)) !== specialSubstr[j]) {
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
      await Utils.msSleep(100);
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_2900
     * @tc.name builtinsStatementForOfTest2900
     * @tc.desc test The const string is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str = 'Hello null World';
      let specialSubstr = 'null';
      let foundIndices = new Array<int>();
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (String(str.charAt(i + j)) !== specialSubstr[j]) {
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
      await Utils.msSleep(100);
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3000
     * @tc.name builtinsStatementForOfTest3000
     * @tc.desc test The const string is ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const str = 'Hello \'\' World';
      let specialSubstr = '\'\'';
      let foundIndices = new Array<int>();
      let newStr = str;
      for (let i = 0; i <= str.length - specialSubstr.length; i++) {
        let match = true;
        for (let j = 0; j < specialSubstr.length; j++) {
          if (String(str.charAt(i + j)) !== specialSubstr[j]) {
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
      await Utils.msSleep(100)
      expect('Hello  World').assertEqual(newStr);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3100
     * @tc.name builtinsStatementForOfTest3100
     * @tc.desc test For (const char of string) {joinedString += char;}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const originalString = 'Hello World';
      let joinedString = '';
      for (const cha of originalString) {
        joinedString += cha;
      }
      ;
      await Utils.msSleep(120);
      expect('Hello World').assertEqual(joinedString);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3200
     * @tc.name builtinsStatementForOfTest3200
     * @tc.desc test Const exception handling normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = new Array<string>('Hello World');
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await Utils.msSleep(120);
      expect('Hello World').assertEqual(result);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3300
     * @tc.name builtinsStatementForOfTest3300
     * @tc.desc test Const exception handling null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testCases = [
         null
      ];
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
      });
      await Utils.msSleep(120);
      expect('').assertEqual(result);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3400
     * @tc.name builtinsStatementForOfTest3400
     * @tc.desc test Const exception handling ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let testCases = new Array<string>('');
      let result: String = ''
      testCases.forEach((testCase) => {
        result = processString(testCase);
        console.log('Processed string:', result);
      });
      await Utils.msSleep(120);
      expect('').assertEqual(result);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3500
     * @tc.name builtinsStatementForOfTest3500
     * @tc.desc test Const map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testMapWithException = new Map<string, string>([
        ['name', 'Alice'],
      ]);
      const processedResultsWithException = processMap(testMapWithException);
      console.log('Processed results with exception handling:', processedResultsWithException);
      await Utils.msSleep(120);
      expect('Processed name: Alice').assertEqual(processedResultsWithException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3600
     * @tc.name builtinsStatementForOfTest3600
     * @tc.desc test Const set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testSetWithException = new Set<string>(['Alice', 'Bob', 'Charlie']);
      const setException = processSet(testSetWithException);
      await Utils.msSleep(120);
      expect('Processed value: Alice,Processed value: Bob,Processed value: Charlie')
        .assertEqual(setException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3700
     * @tc.name builtinsStatementForOfTest3700
     * @tc.desc test COnst iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testIteratorWithException = new Set<string>(['abc', 'Tom', 'Sala']);
      const iteratorException = processSetWithIterator(testIteratorWithException);
      await Utils.msSleep(120);
      expect('Processed value: abc,Processed value: Tom,Processed value: Sala')
        .assertEqual(iteratorException.toString());
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3800
     * @tc.name builtinsStatementForOfTest3800
     * @tc.desc test Const Untyped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let mixedArray = new Array<Int | Array<Int>>();
      mixedArray.push(1);
      let element2 = new Array<Int>(5, 6, 7);
      mixedArray.push(element2);
      let a: number = 1
      for (let item of mixedArray) {
        console.log(`Item type: ${typeof item}, Item value:`, item);
        if (Array.isArray(item)) {
          console.log('This is an array with elements:');
          let childItem = item as Array<Int>;
          for (let subItem of childItem) {
            console.log(`Sub-item: ${subItem}`);
          }
          if (item === mixedArray[1]) {
            a = childItem[0] as number;
          }
          ;
        } else {
          console.log('This is a non-array item.');
        }
        ;
      }
      ;
      await Utils.msSleep(120);
      expect(a).assertEqual(5);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_3900
     * @tc.name builtinsStatementForOfTest3900
     * @tc.desc test For-of nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      let stringElements = new Array<Int>();
      for (const row of matrix) {
        for (const element of row) {
          console.log('==========', string(element));
          stringElements.push(element);
        }
      }
      ;
      await Utils.msSleep(100);
      expect(stringElements.toString()).assertEqual('1,2,3,4,5,6,7,8,9');
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4000
     * @tc.name builtinsStatementForOfTest4000
     * @tc.desc test Nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      let rowIndex = 0;
      const positions = new Array<string>();
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
      await Utils.msSleep(120);
      expect('0, 0,0, 1,0, 2,1, 0,1, 1,1, 2,2, 0,2, 1,2, 2')
        .assertEqual(positions.toString());
      done();

    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4100
     * @tc.name builtinsStatementForOfTest4100
     * @tc.desc test Number of layers: 5 layers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      for (const dim1 of array5D) {
        let index1 = 0;
        for (const dim2 of dim1) {
          let index2 = 0;
          for (const dim3 of dim2) {
            let index3 = 0;
            for (const dim4 of dim3) {
              let index4 = 0;
              for (let element of dim4) {
                let indices = new Array<number>(index1, index2, index3, index4);
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
      await Utils.msSleep(120);
      expect(16).assertEqual(num);
      done();

    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4200
     * @tc.name builtinsStatementForOfTest4200
     * @tc.desc test Number of layers: 10 layers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 0;
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
                          let indices = new Array<number>(index1, index2, index3, index4, index5, index6, index7, index8, index9);
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
      await Utils.msSleep(120);
      expect(8).assertEqual(num); // 确保遍历了所有的元素
      done();

    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4300
     * @tc.name builtinsStatementForOfTest4300
     * @tc.desc test Define variables on the outer layer and assign values in the loop to see if they can be obtained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let foundValue: number | null = null;
      let foundIndex: number | null = null;
      const array1D = new Array<number>(10, 20, 30, 40, 50);
      for (const element of array1D) {
        const currentIndex = array1D.indexOf(element);
        if (element === 30) {
          foundValue = element;
          foundIndex = currentIndex;
          break;
        }
      }
      await Utils.msSleep(120);
      expect(30).assertEqual(foundValue);
      expect(2).assertEqual(foundIndex);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_OF_TEST_4400
     * @tc.name builtinsStatementForOfTest4400
     * @tc.desc test Define variables on the outer layer and assign values in the loop to see if they can be obtained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForOfTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const currentIndex: string = ''
      const array = new Array<number>(10, 20, 30, 40, 50);
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
      done();
    })
  })
}