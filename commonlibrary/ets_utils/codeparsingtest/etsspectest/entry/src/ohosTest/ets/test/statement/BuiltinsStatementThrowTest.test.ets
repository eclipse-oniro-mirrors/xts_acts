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
  Input2,
  positiveNumbers,
  throwDivisor,
  throwUsers,
  UserWithAddressAddress
} from '../../testability/pages/ThrowMethod';

let flag: number = 0

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function builtinsStatementThrowTest() {
  describe('builtinsStatementThrowTest', () => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0100
     * @tc.name builtinsStatementThrow0100
     * @tc.desc test Throw one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsStatementThrow0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (Done: Function) => {
      try {
        throwDivisor(1, 0);
      } catch (error) {
        console.error(error.message);
        flag = 1
        expect(error.message).assertEqual('The divisor cannot be zero')
      }
      expect(flag).assertEqual(1)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0200
     * @tc.name builtinsStatementThrow0200
     * @tc.desc test Throw multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementThrow0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        throwUsers('ab', 20);
      } catch (error) {
        console.error('Validation failed:', error.message);
        flag = 2;
        expect(error.message).assertEqual('The username must contain at least 3 characters');
      }
      expect(flag).assertEqual(2);
      await sleep(100);
      try {
        throwUsers('alice', 16);
      } catch (error) {
        console.error('Validation failed:', error.message);
        flag = 3;
        expect(error.message).assertEqual('Age must be numeric and greater than or equal to 18 years');
      }
      await sleep(100);
      expect(flag).assertEqual(3);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0300
     * @tc.name builtinsStatementThrow0300
     * @tc.desc test Inside the for loop throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementThrow0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        console.log('Testing testData1:');
        positiveNumbers([1, 0, 3, 4, 5]);
      } catch (error) {
        console.error('Error in testData1:', error.message);
        flag = 4;
        expect(error.message).assertEqual('The number cannot be zero');
      }
      expect(flag).assertEqual(4);
      await sleep(100);
      try {
        console.log('Testing testData2:');
        positiveNumbers([1, 2, -3, 4, 5]);
      } catch (error) {
        console.error('Error in testData2:', error.message);
        flag = 5;
        expect(error.message).assertEqual('Numbers should not be negative');
      }
      expect(flag).assertEqual(5);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0400
     * @tc.name builtinsStatementThrow0400
     * @tc.desc test Inside the for loop throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementThrow0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        console.log('Testing testData1:');
        UserWithAddressAddress('Alice', 30, '123');
      } catch (error) {
        console.error('Error in testData1:', error.message);
        flag = 6;
        expect(error.message).assertEqual('address length must be between 5 and 20 characters');
      }
      expect(flag).assertEqual(6);
      await sleep(100);
      try {
        console.log('Testing testData2:');
        UserWithAddressAddress('ab', 30, '123 Main St Wonderland');
      } catch (error) {
        console.error('Error in testData2:', error.message);
        flag = 7;
        expect(error.message).assertEqual('Username too short: must be at least 3 characters long');
      }
      expect(flag).assertEqual(7);
      await sleep(100);
      try {
        console.log('Testing testData3:');
        UserWithAddressAddress('abb', 10, '123 Main St Wonderland');
      } catch (error) {
        console.error('Error in testData3:', error.message);
        flag = 8;
        expect(error.message).assertEqual('Age too young: must be at least 18 years old');
      }
      expect(flag).assertEqual(8);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0500
     * @tc.name builtinsStatementThrow0500
     * @tc.desc test Uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = Input2(1, 0);
      expect(a).assertEqual(null);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_THROW_TEST_0600
     * @tc.name builtinsStatementThrow0600
     * @tc.desc test Uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        throw new Error('This is a global error');
      } catch (err) {
        expect(err.message).assertEqual('This is a global error');
      }
      Done();
    })
  })
}