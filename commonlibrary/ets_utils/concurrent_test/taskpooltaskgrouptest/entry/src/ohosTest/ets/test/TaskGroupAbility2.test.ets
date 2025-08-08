/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, taskpool } from '@kit.ArkTS';
import {
  printArrayBuffer1,
  printArrayBuffer2,
  printArrayBuffer3,
  printArrayBuffer4,
  printASON1,
  printASON2,
  printASON3,
  printASON4,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
  printBitVector1,
  printBitVector2,
  printBitVector3,
  printBitVector4,
  printConcatArray1,
  printConcatArray2,
  printConcatArray3,
  printConcatArray4,
  printEnum1,
  printEnum2,
  printEnum3,
  printEnum4,
  printFloat32Array1,
  printFloat32Array2,
  printFloat32Array3,
  printFloat32Array4,
  printMyClass1,
  printMyClass2,
  printSendableTestClass1,
  printSendableTestClass2,
  printSharedArrayBuffer3,
  printSharedArrayBuffer4,
  printUint8ClampedArray1,
  printUint8ClampedArray2,
  printUint8ClampedArray3,
  printUint8ClampedArray4,
  printUnion1,
  printUnion2,
  printUnion3,
  printUnion4,
  sampleFunction
} from '../testability/pages/TaskMethods';
import {
  Count1,
  Count2,
  Count3,
  Count4,
  MyClass,
  MyEnum,
  SendableTestClass
} from '../testability/pages/TaskDataFlg';
import { BusinessError } from '@kit.BasicServicesKit';
import { AsyncLock } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';


export default function TaskGroupAbilityTest2() {
  describe('TaskGroupAbilityTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(1000)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3100
     * @tc.name taskPoolTaskGroupTask3100
     * @tc.desc Create two tasks with Uint8ClampedArray parameters and Uint8ClampedArray return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('taskPoolTaskGroupTask3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
      const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
      taskGroup.addTask(printUint8ClampedArray1, uint8ClampedArray1);
      taskGroup.addTask(printUint8ClampedArray2, uint8ClampedArray2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then(() => {
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3200
     * @tc.name taskPoolTaskGroupTask3200
     * @tc.desc Create two tasks with Uint8ClampedArray parameters and Uint8ClampedArray return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('taskPoolTaskGroupTask3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
      const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
      taskGroup.addTask(printUint8ClampedArray3, uint8ClampedArray1);
      taskGroup.addTask(printUint8ClampedArray4, uint8ClampedArray2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3300
     * @tc.name taskPoolTaskGroupTask3300
     * @tc.desc Create two tasks with Float32Array parameters and Float32Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const float32Array1 = new Float32Array([1.2, 2.3, 3.3]);
      const float32Array2 = new Float32Array([4.3, 5.3, 6.3]);
      taskGroup.addTask(printFloat32Array1, float32Array1);
      taskGroup.addTask(printFloat32Array2, float32Array2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then(() => {
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3400
     * @tc.name taskPoolTaskGroupTask3400
     * @tc.desc Create two tasks with Float32Array parameters and Float32Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const float32Array1 = new Float32Array([1.2, 2.3, 3.3]);
      const float32Array2 = new Float32Array([4.3, 5.3, 6.3]);
      taskGroup.addTask(printFloat32Array3, float32Array1);
      taskGroup.addTask(printFloat32Array4, float32Array2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3500
     * @tc.name taskPoolTaskGroupTask3500
     * @tc.desc Create two tasks with ArrayBuffer parameters and ArrayBuffer return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let arraybuffer1 = new ArrayBuffer(1);
      let arraybuffer2 = new ArrayBuffer(2);
      let task1 = new taskpool.Task(printArrayBuffer1, arraybuffer1)
      let task2 = new taskpool.Task(printArrayBuffer2, arraybuffer2)
      task1.setTransferList([])
      task2.setTransferList([])
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3600
     * @tc.name taskPoolTaskGroupTask3600
     * @tc.desc Create two tasks with ArrayBuffer parameters and ArrayBuffer return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let arraybuffer1 = new ArrayBuffer(1 * 1);
      let arraybuffer2 = new ArrayBuffer(2 * 2);
      let task1 = new taskpool.Task(printArrayBuffer3, arraybuffer1)
      let task2 = new taskpool.Task(printArrayBuffer4, arraybuffer2)
      task1.setTransferList([])
      task2.setTransferList([])
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3700
     * @tc.name taskPoolTaskGroupTask3700
     * @tc.desc Create two tasks with SharedArrayBuffer parameters and SharedArrayBuffer return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let shared1 = new SharedArrayBuffer(1);
      let shared2 = new SharedArrayBuffer(2);
      taskGroup.addTask(printArrayBuffer1, shared1);
      taskGroup.addTask(printArrayBuffer2, shared2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3800
     * @tc.name taskPoolTaskGroupTask3800
     * @tc.desc Create two tasks with SharedArrayBuffer parameters and SharedArrayBuffer return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let shared1 = new SharedArrayBuffer(1 * 1);
      let shared2 = new SharedArrayBuffer(2 * 2);
      taskGroup.addTask(printSharedArrayBuffer3, shared1);
      taskGroup.addTask(printSharedArrayBuffer4, shared2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3900
     * @tc.name taskPoolTaskGroupTask3900
     * @tc.desc Create two tasks with ConcatArray parameters and ConcatArray return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let concat1: ConcatArray<number> = [1, 2, 3];
      let concat2: ConcatArray<number> = [4, 5, 6];
      taskGroup.addTask(printConcatArray1, concat1);
      taskGroup.addTask(printConcatArray2, concat2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4000
     * @tc.name taskPoolTaskGroupTask4000
     * @tc.desc Create two tasks with ConcatArray parameters and ConcatArray return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let concat1: ConcatArray<number> = [1, 2, 3];
      let concat2: ConcatArray<number> = [4, 5, 6];
      taskGroup.addTask(printConcatArray3, concat1);
      taskGroup.addTask(printConcatArray4, concat2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4100
     * @tc.name taskPoolTaskGroupTask4100
     * @tc.desc Create two tasks with BitVector parameters and BitVector return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let bitVector1: collections.BitVector = new collections.BitVector(5);
      let bitVector2: collections.BitVector = new collections.BitVector(6);
      taskGroup.addTask(printBitVector1, bitVector1);
      taskGroup.addTask(printBitVector2, bitVector2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4200
     * @tc.name taskPoolTaskGroupTask4200
     * @tc.desc Create two tasks with BitVector parameters and BitVector return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let bitVector1: collections.BitVector = new collections.BitVector(5);
      let bitVector2: collections.BitVector = new collections.BitVector(6);
      taskGroup.addTask(printBitVector3, bitVector1);
      taskGroup.addTask(printBitVector4, bitVector2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4300
     * @tc.name taskPoolTaskGroupTask4300
     * @tc.desc Create two tasks with union parameters and union return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      await sleep(5000)
      type Union = string | number | Array<number>;
      let union1: Union[] = ['hello1', 7, [1, 2, 3]];
      let union2: Union[] = ['hello2', 8, [4, 5, 6]];
      taskGroup.addTask(printUnion1, union1);
      taskGroup.addTask(printUnion2, union2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4400
     * @tc.name taskPoolTaskGroupTask4400
     * @tc.desc Create two tasks with union parameters and union return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      type Union = string | number | Array<number>;
      let union1: Union[] = ['hello1', 7, [1, 2, 3]];
      let union2: Union[] = ['hello2', 8, [4, 5, 6]];
      taskGroup.addTask(printUnion3, union1);
      taskGroup.addTask(printUnion4, union2);

      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4500
     * @tc.name taskPoolTaskGroupTask4500
     * @tc.desc Create two tasks with enum parameters and enum return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(printEnum1, MyEnum.Value1);
      taskGroup.addTask(printEnum2, MyEnum.Value2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4600
     * @tc.name taskPoolTaskGroupTask4600
     * @tc.desc Create two tasks with enum parameters and enum return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(printEnum3, MyEnum.Value1);
      taskGroup.addTask(printEnum4, MyEnum.Value3);


      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4700
     * @tc.name taskPoolTaskGroupTask4700
     * @tc.desc Create two tasks with ASON parameters and ASON return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let ason1: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3))
      let ason2: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6))
      taskGroup.addTask(printASON1, ason1);
      taskGroup.addTask(printASON2, ason2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4800
     * @tc.name taskPoolTaskGroupTask4800
     * @tc.desc Create two tasks with ASON parameters and ASON return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let ason1: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3))
      let ason2: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6))
      taskGroup.addTask(printASON3, ason1);
      taskGroup.addTask(printASON4, ason2);


      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_4900
     * @tc.name taskPoolTaskGroupTask4900
     * @tc.desc Create two tasks with AsyncLock parameters and AsyncLock return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let asyncLock1: AsyncLock = new AsyncLock()
      let asyncLock2: AsyncLock = new AsyncLock()
      let asn1 = asyncLock1.count_
      let asn2 = asyncLock2.count_
      taskGroup.addTask(printAsyncLock1, asn1);
      taskGroup.addTask(printAsyncLock2, asn2);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await sleep(100)
        taskpool.execute(taskGroup).then((result) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5000
     * @tc.name taskPoolTaskGroupTask5000
     * @tc.desc Create two tasks with AsyncLock parameters and AsyncLock return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let asyncLock1: AsyncLock = new AsyncLock()
      let asyncLock2: AsyncLock = new AsyncLock()
      let asn1 = asyncLock1.count_
      let asn2 = asyncLock2.count_
      taskGroup.addTask(printAsyncLock3, asn1);
      taskGroup.addTask(printAsyncLock4, asn2);


      let count: number = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: object[]) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: BusinessError) => {
              expect(error.message).assertContain('Cannot read property split of undefined')
              count++
              console.error(`error message error: ${JSON.stringify(error.message)}`)
            });
          promises.push(promise);
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      await sleep(1000);
      while (count < 10) {
        await sleep(100)
      }
      expect(0).assertEqual(Count3.count);
      expect(0).assertEqual(Count4.count);
      expect(10).assertEqual(count);
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5100
     * @tc.name taskPoolTaskGroupTask5100
     * @tc.desc Create two tasks with class parameters and class return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let myClass1 = new MyClass(1,);
      let myClass2 = new MyClass(2,);

      taskGroup.addTask(printMyClass1, myClass1);
      taskGroup.addTask(printMyClass2, myClass2);
      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        await taskpool.execute(taskGroup).then((result) => {
          console.log(`Execution1 ${i + 1}: ${result}`);
          console.log(`Task Result (${i + 1}): ${result.toString()}`);
          console.log(`Task Method Call: ${result}`);
        })
        Count1.count++
        Count2.count++
      }
      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5200
     * @tc.name taskPoolTaskGroupTask5200
     * @tc.desc Create two tasks with SendableClass parameters and SendableClass return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolTaskGroupTask5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let myClassInstance = new SendableTestClass(1)
      taskGroup.addTask(printSendableTestClass1, myClassInstance);
      taskGroup.addTask(printSendableTestClass2, myClassInstance);

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 10; i++) {
        try {
          // 执行任务组
          const results = await taskpool.execute(taskGroup) as SendableTestClass[];
          // 处理返回的结果
          results.forEach((result) => {
            result.printValue();
          });
          Count1.count++;
          Count2.count++;
        } catch (error) {
          console.error(`第 ${i + 1} 次执行任务组时出错:`, error);
        }
      }
      await sleep(1000)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0;
      Count2.count = 0;
      done()
    })
  })
}