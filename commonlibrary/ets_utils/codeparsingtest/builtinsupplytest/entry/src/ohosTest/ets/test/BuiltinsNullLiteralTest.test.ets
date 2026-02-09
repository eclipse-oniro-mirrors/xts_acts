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

export default function BuiltinsNullLiteralTest() {
  describe('BuiltinsNullLiteralTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   BuiltinsNullLiteralTest0100
     * @tc.number SUB_NULL_LITERAL_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0100';
      console.log(`${caseName} test start`);
      let var1: null = null;
      expect(var1).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest0200
     * @tc.number SUB_NULL_LITERAL_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0200';
      console.log(`${caseName} test start`);
      let arr1 = [1, null, 3];
      expect(arr1[1]).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest0300
     * @tc.number SUB_NULL_LITERAL_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0300';
      console.log(`${caseName} test start`);
      interface Obj{
        a:string,
        b:null
      }
      let obj1:Obj = { a: 'hello', b: null };
      expect(obj1.b).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest0400
     * @tc.number SUB_NULL_LITERAL_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0400';
      console.log(`${caseName} test start`);
      interface Null{
        d:null
      }
      interface Obj{
        c:Null
      }
      let obj2:Obj = { c: { d: null } };
      expect(obj2.c.d).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest0500
     * @tc.number SUB_NULL_LITERAL_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0500';
      console.log(`${caseName} test start`);
      let result1 = false? 'trueValue' : null;
      expect(result1).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsNullLiteralTest0600
     * @tc.number SUB_NULL_LITERAL_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0600';
      console.log(`${caseName} test start`);
      let result2 = null || 'default';
      expect(result2).assertEqual('default');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest0700
     * @tc.number SUB_NULL_LITERAL_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0700';
      console.log(`${caseName} test start`);
      let arrayWithNull = [10, null, 20, null, 30];
      let firstNullIndex = 1;
      let secondNullIndex = 3;
      expect(arrayWithNull[firstNullIndex]).assertEqual(null);
      expect(arrayWithNull[secondNullIndex]).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest0800
     * @tc.number SUB_NULL_LITERAL_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0800';
      console.log(`${caseName} test start`);
      let value1 = null;
      let value2 = 'notNull';
      let logicalOrResult = value1 || value2 || null;
      let logicalAndResult = value1 && value2 && null;
      expect(logicalOrResult).assertEqual('notNull');
      expect(logicalAndResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest0900
     * @tc.number SUB_NULL_LITERAL_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest0900';
      console.log(`${caseName} test start`);
      let originalArray = [1, null, 3];
      let spreadArray = [...originalArray, null, 5];
      let firstSpreadNullIndex = 1;
      let secondSpreadNullIndex = 3;
      expect(spreadArray[firstSpreadNullIndex]).assertEqual(null);
      expect(spreadArray[secondSpreadNullIndex]).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest1000
     * @tc.number SUB_NULL_LITERAL_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1000';
      console.log(`${caseName} test start`);
      let setWithNull = new Set([1, null, 2, null, 3]);
      let setHasNull = setWithNull.has(null);
      expect(setHasNull).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest1100
     * @tc.number SUB_NULL_LITERAL_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1100';
      console.log(`${caseName} test start`);
      let mapWithNullKey = new Map([[null, 'valueForNull'], ['key', 'normalValue']]);
      let valueFromNullKey = mapWithNullKey.get(null);
      expect(valueFromNullKey).assertEqual('valueForNull');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest1200
     * @tc.number SUB_NULL_LITERAL_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1200';
      console.log(`${caseName} test start`);
      let unionVar: string | number | null = null;
      let isNullCheck = unionVar === null;
      let operationResult = isNullCheck? 'isNull' : 'notNull';
      expect(operationResult).assertEqual('isNull');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest1300
     * @tc.number SUB_NULL_LITERAL_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1300';
      console.log(`${caseName} test start`);
      let complexArray = [null, [null, 2], null];
      for (let item of complexArray) {
        if (Array.isArray(item)) {
          expect(item[0]).assertEqual(null);
        } else {
          expect(item).assertEqual(null);
        }
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest1400
     * @tc.number SUB_NULL_LITERAL_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1400';
      console.log(`${caseName} test start`);
      let counter = 0;
      let nullResultInWhile = null;
      while (counter < 2) {
        nullResultInWhile = null;
        counter++;
      }
      expect(nullResultInWhile).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest1500
     * @tc.number SUB_NULL_LITERAL_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1500';
      console.log(`${caseName} test start`);
      let doWhileCounter = 0;
      let nullResultInDoWhile = null;
      do {
        nullResultInDoWhile = null;
        doWhileCounter++;
      } while (doWhileCounter < 2);
      expect(nullResultInDoWhile).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest1600
     * @tc.number SUB_NULL_LITERAL_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1600';
      console.log(`${caseName} test start`);
      let switchInput = null;
      let switchResult = '';
      switch (switchInput) {
        case null:
          switchResult = 'isNull';
          break;
        default:
          switchResult = 'defaultCase';
      }
      expect(switchResult).assertEqual('isNull');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest1700
     * @tc.number SUB_NULL_LITERAL_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1700';
      console.log(`${caseName} test start`);
      let ifInput = null;
      let ifResult = '';
      if (ifInput === 'value') {
        ifResult = 'isValue';
      } else if (ifInput === null) {
        ifResult = 'isNull';
      } else {
        ifResult = 'other';
      }
      expect(ifResult).assertEqual('isNull');
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest1800
     * @tc.number SUB_NULL_LITERAL_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1800';
      console.log(`${caseName} test start`);
      interface Obj{
        field1:null,
        field2:string
      }
      let objectWithNullForJSON:Obj = { field1: null, field2: 'data' };
      let jsonString = JSON.stringify(objectWithNullForJSON);
      let parsedObject:Obj = JSON.parse(jsonString);
      expect(parsedObject.field1).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.name   BuiltinsNullLiteralTest1900
     * @tc.number SUB_NULL_LITERAL_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest1900';
      console.log(`${caseName} test start`);
      let nullValue = null;
      let numberValue = 0;
      let stringValue = '';
      let isNullEqualToNumber = nullValue === numberValue;
      let isNullEqualToString = nullValue === stringValue;
      let isNullEqualToNull = nullValue === null;
      expect(isNullEqualToNumber).assertEqual(false);
      expect(isNullEqualToString).assertEqual(false);
      expect(isNullEqualToNull).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest2000
     * @tc.number SUB_NULL_LITERAL_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2000';
      console.log(`${caseName} test start`);
      let arrayForFilterAndMap = [null, 1, null, 2];
      let filteredArray = arrayForFilterAndMap.filter(item => item!== null);
      let mappedArray = arrayForFilterAndMap.map(item => item === null? 'replaced' : item);
      expect(JSON.stringify(filteredArray)).assertEqual(JSON.stringify([1, 2]));
      expect(JSON.stringify(mappedArray)).assertEqual(JSON.stringify(['replaced', 1, 'replaced', 2]));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2100
     * @tc.number SUB_NULL_LITERAL_TEST_2100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2100';
      console.log(`${caseName} test start`);
      let firstNullish = null;
      let secondNullish = null;
      let thirdValue = 'validValue';
      let nullishCoalesceResult = firstNullish?? secondNullish?? thirdValue;
      expect(nullishCoalesceResult).assertEqual('validValue');
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2200
     * @tc.number SUB_NULL_LITERAL_TEST_2200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2200';
      console.log(`${caseName} test start`);
      let outerCondition = false;
      let innerCondition1 = false;
      let innerCondition2 = true;
      let nestedTernaryResult = outerCondition? 'outerTrue' : (innerCondition1? 'inner1True' : (innerCondition2? null : 'inner2False'));
      expect(nestedTernaryResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2300
     * @tc.number SUB_NULL_LITERAL_TEST_2300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2300';
      console.log(`${caseName} test start`);
      let logicalOperand1 = null;
      let logicalOperand2 = 'data';
      let shortCircuitAnd = logicalOperand1 && logicalOperand2;
      let shortCircuitOr = logicalOperand1 || logicalOperand2;
      expect(shortCircuitAnd).assertEqual(null);
      expect(shortCircuitOr).assertEqual('data');
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsNullLiteralTest2400
     * @tc.number SUB_NULL_LITERAL_TEST_2400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2400';
      console.log(`${caseName} test start`);
      let loopArray = [1, null, 3];
      let loopResult = null;
      for (let element of loopArray) {
        if (element === null) {
          loopResult = null;
          break;
        }
      }
      expect(loopResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2500
     * @tc.number SUB_NULL_LITERAL_TEST_2500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2500';
      console.log(`${caseName} test start`);
      let comparisonValue = null;
      let logicalValue = true;
      let assignmentResult = null;
      if (comparisonValue === null && logicalValue) {
        assignmentResult = null;
      }
      expect(assignmentResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest2600
     * @tc.number SUB_NULL_LITERAL_TEST_2600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2600';
      console.log(`${caseName} test start`);
      let firstVal: number | null = null;
      let secondVal: string | null = null;
      let thirdVal: boolean | null = false;
      let complexConditionResult = firstVal === null && secondVal === null && thirdVal === false? null : 'non - null';
      expect(complexConditionResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2700
     * @tc.number SUB_NULL_LITERAL_TEST_2700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2700';
      console.log(`${caseName} test start`);
      let text = 'Some text here';
      let matchResult: RegExpMatchArray | null = text.match(/xyz/);
      expect(matchResult).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsNullLiteralTest2800
     * @tc.number SUB_NULL_LITERAL_TEST_2800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2800';
      console.log(`${caseName} test start`);
      let promiseResult: Promise<null> = new Promise((resolve) => {
        resolve(null);
      });
      promiseResult.then((result) => {
        expect(result).assertEqual(null);
      });
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest2900
     * @tc.number SUB_NULL_LITERAL_TEST_2900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest2900';
      console.log(`${caseName} test start`);
      let possibleNumber: string | null = null;
      let convertedNumber = possibleNumber? parseInt(possibleNumber) : null;
      expect(convertedNumber).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsNullLiteralTest3000
     * @tc.number SUB_NULL_LITERAL_TEST_3000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsNullLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsNullLiteralTest3000';
      console.log(`${caseName} test start`);
      let myMap = new Map<null, string>();
      myMap.set(null, 'Value for null key');
      let retrievedValue = myMap.get(null);
      expect(retrievedValue).assertEqual('Value for null key');
      console.log(`${caseName} test end`);
      Done();
    })
  })
}