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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
// import { taskpool } from '@kit.ArkTS';
import { Count1, Count2 } from '../testability/pages/DataFlg';
import {
  cancelTask,
  printArgs1,
  // printArgs1001,
  // printArgs1002,
  // printArgs1005,
  // printArgs1006,
  printArgs1007,
  printArgs1008,
  printArgs1011,
  printArgs1012,
  printArgs1013,
  printArgs1014,
} from '../testability/pages/TaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';
// import { printArgs1003, printArgs1004 } from '../testability/pages/pages/SendableTest';


export default function taskPoolAsyncRunnerActTest() {
  describe('TaskPoolAsyncRunnerActTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
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
      await sleep(50);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1001
     * @tc.name taskPoolAsyncRunnerActTest1001
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    // it('taskPoolAsyncRunnerActTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
    //   let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //   let Count1: number = 0;
    //   let Count2: number = 0;
    //   for (let i = 0; i < 10; i++) {
    //     let task: taskpool.Task = new taskpool.Task(printArgs1001, 1);   //printArgs1001
    //     let task2: taskpool.Task = new taskpool.Task(printArgs1002, 2);  //printArgs1002
    //   //   asyncRunner.execute(task).then((num: object) => {
    //   //     Count1 = Count1 + Number(num);
    //   //     console.info('======', Count1);
    //   //   });
    //   //   asyncRunner.execute(task2).then((num: object) => {
    //   //     Count2 = Count2 + Number(num);
    //   //     console.info('======', Count1);
    //   //   });
    //   // }
    //
    //     /* 用 async/await 直接拿结果，避免 then 的类型坑 */
    //     const r1 = await asyncRunner.execute(task);
    //     const r2 = await asyncRunner.execute(task2);
    //     Count1 += r1 as number;
    //     console.info('======', Count1);
    //     Count2 += r2 as number;
    //     console.info('======', Count2);
    //   }
    //
    //   while (Count1 < 10 || Count2 < 20) {
    //     await sleep(100);
    //   }
    //   expect(10).assertEqual(Count1);
    //   expect(20).assertEqual(Count2);
    //   Count1 = 0;
    //   Count2 = 0;
    //   done();
    // })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1002
     * @tc.name taskPoolAsyncRunnerActTest1002
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerActTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
    //   await sleep(1000)
    //   let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //   let Count1: number = 0;
    //   let Count2: number = 0;
    //   for (let i = 0; i < 10; i++) {
    //     let task: taskpool.Task = new taskpool.Task(printArgs1003, 1);
    //     let task2: taskpool.Task = new taskpool.Task(printArgs1004, 2);
    //     // asyncRunner.execute(task).then((num: object) => {
    //     //   Count1 = Count1 + Number(num);
    //     //   console.info('======', Count1);
    //     // }).catch((e: BusinessError) => {
    //     //   console.info('======e.message', e.message)
    //     // });
    //     // asyncRunner.execute(task2).then((num: object) => {
    //     //   Count2 = Count2 + Number(num);
    //     //   console.info('======', Count2);
    //     // }).catch((e: BusinessError) => {
    //     //   console.info('======e.message', e.message);
    //     // });
    //     /* 用 async/await 直接拿结果，避免 then 的类型坑 */
    //     const r1 = await asyncRunner.execute(task);
    //     const r2 = await asyncRunner.execute(task2);
    //     Count1 += r1 as number;
    //     console.info('======', Count1);
    //     Count2 += r2 as number;
    //     console.info('======', Count2);
    //
    //   }
    //
    //   while (Count1 < 10 || Count2 < 20) {
    //     await sleep(100);
    //   }
    //   expect(10).assertEqual(Count1);
    //   expect(20).assertEqual(Count2);
    //   Count1 = 0;
    //   Count2 = 0;
    //   done();
    // })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1003
     * @tc.name taskPoolAsyncRunnerActTest1003
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerActTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
    //   let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //   let Count1: number = 0;
    //   let Count2: number = 0;
    //   for (let i = 0; i < 10; i++) {
    //     let task: taskpool.Task = new taskpool.Task(printArgs1005, 1);
    //     let task2: taskpool.Task = new taskpool.Task(printArgs1006, 2);
    //     // asyncRunner.execute(task).then((num: object) => {
    //     //   Count1 = Count1 + Number(num);
    //     //   console.info('======', Count1);
    //     // });
    //     // asyncRunner.execute(task2).then((num: object) => {
    //     //   Count2 = Count2 + Number(num);
    //     //   console.info('======', Count2);
    //     // });
    //     /* 用 async/await 直接拿结果，避免 then 的类型坑 */
    //     const r1 = await asyncRunner.execute(task);
    //     const r2 = await asyncRunner.execute(task2);
    //     Count1 += r1 as number;
    //     console.info('======', Count1);
    //     Count2 += r2 as number;
    //     console.info('======', Count2);
    //   }
    //
    //   while (Count1 < 10 || Count2 < 20) {
    //     await sleep(100);
    //   }
    //   expect(10).assertEqual(Count1);
    //   expect(20).assertEqual(Count2);
    //   Count1 = 0;
    //   Count2 = 0;
    //   done();
    // })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1004
     * @tc.name taskPoolAsyncRunnerActTest1004
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerActTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let Count1: number = 0;
      let Count2: number = 0;
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1007, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs1008, 2.0);
        // asyncRunner.execute(task).then((num: object) => {
        //   Count1 = Count1 + Number(num);
        //   console.info('======', Count1);
        // });
        // asyncRunner.execute(task2).then((num: object) => {
        //   Count2 = Count2 + Number(num);
        //   console.info('======', Count2);
        // });
        /* 用 async/await 直接拿结果，避免 then 的类型坑 */
        const r1 = await asyncRunner.execute(task);
        const r2 = await asyncRunner.execute(task2);
        Count1 += r1 as number;
        console.info('======', Count1);
        Count2 += r2 as number;
        console.info('======', Count2);
      }

      while (Count1 < 10 || Count2 < 20) {
        await sleep(100);
      }
      expect(10).assertEqual(Count1);
      expect(20).assertEqual(Count2);
      Count1 = 0;
      Count2 = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1005
     * @tc.name taskPoolAsyncRunnerActTest1005
     * @tc.desc test AsyncRunner cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerActTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let Count1: number = 0;
      let Count2: number = 0;
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs1, 2.0);
        // asyncRunner.execute(task).then((res) => {
        //   cancelTask(task);
        //   expect(res).assertEqual(1);
        //   Count1 = Count1 + 1;
        //   console.info('======', Count1);
        // });
        // asyncRunner.execute(task2).then((res) => {
        //   cancelTask(task2);
        //   expect(res).assertEqual(2);
        //   Count2 = Count2 + 1;
        //   console.info('======', Count2);
        // });
        /* 用 async/await 直接拿结果，避免 then 的类型坑 */
        const r1 = await asyncRunner.execute(task);
        const r2 = await asyncRunner.execute(task2);
        Count1 += r1 as number;
        console.info('======', Count1);
        Count2 += r2 as number;
        console.info('======', Count2);
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100);
      }
      expect(10).assertEqual(Count1);
      expect(20).assertEqual(Count2);
      Count1 = 0;
      Count2 = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1006
     * @tc.name taskPoolAsyncRunnerActTest1006
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerActTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let Count1: number = 0;
      let Count2: number = 0;
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1011, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs1012, 2.0);
        // asyncRunner.execute(task).then((num: object) => {
        //   Count1 = Count1 + Number(num);
        //   console.info('======', Count1);
        // });
        // asyncRunner.execute(task2).then((num: object) => {
        //   Count2 = Count2 + Number(num);
        //   console.info('======', Count2);
        // });
        /* 用 async/await 直接拿结果，避免 then 的类型坑 */
        const r1 = await asyncRunner.execute(task);
        const r2 = await asyncRunner.execute(task2);
        Count1 += r1 as number;
        console.info('======', Count1);
        Count2 += r2 as number;
        console.info('======', Count2);
      }

      while (Count1 < 10 || Count2 < 20) {
        await sleep(100);
      }
      expect(10).assertEqual(Count1);
      expect(20).assertEqual(Count2);
      Count1 = 0;
      Count2 = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ACT_TEST_1007
     * @tc.name taskPoolAsyncRunnerActTest1007
     * @tc.desc test AsyncRunner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerActTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {  //async (Done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
      let Count1: number = 0;
      let Count2: number = 0;
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs1013, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs1014, 2.0);
        // asyncRunner.execute(task).then(() => {
        //   Count1 = Count1 +1;
        //   console.info('======', Count1);
        // }).catch((e)=>{
        //   Count1++;
        // });
        // asyncRunner.execute(task2).then(() => {
        //   Count2 = Count2 + 1;
        // }).catch((e)=>{
        //   Count1++;
        // });
        /* 用 async/await 直接拿结果，避免 then 的类型坑 */
        const r1 = await asyncRunner.execute(task);
        const r2 = await asyncRunner.execute(task2);
        Count1 += r1 as number;
        console.info('======', Count1);
        Count2 += r2 as number;
        console.info('======', Count2);
      }

      while (Count1 < 10 || Count2 < 20) {
        await sleep(100);
      }
      expect(10).assertEqual(Count1);
      expect(20).assertEqual(Count2);
      Count1 = 0;
      Count2 = 0;
      done();

  })
})
}