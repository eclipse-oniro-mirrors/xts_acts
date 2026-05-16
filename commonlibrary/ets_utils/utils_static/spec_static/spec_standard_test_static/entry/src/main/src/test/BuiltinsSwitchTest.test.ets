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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import {
  getCharacterType,
  ColorSet,
  processPerson,
  Person,
  oneCaseClause,
  // anySameCaseClause,
  anyCaseClause,
  breakCaseClause,
  // nullUndefinedCaseClause,
  // undefinedCaseClause,
  // nullCaseClause,
  breakAnyCaseDefaultClause,
  breakNotCaseDefaultClause,
  describeDayAndHour,
  handleUserAction,
  nestedSwitchExample,
} from './pages/SequenceRunnerTaskMethodTest'

export default function builtinsSwitchTest() {
  describe('builtinsStatementSwitchTest', (): void => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_2100
     * @tc.name builtinsStatementSwitchTest_2100
     * @tc.desc test expression with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const thisChar = 'A';
        const getChar: string = getCharacterType(thisChar);
        expect('Uppercase letter').assertEqual(getChar);
        done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_2300
     * @tc.name builtinsStatementSwitchTest_2300
     * @tc.desc test expression with object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const person: Person = {
          name: 'Alice', age: 30, role: 'admin'
        };
        const getObject: string = processPerson(person);
        expect('Alice is an admin.').assertEqual(getObject);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_2400
     * @tc.name builtinsStatementSwitchTest_2400
     * @tc.desc test one caseClause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const key: string = oneCaseClause(1);
        expect('the number is 1').assertEqual(key);
        done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_2800
     * @tc.name builtinsStatementSwitchTest_2800
     * @tc.desc test switch with break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const key: string = breakCaseClause(1);
        expect('The value is one.').assertEqual(key);
        done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3200
     * @tc.name builtinsStatementSwitchTest_3200
     * @tc.desc test switch no break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const key: string = anyCaseClause(1);
        expect('the number is 1').assertEqual(key);
        done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3400
     * @tc.name builtinsStatementSwitchTest_3400
     * @tc.desc test switch break with case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const key: string = breakAnyCaseDefaultClause(1);
        expect('The value is one.').assertEqual(key);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3500
     * @tc.name builtinsStatementSwitchTest_3500
     * @tc.desc test switch break with not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const key: string = breakNotCaseDefaultClause(1);
        expect('The value is 1.').assertEqual(key);
        done();
      });
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3600
     * @tc.name builtinsStatementSwitchTest_3600
     * @tc.desc test switch whether the medium assignment is available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: string = '';
        let additionalInfo: string = 'No additional info.';
        const value: number = 1;
        switch (value as int) {
          case 0:
            result = 'The value is zero.';
            additionalInfo = 'Zero is special.';
            break;
          case 1:
            result = 'The value is one.';
            additionalInfo = 'One is also special.';
            break;
          case 42:
            result = 'The value is the answer to life, the universe, and everything.';
            additionalInfo = '42 is the ultimate answer.';
            break;
          default:
            result = `The value is ${value}.`;
            additionalInfo = 'No special meaning.';
        }
        expect('The value is one.').assertEqual(result);
        expect('One is also special.').assertEqual(additionalInfo);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3700
     * @tc.name builtinsStatementSwitchTest_3700
     * @tc.desc test nest switch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let key1: string = describeDayAndHour(0, 8);
        let key2: string = describeDayAndHour(1, 9);
        let key3: string = describeDayAndHour(2, 10);
        let key4: string = describeDayAndHour(3, 12);
        console.log(describeDayAndHour(0, 8));
        console.log(describeDayAndHour(1, 9));
        console.log(describeDayAndHour(2, 10));
        console.log(describeDayAndHour(3, 12));
        expect('Today is Sunday. It\'s 8 AM. Time for breakfast.').assertEqual(key1);
        expect('Today is Monday. It\'s 9 AM. Time to start work.').assertEqual(key2);
        expect('Today is Tuesday. It\'s 10 AM. Time for a meeting.').assertEqual(key3);
        expect(' It\'s another day of the week.').assertEqual(key4);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_3800
     * @tc.name builtinsStatementSwitchTest_3800
     * @tc.desc test nest switch caseClause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let key1: string = handleUserAction(1, 1);
        let key2: string = handleUserAction(1, 2);
        let key3: string = handleUserAction(2, 1);
        let key4: string = handleUserAction(3, 1);
        console.log(handleUserAction(1, 1));
        console.log(handleUserAction(1, 2));
        console.log(handleUserAction(2, 1));
        console.log(handleUserAction(3, 1));
        expect('Category 1 selected. Action 1 in Category 1.').assertEqual(key1);
        expect('Category 1 selected. Action 2 in Category 1.').assertEqual(key2);
        expect('Category 2 selected. Action 1 in Category 2.').assertEqual(key3);
        expect('Unknown category.').assertEqual(key4);
        done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_SWITCH_TEST_4000
     * @tc.name builtinsStatementSwitchTest_4000
     * @tc.desc test nest switch defaultClause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementSwitchTest_4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let key1: string = nestedSwitchExample(1, 1);
        let key2: string = nestedSwitchExample(1, 3);
        let key3: string = nestedSwitchExample(2, 2);
        let key4: string = nestedSwitchExample(3, 1);
        console.log(nestedSwitchExample(1, 1));
        console.log(nestedSwitchExample(1, 3));
        console.log(nestedSwitchExample(2, 2));
        console.log(nestedSwitchExample(3, 1));
        expect('Value1 is 1. Value2 is 1.').assertEqual(key1);
        expect('Value1 is 1. Value2 is not 1 or 2.').assertEqual(key2);
        expect('Value1 is 2. Value2 is 2.').assertEqual(key3);
        expect('Value1 is not 1 or 2.').assertEqual(key4);
        done();
      })
  })
}