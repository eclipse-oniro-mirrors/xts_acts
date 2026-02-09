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
} from './pages/ThrowMethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import Utils from './Util.test';

// let flag: number = 0

export default function builtinsTryTest() {
  describe('builtinsStatementTry', (): void => {
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
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0100
     * @tc.name builtinsStatementTry0100
     * @tc.desc test One catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        testTryCatch();
        throw new Error('Simulated error');
      } catch (error) {
        error = error as Error;
        flag = 1;
        console.error('Error in main block:', error.message);
        expect(error.message).assertEqual('Simulated error');
      }
      expect(flag).assertEqual(1);
      done();
    })
    
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0200
     * @tc.name builtinsStatementTry0200
     * @tc.desc test Multiple catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        Input('@');
      } catch (error) {
        error = error as Error;
        console.error('Validation failed:', error.message);
        flag = 2;
        expect(error.message).assertEqual('input error');
      }
      expect(flag).assertEqual(2);
      await Utils.msSleep(100);
      try {
        Input('@');
      } catch (error) {
        error = error as Error;
        console.error('Validation failed:', error.message);
        flag = 3;
        expect(error.message).assertEqual('input error');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(3);
      done();
    })
    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0300
     * @tc.name builtinsStatementTry0300
     * @tc.desc test And finally used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        Input('ab');
      } catch (error) {
        error = error as Error;
        flag = 3;
        console.error('Validation failed:', error.message);
        expect(error.message).assertEqual('input error');
      } finally {
        flag = flag + 1;
        console.info('builtinsStatementTry0300 is executed');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0400
     * @tc.name builtinsStatementTry0400
     * @tc.desc test Not and finally used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        Input('ab');
      } catch (error) {
        error = error as Error;
        flag = 3;
        console.error('Validation failed:', error.message);
        expect(error.message).assertEqual('input error');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(3);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0500
     * @tc.name builtinsStatementTry0500
     * @tc.desc test The code block is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
      } catch (error) {
        error = error as Error;
        console.error('Validation failed:', error.message);
      } finally {
        flag = 5;
        console.info('builtinsStatementTry0300 is executed');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(5);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0600
     * @tc.name builtinsStatementTry0600
     * @tc.desc test Includes throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        Input('@');
      } catch (error) {
        error = error as Error;
        try {
          console.error('Validation failed:', error.message);
          flag = 6
          expect(error.message).assertEqual('input error');
          if (Math.random() < 1) {
            throw new Error('Simulated error in catch execution.');
          }
        } catch (err) {
          err = err as Error;
          flag = flag + 1;
          expect(err.message).assertEqual('Simulated error in catch execution.');
        }
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(7);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0700
     * @tc.name builtinsStatementTry0700
     * @tc.desc test Not used with try
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      asyncInput('###').then(() => {
        console.info('builtinsStatementTry0700 is executed');
      })
        .catch<void>((error: Error): void=> {
          console.error(error.message);
          expect(error.message).assertEqual('Invalid input');
          flag = 8;
        });
      await Utils.msSleep(100);
      expect(flag).assertEqual(8);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0800
     * @tc.name builtinsStatementTry0800
     * @tc.desc test Define variables on the outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorOccurred = false;
      let errorMessage: string | null = null;
      try {
        Input2(-1, -2);
      } catch (error) {
        error = error as Error;
        errorOccurred = true;
        errorMessage = error.message;
        expect(errorMessage).assertEqual('a and b cannot be negative number');
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(errorOccurred).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_0900
     * @tc.name builtinsStatementTry0900
     * @tc.desc test Whether the variables used in the catch can be obtained on the outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorOccurred = false;
      try {
        Input2(-1, -2);
      } catch (error) {
        error = error as Error;
        let errorOccurred = true;
        let errorMessage: string = '';
        errorMessage = error.message;
        expect(errorMessage).assertEqual('a and b cannot be negative number');
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(errorOccurred).assertFalse();
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1000
     * @tc.name builtinsStatementTry1000
     * @tc.desc test Whether the variables used in the catch can be obtained on the outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try1 execution.');
        }
      } catch (error) {
        error = error as Error;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try2 execution.');
          }
        } catch (err) {
          err = err as Error;
          console.error(err.message);
          expect(err.message).assertEqual('Simulated error in try2 execution.');
          flag = 10;
        }
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(10);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1100
     * @tc.name builtinsStatementTry1100
     * @tc.desc test Nested try catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try1 execution.');
        }
        ;
      } catch (error) {
        error = error as Error;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try2 execution.');
          }
          ;
        } catch (err) {
          err = err as Error;
          console.error(err.message);
          expect(err.message).assertEqual('Simulated error in try2 execution.');
          flag = 11;
        }
        ;
      } finally {
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(110);
      expect(flag).assertEqual(11);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1200
     * @tc.name builtinsStatementTry1200
     * @tc.desc test Nested try finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
          expect(err.message).assertEqual('Cache read error');
        } finally {
          flag = 12;
        }
      } finally {
        flag = flag + 1;
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(13);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1300
     * @tc.name builtinsStatementTry1300
     * @tc.desc test Nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      let result: string = ''
      try {
        result = nestedTryFinally('');
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
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
      await Utils.msSleep(100);
      expect(flag).assertEqual(13);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1400
     * @tc.name builtinsStatementTry1400
     * @tc.desc test One finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        throwDivisor(4, 2);
      } finally {
        flag = 14;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(14);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1500
     * @tc.name builtinsStatementTry1500
     * @tc.desc test And catch together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        throwDivisor(4, 0);
      } catch (e) {
        e = e as Error;
        expect(e.message).assertEqual('The divisor cannot be zero');
      } finally {
        flag = 15;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(15);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1600
     * @tc.name builtinsStatementTry1600
     * @tc.desc test The code block is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
      } finally {
        flag = 16;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(16);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1700
     * @tc.name builtinsStatementTry1700
     * @tc.desc test The code block is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try execution.');
        }
      } catch (e) {
        e = e as Error;
        expect(e.message).assertEqual('Simulated error in try execution.')
      } finally {
        flag = 17;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(17);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1800
     * @tc.name builtinsStatementTry1800
     * @tc.desc test Includes throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Simulated error in try execution.');
        }
      } catch (e) {
        e = e as Error;
        expect(e.message).assertEqual('Simulated error in try execution.');
      } finally {
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in finally execution.');
          }
        } catch (err) {
          err = err as Error;
          flag = 18;
          expect(err.message).assertEqual('Simulated error in finally execution.');
        }
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(18);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_1900
     * @tc.name builtinsStatementTry1900
     * @tc.desc test Not used with try
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      asyncInput('###').then(() => {
        console.info('builtinsStatementTry01900 is executed')
      })
        .catch<void>((error: Error): void=> {
          console.error(error.message);
          expect(error.message).assertEqual('Invalid input');
          flag = 18;
        }).finally(() => {
        flag = flag + 1;
      })
      await Utils.msSleep(100);
      expect(flag).assertEqual(19);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2000
     * @tc.name builtinsStatementTry2000
     * @tc.desc test Multiple finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error');
      } finally {
        asyncInput('@').finally(() => {
          flag = 20;
        })
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(20);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2100
     * @tc.name builtinsStatementTry2100
     * @tc.desc test Not used as the last code block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        try {
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
          expect(error.message).assertEqual('Cache read error');
        } finally {
          flag = 20;
        }
        flag = flag + 1;
        console.log('This part will execute regardless of whether an exception occurs');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(21);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2200
     * @tc.name builtinsStatementTry2200
     * @tc.desc test Define the variables on the outer layer and assign values in the final layer to see if they can be obtained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 0
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error');
      } finally {
        num = num + 1;
      }
      await Utils.msSleep(100);
      expect(num).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2300
     * @tc.name builtinsStatementTry2300
     * @tc.desc test Whether or not using variables in finally is available on the outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 0
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error');
      } finally {
        let num: number = 1;
      }
      await Utils.msSleep(100);
      expect(num).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2400
     * @tc.name builtinsStatementTry2400
     * @tc.desc test Finally nested try catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 23;
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        }
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(24);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2500
     * @tc.name builtinsStatementTry2500
     * @tc.desc test Finally nested try finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 24;
        } finally {
          flag = flag + 1;
        }
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(25);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2600
     * @tc.name builtinsStatementTry2600
     * @tc.desc test Finally nested try catch finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        expect(err.message).assertEqual('Cache read error')
      } finally {
        try {
          flag = 24;
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        } finally {
          flag = flag + 1;
        }
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(26);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2700
     * @tc.name builtinsStatementTry2700
     * @tc.desc test Finally nested try catch finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      let result: string = '';
      try {
        result += 'Outside try';
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
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
          error = error as Error;
          result += '\nOutside finally inside catch';
          flag = flag + 1;
          expect(error.message).assertEqual('Cache read error');
        } finally {
          result += '\nOutside finally inside finally';
        }
        result += '\nOutside finally';
        console.info('=============' + result);
      }
      await Utils.msSleep(100);
      expect(result).assertEqual('Outside try\n' +
        'Outside catch\n' +
        'Outside finally inside try\n' +
        'Outside finally inside catch\n' +
        'Outside finally inside finally\n' +
        'Outside finally');
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2800
     * @tc.name builtinsStatementTry2800
     * @tc.desc test The try code block is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
      } finally {
        flag = 28;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(28);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_2900
     * @tc.name builtinsStatementTry2900
     * @tc.desc test The try includes throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        flag = 28;
        if (Math.random() < 1) {
          throw new Error('Cache read error');
        }
      } catch (err) {
        err = err as Error;
        flag += 1;
        expect(err.message).assertEqual('Cache read error');
      }
      ;
      await Utils.msSleep(100);
      expect(flag).assertEqual(29);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3000
     * @tc.name builtinsStatementTry3000
     * @tc.desc test The try includes if
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      let num: number = Math.random();
      try {
        if (num < 0.3) {
          throw new Error('Cache read error1');
        }
        if (num >= 0.3 && num < 0.6) {
          throw new Error('Cache read error2');
        }
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag = 30;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(30);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3100
     * @tc.name builtinsStatementTry3100
     * @tc.desc test The try includes circulate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      let arr = [1, 2, 3, 4, 5];
      try {
        flag = 30;
        for (let i = 0; i < arr.length; i++) {
          console.info(string(arr[i]));
        }
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag += 1;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(31);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3200
     * @tc.name builtinsStatementTry3200
     * @tc.desc test The try includes function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        flag = 31;
        let resultArray = new Array<number>(64, 34, 25, 12, 22, 11, 90);
        let result = bubbleSort(resultArray);
        expect(result.toString()).assertEqual('11,12,22,25,34,64,90');
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
        flag += 1;
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(32);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3300
     * @tc.name builtinsStatementTry3300
     * @tc.desc test Define the variable in the outer layer, and assign the value in the try to see if it can be obtained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 1;
      try {
        num += 1;
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await Utils.msSleep(100);
      expect(num).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3400
     * @tc.name builtinsStatementTry3400
     * @tc.desc test Whether the use of variables in a try can be obtained on the outer layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num: number = 1;
      try {
        let num = 2;
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await Utils.msSleep(100);
      expect(num).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3500
     * @tc.name builtinsStatementTry3500
     * @tc.desc test The try nested try catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        flag = 34;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try execution.');
          }
        } catch (error) {
          error = error as Error;
          flag += 1;
          expect(error.message).assertEqual('Simulated error in try execution.');
        }
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(35);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3600
     * @tc.name builtinsStatementTry3600
     * @tc.desc test The try nested try finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        try {
          flag = 35;
        } finally {
          flag += 1;
        }
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(36);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3700
     * @tc.name builtinsStatementTry3700
     * @tc.desc test The try nested try catch finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: number = 0;
      try {
        flag = 35;
        try {
          if (Math.random() < 1) {
            throw new Error('Simulated error in try execution.');
          }
        } catch (error) {
          error = error as Error;
          flag += 1;
          expect(error.message).assertEqual('Simulated error in try execution.');
        } finally {
          flag += 1;
        }
      } catch (err) {
        err = err as Error;
        console.info(`Caught an error: ${err.message}`);
      } finally {
        console.info('Executing finally block');
      }
      await Utils.msSleep(100);
      expect(flag).assertEqual(37);
      done();
    })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_TRY_TEST_3800
     * @tc.name builtinsStatementTry3800
     * @tc.desc test Finally nested try catch finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementTry3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: string = '';
      try {
        result = 'Outside try'
        try {
          result += '\nOutside try inside try';
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        } catch (error) {
          error = error as Error;
          result += '\nOutside try inside catch';
          expect(error.message).assertEqual('Cache read error');
        } finally {
          result += '\nOutside try inside finally';
          if (Math.random() < 1) {
            throw new Error('Cache read error');
          }
        }
      } catch (err) {
        err = err as Error;
        result += '\nOutside catch';
        expect(err.message).assertEqual('Cache read error');
      } finally {
        result += '\nOutside finally';
        console.info('=============' + result);
      }
      await Utils.msSleep(100);
      expect(result).assertEqual('Outside try\n' +
        'Outside try inside try\n' +
        'Outside try inside catch\n' +
        'Outside try inside finally\n' +
        'Outside catch\n' +
        'Outside finally');
      done();
    })
  })
}

