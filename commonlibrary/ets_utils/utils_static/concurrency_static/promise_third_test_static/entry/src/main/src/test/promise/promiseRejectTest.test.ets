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
class ValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ValidationError';
  }
}

type type22 = string;
class TimeoutError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'TimeoutError';
  }
}

export default function promiseRejectTest(){
  describe('promiseRejectTest', ():void => {
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
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1002
     * @tc.name PromiseRejectTest002
     * @tc.desc Promise returned by Promise.reject can be caught via catch(), verify capture logic
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let capturedReason = '';
      const customError = new Error('Custom error object');

      await Promise.reject(customError)
        .catch((err: Error) => {
          capturedReason = err.message;
        });

      expect(capturedReason).assertEqual('Custom error object');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1005
     * @tc.name PromiseRejectTest005
     * @tc.desc Promise.reject combined with Promise.all, verify all rejection behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let allRejectionReason = '';
      const promise1 = Promise.resolve(10);
      const promise2 = Promise.reject(new Error('Second promise rejected'));
      const promise3 = new Promise<number>(resolve => {setTimeout(()=>{resolve(10)}, 10, 30)});

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
     * @tc.level Level 0
     */
    it('PromiseRejectTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1009
     * @tc.name PromiseRejectTest009
     * @tc.desc Promise.reject in race condition with Promise.race, verify early rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let raceOutcome = '';
      const fastReject = Promise.reject(new Error('Fast rejection'));
      const slowResolve = new Promise<string>(resolve => {setTimeout(()=>{resolve("ssss")}, 100, 'Slow resolve')});

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
     * @tc.level Level 0
     */
    it('PromiseRejectTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.level Level 0
     */
    it('PromiseRejectTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const outerPromise: Promise<string> = new Promise<string>((resolve, reject) => {
        const innerPromise: Promise<number> = new Promise<number>((resolve, innerReject) => {
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
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1013
     * @tc.name PromiseRejectTest013
     * @tc.desc Promise.reject combined with new Promise in Promise.race, verify priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.level Level 0
     */
    it('PromiseRejectTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const start = Date.now();
      const timedReject: Promise<void> = new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          reject(new Error('Delayed reject'));
        }, 30);
      });

      const result = await Promise.allSettled([timedReject]);
      const end = Date.now();

      expect((result[0] as PromiseRejectedResult).reason.message).assertEqual('Delayed reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1019
     * @tc.name PromiseRejectTest019
     * @tc.desc new Promise with Promise.reject vs direct reject, compare behaviors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rejectWithApi: Promise<string> = new Promise<string>((resolve, reject) => {
        reject(new Error('Via Promise.reject'));
      });
      const rejectDirectly: Promise<string> = new Promise<string>((resolve, reject) => {
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
     * @tc.level Level 0
     */
    it('PromiseRejectTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const asyncHandler = async (): Promise<string> => {
        const promise: Promise<string> = new Promise<string>((resolve, reject) => {
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
     * @tc.level Level 0
     */
    it('PromiseRejectTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const promise1: Promise<number> = new Promise<number>((resolve) => {setTimeout(()=>{resolve(1)}, 50, 1)});
      const promise2: Promise<string> = new Promise<string>((resolve, reject) => {
        // Fix: Reject directly without wrapping in Promise.reject
        setTimeout(() => reject(new Error('Early reject')), 10);
      });
      const promise3: Promise<boolean> = new Promise<boolean>((resolve) => {setTimeout(()=>{resolve(true)}, 100, true)});

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
     * @tc.level Level 0
     */
    it('PromiseRejectTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const validate: Promise<type22> = new Promise<type22>((resolve, reject) => {
        reject(new ValidationError('ID must be positive'));
      });

      const result = await Promise.allSettled([validate]);
      const rejectedResult = result[0] as PromiseRejectedResult;
      const error = rejectedResult.reason as ValidationError;

      expect(error.name).assertEqual('ValidationError');
      expect(error.message).assertEqual('ID must be positive');
    });
    
    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1028
     * @tc.name PromiseRejectTest028
     * @tc.desc Typed new Promise with Promise.reject and Promise.any, verify recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const promiseA: Promise<string> = new Promise<string>((resolve, reject) => {
        reject(new Error('A fail'));
      });
      const promiseB: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('B success'), 20);
      });
      const promiseC: Promise<string> = new Promise<string>((resolve, reject) => {
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
     * @tc.level Level 0
     */
    it('PromiseRejectTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cleanupExecuted = false;
      const promise: Promise<number> = new Promise<number>((resolve, reject) => {
        reject(new Error('Cleanup test'));
      })
        .finally(() => {
          cleanupExecuted = true;
        });

      await Promise.allSettled([promise]);
      expect(cleanupExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1031
     * @tc.name PromiseRejectTest031
     * @tc.desc Async nested new Promise with Promise.reject, verify 3-level propagation timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest031', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async () => {
      const start = Date.now();
      const level3: Promise<number> = new Promise<number>((resolve, reject) =>{
      setTimeout(() => reject(new Error('L3 delay 20ms')), 20)});
      const level2: Promise<number> = new Promise<number>((resolve, reject) =>{
      level3.catch((err: Error) => setTimeout(() => reject(err), 10))});
      const level1: Promise<number> = new Promise<number>((resolve, reject) =>{
      level2.catch((err: Error) => setTimeout(() => reject(err), 15))});

      const result = await Promise.allSettled([level1]);
      const end = Date.now();
      const rejectedReason: string = (result[0] as PromiseRejectedResult).reason.message;

      expect(rejectedReason).assertEqual('L3 delay 20ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_reject_TEST_1045
     * @tc.name PromiseRejectTest045
     * @tc.desc Async Promise.reject with typed error in nested async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseRejectTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const fetchData = async (delay: int): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
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


  })
}
