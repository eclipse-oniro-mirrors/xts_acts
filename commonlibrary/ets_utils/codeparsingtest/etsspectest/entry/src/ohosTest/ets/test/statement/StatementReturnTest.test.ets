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
import {
  addNumbers,
  filterOddNumbers,
  filterOddNumbersWithNestedLoop,
  filterOddOrZero,
  anyReturn,
  MyClass,
  MyClass1,
  returnVoid,
  filterOddNumbersVoid,
  filterOddNumbersWithNestedLoopVoid,
  filterOddOrZeroVoid,
  TestClass,
  createAddFunction,
} from '../../testability/pages/SequenceRunnerSendableTest'

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function builtinsStatementReturnTest() {
  describe('builtinsStatementReturnTest', () => {
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
     * @tc.name   builtinsStatementReturnTest_0100
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0100
     * @tc.desc   test Inside the body of a function or method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementReturnTest_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (Done: Function) => {
        const result = addNumbers(5, 10);
        expect(15).assertEqual(result);
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0200
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0200
     * @tc.desc   test return with computed expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const result = createAddFunction(5, 10);
        expect(15).assertEqual(result());
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0300
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0300
     * @tc.desc   test In-loop use
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbers(numbers);
        expect('1,3,5,7,9').assertEqual(oddNumbers.toString());
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0400
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0400
     * @tc.desc   test nested loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbersWithNestedLoop(numbers);
        expect('1,3,5,7,9').assertEqual(oddNumbers.toString());
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0500
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0500
     * @tc.desc   test Used in conditional statements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = 1;
        const oddNumbers = filterOddOrZero(numbers);
        expect(1).assertEqual(oddNumbers);
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0600
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0600
     * @tc.desc   test sequenceRunner task with string error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = 1;
        const key: number = anyReturn(numbers);
        expect(11).assertEqual(key);
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0700
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0700
     * @tc.desc   test Inside the body of the constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const instance = new MyClass(42);
        expect(42).assertEqual(instance.value);
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0800
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0800
     * @tc.desc   test conditional presence return the outside doesn't exist either return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const instance = new MyClass1();
        expect(42).assertEqual(instance.value);
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_0900
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0900
     * @tc.desc   test Inside the body of a function or method whose return type is void
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const key = returnVoid(1);
        expect(undefined).assertEqual(JSON.stringify(key));
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_1000
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1000
     * @tc.desc   test In-loop with void use
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbersVoid(numbers);
        expect(undefined).assertEqual(JSON.stringify(oddNumbers));
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_1100
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1100
     * @tc.desc   test nested loop with void
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbersWithNestedLoopVoid(numbers);
        expect(undefined).assertEqual(JSON.stringify(oddNumbers));
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_1200
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1200
     * @tc.desc   test Used in conditional statements with void
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const numbers = 1;
        const oddNumbers = filterOddOrZeroVoid(numbers);
        console.log('this filterOddOrZero number is :', oddNumbers);
        expect(undefined).assertEqual(JSON.stringify(oddNumbers));
        Done();
      })
    /**
     * @tc.name   builtinsStatementReturnTest_1300
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1300
     * @tc.desc   test Whether internal use affects external use
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementReturnTest_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const instance = new TestClass();
        const result1 = instance.setValueAndReturn(42);
        const result2 = instance.getValue();
        expect(result1).assertEqual((result2));
        Done();
      })
  })
}