import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { finalResult77, PromiseThenTest030 } from './promisejs';
import { emptyObj, result13, testObj32, testObj32init, user12 } from './promisets';
import { sleep } from './utils';

export default function promiseThenTest() {
  describe('promiseThenTest', () => {
    afterEach(async () => {
      await sleep(50)
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0100
     * @tc.name PromiseThenTest001
     * @tc.desc Test the fulfillment value when then() callback returns a normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(10).then(value => value * 2);
      expect(20).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0200
     * @tc.name PromiseThenTest002
     * @tc.desc Test the fulfillment value when then() callback has no return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('test').then(() => emptyObj);
      expect(result).assertEqual(emptyObj);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0300
     * @tc.name PromiseThenTest003
     * @tc.desc Test the rejection reason when then() callback throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await Promise.resolve().then(() => {
          throw new Error('callback error');
        });
      } catch (err) {
        expect('callback error').assertEqual((err as Error).message);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0400
     * @tc.name PromiseThenTest004
     * @tc.desc Test the inherited value when then() callback returns a resolved Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(5).then(() => Promise.resolve('resolved'));
      expect('resolved').assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0500
     * @tc.name PromiseThenTest005
     * @tc.desc Test the inherited reason when then() callback returns a rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await Promise.resolve().then(() => Promise.reject('rejected reason'));
      } catch (err) {
        expect('rejected reason').assertEqual(err as string);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0600
     * @tc.name PromiseThenTest006
     * @tc.desc Test parameter passing in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(2)
        .then(value => value + 3)
        .then(value => value * 4);
      expect(20).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0700
     * @tc.name PromiseThenTest007
     * @tc.desc Test state propagation when onFulfilled is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('propagated value').then(undefined).then(value => value + ' processed');
      expect('propagated value processed').assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0800
     * @tc.name PromiseThenTest008
     * @tc.desc Test automatic resolution of class-type thenables inheriting PromiseLike returned by then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      // Declare a class inheriting PromiseLike as a thenable
      class CustomThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onfulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onrejected?: ((reason: Error) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise((resolve) => {
            setTimeout(() => {
              const resolvedValue = 'thenable resolved';
              if (onfulfilled) {
                const result = onfulfilled(resolvedValue);
                // Handle cases where onfulfilled returns a PromiseLike value
                if (typeof (result as PromiseLike<TResult1>)?.then === 'function') {
                  (result as PromiseLike<TResult1>).then(resolve);
                } else {
                  resolve(result as TResult1);
                }
              } else {
                resolve(resolvedValue as TResult1);
              }
            }, 100);
          });
        }
      }

      const thenable = new CustomThenable();
      const result = await Promise.resolve().then(() => thenable);
      expect('thenable resolved').assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_0900
     * @tc.name PromiseThenTest009
     * @tc.desc Test independent execution when calling then() multiple times on the same Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const basePromise = Promise.resolve(100);
      const result1 = await basePromise.then(value => value + 10);
      const result2 = await basePromise.then(value => value * 2);

      expect(110).assertEqual(result1);
      expect(200).assertEqual(result2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1000
     * @tc.name PromiseThenTest010
     * @tc.desc Test state waiting when then() callback returns a pending Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pendingPromise = new Promise<number>((resolve) => {
        setTimeout(() => resolve(300), 150);
      });
      const result = await Promise.resolve().then(() => pendingPromise);
      expect(300).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1100
     * @tc.name PromiseThenTest011
     * @tc.desc Test fulfillment result when then() callback returns a boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('valid').then(() => true);
      expect(true).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1200
     * @tc.name PromiseThenTest012
     * @tc.desc Test property access when then() callback returns an object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      const result = await Promise.resolve().then(() => user12);
      expect('Bob').assertEqual(result.name);
      expect(1).assertEqual(result.id);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1300
     * @tc.name PromiseThenTest013
     * @tc.desc Test object property passing in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(17).assertEqual(await result13());
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1400
     * @tc.name PromiseThenTest014
     * @tc.desc Test rejection state propagation when onRejected is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await Promise.reject('rejection propagation').then(() => {
        }, undefined).then(() => {
        });
      } catch (err) {
        expect('rejection propagation').assertEqual(err as string);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1500
     * @tc.name PromiseThenTest015
     * @tc.desc Test fulfillment result when then() callback returns an empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(undefined).then(() => (emptyObj));
      expect(emptyObj).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1600
     * @tc.name PromiseThenTest016
     * @tc.desc Test element access when then() callback returns an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve().then(() => [10, 20, 30]);
      expect(10).assertEqual(result[0]);
      expect(30).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1700
     * @tc.name PromiseThenTest017
     * @tc.desc Test array processing in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve([1, 2, 3])
        .then(arr => arr.map(item => item * 2))
        .then(arr => arr.filter(item => item > 3));
      expect([4, 6]).assertDeepEquals(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1800
     * @tc.name PromiseThenTest018
     * @tc.desc Test sequential execution of asynchronous operations in then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let log = '';
      await Promise.resolve()
        .then(() => {
          log += 'a';
          return new Promise<void>(resolve => setTimeout(() => {
            log += 'b';
            resolve(undefined);
          }, 50));
        })
        .then(() => {
          log += 'c';
        });
      expect('abc').assertEqual(log);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_1900
     * @tc.name PromiseThenTest019
     * @tc.desc Test chain propagation of resolved Promises returned by then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(1)
        .then(() => Promise.resolve(2))
        .then(value => value + 3)
        .then(value => Promise.resolve(value * 4));
      expect(20).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2000
     * @tc.name PromiseThenTest020
     * @tc.desc Test error capture of rejected Promises returned by then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorMsg = '';
      await Promise.resolve()
        .then(() => Promise.reject('error'))
        .catch((err: string) => {
          errorMsg = err as string;
        });
      expect('error').assertEqual(errorMsg);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2100
     * @tc.name PromiseThenTest021
     * @tc.desc Test execution order of nested then() in then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: number[] = [];
      await Promise.resolve(1)
        .then(value => {
          result.push(value);
          return Promise.resolve(2).then(v => {
            result.push(v);
            return v;
          });
        })
        .then(value => {
          result.push(value);
        });
      expect([1, 2, 2]).assertDeepEquals(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2200
     * @tc.name PromiseThenTest022
     * @tc.desc Test rejection state resolution of thenables inheriting PromiseLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          onfulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null | undefined,
          onrejected?: ((reason: Object) => TResult2 | PromiseLike<TResult2>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise((_, reject) => {
            setTimeout(() => {
              const rejectReason = 'thenable rejected';
              if (onrejected) {
                const result = onrejected(rejectReason);
                if (typeof (result as PromiseLike<TResult2>)?.then === 'function') {
                  (result as PromiseLike<TResult2>).then();
                }
              } else {
                reject(rejectReason);
              }
            }, 100);
          });
        }
      }

      let caughtReason = '';
      try {
        await Promise.resolve().then(() => new RejectThenable());
      } catch (err) {
        caughtReason = err as string;
      }
      expect('thenable rejected').assertEqual(caughtReason);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2300
     * @tc.name PromiseThenTest023
     * @tc.desc Test fulfillment result when then() callback returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(false).then(() => 0);
      expect(0).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2400
     * @tc.name PromiseThenTest024
     * @tc.desc Test mathematical operation propagation in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(10)
        .then(v => v - 3)
        .then(v => v / 2)
        .then(v => v + 4);
      expect(7.5).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2500
     * @tc.name PromiseThenTest025
     * @tc.desc Test fulfillment result when then() callback returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('old').then(() => '');
      expect('').assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2600
     * @tc.name PromiseThenTest026
     * @tc.desc Test string concatenation in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('Hello')
        .then(str => str + ' ')
        .then(str => str + 'World')
        .then(str => str + '!');
      expect('Hello World!').assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2700
     * @tc.name PromiseThenTest027
     * @tc.desc Test resolution consistency of the same thenable passed multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ConsistentThenable implements PromiseLike<number> {
        private value = 50;

        then<TResult1 = number, TResult2 = never>(
          onfulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null | undefined
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise(resolve => resolve(onfulfilled!(this.value)));
        }
      }

      const thenable = new ConsistentThenable();
      const result1 = await Promise.resolve().then(() => thenable);
      const result2 = await Promise.resolve().then(() => thenable);

      expect(50).assertEqual(result1);
      expect(50).assertEqual(result2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2800
     * @tc.name PromiseThenTest028
     * @tc.desc Test side effects of modifying external variables in then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let externalVar = 10;
      await Promise.resolve().then(() => {
        externalVar = 20;
      });
      expect(20).assertEqual(externalVar);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_2900
     * @tc.name PromiseThenTest029
     * @tc.desc Test combination of side effects and return values in then() chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sideEffect = 0;
      const result = await Promise.resolve(3)
        .then(v => {
          sideEffect += v;
          return v * 4;
        })
        .then(v => {
          sideEffect += v;
          return sideEffect;
        });

      expect(15).assertEqual(result);
      expect(15).assertEqual(sideEffect);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_then_TEST_3000
     * @tc.name PromiseThenTest030
     * @tc.desc Test chain resolution of PromiseLike returned by then() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result:number = await PromiseThenTest030()
      expect(300).assertEqual(result);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3100
     * @tc.name PromiseThenTest031
     * @tc.desc onRejected returns value converts rejected Promise to fulfilled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.reject('original error')
        .then(
          () => 'unreachable',
          (reason: string) => `handled: ${reason}`
        );

      expect(result).assertEqual('handled: original error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3200
     * @tc.name PromiseThenTest032
     * @tc.desc then callback receives exact fulfillment value from Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedObj = testObj32init;

      await Promise.resolve(testObj32).then((value) => {
        receivedObj = value;
      });

      expect(receivedObj).assertEqual(testObj32);
      expect(receivedObj?.key).assertEqual('value');
      expect(receivedObj?.num).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3300
     * @tc.name PromiseThenTest033
     * @tc.desc then chain handles sequential async operations correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sequence = '';

      await Promise.resolve()
        .then(() => new Promise<undefined>(resolve => {
          setTimeout(() => {
            sequence += 'a';
            resolve(undefined);
          }, 50);
        }))
        .then(() => new Promise<undefined>(resolve => {
          setTimeout(() => {
            sequence += 'b';
            resolve(undefined);
          }, 30);
        }))
        .then(() => {
          sequence += 'c';
        });

      expect(sequence).assertEqual('abc');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3400
     * @tc.name PromiseThenTest034
     * @tc.desc onRejected throws error propagates to next rejection handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalErr = '';

      await Promise.reject('first error')
        .then(
          () => {
          },
          (reason: Error) => {
            throw new Error(`wrapped: ${reason}`);
          }
        )
        .catch((err: Error) => {
          finalErr = err.message;
        });

      expect(finalErr).assertEqual('wrapped: first error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3500
     * @tc.name PromiseThenTest035
     * @tc.desc then returns pending Promise when callback returns pending Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isPending = true;
      const pendingPromise = new Promise<number>((resolve) => {
        setTimeout(() => resolve(450), 100);
      });

      const thenReturnedPromise = Promise.resolve().then(() => pendingPromise);

      // Check pending state immediately
      setTimeout(() => {
        isPending = thenReturnedPromise instanceof Promise;
      }, 50);

      await new Promise<void>(resolve => setTimeout(resolve, 60));
      expect(isPending).assertEqual(true);

      // Check resolved value eventually
      const result = await thenReturnedPromise;
      expect(result).assertEqual(450);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3600
     * @tc.name PromiseThenTest036
     * @tc.desc then callback with boolean return value works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise1 = Promise.resolve(10 > 5).then(value => value);
      const promise2 = Promise.resolve(3 < 1).then(value => !value);

      const result1 = await promise1;
      const result2 = await promise2;

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3700
     * @tc.name PromiseThenTest037
     * @tc.desc empty onFulfilled callback results in undefined fulfillment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve('has value').then(() => undefined);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3800
     * @tc.name PromiseThenTest038
     * @tc.desc then chain propagates resolved Promise value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(5)
        .then(v => Promise.resolve(v * 4))
        .then(v => v + 10)
        .then(v => Promise.resolve(v / 2));

      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_3900
     * @tc.name PromiseThenTest039
     * @tc.desc onRejected is not called for fulfilled Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rejectCalled = false;

      await Promise.resolve('success').then(
        () => {
        },
        () => {
          rejectCalled = true;
        }
      );

      expect(rejectCalled).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4000
     * @tc.name PromiseThenTest040
     * @tc.desc thenable with rejected state is handled in then chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectedThenable implements PromiseLike<string> {
        then<TResult1 = string, TResult2 = never>(
          _onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null,
          onRejected?: ((reason: string) => TResult2 | PromiseLike<TResult2>) | null
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise((_, reject) => {
            setTimeout(() => onRejected!('thenable rejected'), 70);
          });
        }
      }

      let caughtReason = '';
      try {
        await Promise.resolve().then(() => new RejectedThenable());
      } catch (e) {
        caughtReason = e as string;
      }

      expect(caughtReason).assertEqual('thenable rejected');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4100
     * @tc.name PromiseThenTest041
     * @tc.desc then callback modifies array and returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve([1, 2, 3, 4])
        .then(arr => arr.filter(item => item % 2 === 0))
        .then(arr => arr.map(item => item * 3));

      expect(result).assertDeepEquals([6, 12]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4200
     * @tc.name PromiseThenTest042
     * @tc.desc then returns fulfilled Promise when onRejected returns value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise = Promise.reject('failure').then(
        () => 'success',
        () => 'recovered'
      );

      expect(promise instanceof Promise).assertEqual(true);
      const result = await promise;
      expect(result).assertEqual('recovered');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4300
     * @tc.name PromiseThenTest043
     * @tc.desc then callback receives rejection reason for rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testError = new Error('custom error');
      let receivedReason = new Error('init error');

      await Promise.reject(testError).then(
        () => {
        },
        (reason: Error) => {
          receivedReason = reason;
        }
      );

      expect(receivedReason).assertEqual(testError);
      expect(receivedReason?.message).assertEqual('custom error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4400
     * @tc.name PromiseThenTest044
     * @tc.desc then chain with mixed sync and async callbacks works sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      await Promise.resolve()
        .then(() => {
          log.push('sync1');
        })
        .then(() => new Promise<undefined>(resolve => {
          setTimeout(() => {
            log.push('async1');
            resolve(undefined);
          }, 40);
        }))
        .then(() => {
          log.push('sync2');
        })
        .then(() => new Promise<undefined>(resolve => {
          setTimeout(() => {
            log.push('async2');
            resolve(undefined);
          }, 20);
        }));

      expect(log).assertDeepEquals(['sync1', 'async1', 'sync2', 'async2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4500
     * @tc.name PromiseThenTest045
     * @tc.desc missing onRejected lets error propagate to catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtErr = '';

      await Promise.reject('propagated error')
        .then(() => 'no handler here')
        .catch((reason: string) => {
          caughtErr = reason as string;
        });

      expect(caughtErr).assertEqual('propagated error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4600
     * @tc.name PromiseThenTest046
     * @tc.desc then callback returns empty object as fulfillment value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve().then(() => (emptyObj));

      expect(result).assertEqual(emptyObj);
      expect(Object.keys(result).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4700
     * @tc.name PromiseThenTest047
     * @tc.desc thenable resolved value is passed through multiple then chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class PassThroughThenable implements PromiseLike<number> {
        then<TResult1 = number>(onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null) {
          return new Promise<number>(resolve => resolve(1)).then(()=>onFulfilled!(200));
        }
      }

      const result = await Promise.resolve()
        .then(() => new PassThroughThenable())
        .then(v => v + 50)
        .then((v): Promise<number> => new PassThroughThenable().then(val => val + v));

      expect(result).assertEqual(450);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4800
     * @tc.name PromiseThenTest048
     * @tc.desc onFulfilled is not called for rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let fulfillCalled = false;

      await Promise.reject('error').then(
        () => {
          fulfillCalled = true;
        },
        () => {
        }
      );

      expect(fulfillCalled).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_4900
     * @tc.name PromiseThenTest049
     * @tc.desc then chain handles nested Promise resolution correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(10)
        .then(v => Promise.resolve(Promise.resolve(v * 3)))
        .then(v => Promise.resolve(v + 15))
        .then(v => v / 5);

      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5000
     * @tc.name PromiseThenTest050
     * @tc.desc then returns new Promise even when callback returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnedPromise = Promise.resolve('test').then(() => undefined);

      expect(returnedPromise instanceof Promise).assertEqual(true);
      const result = await returnedPromise;
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5100
     * @tc.name PromiseThenTest051
     * @tc.desc Nested then in async callback maintains execution order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionLog: string[] = [];

      await Promise.resolve()
        .then(() => new Promise<void>((resolve) => {
          setTimeout(() => {
            executionLog.push('outer1');
            Promise.resolve().then(() => {
              executionLog.push('inner1');
              resolve();
            });
          }, 50);
        }))
        .then(() => {
          executionLog.push('outer2');
        });

      expect(executionLog).assertDeepEquals(['outer1', 'inner1', 'outer2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5200
     * @tc.name PromiseThenTest052
     * @tc.desc Async then callbacks execute sequentially with delayed resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let accumulatedValue = 0;
      const delay = (ms: number, value: number): Promise<number> =>
      new Promise<number>((resolve) => setTimeout(() => resolve(value), ms));

      await delay(30, 10)
        .then((val: number) => {
          accumulatedValue += val;
          return delay(20, 20);
        })
        .then((val: number) => {
          accumulatedValue += val;
          return delay(10, 30);
        })
        .then((val: number) => {
          accumulatedValue += val;
        });

      expect(accumulatedValue).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5300
     * @tc.name PromiseThenTest053
     * @tc.desc Nested Promise rejection in then propagates to outer catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtErrorMsg = '';

      await Promise.resolve()
        .then(() => {
          return new Promise<void>((_, reject) => {
            setTimeout(() => {
              reject(new Error('nested rejection'));
            }, 40);
          });
        })
        .catch((err: Error) => {
          caughtErrorMsg = err.message;
        });

      expect(caughtErrorMsg).assertEqual('nested rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5400
     * @tc.name PromiseThenTest054
     * @tc.desc Parallel async operations in then resolve before next chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parallelResult: number[] = [];
      const asyncTask = (ms: number, val: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        parallelResult.push(val);
        resolve();
      }, ms));

      await Promise.resolve()
        .then(() => {
          return Promise.all<void>([asyncTask(20, 1), asyncTask(10, 2)]);
        })
        .then(() => {
          parallelResult.push(3);
        });

      expect(parallelResult).assertDeepEquals([2, 1, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5500
     * @tc.name PromiseThenTest055
     * @tc.desc Deeply nested then chains maintain value propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finalResult: number = await Promise.resolve<number>(2)
        .then((v: number) => {
          return Promise.resolve<number>(v * 3)
            .then((v: number) => {
              return Promise.resolve<number>(v + 4)
                .then((v: number) => v / 2);
            });
        });

      expect(finalResult).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5600
     * @tc.name PromiseThenTest056
     * @tc.desc Async error in nested then is caught by outer onRejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorHandled = false;

      await Promise.resolve()
        .then(
          () => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(Promise.reject(new Error('async nested error')));
              }, 30);
            });
          },
          () => {
          }
        )
        .then(
          () => {
          },
          (err: Error) => {
            errorHandled = err.message === 'async nested error';
          }
        );

      expect(errorHandled).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5700
     * @tc.name PromiseThenTest057
     * @tc.desc Then chain with mixed sync/async errors propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLogs: string[] = [];

      await Promise.resolve()
        .then(() => {
          throw new Error('sync error 1');
        })
        .catch((err: Error) => {
          errorLogs.push(err.message);
          return Promise.reject(new Error('async error 2'));
        })
        .catch((err: Error) => {
          errorLogs.push(err.message);
        });

      expect(errorLogs).assertDeepEquals(['sync error 1', 'async error 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5800
     * @tc.name PromiseThenTest058
     * @tc.desc Timing of nested async then vs outer chain execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      const outerPromise: Promise<void> = Promise.resolve()
        .then(() => {
          log.push('outer-step1');
          return new Promise<void>((resolve) => {
            setTimeout(() => {
              Promise.resolve().then(() => log.push('inner-step1'));
              setTimeout(() => log.push('inner-step2'), 10);
              resolve();
            }, 20);
          });
        })
        .then(() => {
          log.push('outer-step2');
        });

      await outerPromise;
      // Wait for remaining inner async tasks
      await new Promise<void>((resolve) => setTimeout(resolve, 30));

      expect(log).assertDeepEquals(["outer-step1", "inner-step1", "outer-step2", "inner-step2"]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_5900
     * @tc.name PromiseThenTest059
     * @tc.desc Resolve nested thenable in async callback maintains type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class DataThenable implements PromiseLike<string> {
        then<TResult1 = string>(onFulfilled?: ((value: string) => TResult1 | PromiseLike<TResult1>) | null) {
          return new Promise<TResult1>((resolve) => {
            setTimeout(() => {
              const value = 'thenable-data';
              resolve(onFulfilled ? onFulfilled(value) : value as TResult1);
            }, 30);
          });
        }
      }

      const result: string = await Promise.resolve()
        .then(() => new Promise<DataThenable>((resolve) => {
          setTimeout(() => resolve(new DataThenable()), 20);
        }))
        .then((thenable: DataThenable) => thenable);

      expect(result).assertEqual('thenable-data');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6000
     * @tc.name PromiseThenTest060
     * @tc.desc Sequential async then with dependent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchStep = (step: number): Promise<number> =>
      new Promise<number>((resolve) => {
        setTimeout(() => resolve(step * 10), step * 10);
      });

      const result: number = await fetchStep(1)
        .then((val: number) => fetchStep(val / 10 + 1))
        .then((val: number) => fetchStep(val / 10 + 1))
        .then((val: number) => val * 2);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6100
     * @tc.name PromiseThenTest061
     * @tc.desc Nested rejection in parallel Promise.all is caught by outer catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtReason = '';
      const task1: Promise<string> = Promise.resolve('success1');
      const task2: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject('task2 failed'), 20));
      const task3: Promise<string> = Promise.resolve('success3');

      await Promise.resolve()
        .then(() => Promise.all<string>([task1, task2, task3]))
        .catch((err: string) => {
          caughtReason = err;
        });

      expect(caughtReason).assertEqual('task2 failed');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6200
     * @tc.name PromiseThenTest062
     * @tc.desc Async then callback returns different type than input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: string = await Promise.resolve<number>(123)
        .then((val: number) => new Promise<string>((resolve) => {
          setTimeout(() => resolve(`number: ${val}`), 40);
        }));

      expect(result).assertEqual('number: 123');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6300
     * @tc.name PromiseThenTest063
     * @tc.desc Deeply nested async then with timing dependency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalValue = 0;

      await Promise.resolve<number>(1)
        .then((v: number) => new Promise<number>((resolve) => {
          setTimeout(() => resolve(v * 2), 10);
        }))
        .then((v: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              Promise.resolve<number>(v + 3)
                .then((v2: number) => {
                  finalValue = v2 * 4;
                  resolve(v2);
                });
            }, 20);
          });
        });

      expect(finalValue).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6400
     * @tc.name PromiseThenTest064
     * @tc.desc Then chain with async finally-like behavior via nested then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      await Promise.resolve()
        .then(() => {
          log.push('start');
          return new Promise<void>((resolve, reject) => {
            setTimeout(() => reject(new Error('operation failed')), 30);
          })
            .then(() => log.push('success'), () => log.push('fail'))
            .then(() => log.push('cleanup'));
        });

      expect(log).assertDeepEquals(['start', 'fail', 'cleanup']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6500
     * @tc.name PromiseThenTest065
     * @tc.desc Async then returns resolved Promise after delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: boolean = await Promise.resolve()
        .then(() => new Promise<Promise<boolean>>((resolve) => {
          setTimeout(() => {
            resolve(Promise.resolve(true));
          }, 50);
        }))
        .then((innerPromise: Promise<boolean>) => innerPromise);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6600
     * @tc.name PromiseThenTest066
     * @tc.desc Nested then in rejected Promise chain maintains error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorPath = '';

      await Promise.reject<Error>(new Error('root error'))
        .then(
          () => errorPath += 'fulfill1',
          (err: Error) => {
            errorPath += 'reject1:' + err.message;
            return Promise.reject<Error>(new Error('reject1 propagated'));
          }
        )
        .then(
          () => errorPath += 'fulfill2',
          (err: Error) => {
            errorPath += '|reject2:' + err.message;
          }
        );

      expect(errorPath).assertEqual('reject1:root error|reject2:reject1 propagated');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6700
     * @tc.name PromiseThenTest067
     * @tc.desc Timing of multiple async then callbacks on same Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];
      const basePromise: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(100), 30));

      basePromise.then((val: number) => {
        log.push(`cb1: ${val}`);
      });

      setTimeout(() => {
        basePromise.then((val: number) => {
          log.push(`cb2: ${val * 2}`);
        });
      }, 10);

      await basePromise;
      await new Promise<void>((resolve) => setTimeout(resolve, 20));

      expect(log).assertDeepEquals(['cb1: 100', 'cb2: 200']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6800
     * @tc.name PromiseThenTest068
     * @tc.desc Nested async then with cross-dependency between inner and outer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outerValue = 0;
      const finalResult: number = await Promise.resolve<number>(5)
        .then((outerVal: number) => {
          outerValue = outerVal;
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              // Inner async operation uses outer value
              Promise.resolve<number>(outerVal * 3)
                .then((innerVal: number) => resolve(innerVal + outerVal));
            }, 40);
          });
        })
        .then((val: number) => val * 2);

      expect(outerValue).assertEqual(5);
      expect(finalResult).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_6900
     * @tc.name PromiseThenTest069
     * @tc.desc Async then chain handles sequential rejection and recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const recoveryLog: string[] = [];
      const delayReject = (msg: string, ms: number): Promise<never> =>
      new Promise<never>((_, reject) => setTimeout(() => reject(msg), ms));
      const delayResolve = (val: string, ms: number): Promise<string> =>
      new Promise<string>((resolve) => setTimeout(() => resolve(val), ms));

      const result: string = await delayResolve('step1', 10)
        .then((val: string) => {
          recoveryLog.push(val);
          return delayReject('step2 failed', 20);
        })
        .then(
          () => 'unreachable',
          (err: string) => {
            recoveryLog.push(err);
            return delayResolve('step2 recovered', 10);
          }
        )
        .then((val: string) => {
          recoveryLog.push(val);
          return val + ' - final';
        });

      expect(recoveryLog).assertDeepEquals(['step1', 'step2 failed', 'step2 recovered']);
      expect(result).assertEqual('step2 recovered - final');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7000
     * @tc.name PromiseThenTest070
     * @tc.desc Timing consistency of nested then vs parallel async tasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionOrder: number[] = [];
      let taskId = 0;

      // Generate async task with unique ID and delay
      const createTask = (delay: number): Promise<void> => {
        const id = ++taskId;
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            executionOrder.push(id);
            resolve();
          }, delay);
        });
      };

      await Promise.resolve()
        .then(() => {
          // Parallel tasks 1 and 2
          const parallelTasks = [createTask(30), createTask(10)];
          // Nested then with task 3
          return Promise.resolve()
            .then(() => createTask(20))
            .then(() => Promise.all<void>(parallelTasks));
        });

      // Verify execution order matches delay (shorter delay first)
      expect(executionOrder).assertDeepEquals([2, 3, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7100
     * @tc.name PromiseThenTest071
     * @tc.desc 3-level nested then chain with async value transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finalResult: number = await Promise.resolve<number>(2)
        .then((v1: number) => new Promise<number>((resolve) => {
          setTimeout(() => resolve(v1 * 4), 10);
        })
          .then((v2: number) => new Promise<number>((resolve) => {
            setTimeout(() => resolve(v2 + 6), 20);
          })
            .then((v3: number) => new Promise<number>((resolve) => {
              setTimeout(() => resolve(v3 / 2), 15);
            }))));

      expect(finalResult).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7200
     * @tc.name PromiseThenTest072
     * @tc.desc Multi-level then chain with alternating sync/async callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const valueLog: number[] = [];
      const delay = (val: number, ms: number): Promise<number> =>
      new Promise<number>((resolve) => setTimeout(() => resolve(val), ms));

      await Promise.resolve<number>(10)
        .then((v: number) => {
          valueLog.push(v);
          return delay(v * 2, 10);
        })// Async
        .then((v: number) => {
          valueLog.push(v);
          return v + 5;
        })// Sync
        .then((v: number) => {
          valueLog.push(v);
          return delay(v - 3, 20);
        })// Async
        .then((v: number) => {
          valueLog.push(v);
          return v * 4;
        }); // Sync

      expect(valueLog).assertDeepEquals([10, 20, 25, 22]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7300
     * @tc.name PromiseThenTest073
     * @tc.desc 4-level nested rejection propagation in deep then chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalErrMsg = '';

      await Promise.resolve()
        .then(() => new Promise<void>((resolve) => {
          setTimeout(() => resolve(), 10);
        })
          .then(() => new Promise<void>((_, reject) => {
            setTimeout(() => reject(new Error('level2 error')), 15);
          })
            .then(() => new Promise<void>((resolve) => {
              setTimeout(() => resolve(), 5);
            }))
            .then(() => {
            })))
        .catch((err: Error) => {
          finalErrMsg = err.message;
        });

      expect(finalErrMsg).assertEqual('level2 error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7400
     * @tc.name PromiseThenTest074
     * @tc.desc Multi-level then chain with cross-level value dependency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let level1Val = 0;
      const finalResult: number = await Promise.resolve<number>(3)
        .then((v: number) => {
          level1Val = v;
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(v * 5), 20);
          });
        })
        .then((v: number) => new Promise<number>((resolve) => {
          setTimeout(() => resolve(v + level1Val * 2), 10);
        }))
        .then((v: number) => new Promise<number>((resolve) => {
          setTimeout(() => resolve(v - level1Val), 15);
        }));

      expect(level1Val).assertEqual(3);
      expect(finalResult).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7500
     * @tc.name PromiseThenTest075
     * @tc.desc Deeply nested then with parallel tasks in intermediate level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parallelResults: number[] = [];
      const asyncTask = (val: number, ms: number): Promise<number> =>
      new Promise<number>((resolve) => setTimeout(() => resolve(val), ms));

      const finalSum: number = await Promise.resolve()
        .then(() => new Promise<number[]>((resolve) => {
          setTimeout(() => {
            resolve(Promise.all<number>([asyncTask(5, 10), asyncTask(8, 5), asyncTask(3, 15)]));
          }, 20);
        }))
        .then((vals: number[]) => {
          vals.forEach(v => parallelResults.push(v));
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(vals.reduce((a, b) => a + b, 0)), 10);
          });
        });

      expect(parallelResults.sort((a, b) => a - b)).assertDeepEquals([3, 5, 8]);
      expect(finalSum).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7600
     * @tc.name PromiseThenTest076
     * @tc.desc 3-level then chain with async recovery at middle level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const recoveryLog: string[] = [];

      const result: string = await Promise.resolve<string>('init')
        .then((val: string) => {
          recoveryLog.push(val);
          return new Promise<never>((_, reject) => setTimeout(() => reject('level1 fail'), 10));
        })
        .then(
          () => 'unreachable',
          (err: string) => {
            recoveryLog.push(err);
            return new Promise<string>((resolve) => setTimeout(() => resolve('level1 recovered'), 15));
          }
        )
        .then((val: string) => {
          recoveryLog.push(val);
          return new Promise<string>((resolve) => setTimeout(() => resolve(val + ' - final'), 10));
        });

      expect(recoveryLog).assertDeepEquals(['init', 'level1 fail', 'level1 recovered']);
      expect(result).assertEqual('level1 recovered - final');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7700
     * @tc.name PromiseThenTest077
     * @tc.desc Multi-level then chain with thenable resolution at each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await finalResult77()).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7800
     * @tc.name PromiseThenTest078
     * @tc.desc Deep nested then with async side effects at each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sideEffectLog: string[] = [];

      await Promise.resolve()
        .then(() => new Promise<void>((resolve) => {
          setTimeout(() => {
            sideEffectLog.push('level1 done');
            resolve();
          }, 10);
        })
          .then(() => new Promise<void>((resolve) => {
            setTimeout(() => {
              sideEffectLog.push('level2 done');
              resolve();
            }, 15);
          })
            .then(() => new Promise<void>((resolve) => {
              setTimeout(() => {
                sideEffectLog.push('level3 done');
                resolve();
              }, 5);
            }))));

      expect(sideEffectLog).assertDeepEquals(['level1 done', 'level2 done', 'level3 done']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_7900
     * @tc.name PromiseThenTest079
     * @tc.desc 4-level then chain with mixed Promise and thenable resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class SimpleThenable implements PromiseLike<number> {
        private value: number;

        constructor(value: number) {
          this.value = value;
        }

        then<TResult1 = number>(onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null) {
          return Promise.resolve<number>(this.value).then(onFulfilled);
        }
      }

      const finalResult: number = await Promise.resolve<number>(2)
        .then((v: number) => new Promise<number>((resolve) => setTimeout(() => resolve(v * 3), 10)))// Promise
        .then((v: number) => new SimpleThenable(v + 4))// Thenable
        .then((v: number) => new Promise<number>((resolve) => setTimeout(() => resolve(v / 2), 15)))// Promise
        .then((v: number) => new SimpleThenable(v * 5)); // Thenable

      expect(finalResult).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8000
     * @tc.name PromiseThenTest080
     * @tc.desc Multi-level then chain with sequential async validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validate = (val: number, min: number, ms: number): Promise<number> =>
      new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          if (val >= min) {
            resolve(val);
          } else {
            reject(`Value ${val} < ${min}`);
          }
        }, ms);
      });

      let validationLog: string[] = [];
      try {
        await Promise.resolve<number>(10)
          .then((v: number) => {
            validationLog.push(`Check ${v} >=5`);
            return validate(v, 5, 10);
          })
          .then((v: number) => {
            validationLog.push(`Check ${v} >=12`);
            return validate(v, 12, 15);
          })
          .then((v: number) => {
            validationLog.push(`Check ${v} >=8`);
            return validate(v, 8, 5);
          });
      } catch (err) {
        validationLog.push(err as string);
      }

      expect(validationLog).assertDeepEquals(['Check 10 >=5', 'Check 10 >=12', 'Value 10 < 12']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8100
     * @tc.name PromiseThenTest081
     * @tc.desc Deeply nested then with parallel async tasks in inner level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const taskResults: number[] = [];
      const task = (id: number, ms: number): Promise<number> =>
      new Promise<number>((resolve) => setTimeout(() => {
        taskResults.push(id);
        resolve(id);
      }, ms));

      const total: number = await Promise.resolve()
        .then(() => new Promise<number[]>((resolve) => {
          setTimeout(() => {
            resolve(Promise.all<number>([task(1, 20), task(2, 10), task(3, 15)]));
          }, 5);
        })
          .then((ids: number[]) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                resolve(ids.reduce((a, b) => a + b, 0));
              }, 10);
            });
          }));

      expect(taskResults).assertDeepEquals([2, 3, 1]);
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8200
     * @tc.name PromiseThenTest082
     * @tc.desc 3-level then chain with async error recovery and propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLog: string[] = [];

      await Promise.resolve()
        .then(() => new Promise<void>((_, reject) => setTimeout(() => reject('level1 error'), 10)))
        .then(
          () => {
          },
          (err: string) => {
            errorLog.push(err);
            return new Promise<void>((_, reject) => setTimeout(() => reject('level2 error'), 15));
          }
        )
        .then(
          () => {
          },
          (err: string) => {
            errorLog.push(err);
            return new Promise<void>((resolve) => setTimeout(() => resolve(), 10));
          }
        )
        .then(() => {
          errorLog.push('recovered');
        });

      expect(errorLog).assertDeepEquals(['level1 error', 'level2 error', 'recovered']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8300
     * @tc.name PromiseThenTest083
     * @tc.desc Multi-level then chain with type transformation at each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finalResult: boolean = await Promise.resolve<number>(123)
        .then((v: number) => new Promise<string>((resolve) => setTimeout(() => resolve(v.toString()),
          10)))// number→string
        .then((v: string) => new Promise<number>((resolve) => setTimeout(() => resolve(v.length), 15)))// string→number
        .then((v: number) => new Promise<boolean>((resolve) => setTimeout(() => resolve(v > 2), 10))); // number→boolean

      expect(finalResult).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8400
     * @tc.name PromiseThenTest084
     * @tc.desc Deep nested then with async initialization in outer level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let initValue = 0;
      const finalCalc: number = await Promise.resolve()
        .then(() => new Promise<number>((resolve) => {
          // Async initialization in outer level
          setTimeout(() => {
            initValue = 15;
            resolve(initValue);
          }, 20);
        })
          .then((v1: number) => new Promise<number>((resolve) => {
            setTimeout(() => resolve(v1 * 2 + initValue), 10);
          })
            .then((v2: number) => new Promise<number>((resolve) => {
              setTimeout(() => resolve(v2 - initValue / 3), 15);
            }))));

      expect(initValue).assertEqual(15);
      expect(finalCalc).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8500
     * @tc.name PromiseThenTest085
     * @tc.desc 4-level then chain with alternating rejection and fulfillment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chainLog: string[] = [];
      const delayFulfill = (val: string, ms: number): Promise<string> =>
      new Promise<string>((resolve) => setTimeout(() => resolve(val), ms));
      const delayReject = (msg: string, ms: number): Promise<never> =>
      new Promise<never>((_, reject) => setTimeout(() => reject(msg), ms));

      await delayFulfill('step1: fulfill', 10)
        .then((val: string) => {
          chainLog.push(val);
          return delayReject('step2: reject', 15);
        })
        .then(
          () => chainLog.push('step2: unreachable'),
          (err: string) => {
            chainLog.push(err);
            return delayFulfill('step3: fulfill', 10);
          }
        )
        .then((val: string | number) => {
          chainLog.push(val as string);
          return delayReject('step4: reject', 5);
        })
        .catch((err: string) => {
          chainLog.push(err);
        });

      expect(chainLog).assertDeepEquals(['step1: fulfill', 'step2: reject', 'step3: fulfill', 'step4: reject']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8600
     * @tc.name PromiseThenTest086
     * @tc.desc Multi-level then chain with nested Promise.all at intermediate level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parallelData: number[][] = [];
      const fetchChunk = (id: number, ms: number): Promise<number[]> =>
      new Promise<number[]>((resolve) => setTimeout(() => resolve([id, id * 2]), ms));

      const combinedResult: number[] = await Promise.resolve<number[]>([1, 2, 3])
        .then((ids: number[]) => new Promise<number[][]>((resolve) => {
          setTimeout(() => {
            const chunkPromises = ids.map((id, idx) => fetchChunk(id, idx * 10));
            resolve(Promise.all<number[]>(chunkPromises));
          }, 15);
        }))
        .then((chunks: number[][]) => {
          parallelData.push(...chunks);
          return chunks.flatMap(chunk => chunk);
        })
        .then((flattened: number[]) => flattened.filter(num => num % 2 === 0));

      expect(parallelData).assertDeepEquals([[1, 2], [2, 4], [3, 6]]);
      expect(combinedResult).assertDeepEquals([2, 2, 4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8700
     * @tc.name PromiseThenTest087
     * @tc.desc Deeply nested then with async cleanup in innermost level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resourceCleaned = false;
      const finalValue: string = await Promise.resolve<string>('init-data')
        .then((v1: string) => new Promise<string>((resolve) => {
          setTimeout(() => resolve(v1 + '-step1'), 10);
        })
          .then((v2: string) => new Promise<string>((resolve) => {
            setTimeout(() => resolve(v2 + '-step2'), 15);
          })
            .then((v3: string) => new Promise<string>((resolve) => {
              // Async cleanup in innermost level
              setTimeout(() => {
                resourceCleaned = true;
                resolve(v3 + '-final');
              }, 5);
            }))));

      expect(resourceCleaned).assertEqual(true);
      expect(finalValue).assertEqual('init-data-step1-step2-final');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8800
     * @tc.name PromiseThenTest088
     * @tc.desc 3-level then chain with thenable rejection propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RejectThenable implements PromiseLike<void> {
        private msg: string;
        private delay: number;

        constructor(msg: string, delay: number) {
          this.msg = msg;
          this.delay = delay;
        }

        then<TResult1 = void, TResult2 = never>(
          _onFulfilled?: ((value: void) => TResult1 | PromiseLike<TResult1>) | null,
          onRejected?: ((reason: string) => TResult2 | PromiseLike<TResult2>) | null
        ): PromiseLike<TResult1 | TResult2> {
          return new Promise<TResult1 | TResult2>((_, reject) => {
            setTimeout(() => onRejected!(this.msg), this.delay);
          });
        }
      }

      let caughtMsg = '';
      await Promise.resolve()
        .then(() => new RejectThenable('level1 thenable reject', 10))
        .then(
          () => {
          },
          (err: string) => {
            caughtMsg = err;
            return new RejectThenable('level2 thenable reject', 15);
          }
        )
        .catch((err: string) => {
          caughtMsg += '|' + err;
        });

      expect(caughtMsg).assertEqual('level1 thenable reject|level2 thenable reject');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_8900
     * @tc.name PromiseThenTest089
     * @tc.desc Multi-level then chain with async value accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let accumulator = 0;
      const addAsync = (val: number, ms: number): Promise<number> =>
      new Promise<number>((resolve) => setTimeout(() => {
        accumulator += val;
        resolve(accumulator);
      }, ms));

      const finalAccumulator: number = await addAsync(5, 10)
        .then((v: number) => {
          expect(v).assertEqual(5);
          return addAsync(10, 15);
        })
        .then((v: number) => {
          expect(v).assertEqual(15);
          return addAsync(8, 5);
        })
        .then((v: number) => {
          expect(v).assertEqual(23);
          return addAsync(12, 20);
        });

      expect(accumulator).assertEqual(35);
      expect(finalAccumulator).assertEqual(35);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9000
     * @tc.name PromiseThenTest090
     * @tc.desc Deep nested then with parallel async tasks and sequential finalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const taskLog: string[] = [];
      const workerTask = (name: string, ms: number): Promise<string> =>
      new Promise<string>((resolve) => setTimeout(() => {
        taskLog.push(`worker: ${name}`);
        resolve(name);
      }, ms));

      const finalLog: string[] = await Promise.resolve()
        .then(() => new Promise<string[]>((resolve) => {
          // Parallel tasks in nested level
          setTimeout(() => {
            resolve(Promise.all<string>([
              workerTask('A', 20),
              workerTask('B', 10),
              workerTask('C', 15)
            ]));
          }, 5);
        })
          .then((workerNames: string[]) => new Promise<string[]>((resolve) => {
            // Sequential finalization
            const finalTasks = workerNames.map((name, idx) =>
            new Promise<string>((res) => setTimeout(() => res(`final: ${name}`), idx * 10))
            );
            resolve(Promise.all<string>(finalTasks));
          })));

      expect(taskLog).assertDeepEquals(['worker: B', 'worker: C', 'worker: A']);
      expect(finalLog).assertDeepEquals(['final: A', 'final: B', 'final: C']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9100
     * @tc.name PromiseThenTest091
     * @tc.desc 3-level nested then with staggered timers maintains execution sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionOrder: string[] = [];

      await Promise.resolve()
        .then(() => new Promise<void>((resolve) => {
          setTimeout(() => {
            executionOrder.push('level1');
            resolve();
          }, 30);
        })
          .then(() => new Promise<void>((resolve) => {
            setTimeout(() => {
              executionOrder.push('level2');
              resolve();
            }, 10);
          })
            .then(() => new Promise<void>((resolve) => {
              setTimeout(() => {
                executionOrder.push('level3');
                resolve();
              }, 20);
            }))));

      expect(executionOrder).assertDeepEquals(['level1', 'level2', 'level3']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9200
     * @tc.name PromiseThenTest092
     * @tc.desc 链式调用中定时器任务与同步回调的时序协同
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];
      const delay = (msg: string, ms: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        log.push(msg);
        resolve();
      }, ms));

      await Promise.resolve()
        .then(() => log.push('sync1'))
        .then(() => delay('async1', 20))
        .then(() => log.push('sync2'))
        .then(() => delay('async2', 10))
        .then(() => log.push('sync3'));

      expect(log).assertDeepEquals(['sync1', 'async1', 'sync2', 'async2', 'sync3']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9300
     * @tc.name PromiseThenTest093
     * @tc.desc 嵌套then中并行定时器任务与外层链式调用的时序关系
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];
      const parallelTask = (msg: string, ms: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        log.push(msg);
        resolve();
      }, ms));

      await Promise.resolve()
        .then(() => {
          log.push('outer-start');
          // 嵌套并行任务
          const tasks = [parallelTask('parallel1', 15), parallelTask('parallel2', 5)];
          return Promise.all<void>(tasks);
        })
        .then(() => {
          log.push('outer-middle');
          return parallelTask('outer-async', 10);
        })
        .then(() => log.push('outer-end'));

      expect(log)
        .assertDeepEquals(['outer-start', 'parallel2', 'parallel1', 'outer-middle', 'outer-async', 'outer-end']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9400
     * @tc.name PromiseThenTest094
     * @tc.desc 链式调用中定时器驱动的错误传播与异步恢复
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const errorLog: string[] = [];
      const delayReject = (msg: string, ms: number): Promise<never> =>
      new Promise<never>((_, reject) => setTimeout(() => reject(msg), ms));
      const delayResolve = (msg: string, ms: number): Promise<string> =>
      new Promise<string>((resolve) => setTimeout(() => resolve(msg), ms));

      const result: string = await delayResolve('init', 5)
        .then((val) => {
          errorLog.push(val);
          return delayReject('timer-error', 15);
        })
        .catch((err: string) => {
          errorLog.push(err);
          return delayResolve('recovered', 10);
        })
        .then((val) => {
          errorLog.push(val);
          return `${val}-final`;
        });

      expect(errorLog).assertDeepEquals(['init', 'timer-error', 'recovered']);
      expect(result).assertEqual('recovered-final');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9500
     * @tc.name PromiseThenTest095
     * @tc.desc 多层嵌套then中定时器任务的value跨级传递
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rootValue = 0;
      const finalValue: number = await Promise.resolve<number>(10)
        .then((v1) => {
          rootValue = v1;
          return new Promise<number>((resolve) => setTimeout(() => resolve(v1 * 2), 20));
        })
        .then((v2) => new Promise<number>((resolve) => {
          setTimeout(() => {
            // 引用外层初始值进行计算
            resolve(v2 + rootValue * 3);
          }, 10);
        })
          .then((v3) => new Promise<number>((resolve) => {
            setTimeout(() => resolve(v3 / rootValue), 15);
          })));

      expect(rootValue).assertEqual(10);
      expect(finalValue).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9600
     * @tc.name PromiseThenTest096
     * @tc.desc 链式调用中不同延迟的定时器任务执行顺序验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const executionLog: number[] = [];
      const timedTask = (id: number, ms: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        executionLog.push(id);
        resolve();
      }, ms));

      // 链式调用不同延迟的任务
      await timedTask(1, 40)
        .then(() => timedTask(2, 10))
        .then(() => timedTask(3, 20))
        .then(() => timedTask(4, 5));

      expect(executionLog).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9700
     * @tc.name PromiseThenTest097
     * @tc.desc 嵌套then与并行定时器任务的混合时序控制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];
      const task = (label: string, ms: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        log.push(label);
        resolve();
      }, ms));

      await Promise.resolve()
        .then(() => {
          // 外层嵌套并行任务
          return Promise.all<void>([task('parallel-a', 15), task('parallel-b', 5)]);
        })
        .then(() => new Promise<void>((resolve) => {
          // 中层嵌套串行任务
          task('nested-1', 10)
            .then(() => task('nested-2', 5))
            .then(resolve);
        }))
        .then(() => task('final', 20));

      expect(log).assertDeepEquals(['parallel-b', 'parallel-a', 'nested-1', 'nested-2', 'final']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9800
     * @tc.name PromiseThenTest098
     * @tc.desc 链式调用中定时器驱动的thenable解析时序
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class TimedThenable implements PromiseLike<number> {
        private value: number;
        private delay: number;

        constructor(value: number, delay: number) {
          this.value = value;
          this.delay = delay;
        }

        then<TResult1 = number>(onFulfilled?: ((value: number) => TResult1 | PromiseLike<TResult1>) | null) {
          return new Promise<TResult1>((resolve) => {
            setTimeout(() => {
              const resolvedVal = this.value * 2;
              resolve(onFulfilled ? onFulfilled(resolvedVal) : resolvedVal as TResult1);
            }, this.delay);
          });
        }
      }

      const resultLog: number[] = [];
      await Promise.resolve<TimedThenable>(new TimedThenable(3, 10))
        .then((val) => {
          resultLog.push(val);
          return new TimedThenable(val, 15);
        })
        .then((val) => {
          resultLog.push(val);
          return new TimedThenable(val, 5);
        })
        .then((val) => resultLog.push(val));

      expect(resultLog).assertDeepEquals([6, 12, 24]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_9900
     * @tc.name PromiseThenTest099
     * @tc.desc 多层嵌套then中定时器错误的跨级捕获
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let errorStack = '';
      const delayedReject = (msg: string, ms: number): Promise<void> =>
      new Promise<void>((_, reject) => setTimeout(() => reject(new Error(msg)), ms));

      await Promise.resolve()
        .then(() => new Promise<void>((resolve) => {
          setTimeout(() => resolve(), 5);
        })
          .then(() => new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(delayedReject('nested-timer-error', 10));
            }, 15);
          })
            .then()))
        .catch((err: Error) => {
          errorStack = err.message;
          return delayedReject('outer-timer-error', 5);
        })
        .catch((err: Error) => {
          errorStack += '|' + err.message;
        });

      expect(errorStack).assertEqual('nested-timer-error|outer-timer-error');
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_THEN_TEST_10000
     * @tc.name PromiseThenTest100
     * @tc.desc 链式调用与嵌套定时器的复杂时序综合验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finalLog: string[] = [];
      const addLog = (msg: string, ms: number): Promise<void> =>
      new Promise<void>((resolve) => setTimeout(() => {
        finalLog.push(msg);
        resolve();
      }, ms));

      await addLog('chain-1', 25)
        .then(() => {
          // 嵌套并行+串行混合任务
          return Promise.all<void>([
            addLog('parallel-1', 10),
            addLog('parallel-2', 5).then(() => addLog('serial-after-parallel2', 15))
          ]);
        })
        .then(() => addLog('chain-2', 10))
        .then(() => new Promise<void>((resolve) => {
          addLog('nested-1', 5)
            .then(() => addLog('nested-2', 20))
            .then(resolve);
        }))
        .then(() => addLog('chain-3', 5));

      expect(finalLog).assertDeepEquals([
        'chain-1', 'parallel-2', 'parallel-1', 'serial-after-parallel2',
        'chain-2', 'nested-1', 'nested-2', 'chain-3'
      ]);
    });
  })
}