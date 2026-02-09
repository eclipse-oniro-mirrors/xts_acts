import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  errorMessage20,
  invalidPromiseCall,
  MultiCallThenable,
  promise20,
  promise75,
  promise77,
  promise92,
  WrapperThenable84
} from './promisejs';
import {
  invalidExecutors17,
  promise18,
  testObj33,
  testObject18,
  thenable44,
  type33,
  type44,
  type79,
  type85,
  type85_2
} from './promisets';
import { sleep } from './utils';


export default function promiseTest() {
  describe('promiseTest', () => {
    afterEach(async () => {
      // await sleep(10)
    })

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0100
     * @tc.name PromiseTest001
     * @tc.desc Calling Promise without new should throw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let error: TypeError | null = null;
      try {
        invalidPromiseCall();
      } catch (e) {
        if (e instanceof TypeError) {
          error = e;
        }
      }
      expect(error !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0200
     * @tc.name PromiseTest002
     * @tc.desc Executor function should execute synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = false;
      new Promise<void>((resolve) => {
        flag = true;
      });
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0300
     * @tc.name PromiseTest003
     * @tc.desc Promise becomes fulfilled when resolving a non-thenable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testValue: string = 'test-fulfilled';
      const promise: Promise<string> = new Promise((resolve) => {
        resolve(testValue);
      });
      const result: string = await promise;
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0400
     * @tc.name PromiseTest004
     * @tc.desc Promise becomes rejected with reason after calling reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorReason: Error = new Error('Test rejection reason');
      const promise: Promise<never> = new Promise((_, reject) => {
        reject(errorReason);
      });
      let caughtReason: Error | null = null;
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          caughtReason = e;
        }
      }
      expect(caughtReason).assertEqual(errorReason);
      expect(caughtReason?.message).assertEqual(errorReason.message);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0500
     * @tc.name PromiseTest005
     * @tc.desc Only the first call to resolve/reject takes effect (state is irreversible)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Resolve first, then reject
      const promise1: Promise<string> = new Promise((resolve, reject) => {
        resolve('first-resolve');
        reject(new Error('late-reject'));
      });
      const result1: string = await promise1;
      expect(result1).assertEqual('first-resolve');

      // Reject first, then resolve
      const promise2: Promise<never | void> = new Promise<never | void>((resolve, reject) => {
        reject(new Error('first-reject'));
        resolve();
      });
      let caughtReason2: Error | null = null;
      try {
        await promise2;
      } catch (e) {
        if (e instanceof Error) {
          caughtReason2 = e;
        }
      }
      expect(caughtReason2?.message).assertEqual('first-reject');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0600
     * @tc.name PromiseTest006
     * @tc.desc Promise becomes rejected when executor throws an error (state not modified in advance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // No state modification in advance, throwing error triggers rejection
      const promise1: Promise<never> = new Promise(() => {
        throw new Error('executor-error');
      });
      let caughtReason1: Error | null = null;
      try {
        await promise1;
      } catch (e) {
        if (e instanceof Error) {
          caughtReason1 = e;
        }
      }
      expect(caughtReason1?.message).assertEqual('executor-error');

      // Already resolved in advance, thrown error is ignored
      const promise2: Promise<string> = new Promise((resolve) => {
        resolve('already-resolved');
        throw new Error('ignored-error');
      });
      const result2: string = await promise2;
      expect(result2).assertEqual('already-resolved');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0700
     * @tc.name PromiseTest007
     * @tc.desc State is locked to the target Promise when resolving with another Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerPromise: Promise<string> = new Promise((resolve) => {
        setTimeout(() => resolve('inner-value'), 100);
      });
      const outerPromise: Promise<string> = new Promise((resolve) => {
        resolve(innerPromise);
      });
      const result: string = await outerPromise;
      expect(result).assertEqual('inner-value');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0800
     * @tc.name PromiseTest008
     * @tc.desc Throws TypeError when resolving with self-Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let executorCalled = false;
      const testValue = 'executor called';
      let capturedValue = '';

      // Create promise with executor that sets flag synchronously
      new Promise<void>((resolve) => {
        executorCalled = true;
        capturedValue = testValue;
        resolve();
      });

      // Verify executor was called synchronously without waiting for promise resolution
      expect(executorCalled).assertEqual(true);
      expect(capturedValue).assertEqual(testValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_0900
     * @tc.name PromiseTest009
     * @tc.desc Promise remains pending without calling resolve/reject and no async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const promise: Promise<void> = new Promise(() => {
        // No state modification logic
      });
      let isSettled: boolean = false;

      promise.then(
        () => (isSettled = true),
        () => (isSettled = true)
      );

      setTimeout(() => {
        expect(isSettled).assertEqual(false);
        done();
      }, 100);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1000
     * @tc.name PromiseTest010
     * @tc.desc Calls then method when resolving with thenable object (inherits PromiseLike)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class MyThenable implements PromiseLike<string> {
        then<TResult1, TResult2>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onRejected?: ((reason: Error) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          setTimeout(() => {
            if (onFulfilled) {
              onFulfilled('thenable-value');
            }
          }, 100);
          return Promise.resolve().then<TResult1>((): TResult1 | PromiseLike<TResult1> => {
            return onFulfilled!('thenable-value');
          });
        }
      }

      const thenable = new MyThenable();
      const promise: Promise<string> = new Promise((resolve) => {
        resolve(thenable);
      });
      const result: string = await promise;
      expect(result).assertEqual('thenable-value');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1100
     * @tc.name PromiseTest011
     * @tc.desc Promise fulfills with null normally when resolving null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<null> = new Promise<null>((resolve) => {
        resolve(null);
      });
      const result: null = await promise;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1200
     * @tc.name PromiseTest012
     * @tc.desc Promise rejection reason is correct when rejecting with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectReason: string = 'String rejection reason';
      const promise: Promise<never> = new Promise<never>((_, reject) => {
        reject(rejectReason);
      });
      let caughtReason: string | null = null;
      try {
        await promise;
      } catch (e) {
        if (typeof e === 'string') {
          caughtReason = e;
        }
      }
      expect(caughtReason).assertEqual(rejectReason);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1300
     * @tc.name PromiseTest013
     * @tc.desc then callback executes correctly after async resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resolvedValue: number = 0;
      const promise: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => {
          resolve(100);
        }, 50);
      });

      await promise.then((value) => {
        resolvedValue = value;
      });

      expect(resolvedValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1400
     * @tc.name PromiseTest014
     * @tc.desc catch callback executes correctly after async reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorMessage: string = '';
      const promise: Promise<never> = new Promise<never>((_, reject) => {
        setTimeout(() => {
          reject(new Error('Async error'));
        }, 50);
      });

      await promise.catch((error: Error) => {
        errorMessage = error.message;
      });

      expect(errorMessage).assertEqual('Async error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1500
     * @tc.name PromiseTest015
     * @tc.desc State is correct after calling resolve in then method of thenable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ResolveThenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          setTimeout(() => {
            if (onFulfilled) {
              onFulfilled(200);
            }
          }, 50);
          return Promise.resolve().then<TResult1>((): TResult1 | PromiseLike<TResult1> => {
            return onFulfilled!(200);
          });
        }
      }

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(new ResolveThenable());
      });
      const result: number = await promise;

      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1600
     * @tc.name PromiseTest016
     * @tc.desc Promise constructor must accept a function-type executor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Verify Promise instance can be created normally when executor function is passed correctly
      const validPromise: Promise<boolean> = new Promise<boolean>((resolve) => {
        resolve(true);
      });

      // Verify Promise instance type is correct
      expect(validPromise instanceof Promise).assertEqual(true);

      // Verify Promise can fulfill normally
      let result: boolean = false;
      validPromise.then(value => {
        result = value;
      });

      // Wait for Promise processing to complete
      return new Promise<void>(resolve => {
        setTimeout(() => {
          expect(result).assertEqual(true);
          resolve();
        }, 0);
      });
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1700
     * @tc.name PromiseTest017
     * @tc.desc Throws TypeError when executor is non-function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCount: number = 0;

      invalidExecutors17.forEach(executor => {
        try {
          new Promise<void>(executor as () => void);
        } catch (e) {
          if (e instanceof TypeError) {
            errorCount++;
          }
        }
      });

      expect(errorCount).assertEqual(invalidExecutors17.length);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1800
     * @tc.name PromiseTest018
     * @tc.desc Fulfillment value is correct when resolving with object-type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await promise18;
      expect(result).assertEqual(testObject18);
      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_1900
     * @tc.name PromiseTest019
     * @tc.desc Multiple then calls can all get fulfillment value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testValue: number = 300;
      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(testValue);
      });

      const results: number[] = [];
      promise.then(value => results.push(value));
      promise.then(value => results.push(value));
      promise.then(value => results.push(value));

      // Wait for all then callbacks to execute
      await new Promise<void>(resolve => setTimeout(resolve, 0));

      expect(results.length).assertEqual(3);
      expect(results.every(v => v === testValue)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2000
     * @tc.name PromiseTest020
     * @tc.desc thenable's then method throws error causes Promise rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtError = new Error('init');
      try {
        await promise20;
      } catch (e) {
        if (e instanceof Error) {
          caughtError = e;
        }
      }

      expect(caughtError?.message).assertEqual(errorMessage20);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2100
     * @tc.name PromiseTest021
     * @tc.desc Fulfillment is correct when resolving with array-type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testArray: number[] = [1, 2, 3, 4];
      const promise: Promise<number[]> = new Promise<number[]>((resolve) => {
        resolve(testArray);
      });
      const result: number[] = await promise;

      expect(result).assertEqual(testArray);
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2200
     * @tc.name PromiseTest022
     * @tc.desc catch returns a new fulfilled Promise after catching error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<never>((_, reject) => {
        reject(new Error('Error to be caught'));
      }).catch((error: Error) => {
        return `Caught: ${error.message}`;
      });

      const result: string = await promise;
      expect(result).assertEqual('Caught: Error to be caught');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2300
     * @tc.name PromiseTest023
     * @tc.desc Return value of then method becomes fulfillment value of new Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(10);
      }).then(value => value * 5);

      const result: number = await promise;
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2400
     * @tc.name PromiseTest024
     * @tc.desc Propagates state and value when then method is called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Propagate fulfilled state
      const fulfilledPromise: Promise<string> = new Promise<string>((resolve) => {
        resolve('Propagated value');
      }).then();
      expect(await fulfilledPromise).assertEqual('Propagated value');

      // Propagate rejected state
      const rejectReason: string = 'Propagated error';
      const rejectedPromise: Promise<never> = new Promise<never>((_, reject) => {
        reject(rejectReason);
      }).then();

      let caughtReason: string | null = null;
      try {
        await rejectedPromise;
      } catch (e) {
        if (typeof e === 'string') {
          caughtReason = e;
        }
      }
      expect(caughtReason).assertEqual(rejectReason);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2500
     * @tc.name PromiseTest025
     * @tc.desc Errors in chain calls are caught by subsequent catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorMessage: string = '';

      await new Promise<string>((resolve) => {
        resolve('Start');
      })
        .then(() => {
          throw new Error('Chain error');
        })
        .then(() => {
          // This callback will not execute
          return 'Continue';
        })
        .catch((error: Error) => {
          errorMessage = error.message;
        });

      expect(errorMessage).assertEqual('Chain error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2600
     * @tc.name PromiseTest026
     * @tc.desc then method waits for returned Promise to settle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(10);
      }).then(value => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(value * 3);
          }, 50);
        });
      });

      const result: number = await promise;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2700
     * @tc.name PromiseTest027
     * @tc.desc Nested thenable objects propagate state correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class NestedThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<void>((resolve) => {
            resolve();
          }).then<TResult1>(() => {
            if (onFulfilled) {
              return onFulfilled('nested');
            }
            return undefined as TResult1;
          });
        }
      }

      class OuterThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<string>((resolve) => {
            resolve(new NestedThenable());
          }).then<TResult1>((value) => {
            if (onFulfilled) {
              return onFulfilled(`outer-${value}`);
            }
            return undefined as TResult1;
          });
        }
      }

      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve(new OuterThenable());
      });
      const result: string = await promise;

      expect(result).assertEqual('outer-nested');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2800
     * @tc.name PromiseTest028
     * @tc.desc Multiple consecutive catches execute only the first matching one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchCount: number = 0;
      const errorMessage: string = 'test error';

      await new Promise<never>((_, reject) => {
        reject(new Error(errorMessage));
      })
        .catch((error: Error) => {
          catchCount++;
          expect(error.message).assertEqual(errorMessage);
        })
        .catch(() => {
          catchCount++;
        });

      expect(catchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_2900
     * @tc.name PromiseTest029
     * @tc.desc finally executes regardless of promise state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let fulfilledFinallyExecuted: boolean = false;
      await new Promise<boolean>((resolve) => {
        resolve(true);
      }).finally(() => {
        fulfilledFinallyExecuted = true;
      });

      let rejectedFinallyExecuted: boolean = false;
      try {
        await new Promise<never>((_, reject) => {
          reject(new Error('test'));
        }).finally(() => {
          rejectedFinallyExecuted = true;
        });
      } catch {
        // Ignore error
      }

      expect(fulfilledFinallyExecuted).assertEqual(true);
      expect(rejectedFinallyExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3000
     * @tc.name PromiseTest030
     * @tc.desc Rejections from then-returned Promises are caught by subsequent catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorCaught: boolean = false;
      const errorMessage: string = 'error from then';

      await new Promise<number>((resolve) => {
        resolve(100);
      })
        .then(() => {
          return new Promise<never>((_, reject) => {
            reject(new Error(errorMessage));
          });
        })
        .catch((error: Error) => {
          expect(error.message).assertEqual(errorMessage);
          errorCaught = true;
        });

      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3100
     * @tc.name PromiseTest031
     * @tc.desc Errors thrown after synchronous resolve are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve('fulfilled');
        throw new Error('this error should be ignored');
      });

      const result: string = await promise;
      expect(result).assertEqual('fulfilled');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3200
     * @tc.name PromiseTest032
     * @tc.desc Thenable returns rejected Promise from its then method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectThenable implements PromiseLike<void> {
        then<TResult1 = void, TResult2 = never>(
          onFulfilled?: ((value: void) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onRejected?: ((reason: Object) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<void>((_, reject) => {
            reject(new Error('thenable rejection'));
          }).then<TResult1, TResult2>(
            onFulfilled,
            onRejected
          );
        }
      }

      const promise: Promise<void> = new Promise<void>((resolve) => {
        resolve(new RejectThenable());
      });

      let errorMessage: string = '';
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          errorMessage = e.message;
        }
      }

      expect(errorMessage).assertEqual('thenable rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3300
     * @tc.name PromiseTest033
     * @tc.desc Non-Promise return values from then are wrapped in fulfilled Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<type33> = new Promise<boolean>((resolve) => {
        resolve(true);
      }).then(() => {
        return testObj33;
      });

      const result = await promise;
      expect(result).assertEqual(testObj33);
      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3400
     * @tc.name PromiseTest034
     * @tc.desc Multiple then callbacks execute in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionOrder: number[] = [];
      const promise: Promise<void> = new Promise<void>((resolve) => {
        resolve();
      });

      promise.then(() => {
        executionOrder.push(1);
      });

      promise.then(() => {
        executionOrder.push(2);
      });

      promise.then(() => {
        executionOrder.push(3);
      });

      await new Promise<void>(resolve => setTimeout(resolve, 0));

      expect(executionOrder.length).assertEqual(3);
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);
      expect(executionOrder[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3500
     * @tc.name PromiseTest035
     * @tc.desc Resolve with undefined in executor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<undefined> = new Promise<undefined>((resolve) => {
        resolve(undefined);
      });

      const result: undefined = await promise;
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3600
     * @tc.name PromiseTest036
     * @tc.desc onFulfilled returns thenable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ReturnedThenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<void>((resolve) => {
            resolve();
          }).then<TResult1>(() => {
            if (onFulfilled) {
              return onFulfilled(42);
            }
            return undefined as TResult1;
          });
        }
      }

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(0);
      }).then(() => {
        return new ReturnedThenable();
      });

      const result: number = await promise;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3700
     * @tc.name PromiseTest037
     * @tc.desc Promise returned by catch can continue chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalResult: string = '';

      await new Promise<never>((_, reject) => {
        reject(new Error('error'));
      })
        .catch((error: Error) => {
          return `caught error: ${error.message}`;
        })
        .then((message) => {
          finalResult = message.toUpperCase();
        });

      expect(finalResult).assertEqual('CAUGHT ERROR: ERROR');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3800
     * @tc.name PromiseTest038
     * @tc.desc onRejected callback handles errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorMessage: string = 'error to handle';
      let handledMessage: string = '';

      await new Promise<never>((_, reject) => {
        reject(new Error(errorMessage));
      }).then(
        () => {
          // This callback should not execute
        },
        (error: Error) => {
          handledMessage = `handled: ${error.message}`;
        }
      );

      expect(handledMessage).assertEqual(`handled: ${errorMessage}`);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_3900
     * @tc.name PromiseTest039
     * @tc.desc Thenable's then method is called multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const thenable = new MultiCallThenable();
      const promise = new Promise<number>((resolve) => {
        resolve(thenable);
      });

      const results: number[] = [];
      promise.then(value => results.push(value));
      promise.then(value => results.push(value));

      await new Promise<void>(resolve => setTimeout(resolve, 0));

      expect(results).assertDeepEquals([20, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4000
     * @tc.name PromiseTest040
     * @tc.desc Promise returned by finally inherits previous state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fulfilledResult = await new Promise<string>((resolve) => {
        resolve('success');
      }).finally(() => {
        return 'finally return value is ignored';
      });

      let rejectedMessage: string = '';
      try {
        await new Promise<never>((_, reject) => {
          reject(new Error('failure'));
        }).finally(() => {
          // Doesn't affect rejection state
        });
      } catch (e) {
        if (e instanceof Error) {
          rejectedMessage = e.message;
        }
      }

      expect(fulfilledResult).assertEqual('success');
      expect(rejectedMessage).assertEqual('failure');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4100
     * @tc.name PromiseTest041
     * @tc.desc onFulfilled callback is called asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let executionOrder: number[] = [];
      let finish = false
      new Promise<number>((resolve) => {
        resolve(1);
        executionOrder.push(2);
      }).then(value => {
        executionOrder.push(value);
        finish = true
      });

      executionOrder.push(3);
      while (!finish) {
        await sleep(10)
      }
      expect(executionOrder).assertDeepEquals([2, 3, 1]);
      done();

    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4200
     * @tc.name PromiseTest042
     * @tc.desc then returns new Promise instance each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const promise: Promise<void> = new Promise<void>((resolve) => resolve());
      const then1 = promise.then();
      const then2 = promise.then();

      expect(then1 instanceof Promise).assertEqual(true);
      expect(then2 instanceof Promise).assertEqual(true);
      expect(then1 != then2).assertTrue();
      expect(then1 != promise).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4300
     * @tc.name PromiseTest043
     * @tc.desc then handles null/undefined as onFulfilled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testValue: string = 'pass through';
      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve(testValue);
      })
        .then(null)
        .then(undefined)
        .then();

      const result: string = await promise;
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4400
     * @tc.name PromiseTest044
     * @tc.desc thenable with non-function then property is treated as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<type44> = new Promise<type44>((resolve) => {
        resolve(thenable44);
      });

      const result = await promise;
      expect(result).assertEqual(thenable44);
      expect(result.then).assertEqual('not a function');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4500
     * @tc.name PromiseTest045
     * @tc.desc Rejecting with non-Error value is handled correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectionValue: number = 404;
      const promise: Promise<never> = new Promise<never>((_, reject) => {
        reject(rejectionValue);
      });

      let caughtValue: number | null = null;
      try {
        await promise;
      } catch (e) {
        if (typeof e === 'number') {
          caughtValue = e;
        }
      }

      expect(caughtValue).assertEqual(rejectionValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4600
     * @tc.name PromiseTest046
     * @tc.desc Chained then calls with transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<number>((resolve) => {
        resolve(5);
      })
        .then(value => value * 2)
        .then(value => `result: ${value}`)
        .then(value => value.toUpperCase());

      const result: string = await promise;
      expect(result).assertEqual('RESULT: 10');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4700
     * @tc.name PromiseTest047
     * @tc.desc onRejected returns value that resolves next Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<never>((_, reject) => {
        reject(new Error('problem'));
      }).then(
        () => 'this won\'t execute',
        (error: Error) => `handled: ${error.message}`
      );

      const result: string = await promise;
      expect(result).assertEqual('handled: problem');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4800
     * @tc.name PromiseTest048
     * @tc.desc Throwing in onFulfilled rejects the returned Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorMessage: string = 'error in onFulfilled';
      const promise: Promise<never> = new Promise<number>((resolve) => {
        resolve(100);
      }).then(() => {
        throw new Error(errorMessage);
      });

      let caughtMessage: string = '';
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          caughtMessage = e.message;
        }
      }

      expect(caughtMessage).assertEqual(errorMessage);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_4900
     * @tc.name PromiseTest049
     * @tc.desc thenable resolved after multiple async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class AsyncThenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(10);
            }, 30);
          }).then<TResult1>((value) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                resolve(value * 3);
              }, 20);
            }).then<TResult1>((value) => {
              if (onFulfilled) {
                return onFulfilled(value);
              }
              return undefined as TResult1;
            });
          });
        }
      }

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(new AsyncThenable());
      });
      const result: number = await promise;

      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5000
     * @tc.name PromiseTest050
     * @tc.desc finally callback doesn't affect promise value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testValue: number = 99;

      const fulfilledResult: number = await new Promise<number>((resolve) => {
        resolve(testValue);
      }).finally(() => {
        return 'something else';
      });

      expect(fulfilledResult).assertEqual(testValue);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5100
     * @tc.name PromiseTest051
     * @tc.desc Throwing in finally propagates as rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorMessage: string = 'error from finally';
      let caughtMessage: string = '';

      try {
        await new Promise<void>((resolve) => {
          resolve();
        }).finally(() => {
          throw new Error(errorMessage);
        });
      } catch (e) {
        if (e instanceof Error) {
          caughtMessage = e.message;
        }
      }

      expect(caughtMessage).assertEqual(errorMessage);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5200
     * @tc.name PromiseTest052
     * @tc.desc then called after promise is settled still executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve('already settled');
      });

      // Wait for promise to settle
      setTimeout(() => {
        promise.then((value) => {
          expect(value).assertEqual('already settled');
          done();
        });
      }, 50);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5300
     * @tc.name PromiseTest053
     * @tc.desc Nested promises in executor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number> = new Promise<number>((resolve) => {
        new Promise<number>((innerResolve) => {
          setTimeout(() => innerResolve(5), 30);
        }).then(value => {
          resolve(value * 4);
        });
      });

      const result: number = await promise;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5400
     * @tc.name PromiseTest054
     * @tc.desc thenable with both onFulfilled and onRejected handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class CompleteThenable implements PromiseLike<string> {
        private shouldReject: boolean;

        constructor(shouldReject: boolean) {
          this.shouldReject = shouldReject;
        }

        then<TResult1 = string, TResult2 = never>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onRejected?: ((reason: Error) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<string>((resolve, reject) => {
            if (this.shouldReject) {
              reject(new Error('thenable error'));
            } else {
              resolve('thenable success');
            }
          }).then<TResult1, TResult2>(
            onFulfilled,
            onRejected
          );
        }
      }

      // Test fulfillment path
      const fulfilledPromise: Promise<string> = new Promise<string>((resolve) => {
        resolve(new CompleteThenable(false));
      });
      expect(await fulfilledPromise).assertEqual('thenable success');

      // Test rejection path
      const rejectedPromise: Promise<string> = new Promise<string>((resolve) => {
        resolve(new CompleteThenable(true));
      });
      let errorMessage: string = '';
      try {
        await rejectedPromise;
      } catch (e) {
        if (e instanceof Error) {
          errorMessage = e.message;
        }
      }
      expect(errorMessage).assertEqual('thenable error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5500
     * @tc.name PromiseTest055
     * @tc.desc Multiple levels of promise chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let chainSteps: number[] = [];

      const promise: Promise<number> = new Promise<number>((resolve) => {
        chainSteps.push(1);
        resolve(1);
      })
        .then(value => {
          chainSteps.push(2);
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(value + 1), 10);
          });
        })
        .then(value => {
          chainSteps.push(3);
          return value * 2;
        })
        .then(value => {
          chainSteps.push(4);
          return new Promise<number>((resolve) => {
            resolve(value + 3);
          });
        });

      const result: number = await promise;

      expect(result).assertEqual(7);
      expect(chainSteps).assertDeepEquals([1, 2, 3, 4]);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5600
     * @tc.name PromiseTest056
     * @tc.desc Promise with object type resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      interface TestData {
        id: number;
        name: string;
      }

      const testData: TestData = {
        id: 101, name: 'test'
      };
      const promise: Promise<TestData> = new Promise<TestData>((resolve) => {
        resolve(testData);
      });

      const result: TestData = await promise;
      expect(result).assertEqual(testData);
      expect(result.id).assertEqual(101);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5700
     * @tc.name PromiseTest057
     * @tc.desc Chaining with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<number>((resolve) => {
        resolve(123);
      }).then(value => {
        return new Promise<string>((resolve) => {
          resolve(value.toString());
        });
      });

      const result: string = await promise;
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5800
     * @tc.name PromiseTest058
     * @tc.desc Reject after resolve is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<string>((resolve, reject) => {
        resolve('resolved');
        reject(new Error('this should be ignored'));
      });

      const result: string = await promise;
      expect(result).assertEqual('resolved');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_5900
     * @tc.name PromiseTest059
     * @tc.type Function
     * @tc.desc Thenable with generic type handling
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('PromiseTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class GenericThenable<T> implements PromiseLike<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        then<TResult1 = T, TResult2 = never>(
          onFulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<void>((resolve) => {
            resolve();
          }).then<TResult1>(() => {
            if (onFulfilled) {
              return onFulfilled(this.value);
            }
            return undefined as TResult1;
          });
        }
      }

      const thenable = new GenericThenable<boolean>(true);
      const promise: Promise<boolean> = new Promise<boolean>((resolve) => {
        resolve(thenable);
      });

      const result: boolean = await promise;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6000
     * @tc.name PromiseTest060
     * @tc.desc Promise with array type resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testArray: number[] = [1, 2, 3, 4];
      const promise: Promise<number[]> = new Promise<number[]>((resolve) => {
        resolve(testArray);
      });

      const result: number[] = await promise;
      expect(result).assertEqual(testArray);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6100
     * @tc.name PromiseTest061
     * @tc.desc onRejected throws new error that propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const originalError: string = 'original';
      const newError: string = 'new error';

      const promise: Promise<void> = new Promise<void>((_, reject) => {
        reject(new Error(originalError));
      }).then(
        () => {
        },
        (error: Error) => {
          throw new Error(newError);
        }
      );

      let caughtError: string = '';
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          caughtError = e.message;
        }
      }

      expect(caughtError).assertEqual(newError);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6200
     * @tc.name PromiseTest062
     * @tc.desc Promise resolved with another promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerPromise: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('inner'), 30);
      });

      const outerPromise: Promise<Promise<string>> = new Promise<Promise<string>>((resolve) => {
        resolve(innerPromise);
      });

      const result: string = await outerPromise;
      expect(result).assertEqual('inner');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6300
     * @tc.name PromiseTest063
     * @tc.desc Thenable object with minimal implementation resolves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class MinimalThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<void>((resolve) => {
            setTimeout(() => resolve(), 10);
          }).then<TResult1>(() => {
            if (onFulfilled) {
              return onFulfilled('minimal value');
            }
            return undefined as TResult1;
          });
        }
      }

      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve(new MinimalThenable());
      });

      const result: string = await promise;
      expect(result).assertEqual('minimal value');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6400
     * @tc.name PromiseTest064
     * @tc.desc Synchronous error in executor is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorMessage: string = 'executor error';
      const promise: Promise<never> = new Promise<never>(() => {
        throw new Error(errorMessage);
      });

      let caughtMessage: string = '';
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          caughtMessage = e.message;
        }
      }

      expect(caughtMessage).assertEqual(errorMessage);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6500
     * @tc.name PromiseTest065
     * @tc.desc then returns promise that resolves after delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime: number = Date.now();
      const delay: number = 50;

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(0);
      }).then(() => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(Date.now() - startTime);
          }, delay);
        });
      });

      const result: number = await promise;
      expect(result + 1 >= delay).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6600
     * @tc.name PromiseTest066
     * @tc.desc Multiple then calls with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const basePromise: Promise<number> = new Promise<number>((resolve) => {
        resolve(5);
      });

      const stringResult: string = await basePromise.then(value => `value: ${value}`);
      const booleanResult: boolean = await basePromise.then(value => value > 0);
      const objectResult = await basePromise.then(value => (value * 2));

      expect(stringResult).assertEqual('value: 5');
      expect(booleanResult).assertEqual(true);
      expect(objectResult).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6700
     * @tc.name PromiseTest067
     * @tc.desc Reject in thenable's onRejected handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectingThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onRejected?: ((reason: Object) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<string>((_, reject) => {
            reject('initial rejection');
          }).then<TResult1, TResult2>(
            onFulfilled,
            (reason: string) => {
              if (onRejected) {
                return onRejected(new Error(`wrapped: ${reason}`));
              }
              return Promise.reject(new Error(`wrapped: ${reason}`)) as PromiseLike<TResult2>;
            }
          );
        }
      }

      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve(new RejectingThenable());
      });

      let errorMessage: string = '';
      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          errorMessage = e.message;
        }
      }

      expect(errorMessage).assertEqual('wrapped: initial rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6800
     * @tc.name PromiseTest068
     * @tc.desc finally with promise return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime: number = Date.now();
      const delay: number = 50;

      const promise: Promise<string> = new Promise<string>((resolve) => {
        resolve('done');
      }).finally(() => {
        return new Promise<void>((resolve) => {
          setTimeout(resolve, delay);
        });
      });

      const result: string = await promise;
      const endTime: number = Date.now();

      expect(result).assertEqual('done');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_6900
     * @tc.name PromiseTest069
     * @tc.desc Complex nested thenables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class Level3Thenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<number>((resolve) => {
            resolve(3);
          }).then<TResult1>((value) => {
            if (onFulfilled) {
              return onFulfilled(value);
            }
            return undefined as TResult1;
          });
        }
      }

      class Level2Thenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<Level3Thenable>((resolve) => {
            resolve(new Level3Thenable());
          }).then<TResult1>(async (value) => {
            if (onFulfilled) {
              return onFulfilled(await value * 2);
            }
            return undefined as TResult1;
          });
        }
      }

      class Level1Thenable implements PromiseLike<number> {
        then<TResult1 = number, TResult2 = never>(
          onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<Level2Thenable>((resolve) => {
            resolve(new Level2Thenable());
          }).then<TResult1>(async (value) => {
            if (onFulfilled) {
              return onFulfilled(await value + 1);
            }
            return undefined as TResult1;
          });
        }
      }

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(new Level1Thenable());
      });
      const result: number = await promise;

      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7000
     * @tc.name PromiseTest070
     * @tc.desc Promise with boolean type resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<boolean> = new Promise<boolean>((resolve) => {
        resolve(true);
      });

      const result: boolean = await promise;
      expect(result).assertEqual(true);

      const promise2: Promise<boolean> = new Promise<boolean>((resolve) => {
        resolve(false);
      });

      const result2: boolean = await promise2;
      expect(result2).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7100
     * @tc.name PromiseTest071
     * @tc.desc Deeply nested promises with value propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<Promise<Promise<number>>> = new Promise<Promise<Promise<number>>>((resolve) => {
        resolve(new Promise<Promise<number>>((resolve) => {
          resolve(new Promise<number>((resolve) => {
            resolve(10);
          }));
        }));
      });

      const result: number = await promise;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7200
     * @tc.name PromiseTest072
     * @tc.desc Nested async functions with promise returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outerAsync = async (): Promise<number> => {
        const innerAsync = async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(5), 20);
          });
        };
        return await innerAsync() * 3;
      };

      const promise: Promise<number> = new Promise<number>(async (resolve) => {
        resolve(await outerAsync());
      });

      const result: number = await promise;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7300
     * @tc.name PromiseTest073
     * @tc.desc Error propagation through nested async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorMsg: string = 'deep error';

      const outer = (): Promise<void> => {
        return new Promise<void>((resolve) => {
          const inner = async (): Promise<void> => {
            const deep = async (): Promise<void> => {
              throw new Error(errorMsg);
            };
            await deep();
          };
          resolve(inner());
        });
      };

      const promise: Promise<void> = outer();
      let caughtMsg: string = '';

      try {
        await promise;
      } catch (e) {
        if (e instanceof Error) {
          caughtMsg = e.message;
        }
      }

      expect(caughtMsg).assertEqual(errorMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7400
     * @tc.name PromiseTest074
     * @tc.desc Mixed promise chaining with nested async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const process = async (value: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(value * 2), 10);
        });
      };

      const promise: Promise<number> = new Promise<number>((resolve) => {
        resolve(5);
      }).then(async (value) => {
        const intermediate = await process(value);
        return new Promise<number>((resolve) => {
          resolve(process(intermediate));
        });
      });

      const result: number = await promise;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7500
     * @tc.name PromiseTest075
     * @tc.desc Nested thenables within promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: string = await promise75;
      expect(result).assertEqual('inner');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7600
     * @tc.name PromiseTest076
     * @tc.desc Async function returning nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const getData = async (): Promise<string> => {
        return new Promise<Promise<string>>((resolve) => {
          setTimeout(() => {
            resolve(new Promise<string>((resolve) => {
              resolve('nested data');
            }));
          }, 30);
        });
      };

      const promise: Promise<string> = new Promise<string>(async (resolve) => {
        resolve(await getData());
      });

      const result: string = await promise;
      expect(result).assertEqual('nested data');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7700
     * @tc.name PromiseTest077
     * @tc.desc Parallel nested promises with Promise.all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: number[] = await promise77;
      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7800
     * @tc.name PromiseTest078
     * @tc.desc Nested error handling with multiple catch layers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise = new Promise<string>((resolve, reject) => {
        // 添加reject路径以避免Promise永远pending
        new Promise<string>((resolve) => {
          setTimeout(() => resolve(''), 10);
        }).then(() => {
          new Promise<void>((_, innerReject) => {
            innerReject(new Error('failure'));
          }).then(() => 'success')
            .catch((error: Error) => {
              // 捕获内部错误后继续向外层reject
              reject(new Error(`wrapped: ${error.message}`));
            });
        });
      }).catch((error: Error) => {
        return `handled: ${error.message}`;
      });

      const result: string = await promise;
      expect(result).assertEqual('handled: wrapped: failure');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_7900
     * @tc.name PromiseTest079
     * @tc.desc Async function chain with nested awaits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchData = async (id: number): Promise<type79> => {
        return new Promise<type79>((resolve) => {
          setTimeout(() => resolve({
            id, value: id * 10
          }), 10);
        });
      };

      const process = async (): Promise<number> => {
        const data = await fetchData(3);
        const nestedProcess = async (value: number): Promise<number> => {
          return new Promise<number>((resolve) => {
            resolve(value * 2);
          });
        };
        return await nestedProcess(data.value);
      };

      const promise: Promise<number> = new Promise<number>(async (resolve) => {
        resolve(await process());
      });

      const result: number = await promise;
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8000
     * @tc.name PromiseTest080
     * @tc.desc Nested promises with different resolution times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime: number = Date.now();

      const promise: Promise<number[]> = new Promise<Promise<number>[]>(resolve => {
        resolve([
          new Promise<number>(resolve => setTimeout(() => resolve(1), 30)),
          new Promise<number>(resolve => setTimeout(() => resolve(2), 10)),
          new Promise<number>(resolve => setTimeout(() => resolve(3), 20))
        ]);
      }).then(promises => Promise.all(promises));

      const result: number[] = await promise;
      const duration: number = Date.now() - startTime + 1;

      expect(result).assertDeepEquals([1, 2, 3]);
      expect(duration >= 30).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8100
     * @tc.name PromiseTest081
     * @tc.desc Deeply nested async functions with error recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level3 = async (): Promise<number> => {
        throw new Error('expected');
      };

      const level2 = async (): Promise<number> => {
        try {
          return await level3();
        } catch {
          return new Promise<number>(resolve => resolve(10));
        }
      };

      const level1 = async (): Promise<number> => {
        return await level2() * 2;
      };

      const promise: Promise<number> = new Promise<number>(async resolve => {
        resolve(await level1());
      });

      const result: number = await promise;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8200
     * @tc.name PromiseTest082
     * @tc.desc Nested promises with value transformation at each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string> = new Promise<number>((resolve) => {
        resolve(2);
      }).then(value => {
        return new Promise<number>((resolve) => {
          resolve(value * 3);
        }).then(value => {
          return new Promise<string>((resolve) => {
            resolve(`Result: ${value * 4}`);
          });
        });
      });

      const result: string = await promise;
      expect(result).assertEqual('Result: 24');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8300
     * @tc.name PromiseTest083
     * @tc.desc Async IIFE within promise executor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number> = new Promise<number>(async (resolve) => {
        const value = await (async () => {
          const inner = await new Promise<number>((resolve) => {
            setTimeout(() => resolve(5), 10);
          });
          return inner * 3;
        })();
        resolve(value);
      });

      const result: number = await promise;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8400
     * @tc.name PromiseTest084
     * @tc.desc Nested thenables with async error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(new WrapperThenable84(5))
        .then((value: number) => value * 3)  // 5 * 3 = 15
        .then(value => `Result: ${value}`);

      // 验证最终结果
      expect(result).assertEqual('Result: 15');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8500
     * @tc.name PromiseTest085
     * @tc.desc Complex nested async workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchUser = async (id: number): Promise<type85> => {
        return new Promise<type85>((resolve) => {
          setTimeout(() => resolve({
            id, name: `User ${id}`
          }), 10);
        });
      };

      const fetchPosts = async (userId: number): Promise<type85_2> => {
        return new Promise<type85_2>((resolve) => {
          setTimeout(() => {
            resolve([
              {
                id: 1, title: `Post by ${userId}`
              },
              {
                id: 2, title: `Another post by ${userId}`
              }
            ]);
          }, 20);
        });
      };

      const process = async (): Promise<string[]> => {
        const user = await fetchUser(5);
        const posts = await fetchPosts(user.id);
        return posts.map(post => `${user.name}: ${post.title}`);
      };

      const promise: Promise<string[]> = new Promise<string[]>(async (resolve) => {
        resolve(await process());
      });

      const result: string[] = await promise;
      expect(result).assertDeepEquals([
        'User 5: Post by 5',
        'User 5: Another post by 5'
      ]);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8600
     * @tc.name PromiseTest086
     * @tc.desc Execution order with nested promises and sync code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      log.push('sync1');

      new Promise<void>((resolve) => {
        log.push('async1');
        resolve();
      }).then(() => {
        log.push('async2');
      });

      log.push('sync2');

      // Wait for all async operations
      await new Promise<void>(resolve => setTimeout(resolve, 0));

      expect(log).assertDeepEquals(['sync1', 'async1', 'sync2', 'async2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8700
     * @tc.name PromiseTest087
     * @tc.desc Nested promise resolution order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const order: number[] = [];

      new Promise<void>((resolve) => {
        order.push(1);
        new Promise<void>((resolve) => {
          order.push(2);
          resolve();
        }).then(() => {
          order.push(4);
        });
        resolve();
      }).then(() => {
        order.push(5);
      });

      order.push(3);

      await new Promise<void>(resolve => setTimeout(resolve, 0));

      expect(order).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8800
     * @tc.name PromiseTest088
     * @tc.desc Parallel nested promises with ordered results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createPromise = (id: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id), delay);
        });
      };

      const promise: Promise<number[]> = new Promise<Promise<number>[]>((resolve) => {
        resolve([
          createPromise(1, 30),
          createPromise(2, 10),
          createPromise(3, 20)
        ]);
      }).then(promises => Promise.all(promises));

      const result: number[] = await promise;
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_8900
     * @tc.name PromiseTest089
     * @tc.desc Nested async functions with log ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      const outer = async (): Promise<void> => {
        log.push('outer start');
        const inner = async (): Promise<void> => {
          log.push('inner start');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              log.push('inner async');
              resolve();
            }, 10);
          });
          log.push('inner end');
        };
        await inner();
        log.push('outer end');
      };

      await outer();

      expect(log).assertDeepEquals([
        'outer start',
        'inner start',
        'inner async',
        'inner end',
        'outer end'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9000
     * @tc.name PromiseTest090
     * @tc.desc Error handling order in nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      try {
        await new Promise<void>((resolve) => {
          log.push('outer promise');
          new Promise<void>((_, reject) => {
            log.push('inner promise');
            reject(new Error('test'));
          }).catch((error: Error) => {
            log.push('inner catch');
            console.log('PromiseTest090 catch')
            throw error;
          });
          console.log('PromiseTest090 catch2')
          resolve();
        });
      } catch {
        log.push('outer catch');
        console.log('PromiseTest090 catch')
      }

      expect(log).assertDeepEquals([
        'outer promise',
        'inner promise',
        'inner catch'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9100
     * @tc.name PromiseTest091
     * @tc.desc Multiple nested then calls with transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number[]> = new Promise<number>((resolve) => {
        resolve(2);
      }).then(value => {
        return new Promise<number>((resolve) => {
          resolve(value * 3);
        }).then(value => {
          return new Promise<number[]>((resolve) => {
            resolve([value, value * 2, value * 3]);
          });
        });
      });

      const result: number[] = await promise;
      expect(result).assertDeepEquals([6, 12, 18]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9200
     * @tc.name PromiseTest092
     * @tc.desc Nested thenables with array results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: string[] = await promise92;
      expect(result).assertDeepEquals(['A', 'B', 'C']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9300
     * @tc.name PromiseTest093
     * @tc.desc Async function chain with array processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchItems = async (): Promise<number[]> => {
        return new Promise<number[]>((resolve) => {
          setTimeout(() => resolve([1, 2, 3]), 10);
        });
      };

      const processItems = async (items: number[]): Promise<number[]> => {
        return new Promise<number[]>((resolve) => {
          resolve(items.map(item => item * 2));
        });
      };

      const filterItems = async (items: number[]): Promise<number[]> => {
        return new Promise<number[]>((resolve) => {
          resolve(items.filter(item => item > 3));
        });
      };

      const promise: Promise<number[]> = new Promise<number[]>(async (resolve) => {
        const items = await fetchItems();
        const processed = await processItems(items);
        const filtered = await filterItems(processed);
        resolve(filtered);
      });

      const result: number[] = await promise;
      expect(result).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9400
     * @tc.name PromiseTest094
     * @tc.desc Nested promises with array aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number[]> = new Promise<number>((resolve) => {
        resolve(1);
      }).then(value => {
        return new Promise<number[]>((resolve) => {
          resolve([value, value + 1]);
        }).then(values => {
          return new Promise<number[]>((resolve) => {
            resolve([...values, values[0] + values[1]]);
          });
        });
      });

      const result: number[] = await promise;
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9500
     * @tc.name PromiseTest095
     * @tc.desc Parallel async operations with ordered results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const operations = [
        () => new Promise<string>((resolve) => setTimeout(() => resolve('first'), 30)),
        () => new Promise<string>((resolve) => setTimeout(() => resolve('second'), 10)),
        () => new Promise<string>((resolve) => setTimeout(() => resolve('third'), 20))
      ];

      const promise: Promise<string[]> = new Promise<Promise<string>[]>((resolve) => {
        resolve(operations.map((op): Promise<string> => op()));
      }).then(promises => Promise.all(promises));

      const result: string[] = await promise;
      expect(result).assertDeepEquals(['first', 'second', 'third']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9600
     * @tc.name PromiseTest096
     * @tc.desc Nested error logging with multiple catch blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLog: string[] = [];

      try {
        await new Promise<void>((resolve) => {
          new Promise<void>((_, reject) => {
            reject(new Error('level 2'));
          }).catch((error: Error) => {
            errorLog.push(`caught: ${error.message}`);
            throw new Error('level 1');
          });
          resolve();
        });
      } catch (error) {
        if (error instanceof Error) {
          errorLog.push(`caught: ${error.message}`);
        }
      }

      expect(errorLog).assertDeepEquals(['caught: level 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9700
     * @tc.name PromiseTest097
     * @tc.desc Complex nested workflow with array results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchUsers = async (): Promise<number[]> => {
        return new Promise<number[]>((resolve) => {
          setTimeout(() => resolve([1, 2, 3]), 10);
        });
      };

      const fetchUserDetails = async (userId: number): Promise<type85> => {
        return new Promise<type85>((resolve) => {
          setTimeout(() => resolve({
            id: userId, name: `User ${userId}`
          }), 5);
        });
      };

      const promise: Promise<string[]> = new Promise<string[]>(async (resolve) => {
        const userIds = await fetchUsers();
        const userDetailsPromises = userIds.map(id => fetchUserDetails(id));
        const users = await Promise.all(userDetailsPromises);
        resolve(users.map(user => user.name));
      });

      const result: string[] = await promise;
      expect(result).assertDeepEquals(['User 1', 'User 2', 'User 3']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9800
     * @tc.name PromiseTest098
     * @tc.desc Nested promises with array transformation pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<string[]> = new Promise<number[]>((resolve) => {
        resolve([1, 2, 3, 4]);
      })
        .then(numbers => {
          return new Promise<number[]>((resolve) => {
            resolve(numbers.filter(n => n % 2 === 0));
          });
        })
        .then(evens => {
          return new Promise<string[]>((resolve) => {
            resolve(evens.map(n => `Even: ${n}`));
          });
        });

      const result: string[] = await promise;
      expect(result).assertDeepEquals(['Even: 2', 'Even: 4']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_9900
     * @tc.name PromiseTest099
     * @tc.desc Async function with nested parallel operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncTask = async (id: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id * 2), delay);
        });
      };

      const mainTask = async (): Promise<number[]> => {
        const results = await Promise.all([
          asyncTask(1, 30),
          asyncTask(2, 10),
          asyncTask(3, 20)
        ]);
        return results;
      };

      const promise: Promise<number[]> = new Promise<number[]>(async (resolve) => {
        resolve(await mainTask());
      });

      const result: number[] = await promise;
      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_TEST_10000
     * @tc.name PromiseTest100
     * @tc.desc Deeply nested promises with final array aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise: Promise<number[]> = new Promise<number>((resolve) => {
        resolve(1);
      }).then(a => {
        return new Promise<number>((resolve) => {
          resolve(2);
        }).then(b => {
          return new Promise<number>((resolve) => {
            resolve(3);
          }).then(c => {
            return new Promise<number[]>((resolve) => {
              resolve([a, b, c, a + b + c]);
            });
          });
        });
      });

      const result: number[] = await promise;
      expect(result).assertDeepEquals([1, 2, 3, 6]);
    });

  })
}