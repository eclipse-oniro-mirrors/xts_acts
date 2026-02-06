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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index'
// import { lang, taskpool } from '@kit.ArkTS';
import {
  printAny1,
  printAny2,
  printSendableFunction1,
  printSendableFunction2,
  sampleFunction
} from '../testability/pages/TaskParamTest';
import { Count1, Count2, Count3, Count4, } from '../testability/pages/DataFlg';
import { BusinessError } from "@ohos.base";
import { sleep } from '../testability/pages/Utils';


export default function taskPoolAsyncRunnerAbility3() {
  describe('TaskPoolAsyncRunnerAbility3', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(50)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5300
     * @tc.name taskPoolAsyncRunnerAbility5300
     * @tc.desc Create two tasks with ISendable interface parameters and ISendable interface return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerAbility5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     console.log('taskPoolAsyncRunnerAbility5300: begin');
    //     let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //     let iSendable1: number = 1.0;
    //     let iSendable2: string = 'test2';
    //     let Count1: number = 0;
    //     let Count2: number = 0;
    //     for (let i = 0; i < 10; i++) {
    //       let task: taskpool.Task = new taskpool.Task(printISendable1, iSendable1);
    //       let task2: taskpool.Task = new taskpool.Task(printISendable2, iSendable2);
    //       asyncRunner.execute(task).then(() => {
    //         Count1++;
    //         console.info('======', Count1);
    //       });
    //       await sleep(100);
    //       asyncRunner.execute(task2).then(() => {
    //         Count2++;
    //         console.info('======', Count2);
    //       });
    //     }
    //     while (Count1 < 10 || Count2 < 10) {
    //       await sleep(100)
    //     }
    //     expect(10).assertEqual(Count1)
    //     expect(10).assertEqual(Count2)
    //     Count1 = 0;
    //     Count2 = 0;
    //     console.log('taskPoolAsyncRunnerAbility5300: end');
    //
    //   })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5400
     * @tc.name taskPoolAsyncRunnerAbility5400
     * @tc.desc Create two tasks with ISendable interface parameters and ISendable interface return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerAbility5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //    async (): Promise<void> => {
    //     console.log('taskPoolAsyncRunnerAbility5400: begin');
    //     let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //     let iSendable1: number = 1
    //     let iSendable2: string ='test2'
    //     let count: number = 0;
    //     let count2: number = 0;
    //     let Count3: number = 0;
    //     let Count4: number = 0;
    //     const promises: Promise<void>[] = [];
    //     for (let i = 0; i < 10; i++) {
    //       let task: taskpool.Task = new taskpool.Task(printISendable3, iSendable1);
    //       let task2: taskpool.Task = new taskpool.Task(printISendable4, iSendable2);
    //       try {
    //         asyncRunner.execute(task)
    //           .then(() => {
    //             Count3++;
    //             console.info('======', Count3);
    //           })
    //           .catch((error: Error) => {
    //             expect(error.message).assertContain('Cannot read property split of undefined');
    //             count++;
    //             console.error(`error message error: ${JSON.stringify(error.message)}`);
    //           });
    //
    //         asyncRunner.execute(task2)
    //           .then(() => {
    //             Count4++;
    //             console.info('======', Count4);
    //           })
    //           .catch((error: Error) => {
    //             expect(error.message).assertContain('Cannot read property split of undefined');
    //             count2++;
    //             console.error(`error message error: ${JSON.stringify(error.message)}`);
    //           });
    //       } catch (e) {
    //         console.error(`error message e: ${JSON.stringify(e)}`)
    //       }
    //     }
    //     while (count < 10 || count2 < 10) {
    //       await sleep(100);
    //     }
    //     expect(0).assertEqual(Count3);
    //     expect(0).assertEqual(Count4);
    //     expect(10).assertEqual(count);
    //     Count3 = 0;
    //     Count4 = 0;
    //     console.log('taskPoolAsyncRunnerAbility5400: end');
    //
    //   })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5500
     * @tc.name taskPoolAsyncRunnerAbility5500
     * @tc.desc Create two tasks with SendableFunction parameters and SendableFunction return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerAbility5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
       async (): Promise<void> => {
        console.log('taskPoolAsyncRunnerAbility5500: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printSendableFunction1, sampleFunction);
          let task2: taskpool.Task = new taskpool.Task(printSendableFunction2, sampleFunction);
          try {
            asyncRunner.execute(task).then((_result) => {
              Count1++;

              // const newResult = result as Function;
              // newResult(sampleFunction);
            });

            asyncRunner.execute(task2).then((_result) => {
              Count2++;

              // const newResult = result as Function;
              // newResult(sampleFunction);
            });
          } catch (error) {
            console.error('Error executing task group:', error);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility5500: end');

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5600
     * @tc.name taskPoolAsyncRunnerAbility5600
     * @tc.desc Create two tasks with SendableClass parameters and SendableClass return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerAbility5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
       async (): Promise<void> => {
        console.log('taskPoolAsyncRunnerAbility5600: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printAny1, 1, 'test');
          let task2: taskpool.Task = new taskpool.Task(printAny2, 2, 'test2');
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          }).catch((error: Error) => {
            Count1++;
            console.error(`error message error: ${JSON.stringify(error.message)}`);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          }).catch((error: Error) => {
            Count2++;
            console.error(`error message error: ${JSON.stringify(error.message)}`);
          });
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100)
        }
        expect(10).assertEqual(Count1)
        expect(10).assertEqual(Count2)
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility5600: end');

      })
  })
}