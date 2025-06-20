/*
 * Copyright (C) 2025 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';

export default function PromiseAnySecondTest() {
  describe('PromiseAnySecondTest', () => { // Renamed describe block
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('PromiseAnySecondTest beforeAll called');
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      console.info('PromiseAnySecondTest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(100);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('PromiseAnySecondTest afterEach called');
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('PromiseAnySecondTest afterAll called');
    })

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_2700
     * @tc.name PromiseAnySecondTest2700
     * @tc.desc Test execution order: p1.catch -> any([p1, p2]) -> any.catch. Both p1 and p2 reject.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest2700';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 50;
      const p2RejectDelay = 10;
      const overallDelay = 150;
      const p1RejectError = 'p1 rejection';
      const p2RejectError = 'p2 rejection';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = new Promise<string>((_, reject) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 rejecting');
          reject(new Error(p2RejectError));
        }, p2RejectDelay);
      });

      p1.catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 catch attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise.catch(() => {
        executionOrder.push('any catch executed');
      });
      executionOrder.push('any catch attached');

      try {
        executionOrder.push('awaiting any');
        await anyPromise;
        executionOrder.push('any unexpectedly fulfilled');
        expect(true).assertFalse();

      } catch (error) {
        executionOrder.push('any rejected');
        expect(error.name).assertEqual('AggregateError');

        await sleep(0);
        executionOrder.push('after microtask wait');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 catch attached',
          'any creation',
          'any catch attached',
          'awaiting any',
          'p2 rejecting',
          'p1 rejecting',
          'p1 catch executed',
          'any catch executed',
          'any rejected',
          'after microtask wait',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_2800
     * @tc.name PromiseAnySecondTest2800
     * @tc.desc Test execution order: p1.catch -> any([p1, p2]) -> any.catch. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest2800';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 50;
      const p2RejectDelay = 10;
      const overallDelay = 150;
      const p1RejectError = 'p1 rejection again';
      const p2RejectError = 'p2 rejection again';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = new Promise<string>((_, reject) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 rejecting');
          reject(new Error(p2RejectError));
        }, p2RejectDelay);
      });

      p1.catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 catch attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise.catch(() => {
        executionOrder.push('any catch executed');
      });
      executionOrder.push('any catch attached');

      try {
        executionOrder.push('awaiting any');
        await anyPromise;
        executionOrder.push('any unexpectedly fulfilled');
        expect(true).assertFalse();

      } catch (error) {
        executionOrder.push('any rejected');
        expect(error.name).assertEqual('AggregateError');

        await sleep(0);
        executionOrder.push('after microtask wait');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 catch attached',
          'any creation',
          'any catch attached',
          'awaiting any',
          'p2 rejecting',
          'p1 rejecting',
          'p1 catch executed',
          'any catch executed',
          'any rejected',
          'after microtask wait',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_2900
     * @tc.name PromiseAnySecondTest2900
     * @tc.desc Test execution order: p1.then -> p1.finally(throws) -> any([p1, p2]) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest2900';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 50;
      const overallDelay = 150;
      const p1FinallyErrorMessage = 'Error intentionally thrown in p1.finally';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');

      p1.finally(() => {
        executionOrder.push('p1 finally executed (throws)');
        throw new Error(p1FinallyErrorMessage);
      }).catch(() => {
        console.warn(`${caseName}: Caught expected error from p1.finally: ${p1FinallyErrorMessage}`);
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'p1 finally executed (throws)',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3000
     * @tc.name PromiseAnySecondTest3000
     * @tc.desc Test execution order: p1.then -> p1.finally(throws) -> any([p1, p2]) -> any.then. 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3000';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 50;
      const overallDelay = 150;
      const p1FinallyErrorMessage = 'Error intentionally thrown in p1.finally again';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');

      p1.finally(() => {
        executionOrder.push('p1 finally executed (throws)');
        throw new Error(p1FinallyErrorMessage);
      }).catch(() => {
        console.warn(`${caseName}: Caught expected error from p1.finally: ${p1FinallyErrorMessage}`);
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'p1 finally executed (throws)',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3100
     * @tc.name PromiseAnySecondTest3100
     * @tc.desc Test execution order: p1.then -> p1.finally -> any([p1, p2]) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3100';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 50;
      const overallDelay = 150;

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');

      p1.finally(() => {
        executionOrder.push('p1 finally executed');
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'p1 finally executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3200
     * @tc.name PromiseAnySecondTest3200
     * @tc.desc Test execution order: p1(rejects).finally(throws) -> any([p1, p2]) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3200';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 50;
      const overallDelay = 150;
      const p1FinallyErrorMessage = 'Error intentionally thrown in p1.finally after rejection';
      const p1RejectError = 'p1 intentional rejection';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.finally(() => {
        executionOrder.push('p1 finally executed (throws)');
        throw new Error(p1FinallyErrorMessage);
      }).catch(() => {
        console.warn(`${caseName}: Caught expected error originating from p1.finally: ${p1FinallyErrorMessage}`);
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 rejecting',
          'p1 finally executed (throws)',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3300
     * @tc.name PromiseAnySecondTest3300
     * @tc.desc Test execution order: p1(rejects).finally(throws) -> any([p1, p2]) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3300';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 60;
      const overallDelay = 160;
      const p1FinallyErrorMessage = 'Error from finally in 3300';
      const p1RejectError = 'p1 rejection in 3300';
      const p2ResolveValue = 'p2 immediate value in 3300';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = Promise.resolve(p2ResolveValue);
      executionOrder.push('p2 created');

      p1.finally(() => {
        executionOrder.push('p1 finally executed (throws)');
        throw new Error(p1FinallyErrorMessage);
      }).catch(() => {
        console.warn(`${caseName}: Caught expected error originating from p1.finally: ${p1FinallyErrorMessage}`);
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p2ResolveValue);
          return 'from any then 1 in 3300';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 3300');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p2ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 rejecting',
          'p1 finally executed (throws)',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3400
     * @tc.name PromiseAnySecondTest3400
     * @tc.desc Test execution order: p1(rejects).finally -> any([p1, p2]) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3400';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 50;
      const overallDelay = 150;
      const p1RejectError = 'p1 intentional rejection in 3400';
      const p2ResolveValue = 'p2 immediate value in 3400';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = Promise.resolve(p2ResolveValue);
      executionOrder.push('p2 created');

      p1.finally(() => {
        executionOrder.push('p1 finally executed');
      }).catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 finally attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p2ResolveValue);
          return 'from any then 1 in 3400';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 3400');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p2ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 finally attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 rejecting',
          'p1 finally executed',
          'p1 catch executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3500
     * @tc.name PromiseAnySecondTest3500
     * @tc.desc Test execution order: p1 resolves immediately, then p1.then throws, then create any([p1, p2]), then any.then executes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3500';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const overallDelay = 150;
      const p1ThenErrorMessage = 'Error thrown in p1.then in 3500';
      const p1ResolveValue = 'p1 resolved value in 3500';
      const p2ResolveValue = 'p2 immediate value in 3500';

      executionOrder.push('start');

      const p1 = Promise.resolve(p1ResolveValue);
      executionOrder.push('p1 created and resolved');

      const p2 = Promise.resolve(p2ResolveValue);
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed (throws)');
        throw new Error(p1ThenErrorMessage);
      }).catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 then attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p1ResolveValue);
          return 'from any then 1 in 3500';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 3500');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p1ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created and resolved',
          'p2 created',
          'p1 then attached',      
          'any creation',          
          'any thens attached',    
          'awaiting any',
          'p1 then executed (throws)',
          'p1 catch executed',
          'any then 1 executed',   
          'any then 2 executed',
          'after microtask wait',  
          'any awaited',           
          'final wait complete'    
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3600
     * @tc.name PromiseAnySecondTest3600
     * @tc.desc Test execution order: p1 resolves -> any([p1, p2]) -> p1.then(throws) -> any.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3600';
      const executionOrder: string[] = [];
      const p1ThenErrorMessage = 'Error thrown in p1.then in 3600';
      const p1ResolveValue = 'p1 resolved value in 3600';
      const p2ResolveValue = 'p2 immediate value in 3600';

      executionOrder.push('start');

      const p1 = Promise.resolve(p1ResolveValue);
      executionOrder.push('p1 created and resolved');

      const p2 = Promise.resolve(p2ResolveValue);
      executionOrder.push('p2 created');

      executionOrder.push('any creation');
      const anyPromise = Promise.any<string>([p1, p2]);

      p1.then(() => {
        executionOrder.push('p1 then executed (throws)');
        throw new Error(p1ThenErrorMessage);
      }).catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 then attached');

      anyPromise.then((value) => {
        executionOrder.push('any then executed');
        expect(value).assertEqual(p1ResolveValue);
      });
      executionOrder.push('any then attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        const p1ThenIndex = executionOrder.indexOf('p1 then executed (throws)');
        const anyThenIndex = executionOrder.indexOf('any then executed');
        
        console.info(`${caseName} Actual execution order: ${JSON.stringify(executionOrder)}`);

        expect(executionOrder.includes('p1 then executed (throws)')).assertTrue();
        expect(executionOrder.includes('any then executed')).assertTrue();
        expect(p1ThenIndex).assertLess(anyThenIndex)
        expect(result).assertEqual(p1ResolveValue);

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly: ${error instanceof Error ? error.message : String(error)}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3700
     * @tc.name PromiseAnySecondTest3700
     * @tc.desc Test execution order: p1 resolves -> any([p1, p2]) -> any.then(throws) -> any.catch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3700';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1ResolveDelay = 50;
      const overallDelay = 150;
      const anyThenErrorMessage = 'Error thrown in any.then in 3700';
      const p1ResolveValue = 'p1 resolved value in 3700';
      const p2ResolveValue = 'p2 immediate value in 3700';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve(p1ResolveValue);
        }, p1ResolveDelay);
      });

      const p2 = Promise.resolve(p2ResolveValue);
      executionOrder.push('p2 created');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed (throws)');
          expect(value).assertEqual(p2ResolveValue);
          throw new Error(anyThenErrorMessage);
        })
        .then(() => {
          executionOrder.push('any then 2 executed (should not happen)');
        })
        .catch(() => {
          executionOrder.push('any catch executed');
        });
      executionOrder.push('any thens/catch attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p2ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'any thens/catch attached',
          'awaiting any',
          'any then 1 executed (throws)',
          'any catch executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3800
     * @tc.name PromiseAnySecondTest3800
     * @tc.desc Test execution order: any([p1, p2]) -> p1 resolves -> any.then -> p2.then.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3800';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1ResolveDelay = 50;
      const p2ResolveDelay = 100;
      const overallDelay = 200;
      const p1ResolveValue = 'p1 resolved value in 3800';
      const p2ResolveValue = 'p2 resolved value in 3800';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve(p1ResolveValue);
        }, p1ResolveDelay);
      });

      const p2 = new Promise<string>((resolve) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 resolving');
          resolve(p2ResolveValue);
        }, p2ResolveDelay);
      });

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p1ResolveValue);
          return 'from any then 1 in 3800';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 3800');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens/catch attached');

      p2.then((value) => {
        executionOrder.push('p2 then executed');
        expect(value).assertEqual(p2ResolveValue);
      });
      executionOrder.push('p2 then attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p1ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'any thens/catch attached',
          'p2 then attached',
          'awaiting any',
          'p1 resolving',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p2 resolving',
          'p2 then executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_3900
     * @tc.name PromiseAnySecondTest3900
     * @tc.desc Test execution order: any([p1, p2]) -> any.then/catch -> p1.then -> p2.catch. p1 resolves, p2 rejects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest3900';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1ResolveDelay = 50;
      const p2RejectDelay = 100;
      const overallDelay = 200;
      const p1ResolveValue = 'p1 resolved value in 3900';
      const p2RejectError = 'p2 rejected in 3900';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve(p1ResolveValue);
        }, p1ResolveDelay);
      });

      const p2 = new Promise<string>((_, reject) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 rejecting');
          reject(new Error(p2RejectError));
        }, p2RejectDelay);
      });

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p1ResolveValue);
          return 'from any then 1 in 3900';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 3900');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens/catch attached');

      p1.then((value) => {
        executionOrder.push('p1 then executed');
        expect(value).assertEqual(p1ResolveValue);
      });
      executionOrder.push('p1 then attached');

      p2.catch(() => {
        executionOrder.push('p2 catch executed');
      });
      executionOrder.push('p2 catch attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p1ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'any thens/catch attached',
          'p1 then attached',
          'p2 catch attached',
          'awaiting any',
          'p1 resolving',
          'p1 then executed',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p2 rejecting',
          'p2 catch executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_4000
     * @tc.name PromiseAnySecondTest4000
     * @tc.desc Test execution order: any([p1, p2]) -> any.then/catch -> p1.then -> p2.catch. p1 resolves, p2 rejects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest4000';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1ResolveDelay = 60;
      const p2RejectDelay = 120;
      const overallDelay = 220;
      const p1ResolveValue = 'p1 resolved value in 4000';
      const p2RejectError = 'p2 rejected in 4000';

      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve(p1ResolveValue);
        }, p1ResolveDelay);
      });

      const p2 = new Promise<string>((_, reject) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 rejecting');
          reject(new Error(p2RejectError));
        }, p2RejectDelay);
      });

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p1ResolveValue);
          return 'from any then 1 in 4000';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 4000');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens/catch attached');

      p1.then((value) => {
        executionOrder.push('p1 then executed');
        expect(value).assertEqual(p1ResolveValue);
      });
      executionOrder.push('p1 then attached');

      p2.catch(() => {
        executionOrder.push('p2 catch executed');
      });
      executionOrder.push('p2 catch attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p1ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'any thens/catch attached',
          'p1 then attached',
          'p2 catch attached',
          'awaiting any',
          'p1 resolving',
          'p1 then executed',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p2 rejecting',
          'p2 catch executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_4100
     * @tc.name PromiseAnySecondTest4100
     * @tc.desc Test execution order: any([p1, p2]) -> p1.catch -> any.then/catch -> p2.then. p1 rejects, p2 resolves.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest4100';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 100;
      const p2ResolveDelay = 50;
      const overallDelay = 200;
      const p1RejectError = 'p1 rejected in 4100';
      const p2ResolveValue = 'p2 resolved value in 4100';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      const p2 = new Promise<string>((resolve) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 resolving');
          resolve(p2ResolveValue);
        }, p2ResolveDelay);
      });

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      p1.catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 catch attached');

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p2ResolveValue);
          return 'from any then 1 in 4100';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 4100');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens/catch attached');

      p2.then((value) => {
        executionOrder.push('p2 then executed');
        expect(value).assertEqual(p2ResolveValue);
      });
      executionOrder.push('p2 then attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p2ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'p1 catch attached',
          'any thens/catch attached',
          'p2 then attached',
          'awaiting any',
          'p2 resolving',
          'p2 then executed',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 rejecting',
          'p1 catch executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_PROMISE_ANY_SECOND_TEST_4200
     * @tc.name PromiseAnySecondTest4200
     * @tc.desc Test exec order: p1.catch/finally -> any([p1,p2]) -> p2.then -> any.then/catch -> p2.finally. p1 rej, p2 res.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnySecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnySecondTest4200';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1RejectDelay = 100;
      const p2ResolveDelay = 50;
      const overallDelay = 200;
      const p1RejectError = 'p1 rejected in 4200';
      const p2ResolveValue = 'p2 resolved value in 4200';

      executionOrder.push('start');

      const p1 = new Promise<string>((_, reject) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 rejecting');
          reject(new Error(p1RejectError));
        }, p1RejectDelay);
      });

      p1.catch(() => {
        executionOrder.push('p1 catch executed');
      });
      executionOrder.push('p1 catch attached');

      p1.finally(() => {
        executionOrder.push('p1 finally executed');
      });
      executionOrder.push('p1 finally attached');

      const p2 = new Promise<string>((resolve) => {
        executionOrder.push('p2 created');
        setTimeout(() => {
          executionOrder.push('p2 resolving');
          resolve(p2ResolveValue);
        }, p2ResolveDelay);
      });

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      p2.then((value) => {
        executionOrder.push('p2 then executed');
        expect(value).assertEqual(p2ResolveValue);
      });
      executionOrder.push('p2 then attached');

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual(p2ResolveValue);
          return 'from any then 1 in 4200';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1 in 4200');
        })
        .catch(() => {
          executionOrder.push('any catch executed (should not happen)');
        });
      executionOrder.push('any thens/catch attached');

      p2.finally(() => {
        executionOrder.push('p2 finally executed');
      });
      executionOrder.push('p2 finally attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual(p2ResolveValue);

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p1 catch attached',
          'p1 finally attached',
          'p2 created',
          'any creation',
          'p2 then attached',
          'any thens/catch attached',
          'p2 finally attached',
          'awaiting any',
          'p2 resolving',
          'p2 then executed',
          'p2 finally executed',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 rejecting',
          'p1 catch executed',
          'p1 finally executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

  });
}