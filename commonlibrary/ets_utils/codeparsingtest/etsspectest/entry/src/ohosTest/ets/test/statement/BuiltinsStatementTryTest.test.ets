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
import {
  asyncInput,
  bubbleSort,
  Input,
  Input2,
  nestedTryFinally,
  testTryCatch,
  throwDivisor,
} from '../../testability/pages/ThrowMethod';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

let flag: number = 0

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function builtinsStatementTry() {
  describe('builtinsStatementTry', () => {
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
     * @tc.name   builtinsStatementTry0100
     * @tc.number builtinsStatementTry0100
     * @tc.desc   builtinsStatementTry0100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementTry0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (Done: Function) => {
      try {
        testTryCatch();
        throw new Error('Simulated error');
      } catch (error) {
        flag = 1;
        console.error('Error in main block:', error.message);
        expect(error.message).assertEqual('Simulated error');
      }
      expect(flag).assertEqual(1);
      Done();
    })
    /**
     * @tc.name   builtinsStatementTry0200
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0200
     * @tc.desc   test Multiple catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsStatementTry0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      try {
        Input('@');
      } catch (error) {
        console.error('Validation failed:', error.message);
        flag = 2;
        expect(error.message).assertEqual('input error');
      }
      expect(flag).assertEqual(2);
      await sleep(100);
      try {
        Input('@');
      } catch (error) {
        console.error('Validation failed:', error.message);
        flag = 3;
        expect(error.message).assertEqual('input error');
      }
      await sleep(100);
      expect(flag).assertEqual(3);
      Done();
    })
    /**
     * @tc.name   builtinsStatementTry0300
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0300
     * @tc.desc   test And finally used together
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        Input('ab');
      } catch (error) {
        flag = 3;
        console.error('Validation failed:', error.message);
        expect(error.message).assertEqual('input error');
      } finally {
        flag = flag + 1;
        console.info('builtinsStatementTry0300 is executed');
      }
      await sleep(100);
      expect(flag).assertEqual(4);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0400
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0400
     * @tc.desc   test Not and finally used together
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      ;
      try {
        Input('ab');
      } catch (error) {
        flag = 3;
        console.error('Validation failed:', error.message);
        expect(error.message).assertEqual('input error');
      }
      await sleep(100);
      expect(flag).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0500
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0500
     * @tc.desc   test The code block is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      ;
      try {
      } catch (error) {
        console.error('Validation failed:', error.message);
      } finally {
        flag = 5;
        console.info('builtinsStatementTry0300 is executed');
      }
      await sleep(100);
      expect(flag).assertEqual(5);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0600
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0600
     * @tc.desc   test Includes throw
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        Input('@');
      } catch (error) {
        try {
          console.error('Validation failed:', error.message);
          flag = 6
          expect(error.message).assertEqual('input error');
          if (Math.random() < 1) {
            throw new Error('Simulated error in catch execution.');
          }
        } catch (err) {
          flag = flag + 1;
          expect(err.message).assertEqual('Simulated error in catch execution.');
        }
      }
      await sleep(100);
      expect(flag).assertEqual(7);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0700
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0700
     * @tc.desc   test Not used with try
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      asyncInput('###').then(() => {
        console.info('builtinsStatementTry0700 is executed');
      })
        .catch((error: BusinessError) => {
          console.error(error.message);
          expect(error.message).assertEqual('Invalid input');
          flag = 8;
        });
      await sleep(100);
      expect(flag).assertEqual(8);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0800
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0800
     * @tc.desc   test Define variables on the outside
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let errorOccurred = false;
      let errorMessage: string | null = null;
      try {
        Input2(-1, -2);
      } catch (error) {
        errorOccurred = true;
        errorMessage = error.message;
        expect(errorMessage).assertEqual('a and b cannot be negative number');
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(errorOccurred).assertTrue();
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry0900
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0900
     * @tc.desc   test Whether the variables used in the catch can be obtained on the outside
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let errorOccurred = false;
      try {
        Input2(-1, -2);
      } catch (error) {
        let errorOccurred = true;
        let errorMessage: string = '';
        errorMessage = error.message;
        expect(errorMessage).assertEqual('a and b cannot be negative number');
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(errorOccurred).assertFalse();
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1000
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1000
     * @tc.desc   test Whether the variables used in the catch can be obtained on the outside
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try1 execution.');
        }
      } catch (error) {
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try2 execution.');
          }
        } catch (err) {
          console.error(err.message);
          expect(err.message).assertEqual('Simulated error in try2 execution.');
          flag = 10;
        }
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(flag).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1100
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1100
     * @tc.desc   test Nested try catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try1 execution.');
        }
        ;
      } catch (error) {
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try2 execution.');
          }
          ;
        } catch (err) {
          console.error(err.message);
          expect(err.message).assertEqual('Simulated error in try2 execution.');
          flag = 11;
        }
        ;
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(110);
      expect(flag).assertEqual(11);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1200
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1200
     * @tc.desc   test Nested try finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          expect(err.message).assertEqual('Cache read error');
        } finally {
          flag = 12;
        }
      } finally {
        flag = flag + 1;
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(flag).assertEqual(13);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1300
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1300
     * @tc.desc   test Nesting order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result: string = ''
      try {
        result = nestedTryFinally('');
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          expect(error.message).assertEqual('Cache read error');
        }
      } finally {
        expect(result).assertEqual('Get the outer resources\n' +
          'Get the inner layer resources\n' +
          'Release the inner layer resources\n' +
          'Release outer resources');
        flag = 13;
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(flag).assertEqual(13);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1400
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1400
     * @tc.desc   test One finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        throwDivisor(4, 2);
      } finally {
        flag = 14;
      }
      await sleep(100);
      expect(flag).assertEqual(14);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1500
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1500
     * @tc.desc   test And catch together
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        throwDivisor(4, 0);
      } catch (e) {
        expect(e.message).assertEqual('The divisor cannot be zero');
      } finally {
        flag = 15;
      }
      await sleep(100);
      expect(flag).assertEqual(15);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1600
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1600
     * @tc.desc   test The code block is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
      } finally {
        flag = 16;
      }
      await sleep(100);
      expect(flag).assertEqual(16);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1700
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1700
     * @tc.desc   test The code block is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try execution.');
        }
      } catch (e) {
        expect(e.message).assertEqual('Simulated error in try execution.')
      } finally {
        flag = 17;
      }
      await sleep(100);
      expect(flag).assertEqual(17);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1800
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1800
     * @tc.desc   test Includes throw
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try execution.');
        }
      } catch (e) {
        expect(e.message).assertEqual('Simulated error in try execution.');
      } finally {
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in finally execution.');
          }
        } catch (err) {
          flag = 18;
          expect(err.message).assertEqual('Simulated error in finally execution.');
        }
      }
      await sleep(100);
      expect(flag).assertEqual(18);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry1900
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1900
     * @tc.desc   test Not used with try
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      asyncInput('###').then(() => {
        console.info('builtinsStatementTry01900 is executed')
      })
        .catch((error: BusinessError) => {
          console.error(error.message);
          expect(error.message).assertEqual('Invalid input');
          flag = 18;
        }).finally(() => {
        flag = flag + 1;
      })
      await sleep(100);
      expect(flag).assertEqual(19);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2000
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2000
     * @tc.desc   test Multiple finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error');
      } finally {
        asyncInput('@').finally(() => {
          flag = 20;
        })
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(flag).assertEqual(20);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2100
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2100
     * @tc.desc   test Not used as the last code block
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          expect(error.message).assertEqual('Cache read error');
        } finally {
          flag = 20;
        }
        flag = flag + 1;
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await sleep(100);
      expect(flag).assertEqual(21);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2200
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2200
     * @tc.desc   test Define the variables on the outer layer and assign values in the final layer to see if they can be obtained
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error');
      } finally {
        num = num + 1;
      }
      await sleep(100);
      expect(num).assertEqual(1);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2300
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2300
     * @tc.desc   test Whether or not using variables in finally is available on the outside
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 0
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error');
      } finally {
        let num: number = 1;
      }
      await sleep(100);
      expect(num).assertEqual(0);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2400
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2400
     * @tc.desc   test Finally nested try catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 23;
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        }
      }
      await sleep(100);
      expect(flag).assertEqual(24);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2500
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2500
     * @tc.desc   test Finally nested try finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 24;
        } finally {
          flag = flag + 1;
        }
      }
      await sleep(100);
      expect(flag).assertEqual(25);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2600
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2600
     * @tc.desc   test Finally nested try catch finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 24;
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        } finally {
          flag = flag + 1;
        }
      }
      await sleep(100);
      expect(flag).assertEqual(26);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2700
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2700
     * @tc.desc   test Finally nested try catch finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result: string = '';
      try {
        result += 'Outside try';
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        result += '\nOutside catch';
        expect(err.message).assertEqual('Cache read error');
      } finally {
        try {
          flag = 24;
          result += '\nOutside finally inside try';
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          result += '\nOutside finally inside catch';
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        } finally {
          result += '\nOutside finally inside finally';
        }
        result += '\nOutside finally';
        console.info('=============' + result);
      }
      await sleep(100);
      expect(result).assertEqual('Outside try\n' +
        'Outside catch\n' +
        'Outside finally inside try\n' +
        'Outside finally inside catch\n' +
        'Outside finally inside finally\n' +
        'Outside finally');
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2800
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2800
     * @tc.desc   test The try code block is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
      } finally {
        flag = 28;
      }
      await sleep(100);
      expect(flag).assertEqual(28);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry2900
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2900
     * @tc.desc   test The try includes throw
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        flag = 28;
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        flag += 1;
        expect(err.message).assertEqual('Cache read error');
      }
      ;
      await sleep(100);
      expect(flag).assertEqual(29);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3000
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3000
     * @tc.desc   test The try includes if
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = Math.random();
      try {
        if (num < 0.3) {
          throw new Error('Cache read error1');
        }
        if (num >= 0.3 && num < 0.6) {
          throw new Error('Cache read error2');
        }
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag = 30;
      }
      await sleep(100);
      expect(flag).assertEqual(30);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3100
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3100
     * @tc.desc   test The try includes circulate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let arr = [1, 2, 3, 4, 5];
      try {
        flag = 30;
        for (let i = 0; i < arr.length; i++) {
          console.info(arr[i].toString());
        }
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag += 1;
      }
      await sleep(100);
      expect(flag).assertEqual(31);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3200
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3200
     * @tc.desc   test The try includes function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        flag = 31;
        let result = bubbleSort([64, 34, 25, 12, 22, 11, 90]);
        expect(result.toString()).assertEqual('11,12,22,25,34,64,90');
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag += 1;
      }
      await sleep(100);
      expect(flag).assertEqual(32);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3300
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3300
     * @tc.desc   test Define the variable in the outer layer, and assign the value in the try to see if it can be obtained
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 1;
      try {
        num += 1;
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await sleep(100);
      expect(num).assertEqual(2);
      Done()
    })

    /**
     * @tc.name   builtinsStatementTry3400
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3400
     * @tc.desc   test Whether the use of variables in a try can be obtained on the outer layer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let num: number = 1;
      try {
        let num = 2;
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await sleep(100);
      expect(num).assertEqual(1);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3500
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3500
     * @tc.desc   test The try nested try catch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        flag = 34;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try execution.');
          }
        } catch (error) {
          flag += 1;
          expect(error.message).assertEqual('Simulated error in try execution.');
        }
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await sleep(100);
      expect(flag).assertEqual(35);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3600
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3600
     * @tc.desc   test The try nested try finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        try {
          flag = 35;
        } finally {
          flag += 1;
        }
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await sleep(100);
      expect(flag).assertEqual(36);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3700
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3700
     * @tc.desc   test The try nested try catch finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        flag = 35;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try execution.');
          }
        } catch (error) {
          flag += 1;
          expect(error.message).assertEqual('Simulated error in try execution.');
        } finally {
          flag += 1;
        }
      } catch (err) {
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await sleep(100);
      expect(flag).assertEqual(37);
      Done();
    })

    /**
     * @tc.name   builtinsStatementTry3800
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3800
     * @tc.desc   test Finally nested try catch finally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsStatementTry3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let result: string = '';
      try {
        result = 'Outside try'
        try {
          result += '\nOutside try inside try';
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          result += '\nOutside try inside catch';
          expect(error.message).assertEqual('Cache read error');
        } finally {
          result += '\nOutside try inside finally';
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        }
      } catch (err) {
        result += '\nOutside catch';
        expect(err.message).assertEqual('Cache read error');
      } finally {
        result += '\nOutside finally';
        console.info('=============' + result);
      }
      await sleep(100);
      expect(result).assertEqual('Outside try\n' +
        'Outside try inside try\n' +
        'Outside try inside catch\n' +
        'Outside try inside finally\n' +
        'Outside catch\n' +
        'Outside finally');
      Done();
    })
  })
}

