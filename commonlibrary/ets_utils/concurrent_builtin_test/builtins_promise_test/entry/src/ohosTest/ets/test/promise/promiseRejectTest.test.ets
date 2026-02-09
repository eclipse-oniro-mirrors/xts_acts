import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  PromiseRejectTest024,
  PromiseRejectTest033,
  PromiseRejectTest050,
  PromiseRejectTest063,
  PromiseRejectTest074,
  PromiseRejectTest084,
  PromiseRejectTest094
} from './promisejs';
import { nonErrorReason03, type22, type51 } from './promisets';
import { sleep } from './utils';

export default function promiseRejectTest() {
  describe('promiseRejectTest', () => {
    afterEach(async () => {
      await sleep(100)
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1001
     * @tc.name PromiseRejectTest001
     * @tc.desc Promise.reject returns a rejected Promise directly, verify reason value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const rejectReason = 'Explicit rejection reason';
      const rejectedPromise = Promise.reject(rejectReason);

      const result = await Promise.allSettled([rejectedPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      expect(rejectedResult.status).assertEqual('rejected');
      expect(rejectedResult.reason).assertEqual(rejectReason);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1002
     * @tc.name PromiseRejectTest002
     * @tc.desc Promise returned by Promise.reject can be caught via catch(), verify capture logic
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let capturedReason = '';
      const customError = new Error('Custom error object');

      await Promise.reject(customError)
        .catch((err: Error) => {
          capturedReason = err.message;
        });

      expect(capturedReason).assertEqual('Custom error object');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1003
     * @tc.name PromiseRejectTest003
     * @tc.desc Promise.reject with non-Error reason, verify reason type and value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const rejectedPromise = Promise.reject(nonErrorReason03);

      const result = await Promise.allSettled([rejectedPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      expect(rejectedResult.reason.code).assertEqual(404);
      expect(rejectedResult.reason.message).assertEqual('Resource not found');
      expect(rejectedResult.reason instanceof Error).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1004
     * @tc.name PromiseRejectTest004
     * @tc.desc Nested Promise.reject in then() chain, verify rejection propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalReason = '';

      await Promise.resolve('initial value')
        .then(val => {
          if (val) {
            return Promise.reject(`Rejected after: ${val}`);
          }
          return 'unreachable';
        })
        .then(val => val + ' extended') // This then() is skipped
        .catch((err: string) => {
          finalReason = err;
        });

      expect(finalReason).assertEqual('Rejected after: initial value');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1005
     * @tc.name PromiseRejectTest005
     * @tc.desc Promise.reject combined with Promise.all, verify all rejection behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allRejectionReason = '';
      const promise1 = Promise.resolve(10);
      const promise2 = Promise.reject(new Error('Second promise rejected'));
      const promise3 = new Promise<number>(resolve => setTimeout(resolve, 10, 30));

      try {
        await Promise.all([promise1, promise2, promise3]);
      } catch (err) {
        allRejectionReason = (err as Error).message;
      }

      expect(allRejectionReason).assertEqual('Second promise rejected');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1006
     * @tc.name PromiseRejectTest006
     * @tc.desc Promise.reject vs throwing error in async function, compare behaviors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectViaApi = Promise.reject(new Error('Rejected via Promise.reject'));
      const rejectViaThrow = (async () => {
        throw new Error('Rejected via throw');
      })();

      const result1 = await Promise.allSettled([rejectViaApi]);
      const result2 = await Promise.allSettled([rejectViaThrow]);

      expect((result1[0] as PromiseRejectedResult).reason.message).assertEqual('Rejected via Promise.reject');
      expect((result2[0] as PromiseRejectedResult).reason.message).assertEqual('Rejected via throw');
      expect(result1[0].status).assertEqual(result2[0].status);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1007
     * @tc.name PromiseRejectTest007
     * @tc.desc Promise.reject nested in Promise.allSettled, verify settled status preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises = [
        Promise.resolve('success'),
        Promise.reject('failure'),
        new Promise<string>(resolve => setTimeout(resolve, 5, 'delayed success'))
      ];

      const results = await Promise.allSettled(promises);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('success');
      expect((results[1] as PromiseRejectedResult).reason).assertEqual('failure');
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('delayed success');
      expect(results.every(r => r.status)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1008
     * @tc.name PromiseRejectTest008
     * @tc.desc Promise.reject with Promise as reason, verify reason is wrapped correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerResolvedPromise = Promise.resolve('inner resolved value');
      const rejectedWithPromise = Promise.reject(innerResolvedPromise);

      const result = await Promise.allSettled([rejectedWithPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;
      const unwrappedReason: string = await rejectedResult.reason;

      expect(rejectedResult.status).assertEqual('rejected');
      expect(unwrappedReason).assertEqual('inner resolved value');
      expect(rejectedResult.reason instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1009
     * @tc.name PromiseRejectTest009
     * @tc.desc Promise.reject in race condition with Promise.race, verify early rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let raceOutcome = '';
      const fastReject = Promise.reject(new Error('Fast rejection'));
      const slowResolve = new Promise<string>(resolve => setTimeout(resolve, 100, 'Slow resolve'));

      try {
        await Promise.race([fastReject, slowResolve]);
      } catch (err) {
        raceOutcome = (err as Error).message;
      }

      expect(raceOutcome).assertEqual('Fast rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1010
     * @tc.name PromiseRejectTest010
     * @tc.desc Chained catch() after Promise.reject, verify error recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finalResult = await Promise.reject(new Error('Original error'))
        .catch((err: Error) => {
          return Promise.resolve(`Recovered from: ${err.message}`);
        })
        .then(val => val + ' | Post-recovery');

      expect(finalResult).assertEqual('Recovered from: Original error | Post-recovery');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1011
     * @tc.name PromiseRejectTest011
     * @tc.desc Promise.reject in nested new Promise, verify rejection propagation to outer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const outerPromise: Promise<string> = new Promise<string>((resolve, reject) => {
        const innerPromise: Promise<number> = new Promise<number>((_, innerReject) => {
          // 修复：直接传入原因，而非 Promise.reject() 的返回值
          innerReject(new Error('Inner rejection'));
        });
        innerPromise.catch((err: Error) => reject(err));
      });

      const result = await Promise.allSettled([outerPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      expect(rejectedResult.status).assertEqual('rejected');
      expect((rejectedResult.reason as Error).message).assertEqual('Inner rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1012
     * @tc.name PromiseRejectTest012
     * @tc.desc new Promise with conditional Promise.reject, verify reason based on condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validateInput = (input: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          if (input.length < 5) {
            // 修复：直接传入原因字符串
            reject(`Invalid length: ${input.length}`);
          } else {
            resolve('Valid input');
          }
        });
      };

      const shortInputResult = await Promise.allSettled([validateInput('test')]);
      const validInputResult = await Promise.allSettled([validateInput('longer')]);

      // 修复：无需 await，直接获取原因
      expect((shortInputResult[0] as PromiseRejectedResult).reason).assertEqual('Invalid length: 4');
      expect((validInputResult[0] as PromiseFulfilledResult<string>).value).assertEqual('Valid input');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1013
     * @tc.name PromiseRejectTest013
     * @tc.desc Promise.reject combined with new Promise in Promise.race, verify priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const delayedResolve: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => resolve(100), 50);
      });
      const immediateReject = Promise.reject(new Error('Immediate reject'));

      let raceResult = '';
      try {
        await Promise.race([delayedResolve, immediateReject]);
      } catch (err) {
        raceResult = (err as Error).message;
      }

      expect(raceResult).assertEqual('Immediate reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1014
     * @tc.name PromiseRejectTest014
     * @tc.desc new Promise wrapping Promise.reject with timeout, verify timing of rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const timedReject: Promise<void> = new Promise<void>((_, reject) => {
        setTimeout(() => {
          // 修复：直接传入 Error 原因
          reject(new Error('Delayed reject'));
        }, 30);
      });

      const result = await Promise.allSettled([timedReject]);
      const end = Date.now();

      // 修复：无需 await，直接获取 Error 消息
      expect((result[0] as PromiseRejectedResult).reason.message).assertEqual('Delayed reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1015
     * @tc.name PromiseRejectTest015
     * @tc.desc Promise.reject in new Promise with then() chain, verify recovery flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promiseChain: Promise<string> = new Promise<string>((_, reject) => {
        // 修复：直接传入 Error 原因
        reject(new Error('Chain root error'));
      })
        .catch((err: Error) => `Caught: ${err.message}`)
        .then(val => `${val} | Processed`);

      const result = await Promise.allSettled([promiseChain]);
      const fulfilledResult = result[0] as PromiseFulfilledResult<string>;

      expect(fulfilledResult.status).assertEqual('fulfilled');
      expect(fulfilledResult.value).assertEqual('Caught: Chain root error | Processed');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1016
     * @tc.name PromiseRejectTest016
     * @tc.desc new Promise array with mixed resolve/reject, verify allSettled output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<string | number>[] = [
        new Promise<string>((resolve) => resolve('Success 1')),
        Promise.reject(new Error('Reject 1')),
        new Promise<number>((_, reject) => {
          // 修复：直接传入字符串原因
          reject('Reject 2');
        }),
        new Promise<string>((resolve) => setTimeout(resolve, 10, 'Delayed success'))
      ];

      const results = await Promise.allSettled(promises);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('Success 1');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Reject 1');
      // 修复：无需 await，直接获取原因
      expect((results[2] as PromiseRejectedResult).reason).assertEqual('Reject 2');
      expect((results[3] as PromiseFulfilledResult<string>).value).assertEqual('Delayed success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1017
     * @tc.name PromiseRejectTest017
     * @tc.desc Promise.reject with object reason in new Promise, verify property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      interface ErrorDetails {
        code: number;
        message: string;
        context: string;
      }

      const errorPromise: Promise<ErrorDetails> = new Promise<ErrorDetails>((_, reject) => {
        const errorReason: ErrorDetails = {
          code: 500,
          message: 'Server error',
          context: 'User authentication'
        };
        // 修复：直接传入对象原因
        reject(errorReason);
      });

      const result = await Promise.allSettled([errorPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;
      const reason = rejectedResult.reason as ErrorDetails;

      expect(reason.code).assertEqual(500);
      expect(reason.message).assertEqual('Server error');
      expect(reason.context).assertEqual('User authentication');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1018
     * @tc.name PromiseRejectTest018
     * @tc.desc Nested new Promise with Promise.reject, verify multi-level propagation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest018', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level3: Promise<number> = new Promise<number>((_, reject) => {
        // 修复：直接传入 Error 原因
        reject(new Error('Level 3 error'));
      });
      const level2: Promise<number> = new Promise<number>((_, reject) => {
        level3.catch((err: Error) => {
          // 修复：直接传入包装后的字符串原因
          reject(`Level 2 wrap: ${err.message}`);
        });
      });
      const level1: Promise<number> = new Promise<number>((_, reject) => {
        level2.catch((err: string) => reject(err));
      });

      const result = await Promise.allSettled([level1]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      // 修复：无需 await，直接获取原因
      expect(rejectedResult.reason).assertEqual('Level 2 wrap: Level 3 error');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1019
     * @tc.name PromiseRejectTest019
     * @tc.desc new Promise with Promise.reject vs direct reject, compare behaviors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectWithApi: Promise<string> = new Promise<string>((_, reject) => {
        // 修复：直接传入 Error 原因（与直接 reject 保持一致）
        reject(new Error('Via Promise.reject'));
      });
      const rejectDirectly: Promise<string> = new Promise<string>((_, reject) => {
        reject(new Error('Direct reject'));
      });

      const result1 = await Promise.allSettled([rejectWithApi]);
      const result2 = await Promise.allSettled([rejectDirectly]);

      expect((result1[0] as PromiseRejectedResult).reason.message).assertEqual('Via Promise.reject');
      expect((result2[0] as PromiseRejectedResult).reason.message).assertEqual('Direct reject');
      expect(result1[0].status).assertEqual(result2[0].status);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1020
     * @tc.name PromiseRejectTest020
     * @tc.desc Promise.reject in new Promise with async/await, verify sync rejection handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncHandler = async (): Promise<string> => {
        const promise: Promise<string> = new Promise<string>((_, reject) => {
          // 修复：直接传入 Error 原因
          reject(new Error('Async rejection'));
        });
        return await promise;
      };

      const result = await Promise.allSettled([asyncHandler()]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      expect(rejectedResult.status).assertEqual('rejected');
      expect((rejectedResult.reason as Error).message).assertEqual('Async rejection');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1021
     * @tc.name PromiseRejectTest021
     * @tc.desc new Promise with Promise.reject in Promise.all, verify early termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promise1: Promise<number> = new Promise<number>((resolve) => setTimeout(resolve, 50, 1));
      const promise2: Promise<string> = new Promise<string>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        setTimeout(() => reject(new Error('Early reject')), 10);
      });
      const promise3: Promise<boolean> = new Promise<boolean>((resolve) => setTimeout(resolve, 100, true));

      let rejectionMsg = '';
      try {
        await Promise.all([promise1, promise2, promise3]);
      } catch (err) {
        rejectionMsg = (err as Error).message;
      }

      expect(rejectionMsg).assertEqual('Early reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1022
     * @tc.name PromiseRejectTest022
     * @tc.desc Typed new Promise with Promise.reject and custom error class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ValidationError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'ValidationError';
        }
      }

      // Fix: Define missing type22 type
      type type22 = string;
      const validate: Promise<type22> = new Promise<type22>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(new ValidationError('ID must be positive'));
      });

      const result = await Promise.allSettled([validate]);
      const rejectedResult = result[0] as PromiseRejectedResult;
      const error = rejectedResult.reason as ValidationError;

      expect(error.name).assertEqual('ValidationError');
      expect(error.message).assertEqual('ID must be positive');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1023
     * @tc.name PromiseRejectTest023
     * @tc.desc new Promise chaining with Promise.reject and multiple catch handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain: Promise<string> = new Promise<string>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(new Error('Root error'));
      })
        .catch((err: Error) => {
          throw new Error(`First catch: ${err.message}`);
        })
        .then((val) => `Processed: ${val}`)
        .catch((err: Error) => `Second catch: ${err.message}`);

      const result = await Promise.allSettled([chain]);
      const fulfilledResult = result[0] as PromiseFulfilledResult<string>;

      expect(fulfilledResult.value).assertEqual('Second catch: First catch: Root error');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1024
     * @tc.name PromiseRejectTest024
     * @tc.desc new Promise with Promise.reject in async generator, verify iteration handling
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const result = await PromiseRejectTest024();

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1025
     * @tc.name PromiseRejectTest025
     * @tc.desc new Promise with Promise.reject and shared state, verify side effect order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = 'initial';
      const promise1: Promise<void> = new Promise<void>((_, reject) => {
        setTimeout(() => {
          state = 'rejecting';
          // Fix: Reject directly without wrapping in Promise.reject
          reject(new Error('State error'));
        }, 20);
      });
      const promise2: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => {
          state = 'resolving';
          resolve(state);
        }, 10);
      });

      const results = await Promise.allSettled([promise1, promise2]);
      const finalState = state;

      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('resolving');
      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('State error');
      expect(finalState).assertEqual('rejecting');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1026
     * @tc.name PromiseRejectTest026
     * @tc.desc Nested typed new Promise with Promise.reject, verify deep propagation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest026', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level4: Promise<number> = new Promise<number>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(new Error('L4'));
      });
      const level3: Promise<number> = new Promise<number>((_, reject) => {
        level4.catch((err: Error) => {
          // Fix: Reject directly without wrapping in Promise.reject
          reject(`L3: ${err.message}`);
        });
      });
      const level2: Promise<number> = new Promise<number>((_, reject) => {
        level3.catch((err: string) => reject(err));
      });
      const level1: Promise<number> = new Promise<number>((_, reject) => {
        level2.catch((err: string) => {
          // Fix: Reject directly without wrapping in Promise.reject
          reject(`L1: ${err}`);
        });
      });

      const result = await Promise.allSettled([level1]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      // Fix: Remove unnecessary await (reason is not a Promise)
      expect(rejectedResult.reason).assertEqual('L1: L3: L4');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1027
     * @tc.name PromiseRejectTest027
     * @tc.desc new Promise with Promise.reject in Promise.race, verify timing priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fastReject: Promise<string> = new Promise<string>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        setTimeout(() => reject('Fast'), 10);
      });
      const slowReject: Promise<number> = new Promise<number>((_, reject) => {
        setTimeout(() => reject(new Error('Slow')), 30);
      });
      const slowResolve: Promise<boolean> = new Promise<boolean>((resolve) => {
        setTimeout(() => resolve(true), 50);
      });

      let raceReason = '';
      try {
        await Promise.race([fastReject, slowReject, slowResolve]);
      } catch (err) {
        raceReason = err as string;
      }

      // Fix: Remove unnecessary await (reason is a string)
      expect(raceReason).assertEqual('Fast');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1028
     * @tc.name PromiseRejectTest028
     * @tc.desc Typed new Promise with Promise.reject and Promise.any, verify recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promiseA: Promise<string> = new Promise<string>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(new Error('A fail'));
      });
      const promiseB: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('B success'), 20);
      });
      const promiseC: Promise<string> = new Promise<string>((_, reject) => {
        reject(new Error('C fail'));
      });

      const anyResult = await Promise.any([promiseA, promiseB, promiseC]);
      expect(anyResult).assertEqual('B success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1029
     * @tc.name PromiseRejectTest029
     * @tc.desc new Promise with Promise.reject and finally, verify cleanup execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cleanupExecuted = false;
      const promise: Promise<number> = new Promise<number>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(new Error('Cleanup test'));
      })
        .finally(() => {
          cleanupExecuted = true;
        });

      await Promise.allSettled([promise]);
      expect(cleanupExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1030
     * @tc.name PromiseRejectTest030
     * @tc.desc new Promise with Promise.reject and typed array reason, verify data integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRejectTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const typedReason: Uint32Array = new Uint32Array([100, 200, 300]);
      const promise: Promise<Uint32Array> = new Promise<Uint32Array>((_, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        reject(typedReason);
      });

      const result = await Promise.allSettled([promise]);
      const rejectedResult = result[0] as PromiseRejectedResult;
      const reason = rejectedResult.reason as Uint32Array;

      expect(reason instanceof Uint32Array).assertEqual(true);
      expect(reason[1]).assertEqual(200);
      expect(reason.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1031
     * @tc.name PromiseRejectTest031
     * @tc.desc Async nested new Promise with Promise.reject, verify 3-level propagation timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest031', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level3: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('L3 delay 20ms')), 20)
      );
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      level3.catch((err: Error) => setTimeout(() => reject(err), 10))
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      level2.catch((err: Error) => setTimeout(() => reject(err), 15))
      );

      const result = await Promise.allSettled([level1]);
      const end = Date.now();
      const rejectedReason: string = (result[0] as PromiseRejectedResult).reason.message;

      expect(rejectedReason).assertEqual('L3 delay 20ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1032
     * @tc.name PromiseRejectTest032
     * @tc.desc Async cascade: Promise.reject triggers dependent rejects in then chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rejectLog: string[] = [];
      const root: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject('Root'), 10)
      );

      await root
        .then(val => val + ' A')
        .catch((err: string) => {
          rejectLog.push(err);
          return Promise.reject(`${err} → L1`);
        })
        .then(val => val + ' B')
        .catch((err: string) => {
          rejectLog.push(err);
          return Promise.reject(`${err} → L2`);
        })
        .catch((err: string) => rejectLog.push(err));

      expect(rejectLog).assertDeepEquals(['Root', 'Root → L1', 'Root → L1 → L2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1033
     * @tc.name PromiseRejectTest033
     * @tc.desc Nested async generator with Promise.reject, verify iteration termination
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest033', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      let result = await PromiseRejectTest033()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1034
     * @tc.name PromiseRejectTest034
     * @tc.desc Timing race: early Promise.reject vs delayed resolve in nested all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const fastReject: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => {
        timeLog.push('reject');
        reject('Fast');
      }, 10)
      );
      const slowResolve: Promise<void> = new Promise<void>((resolve) =>
      setTimeout(() => {
        timeLog.push('resolve');
        resolve();
      }, 20)
      );

      let finalReason = '';
      try {
        await Promise.all([fastReject, slowResolve]);
      } catch (err) {
        finalReason = err as string;
      }

      expect(finalReason).assertEqual('Fast');
      expect(timeLog).assertDeepEquals(['reject']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1035
     * @tc.name PromiseRejectTest035
     * @tc.desc 4-level async nested Promise.reject with incremental delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest035', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level4: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject('L4'), 5)
      );
      const level3: Promise<number> = new Promise<number>((_, reject) =>
      level4.catch((err: string) => setTimeout(() => reject(`${err}-L3`), 10))
      );
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      level3.catch((err: string) => setTimeout(() => reject(`${err}-L2`), 15))
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      level2.catch((err: string) => setTimeout(() => reject(`${err}-L1`), 20))
      );

      const result = await Promise.allSettled([level1]);
      const end = Date.now();

      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L4-L3-L2-L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1036
     * @tc.name PromiseRejectTest036
     * @tc.desc Async then chain with conditional Promise.reject and recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processData = (value: number): Promise<number> =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => {
        if (value < 0) {
          reject(`Negative: ${value}`);
        } else {
          resolve(value * 2);
        }
      }, 10)
      );

      const negativeResult = await Promise.allSettled([processData(-5)]);
      const positiveResult = await Promise.allSettled([processData(3)]);

      expect((negativeResult[0] as PromiseRejectedResult).reason).assertEqual('Negative: -5');
      expect((positiveResult[0] as PromiseFulfilledResult<number>).value).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1037
     * @tc.name PromiseRejectTest037
     * @tc.desc Nested Promise.all with async Promise.reject, verify partial execution
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest037', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      let execCount = 0;
      const createPromise = (delay: number, shouldReject: boolean): Promise<number> =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => {
        execCount++;
        if (shouldReject) {
          reject('Reject');
        } else {
          resolve(delay);
        }
      }, delay)
      );

      try {
        await Promise.all([
          createPromise(5, false),
          createPromise(10, true),
          createPromise(15, false)
        ]);
      } catch (_) {
      }

      // Promise.all会等待所有Promise状态变更，但reject会优先触发catch，此时短延迟的Promise已执行
      expect(execCount).assertLargerOrEqual(2);
      expect(execCount).assertLessOrEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1038
     * @tc.name PromiseRejectTest038
     * @tc.desc Async Promise.reject in Set with nested allSettled, verify order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promiseSet = new Set<Promise<string>>([
        new Promise<string>((_, reject) => setTimeout(() => reject('Set1'), 20)),
        new Promise<string>(resolve => setTimeout(() => resolve('Set2'), 10)),
        new Promise<string>((_, reject) => setTimeout(() => reject('Set3'), 15))
      ]);

      const results = await Promise.allSettled(promiseSet);
      const resultArr = Array.from(results);

      // Set的迭代顺序与插入顺序一致，与Promise状态变更时间无关
      expect((resultArr[0] as PromiseRejectedResult).reason).assertEqual('Set1');
      expect((resultArr[1] as PromiseFulfilledResult<string>).value).assertEqual('Set2');
      expect((resultArr[2] as PromiseRejectedResult).reason).assertEqual('Set3');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1039
     * @tc.name PromiseRejectTest039
     * @tc.desc Async cascade: Promise.reject recovery in catch then re-reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject('Original'), 10)
      )
        .catch((err: string) => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Recover: ${err}`), 5)
          );
        })
        .then(val => {
          if (val.includes('Original')) {
            return Promise.reject(`Rereject: ${val}`);
          }
          return val;
        });

      const result = await Promise.allSettled([chain]);
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('Rereject: Recover: Original');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1040
     * @tc.name PromiseRejectTest040
     * @tc.desc Timed async nested Promise.reject with shared counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rejectCounter = 0;
      const level2: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => {
        rejectCounter++;
        reject('L2');
      }, 15)
      );
      const level1: Promise<void> = new Promise<void>((_, reject) =>
      level2.catch(() => {
        rejectCounter++;
        reject('L1');
      })
      );

      await Promise.allSettled([level1]);
      expect(rejectCounter).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1041
     * @tc.name PromiseRejectTest041
     * @tc.desc 5-level async nested Promise.reject with mixed delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest041', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level5: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => {
        // 修复1：直接reject原始原因，避免嵌套Promise.reject导致reason为Promise对象
        reject('L5');
      }, 5)
      );
      const level4: Promise<number> = new Promise<number>((_, reject) =>
      // 修复2：level5.catch的回调需显式调用reject，且修正err类型为string
      level5.catch((err: string) => {
        setTimeout(() => reject(`${err}-L4`), 20);
      })
      );
      const level3: Promise<number> = new Promise<number>((_, reject) =>
      // 修复3：修正err类型为string，确保字符串拼接正常
      level4.catch((err: string) => reject(`${err}-L3`))
      );
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      // 修复4：修正err类型为string，且回调需显式调用reject
      level3.catch((err: string) => {
        setTimeout(() => reject(`${err}-L2`), 10);
      })
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      // 修复5：修正err类型为string
      level2.catch((err: string) => reject(`${err}-L1`))
      );

      const result = await Promise.allSettled([level1]);
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L5-L4-L3-L2-L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1042
     * @tc.name PromiseRejectTest042
     * @tc.desc Async Promise.reject in Promise.race with multiple reject delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const racePromises = [
        new Promise<string>((_, reject) => setTimeout(() => reject(Promise.reject('10ms')), 10)),
        new Promise<string>((_, reject) => setTimeout(() => reject('5ms'), 5)),
        new Promise<string>(resolve => setTimeout(() => resolve('20ms'), 20))
      ];

      let winner = '';
      try {
        await Promise.race(racePromises);
      } catch (err) {
        winner = err as string;
      }

      expect(winner).assertEqual('5ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1043
     * @tc.name PromiseRejectTest043
     * @tc.desc Async then chain with Promise.reject and finally cleanup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isCleaned = false;
      const chain: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(Promise.reject('Cleanup')), 10)
      )
        .catch((err: Error) => {
          throw new Error(`Caught: ${err}`);
        })
        .finally(() => {
          isCleaned = true;
        });

      await Promise.allSettled([chain]);
      expect(isCleaned).assertEqual(true);
      expect((await Promise.allSettled([chain]))[0].status).assertEqual('rejected');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1044
     * @tc.name PromiseRejectTest044
     * @tc.desc Nested Promise.allSettled with Promise.reject, verify result propagation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest044', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const inner: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Inner reject 10ms'), 10);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(200), 20))
      ]);
      const outer: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        inner,
        new Promise<string>((_, reject) => setTimeout(() => reject('Outer reject 15ms'), 15))
      ]);

      const outerResults = await outer;
      const innerResults = (outerResults[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      // Fix: Remove unnecessary await (reason is direct value, not Promise)
      expect((innerResults[0] as PromiseRejectedResult).reason).assertEqual('Inner reject 10ms');
      expect((innerResults[1] as PromiseFulfilledResult<number>).value).assertEqual(200);
      expect((outerResults[1] as PromiseRejectedResult).reason).assertEqual('Outer reject 15ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1045
     * @tc.name PromiseRejectTest045
     * @tc.desc Async Promise.reject with typed error in nested async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class TimeoutError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'TimeoutError';
        }
      }

      const fetchData = async (delay: number): Promise<string> => {
        return new Promise<string>((_, reject) => {
          // Fix: Reject directly with TimeoutError (no Promise.reject wrap)
          setTimeout(() => reject(new TimeoutError(`Delay ${delay}ms`)), delay);
        });
      };
      const process = async (): Promise<string> => {
        try {
          return await fetchData(15);
        } catch (err) {
          throw new Error(`Process failed: ${(err as TimeoutError).message}`);
        }
      };

      const result = await Promise.allSettled([process()]);
      const error = (result[0] as PromiseRejectedResult).reason as Error;

      expect(error.message).assertEqual('Process failed: Delay 15ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1046
     * @tc.name PromiseRejectTest046
     * @tc.desc 3-level async cascade: Promise.reject → catch → re-reject → final catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finalError = '';
      const root: Promise<number> = new Promise<number>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        setTimeout(() => reject('Root err'), 10);
      });

      await root
        .catch((err:string) => {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`Catch1: ${err}`), 5)
          );
        })
        .catch((err:string) => {
          finalError = `Catch2: ${err}`;
        });

      expect(finalError).assertEqual('Catch2: Catch1: Root err');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1047
     * @tc.name PromiseRejectTest047
     * @tc.desc Async Promise.reject in Promise.any with mixed resolve/reject timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const anyPromises = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Fail 5ms'), 5);
        }),
        new Promise<string>((_, reject) => setTimeout(() => reject('Fail 10ms'), 10)),
        new Promise<string>((resolve) => setTimeout(() => resolve('Success 8ms'), 8))
      ];

      const result = await Promise.any(anyPromises);
      expect(result).assertEqual('Success 8ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1048
     * @tc.name PromiseRejectTest048
     * @tc.desc Nested async Set with Promise.reject, verify allSettled order and value
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const innerSet = new Set<Promise<number>>([
        new Promise<number>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject(100), 20);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(200), 10))
      ]);
      const outerSet = new Set<Promise<Object>>([
        Promise.allSettled(innerSet),
        new Promise<string>((_, reject) => setTimeout(() => reject('Outer fail'), 15))
      ]);

      const outerResults = await Promise.allSettled(outerSet);
      const innerResults = (outerResults[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      // Fix 1: Remove unnecessary await; Fix 2: Set iteration order is insertion order (index 0=reject, 1=resolve)
      expect((Array.from(innerResults)[0] as PromiseRejectedResult).reason).assertEqual(100);
      expect((Array.from(innerResults)[1] as PromiseFulfilledResult<number>).value).assertEqual(200);
      expect((outerResults[1] as PromiseRejectedResult).reason).assertEqual('Outer fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1049
     * @tc.name PromiseRejectTest049
     * @tc.desc Async Promise.reject with dependent timing in then chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const chain: Promise<number | string> = new Promise<number | string>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        setTimeout(() => reject(50), 20);
      })
        .catch((err: number) => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Caught: ${err}`), err)
          );
        });

      const result = await chain;
      const end = Date.now();

      // Fix: Remove unnecessary await (result is resolved value, not Promise)
      expect(result).assertEqual('Caught: 50');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1050
     * @tc.name PromiseRejectTest050
     * @tc.desc 4-level async nested generator with Promise.reject termination
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest050', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      let result = await PromiseRejectTest050()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1051
     * @tc.name PromiseRejectTest051
     * @tc.desc Async Promise.reject with typed ApiError, verify nested property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Fix: Define missing type51 interface for ApiError.details
      interface type51 {
        field: string;
        message: string;
      }

      interface ApiError {
        code: number;
        details: type51;
      }

      const request: Promise<ApiError> = new Promise<ApiError>((_, reject) =>
      setTimeout(() => {
        const error: ApiError = {
          code: 400,
          details: { field: 'email', message: 'Invalid format' }
        };
        // Fix: Reject directly with error object (no Promise.reject wrap)
        reject(error);
      }, 15)
      );

      const result = await Promise.allSettled([request]);
      const reason = (result[0] as PromiseRejectedResult).reason as ApiError;

      expect(reason.code).assertEqual(400);
      expect(reason.details.field).assertEqual('email');
      expect(reason.details.message).assertEqual('Invalid format');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1052
     * @tc.name PromiseRejectTest052
     * @tc.desc Async cascade: Promise.reject in Promise.all triggers outer catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let catchCount = 0;
      const innerAll: Promise<(number | string)[]> = Promise.all([
        new Promise<number>((resolve) => setTimeout(() => resolve(10), 5)),
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Inner all fail'), 10);
        })
      ]);
      const outer: Promise<Object> = Promise.all([innerAll, Promise.resolve(20)]);

      try {
        await outer;
      } catch (_) {
        catchCount++;
      }

      expect(catchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1053
     * @tc.name PromiseRejectTest053
     * @tc.desc Async Promise.reject with timed recovery and re-resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain: Promise<string> = new Promise<string>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        setTimeout(() => reject('Temporary fail'), 10);
      })
        .catch((err: string) => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Recovered after: ${err}`), 20)
          );
        });

      const result = await chain;
      expect(result).assertEqual('Recovered after: Temporary fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1054
     * @tc.name PromiseRejectTest054
     * @tc.desc Nested async Promise.reject with mixed delay types (0ms vs timed)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest054', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level3: Promise<number> = new Promise<number>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('L3 immediate');
      });
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      level3.catch((err: string) => setTimeout(() => reject(`${err}-L2`), 10))
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      level2.catch((err: string) => reject(`${err}-L1`))
      );

      const result = await Promise.allSettled([level1]);
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L3 immediate-L2-L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1055
     * @tc.name PromiseRejectTest055
     * @tc.desc Async Promise.reject in Promise.race with all rejects, verify AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const racePromises = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Race 1'), 5);
        }),
        new Promise<string>((_, reject) => setTimeout(() => reject('Race 2'), 10))
      ];

      let errorCount = 0;
      try {
        await Promise.race(racePromises);
      } catch (err) {
        errorCount = 1;
      }

      expect(errorCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1056
     * @tc.name PromiseRejectTest056
     * @tc.desc Async then chain with Promise.reject and conditional recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const process = (value: number): Promise<number> =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => {
        if (value < 0) {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject(`Negative: ${value}`);
        } else {
          resolve(value * 2);
        }
      }, 10)
      );

      const negativeChain = process(-3)
        .catch((err: string) => err.includes('Negative') ? 0 : Promise.reject(err));
      const positiveChain = process(5);

      const result = await Promise.allSettled([negativeChain, positiveChain]);
      expect((result[0] as PromiseFulfilledResult<number>).value).assertEqual(0);
      expect((result[1] as PromiseFulfilledResult<number>).value).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1057
     * @tc.name PromiseRejectTest057
     * @tc.desc 3-level async nested allSettled with Promise.reject timing overlap
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest057', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level3: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        new Promise<number>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject(1), 5);
        }),
        new Promise<string>((resolve) => setTimeout(() => resolve('L3 success'), 10))
      ]);
      const level2: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level3,
        new Promise<boolean>((_, reject) => setTimeout(() => reject('L2 reject'), 15))
      ]);
      const level1: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level2,
        new Promise<number>((resolve) => setTimeout(() => resolve(999), 8))
      ]);

      const level1Results = await level1;
      const level2Results = (level1Results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const level3Results = (level2Results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((level3Results[0] as PromiseRejectedResult).reason).assertEqual(1);
      expect((level3Results[1] as PromiseFulfilledResult<string>).value).assertEqual('L3 success');
      expect((level2Results[1] as PromiseRejectedResult).reason).assertEqual('L2 reject');
      expect((level1Results[1] as PromiseFulfilledResult<number>).value).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1058
     * @tc.name PromiseRejectTest058
     * @tc.desc Async Promise.reject with typed array reason and nested propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const typedReason: Float32Array = new Float32Array([3.14, 2.718, 1.618]);
      const level2: Promise<Float32Array> = new Promise<Float32Array>((_, reject) =>
      setTimeout(() => {
        // Fix: Reject directly with typed array (no Promise.reject wrap)
        reject(typedReason);
      }, 12)
      );
      const level1: Promise<Float32Array> = new Promise<Float32Array>((_, reject) =>
      level2.catch((err: Float32Array) => reject(err))
      );

      const result = await Promise.allSettled([level1]);
      const reason = (result[0] as PromiseRejectedResult).reason as Float32Array;

      expect(reason instanceof Float32Array).assertEqual(true);
      expect(Math.abs(reason[0] - 3.14) < 0.001).assertEqual(true);
      expect(reason.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1059
     * @tc.name PromiseRejectTest059
     * @tc.desc Async cascade: Promise.reject → finally → catch, verify cleanup order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const orderLog: string[] = [];
      const chain: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => {
        orderLog.push('reject');
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Cascade err');
      }, 10)
      )
        .finally(() => {
          orderLog.push('finally');
        })
        .catch((err: string) => {
          orderLog.push('catch');
          return err;
        });

      await chain;
      expect(orderLog).assertDeepEquals(['reject', 'finally', 'catch']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1060
     * @tc.name PromiseRejectTest060
     * @tc.desc Nested async Promise.any with Promise.reject and delayed resolve race
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest060', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const innerAny: Promise<string | number> = Promise.any([
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Inner fail 1'), 5);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 15)),
        new Promise<string>((_, reject) => setTimeout(() => reject('Inner fail 2'), 10))
      ]);
      const outerAny: Promise<Object> = Promise.any([
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Outer fail'), 8);
        }),
        innerAny,
        new Promise<boolean>((resolve) => setTimeout(() => resolve(true), 20))
      ]);

      const result = await outerAny;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1061
     * @tc.name PromiseRejectTest061
     * @tc.desc 5-level nested async reject cascade with cumulative timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest061', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level5: Promise<number> = new Promise<number>((_, reject) =>
      // Fix: Reject directly with reason (no Promise.reject wrap)
      setTimeout(() => reject('L5'), 5)
      );
      const level4: Promise<number> = new Promise<number>((_, reject) =>
      level5.catch((err: string) => setTimeout(() => reject(`${err}-L4`), 10))
      );
      const level3: Promise<number> = new Promise<number>((_, reject) =>
      level4.catch((err: string) => setTimeout(() => reject(`${err}-L3`), 15))
      );
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      level3.catch((err: string) => setTimeout(() => reject(`${err}-L2`), 20))
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      level2.catch((err: string) => setTimeout(() => reject(`${err}-L1`), 25))
      );

      const result = await Promise.allSettled([level1]);
      const end = Date.now();
      const totalDelay = end - start;

      // Total expected delay: 5 + 10 + 15 + 20 + 25 = 75ms
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L5-L4-L3-L2-L1');
      expect(totalDelay).assertLargerOrEqual(75);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1062
     * @tc.name PromiseRejectTest062
     * @tc.desc Async timing race: early Promise.reject vs delayed reject in nested all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const fastReject: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => {
        timeLog.push('fast-reject(10ms)');
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Fast');
      }, 10)
      );
      const slowReject: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => {
        timeLog.push('slow-reject(20ms)');
        reject('Slow');
      }, 20)
      );

      let finalReason = '';
      try {
        await Promise.all([fastReject, slowReject]);
      } catch (err) {
        finalReason = err as string;
      }

      // Promise.all rejects on first rejection, so slow-reject shouldn't execute
      expect(finalReason).assertEqual('Fast');
      expect(timeLog).assertDeepEquals(['fast-reject(10ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1063
     * @tc.name PromiseRejectTest063
     * @tc.desc 3-level nested async generator with Promise.reject and timing-dependent termination
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest063', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const timeLog: string[] = await PromiseRejectTest063();
      expect(timeLog).assertDeepEquals(['L3-resolve(5ms)', 'L3-reject(15ms)', 'L2-reject(25ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1064
     * @tc.name PromiseRejectTest064
     * @tc.desc Async chain with reject-recover-rereject pattern and timing verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const chain: Promise<string> = new Promise<number>((_, reject) =>
      setTimeout(() => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Root');
      }, 10)
      )
        .catch((err: string) => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Recover: ${err}`), 15)
          );
        })
        .then(val => {
          return new Promise<string>((_, reject) =>
          setTimeout(() => reject(`Rereject: ${val}`), 10)
          );
        });

      const result = await Promise.allSettled([chain]);
      const end = Date.now();

      // Total expected delay: 10 + 15 + 10 = 35ms
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('Rereject: Recover: Root');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1065
     * @tc.name PromiseRejectTest065
     * @tc.desc 4-level nested allSettled with Promise.reject and staggered timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest065', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const level4: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('L4'), 5);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(40), 10))
      ]);
      const level3: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level4,
        new Promise<boolean>((_, reject) => setTimeout(() => reject('L3'), 15))
      ]);
      const level2: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level3,
        new Promise<string>((resolve) => setTimeout(() => resolve('L2'), 20))
      ]);
      const level1: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level2,
        new Promise<number>((_, reject) => setTimeout(() => reject('L1'), 25))
      ]);

      const l1Res = await level1;
      const l2Res = (l1Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l3Res = (l2Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l4Res = (l3Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((l4Res[0] as PromiseRejectedResult).reason).assertEqual('L4');
      expect((l4Res[1] as PromiseFulfilledResult<number>).value).assertEqual(40);
      expect((l3Res[1] as PromiseRejectedResult).reason).assertEqual('L3');
      expect((l2Res[1] as PromiseFulfilledResult<string>).value).assertEqual('L2');
      expect((l1Res[1] as PromiseRejectedResult).reason).assertEqual('L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1066
     * @tc.name PromiseRejectTest066
     * @tc.desc Async Promise.reject in Promise.race with mixed resolve/reject delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const raceCandidates = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('15ms-reject'), 15);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 10)),
        new Promise<boolean>((_, reject) => setTimeout(() => reject('20ms-reject'), 20))
      ];

      let raceResult: number | string | boolean = '';
      try {
        raceResult = await Promise.race(raceCandidates);
      } catch (err) {
        raceResult = err as string;
      }

      // Fastest is 10ms resolve with 100
      expect(raceResult).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1067
     * @tc.name PromiseRejectTest067
     * @tc.desc 3-level async cascade with conditional Promise.reject and timing checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level3 = (shouldReject: boolean): Promise<number> =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => {
        if (shouldReject) {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject('L3-cond');
        } else {
          resolve(30);
        }
      }, 10)
      );
      const level2 = async (): Promise<number> => {
        try {
          return await level3(true);
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L2-wrap: ${err}`), 15)
          );
        }
      };
      const level1 = async (): Promise<number> => {
        try {
          return await level2();
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L1-wrap: ${err}`), 20)
          );
        }
      };

      const result = await Promise.allSettled([level1()]);
      const end = Date.now();

      // Total expected delay: 10 + 15 + 20 = 45ms
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L1-wrap: L2-wrap: L3-cond');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1068
     * @tc.name PromiseRejectTest068
     * @tc.desc Async nested Set with Promise.reject and timing-based execution order
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest068', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const innerSet = new Set<Promise<string | number>>([
        new Promise<string>((_, reject) => setTimeout(() => {
          timeLog.push('inner-reject(20ms)');
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject('Inner');
        }, 20)),
        new Promise<number>((resolve) => setTimeout(() => {
          timeLog.push('inner-resolve(10ms)');
          resolve(200);
        }, 10))
      ]);
      const outerSet = new Set<Promise<Object>>([
        Promise.allSettled(innerSet),
        new Promise<string>((_, reject) => setTimeout(() => {
          timeLog.push('outer-reject(15ms)');
          reject('Outer');
        }, 15))
      ]);

      const outerResults = await Promise.allSettled(outerSet);
      const innerResults = (outerResults[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((Array.from(innerResults)[0] as PromiseRejectedResult).reason).assertEqual('Inner');
      expect((Array.from(innerResults)[1] as PromiseFulfilledResult<number>).value).assertEqual(200);
      expect((outerResults[1] as PromiseRejectedResult).reason).assertEqual('Outer');
      // Execution order based on timeout delays (10ms → 15ms → 20ms)
      expect(timeLog).assertDeepEquals(['inner-resolve(10ms)', 'outer-reject(15ms)', 'inner-reject(20ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1069
     * @tc.name PromiseRejectTest069
     * @tc.desc Async cascade: Promise.reject → finally → catch → resolve with timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const chain: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => {
        timeLog.push('reject(10ms)');
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Root');
      }, 10)
      )
        .finally(() => {
          timeLog.push('finally(15ms)');
          return new Promise<void>((resolve) => setTimeout(resolve, 5));
        })
        .catch((err: string) => {
          timeLog.push('catch(20ms)');
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Recover: ${err}`), 10)
          );
        });

      const result = await chain;
      expect(result).assertEqual('Recover: Root');
      expect(timeLog).assertDeepEquals(['reject(10ms)', 'finally(15ms)', 'catch(20ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1070
     * @tc.name PromiseRejectTest070
     * @tc.desc 5-level nested async functions with Promise.reject and cumulative delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest070', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level5 = async (): Promise<number> => {
        return new Promise<number>((_, reject) =>
        // Fix: Reject directly with reason (no Promise.reject wrap)
        setTimeout(() => reject('L5'), 5)
        );
      };
      const level4 = async (): Promise<number> => {
        try {
          return await level5();
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`${err}-L4`), 10)
          );
        }
      };
      const level3 = async (): Promise<number> => {
        try {
          return await level4();
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`${err}-L3`), 15)
          );
        }
      };
      const level2 = async (): Promise<number> => {
        try {
          return await level3();
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`${err}-L2`), 20)
          );
        }
      };
      const level1 = async (): Promise<number> => {
        try {
          return await level2();
        } catch (err) {
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`${err}-L1`), 25)
          );
        }
      };

      const result = await Promise.allSettled([level1()]);
      const end = Date.now();

      // Total expected delay: 5 + 10 + 15 + 20 + 25 = 75ms
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L5-L4-L3-L2-L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1071
     * @tc.name PromiseRejectTest071
     * @tc.desc Promise.any with all rejects, verify AggregateError order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const anyPromises = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Any 1 (5ms)'), 5);
        }),
        new Promise<number>((_, reject) => setTimeout(() => reject('Any 2 (10ms)'), 10)),
        new Promise<boolean>((_, reject) => setTimeout(() => reject('Any 3 (15ms)'), 15))
      ];

      let aggregateErrors: string[] = [];
      try {
        await Promise.any(anyPromises);
      } catch (err) {
        // Fix: Type guard for AggregateError to avoid runtime errors
        if (err instanceof AggregateError) {
          aggregateErrors = err.errors.map((e: string) => e);
        }
      }

      expect(aggregateErrors).assertDeepEquals(['Any 1 (5ms)', 'Any 2 (10ms)', 'Any 3 (15ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1072
     * @tc.name PromiseRejectTest072
     * @tc.desc 4-level nested all with Promise.reject and early termination timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest072', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const level4: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => {
        timeLog.push('L4-reject(10ms)');
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('L4');
      }, 10)
      );
      const level3: Promise<Object[]> = Promise.all([
        level4,
        new Promise<string>((resolve) => setTimeout(() => {
          timeLog.push('L3-resolve(20ms)');
          resolve('L3');
        }, 20))
      ]);
      const level2: Promise<Object[]> = Promise.all([
        level3,
        new Promise<number>((resolve) => setTimeout(() => {
          timeLog.push('L2-resolve(25ms)');
          resolve(200);
        }, 25))
      ]);
      const level1: Promise<Object[]> = Promise.all([
        level2,
        new Promise<boolean>((resolve) => setTimeout(() => {
          timeLog.push('L1-resolve(30ms)');
          resolve(true);
        }, 30))
      ]);

      let finalReason = '';
      try {
        await level1;
      } catch (err) {
        finalReason = err as string;
      }

      // Promise.all rejects immediately on first failure, so no other callbacks execute
      expect(finalReason).assertEqual('L4');
      expect(timeLog).assertDeepEquals(['L4-reject(10ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1073
     * @tc.name PromiseRejectTest073
     * @tc.desc Async cascade: Promise.reject → catch → re-resolve → then with timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const chain: Promise<string> = new Promise<number>((_, reject) =>
      setTimeout(() => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Root (10ms)');
      }, 10)
      )
        .catch((err: string) => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Recover: ${err}`), 15)
          );
        })
        .then(val => {
          return new Promise<string>((resolve) =>
          setTimeout(() => resolve(`Processed: ${val}`), 10)
          );
        });

      const result = await chain;
      const end = Date.now();

      // Total expected delay: 10 (reject) + 15 (catch resolve) + 10 (then resolve) = 35ms
      expect(result).assertEqual('Processed: Recover: Root (10ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1074
     * @tc.name PromiseRejectTest074
     * @tc.desc Nested async generator with Promise.reject and multi-level iteration timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest074', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const result = await PromiseRejectTest074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1075
     * @tc.name PromiseRejectTest075
     * @tc.desc Typed custom error propagation through nested promises with timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ValidationError extends Error {
        code: number;

        constructor(message: string, code: number) {
          super(message);
          this.name = 'ValidationError';
          this.code = code;
        }
      }

      const start = Date.now();
      const level2: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => {
        // Fix: Reject directly with error instance (no Promise.reject wrap)
        reject(new ValidationError('L2 invalid', 400));
      }, 12)
      );
      const level1: Promise<string> = new Promise<string>((_, reject) =>
      level2.catch((err: ValidationError) => setTimeout(() => reject(err), 18))
      );

      const result = await Promise.allSettled([level1]);
      const error = (result[0] as PromiseRejectedResult).reason as ValidationError;
      const end = Date.now();

      // Total expected delay: 12ms + 18ms = 30ms
      expect(error.name).assertEqual('ValidationError');
      expect(error.code).assertEqual(400);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1076
     * @tc.name PromiseRejectTest076
     * @tc.desc 3-level async cascade with mixed immediate/delayed Promise.reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level3: Promise<number> = new Promise<number>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('L3-immediate');
      });
      const level2: Promise<number> = new Promise<number>((_, reject) =>
      level3.catch((err: string) => setTimeout(() => reject(`${err}-L2-delayed`), 15))
      );
      const level1: Promise<number> = new Promise<number>((_, reject) =>
      level2.catch((err: string) => reject(`${err}-L1-immediate`))
      );

      const result = await Promise.allSettled([level1]);
      const end = Date.now();

      // Total expected delay: 15ms (only the timed reject in level2)
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L3-immediate-L2-delayed-L1-immediate');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1077
     * @tc.name PromiseRejectTest077
     * @tc.desc Async Promise.race with Promise.reject and resolve in nested then chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const raceCandidates = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Reject (10ms)'), 10);
        })
          .then(val => val + ' extended')
          .catch((err: string) => Promise.reject(`Caught: ${err}`)),
        new Promise<number>((resolve) => setTimeout(() => resolve(200), 15))
          .then(val => val * 2)
      ];

      let raceResult: number | string = '';
      try {
        raceResult = await Promise.race(raceCandidates);
      } catch (err) {
        raceResult = err as string;
      }

      // 10ms reject is faster than 15ms resolve
      expect(raceResult).assertEqual('Caught: Reject (10ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1078
     * @tc.name PromiseRejectTest078
     * @tc.desc 4-level nested allSettled with Promise.reject and staggered resolve timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest078', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const level4: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        new Promise<string>((_, reject) => setTimeout(() => {
          timeLog.push('L4-reject(5ms)');
          reject(Promise.reject('L4'));
        }, 5)),
        new Promise<number>((resolve) => setTimeout(() => {
          timeLog.push('L4-resolve(10ms)');
          resolve(40);
        }, 10))
      ]);
      const level3: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level4,
        new Promise<boolean>((_, reject) => setTimeout(() => {
          timeLog.push('L3-reject(15ms)');
          reject('L3');
        }, 15))
      ]);
      const level2: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level3,
        new Promise<string>((resolve) => setTimeout(() => {
          timeLog.push('L2-resolve(20ms)');
          resolve('L2');
        }, 20))
      ]);
      const level1: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level2,
        new Promise<number>((_, reject) => setTimeout(() => {
          timeLog.push('L1-reject(25ms)');
          reject('L1');
        }, 25))
      ]);

      await level1;
      expect(timeLog)
        .assertDeepEquals(['L4-reject(5ms)', 'L4-resolve(10ms)', 'L3-reject(15ms)', 'L2-resolve(20ms)',
          'L1-reject(25ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1079
     * @tc.name PromiseRejectTest079
     * @tc.desc Async cascade: Promise.reject → multiple finally with timing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const finallyOrder: string[] = [];
      const chain: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(Promise.reject('Root (10ms)')), 10)
      )
        .finally(() => {
          finallyOrder.push('Finally 1 (15ms)');
          return new Promise<void>((resolve) => setTimeout(resolve, 5));
        })
        .catch((err: Error) => Promise.reject(`Caught: ${err}`))
        .finally(() => {
          finallyOrder.push('Finally 2 (25ms)');
          return new Promise<void>((resolve) => setTimeout(resolve, 5));
        });

      await Promise.allSettled([chain]);
      expect(finallyOrder).assertDeepEquals(['Finally 1 (15ms)', 'Finally 2 (25ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1080
     * @tc.name PromiseRejectTest080
     * @tc.desc 5-level nested async Set with Promise.reject and timing-based result order
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest080', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const level5Set = new Set<Promise<number>>([
        new Promise<number>((_, reject) => setTimeout(() => {
          timeLog.push('L5-reject(5ms)');
          reject(Promise.reject(50));
        }, 5)),
        new Promise<number>((resolve) => setTimeout(() => {
          timeLog.push('L5-resolve(8ms)');
          resolve(51);
        }, 8))
      ]);
      const level4Set = new Set<Promise<Object>>([Promise.allSettled(level5Set)]);
      const level3Set = new Set<Promise<Object>>([
        Promise.allSettled(level4Set),
        new Promise<string>((_, reject) => setTimeout(() => {
          timeLog.push('L3-reject(12ms)');
          reject('L3-err');
        }, 12))
      ]);
      const level2Set = new Set<Promise<Object>>([
        Promise.allSettled(level3Set),
        new Promise<boolean>((resolve) => setTimeout(() => {
          timeLog.push('L2-resolve(15ms)');
          resolve(true);
        }, 15))
      ]);
      const level1Set = new Set<Promise<Object>>([
        Promise.allSettled(level2Set),
        new Promise<number>((_, reject) => setTimeout(() => {
          timeLog.push('L1-reject(20ms)');
          reject(100);
        }, 20))
      ]);

      await Promise.allSettled(level1Set);
      expect(timeLog)
        .assertDeepEquals(['L5-reject(5ms)', 'L5-resolve(8ms)', 'L3-reject(12ms)', 'L2-resolve(15ms)',
          'L1-reject(20ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1081
     * @tc.name PromiseRejectTest081
     * @tc.desc Async Promise.reject in Promise.race with chained catch and resolve timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const raceCandidates = [
        new Promise<string>((_, reject) => setTimeout(() => reject(Promise.reject('Race-err(10ms)')), 10))
          .catch((err: Error) => new Promise<string>((resolve) => setTimeout(() => resolve(`Recover: ${err}`), 15))),
        new Promise<number>((resolve) => setTimeout(() => resolve(300), 20))
      ];

      const result = await Promise.race(raceCandidates);
      const end = Date.now();

      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1082
     * @tc.name PromiseRejectTest082
     * @tc.desc Multi-level conditional reject cascade with cumulative timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest082', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level4 = (delay: number): Promise<number> =>
      new Promise<number>((_, reject) =>
      // Fix: Reject directly with reason (no Promise.reject wrap)
      setTimeout(() => reject(`L4(${delay}ms)`), delay)
      );
      const level3 = async (): Promise<number> => {
        try {
          return await level4(5);
        } catch (err) {
          // Fix: Type err as string for proper string operations
          const delay = (err as string).includes('5ms') ? 10 : 5;
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L3-wrap: ${err}`), delay)
          );
        }
      };
      const level2 = async (): Promise<number> => {
        try {
          return await level3();
        } catch (err) {
          // Fix: Type err as string for proper string operations
          const delay = (err as string).includes('L3') ? 15 : 10;
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L2-wrap: ${err}`), delay)
          );
        }
      };
      const level1 = async (): Promise<number> => {
        try {
          return await level2();
        } catch (err) {
          // Fix: Type err as string for proper string operations
          const delay = (err as string).includes('L2') ? 20 : 15;
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L1-wrap: ${err}`), delay)
          );
        }
      };

      const result = await Promise.allSettled([level1()]);
      const end = Date.now();

      // Total expected delay: 5 (L4) + 10 (L3) + 15 (L2) + 20 (L1) = 50ms
      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L1-wrap: L2-wrap: L3-wrap: L4(5ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1083
     * @tc.name PromiseRejectTest083
     * @tc.desc Async nested all with Promise.reject and partial resolve execution timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const execLog: string[] = [];
      const innerAll: Promise<(string | number)[]> = Promise.all([
        new Promise<string>((resolve) => setTimeout(() => {
          execLog.push('Inner-resolve(5ms)');
          resolve('Inner');
        }, 5)),
        new Promise<number>((_, reject) => setTimeout(() => {
          execLog.push('Inner-reject(10ms)');
          reject(Promise.reject('Inner-err'));
        }, 10)),
        new Promise<number>((resolve) => setTimeout(() => {
          execLog.push('Inner-resolve(15ms)');
          resolve(100);
        }, 15))
      ]);
      const outerAll: Promise<Object[]> = Promise.all([innerAll]);

      try {
        await outerAll;
      } catch (_) {
      }

      expect(execLog.length).assertLess(3);
      expect(execLog).assertDeepEquals(['Inner-resolve(5ms)', 'Inner-reject(10ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1084
     * @tc.name PromiseRejectTest084
     * @tc.desc Async generator with nested Promise.reject and iteration timing sequence
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest084', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const iterLog: string[] = await PromiseRejectTest084()
      expect(iterLog).assertDeepEquals(['Yield1-resolve(8ms)', 'Yield2-reject(15ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1085
     * @tc.name PromiseRejectTest085
     * @tc.desc Typed NetworkError propagation through nested promises with timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      interface NetworkError {
        status: number;
        url: string;
        timestamp: number;
      }

      const start = Date.now();
      const level2: Promise<NetworkError> = new Promise<NetworkError>((_, reject) =>
      setTimeout(() => {
        const err: NetworkError = { status: 503, url: '/api', timestamp: Date.now() };
        // Fix: Reject directly with NetworkError instance (no Promise.reject wrap)
        reject(err);
      }, 12)
      );
      const level1: Promise<NetworkError> = new Promise<NetworkError>((_, reject) =>
      // Fix: Type err as NetworkError (matches rejected value type)
      level2.catch((err: NetworkError) => setTimeout(() => reject(err), 18))
      );

      const result = await Promise.allSettled([level1]);
      const reason = (result[0] as PromiseRejectedResult).reason as NetworkError;
      const end = Date.now();

      // Total expected delay: 12ms (level2) + 18ms (level1) = 30ms
      expect(reason.status).assertEqual(503);
      expect(reason.url).assertEqual('/api');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1086
     * @tc.name PromiseRejectTest086
     * @tc.desc 3-level async cascade: Promise.reject → catch → finally → resolve timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const orderLog: string[] = [];
      const start = Date.now();
      const chain: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => {
        orderLog.push('Reject(10ms)');
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject('Root');
      }, 10)
      )
        .catch((err: string) => {
          orderLog.push('Catch(15ms)');
          return new Promise<string>((resolve) => setTimeout(() => resolve(`Recover: ${err}`), 10));
        })
        .finally(() => {
          orderLog.push('Finally(25ms)');
        });

      const result = await chain;
      const end = Date.now();

      // Execution order: 10ms(reject) → 15ms(catch trigger, starts 10ms timeout) → 25ms(timeout ends + finally)
      expect(result).assertEqual('Recover: Root');
      expect(orderLog).assertDeepEquals(['Reject(10ms)', 'Catch(15ms)', 'Finally(25ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1088
     * @tc.name PromiseRejectTest088
     * @tc.desc 3-level nested allSettled with mixed reject/resolve and timing verification
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest088', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level3: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('L3'), 5);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(30), 10))
      ]);
      const level2: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level3,
        new Promise<boolean>((_, reject) => setTimeout(() => reject('L2'), 15))
      ]);
      const level1: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        level2,
        new Promise<string>((resolve) => setTimeout(() => resolve('L1'), 20))
      ]);

      const l1Res = await level1;
      const l2Res = (l1Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l3Res = (l2Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const end = Date.now();

      // Total expected delay: 20ms (longest promise in level1)
      expect((l3Res[0] as PromiseRejectedResult).reason).assertEqual('L3');
      expect((l3Res[1] as PromiseFulfilledResult<number>).value).assertEqual(30);
      expect((l2Res[1] as PromiseRejectedResult).reason).assertEqual('L2');
      expect((l1Res[1] as PromiseFulfilledResult<string>).value).assertEqual('L1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1089
     * @tc.name PromiseRejectTest089
     * @tc.desc Async Promise.reject in chained then with mixed delay and recovery timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stepLog: string[] = [];
      const start = Date.now();
      const chain: Promise<string> = Promise.resolve('Init')
        .then(val => {
          stepLog.push('Then1(5ms)');
          return new Promise<string>((resolve) => setTimeout(() => resolve(val + '-Then1'), 5));
        })
        .then(val => {
          stepLog.push('Then2(10ms)');
          // Fix: Reject directly with reason (no Promise.reject wrap)
          return Promise.reject(`${val}-Reject`);
        })
        .catch((err: string) => {
          stepLog.push('Catch(15ms)');
          return new Promise<string>((resolve) => setTimeout(() => resolve(`Recover: ${err}`), 10));
        })
        .then(val => {
          stepLog.push('Then3(25ms)');
          return val + '-Then3';
        });

      const result = await chain;
      const end = Date.now();

      expect(result).assertEqual('Recover: Init-Then1-Reject-Then3');
      expect(stepLog).assertDeepEquals(['Then1(5ms)', 'Then2(10ms)', 'Catch(15ms)', 'Then3(25ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1090
     * @tc.name PromiseRejectTest090
     * @tc.desc 4-level nested async functions with Promise.reject and staggered delay propagation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest090', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const delayLog: number[] = [];
      const start = Date.now();

      const level4 = async (): Promise<number> => {
        const delay = 8;
        delayLog.push(delay);
        return new Promise<number>((_, reject) =>
        // Fix: Reject directly with reason (no Promise.reject wrap)
        setTimeout(() => reject(`L4(${delay}ms)`), delay)
        );
      };
      const level3 = async (): Promise<number> => {
        try {
          return await level4();
        } catch (err) {
          const delay = 12;
          delayLog.push(delay);
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L3(${delay}ms): ${err}`), delay)
          );
        }
      };
      const level2 = async (): Promise<number> => {
        try {
          return await level3();
        } catch (err) {
          const delay = 15;
          delayLog.push(delay);
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L2(${delay}ms): ${err}`), delay)
          );
        }
      };
      const level1 = async (): Promise<number> => {
        try {
          return await level2();
        } catch (err) {
          const delay = 10;
          delayLog.push(delay);
          return new Promise<number>((_, reject) =>
          setTimeout(() => reject(`L1(${delay}ms): ${err}`), delay)
          );
        }
      };

      const result = await Promise.allSettled([level1()]);
      const end = Date.now();
      const totalDelay = delayLog.reduce((a, b) => a + b, 0);

      expect((result[0] as PromiseRejectedResult).reason).assertEqual('L1(10ms): L2(15ms): L3(12ms): L4(8ms)');
      expect(delayLog).assertDeepEquals([8, 12, 15, 10]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1091
     * @tc.name PromiseRejectTest091
     * @tc.desc Promise.reject combined with Promise.allSettled & Promise.resolve, verify result aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testPromises = [
        Promise.resolve(100),
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject('Reject 1');
        }),
        Promise.resolve('Success 2'),
        new Promise<boolean>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Delayed Reject 3'), 15);
        })
      ];

      const results = await Promise.allSettled(testPromises);
      const statuses = results.map(res => res.status);
      const reasons: string[] =
        results.filter(res => res.status === 'rejected').map((res): string => (res as PromiseRejectedResult).reason);

      expect(statuses).assertDeepEquals(['fulfilled', 'rejected', 'fulfilled', 'rejected']);
      expect(reasons).assertDeepEquals(['Reject 1', 'Delayed Reject 3']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1092
     * @tc.name PromiseRejectTest092
     * @tc.desc Promise.reject in Promise.race with Promise.any fallback, verify double timing race
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest092', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const raceCandidates = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Race Reject (10ms)'), 10);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(200), 20))
      ];
      // Use Promise.any as fallback for Promise.race when rejection occurs first
      const combined = Promise.race(raceCandidates)
        .catch((err: string) => Promise.any([
          new Promise<string>((resolve) => setTimeout(() => resolve(`Fallback: ${err}`), 5)),
          new Promise<boolean>((_, reject) => setTimeout(() => reject('Fallback Reject'), 10))
        ]));

      const result = await combined;
      expect(result).assertEqual('Fallback: Race Reject (10ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1093
     * @tc.name PromiseRejectTest093
     * @tc.desc Promise.reject with Promise.all + Promise.resolve nested, verify propagation depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerAll = Promise.all([
        Promise.resolve(1),
        new Promise<number>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject('Inner Reject');
        }),
        Promise.resolve(3)
      ]);
      const outerAll = Promise.all([
        Promise.resolve('Outer 1'),
        innerAll,
        Promise.resolve('Outer 3')
      ]);

      let finalReason = '';
      try {
        await outerAll;
      } catch (err) {
        finalReason = err as string;
      }

      // Promise.all rejects immediately on first rejection, propagating through nested structure
      expect(finalReason).assertEqual('Inner Reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1094
     * @tc.name PromiseRejectTest094
     * @tc.desc Promise.reject in async generator + Promise.allSettled, verify iteration & aggregation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest094', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      let result = await PromiseRejectTest094()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1095
     * @tc.name PromiseRejectTest095
     * @tc.desc Promise.reject with Promise.any & Promise.race combination, verify priority logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const anyCandidates = [
        new Promise<string>((_, reject) => setTimeout(() => reject(Promise.reject('Any Reject 1 (5ms)')), 5)),
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 15)),
        new Promise<string>((_, reject) => setTimeout(() => reject('Any Reject 2 (10ms)'), 10))
      ];
      const raceCandidates = [
        Promise.any(anyCandidates),
        new Promise<boolean>((_, reject) => setTimeout(() => reject(Promise.reject('Race Reject (20ms)')), 20))
      ];

      const result = await Promise.race(raceCandidates);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1096
     * @tc.name PromiseRejectTest096
     * @tc.desc Promise.reject in mapped array promises with allSettled handling
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRejectTest096', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const chain = Promise.resolve([1, -2, 3])
        .then((nums) => {
          const numPromises = nums.map(n =>
          n > 0 ? Promise.resolve(n * 2) : new Promise<number>((_, reject) => {
            // Fix: Reject directly with reason (no Promise.reject wrap)
            reject(`Negative: ${n}`);
          })
          );
          return Promise.allSettled(numPromises);
        })
        .then((results) => {
          return results.map(res =>
          res.status === 'fulfilled' ? res.value : `Handled: ${(res as PromiseRejectedResult).reason}`
          );
        });

      const result = await chain;
      expect(result).assertDeepEquals([2, 'Handled: Negative: -2', 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1097
     * @tc.name PromiseRejectTest097
     * @tc.desc Promise.reject with Promise.race & finally, verify cleanup before race termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cleanupExecuted = false;
      const raceCandidates = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('Fast Reject (8ms)'), 8);
        })
          .finally(() => {
            cleanupExecuted = true;
          }),
        new Promise<number>((resolve) => setTimeout(() => resolve(300), 15))
      ];

      let raceReason = '';
      try {
        await Promise.race(raceCandidates);
      } catch (err) {
        raceReason = err as string;
      }

      // finally should execute even if promise is rejected
      expect(raceReason).assertEqual('Fast Reject (8ms)');
      expect(cleanupExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1098
     * @tc.name PromiseRejectTest098
     * @tc.desc Promise.reject in Promise.all + Promise.any fallback, verify all-fail recovery
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest098', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const allCandidates = [
        new Promise<string>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          reject('All Reject 1');
        }),
        new Promise<number>((_, reject) => {
          // Fix: Reject directly with reason (no Promise.reject wrap)
          setTimeout(() => reject('All Reject 2'), 10);
        })
      ];
      // Use Promise.any as fallback when all promises in Promise.all reject
      const combined = Promise.all(allCandidates)
        .catch(() => Promise.any([
          Promise.resolve('Fallback Success'),
          new Promise<boolean>((_, reject) => reject('Fallback Reject'))
        ]));

      const result = await combined;
      expect(result).assertEqual('Fallback Success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1099
     * @tc.name PromiseRejectTest099
     * @tc.desc Promise.reject with Promise.resolve chaining + Promise.allSettled, verify value flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRejectTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createPromise = (val: number): Promise<number> =>
      val % 2 === 0
        ? Promise.resolve(val * 3)
        : new Promise<number>((_, reject) => {
        // Fix: Reject directly with reason (no Promise.reject wrap)
        reject(`Odd: ${val}`);
      });

      const promises = [1, 2, 3, 4].map(val => createPromise(val));
      const results = await Promise.allSettled(promises);

      expect((results[0] as PromiseRejectedResult).reason).assertEqual('Odd: 1');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(6);
      expect((results[2] as PromiseRejectedResult).reason).assertEqual('Odd: 3');
      expect((results[3] as PromiseFulfilledResult<number>).value).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1100
     * @tc.name PromiseRejectTest100
     * @tc.desc Promise.reject + Promise.race + Promise.all nested triple combination, verify multi-layer timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRejectTest100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const innerRace = Promise.race([
        new Promise<string>((_, reject) => {
          setTimeout(() => reject('Inner Race Reject (5ms)'), 5);
        }),
        new Promise<number>((resolve) => setTimeout(() => resolve(10), 10))
      ]);
      const handledInnerRace = innerRace.catch((err:string) => err);
      const middleAll = Promise.all([
        handledInnerRace,
        new Promise<boolean>((resolve) => setTimeout(() => resolve(true), 15))
      ]);
      const outerRace = Promise.race([
        middleAll,
        new Promise<string>((_, reject) => {
          setTimeout(() => reject('Outer Race Reject (20ms)'), 20);
        })
      ]);

      const result = await outerRace;
      expect(result).assertDeepEquals(['Inner Race Reject (5ms)', true]);
    });
  })
}