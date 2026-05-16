/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { sleep } from '../testability/pages/Utils';
import {
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArray1,
  printArray2,
  printArray3,
  printArray4,
  printBigint1,
  printBigint2,
  printBigint3,
  printBigint4,
  printBoolean1,
  printBoolean2,
  printBoolean3,
  printBoolean4,
  printInt16Array1,
  printInt16Array2,
  printInt16Array3,
  printInt16Array4,
  printInt32Array1,
  printInt32Array2,
  printInt32Array3,
  printInt32Array4,
  printInt8Array1,
  printInt8Array2,
  printInt8Array3,
  printInt8Array4,
  printMap1,
  printMap2,
  printMap3,
  printMap4,
  printNull1,
  printNull2,
  printNull3,
  printNull4,
  printSet1,
  printSet2,
  printSet3,
  printSet4,
  printStr1,
  printStr2,
  printStr3,
  printStr4,
  printUint16Array1,
  printUint16Array2,
  printUint16Array3,
  printUint16Array4,
  printUint32Array1,
  printUint32Array2,
  printUint32Array3,
  printUint32Array4,
  printUint8Array1,
  printUint8Array2,
  printUint8Array3,
  printUint8Array4,
  printUndefined1,
  printUndefined2,
  printUndefined3,
  printUndefined4,
} from '../testability/pages/TaskParamTest';
import {
  Count1,
  Count2,
  Count3,
  Count4,
  CountBigint1,
  CountBigint2,
  CountBol1,
  CountBol2,
  CountStr1,
  CountStr2,
  CountUndefined1,
  CountUndefined2,
} from '../testability/pages/DataFlg';
import { BusinessError } from '@kit.BasicServicesKit';

export default function taskPoolAsyncRunnerAbility() {
  describe('TaskPoolAsyncRunnerAbility', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(500);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0100
     * @tc.desc   Create two tasks with string parameters and string return values, and execute them 10 times.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0100: start');
        const str1: string = 'q1';
        const str2: string = 'q2';
        let Count1: number = 0;
        let Count2: number = 0;
        let CountStr1: string = '';
        let CountStr2: string = '';
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printStr1, str1);
          let task2: taskpool.Task = new taskpool.Task(printStr2, str2);
          asyncRunner.execute(task).then((num: object) => {
            const result1 = num;
            CountStr1 += result1;
            Count1++;
            console.info('======', CountStr1);
            console.info('======', Count1);
          })
          await sleep(100);
          asyncRunner.execute(task2).then((num: object) => {
            const result2 = num;
            CountStr2 += result2;
            Count2++;
            console.info('======', CountStr2);
            console.info('======', Count2);
          })
        }

        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect('q1'.repeat(10)).assertEqual(CountStr1);
        expect('q2'.repeat(10)).assertEqual(CountStr2);
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility0100: end');
        Done();
      })


    /**
     * @tc.name   taskPoolAsyncRunnerAbility0200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0200
     * @tc.desc   Create two tasks with string parameters and string return values, and execute them 10 times,error.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0200: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const str3: string = 'q3';
        const str4: string = 'q4';
        let Count3: number = 0;
        let Count4: number = 0;
        let Count: number = 0;
        let Count2: number = 0;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printStr3, str3);
          let task2: taskpool.Task = new taskpool.Task(printStr4, str4);
          try {
            const promise = Promise.all(
              [asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
                asyncRunner.execute(task2)
                  .then((num: object) => {
                    Count4++;
                    console.info('======', Count4);
                  })
                  .catch((error: BusinessError) => {
                    expect(error.message).assertContain('Cannot read property split of undefined');
                    Count2++;
                    console.error(`error message error: ${JSON.stringify(error.message)}`);
                  })]);
            promises.push(promise);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await Promise.all(promises);
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        expect(10).assertEqual(Count2);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility0200: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0300
     * @tc.desc   Create two tasks with number parameters and number return values, and execute them 10 times.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0300: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const num1: number = 1;
        const num2: number = 2;
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, num1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, num2);
          asyncRunner.execute(task).then((num: object) => {
            Count1 = Count1 + Number(num);
            console.info('======', Count1);
          })
          await sleep(100);
          asyncRunner.execute(task2).then((num: object) => {
            Count2 = Count2 + Number(num);
            console.info('======', Count2);
          })
        }
        while (Count2 < 20 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(20).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility0300: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0400
     * @tc.desc   Create two tasks with number parameters and number return values, and execute them 10 times,error.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0400: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const num1: number = 1;
        const num2: number = 2
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, num1);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, num2);
          try {
            asyncRunner.execute(task).then((num: object) => {
              Count3 = Count3 + Number(num);
              console.info('======', Count3);
            }).catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined');
              Count++;
              console.error(`error message error: ${JSON.stringify(error.message)}`);
            });
            asyncRunner.execute(task2).then((num: object) => {
              Count4 = Count4 + Number(num);
              console.info('======', Count4);
            }).catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined');
              Count2++;
              console.error(`error message error: ${JSON.stringify(error.message)}`);
            });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await sleep(1000);
        while (Count < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility0400: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0500
     * @tc.desc   Create two tasks with boolean parameters and boolean return values, and execute them 10 times.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0500: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let CountBol1:boolean  = false;
        let CountBol2:boolean = true;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBoolean1, false);
          let task2: taskpool.Task = new taskpool.Task(printBoolean2, true);
          const promise = Promise.all([
            asyncRunner.execute(task).then((num: object) => {
              CountBol1 = Boolean(num);
              console.info('======', CountBol1);
            }),
            asyncRunner.execute(task2).then((num: object) => {
              CountBol2 = Boolean(num);
              console.info('======', CountBol2);
            })
          ])
          promises.push(promise);
        }
        await Promise.all(promises);
        expect(false).assertEqual(CountBol1);
        expect(true).assertEqual(CountBol2);
        CountBol1 = false;
        CountBol2 = true;
        console.info('taskPoolAsyncRunnerAbility0500: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0600
     * @tc.desc   Create two tasks with boolean parameters and boolean return values, and execute them 10 times,error.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0600: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBoolean3, false);
          let task2: taskpool.Task = new taskpool.Task(printBoolean4, true);
          try {
            const promise = Promise.all(
              [asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
                asyncRunner.execute(task2)
                  .then((num: object) => {
                    Count4++;
                    console.info('======', Count4);
                  })
                  .catch((error: BusinessError) => {
                    expect(error.message).assertContain('Cannot read property split of undefined');
                    Count2++;
                    console.error(`error message error: ${JSON.stringify(error.message)}`);
                  })]);
            promises.push(promise);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await Promise.all(promises);
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility0600: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0700
     * @tc.desc   Create two tasks with bigint parameters and bigint return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0700: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let CountBigint1:bigint = 0n;
        let CountBigint2:bigint = 0n;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBigint1, 1n);
          let task2: taskpool.Task = new taskpool.Task(printBigint2, 2n);
          asyncRunner.execute(task).then((num: object) => {
            CountBigint1 = CountBigint1 + BigInt(Number(num));
            console.info('======', CountBigint1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then((num: object) => {
            CountBigint2 = CountBigint2 + BigInt(Number(num));
            console.info('======', CountBigint2);
          });
        }

        while (CountBigint1 !== 10n || CountBigint2 !== 20n) {
          await sleep(100);
        }
        expect(10n).assertEqual(CountBigint1);
        expect(20n).assertEqual(CountBigint2);
        CountBigint1 = 0n;
        CountBigint2 = 0n;
        console.info('taskPoolAsyncRunnerAbility0700: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0800
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0800
     * @tc.desc   Create two tasks with bigint parameters and bigint return values, and execute them 10 times,error.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0800: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBigint3, 1n);
          let task2: taskpool.Task = new taskpool.Task(printBigint4, 2n);
          try {
            const promise = Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
            promises.push(promise);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await Promise.all(promises);

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        console.info('taskPoolAsyncRunnerAbility0800: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility0900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_0900
     * @tc.desc   Create two tasks with undefined parameters and undefined return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility0900: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUndefined1, Object(undefined));
          let task2: taskpool.Task = new taskpool.Task(printUndefined2, Object(undefined));
          asyncRunner.execute(task).then((num: object) => {
            CountUndefined1.count;
            console.info('======', CountUndefined1.count);
          });
          await sleep(100);
          asyncRunner.execute(task2).then((num: object) => {
            CountUndefined2.count;
            console.info('======', CountUndefined2.count);
          });
        }
        await sleep(1000);
        expect().assertEqual(CountUndefined1.count);
        expect().assertEqual(CountUndefined2.count);
        CountUndefined1.count;
        CountUndefined1.count;
        console.info('taskPoolAsyncRunnerAbility0900: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1000
     * @tc.desc   Create two tasks with undefined parameters and undefined return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1000: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUndefined3);
          let task2: taskpool.Task = new taskpool.Task(printUndefined4);
          try {
            const promise = Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
            promises.push(promise);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await Promise.all(promises);

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility0800: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1100
     * @tc.desc   Create two tasks with null parameters and null return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1100: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printNull1, Object(null));
          let task2: taskpool.Task = new taskpool.Task(printNull2, Object(null));
          asyncRunner.execute(task).then((result) => {
            console.info('======result:', JSON.stringify(result));
            expect(JSON.stringify(result)).assertEqual(JSON.stringify({}));
            Count1++;
            console.info('======', Count1);
          });
          asyncRunner.execute(task2).then((result) => {
            console.info('======result:', JSON.stringify(result));
            expect(JSON.stringify(result)).assertEqual(JSON.stringify({}));
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility1100: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1200
     * @tc.desc   Create two tasks with null parameters and null return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1200: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        const promises: Promise<[void, void]>[] = [];
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printNull3, Object(null));
          let task2: taskpool.Task = new taskpool.Task(printNull4, Object(null));
          try {
            const promise = Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
            ]);
            promises.push(promise);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        await Promise.all(promises);

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility1200: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1300
     * @tc.desc   Create two tasks with Array parameters and Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1300: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const Array1: Array<number> = [1, 2, 3];
        const Array2: Array<number> = [4, 5, 6];
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArray1, Array1);
          let task2: taskpool.Task = new taskpool.Task(printArray2, Array2);
          asyncRunner.execute(task).then((results) => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then((results) => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility1300: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1400
     * @tc.desc   Create two tasks with Array parameters and Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const Array1: Array<number> = [1, 2, 3];
        const Array2: Array<number> = [4, 5, 6];
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArray3, Array1);
          let task2: taskpool.Task = new taskpool.Task(printArray4, Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })
            ]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility1400: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_01500
     * @tc.desc   Create two tasks with Map parameters and Map return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1500: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const map1: Map<string, number> = new Map([['Test1', 1]]);
        const map2: Map<string, number> = new Map([['Test2', 2]]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printMap1, map1);
          let task2: taskpool.Task = new taskpool.Task(printMap2, map2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1)
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility1500: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_01600
     * @tc.desc   Create two tasks with Map parameters and Map return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1600: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const map1: Map<string, number> = new Map([['Test1', 1]]);
        const map2: Map<string, number> = new Map([['Test2', 2]]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printMap3, map1);
          let task2: taskpool.Task = new taskpool.Task(printMap4, map1);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++
                  console.info('======', Count3)
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined')
                  Count++
                  console.error(`error message error: ${JSON.stringify(error.message)}`)
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++
                  console.info('======', Count4)
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined')
                  Count2++
                  console.error(`error message error: ${JSON.stringify(error.message)}`)
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility1600: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1700
     * @tc.desc   Create two tasks with Set parameters and Set return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1700: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const set1: Set<number> = new Set([1, 2, 3]);
        const set2: Set<number> = new Set([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printSet1, set1);
          let task2: taskpool.Task = new taskpool.Task(printSet2, set2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          })
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100)
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility1700: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1800
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1800
     * @tc.desc   Create two tasks with Set parameters and Set return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility1800: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const set1: Set<number> = new Set([1, 2, 3]);
        const set2: Set<number> = new Set([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printSet3, set1);
          let task2: taskpool.Task = new taskpool.Task(printSet4, set2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        console.info('taskPoolAsyncRunnerAbility1800: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility1900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_1900
     * @tc.desc   Create two tasks with Int8Array parameters and Int8Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility1900: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int8Array1 = new Int8Array([1, 2, 3]);
        const int8Array2 = new Int8Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt8Array1, int8Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt8Array2, int8Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility1900: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2000
     * @tc.desc   Create two tasks with Int8Array parameters and Int8Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2000: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int8Array1 = new Int8Array([1, 2, 3]);
        const int8Array2 = new Int8Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt8Array3, int8Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt8Array4, int8Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })])
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility2000: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2100
     * @tc.desc   Create two tasks with Uint8Array parameters and Uint8Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2100: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint8Array1 = new Uint8Array([1, 2, 3]);
        const uint8Array2 = new Uint8Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint8Array1, uint8Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint8Array2, uint8Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility2100: end');
        Done()
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2200
     * @tc.desc   Create two tasks with Uint8Array parameters and Uint8Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2200: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint8Array1 = new Uint8Array([1, 2, 3]);
        const uint8Array2 = new Uint8Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint8Array3, uint8Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint8Array4, uint8Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility2200: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2300
     * @tc.desc   Create two tasks with Int16Array parameters and Int16Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2300: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int16Array1 = new Int16Array([1, 2, 3]);
        const int16Array2 = new Int16Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt16Array1, int16Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt16Array2, int16Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility2300: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2400
     * @tc.desc   Create two tasks with Int16Array parameters and Int16Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2400: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int16Array1 = new Int16Array([1, 2, 3]);
        const int16Array2 = new Int16Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt16Array3, int16Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt16Array4, int16Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility2400: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2500
     * @tc.desc   Create two tasks with Uint16Array parameters and Uint16Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2500: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint16Array1 = new Uint16Array([1, 2, 3]);
        const uint16Array2 = new Uint16Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint16Array1, uint16Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint16Array2, uint16Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility2500: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2600
     * @tc.desc   Create two tasks with Uint16Array parameters and Uint16Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2600: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint16Array1 = new Uint16Array([1, 2, 3]);
        const uint16Array2 = new Uint16Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint16Array3, uint16Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint16Array4, uint16Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility2600: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2700
     * @tc.desc   Create two tasks with Int32Array parameters and Int32Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2700: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int32Array1 = new Int32Array([1, 2, 3]);
        const int32Array2 = new Int32Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt32Array1, int32Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt32Array2, int32Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility2700: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2800
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2800
     * @tc.desc   Create two tasks with Int32Array parameters and Int32Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2800: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const int32Array1 = new Int32Array([1, 2, 3]);
        const int32Array2 = new Int32Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printInt32Array3, int32Array1);
          let task2: taskpool.Task = new taskpool.Task(printInt32Array4, int32Array2);
          try {
            await Promise.all([
              asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
              asyncRunner.execute(task2)
                .then((num: object) => {
                  Count4++;
                  console.info('======', Count4);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count2++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility2800: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility2900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_2900
     * @tc.desc   Create two tasks with Uint32Array parameters and Uint32Array return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility2900: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint32Array1 = new Uint32Array([1, 2, 3]);
        const uint32Array2 = new Uint32Array([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint32Array1, uint32Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint32Array2, uint32Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info('taskPoolAsyncRunnerAbility2900: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3000
     * @tc.desc   Create two tasks with Uint32Array parameters and Uint32Array return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.info('taskPoolAsyncRunnerAbility3000: start');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint32Array1 = new Uint32Array([1, 2, 3]);
        const uint32Array2 = new Uint32Array([4, 5, 6]);
        let Count: number = 0;
        let Count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint32Array3, uint32Array1);
          let task2: taskpool.Task = new taskpool.Task(printUint32Array4, uint32Array2);
          try {
            await Promise.all(
              [asyncRunner.execute(task)
                .then((num: object) => {
                  Count3++;
                  console.info('======', Count3);
                })
                .catch((error: BusinessError) => {
                  expect(error.message).assertContain('Cannot read property split of undefined');
                  Count++;
                  console.error(`error message error: ${JSON.stringify(error.message)}`);
                }),
                asyncRunner.execute(task2)
                  .then((num: object) => {
                    Count4++;
                    console.info('======', Count4);
                  })
                  .catch((error: BusinessError) => {
                    expect(error.message).assertContain('Cannot read property split of undefined');
                    Count2++;
                    console.error(`error message error: ${JSON.stringify(error.message)}`);
                  })]);
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`)
          }
        }

        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(Count);
        Count3 = 0;
        Count4 = 0;
        console.info('taskPoolAsyncRunnerAbility3000: end');
        Done();
      })
  })
}