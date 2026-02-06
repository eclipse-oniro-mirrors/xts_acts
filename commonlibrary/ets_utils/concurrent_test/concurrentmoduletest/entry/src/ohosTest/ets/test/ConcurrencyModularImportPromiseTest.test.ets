/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  stringPromise,
  arrayPromise,
  createDelayedPromise,
  createDelayedRejectPromise,
  createFaultyPromise2,
  createProblematicPromise,
  createPromiseAllWithContext,
  errorPromise,
  existingSendablePromise,
  functionPromise,
  nullPromise,
  numberPromise,
  objectPromise,
  undefinedPromise,
} from 'library1/src/main/ets/components/ConcurrencyModularImportPromiseTest';
import {
  handleFaultyPromise,
  handleFaultyPromise2,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4
} from '../testability/pages/methods';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function ConcurrencyModularImportPromiseTest() {
  describe('ConcurrencyModularImportPromiseTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   ConcurrencyModularImportPromiseTest0100
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0100';
        console.info(`${caseName} test start`);
        const stringResult = await stringPromise;
        console.log('String result:', stringResult);
        expect('Hello from string Promise').assertEqual(stringResult.toString())
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0200
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0200';
        console.info(`${caseName} test start`);
        const numberResult = await numberPromise;
        console.log('String result:', numberResult);
        expect(42).assertEqual(numberResult)
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0300
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0300';
        console.info(`${caseName} test start`);
        const Result = await objectPromise;
        console.log('String result:', Result);
        expect(Result.name).assertEqual('Alice');
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0400
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0400';
        console.info(`${caseName} test start`);
        const arrResult = await arrayPromise;
        expect(arrResult.length).assertEqual(3);
        expect(arrResult[0]).assertEqual('apple');
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0500
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0500';
        console.info(`${caseName} test start`);
        const undefinedResult = await undefinedPromise;
        expect(undefinedResult).assertUndefined();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0600
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0600';
        console.info(`${caseName} test start`);
        const funcResult = await functionPromise;
        expect(funcResult()).assertEqual(42);
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0700
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0700';
        console.info(`${caseName} test start`);
        const nullResult = await nullPromise;
        expect(nullResult).assertNull();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0800
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0800';
        console.info(`${caseName} test start`);
        let flag: boolean = false
        try {
          const Result = await errorPromise;
          console.info('Result:', Result)
        } catch (err) {
          const error = err as Error;
          console.info('error.message:', error.message)
          flag = true;
          expect(error.message).assertEqual('Standard error occurred');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest0900
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest0900';
        console.info(`${caseName} test start`);
        const result = await existingSendablePromise;
        expect(result).assertContain('ExistingInstance');
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1000
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false
        await createProblematicPromise()
          .then((result) => {
          }).catch((error: Error) => {
            expect(error.message).assertEqual('Error thrown during resolution')
            console.log('Catch block - error caught:', error.message);
            flag = true;
          })
          .finally(() => {
            console.log('Finally block - this always runs');
          });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1100
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1100';
        console.info(`${caseName} test start`);
        const promises = [
          createDelayedPromise(1),
          createDelayedPromise(2),
          createDelayedPromise(3),
        ];
        const allResults = await Promise.all(promises);
        console.log('All promises resolved:', allResults);
        expect(allResults.toString()).assertEqual('1,2,3')
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1200
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const result = await handleFaultyPromise();
          console.log('Promise resolved with:', result);
        } catch (error) {
          flag = true;
          expect(error.message).assertEqual('wrong!')
          console.error('Promise rejected with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1300
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await new Promise<void>((resolve) => {
          setTimeout(async () => {
            await createFaultyPromise2()
              .catch((error: Error) => {
                flag = true;
                expect(error.message).assertEqual('Something went wrong!');
              });
            resolve();
          }, 200);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1400
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await new Promise<void>((resolve) => {
          setTimeout(async () => {
            await createDelayedRejectPromise()
              .catch((error: Error) => {
                flag = true;
                expect(error.message).assertEqual('Something went wrong!');
              });
            resolve();
          }, 200);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1500
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await new Promise<void>((resolve) => {
          setTimeout(async () => {
            await createDelayedRejectPromise()
              .catch((error: Error) => {
                flag = true;
                expect(error.message).assertEqual('Something went wrong!');
              });
            resolve();
          }, 200);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1600
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await new Promise<void>((resolve) => {
          setTimeout(async () => {
            const values = [1, 2, 3, 4, 5];
            await createPromiseAllWithContext(values)
              .then((results) => {
                flag = true;
                expect(results.toString()).assertEqual('1,2,3,4,5');
                console.log('All promises resolved with:', results);
              });
            resolve();
          }, 200);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1700
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await new Promise<void>((resolve) => {
          setTimeout(async () => {
            const values = [1, 2, 3, 4, 5];
            await createPromiseAllWithContext(values)
              .then((results) => {
                flag = true;
                expect(results.toString()).assertEqual('1,2,3,4,5');
                console.log('All promises resolved with:', results);
              });
            resolve();
          }, 200);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1800
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          const result = await handleFaultyPromise2();
          console.log('Promise resolved with:', result);
        } catch (error) {
          flag = true;
          expect(error.message).assertEqual('wrong!')
          console.error('Promise rejected with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest1900
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest1900';
        console.info(`${caseName} test start`);
        const fastPromise: Promise<number> = Promise.resolve(10);
        let flag: boolean = false;
        try {
          const result = await Promise.race([numberPromise, fastPromise]);
          expect(result).assertEqual(42);
          flag = true;
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2000
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          await taskpool.execute(task1).then(() => {
            flag = true;
          });
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2100
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs2, 1);
          await taskpool.execute(task1).then(() => {
            flag = true;
          });
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2700
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs2, 1);
          await taskpool.execute(task1).then(() => {
            flag = true;
          });
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2200
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2200';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(1);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2300
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2300';
        console.info(`${caseName} test start`);
        let count: string = '';
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(2);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 'Hello from string Promise') {
          await sleep(300)
        }
        expect(count).assertEqual('Hello from string Promise');
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2400
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2400';
        console.info(`${caseName} test start`);
        let count: string = '';
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(2);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 'Hello from string Promise') {
          await sleep(300)
        }
        expect(count).assertEqual('Hello from string Promise');
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2500
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
          await taskpool.execute(task1).then(() => {
            flag = true;
          });
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   ConcurrencyModularImportPromiseTest2600
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_PROMISE_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyModularImportPromiseTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportPromiseTest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);
          await taskpool.execute(task1).then(() => {
            flag = true;
          });
        } catch (error) {
          console.error('Promise with error:', error.message);
        } finally {
          console.log('Promise processing completed.');
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });


  })
}

