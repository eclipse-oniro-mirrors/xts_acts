/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { sleep } from "../Util.test"

export default function promiseFinallyTest(){
  describe('promiseFinallyTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0100
     * @tc.name PromiseFinallyTest001
     * @tc.desc finally() executes after fulfilled promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyExecuted = false;
      const resolveValue = 'success';

      const result = await Promise.resolve(resolveValue)
        .finally(() => {
          finallyExecuted = true;
        });

      expect(finallyExecuted).assertEqual(true);
      expect(result).assertEqual(resolveValue);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0200
     * @tc.name PromiseFinallyTest002
     * @tc.desc finally() executes after rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyExecuted = false;
      const rejectMsg = 'failure';

      try {
        await Promise.reject(new Error(rejectMsg))
          .finally(() => {
            finallyExecuted = true;
          });
      } catch (e) {
        if (e instanceof Error) {
          expect(e.message).assertEqual(rejectMsg);
        }
      }

      expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0300
     * @tc.name PromiseFinallyTest003
     * @tc.desc finally() ignores its return value for fulfilled promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const originalValue = 'original';
      const finallyReturnValue = 'finally-value';

      const result = await Promise.resolve(originalValue)
        .finally(() => {
          return finallyReturnValue;
        });

      expect(result).assertEqual(originalValue);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0400
     * @tc.name PromiseFinallyTest004
     * @tc.desc finally() ignores its return value for rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const originalErrMsg = 'original-error';
      const finallyReturnValue = 'finally-value';
      let caughtMsg = '';

      try {
        await Promise.reject(new Error(originalErrMsg))
          .finally(() => {
            return finallyReturnValue;
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtMsg = e.message;
        }
      }

      expect(caughtMsg).assertEqual(originalErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0500
     * @tc.name PromiseFinallyTest005
     * @tc.desc finally() waits for returned promise to settle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const delay = 50;
      let finallyFinished = false;

      await Promise.resolve()
        .finally(() => {
          return new Promise<void>((resolve) => {
            setTimeout(() => {
              finallyFinished = true;
              resolve(undefined);
            }, delay);
          });
        });

      expect(finallyFinished).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0600
     * @tc.name PromiseFinallyTest006
     * @tc.desc Throwing in finally() overrides fulfilled state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const finallyErrMsg = 'finally-error';
      let caughtMsg = '';

      try {
        await Promise.resolve('success')
          .finally(() => {
            throw new Error(finallyErrMsg);
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtMsg = e.message;
        }
      }

      expect(caughtMsg).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0700
     * @tc.name PromiseFinallyTest007
     * @tc.desc Throwing in finally() overrides rejected state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const originalErrMsg = 'original-error';
      const finallyErrMsg = 'finally-error';
      let caughtMsg = '';

      try {
        await Promise.reject(new Error(originalErrMsg))
          .finally(() => {
            throw new Error(finallyErrMsg);
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtMsg = e.message;
        }
      }

      expect(caughtMsg).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_0800
     * @tc.name PromiseFinallyTest008
     * @tc.desc finally() preserves value in promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(10)
        .then(value => value * 2)
        .finally(() => {
          // No effect on chain value
        })
        .then(value => value + 5);

      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1000
     * @tc.name PromiseFinallyTest010
     * @tc.desc Multiple finally() calls execute in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: number[] = [];

      await Promise.resolve()
        .finally(() => {
          executionOrder.push(1);
        })
        .then(() => {
          executionOrder.push(2);
        })
        .finally(() => {
          executionOrder.push(3);
        });

      expect(executionOrder.length).assertEqual(3);
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);
      expect(executionOrder[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1200
     * @tc.name PromiseFinallyTest012
     * @tc.desc finally() does not affect catch() error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errMsg = 'catchable error';
      let caughtErr = '';

      await Promise.reject(new Error(errMsg))
        .finally(() => {
          // No impact on catch
        })
        .catch((e: Error) => {
          caughtErr = e.message;
        });

      expect(caughtErr).assertEqual(errMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1300
     * @tc.name PromiseFinallyTest013
     * @tc.desc finally() executes for already settled promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyRan = false;
      const settledPromise = Promise.resolve('already done');

      // Wait for promise to settle first
      await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 20)});

      const result = await settledPromise.finally(() => {
        finallyRan = true;
      });

      expect(finallyRan).assertEqual(true);
      expect(result).assertEqual('already done');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1400
     * @tc.name PromiseFinallyTest014
     * @tc.desc finally() with empty callback preserves promise state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Test fulfilled
      const fulfilledResult = await Promise.resolve(42)
        .finally(() => {
        });
      expect(fulfilledResult).assertEqual(42);

      // Test rejected
      const errMsg = 'empty finally error';
      let caughtErr = '';
      try {
        await Promise.reject(new Error(errMsg))
          .finally(() => {
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }
      expect(caughtErr).assertEqual(errMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1500
     * @tc.name PromiseFinallyTest015
     * @tc.desc finally() in nested promises executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      await Promise.resolve()
        .then(() => {
          return new Promise<void>((resolve) => {
            setTimeout(() => {
              executionLog.push('nested resolve');
              resolve(undefined);
            }, 10);
          }).finally(() => {
            executionLog.push('nested finally');
          });
        })
        .finally(() => {
          executionLog.push('outer finally');
        });

      expect(executionLog.length).assertEqual(3);
      expect(executionLog[0]).assertEqual('nested resolve');
      expect(executionLog[1]).assertEqual('nested finally');
      expect(executionLog[2]).assertEqual('outer finally');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1600
     * @tc.name PromiseFinallyTest016
     * @tc.desc Rejected promise in finally() is caught by subsequent catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const finallyErrMsg = 'finally rejection';
      let caughtErr = '';

      await Promise.resolve('success')
        .finally(() => {
          return Promise.reject(new Error(finallyErrMsg));
        })
        .catch((e: Error) => {
          caughtErr = e.message;
        });

      expect(caughtErr).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1700
     * @tc.name PromiseFinallyTest017
     * @tc.desc finally() preserves promise chain after catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.reject(new Error('test'))
        .catch(() => 100)
        .finally(() => {
        })
        .then((value) => value * 2);

      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1800
     * @tc.name PromiseFinallyTest018
     * @tc.desc finally() executes once per promise instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let executeCount = 0;
      const promise = Promise.resolve('single');

      promise.finally(() => {
        executeCount++;
      });
      promise.finally(() => {
        executeCount++;
      });

      await promise;

      expect(executeCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_1900
     * @tc.name PromiseFinallyTest019
     * @tc.desc finally() with async callback waits for resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let asyncWorkDone = false;
      const delay = 40;

      await Promise.reject(new Error('async test'))
        .catch(() => {
        })
        .finally(async () => {
          await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, delay)});
          asyncWorkDone = true;
        });

      expect(asyncWorkDone).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2000
     * @tc.name PromiseFinallyTest020
     * @tc.desc finally() works with Promise.race()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyTriggered = false;
      const fastPromise = new Promise<string>((resolve) => {setTimeout(() => resolve('fast'), 10)});
      const slowPromise = new Promise<string>((resolve) => {setTimeout(() => resolve('slow'), 100)});

      const result = await Promise.race([fastPromise, slowPromise])
        .finally(() => {
          finallyTriggered = true;
        });

      expect(finallyTriggered).assertEqual(true);
      expect(result).assertEqual('fast');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2100
     * @tc.name PromiseFinallyTest021
     * @tc.desc finally() executes for Promise.all() settled with mixed states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyExecuted = false;
      const promises = [
        Promise.resolve('ok'),
        Promise.reject(new Error('fail')),
        Promise.resolve('done')
      ];

      try {
        await Promise.all(promises).finally(() => {
          finallyExecuted = true;
        });
      } catch (e) {
      }

      expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2200
     * @tc.name PromiseFinallyTest022
     * @tc.desc finally() callback throws non-Error value is caught as reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const throwValue = 'non-error rejection';
      let caughtReason = '';

      try {
        await Promise.resolve('test').finally(() => {
          throw Error(throwValue);
        });
      } catch (e) {
        caughtReason = e.message;
      }

      expect(caughtReason).assertEqual(throwValue);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2300
     * @tc.name PromiseFinallyTest023
     * @tc.desc finally() preserves async/await chain values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchData = async (): Promise<number> => {
        return Promise.resolve(5.0);
      };

      const processData = async (num: number): Promise<number> => {
        return num * 3;
      };

      const result = await fetchData()
        .then(processData)
        .finally(() => {
        });

      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2400
     * @tc.name PromiseFinallyTest024
     * @tc.desc finally() with delayed resolution in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let callbackCompleted = false;
      const delay = 60;
      const startTime = Date.now();

      const result = await Promise.reject(new Error('delay test'))
        .catch(() => 'recovered')
        .finally(() => {
          return new Promise<void>((resolve) => {
            setTimeout(() => {
              callbackCompleted = true;
              resolve(undefined);
            }, delay);
          });
        });

      expect(callbackCompleted).assertEqual(true);
      expect(result).assertEqual('recovered');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2500
     * @tc.name PromiseFinallyTest025
     * @tc.desc finally() does not override catch() returned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const catchReturnValue = 'fixed value';

      const result = await Promise.reject(new Error('broken'))
        .catch(() => catchReturnValue)
        .finally(() => {
          return 'finally value';
        });

      expect(result).assertEqual(catchReturnValue);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2600
     * @tc.name PromiseFinallyTest026
     * @tc.desc finally() executes for Promise.resolve() with promise argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyRan = false;
      const innerPromise = Promise.resolve('inner');
      const wrappedPromise = Promise.resolve(innerPromise);

      const result = await wrappedPromise.finally(() => {
        finallyRan = true;
      });

      expect(finallyRan).assertEqual(true);
      expect(result).assertEqual('inner');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2700
     * @tc.name PromiseFinallyTest027
     * @tc.desc finally() in chain with multiple then() handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];

      await Promise.resolve('start')
        .then((val) => {
          executionOrder.push(val);
          return 'then1';
        })
        .finally(() => {
          executionOrder.push('finally1');
        })
        .then((val) => {
          executionOrder.push(val);
          return 'then2';
        })
        .finally(() => {
          executionOrder.push('finally2');
        });

      expect(executionOrder.length).assertEqual(4);
      expect(executionOrder[0]).assertEqual('start');
      expect(executionOrder[1]).assertEqual('finally1');
      expect(executionOrder[2]).assertEqual('then1');
      expect(executionOrder[3]).assertEqual('finally2');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_2900
     * @tc.name PromiseFinallyTest029
     * @tc.desc finally() preserves rejection reason after delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const originalErrMsg = 'delayed reject';
      let caughtErr = '';

      const delayedRejectPromise = new Promise<never>((resolve, reject) => {
        setTimeout(() => reject(new Error(originalErrMsg)), 30);
      });

      try {
        await delayedRejectPromise.finally(() => {
          return new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 20)});
        });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(caughtErr).assertEqual(originalErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3000
     * @tc.name PromiseFinallyTest030
     * @tc.desc finally() with same callback multiple times works independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let count = 0;
      const incrementCallback = () => {
        count++;
      };

      const promise1 = Promise.resolve().finally(incrementCallback);
      const promise2 = Promise.reject(new Error('test')).finally(incrementCallback);

      await Promise.allSettled([promise1, promise2]);

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3100
     * @tc.name PromiseFinallyTest031
     * @tc.desc finally() in long chain preserves value through multiple then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(2)
        .then(val => val * 3)
        .finally(() => { /* No effect */
        })
        .then(val => val + 5)
        .finally(() => { /* No effect */
        })
        .then(val => val * 2);

      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3200
     * @tc.name PromiseFinallyTest032
     * @tc.desc finally() and catch() order affects error handling in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let firstCatchMsg = '';
      let secondCatchMsg = '';

      await Promise.reject(new Error('chain error'))
        .finally(() => {
          firstCatchMsg += 'finally1:';
        })
        .catch((err: Error) => {
          firstCatchMsg += err.message;
        })
        .finally(() => {
          secondCatchMsg += 'finally2:';
        })
        .then(() => {
          throw new Error('new error');
        })
        .catch((err: Error) => {
          secondCatchMsg += err.message;
        });

      expect(firstCatchMsg).assertEqual('finally1:chain error');
      expect(secondCatchMsg).assertEqual('finally2:new error');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3300
     * @tc.name PromiseFinallyTest033
     * @tc.desc finally() waits for async then() before executing in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];

      await Promise.resolve()
        .then(() => {
          return new Promise<void>(resolve => {
            setTimeout(() => {
              executionOrder.push('async then');
              resolve(undefined);
            }, 20);
          });
        })
        .finally(() => {
          executionOrder.push('finally after async then');
        });

      expect(executionOrder.length).assertEqual(2);
      expect(executionOrder[0]).assertEqual('async then');
      expect(executionOrder[1]).assertEqual('finally after async then');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3400
     * @tc.name PromiseFinallyTest034
     * @tc.desc Multiple finally() in chain execute in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const finallyOrder: number[] = [];

      await Promise.resolve('start')
        .finally(() => {
          finallyOrder.push(1);
        })
        .then(() => { /* Intermediate step */
        })
        .finally(() => {
          finallyOrder.push(2);
        })
        .then(() => { /* Intermediate step */
        })
        .finally(() => {
          finallyOrder.push(3);
        });

      expect(finallyOrder.length).assertEqual(3);
      expect(JSON.stringify(finallyOrder)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3500
     * @tc.name PromiseFinallyTest035
     * @tc.desc finally() in chain with rejected then() propagates error after execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyExecuted = false;
      const rejectMsg = 'then rejection';
      let caughtErr = '';

      try {
        await Promise.resolve()
          .then(() => {
            throw new Error(rejectMsg);
          })
          .finally(() => {
            finallyExecuted = true;
          })
          .then(() => { /* Never runs */
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(finallyExecuted).assertEqual(true);
      expect(caughtErr).assertEqual(rejectMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3600
     * @tc.name PromiseFinallyTest036
     * @tc.desc finally() returns new promise that integrates with chain transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(10)
        .finally(() => {
          return Promise.resolve(99);
        }) // Ignored, but returns promise
        .then(val => val * 4)
        .finally(() => { /* No effect */
        })
        .then(val => val - 5);

      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3700
     * @tc.name PromiseFinallyTest037
     * @tc.desc finally() in chain with nested promise chain preserves outer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(5)
        .then(val => {
          // Nested promise chain
          return Promise.resolve(val * 2)
            .finally(() => { /* Nested finally, no effect on outer */
            })
            .then(nestedVal => nestedVal + 3);
        })
        .finally(() => { /* Outer finally, no effect */
        })
        .then(val => val * 2);

      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3800
     * @tc.name PromiseFinallyTest038
     * @tc.desc Error in finally() breaks chain and overrides previous resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let caughtErr = '';
      const finallyErrMsg = 'finally broke chain';

      try {
        await Promise.resolve('success')
          .then(val => val.toUpperCase())
          .finally(() => {
            throw new Error(finallyErrMsg);
          })
          .then(val => { /* Never executes */
            return val + '!';
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(caughtErr).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_3900
     * @tc.name PromiseFinallyTest039
     * @tc.desc finally() in chain with Promise.all() as intermediate step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyRan = false;
      const promises = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)];

      const result = await Promise.resolve(promises)
        .then(arr => Promise.all(arr))
        .finally(() => {
          finallyRan = true;
        })
        .then(vals => vals.reduce((a, b) => a + b, 0));

      expect(finallyRan).assertEqual(true);
      expect(result).assertEqual(6);
    });
    
    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_4100
     * @tc.name PromiseFinallyTest041
     * @tc.desc finally() waits for inner async operations in nested async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyCompleted = false;
      const executionOrder: string[] = [];

      const nestedAsync = async (): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => {
            executionOrder.push('inner async resolve');
            resolve('nested result');
          }, 30);
        });
      };

      const result = await Promise.resolve()
        .then(async () => {
          return await nestedAsync();
        })
        .finally(async () => {
          await new Promise<void>(resolve => {
            setTimeout(() => {
              executionOrder.push('finally async work');
              finallyCompleted = true;
              resolve(undefined);
            }, 20);
          });
        });

      expect(finallyCompleted).assertEqual(true);
      expect(result).assertEqual('nested result');
      expect(executionOrder).assertDeepEquals(['inner async resolve', 'finally async work']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4300
     * @tc.name PromiseFinallyTest043
     * @tc.desc Value transmission of finally() in await chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetch = async (): Promise<number> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        return 100.0;
      };

      const process = async (num: number): Promise<number> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        return num * 0.8;
      };

      const format = async (num: number): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        return `¥${num.toFixed(2)}`;
      };

      let finallyTriggered = false;
      const result = await fetch()
        .then(process)
        .finally(() => {
          finallyTriggered = true;
        })
        .then(format);

      expect(finallyTriggered).assertEqual(true);
      expect(result).assertEqual('¥80.00');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4400
     * @tc.name PromiseFinallyTest044
     * @tc.desc Execution and error transmission of finally() in nested reject scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let innerFinallyRan = false;
      let outerFinallyRan = false;
      const innerErrMsg = 'nested rejection';
      let caughtErr = '';

      try {
        await Promise.resolve()
          .then(() => {
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => reject(new Error(innerErrMsg)), 20);
            }).finally(() => {
              innerFinallyRan = true;
            });
          })
          .finally(() => {
            outerFinallyRan = true;
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(innerFinallyRan).assertEqual(true);
      expect(outerFinallyRan).assertEqual(true);
      expect(caughtErr).assertEqual(innerErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4500
     * @tc.name PromiseFinallyTest045
     * @tc.desc Execution timing of finally() when errors are thrown in async callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];
      const errMsg = 'async error';

      try {
        await Promise.resolve()
          .then(async () => {
            await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
            executionOrder.push('before throw');
            throw new Error(errMsg);
          })
          .finally(() => {
            executionOrder.push('finally executed');
          });
      } catch(err) {
      }

      expect(executionOrder.length).assertEqual(2);
      expect(executionOrder).assertDeepEquals(['before throw', 'finally executed']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4600
     * @tc.name PromiseFinallyTest046
     * @tc.desc Execution priority of finally() in multi-level await nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const level3 = async (): Promise<void> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        log.push('level3 done');
      };

      const level2 = async (): Promise<void> => {
        await level3();
        log.push('level2 done');
      };

      const level1 = async (): Promise<void> => {
        await level2().finally(() => {
          log.push('level2 finally');
        });
        log.push('level1 done');
      };

      await level1().finally(() => {
        log.push('level1 finally');
      });

      expect(log.length).assertEqual(5);
      expect(log).assertDeepEquals([
        'level3 done',
        'level2 done',
        'level2 finally',
        'level1 done',
        'level1 finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4700
     * @tc.name PromiseFinallyTest047
     * @tc.desc Promise rejection from async finally() overrides original state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const originalErrMsg = 'original error';
      const finallyErrMsg = 'finally reject';
      let caughtErr = '';

      try {
        await Promise.reject(new Error(originalErrMsg))
          .finally(() => {
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => reject(new Error(finallyErrMsg)), 20);
            });
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(caughtErr).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4800
     * @tc.name PromiseFinallyTest048
     * @tc.desc Cooperative handling of finally() and catch() in nested Promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const result = await Promise.resolve()
        .then(() => {
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => reject(new Error('inner fail')), 10);
          }).catch((err: Error) => {
            log.push(`inner catch: ${err.message}`);
            return 'recovered';
          }).finally(() => {
            log.push('inner finally');
          });
        })
        .finally(() => {
          log.push('outer finally');
        });

      expect(result).assertEqual('recovered');
      expect(log).assertDeepEquals(['inner catch: inner fail', 'inner finally', 'outer finally']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_4900
     * @tc.name PromiseFinallyTest049
     * @tc.desc Reliability of finally() in delayed-execution Promises with await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resourceCleaned = false;
      const delay = 100;
      const startTime = Date.now();

      const delayedPromise = new Promise<string>((resolve) => {
        setTimeout(() => resolve('delayed result'), delay);
      });

      const result = await delayedPromise.finally(() => {
        resourceCleaned = true;
      });

      expect(resourceCleaned).assertEqual(true);
      expect(result).assertEqual('delayed result');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5000
     * @tc.name PromiseFinallyTest050
     * @tc.desc Execution chain of finally() when errors are thrown in multi-level nested async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const finallyLog: number[] = [];
      const errMsg = 'deep error';

      const func3 = async (): Promise<void> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        throw new Error(errMsg);
      };

      const func2 = async (): Promise<void> => {
        await func3().finally(() => finallyLog.push(3));
      };

      const func1 = async (): Promise<void> => {
        await func2().finally(() => finallyLog.push(2));
      };

      try {
        await func1().finally(() => finallyLog.push(1));
      } catch (err) {
      }

      expect(finallyLog.length).assertEqual(3);
      expect(JSON.stringify(finallyLog)).assertDeepEquals(JSON.stringify([3, 2, 1]));
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5100
     * @tc.name PromiseFinallyTest051
     * @tc.desc finally() executes even if nested catch() throws new error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let innerFinallyRan = false;
      let outerFinallyRan = false;
      const finalErrMsg = 'catch rethrow error';

      try {
        await Promise.reject(new Error('initial error'))
          .then(() => 'unreachable')
          .catch((err: Error) => {
            throw new Error(finalErrMsg);
          })
          .finally(() => {
            innerFinallyRan = true;
          })
          .then(() => 'unreachable')
          .finally(() => {
            outerFinallyRan = true;
          });
      } catch (e) {
        if (e instanceof Error) {
          expect(e.message).assertEqual(finalErrMsg);
        }
      }

      expect(innerFinallyRan).assertEqual(true);
      expect(outerFinallyRan).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5200
     * @tc.name PromiseFinallyTest052
     * @tc.desc Nested finally() in Promise chain with alternating resolve/reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      const result = await Promise.resolve('step1')
        .finally(() => {
          executionLog.push('finally1 (resolve)');
        })
        .then(() => {
          throw new Error('step2 error');
        })
        .finally(() => {
          executionLog.push('finally2 (reject)');
        })
        .catch(() => 'step3 recovered')
        .finally(() => {
          executionLog.push('finally3 (resolve)');
        });

      expect(result).assertEqual('step3 recovered');
      expect(executionLog).assertDeepEquals([
        'finally1 (resolve)',
        'finally2 (reject)',
        'finally3 (resolve)'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5300
     * @tc.name PromiseFinallyTest053
     * @tc.desc Async finally() throwing error overrides catch() recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let catchRecovered = false;
      const finallyErrMsg = 'async finally error';
      let caughtErr = '';

      try {
        await Promise.reject(new Error('original error'))
          .catch((err: Error) => {
            catchRecovered = true;
            return 'recovered value';
          })
          .finally(async () => {
            await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
            throw new Error(finallyErrMsg);
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(catchRecovered).assertEqual(true);
      expect(caughtErr).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5400
     * @tc.name PromiseFinallyTest054
     * @tc.desc Multi-level nested promises with finally() and cross-level errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const finallyLog: string[] = [];
      const targetErrMsg = 'level2 error';

      const level3 = async (): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        return 'level3 success';
      };

      const level2 = async (): Promise<string> => {
        return level3()
          .finally(() => {
            finallyLog.push('level3 finally');
          })
          .then(() => {
            throw new Error(targetErrMsg);
          });
      };

      const level1 = async (): Promise<string> => {
        return level2()
          .finally(() => {
            finallyLog.push('level2 finally');
          });
      };

      try {
        await level1().finally(() => {
          finallyLog.push('level1 finally');
        });
      } catch (e) {
        if (e instanceof Error) {
          expect(e.message).assertEqual(targetErrMsg);
        }
      }

      expect(finallyLog).assertDeepEquals(['level3 finally', 'level2 finally', 'level1 finally']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5500
     * @tc.name PromiseFinallyTest055
     * @tc.desc finally() preserves error when callback returns resolved promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const originalErrMsg = 'preserved error';
      let caughtErr = '';

      try {
        await Promise.reject(new Error(originalErrMsg))
          .finally(() => {
            return new Promise<string>(resolve =>{ setTimeout(() => resolve('finally done'), 20)});
          });
      } catch (e) {
        if (e instanceof Error) {
          caughtErr = e.message;
        }
      }

      expect(caughtErr).assertEqual(originalErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5600
     * @tc.name PromiseFinallyTest056
     * @tc.desc Nested then() throwing errors with multiple finally() in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];
      const finalErrMsg = 'third then error';

      try {
        await Promise.resolve()
          .then(() => {
            executionOrder.push('then1');
            return 'val1';
          })
          .finally(() => {
            executionOrder.push('finally1');
          })
          .then((val) => {
            executionOrder.push(`then2: ${val}`);
            return 'val2';
          })
          .finally(() => {
            executionOrder.push('finally2');
          })
          .then(() => {
            throw new Error(finalErrMsg);
          })
          .finally(() => {
            executionOrder.push('finally3');
          });
      } catch (e) {
        if (e instanceof Error) {
          expect(e.message).assertEqual(finalErrMsg);
        }
      }

      expect(executionOrder).assertDeepEquals(['then1', 'finally1', 'then2: val1', 'finally2', 'finally3']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5700
     * @tc.name PromiseFinallyTest057
     * @tc.desc Async finally() in nested chain waits for inner promise rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let innerFinallyCompleted = false;
      const innerErrMsg = 'nested async reject';
      const startTime = Date.now();

      try {
        await Promise.resolve()
          .then(() => {
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => reject(new Error(innerErrMsg)), 30);
            }).finally(async () => {
              await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
              innerFinallyCompleted = true;
            });
          });
      } catch(err) {
      }
      expect(innerFinallyCompleted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5800
     * @tc.name PromiseFinallyTest058
     * @tc.desc finally() executes for unhandled rejection in nested then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let outerFinallyRan = false;
      let innerFinallyRan = false;
      const errMsg = 'unhandled nested error';

      try {
        await Promise.resolve()
          .then(() => {
            return Promise.resolve()
              .then(() => {
                throw new Error(errMsg);
              })
              .finally(() => {
                innerFinallyRan = true;
              });
          })
          .finally(() => {
            outerFinallyRan = true;
          });
      } catch (e) {
        if (e instanceof Error) {
          expect(e.message).assertEqual(errMsg);
        }
      }

      expect(innerFinallyRan).assertEqual(true);
      expect(outerFinallyRan).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_5900
     * @tc.name PromiseFinallyTest059
     * @tc.desc finally() chain with alternating sync/async error throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sync = 0
      let asyncnum = 0
      let finalErr = '';

      try {
        await Promise.resolve()
          .then(() => {
            throw new Error('sync error');
          })
          .finally(() => {
            sync++;
          })
          .catch(() => {
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => reject(new Error('async error')), 10);
            });
          })
          .finally(() => {
            asyncnum++;
          });
      } catch (e) {
        if (e instanceof Error) {
          finalErr = e.message;
        }
      }

      expect(sync).assertEqual(1);
      expect(asyncnum).assertEqual(1);
      expect(finalErr).assertEqual('async error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6000
     * @tc.name PromiseFinallyTest060
     * @tc.desc Nested finally() and catch() with async recovery and failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const result = await Promise.reject(new Error('first error'))
        .catch(async (err: Error) => {
          log.push(`catch1: ${err.message}`);
          await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
          throw new Error('second error');
        })
        .finally(() => {
          log.push('finally1');
        })
        .catch((err: Error) => {
          log.push(`catch2: ${err.message}`);
          return 'final recovery';
        })
        .finally(() => {
          log.push('finally2');
        });

      expect(result).assertEqual('final recovery');
      expect(log).assertDeepEquals([
        'catch1: first error',
        'finally1',
        'catch2: second error',
        'finally2'
      ]);
    });
    
    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6100
     * @tc.name PromiseFinallyTest061
     * @tc.desc Execution sequence of nested finally() with staggered async delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      await Promise.resolve('outer start')
        .then((val) => {
          executionLog.push(`outer then: ${val}`);
          // Nested promise with longer delay
          return new Promise<string>((resolve) => {
            setTimeout(() => {
              executionLog.push('inner promise resolve (100ms)');
              resolve('inner result');
            }, 100);
          }).finally(() => {
            // Inner finally with shorter delay
            return new Promise<null>((resolve) => {
              setTimeout(() => {
                executionLog.push('inner finally (30ms)');
                resolve(null);
              }, 30);
            });
          });
        })
        .finally(() => {
          executionLog.push('outer finally (immediate)');
        });

      expect(executionLog.length).assertEqual(4);
      expect(executionLog).assertDeepEquals([
        'outer then: outer start',
        'inner promise resolve (100ms)',
        'inner finally (30ms)',
        'outer finally (immediate)'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6300
     * @tc.name PromiseFinallyTest063
     * @tc.desc Nested finally() execution order with reject in inner async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];
      const innerErrMsg = 'inner async reject';

      try {
        await Promise.resolve()
          .then(() => {
            executionOrder.push('outer then before inner');
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => {
                executionOrder.push('inner promise reject (40ms)');
                reject(new Error(innerErrMsg));
              }, 40);
            }).finally(() => {
              executionOrder.push('inner finally (10ms after reject)');
            });
          })
          .finally(() => {
            executionOrder.push('outer finally');
          });
      } catch(err) {
      }

      expect(executionOrder.length).assertEqual(4);
      expect(executionOrder).assertDeepEquals([
        'outer then before inner',
        'inner promise reject (40ms)',
        'inner finally (10ms after reject)',
        'outer finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6400
     * @tc.name PromiseFinallyTest064
     * @tc.desc Timing alignment of finally() with parallel nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];
      let allFinallyDone = false;

      const createDelayedPromise = (name: string, delay: int): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => {
            log.push(`promise ${name} resolved (${delay}ms)`);
            resolve(name);
          }, delay);
        }).finally(() => {
          log.push(`finally ${name} (immediate after resolve)`);
        });
      };

      await Promise.resolve()
        .then(() => {
          return Promise.all([
            createDelayedPromise('A', 20),
            createDelayedPromise('B', 50),
            createDelayedPromise('C', 30)
          ]);
        })
        .finally(() => {
          allFinallyDone = true;
          log.push('outer finally (after all inner settled)');
        });

      expect(allFinallyDone).assertEqual(true);
      expect(log).assertDeepEquals(['promise A resolved (20ms)',
        'finally A (immediate after resolve)',
        'promise C resolved (30ms)',
        'finally C (immediate after resolve)',
        'promise B resolved (50ms)',
        'finally B (immediate after resolve)',
        'outer finally (after all inner settled)']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6500
     * @tc.name PromiseFinallyTest065
     * @tc.desc Nested finally() sequence with sync throw after async resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionSteps: string[] = [];
      const throwMsg = 'sync throw after async';

      try {
        await Promise.resolve()
          .then(async () => {
            executionSteps.push('start async then');
            await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
            executionSteps.push('async work done');
            throw new Error(throwMsg);
          })
          .finally(() => {
            executionSteps.push('first finally');
          })
          .then(() => {
            executionSteps.push('unreachable then');
          })
          .finally(() => {
            executionSteps.push('second finally');
          });
      } catch(err) {
      }

      expect(executionSteps.length).assertEqual(4);
      expect(executionSteps).assertDeepEquals([
        'start async then',
        'async work done',
        'first finally',
        'second finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6600
     * @tc.name PromiseFinallyTest066
     * @tc.desc Timing priority of finally() over subsequent then() in nested chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sequenceLog: string[] = [];

      await Promise.resolve(1)
        .then((val) => {
          sequenceLog.push(`then1: ${val}`);
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(val + 1), 30);
          }).finally(() => {
            sequenceLog.push('inner finally (after inner resolve)');
          });
        })
        .then((val) => {
          sequenceLog.push(`then2: ${val}`);
          return val + 1;
        })
        .finally(() => {
          sequenceLog.push('outer finally (after then2)');
        });

      expect(sequenceLog.length).assertEqual(4);
      expect(sequenceLog).assertDeepEquals([
        'then1: 1',
        'inner finally (after inner resolve)',
        'then2: 2',
        'outer finally (after then2)'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6700
     * @tc.name PromiseFinallyTest067
     * @tc.desc Nested finally() execution with async rejection in middle layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const layerLog: string[] = [];
      const midErrMsg = 'middle layer reject';

      const innerLayer = async (): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        layerLog.push('inner layer resolved');
        return 'inner data';
      };

      const middleLayer = async (): Promise<string> => {
        return innerLayer()
          .finally(() => {
            layerLog.push('inner layer finally');
          })
          .then(() => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                layerLog.push('middle layer reject (30ms)');
                reject(new Error(midErrMsg));
              }, 30);
            });
          });
      };

      try {
        await middleLayer()
          .finally(() => {
            layerLog.push('middle layer finally');
          });
      } catch(err) {
      }

      expect(layerLog.length).assertEqual(4);
      expect(layerLog).assertDeepEquals([
        'inner layer resolved',
        'inner layer finally',
        'middle layer reject (30ms)',
        'middle layer finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_6900
     * @tc.name PromiseFinallyTest069
     * @tc.desc Nested finally() and catch() sequence with delayed error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionFlow: string[] = [];
      const rootErrMsg = 'root error';

      try {
        await Promise.reject(new Error(rootErrMsg))
          .then(() => executionFlow.push('unreachable then1'))
          .finally(() => {
            executionFlow.push('finally1 (after reject)');
            return new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
          })
          .catch((err: Error) => {
            executionFlow.push(`catch1: ${err.message}`);
            return new Promise<void>((resolve, reject) => {
              setTimeout(() => reject(new Error('catch1 reject')), 15);
            });
          })
          .finally(() => {
            executionFlow.push('finally2 (after catch1 reject)');
          });
      } catch(err) {
      }

      expect(executionFlow.length).assertEqual(3);
      expect(executionFlow).assertDeepEquals([
        'finally1 (after reject)',
        'catch1: root error',
        'finally2 (after catch1 reject)'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7100
     * @tc.name PromiseFinallyTest071
     * @tc.desc finally() in chain with then()→catch()→then() sequence (catch not triggered)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      const result = await Promise.resolve('init')
        .then((val) => {
          executionLog.push(`first then: ${val}`);
          return 'then1-result';
        })
        .catch((err: Error) => {
          executionLog.push(`catch: ${err.message}`); // Not triggered
          return 'catch-result';
        })
        .finally(() => {
          executionLog.push('finally after catch');
        })
        .then((val) => {
          executionLog.push(`second then: ${val}`);
          return 'final-result';
        });

      expect(result).assertEqual('final-result');
      expect(executionLog).assertDeepEquals([
        'first then: init',
        'finally after catch',
        'second then: then1-result'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7200
     * @tc.name PromiseFinallyTest072
     * @tc.desc finally() and catch() order impact in multi-chain error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let firstCatchRan = false;
      let secondCatchRan = false;
      const errMsg = 'chain error';

      await Promise.reject(new Error(errMsg))
        .finally(() => {
          // Runs before first catch
        })
        .catch(() => {
          firstCatchRan = true;
          throw new Error('new error'); // Re-throw
        })
        .finally(() => {
          // Runs after first catch, before second catch
        })
        .catch(() => {
          secondCatchRan = true;
        });

      expect(firstCatchRan).assertEqual(true);
      expect(secondCatchRan).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7300
     * @tc.name PromiseFinallyTest073
     * @tc.desc Multi-chain with finally() between then() handlers (async transformations)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const valueLog: number[] = [];

      const result = await Promise.resolve(1)
        .then((val) => {
          const newVal = val * 2;
          valueLog.push(newVal);
          return newVal;
        })
        .finally(() => {
          // No impact on value chain
          valueLog.push(-1); // Marker for finally
        })
        .then((val) => {
          const newVal = val + 3;
          valueLog.push(newVal);
          return newVal;
        })
        .finally(() => {
          valueLog.push(-2); // Marker for finally
        })
        .then((val) => val * 4);

      expect(result).assertEqual(20);
      expect(JSON.stringify(valueLog)).assertDeepEquals(JSON.stringify([2, -1, 5, -2]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7400
     * @tc.name PromiseFinallyTest074
     * @tc.desc finally() in Promise.all chain with individual promise catch/finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];
      const promises = [
        Promise.resolve('p1')
          .then((val) => {
            log.push(val);
            return val;
          })
          .finally(() => log.push('p1 finally')),
        Promise.reject(new Error('p2 err'))
          .catch((err: Error) => {
            log.push(err.message);
            return 'p2 recovered';
          })
          .finally(() => log.push('p2 finally'))
      ];

      const result = await Promise.all(promises)
        .finally(() => log.push('all finally'));

      expect(result).assertDeepEquals(['p1', 'p2 recovered']);
      expect(log).assertDeepEquals([
        "p1", "p2 err", "p1 finally", "p2 finally", "all finally"
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7500
     * @tc.name PromiseFinallyTest075
     * @tc.desc Multi-chain: finally() throws error, caught by subsequent catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let caughtErr = '';
      const finallyErrMsg = 'finally throw';

      await Promise.resolve('success')
        .then((val) => {
          return val.toUpperCase();
        })
        .finally(() => {
          throw new Error(finallyErrMsg);
        })
        .catch((err: Error) => {
          caughtErr = err.message;
        });

      expect(caughtErr).assertEqual(finallyErrMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7600
     * @tc.name PromiseFinallyTest076
     * @tc.desc then()→finally()→catch() chain (error from then())
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder: string[] = [];
      const errMsg = 'then error';

      await Promise.resolve()
        .then(() => {
          executionOrder.push('then start');
          throw new Error(errMsg);
        })
        .finally(() => {
          executionOrder.push('finally executed');
        })
        .catch((err: Error) => {
          executionOrder.push(`catch: ${err.message}`);
        });

      expect(executionOrder).assertDeepEquals([
        'then start',
        'finally executed',
        `catch: ${errMsg}`
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7700
     * @tc.name PromiseFinallyTest077
     * @tc.desc Multi-chain with nested finally() and cross-chain value preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const valueTrace: string[] = [];

      const nestedChain = () => {
        return Promise.resolve('nested-init')
          .then((val) => {
            const newVal = `${val}-step1`;
            valueTrace.push(newVal);
            return newVal;
          })
          .finally(() => {
            valueTrace.push('nested-finally');
          });
      };

      const result = await Promise.resolve('outer-init')
        .then(nestedChain)
        .finally(() => {
          valueTrace.push('outer-finally');
        })
        .then((val) => {
          const newVal = `${val}-step2`;
          valueTrace.push(newVal);
          return newVal;
        });

      expect(result).assertEqual('nested-init-step1-step2');
      expect(valueTrace).assertDeepEquals([
        'nested-init-step1',
        'nested-finally',
        'outer-finally',
        'nested-init-step1-step2'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7800
     * @tc.name PromiseFinallyTest078
     * @tc.desc Promise.race() chain with finally() on race result and input promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];
      const fastPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          log.push('fast promise resolve');
          resolve('fast');
        }, 10);
      }).finally(() => log.push('fast finally'));

      const slowPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          log.push('slow promise resolve'); // Never triggers (race wins)
          resolve('slow');
        }, 100);
      }).finally(() => log.push('slow finally')); // Never triggers

      const result = await Promise.race([fastPromise, slowPromise])
        .finally(() => log.push('race finally'));

      expect(result).assertEqual('fast');
      expect(log).assertDeepEquals([
        'fast promise resolve',
        'fast finally',
        'race finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_7900
     * @tc.name PromiseFinallyTest079
     * @tc.desc Multi-chain: finally() returns promise, then() uses original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyPromiseResolved = false;

      const result = await Promise.resolve(10)
        .finally(() => {
          return new Promise<void>((resolve) => {
            setTimeout(() => {
              finallyPromiseResolved = true;
              resolve(undefined);
            }, 20);
          });
        })
        .then((val) => {
          return val * 3;
        });

      expect(finallyPromiseResolved).assertEqual(true);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8000
     * @tc.name PromiseFinallyTest080
     * @tc.desc Catch()→finally()→then() chain with async recovery and transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      const result = await Promise.reject(new Error('initial err'))
        .catch(async (err: Error) => {
          executionLog.push(`catch: ${err.message}`);
          await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 15)}); // Async recovery
          return 20;
        })
        .finally(() => {
          executionLog.push('finally after catch');
        })
        .then((val) => {
          executionLog.push(`then: ${val}`);
          return val + 5;
        });

      expect(result).assertEqual(25);
      expect(executionLog).assertDeepEquals([
        'catch: initial err',
        'finally after catch',
        'then: 20'
      ]);
    });


    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8100
     * @tc.name PromiseFinallyTest081
     * @tc.desc finally() cleans up loading state after async data fetch (success case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isLoading = false;
      const mockFetchData = async (): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
        return 'user data';
      };
      
      const fetchFlow = async (): Promise<string> => {
        isLoading = true;
        return mockFetchData()
          .finally(() => {
            isLoading = false;
          });
      };

      const result = await fetchFlow();

      expect(result).assertEqual('user data');
      expect(isLoading).assertEqual(false); // Loading cleaned up after success
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8300
     * @tc.name PromiseFinallyTest083
     * @tc.desc finally() hides modal after async form submission (success + redirect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let modalVisible = false;
      let redirectPath = '';
      const mockSubmitForm = async (data: string): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 30)});
        return `/success?data=${data}`;
      };

      // Simulate form submission flow: show modal → submit → hide modal → redirect
      const submitFlow = async (formData: string): Promise<void> => {
        modalVisible = true;
        const path = await mockSubmitForm(formData)
          .finally(() => {
            modalVisible = false;
          });
        redirectPath = path;
      };

      await submitFlow('user-input');

      expect(modalVisible).assertEqual(false); // Modal hidden after submission
      expect(redirectPath).assertEqual('/success?data=user-input'); // Redirect preserved
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8400
     * @tc.name PromiseFinallyTest084
     * @tc.desc finally() stops timer after async task cancellation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let timerActive = false;
      const mockLongTask = async (): Promise<void> => {
        return new Promise<void>((resolve, reject) => {
          const timer = setInterval(() => {
            timerActive = true;
          }, 10);
          // Simulate task cancellation after delay
          setTimeout(() => {
            clearInterval(timer);
            reject(new Error('task cancelled'));
          }, 50);
        });
      };

      // Simulate task flow: run task → stop timer on complete/fail
      const taskFlow = async (): Promise<void> => {
        let timer = -1;
        try {
          timer = setInterval(() => {
            timerActive = true;
          }, 10);
          await mockLongTask();
        } finally {
          if (timer) {
            clearInterval(timer);
          }
          timerActive = false;
        }
      };

      try {
        await taskFlow();
      } catch(err) {
      }

      expect(timerActive).assertEqual(false); // Timer stopped after cancellation
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8500
     * @tc.name PromiseFinallyTest085
     * @tc.desc finally() resets progress bar after batch file upload (partial failure)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let progress = 0;
      const mockUploadFile = async (fileName: string): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        progress += 50;
        if (fileName === 'file2.txt') {
          throw new Error('upload failed');
        }
        return `uploaded: ${fileName}`;
      };

      // Simulate batch upload flow: init progress → upload files → reset progress
      const batchUpload = async (files: string[]): Promise<string[]> => {
        progress = 0;
        const results: string[] = [];
        for (const file of files) {
          try {
            const res = await mockUploadFile(file);
            results.push(res);
          } catch (err) {
            if (err instanceof Error) {
              results.push(err.message);
            }
          }
        }
        return Promise.resolve(results).finally(() => {
          progress = 0;
        });
      };

      const results = await batchUpload(['file1.txt', 'file2.txt']);

      expect(progress).assertEqual(0); // Progress reset after batch
      expect(results).assertDeepEquals(['uploaded: file1.txt', 'upload failed']); // Results preserved
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_8800
     * @tc.name PromiseFinallyTest088
     * @tc.desc finally() releases lock after concurrent resource access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resourceLocked = false;
      const mockAcquireLock = async (): Promise<void> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        resourceLocked = true;
      };
      const mockReleaseLock = (): void => {
        resourceLocked = false;
      };
      const mockUseResource = async (id: number): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
        return `used resource ${id}`;
      };

      // Simulate concurrent access flow: acquire lock → use resource → release lock
      const useResourceFlow = async (id: number): Promise<string> => {
        await mockAcquireLock();
        return mockUseResource(id)
          .finally(() => {
            mockReleaseLock();
          });
      };

      // Run two concurrent flows
      const result = await Promise.all([
        useResourceFlow(1),
        useResourceFlow(2)
      ]);

      expect(result[0]).assertEqual('used resource 1');
      expect(result[1]).assertEqual('used resource 2');
      expect(resourceLocked).assertEqual(false); // Lock released after all access
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_FINALLY_TEST_9000
     * @tc.name PromiseFinallyTest090
     * @tc.desc finally() logs operation result after async payment processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const operationLogs: string[] = [];
      const mockProcessPayment = async (amount: number): Promise<string> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 30)});
        if (amount < 0) {
          throw new Error('invalid amount');
        }
        return `payment processed: $${amount}`;
      };

      // Simulate payment flow: process → log result (success/fail) → return status
      const processPaymentFlow = async (amount: number): Promise<string> => {
        let result = '';
        try {
          result = await mockProcessPayment(amount);
          return result;
        } catch (err) {
          result = err.message;
          throw err as Error;
        } finally {
          operationLogs.push(`[${new Date().toISOString()}] ${result}`);
        }
      };

      // Test success case
      await processPaymentFlow(99.99);
      // Test failure case
      try {
        await processPaymentFlow(-50);
      } catch(err) {
      }

      expect(operationLogs.length).assertEqual(2); // Two logs generated
      expect(operationLogs[0]).assertContain('payment processed: $99.99'); // Success log
      expect(operationLogs[1]).assertContain('invalid amount'); // Failure log
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09300
     * @tc.name PromiseFinallyTest093
     * @tc.desc finally() preserves return value in async utility function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const calculateDiscount = async (price: number, rate: number) => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        return price * (1 - rate);
      };

      const getFinalPrice = async (price: number, rate: number) => {
        return calculateDiscount(price, rate)
          .finally(() => {
            console.log('Discount calculation completed');
          });
      };

      const finalPrice = await getFinalPrice(100, 0.2);
      expect(finalPrice).assertEqual(80);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09400
     * @tc.name PromiseFinallyTest094
     * @tc.desc finally() handles async error in DOM event handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let alertShown = false;

      const handleSubmit = async (): Promise<string> => {
        try {
          await new Promise<void>((resolve, reject) => {
            setTimeout(() => reject(new Error('submit failed')), 15);
          });
        } catch (err) {
          throw err as Error;
        } finally {
          alertShown = true;
        }
        return '';
      };
      let err = ''
      await handleSubmit().catch((e: Error) => {
        err = e.message
      })
      expect(err).assertEqual('submit failed');
      expect(alertShown).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09500
     * @tc.name PromiseFinallyTest095
     * @tc.desc finally() resets global state after batch API calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let apiInProgress = 0;
      const mockApiCall = async (id: number) => {
        apiInProgress++;
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        return `result-${id}`;
      };

      const batchApiCall = async (ids: number[]) => {
        const promises = ids.map((id: number): Promise<string> => mockApiCall(id));
        return Promise.all(promises)
          .finally(() => {
            apiInProgress = 0;
          });
      };

      const results = await batchApiCall([1, 2, 3]);
      expect(results).assertDeepEquals(['result-1', 'result-2', 'result-3']);
      expect(apiInProgress).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09600
     * @tc.name PromiseFinallyTest096
     * @tc.desc finally() throws error overriding original resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchData = async () => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        return 'success data';
      };

      const processWithRisk = async () => {
        return fetchData()
          .finally(() => {
            throw new Error('critical error in finally');
          });
      };
      let err = ''
      await processWithRisk().catch((e: Error) => {
        err = e.message
      })
      expect(err).assertEqual('critical error in finally');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09700
     * @tc.name PromiseFinallyTest097
     * @tc.desc finally() with async cleanup in React-like effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let subscriptionActive = false;
      const subscribe = async () => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
        subscriptionActive = true;
      };
      const unsubscribe = async () => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
        subscriptionActive = false;
      };

      const setupSubscription = async () => {
        await subscribe();
        return Promise.resolve()
          .finally(async () => {
            await unsubscribe();
          });
      };

      await setupSubscription();
      await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
      expect(subscriptionActive).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09800
     * @tc.name PromiseFinallyTest098
     * @tc.desc finally() executes for already resolved promise (JS runtime behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyRan = false;
      const resolvedPromise = Promise.resolve('already done');
      await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});

      const result = await resolvedPromise.finally(() => {
        finallyRan = true;
      });

      expect(finallyRan).assertEqual(true);
      expect(result).assertEqual('already done');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_09900
     * @tc.name PromiseFinallyTest099
     * @tc.desc finally() in chain with async then() and catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseFinallyTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      const flow = async () => {
        return Promise.resolve('start')
          .then(async (val: string) => {
            executionLog.push(`then1: ${val}`);
            await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 5)});
            throw new Error('then error');
          })
          .catch((err: Error) => {
            executionLog.push(`catch: ${err.message}`);
            return 'recovered';
          })
          .finally(() => {
            executionLog.push('finally');
          });
      };

      const result = await flow();
      expect(result).assertEqual('recovered');
      expect(executionLog).assertDeepEquals(['then1: start', 'catch: then error', 'finally']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_finally_TEST_10000
     * @tc.name PromiseFinallyTest100
     * @tc.desc finally() does not affect promise state in utility wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseFinallyTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const withLogging = (promise: Promise<int>) => {
        console.log('Starting operation');
        return promise
          .finally(() => {
            console.log('Operation finished');
          });
      };

      const successPromise = Promise.resolve(42);
      const successResult = await withLogging(successPromise);
      expect(successResult).assertEqual(42);

      const failPromise = Promise.reject(new Error('test fail'));
      let err = ''
      await withLogging(failPromise).catch((e: Error) => {
        err = e.message
      })
      expect(err).assertEqual('test fail');
    });

  })
}
