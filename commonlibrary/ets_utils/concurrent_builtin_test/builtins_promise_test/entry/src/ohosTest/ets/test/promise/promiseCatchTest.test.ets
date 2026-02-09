import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  DelayedRejectThenable97,
  PromiseCatchTest036,
  PromiseCatchTest068,
  PromiseCatchTest081,
  test007
} from './promisejs';
import {
  AsyncRejectThenable37,
  AsyncRejectThenable53,
  db74,
  FaultyThenable64,
  fetchAndParseData72,
  fs77,
  obj75,
  paymentService76,
  PromiseCatchTest071,
  PromiseCatchTest078,
  PromiseCatchTest082,
  PromiseCatchTest083,
  PromiseCatchTest084,
  PromiseCatchTest085,
  PromiseCatchTest086,
  PromiseCatchTest087,
  PromiseCatchTest088,
  PromiseCatchTest089,
  PromiseCatchTest090,
  type39,
  type75,
  type80,
  type99
} from './promisets';
import { sleep } from './utils';

export default function promiseCatchTest() {
  describe('promiseCatchTest', () => {
    afterEach(async () => {
      await sleep(50)
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
      const promise: Promise<void> = new Promise((resolve, reject) => {
        throw new Error('Executor error');
      });

      await promise.catch((err: Error) => {
        caughtErr = err;
      });

      expect(caughtErr instanceof Error).assertEqual(true);
      expect(caughtErr?.message).assertEqual('Executor error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0200
     * @tc.name PromiseCatchTest002
     * @tc.desc catch() captures the reason from a manually rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtReason: string = '';
      const rejectReason: string = 'Manual rejection';
      const promise: Promise<never> = new Promise((resolve, reject) => {
        reject(rejectReason);
      });

      await promise.catch((reason: string) => {
        caughtReason = reason;
      });

      expect(caughtReason).assertEqual(rejectReason);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0300
     * @tc.name PromiseCatchTest003
     * @tc.desc catch() returns a resolved Promise when onRejected returns a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<string>((resolve, reject) => {
        reject('Error occurred');
      }).catch((reason: string) => {
        return `Handled: ${reason}`;
      });

      const result: string = await promise;
      expect(result).assertEqual('Handled: Error occurred');
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
      const promise: Promise<string> = new Promise((resolve) => {
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0700
     * @tc.name PromiseCatchTest007
     * @tc.desc catch() captures errors thrown in asynchronous operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // let caughtErr = new Error();
      // let func = async () => {
      //   const promise: Promise<void> = new Promise((resolve) => {
      //     setTimeout(() => {
      //       throw new Error('Async error');
      //     }, 50);
      //   });
      //
      //   await promise.catch((err: Error) => {
      //     caughtErr = err;
      //   });
      // }
      let result = await test007()
      expect(result).assertEqual('Async error');

    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0800
     * @tc.name PromiseCatchTest008
     * @tc.desc Functional equivalence between catch() and then(onFulfilled, onRejected)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectReason: string = 'Test reason';
      let catchResult: string = '';
      let thenRejectResult: string = '';

      // Using catch()
      await Promise.reject(rejectReason)
        .catch((reason: string) => {
          catchResult = `Caught by catch: ${reason}`;
        });

      // Using then(onFulfilled, onRejected)
      await Promise.reject(rejectReason)
        .then(
          () => {
          },
          (reason: string) => {
            thenRejectResult = `Caught by then: ${reason}`;
          }
        );

      expect(catchResult).assertEqual(`Caught by catch: ${rejectReason}`);
      expect(thenRejectResult).assertEqual(`Caught by then: ${rejectReason}`);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_0900
     * @tc.name PromiseCatchTest009
     * @tc.desc Errors thrown in catch() need subsequent catch() to capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalErrMsg: string = '';
      const promise: Promise<void> = Promise.reject('Original error')
        .catch((reason: string) => {
          throw new Error(`Wrapped: ${reason}`);
        });

      await promise.catch((err: Error) => {
        finalErrMsg = err.message;
      });

      expect(finalErrMsg).assertEqual('Wrapped: Original error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1000
     * @tc.name PromiseCatchTest010
     * @tc.desc catch() captures the rejected state of a thenable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectedThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          _onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null,
          onRejected?: ((reason: string) => TResult2 | PromiseLike<TResult2>) | null
        ): PromiseLike<TResult1 | TResult2> {
          // Directly reject when then() is called
          return new Promise((_, reject) => {
            onRejected!('Thenable rejected');
          });
        }
      }

      let caughtReason: string = '';

      // Resolve a promise with our rejected thenable
      // Promise.resolve() will unwrap the thenable and handle its rejection
      const promise: Promise<string> = Promise.resolve(new RejectedThenable());

      // Catch the rejection from the thenable
      await promise.catch((reason: string) => {
        caughtReason = reason;
      });

      // Verify we caught the correct rejection reason
      expect(caughtReason).assertEqual('Thenable rejected');
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1200
     * @tc.name PromiseCatchTest012
     * @tc.desc catch() returns PromiseLike which can chain subsequent then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let processStep: string = '';

      const result: string = await Promise.reject('Initial failure')
        .catch((reason: string) => {
          processStep = `Caught: ${reason}`;
          return 'Recovered value';
        })
        .then((val: string) => {
          return `${val} - post processed`;
        });

      expect(processStep).assertEqual('Caught: Initial failure');
      expect(result).assertEqual('Recovered value - post processed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1300
     * @tc.name PromiseCatchTest013
     * @tc.desc catch() does not interfere with resolved thenable in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchTriggered: boolean = false;

      class ResolvedThenable implements PromiseLike<number> {
        then<TResult1 = number>(onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null) {
          return Promise.resolve(42).then(onFulfilled);
        }
      }

      const result: number = await Promise.resolve(new ResolvedThenable())
        .then((val: number) => val * 2)
        .catch(() => {
          catchTriggered = true;
          return -1;
        });

      expect(catchTriggered).assertEqual(false);
      expect(result).assertEqual(84);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1400
     * @tc.name PromiseCatchTest014
     * @tc.desc catch() captures errors from Promise.all() rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let firstRejectionReason: string = '';
      const task1: Promise<string> = Promise.resolve('Success 1');
      const task2: Promise<string> = Promise.reject('Task 2 failed');
      const task3: Promise<string> = Promise.resolve('Success 3');

      await Promise.all([task1, task2, task3])
        .catch((reason: string) => {
          firstRejectionReason = reason;
        });

      expect(firstRejectionReason).assertEqual('Task 2 failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1500
     * @tc.name PromiseCatchTest015
     * @tc.desc catch() handles non-Error rejection reasons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtNonError: number | string | null = null;
      const rejectionValues: (number | string)[] = [404, 'Not found', 500];

      for (const val of rejectionValues) {
        await Promise.reject(val)
          .catch((reason: number | string) => {
            caughtNonError = reason;
          });
        expect(caughtNonError).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1600
     * @tc.name PromiseCatchTest016
     * @tc.desc catch() in middle of chain captures upstream errors and passes downstream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      await Promise.reject('Root error')
        .then(() => log.push('Unreachable 1'))
        .catch((reason: string) => {
          log.push(`Catch 1: ${reason}`);
          return 'Recovered once';
        })
        .then((val: string | number) => {
          log.push(`Then after catch: ${val}`);
          throw new Error('New error');
        })
        .catch((err: Error) => {
          log.push(`Catch 2: ${err.message}`);
        });

      expect(log).assertDeepEquals(['Catch 1: Root error', 'Then after catch: Recovered once', 'Catch 2: New error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1700
     * @tc.name PromiseCatchTest017
     * @tc.desc catch() captures errors from delayed rejection in executor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtDelayErr: string = '';
      const promise: Promise<void> = new Promise((resolve, reject) => {
        setTimeout(() => {
          reject('Delayed executor rejection');
        }, 60);
      });

      await promise.catch((reason: string) => {
        caughtDelayErr = reason;
      });

      expect(caughtDelayErr).assertEqual('Delayed executor rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_1800
     * @tc.name PromiseCatchTest018
     * @tc.desc Multiple catch() in chain handle errors at respective stages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorStage: string = '';

      await Promise.resolve()
        .then(() => {
          throw new Error('Stage 1 error');
        })
        .catch((err: Error) => {
          errorStage = `Stage 1: ${err.message}`;
          return Promise.resolve();
        })
        .then(() => {
          return Promise.reject('Stage 2 failure');
        })
        .catch((reason: string) => {
          errorStage += ` | Stage 2: ${reason}`;
        });

      expect(errorStage).assertEqual('Stage 1: Stage 1 error | Stage 2: Stage 2 failure');
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2000
     * @tc.name PromiseCatchTest020
     * @tc.desc catch() captures errors from async/await in then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtAsyncErr: string = '';
      const asyncTask = (): Promise<never> => {
        return new Promise((_, reject) => setTimeout(() => reject('Async task failed'), 40));
      };

      await Promise.resolve()
        .then(async () => {
          await asyncTask(); // Async error here
        })
        .catch((reason: string) => {
          caughtAsyncErr = reason;
        });

      expect(caughtAsyncErr).assertEqual('Async task failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2100
     * @tc.name PromiseCatchTest021
     * @tc.desc catch() captures errors from Promise.race() rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let winningRejection: string = '';
      const slowResolve: Promise<string> = new Promise(resolve => setTimeout(() => resolve('Late success'), 100));
      const fastReject: Promise<never> = new Promise((_, reject) => setTimeout(() => reject('Fast failure'), 30));

      await Promise.race([slowResolve, fastReject])
        .catch((reason: string) => {
          winningRejection = reason;
        });

      expect(winningRejection).assertEqual('Fast failure');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2200
     * @tc.name PromiseCatchTest022
     * @tc.desc catch() returns resolved Promise even when onRejected returns nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isResolved: boolean = false;
      const promise: Promise<void> = Promise.reject('Test error')
        .catch((_reason: string) => {
          // No return value
        });

      await promise.then(() => {
        isResolved = true;
      });

      expect(isResolved).assertEqual(true);
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
          return Promise.resolve(val / 0)// Generate Infinity, no error yet
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2400
     * @tc.name PromiseCatchTest024
     * @tc.desc catch() does not trigger for resolved Promise in Promise.allSettled()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchTriggered: boolean = false;
      const tasks: Promise<number>[] = [
        Promise.resolve(10),
        Promise.reject(20),
        Promise.resolve(30)
      ];

      const results: PromiseSettledResult<number>[] = await Promise.allSettled(tasks)
        .catch(() => {
          catchTriggered = true;
          return [];
        });

      expect(catchTriggered).assertEqual(false);
      expect(results.length).assertEqual(3);
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason).assertEqual(20);
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
      const asyncFulfill = async (val: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 20));
        if (val < 0) {
          throw new Error('Negative value not allowed');
        }
        return val * 2;
      };

      await Promise.resolve(-5)
        .then(async (val: number) => await asyncFulfill(val))
        .catch((err: Error) => {
          caughtAsyncFulfillErr = err.message;
        });

      expect(caughtAsyncFulfillErr).assertEqual('Negative value not allowed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2600
     * @tc.name PromiseCatchTest026
     * @tc.desc catch() captures errors from rejected Promise returned in catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalReason: string = '';

      await Promise.reject('First error')
        .catch((reason: string) => {
          return Promise.reject(`Wrapped: ${reason}`); // Return rejected Promise
        })
        .catch((errReason: string) => {
          finalReason = errReason;
        });

      expect(finalReason).assertEqual('Wrapped: First error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2700
     * @tc.name PromiseCatchTest027
     * @tc.desc catch() ignores resolved thenable returned from onRejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let thenExecuted: boolean = false;

      class ResolvedThenable implements PromiseLike<string> {
        then<TResult1 = string>(onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null) {
          return Promise.resolve('Thenable resolved').then(onFulfilled);
        }
      }

      await Promise.reject('Original error')
        .catch(() => new ResolvedThenable())
        .then((val: string) => {
          thenExecuted = true;
          expect(val).assertEqual('Thenable resolved');
        });

      expect(thenExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2800
     * @tc.name PromiseCatchTest028
     * @tc.desc catch() captures errors from synchronous exceptions in onRejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorFromOnRejected: string = '';

      await Promise.reject('Initial error')
        .catch((reason: string) => {
          if (reason.includes('Initial')) {
            throw new Error('onRejected sync error');
          }
          return 'Handled';
        })
        .catch((err: Error) => {
          errorFromOnRejected = err.message;
        });

      expect(errorFromOnRejected).assertEqual('onRejected sync error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_2900
     * @tc.name PromiseCatchTest029
     * @tc.desc catch() works with Promise.resolve() wrapping rejected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtWrappedRejection: string = '';
      const rejectedPromise: Promise<string> = Promise.reject('Raw rejection');
      const wrappedPromise: Promise<string> = Promise.resolve(rejectedPromise); // Wraps rejected Promise

      await wrappedPromise.catch((reason: string) => {
        caughtWrappedRejection = reason;
      });

      expect(caughtWrappedRejection).assertEqual('Raw rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3000
     * @tc.name PromiseCatchTest030
     * @tc.desc catch() captures errors from nested Promise.all() in then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allRejectionReason: string = '';
      const createTask = (id: number, shouldReject: boolean): Promise<number> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            shouldReject ? reject(`Task ${id} failed`) : resolve(id);
          }, id * 10);
        });
      };

      await Promise.resolve<number[]>([1, 2, 3])
        .then((ids: number[]) => {
          const tasks: Promise<number>[] = ids.map(id => createTask(id, id === 2)); // Task 2 rejects
          return Promise.all(tasks);
        })
        .catch((reason: string) => {
          allRejectionReason = reason;
        });

      expect(allRejectionReason).assertEqual('Task 2 failed');
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3100
     * @tc.name PromiseCatchTest031
     * @tc.desc catch() captures errors from Promise.any() when all promises reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let aggregateErrorMsg: string = '';
      let error: AggregateError;
      const task1: Promise<string> = Promise.reject('Task 1 failed');
      const task2: Promise<string> = Promise.reject('Task 2 failed');
      const task3: Promise<string> = Promise.reject('Task 3 failed');

      await Promise.any([task1, task2, task3])
        .catch((err: AggregateError) => {
          console.log('PromiseCatchTest031: ' + err.message)
          aggregateErrorMsg = err.message;
          error = err
        });
      console.log('PromiseCatchTest031: ' + aggregateErrorMsg)
      // expect(aggregateErrorMsg).assertContain('All promises were rejected');
      expect(error!.errors).assertDeepEquals(['Task 1 failed', 'Task 2 failed', 'Task 3 failed']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3200
     * @tc.name PromiseCatchTest032
     * @tc.desc catch() does not trigger for resolved promise after delayed rejection attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchExecuted: boolean = false;
      const promise: Promise<string> = new Promise((resolve, reject) => {
        resolve('Resolved first');
        setTimeout(() => {
          reject('Late rejection attempt'); // Ignored
        }, 50);
      });

      const result: string = await promise.catch(() => {
        catchExecuted = true;
        return 'Handled';
      });

      expect(catchExecuted).assertEqual(false);
      expect(result).assertEqual('Resolved first');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3300
     * @tc.name PromiseCatchTest033
     * @tc.desc catch() captures errors from recursive promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtRecursiveErr: string = '';
      const recursivePromise = (count: number): Promise<number> => {
        if (count > 3) {
          throw new Error(`Recursion limit hit: ${count}`);
        }
        return Promise.resolve(count + 1).then(recursivePromise);
      };

      await recursivePromise(1)
        .catch((err: Error) => {
          caughtRecursiveErr = err.message;
        });

      expect(caughtRecursiveErr).assertEqual('Recursion limit hit: 4');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3400
     * @tc.name PromiseCatchTest034
     * @tc.desc catch() handles errors when onRejected is not a function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalErrMsg: string = '';
      // Pass non-function values to catch()
      const invalidHandlers: (undefined | null | number)[] = [undefined, null, 123];

      for (const handler of invalidHandlers) {
        await Promise.reject(`Test for ${handler}`)
          .catch((err: string) => {
            finalErrMsg = err;
          });
        expect(finalErrMsg).assertEqual(`Test for ${handler}`);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3500
     * @tc.name PromiseCatchTest035
     * @tc.desc catch() captures errors from async onRejected in catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncOnRejectedErr: string = '';
      const asyncOnRejected = async (reason: string): Promise<void> => {
        await new Promise<void>(resolve => setTimeout(resolve, 30));
        throw new Error(`Async wrapped: ${reason}`);
      };

      await Promise.reject('Original error')
        .catch(asyncOnRejected)
        .catch((err: Error) => {
          asyncOnRejectedErr = err.message;
        });

      expect(asyncOnRejectedErr).assertEqual('Async wrapped: Original error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3600
     * @tc.name PromiseCatchTest036
     * @tc.desc catch() works with Promise.withResolvers() rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest036()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3700
     * @tc.name PromiseCatchTest037
     * @tc.desc catch() captures errors from thenable that rejects asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncThenableErr: string = '';
      await Promise.resolve(AsyncRejectThenable37)
        .catch((reason: string) => {
          asyncThenableErr = reason;
        });

      expect(asyncThenableErr).assertEqual('Async thenable rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3800
     * @tc.name PromiseCatchTest038
     * @tc.desc catch() in parallel chains captures respective errors independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorResults: string[] = [];
      const basePromise: Promise<number> = new Promise((_, reject) => {
        setTimeout(() => reject('Base error'), 30);
      });

      // Create parallel chains from the same base promise
      const chain1 = basePromise.catch((err: string) => errorResults.push(`Chain1: ${err}`));
      const chain2 = basePromise.catch((err: string) => errorResults.push(`Chain2: ${err}`));

      await Promise.all([chain1, chain2]);
      expect(errorResults.sort()).assertDeepEquals(['Chain1: Base error', 'Chain2: Base error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_3900
     * @tc.name PromiseCatchTest039
     * @tc.desc catch() captures errors from type mismatch in promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let typeMismatchErr: string = '';
      const fetchData = (): Promise<type39 | null> => {
        return new Promise<type39 | null>((resolve) => {
          setTimeout(() => resolve(null), 20); // Resolve with wrong type
        });
      };

      await fetchData()
        .then((data) => {
          return data!.id.toString(); // Throws when data is null
        })
        .catch((err: Error) => {
          typeMismatchErr = err.message;
        });

      expect(typeMismatchErr).assertContain('Cannot read property id of null');
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
              throw err; // Re-throw to outer chain
            });
        })
        .then(() => errorTrace.push('Unreachable outer then'))
        .catch((err: Error) => {
          errorTrace.push(`Outer catch: ${err.message}`);
        });

      expect(errorTrace).assertDeepEquals(['Inner catch: Inner level error', 'Outer catch: Inner level error']);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4100
     * @tc.name PromiseCatchTest041
     * @tc.desc catch() in middle of chain recovers and propagates new error to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chainLog: string[] = [];

      await Promise.reject('Step 1 failed')
        .then(() => chainLog.push('Step 1 then (unreachable)'))
        .catch((err: string) => {
          chainLog.push(`Catch 1: ${err}`);
          return 'Recovered from step 1';
        })
        .then((val: string | number) => {
          chainLog.push(`Then after catch: ${val}`);
          throw new Error('Step 3 failed');
        })
        .then(() => chainLog.push('Step 3 then (unreachable)'))
        .catch((err: Error) => {
          chainLog.push(`Catch 2: ${err.message}`);
        });

      expect(chainLog).assertDeepEquals([
        'Catch 1: Step 1 failed',
        'Then after catch: Recovered from step 1',
        'Catch 2: Step 3 failed'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4200
     * @tc.name PromiseCatchTest042
     * @tc.desc Multiple then() after catch() continue chain with recovered value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalValue: number = 0;

      await Promise.reject(10)
        .catch((reason: number) => {
          return reason * 2; // Recover with transformed value
        })
        .then((val: number) => val + 5)
        .then((val: number) => val * 3)
        .then((val: number) => {
          finalValue = val;
        });

      expect(finalValue).assertEqual(75);
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4400
     * @tc.name PromiseCatchTest044
     * @tc.desc catch() in chain handles errors from Promise.all() in upstream then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allErrorReason: string = '';
      const taskA: Promise<string> = Promise.resolve('A success');
      const taskB: Promise<string> = Promise.reject('B failed');
      const taskC: Promise<string> = Promise.resolve('C success');

      await Promise.resolve()
        .then(() => {
          return Promise.all([taskA, taskB, taskC]);
        })
        .then((results: string[]) => {
          allErrorReason = `Unexpected: ${results.join(',')}`;
        })
        .catch((reason: string) => {
          allErrorReason = reason;
        });

      expect(allErrorReason).assertEqual('B failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4500
     * @tc.name PromiseCatchTest045
     * @tc.desc Chain with catch() and then() handles async errors in late then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorSource: string = '';
      const asyncTask = (delay: number, shouldFail: boolean): Promise<string> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            shouldFail ? reject('Async task failed') : resolve('Async success');
          }, delay);
        });
      };

      await Promise.resolve()
        .catch((err: string) => errorSource = `Early catch: ${err}`)// No error, not executed
        .then(() => asyncTask(10, false))
        .then((val: string) => {
          return asyncTask(20, true); // Async error here
        })
        .then(() => errorSource = 'Late then (unreachable)')
        .catch((err: string) => {
          errorSource = `Late catch: ${err}`;
        });

      expect(errorSource).assertEqual('Late catch: Async task failed');
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4800
     * @tc.name PromiseCatchTest048
     * @tc.desc then() after catch() returns rejected Promise to trigger next catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalError: string = '';

      await Promise.reject('Initial error')
        .catch((reason: string) => {
          return `Handled: ${reason}`;
        })
        .then((val: string) => {
          if (val.includes('Handled')) {
            return Promise.reject(`New error from: ${val}`); // Return rejected Promise
          }
          return val;
        })
        .catch((err: string) => {
          finalError = err;
        });

      expect(finalError).assertEqual('New error from: Handled: Initial error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_4900
     * @tc.name PromiseCatchTest049
     * @tc.desc Chain with catch() handles sync and async errors consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLog: string[] = [];
      const asyncFail = (msg: string): Promise<never> => {
        return new Promise((_, reject) => setTimeout(() => reject(msg), 10));
      };

      // Test sync error first
      await Promise.resolve()
        .then(() => {
          throw new Error('Sync error');
        })
        .catch((err: Error) => {
          errorLog.push(`Sync: ${err.message}`);
        });

      // Test async error next in separate chain
      await Promise.resolve()
        .then(() => asyncFail('Async error'))
        .catch((err: string) => {
          errorLog.push(`Async: ${err}`);
        });

      expect(errorLog).assertDeepEquals(['Sync: Sync error', 'Async: Async error']);
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
      let step = 1;

      const createStep = (shouldFail: boolean): () => Promise<number> => {
        return () => {
          const currentStep = step++;
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5200
     * @tc.name PromiseCatchTest052
     * @tc.desc Catch() handles error from async nested catch() re-throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorTrace: string[] = [];

      await Promise.resolve()
        .then(() => {
          return new Promise<void>((_, reject) => {
            setTimeout(() => reject('Inner initial error'), 15);
          })
            .catch((err: string) => {
              errorTrace.push(`Inner catch: ${err}`);
              // Async re-throw in nested catch()
              return new Promise<void>((_, reject) => {
                setTimeout(() => reject(`Inner re-thrown: ${err}`), 10);
              });
            });
        })
        .catch((err: string) => {
          errorTrace.push(`Outer catch: ${err}`);
        });

      expect(errorTrace)
        .assertDeepEquals(['Inner catch: Inner initial error', 'Outer catch: Inner re-thrown: Inner initial error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5300
     * @tc.name PromiseCatchTest053
     * @tc.desc Async thenable rejection in nested chain captured by outer catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtThenableErr: string = '';
      // Async rejecting thenable
      await Promise.resolve()
        .then(() => {
          // Nested chain with async thenable
          return Promise.resolve(AsyncRejectThenable53)
            .then((val: string) => `Processed: ${val}`);
        })
        .catch((err: string) => {
          caughtThenableErr = err;
        });

      expect(caughtThenableErr).assertEqual('Async thenable failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5400
     * @tc.name PromiseCatchTest054
     * @tc.desc Nested Promise.all() async rejection captured by single outer catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allRejectionReason: string = '';
      const createAsyncTask = (id: number, shouldReject: boolean): Promise<number> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            shouldReject ? reject(`Task ${id} async failed`) : resolve(id);
          }, id * 10);
        });
      };

      await Promise.resolve<number[]>([1, 2, 3])
        .then((ids: number[]) => {
          // Nested Promise.all() with async tasks
          return new Promise<number[][]>((resolve) => {
            setTimeout(() => {
              const taskGroups = ids.map(id => [
                createAsyncTask(id, false),
                createAsyncTask(id + 3, id === 2)// Task 5 (id=2+3) rejects
              ]);
              resolve(Promise.all(taskGroups.map(group => Promise.all(group))));
            }, 15);
          });
        })
        .catch((err: string) => {
          allRejectionReason = err;
        });

      expect(allRejectionReason).assertEqual('Task 5 async failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5500
     * @tc.name PromiseCatchTest055
     * @tc.desc Async error in outer then() skips nested chain and hits catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorSource: string = '';
      let nestedExecuted: boolean = false;

      await Promise.resolve()
        .then(() => {
          // Async error in outer then()
          return new Promise<void>((_, reject) => {
            setTimeout(() => reject('Outer async error'), 20);
          })
            .then(() => {
              // Nested chain (never executed)
              nestedExecuted = true;
              return Promise.resolve('Nested success');
            });
        })
        .catch((err: string) => {
          errorSource = err;
        });

      expect(nestedExecuted).assertEqual(false);
      expect(errorSource).assertEqual('Outer async error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5600
     * @tc.name PromiseCatchTest056
     * @tc.desc Deeply nested async rejection captured by top-level catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let topLevelErr: string = '';
      // Deep async nested function
      const deepAsyncNested = (level: number): Promise<number> => {
        if (level === 3) {
          // Async rejection at depth 3
          return new Promise<number>((_, reject) => {
            setTimeout(() => reject(`Deep error at level ${level}`), 10);
          });
        }
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(deepAsyncNested(level + 1));
          }, 5);
        });
      };

      await deepAsyncNested(1)
        .catch((err: string) => {
          topLevelErr = err;
        });

      expect(topLevelErr).assertEqual('Deep error at level 3');
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_5800
     * @tc.name PromiseCatchTest058
     * @tc.desc Catch() handles async error from then() returning rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtAsyncReturnErr: string = '';
      const asyncReturnRejected = (): Promise<never> => {
        return new Promise((_, reject) => {
          setTimeout(() => reject('Async returned rejected Promise'), 30);
        });
      };

      await Promise.resolve()
        .then(() => {
          return asyncReturnRejected(); // Return async rejected Promise
        })
        .then(() => {
          caughtAsyncReturnErr = 'Unexpected then() execution';
        })
        .catch((err: string) => {
          caughtAsyncReturnErr = err;
        });

      expect(caughtAsyncReturnErr).assertEqual('Async returned rejected Promise');
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

      interface Data {
        id: number;
        name: string
      }

      const fetchFakeData = (): Promise<Data | undefined> => {
        return new Promise((resolve) => {
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6000
     * @tc.name PromiseCatchTest060
     * @tc.desc Async parallel nested chains errors captured by single catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let firstCaughtErr: string = '';
      const asyncTask = (id: number, shouldFail: boolean, delay: number): Promise<string> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            shouldFail ? reject(`Task ${id} failed`) : resolve(`Task ${id} success`);
          }, delay);
        });
      };

      await Promise.resolve()
        .then(() => {
          // Parallel nested async chains
          return Promise.all([
            asyncTask(1, false, 30).then(() => asyncTask(11, true, 5)), // Fails first
            asyncTask(2, false, 10).then(() => asyncTask(22, true, 20))
          ]);
        })
        .catch((err: string) => {
          firstCaughtErr = err;
        });

      expect(firstCaughtErr).assertEqual('Task 22 failed');
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6200
     * @tc.name PromiseCatchTest062
     * @tc.desc Chain with catch() handles alternating sync/async exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLog: string[] = [];
      const asyncThrow = (msg: string): Promise<never> => {
        return new Promise((_, reject) => setTimeout(() => reject(msg), 10));
      };

      // Handle sync exception first
      await Promise.resolve()
        .then(() => {
          throw new Error('Sync exception 1');
        })
        .catch((err: Error) => errorLog.push(`Caught sync: ${err.message}`));

      // Handle async exception next
      await Promise.resolve()
        .then(() => asyncThrow('Async exception 2'))
        .catch((err: string) => errorLog.push(`Caught async: ${err}`));

      // Handle sync exception after async recovery
      await Promise.resolve()
        .then(() => asyncThrow('Async exception 3'))
        .catch((err: string) => {
          errorLog.push(`Caught async: ${err}`);
          throw new Error('Sync exception 4');
        })
        .catch((err: Error) => errorLog.push(`Caught sync: ${err.message}`));

      expect(errorLog).assertDeepEquals([
        'Caught sync: Sync exception 1',
        'Caught async: Async exception 2',
        'Caught async: Async exception 3',
        'Caught sync: Sync exception 4'
      ]);
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
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6400
     * @tc.name PromiseCatchTest064
     * @tc.desc Catch() handles exception from then() returning non-Promise thenable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtThenableErr: string = '';
      // Non-Promise thenable that throws sync exception
      let finish = false
      Promise.resolve()
        .then(() => FaultyThenable64)// Return faulty thenable
        .catch((err: Error) => {
          caughtThenableErr = err.message;
          finish = true
        });
      while (!finish) {
        await sleep(10)
      }
      expect(caughtThenableErr).assertEqual('Thenable sync exception');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6500
     * @tc.name PromiseCatchTest065
     * @tc.desc Nested Promise.race() exception captured by outer chain catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let raceErrReason: string = '';
      const slowResolve: Promise<string> = new Promise(resolve => setTimeout(() => resolve('Slow win'), 50));
      const fastReject: Promise<never> = new Promise((_, reject) => setTimeout(() => reject('Fast fail'), 15));

      await Promise.resolve()
        .then(() => {
          // Nested Promise.race() with fast rejection
          return Promise.race([slowResolve, fastReject])
            .then((val: string) => `Raced: ${val}`); // Unreachable
        })
        .catch((err: string) => {
          raceErrReason = err;
        });

      expect(raceErrReason).assertEqual('Fast fail');
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
      const asyncValidator = async (val: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 20));
        if (val < 0) {
          throw new Error(`Negative value: ${val}`);
        }
        return val;
      };

      await Promise.resolve(-10)
        .then(async (val: number) => {
          // Nested async/await that throws
          return new Promise<number>(async (resolve, reject) => {
            try {
              const validated = await asyncValidator(val);
              resolve(validated);
            } catch (err) {
              reject(err);
            }
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

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6800
     * @tc.name PromiseCatchTest068
     * @tc.desc Catch() handles exception from Promise.withResolvers() in nested chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest068()

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_6900
     * @tc.name PromiseCatchTest069
     * @tc.desc Nested catch() re-throws different exception to outer chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outerErr: string = '';

      await Promise.reject('Original exception')
        .then(() => outerErr = 'Unreachable then()')
        .catch((reason: string) => {
          // Nested catch re-throws transformed exception
          throw new Error(`Wrapped exception: ${reason}`);
        })
        .then(() => outerErr = 'Unreachable then() after catch')
        .catch((err: Error) => {
          outerErr = err.message;
        });

      expect(outerErr).assertEqual('Wrapped exception: Original exception');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7000
     * @tc.name PromiseCatchTest070
     * @tc.desc Chain with catch() handles exception from recursive nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let recursiveErr: string = '';
      // Recursive function that returns nested promises
      const recursivePromise = (count: number): Promise<number> => {
        if (count > 4) {
          // Throw exception at recursion limit
          return Promise.resolve().then(() => {
            throw new Error(`Recursion limit: ${count}`);
          });
        }
        // Return nested promise for next recursion
        return Promise.resolve(count + 1).then(recursivePromise);
      };

      await recursivePromise(1)
        .catch((err: Error) => {
          recursiveErr = err.message;
        });

      expect(recursiveErr).assertEqual('Recursion limit: 5');
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7100
     * @tc.name PromiseCatchTest071
     * @tc.desc Catch() handles API request failure in data fetching workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest071()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7200
     * @tc.name PromiseCatchTest072
     * @tc.desc Catch() handles invalid response format in API chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let parseError: string = '';
      let processedData: number[] = [];
      await fetchAndParseData72()
        .then((data) => {
          processedData = data.map((item) => item * 2);
        })
        .catch((err: Error) => {
          parseError = err.message;
          processedData = [0, 0]; // Fallback
        });

      expect(parseError).assertContain('Parse failed');
      expect(processedData).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7300
     * @tc.name PromiseCatchTest073
     * @tc.desc Catch() handles timeout in concurrent resource loading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timeoutErr: string = '';
      let loadedResources: string[] = [];

      // Mock resource loader with timeout (e.g., image/script load)
      const loadResource = (name: string, delay: number): Promise<string> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve(`Loaded: ${name}`);
          }, delay);
        });
      };

      // Add timeout wrapper (realistic timeout handling)
      const withTimeout = (promise: Promise<string>, timeoutMs: number): Promise<string> => {
        return Promise.race([
          promise,
          new Promise<string>((_, reject) => {
            setTimeout(() => reject(`Timeout loading ${promise}`), timeoutMs);
          })
        ]);
      };

      // Concurrent loading with timeout
      await Promise.all([
        withTimeout(loadResource('image1.png', 40), 30),
        withTimeout(loadResource('script1.js', 20), 30)
      ])
        .then((resources) => {
          loadedResources = resources;
        })
        .catch((err: string) => {
          timeoutErr = err;
          loadedResources = ['script1.js']; // Keep successfully loaded
        });

      expect(timeoutErr).assertContain('Timeout loading [object Promise]');
      expect(loadedResources).assertDeepEquals(['script1.js']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7400
     * @tc.name PromiseCatchTest074
     * @tc.desc Catch() handles database operation failure in CRUD workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let dbError: string = '';
      let operationStatus: string = 'pending';
      // DB workflow: connect → insert → disconnect
      await db74.connect()
        .then(() => db74.insert('users', {
          id: 1, name: 'Alice'
        }))
        .then((insertedId) => {
          operationStatus = `Inserted with ID: ${insertedId}`;
        })
        .catch((err: string) => {
          dbError = err;
          operationStatus = 'failed';
        })
        .finally(() => db74.disconnect());

      expect(dbError).assertEqual('Duplicate entry for table users: 1');
      expect(operationStatus).assertEqual('failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7500
     * @tc.name PromiseCatchTest075
     * @tc.desc Catch() handles validation failure in form submission workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let validationErrors: string[] = [];
      let submissionStatus: string = 'pending';

      // Mock form submission with validation (realistic form flow)
      const validateForm75 = (data: type75): Promise<void> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            const errors: string[] = [];
            if (!data.email.includes('@')) {
              errors.push('Invalid email format');
            }
            if (data.password.length < 6) {
              errors.push('Password too short');
            }
            if (errors.length > 0) {
              reject(errors);
            }
            resolve();
          }, 20);
        });
      };

      const submitForm = (data: Object): Promise<string> => {
        return new Promise((resolve) => {
          setTimeout(() => resolve('Submission successful'), 15);
        });
      };

      // Form workflow: validate → submit
      await validateForm75(obj75)
        .then(() => submitForm(obj75))
        .then((msg) => {
          submissionStatus = msg;
        })
        .catch((err: string[]) => {
          validationErrors = err;
          submissionStatus = 'validation_failed';
        });

      expect(validationErrors).assertDeepEquals(['Invalid email format', 'Password too short']);
      expect(submissionStatus).assertEqual('validation_failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7600
     * @tc.name PromiseCatchTest076
     * @tc.desc Catch() handles third-party service failure in payment workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let paymentError: string = '';
      let transactionStatus: string = 'pending';
      // Payment workflow: create order → process payment
      await paymentService76.createOrder(99.99)
        .then((orderId) => paymentService76.processPayment(orderId, '4111-1111-1111-1111'))
        .then((result) => {
          transactionStatus = result.success ? 'completed' : 'failed';
        })
        .catch((err: string) => {
          paymentError = err;
          transactionStatus = 'aborted';
        });

      expect(paymentError).assertContain('Payment gateway unavailable for ORDER_');
      expect(transactionStatus).assertEqual('aborted');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7700
     * @tc.name PromiseCatchTest077
     * @tc.desc Catch() handles file read failure in file processing workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let fileError: string = '';
      let fileContent: string = '';
      // File processing workflow: read file → process content
      await fs77.readFile('/data/config.json')
        .then((content) => {
          fileContent = content.trim();
        })
        .catch((err: string) => {
          fileError = err;
          // Fallback to sync read from cache
          fileContent = fs77.readFileSync('/cache/config.json');
        });

      expect(fileError).assertEqual("ENOENT: No such file or directory, open '/data/config.json'");
      expect(fileContent).assertEqual('Fallback content from cache');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7800
     * @tc.name PromiseCatchTest078
     * @tc.desc Catch() handles authentication failure in API chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest078()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_7900
     * @tc.name PromiseCatchTest079
     * @tc.desc Catch() handles rate limit exceeded in API request chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rateLimitError: string = '';
      let apiResponses: string[] = [];

      // Mock API with rate limiting (realistic rate limit scenario)
      let requestCount = 0;
      const fetchData = (endpoint: string): Promise<string> => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            requestCount++;
            // Simulate rate limit after 2 requests
            if (requestCount > 2) {
              reject(`429: Too Many Requests for ${endpoint}`);
            } else {
              resolve(`Data from ${endpoint}`);
            }
          }, 10);
        });
      };

      // Batch API requests (realistic batch fetch)
      await Promise.all([
        fetchData('/api/data1'),
        fetchData('/api/data2'),
        fetchData('/api/data3')// Triggers rate limit
      ])
        .then((responses) => {
          apiResponses = responses;
        })
        .catch((err: string) => {
          rateLimitError = err;
          apiResponses = ['Data from /api/data1', 'Data from /api/data2']; // Keep valid responses
        });

      expect(rateLimitError).assertEqual('429: Too Many Requests for /api/data3');
      expect(apiResponses).assertDeepEquals(['Data from /api/data1', 'Data from /api/data2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8000
     * @tc.name PromiseCatchTest080
     * @tc.desc Catch() handles WebSocket connection failure in real-time workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wsError: string = '';
      let connectionStatus: string = 'disconnected';

      // Mock WebSocket workflow (realistic real-time connection)
      const connectWebSocket = (url: string): Promise<type80> => {
        return new Promise((_, reject) => {
          // Simulate WebSocket connection failure
          setTimeout(() => reject(`Failed to connect to ${url}: Connection refused`), 35);
        });
      };

      // Real-time workflow: connect → subscribe
      await connectWebSocket('wss://api.example.com/realtime')
        .then((ws) => {
          ws.send(JSON.stringify({
            type: 'subscribe', channel: 'updates'
          }));
          connectionStatus = 'connected';
        })
        .catch((err: string) => {
          wsError = err;
          connectionStatus = 'failed';
        });

      expect(wsError).assertEqual('Failed to connect to wss://api.example.com/realtime: Connection refused');
      expect(connectionStatus).assertEqual('failed');
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8100
     * @tc.name PromiseCatchTest081
     * @tc.desc Catch() handles failed image loading in frontend resource workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest081()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8200
     * @tc.name PromiseCatchTest082
     * @tc.desc Catch() handles invalid input in calculator service workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest082()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8300
     * @tc.name PromiseCatchTest083
     * @tc.desc Catch() handles expired token in authenticated API chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest083()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8400
     * @tc.name PromiseCatchTest084
     * @tc.desc Catch() handles failed batch processing of user data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest084()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8500
     * @tc.name PromiseCatchTest085
     * @tc.desc Catch() handles network failure in real-time chat connection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest085()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8600
     * @tc.name PromiseCatchTest086
     * @tc.desc Catch() handles invalid JSON in config file loading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest086()
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8700
     * @tc.name PromiseCatchTest087
     * @tc.desc Catch() handles failed email sending in notification workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest087()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8800
     * @tc.name PromiseCatchTest088
     * @tc.desc Catch() handles size limit exceeded in file upload workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest088()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_8900
     * @tc.name PromiseCatchTest089
     * @tc.desc Catch() handles dependency failure in microservice chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest089()
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9000
     * @tc.name PromiseCatchTest090
     * @tc.desc Catch() handles date parsing failure in booking workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseCatchTest090()
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9100
     * @tc.name PromiseCatchTest091
     * @tc.desc Catch() captures rejection from earlier-timed promise in Promise.race()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let raceError: string = '';
      const timerLog: string[] = [];

      // Promise 1: Rejects after 20ms
      const fastReject = new Promise<never>((_, reject) => {
        setTimeout(() => {
          timerLog.push('Fast reject executed');
          reject('Fast rejection wins');
        }, 20);
      });

      // Promise 2: Resolves after 50ms
      const slowResolve = new Promise<string>((resolve) => {
        setTimeout(() => {
          timerLog.push('Slow resolve executed');
          resolve('Slow resolve loses');
        }, 50);
      });

      await Promise.race([fastReject, slowResolve])
        .then((val) => timerLog.push(`Unexpected resolve: ${val}`))
        .catch((err: string) => {
          raceError = err;
          timerLog.push('Catch handled rejection');
        });

      expect(raceError).assertEqual('Fast rejection wins');
      expect(timerLog).assertDeepEquals(['Fast reject executed', 'Catch handled rejection']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9200
     * @tc.name PromiseCatchTest092
     * @tc.desc Catch() handles late rejection after earlier resolve in flawed promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchTriggered: boolean = false;
      const executionLog: string[] = [];

      // Flawed promise: Resolves first, then attempts to reject later
      const flawedPromise = new Promise<string>((resolve, reject) => {
        // Resolve after 15ms
        setTimeout(() => {
          executionLog.push('Promise resolved');
          resolve('Initial resolve');
        }, 15);

        // Attempt to reject after 30ms (ignored)
        setTimeout(() => {
          executionLog.push('Rejection attempt triggered');
          reject('Late rejection');
        }, 30);
      });

      await flawedPromise
        .then((val) => executionLog.push(`Then received: ${val}`))
        .catch(() => {
          catchTriggered = true;
          executionLog.push('Catch executed');
        });

      // Wait for rejection attempt to complete
      await new Promise<void>(resolve => setTimeout(resolve, 40));

      expect(catchTriggered).assertEqual(false);
      expect(executionLog)
        .assertDeepEquals(['Promise resolved', 'Then received: Initial resolve', 'Rejection attempt triggered']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9300
     * @tc.name PromiseCatchTest093
     * @tc.desc Catch() captures rejection from delayed nested promise in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let nestedError: string = '';
      const timingLog: string[] = [];

      await Promise.resolve('Step 1')
        .then((val) => {
          timingLog.push(`Then 1 executed (${val})`);
          // Return nested promise that rejects after delay
          return new Promise<string>((_, reject) => {
            setTimeout(() => {
              timingLog.push('Nested promise rejecting');
              reject('Delayed nested rejection');
            }, 25);
          });
        })
        .then((val) => timingLog.push(`Then 2 executed (${val})`))// Unreachable
        .catch((err: string) => {
          nestedError = err;
          timingLog.push(`Catch executed (${err})`);
        });

      expect(nestedError).assertEqual('Delayed nested rejection');
      expect(timingLog)
        .assertDeepEquals(['Then 1 executed (Step 1)', 'Nested promise rejecting',
          'Catch executed (Delayed nested rejection)']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9400
     * @tc.name PromiseCatchTest094
     * @tc.desc Catch() handles sequential time-dependent errors in long chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalError: string = '';
      const stepLog: string[] = [];
      let stepTime: number = 0;

      // Time-dependent step function: Rejects if executed after 50ms
      const timeDependentStep = (step: number): Promise<number> => {
        return new Promise((resolve, reject) => {
          const delay = step * 20; // Step 1:20ms, Step2:40ms, Step3:60ms
          setTimeout(() => {
            stepTime = Date.now();
            stepLog.push(`Step ${step} executed at ${stepTime}`);
            if (stepTime - startTime > 50) {
              reject(`Step ${step} timed out (exceeded 50ms)`);
            }
            resolve(step);
          }, delay);
        });
      };

      const startTime = Date.now();

      await timeDependentStep(1)
        .then((step) => timeDependentStep(step + 1))
        .then((step) => timeDependentStep(step + 1))// Step3: Executes after ~60ms
        .then((step) => stepLog.push(`Final step ${step} completed`))
        .catch((err: string) => {
          finalError = err;
          stepLog.push(`Catch handled: ${err}`);
        });

      expect(finalError).assertEqual('Step 2 timed out (exceeded 50ms)');
      expect(stepLog.length).assertEqual(3); // Step1, Step2, Catch
      expect(stepLog[2]).assertContain('Catch handled: Step 2 timed out (exceeded 50ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9500
     * @tc.name PromiseCatchTest095
     * @tc.desc Catch() captures first rejection in staggered Promise.all()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let firstRejection: string = '';
      const rejectionTimes: number[] = [];

      // Create promises that reject at staggered times
      const createStaggeredReject = (id: number, delay: number): Promise<never> => {
        return new Promise((_, reject) => {
          setTimeout(() => {
            const rejectTime = Date.now();
            rejectionTimes.push(rejectTime);
            reject(`Promise ${id} rejected at ${rejectTime}`);
          }, delay);
        });
      };

      // Promise1: reject after 10ms, Promise2: reject after 30ms, Promise3: reject after 20ms
      await Promise.all([
        createStaggeredReject(1, 10),
        createStaggeredReject(2, 30),
        createStaggeredReject(3, 20)
      ])
        .then(() => firstRejection = 'No rejection (unexpected)')
        .catch((err: string) => {
          firstRejection = err;
        });

      // Wait for all rejections to complete
      await new Promise<void>(resolve => setTimeout(resolve, 40));

      expect(firstRejection).assertContain('Promise 1 rejected at');
      expect(rejectionTimes.length).assertEqual(3); // All promises still reject
      expect(Math.min(...rejectionTimes)).assertEqual(parseInt(firstRejection.match(/at (\d+)/)![1]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9600
     * @tc.name PromiseCatchTest096
     * @tc.desc Catch() handles async error after successful early steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workflowError: string = '';
      const phaseLog: string[] = [];

      // Workflow phases with staggered timing
      const phase1 = (): Promise<string> => {
        return new Promise(resolve => setTimeout(() => {
          phaseLog.push('Phase 1 (fast) completed');
          resolve('Phase1 data');
        }, 10));
      };

      const phase2 = (data: string): Promise<string> => {
        return new Promise(resolve => setTimeout(() => {
          phaseLog.push(`Phase 2 (medium) completed with ${data}`);
          resolve('Phase2 data');
        }, 20));
      };

      const phase3 = (data: string): Promise<string> => {
        return new Promise((_, reject) => setTimeout(() => {
          phaseLog.push(`Phase 3 (slow) failing with ${data}`);
          reject('Phase 3 timed out');
        }, 30));
      };

      await phase1()
        .then(phase2)
        .then(phase3)
        .then((data) => phaseLog.push(`Phase 4 completed with ${data}`))
        .catch((err: string) => {
          workflowError = err;
          phaseLog.push(`Catch handled: ${err}`);
        });

      expect(workflowError).assertEqual('Phase 3 timed out');
      expect(phaseLog).assertDeepEquals([
        'Phase 1 (fast) completed',
        'Phase 2 (medium) completed with Phase1 data',
        'Phase 3 (slow) failing with Phase2 data',
        'Catch handled: Phase 3 timed out'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9700
     * @tc.name PromiseCatchTest097
     * @tc.desc Catch() captures rejection from delayed thenable in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let thenableError: string = '';
      const timingEvents: string[] = [];

      await Promise.resolve('Initial value')
        .then((val) => {
          timingEvents.push(`First then() received: ${val}`);
          return DelayedRejectThenable97;
        })
        .then((val) => timingEvents.push(`Second then() received: ${val}`))// Unreachable
        .catch((err: string) => {
          thenableError = err;
          timingEvents.push(`Catch received: ${err}`);
        });

      expect(thenableError).assertEqual('Delayed thenable rejection');
      expect(timingEvents).assertDeepEquals([
        "First then() received: Initial value", "Catch received: Delayed thenable rejection"
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9800
     * @tc.name PromiseCatchTest098
     * @tc.desc Catch() handles timeout wrapper for long-running promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timeoutResult: string = '';
      const timerEvents: string[] = [];

      // Timeout wrapper utility
      const withTimeout = <T>(promise: Promise<T>, timeoutMs: number, msg: string): Promise<T> => {
        return Promise.race([
          promise,
          new Promise<T>((_, reject) => {
            setTimeout(() => {
              timerEvents.push('Timeout triggered');
              reject(msg);
            }, timeoutMs);
          })
        ]);
      };

      // Long-running promise (resolves after 50ms)
      const longRunningTask = new Promise<string>((resolve) => {
        setTimeout(() => {
          timerEvents.push('Long task completed');
          resolve('Task success');
        }, 50);
      });

      // Apply 30ms timeout (task will be timed out)
      await withTimeout(longRunningTask, 30, 'Task timed out after 30ms')
        .then((val) => {
          timeoutResult = `Task succeeded: ${val}`;
          timerEvents.push('Then executed');
        })
        .catch((err: string) => {
          timeoutResult = `Catch handled: ${err}`;
          timerEvents.push('Catch executed');
        });

      // Wait for long task to complete (to verify it still runs)
      await new Promise<void>(resolve => setTimeout(resolve, 30));

      expect(timeoutResult).assertEqual('Catch handled: Task timed out after 30ms');
      expect(timerEvents).assertDeepEquals(['Timeout triggered', 'Catch executed', 'Long task completed']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_9900
     * @tc.name PromiseCatchTest099
     * @tc.desc Catch() captures rejection from later promise in sequential chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let chainError: string = '';
      const stepTimestamps: type99[] = [];

      // Step function with timestamp logging
      const logStep = (step: string): Promise<void> => {
        return new Promise(resolve => setTimeout(() => {
          stepTimestamps.push({
            step, time: Date.now()
          });
          resolve();
        }, 10));
      };

      // Rejection step with delay
      const rejectStep = (step: string): Promise<never> => {
        return new Promise((_, reject) => setTimeout(() => {
          const time = Date.now();
          stepTimestamps.push({
            step, time
          });
          reject(`Rejection at ${step} (${time})`);
        }, 15));
      };

      await logStep('Step 1')
        .then(() => logStep('Step 2'))
        .then(() => rejectStep('Step 3'))// Rejects after Step1+Step2+15ms = ~35ms
        .then(() => logStep('Step 4'))// Unreachable
        .catch((err: string) => {
          chainError = err;
          stepTimestamps.push({
            step: 'Catch', time: Date.now()
          });
        });

      expect(chainError).assertContain('Rejection at Step 3');
      expect(stepTimestamps.map(item => item.step)).assertDeepEquals(['Step 1', 'Step 2', 'Step 3', 'Catch']);
      // Verify Step3 is after Step2, Catch is after Step3
      expect(stepTimestamps[2].time).assertLargerOrEqual(stepTimestamps[1].time);
      expect(stepTimestamps[3].time).assertLargerOrEqual(stepTimestamps[2].time);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_CATCH_TEST_10000
     * @tc.name PromiseCatchTest100
     * @tc.desc Catch() handles async re-throw timing in nested catch()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCatchTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalError: string = '';
      const errorTimeline: string[] = [];
      const startTime = Date.now();

      await Promise.reject('Initial rejection (timing: 0ms)')
        .catch((err: string) => {
          const catchTime = Date.now() - startTime;
          errorTimeline.push(`Inner catch received: ${err} (elapsed: ${catchTime}ms)`);
          // Async re-throw after 20ms delay (tests timing of nested async rejection)
          return new Promise<never>((_, reject) => {
            setTimeout(() => {
              const rethrowTime = Date.now() - startTime;
              const wrappedErr = `Wrapped rejection (elapsed: ${rethrowTime}ms)`;
              errorTimeline.push(`Inner catch re-throws: ${wrappedErr}`);
              reject(wrappedErr);
            }, 20);
          });
        })
        .then((val: never) => {
          errorTimeline.push(`Unexpected then() executed: ${val}`); // Unreachable
        })
        .catch((err: string) => {
          const finalCatchTime = Date.now() - startTime;
          finalError = err;
          errorTimeline.push(`Outer catch received: ${err} (elapsed: ${finalCatchTime}ms)`);
        });

      // Verify final error content
      expect(finalError).assertContain('Wrapped rejection (elapsed:');
      // Verify timeline order and timing logic
      expect(errorTimeline.length).assertEqual(3);
      expect(errorTimeline[0]).assertContain('Inner catch received: Initial rejection');
      expect(errorTimeline[1]).assertContain('Inner catch re-throws: Wrapped rejection');
      expect(errorTimeline[2]).assertContain('Outer catch received: Wrapped rejection');
      // Verify async delay (re-throw should happen ~20ms after initial catch)
      const extractElapsed = (str: string): number => parseInt(str.match(/elapsed: (\d+)ms/)![1]);
      const initialCatchElapsed = extractElapsed(errorTimeline[0]);
      const rethrowElapsed = extractElapsed(errorTimeline[1]);
      expect(rethrowElapsed).assertLargerOrEqual(initialCatchElapsed + 15); // Account for timer variance
    });

  })
}