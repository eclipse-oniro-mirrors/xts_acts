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
  addNumbers,
  filterOddNumbers,
  filterOddNumbersWithNestedLoop,
  filterOddOrZero,
  // anyReturn,
  MyClass,
  MyClass1,
  returnVoid,
  filterOddNumbersVoid,
  filterOddNumbersWithNestedLoopVoid,
  filterOddOrZeroVoid,
  TestClass,
  createAddFunction,
} from './pages/SequenceRunnerSendableTest'

export default function builtinsReturnTest() {
  describe('builtinsStatementReturnTest', (): void => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0100
     * @tc.name builtinsStatementReturnTest_0100
     * @tc.desc test Inside the body of a function or method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result = addNumbers(5, 10);
        expect(15).assertEqual(result);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0200
     * @tc.name builtinsStatementReturnTest_0200
     * @tc.desc test return with computed expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result = createAddFunction(5, 10);
        expect(15).assertEqual(result());
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0300
     * @tc.name builtinsStatementReturnTest_0300
     * @tc.desc test In-loop use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbers(numbers);
        expect('1,3,5,7,9').assertEqual(oddNumbers.toString());
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0400
     * @tc.name builtinsStatementReturnTest_0400
     * @tc.desc test nested loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const oddNumbers = filterOddNumbersWithNestedLoop(numbers);
        expect('1,3,5,7,9').assertEqual(oddNumbers.toString());
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0500
     * @tc.name builtinsStatementReturnTest_0500
     * @tc.desc test Used in conditional statements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const numbers = 1;
        const oddNumbers = filterOddOrZero(numbers);
        expect(1).assertEqual(oddNumbers);
        done();
      })
    // 无效用例
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0600
     * @tc.name builtinsStatementReturnTest_0600
     * @tc.desc test sequenceRunner task with string error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementReturnTest_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: () => void): Promise<void> => {
    //     const numbers = 1;
    //     const key: number = anyReturn(numbers);
    //     expect(11).assertEqual(key);
    //     done();
    //   })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0700
     * @tc.name builtinsStatementReturnTest_0700
     * @tc.desc test Inside the body of the constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const instance = new MyClass(42);
        expect(42).assertEqual(instance.value);
        done();
      })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0800
     * @tc.name builtinsStatementReturnTest_0800
     * @tc.desc test conditional presence return the outside doesn't exist either return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const instance = new MyClass1();
        expect(42).assertEqual(instance.value);
        done();
      })
    // 无效用例
    // /**
    //  * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_0900
    //  * @tc.name builtinsStatementReturnTest_0900
    //  * @tc.desc test Inside the body of a function or method whose return type is void
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStatementReturnTest_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: () => void): Promise<void> => {
    //     const key = returnVoid(1);
    //     expect(undefined).assertEqual(JSON.stringify(key));
    //     done();
    //   })
    // 无效用例
    // /**
    //  * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1000
    //  * @tc.name builtinsStatementReturnTest_1000
    //  * @tc.desc test In-loop with void use
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStatementReturnTest_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: () => void): Promise<void> => {
    //     const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //     const oddNumbers = filterOddNumbersVoid(numbers);
    //     expect(undefined).assertEqual(JSON.stringify(oddNumbers));
    //     done();
    //   })
    // 无效用例
    // /**
    //  * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1100
    //  * @tc.name builtinsStatementReturnTest_1100
    //  * @tc.desc test nested loop with void
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 1
    //  */
    // it('builtinsStatementReturnTest_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: () => void): Promise<void> => {
    //     const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //     const oddNumbers = filterOddNumbersWithNestedLoopVoid(numbers);
    //     expect(undefined).assertEqual(JSON.stringify(oddNumbers));
    //     done();
    //   })
    // 无效用例
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1200
     * @tc.name builtinsStatementReturnTest_1200
     * @tc.desc test Used in conditional statements with void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('builtinsStatementReturnTest_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: () => void): Promise<void> => {
    //     const numbers = 1;
    //     const oddNumbers = filterOddOrZeroVoid(numbers);
    //     console.log('this filterOddOrZero number is :', oddNumbers);
    //     expect(undefined).assertEqual(JSON.stringify(oddNumbers));
    //     done();
    //   })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_RETURN_TEST_1300
     * @tc.name builtinsStatementReturnTest_1300
     * @tc.desc test Whether internal use affects external use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementReturnTest_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const instance = new TestClass();
        const result1 = instance.setValueAndReturn(42);
        const result2 = instance.getValue();
        expect(result1).assertEqual((result2));
        done();
      })
  })
}