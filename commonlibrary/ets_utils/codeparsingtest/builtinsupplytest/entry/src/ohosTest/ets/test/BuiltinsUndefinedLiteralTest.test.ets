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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsUndefinedLiteralTest() {
  describe('BuiltinsUndefinedLiteralTest', () => {
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
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0100
     * @tc.name BuiltinsUndefinedLiteralTest0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0100';
      console.log(`${caseName} test start`);
      let simpleUndefinedVar = undefined;
      expect(simpleUndefinedVar).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0200
     * @tc.name BuiltinsUndefinedLiteralTest0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0200';
      console.log(`${caseName} test start`);
      let arrayWithUndefined = ['element1', undefined, 'element3', undefined, 'element5'];
      let firstUndefinedIndex = 1;
      let secondUndefinedIndex = 3;
      expect(arrayWithUndefined[firstUndefinedIndex]).assertEqual(undefined);
      expect(arrayWithUndefined[secondUndefinedIndex]).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0300
     * @tc.name BuiltinsUndefinedLiteralTest0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0300';
      console.log(`${caseName} test start`);
      let multiDimensionalArray = [
        [1, undefined, 3], [9, undefined, 11]
      ];
      let innerUndefinedIndex1 = 1;
      let innerUndefinedIndex2 = 1;
      expect(multiDimensionalArray[0][innerUndefinedIndex1]).assertEqual(undefined);
      expect(multiDimensionalArray[1][innerUndefinedIndex2]).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0400
     * @tc.name BuiltinsUndefinedLiteralTest0400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0400';
      console.log(`${caseName} test start`);
      let condition1 = false;
      let condition2 = false;
      let condition3 = true;
      let resultFromTernary = condition1? 'value1' : (condition2? 'value2' : (condition3? undefined : 'value3'));
      expect(resultFromTernary).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0500
     * @tc.name BuiltinsUndefinedLiteralTest0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0500';
      console.log(`${caseName} test start`);
      let value1 = undefined;
      let value2 = undefined;
      let value3 = 'notUndefined';
      let logicalOrResult = value1 || value2 || value3 || undefined;
      expect(logicalOrResult).assertEqual('notUndefined');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0600
     * @tc.name BuiltinsUndefinedLiteralTest0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0600';
      console.log(`${caseName} test start`);
      let setWithUndefined = new Set([1, undefined, 2, undefined, 3]);
      let setHasUndefined = setWithUndefined.has(undefined);
      expect(setHasUndefined).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0700
     * @tc.name BuiltinsUndefinedLiteralTest0700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0700';
      console.log(`${caseName} test start`);
      let mapWithUndefinedKey = new Map([
        [undefined, 'valueForUndefined'],
        ['key1', 'normalValue1'],
        [undefined, 'anotherValueForUndefined']
      ]);
      let valueFromUndefinedKey = mapWithUndefinedKey.get(undefined);
      expect(valueFromUndefinedKey).assertEqual('anotherValueForUndefined');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0800
     * @tc.name BuiltinsUndefinedLiteralTest0800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0800';
      console.log(`${caseName} test start`);
      let unionVar: string | number | undefined = undefined;
      let isUndefinedCheck = typeof unionVar === 'undefined';
      let operationResult = isUndefinedCheck? 'isUndefined' : 'notUndefined';
      expect(operationResult).assertEqual('isUndefined');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_0900
     * @tc.name BuiltinsUndefinedLiteralTest0900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest0900';
      console.log(`${caseName} test start`);
      let unionVar: string | number | undefined = undefined;
      let isUndefinedCheck = typeof unionVar === 'undefined';
      let operationResult = isUndefinedCheck? 'isUndefined' : 'notUndefined';
      expect(operationResult).assertEqual('isUndefined');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1000
     * @tc.name BuiltinsUndefinedLiteralTest1000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1000';
      console.log(`${caseName} test start`);
      let complexArray = [undefined, [undefined, 2], undefined];
      for (let item of complexArray) {
        if (Array.isArray(item)) {
          expect(item[0]).assertEqual(undefined);
        } else {
          expect(item).assertEqual(undefined);
        }
      }
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1100
     * @tc.name BuiltinsUndefinedLiteralTest1100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1100';
      console.log(`${caseName} test start`);
      let counter = 0;
      let undefinedResultInWhile = undefined;
      while (counter < 3) {
        if (counter === 1) {
          undefinedResultInWhile = undefined;
        }
        counter++;
      }
      expect(undefinedResultInWhile).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1200
     * @tc.name BuiltinsUndefinedLiteralTest1200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1200';
      console.log(`${caseName} test start`);
      let doWhileCounter = 0;
      let undefinedResultInDoWhile = undefined;
      do {
        if (doWhileCounter === 2) {
          undefinedResultInDoWhile = undefined;
        }
        doWhileCounter++;
      } while (doWhileCounter < 4);
      expect(undefinedResultInDoWhile).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1300
     * @tc.name BuiltinsUndefinedLiteralTest1300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1300';
      console.log(`${caseName} test start`);
      let switchInput = undefined;
      let switchResult = '';
      switch (switchInput) {
        case undefined:
          switchResult = 'isUndefined';
          break;
        default:
          switchResult = 'defaultCase';
      }
      expect(switchResult).assertEqual('isUndefined');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1400
     * @tc.name BuiltinsUndefinedLiteralTest1400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1400';
      console.log(`${caseName} test start`);
      let ifInput = undefined;
      let ifResult = '';
      if (ifInput === 'value') {
        ifResult = 'isValue';
      } else if (typeof ifInput === 'undefined') {
        ifResult = 'isUndefined';
      } else {
        ifResult = 'other';
      }
      expect(ifResult).assertEqual('isUndefined');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1500
     * @tc.name BuiltinsUndefinedLiteralTest1500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1500';
      console.log(`${caseName} test start`);
      interface Field{
        subField1:string,
        subField2:undefined
      }
      interface Obj{
        field1:undefined,
        field2:Field
      }
      let objectWithUndefinedForJSON:Obj = {
        field1: undefined,
        field2: {
          subField1: 'data',
          subField2: undefined
        }
      };
      let jsonString = JSON.stringify(objectWithUndefinedForJSON);
      let parsedObject:Obj = JSON.parse(jsonString);
      expect(parsedObject.field1).assertEqual(undefined);
      expect(parsedObject.field2.subField2).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1600
     * @tc.name BuiltinsUndefinedLiteralTest1600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1600';
      console.log(`${caseName} test start`);
      let undefinedValue = undefined;
      let numberValue = 0;
      let stringValue = '';
      let isUndefinedEqualToNumber = undefinedValue === numberValue;
      let isUndefinedEqualToString = undefinedValue === stringValue;
      let isUndefinedEqualToUndefined = undefinedValue === undefined;
      expect(isUndefinedEqualToNumber).assertEqual(false);
      expect(isUndefinedEqualToString).assertEqual(false);
      expect(isUndefinedEqualToUndefined).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1700
     * @tc.name BuiltinsUndefinedLiteralTest1700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1700';
      console.log(`${caseName} test start`);
      let arrayForFilterAndMap = [undefined, 1, undefined, 2];
      let filteredArray = arrayForFilterAndMap.filter(item => item!== undefined);
      let mappedArray = arrayForFilterAndMap.map(item => item === undefined? 'replaced' : item);
      expect(JSON.stringify(filteredArray)).assertEqual(JSON.stringify([1, 2]));
      expect(JSON.stringify(mappedArray)).assertEqual(JSON.stringify(['replaced', 1, 'replaced', 2]));
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1800
     * @tc.name BuiltinsUndefinedLiteralTest1800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1800';
      console.log(`${caseName} test start`);
      let firstUndefined = undefined;
      let secondUndefined = undefined;
      let thirdValue = 'validValue';
      let nullishCoalesceResult = firstUndefined?? secondUndefined?? thirdValue;
      expect(nullishCoalesceResult).assertEqual('validValue');
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_1900
     * @tc.name BuiltinsUndefinedLiteralTest1900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest1900';
      console.log(`${caseName} test start`);
      let outerCondition = false;
      let innerCondition1 = false;
      let innerCondition2 = true;
      let nestedTernaryResult = outerCondition? 'outerTrue' : (innerCondition1? 'inner1True' : (innerCondition2? undefined : 'inner2False'));
      expect(nestedTernaryResult).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2000
     * @tc.name BuiltinsUndefinedLiteralTest2000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2000';
      console.log(`${caseName} test start`);
      let logicalOperand1 = undefined;
      let logicalOperand2 = 'data';
      let shortCircuitAnd = logicalOperand1 && logicalOperand2;
      let shortCircuitOr = logicalOperand1 || logicalOperand2;
      expect(shortCircuitAnd).assertEqual(undefined);
      expect(shortCircuitOr).assertEqual('data');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2100
     * @tc.name BuiltinsUndefinedLiteralTest2100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2100';
      console.log(`${caseName} test start`);
      let loopArray = [1, undefined, 3];
      let loopResult = undefined;
      for (let element of loopArray) {
        if (element === undefined) {
          loopResult = undefined;
          break;
        }
      }
      expect(loopResult).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2200
     * @tc.name BuiltinsUndefinedLiteralTest2200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2200';
      console.log(`${caseName} test start`);
      class MyClass {
        prop1: string;
        prop2: undefined;
        constructor(prop1:string,prop2:undefined) {
          this.prop1 =prop1;
          this.prop2 =prop2;
        }
      }
      let myInstance = new MyClass("hello",undefined);
      expect(myInstance.prop2).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2300
     * @tc.name BuiltinsUndefinedLiteralTest2300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2300';
      console.log(`${caseName} test start`);
      let findIndexArray = [1, 2, 3];
      let findIndexResult = findIndexArray.findIndex(item => item === 4);
      expect(findIndexResult).assertEqual(-1);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2400
     * @tc.name BuiltinsUndefinedLiteralTest2400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2400';
      console.log(`${caseName} test start`);
      let promiseWithoutValue = new Promise<undefined>((resolve) => {
        resolve(undefined);
      });
      promiseWithoutValue.then((result) => {
        expect(result).assertEqual(undefined);
      });
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2500
     * @tc.name BuiltinsUndefinedLiteralTest2500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2500';
      console.log(`${caseName} test start`);
      let arr = [1, 2, 3];
      let found = arr.find(item => item > 3);
      expect(found).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2600
     * @tc.name BuiltinsUndefinedLiteralTest2600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2600';
      console.log(`${caseName} test start`);
      let numArr = [10, 20, 30];
      let outOfBounds = numArr[5];
      expect(outOfBounds).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2700
     * @tc.name BuiltinsUndefinedLiteralTest2700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2700';
      console.log(`${caseName} test start`);
      let numArray = [1, 2, 3];
      let someResult = numArray.some(item => item > 5);
      if (!someResult) {
        let methodResult: undefined = undefined;
        expect(methodResult).assertEqual(undefined);
      }
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2800
     * @tc.name BuiltinsUndefinedLiteralTest2800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2800';
      console.log(`${caseName} test start`);
      let mapExample = new Map([['key1', 'value1']]);
      let nonExistentEntry = mapExample.get('key2');
      expect(nonExistentEntry).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_2900
     * @tc.name BuiltinsUndefinedLiteralTest2900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest2900';
      console.log(`${caseName} test start`);
      let sparseArray = [1,, 3];
      let nonExistentSparseIndex = sparseArray[1];
      expect(nonExistentSparseIndex).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_UNDEFINED_LITERAL_TEST_3000
     * @tc.name BuiltinsUndefinedLiteralTest3000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsUndefinedLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsUndefinedLiteralTest3000';
      console.log(`${caseName} test start`);
      let text = "Hello, World!";
      let match = text.match(/(\d+)/);
      let nonExistentGroup = match? match[1] : undefined;
      expect(nonExistentGroup).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}