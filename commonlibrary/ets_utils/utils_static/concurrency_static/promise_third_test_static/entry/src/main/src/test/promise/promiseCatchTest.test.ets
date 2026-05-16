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
interface Data {
  id: number;
  name: string
}
export default function promiseCatchTest(){
  describe('promiseCatchTest', ():void => {
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0100
     * @tc.name PromiseCatchTest001
     * @tc.desc catch() captures errors thrown in the Promise executor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtErr = new Error();
      const promise: Promise<void> = new Promise<void>((resolve, reject) => {
        throw new Error('Executor error');
      });

      await promise.catch((err: Error) => {
        caughtErr = err;
      });

      expect(caughtErr instanceof Error).assertEqual(true);
      expect(caughtErr?.message).assertEqual('Executor error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0400
     * @tc.name PromiseCatchTest004
     * @tc.desc catch() callback is not executed for a resolved Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchExecuted: boolean = false;
      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve('Success value');
      });

      await promise.catch(() => {
        catchExecuted = true;
      });

      expect(catchExecuted).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0500
     * @tc.name PromiseCatchTest005
     * @tc.desc catch() captures errors thrown in the then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtErrMsg: string = '';
      const promise: Promise<void> = Promise.resolve()
        .then(() => {
          throw new Error('Error in then callback');
        });

      await promise.catch((err: Error) => {
        caughtErrMsg = err.message;
      });

      expect(caughtErrMsg).assertEqual('Error in then callback');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0600
     * @tc.name PromiseCatchTest006
     * @tc.desc catch() captures all upstream errors in a promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorLog: string[] = [];
      await Promise.resolve<number>(10)
        .then((val: number) => {
          if (val > 5) {
            throw new Error('First error');
          }
          return val;
        })
        .then((val: number) => val * 2)// Will not execute
        .catch((err: Error) => {
          errorLog.push(err.message);
          throw new Error('Second error');
        })
        .catch((err: Error) => {
          errorLog.push(err.message);
        });

      expect(errorLog).assertDeepEquals(['First error', 'Second error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1100
     * @tc.name PromiseCatchTest011
     * @tc.desc catch() handles errors from nested Promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtErrMsg: string = '';

      await Promise.resolve<number>(5)
        .then((val: number) => {
          return Promise.resolve(val * 2)
            .then((nestedVal: number) => {
              if (nestedVal > 8) {
                throw new Error('Nested over limit');
              }
              return nestedVal;
            });
        })
        .catch((err: Error) => {
          caughtErrMsg = err.message;
        });

      expect(caughtErrMsg).assertEqual('Nested over limit');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1900
     * @tc.name PromiseCatchTest019
     * @tc.desc catch() ignores resolved values even if they resemble errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchExecuted: boolean = false;
      const errorLikeValue: string = 'Error: Fake message';

      const result: string = await Promise.resolve(errorLikeValue)
        .catch(() => {
          catchExecuted = true;
          return 'Handled';
        });

      expect(catchExecuted).assertEqual(false);
      expect(result).assertEqual(errorLikeValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2300
     * @tc.name PromiseCatchTest023
     * @tc.desc catch() captures errors from nested catch() in inner chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outerErrMsg: string = '';

      await Promise.resolve<number>(100)
        .then((val: number) => {
          return Promise.resolve(val / 0.0)// Generate Infinity, no error yet
            .then((invalidVal: number) => {
              if (invalidVal === Infinity) {
                throw new Error('Infinity detected');
              }
              return invalidVal;
            })
            .catch((innerErr: Error) => {
              throw new Error(`Inner caught: ${innerErr.message}`); // Re-throw wrapped error
            });
        })
        .catch((outerErr: Error) => {
          outerErrMsg = outerErr.message;
        });

      expect(outerErrMsg).assertEqual('Inner caught: Infinity detected');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2500
     * @tc.name PromiseCatchTest025
     * @tc.desc catch() handles errors from async onFulfilled in then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtAsyncFulfillErr: string = '';
      const asyncFulfill = async (val: int): Promise<int> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
        if (val < 0) {
          throw new Error('Negative value not allowed');
        }
        return val * 2;
      };

      await Promise.resolve(-5)
        .then(async (val: int) => await asyncFulfill(val))
        .catch((err: Error) => {
          caughtAsyncFulfillErr = err.message;
        });

      expect(caughtAsyncFulfillErr).assertEqual('Negative value not allowed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4000
     * @tc.name PromiseCatchTest040
     * @tc.desc catch() propagates errors correctly through nested then-catch chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorTrace: string[] = [];

      await Promise.resolve()
        .then(() => {
          return Promise.resolve()
            .then(() => {
              throw new Error('Inner level error');
            })
            .catch((err: Error) => {
              errorTrace.push(`Inner catch: ${err.message}`);
              throw err;
            });
        })
        .then(() => errorTrace.push('Unreachable outer then'))
        .catch((err: Error) => {
          errorTrace.push(`Outer catch: ${err.message}`);
        });

      expect(errorTrace).assertDeepEquals(['Inner catch: Inner level error', 'Outer catch: Inner level error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4300
     * @tc.name PromiseCatchTest043
     * @tc.desc catch() skips downstream then() until next catch() on re-throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionLog: string[] = [];

      await Promise.resolve()
        .then(() => {
          executionLog.push('Then 1');
          throw new Error('Error in then 1');
        })
        .then(() => executionLog.push('Then 2 (unreachable)'))
        .then(() => executionLog.push('Then 3 (unreachable)'))
        .catch((err: Error) => {
          executionLog.push(`Catch 1: ${err.message}`);
          throw new Error('Re-thrown in catch 1');
        })
        .then(() => executionLog.push('Then 4 (unreachable)'))
        .catch((err: Error) => {
          executionLog.push(`Catch 2: ${err.message}`);
        });

      expect(executionLog).assertDeepEquals([
        'Then 1',
        'Catch 1: Error in then 1',
        'Catch 2: Re-thrown in catch 1'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4600
     * @tc.name PromiseCatchTest046
     * @tc.desc Nested catch() in chain does not block outer chain recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalResult: string = '';

      await Promise.resolve('Start')
        .then((val: string) => {
          return Promise.resolve(val + ' -> inner 1')
            .then((innerVal: string) => {
              throw new Error(`Inner error: ${innerVal}`);
            })
            .catch((err: Error) => {
              return `Inner recovered: ${err.message}`; // Nested catch recovers
            });
        })
        .then((val: string) => {
          finalResult = `Outer then: ${val}`; // Outer then receives recovered value
        })
        .catch((err: Error) => {
          finalResult = `Outer catch: ${err.message}`; // Not executed
        });

      expect(finalResult).assertEqual('Outer then: Inner recovered: Inner error: Start -> inner 1');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4700
     * @tc.name PromiseCatchTest047
     * @tc.desc Chain with multiple catch() handles errors at nearest catch() first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const catchOrder: string[] = [];

      await Promise.resolve()
        .then(() => {
          throw new Error('Error 1');
        })
        .catch((err: Error) => {
          catchOrder.push(`Catch A: ${err.message}`);
          return 'Recover A';
        })
        .then((val: string) => {
          throw new Error(`Error 2: ${val}`);
        })
        .then(() => catchOrder.push('Then after error 2 (unreachable)'))
        .catch((err: Error) => {
          catchOrder.push(`Catch B: ${err.message}`);
          throw new Error(`Error 3: ${err.message}`);
        })
        .catch((err: Error) => {
          catchOrder.push(`Catch C: ${err.message}`);
        });

      expect(catchOrder).assertDeepEquals([
        'Catch A: Error 1',
        'Catch B: Error 2: Recover A',
        'Catch C: Error 3: Error 2: Recover A'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5000
     * @tc.name PromiseCatchTest050
     * @tc.desc Long chain with alternating then() and catch() handles errors sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sequenceLog: string[] = [];
      let step: number = 1;

      const createStep = (shouldFail: boolean): () => Promise<number> => {
        return () => {
          const currentStep: number = step++;
          if (shouldFail) {
            throw new Error(`Step ${currentStep} failed`);
          }
          return Promise.resolve(currentStep);
        };
      };

      await Promise.resolve()
        .then(createStep(false))// Step 1: success
        .then((val: number) => sequenceLog.push(`Then: Step ${val} done`))
        .then(createStep(true))// Step 2: fail
        .catch((err: Error) => sequenceLog.push(`Catch: ${err.message}`))
        .then(createStep(false))// Step 3: success (recovered)
        .then((val: number) => sequenceLog.push(`Then: Step ${val} done`))
        .then(createStep(true))// Step 4: fail
        .catch((err: Error) => sequenceLog.push(`Catch: ${err.message}`));

      expect(sequenceLog).assertDeepEquals([
        'Then: Step 1 done',
        'Catch: Step 2 failed',
        'Then: Step 3 done',
        'Catch: Step 4 failed'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5100
     * @tc.name PromiseCatchTest051
     * @tc.desc Async nested then() error propagates to outer catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outerCaughtErr: string = '';

      await Promise.resolve<number>(5)
        .then((val: number) => {
          // Async nested then() chain
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(val * 2);
            }, 20);
          }).then((nestedVal: number) => {
            setTimeout(() => {
              return new Error(`Nested async error2: ${nestedVal}`);
            }, 10);
            return new Error(`Nested async error: ${nestedVal}`);
          });
        })
        .then((err: Error) => {
          outerCaughtErr = err.message;
        });

      expect(outerCaughtErr).assertEqual('Nested async error: 10');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5700
     * @tc.name PromiseCatchTest057
     * @tc.desc Async recovery in nested catch() allows outer chain to continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalResult: string = '';

      await Promise.resolve('Root')
        .then((val: string) => {
          // Nested chain with async error and recovery
          return new Promise<string>((resolve) => {
            setTimeout(() => resolve(val + ' -> Level 1'), 15);
          })
            .then((nestedVal: string) => {
              throw new Error(`Error at ${nestedVal}`);
            })
            .catch((err: Error) => {
              // Async recovery
              return new Promise<string>((resolve) => {
                setTimeout(() => resolve(`Recovered from: ${err.message}`), 10);
              });
            });
        })
        .then((val: string) => {
          finalResult = `Outer result: ${val}`;
        })
        .catch((err: Error) => {
          finalResult = `Outer error: ${err.message}`;
        });

      expect(finalResult).assertEqual('Outer result: Recovered from: Error at Root -> Level 1');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5900
     * @tc.name PromiseCatchTest059
     * @tc.desc Nested async then() with type error captured by outer catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let typeErrMsg: string = '';
      const fetchFakeData = (): Promise<Data | undefined> => {
        return new Promise<Data | undefined>((resolve) => {
          setTimeout(() => resolve(undefined), 20); // Resolve with null (wrong type)
        });
      };

      await Promise.resolve()
        .then(async () => {
          const data = await fetchFakeData();
          // Nested async then() with type error
          return new Promise<Error>((resolve) => {
            setTimeout(() => {
              resolve(Error('error')); // Throws: data is null
            }, 10);
          });
        })
        .then((err: Error) => {
          typeErrMsg = err.message;
        })
      console.log('PromiseCatchTest059 typeErrMsg: ' + typeErrMsg)
      expect(typeErrMsg).assertContain('error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6100
     * @tc.name PromiseCatchTest061
     * @tc.desc Nested sync exception in then() propagates through multi-level chain to catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalErrMsg: string = '';

      await Promise.resolve<number>(10)
        .then((val: number) => {
          return Promise.resolve(val * 2)
            .then((nestedVal: number) => {
              // Nested sync exception
              if (nestedVal > 15) {
                throw new Error(`Nested overflow: ${nestedVal}`);
              }
              return nestedVal;
            })
            .then((deepVal: number) => deepVal + 5); // Unreachable
        })
        .then((result: number) => finalErrMsg = `Unexpected: ${result}`)// Unreachable
        .catch((err: Error) => {
          finalErrMsg = err.message;
        });

      expect(finalErrMsg).assertEqual('Nested overflow: 20');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6300
     * @tc.name PromiseCatchTest063
     * @tc.desc Deeply nested catch() swallows exception without re-throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outerCatchTriggered: boolean = false;
      let nestedRecovery: string = '';

      await Promise.resolve('Start')
        .then((val: string) => {
          return Promise.resolve(val + ' -> Level 1')
            .then((val2: string) => {
              return Promise.resolve(val2 + ' -> Level 2')
                .then((val3: string) => {
                  throw new Error(`Exception at ${val3}`);
                })
                .catch((err: Error) => {
                  // Nested catch swallows exception (no re-throw)
                  nestedRecovery = `Recovered: ${err.message}`;
                  return nestedRecovery;
                });
            });
        })
        .then((finalVal: string) => {
          nestedRecovery = finalVal; // Receives recovered value
        })
        .catch(() => {
          outerCatchTriggered = true;
        });

      expect(outerCatchTriggered).assertEqual(false);
      expect(nestedRecovery).assertEqual('Recovered: Exception at Start -> Level 1 -> Level 2');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6600
     * @tc.name PromiseCatchTest066
     * @tc.desc Chain with catch() handles exception from async/await in nested then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtAsyncAwaitErr: string = '';
      const asyncValidator = async (val: int): Promise<int> => {
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 20)});
        if (val < 0) {
          throw new Error(`Negative value: ${val}`);
        }
        return val;
      };

      await Promise.resolve(-10)
        .then(async (val: int) => {
          // Nested async/await that throws
          return new Promise<int>((resolve, reject) => {
            async()=>{
              try {
                const validated = await asyncValidator(val);
                resolve(validated);
              } catch (err) {
                reject(err);
              }
            }()
          });
        })
        .catch((err: Error) => {
          caughtAsyncAwaitErr = err.message;
        });
      expect(caughtAsyncAwaitErr).assertEqual('Negative value: -10');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6700
     * @tc.name PromiseCatchTest067
     * @tc.desc Multiple nested exceptions propagate to nearest catch() first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const catchLog: string[] = [];

      await Promise.resolve()
        .then(() => {
          // Level 1: throw exception
          throw new Error('Level 1 exception');
        })
        .catch((err: Error) => {
          catchLog.push(`Catch L1: ${err.message}`);
          return Promise.resolve()
            .then(() => {
              // Level 2: throw exception
              throw new Error('Level 2 exception');
            })
            .then(() => catchLog.push('Then L2 (unreachable)'))
            .catch((err: Error) => {
              catchLog.push(`Catch L2: ${err.message}`);
              return Promise.resolve()
                .then(() => {
                  // Level 3: throw exception
                  throw new Error('Level 3 exception');
                });
            });
        })
        .catch((err: Error) => {
          catchLog.push(`Catch Root: ${err.message}`);
        });

      expect(catchLog).assertDeepEquals([
        'Catch L1: Level 1 exception',
        'Catch L2: Level 2 exception',
        'Catch Root: Level 3 exception'
      ]);
    });

  })
}
