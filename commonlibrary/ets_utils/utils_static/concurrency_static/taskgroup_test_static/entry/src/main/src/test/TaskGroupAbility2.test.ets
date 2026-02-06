/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import {
  printArrayBuffer1,
  printArrayBuffer2,
  printArrayBuffer3,
  printArrayBuffer4,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
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
  printUnion4
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
import { BusinessError } from '@ohos.base';
import { AsyncLocks } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';

type Union = string | number | Array<number>;

export default function TaskGroupAbilityTest2() {
  describe('TaskGroupAbilityTest2', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(1000)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3100
     * @tc.name taskPoolTaskGroupTask3100
     * @tc.desc Create two tasks with Uint8ClampedArray parameters and Uint8ClampedArray return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
        const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
        taskGroup.addTask(printUint8ClampedArray1, uint8ClampedArray1);
        taskGroup.addTask(printUint8ClampedArray2, uint8ClampedArray2);

        Count1.count = 0;
        Count2.count = 0;
        await taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
        const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
        taskGroup.addTask(printUint8ClampedArray3, uint8ClampedArray1);
        taskGroup.addTask(printUint8ClampedArray4, uint8ClampedArray2);
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const float32Array1 = new Float32Array([1.2, 2.3, 3.3]);
        const float32Array2 = new Float32Array([4.3, 5.3, 6.3]);
        taskGroup.addTask(printFloat32Array1, float32Array1);
        taskGroup.addTask(printFloat32Array2, float32Array2);

        Count1.count = 0;
        Count2.count = 0;
        await taskpool.execute(taskGroup).then((num: Array<Any>) => {
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const float32Array1 = new Float32Array([1.2, 2.3, 3.3]);
        const float32Array2 = new Float32Array([4.3, 5.3, 6.3]);
        taskGroup.addTask(printFloat32Array3, float32Array1);
        taskGroup.addTask(printFloat32Array4, float32Array2);
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let arraybuffer1 = new ArrayBuffer(1);
        let arraybuffer2 = new ArrayBuffer(2);
        let task1 = new taskpool.Task(printArrayBuffer1, arraybuffer1)
        let task2 = new taskpool.Task(printArrayBuffer2, arraybuffer2)
        //task1.setTransferList([])
        //task2.setTransferList([])
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        await taskpool.execute(taskGroup).then((result: Array<Any>) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let arraybuffer1 = new ArrayBuffer(1 * 1);
        let arraybuffer2 = new ArrayBuffer(2 * 2);
        let task1 = new taskpool.Task(printArrayBuffer3, arraybuffer1)
        let task2 = new taskpool.Task(printArrayBuffer4, arraybuffer2)
        //task1.setTransferList([])
        //task2.setTransferList([])
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);

        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
      Count3.count = 0;
      Count4.count = 0;
      done();
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3700
     * @tc.name taskPoolTaskGroupTask3700
     * @tc.desc Create two tasks with ArrayBuffer parameters and ArrayBuffer return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let shared1 = new ArrayBuffer(1);
        let shared2 = new ArrayBuffer(2);
        taskGroup.addTask(printArrayBuffer1, shared1);
        taskGroup.addTask(printArrayBuffer2, shared2);

        Count1.count = 0;
        Count2.count = 0;
        await taskpool.execute(taskGroup).then((result: Array<Any>) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
      Count1.count = 0;
      Count2.count = 0;
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3800
     * @tc.name taskPoolTaskGroupTask3800
     * @tc.desc Create two tasks with ArrayBuffer parameters and ArrayBuffer return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let shared1 = new ArrayBuffer(1 * 1);
        let shared2 = new ArrayBuffer(2 * 2);
        taskGroup.addTask(printSharedArrayBuffer3, shared1);
        taskGroup.addTask(printSharedArrayBuffer4, shared2);
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        // let concat1: ConcatArray<number> = [1, 2, 3];
        // let concat2: ConcatArray<number> = [4, 5, 6];
        let concat1: ConcatArray<Number> = new Array<Number>(1, 2, 3);
        let concat2: ConcatArray<Number> = new Array<Number>(4, 5, 6);
        taskGroup.addTask(printConcatArray1, concat1);
        taskGroup.addTask(printConcatArray2, concat2);

        Count1.count = 0;
        Count2.count = 0;
        await taskpool.execute(taskGroup).then((result: Array<Any>) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        // let concat1: ConcatArray<number> = [1, 2, 3];
        // let concat2: ConcatArray<number> = [4, 5, 6];
        let concat1: ConcatArray<Number> = new Array<Number>(1, 2, 3);
        let concat2: ConcatArray<Number> = new Array<Number>(4, 5, 6);
        taskGroup.addTask(printConcatArray3, concat1);
        taskGroup.addTask(printConcatArray4, concat2);
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

        taskGroup.addTask(printEnum1, MyEnum.Value1);
        taskGroup.addTask(printEnum2, MyEnum.Value2);

        Count1.count = 0;
        Count2.count = 0;
        await taskpool.execute(taskGroup).then((result: Array<Any>) => {
          console.info("+++++" + result)
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printEnum3, MyEnum.Value1);
        taskGroup.addTask(printEnum4, MyEnum.Value3);
        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
      Count3.count = 0;
      Count4.count = 0;
      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_5000
     * @tc.name taskPoolTaskGroupTask5000
     * @tc.desc Create two tasks with AsyncLock parameters and AsyncLock return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let asyncLock1: AsyncLocks = new AsyncLocks()
        let asyncLock2: AsyncLocks = new AsyncLocks()
        let asn1 = asyncLock1.count_
        let asn2 = asyncLock2.count_
        taskGroup.addTask(printAsyncLock3, asn1);
        taskGroup.addTask(printAsyncLock4, asn2);

        try {
          const promise = taskpool.execute(taskGroup)
            .then((num: Array<Any>) => {
              Count3.count++
              Count4.count++
              console.info('======', Count3.count, Count4.count)
            })
            .catch((error: Any) => {
              // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
              count++
              //console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }
      await Promise.all(promises);
      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count));
      expect(String(0)).assertEqual(String(Count4.count));
      expect(String(1)).assertEqual(String(count));
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let myClass1 = new MyClass(1,);
        let myClass2 = new MyClass(2,);

        taskGroup.addTask(printMyClass1, myClass1);
        taskGroup.addTask(printMyClass2, myClass2);
        await  taskpool.execute(taskGroup).then((result: Array<Any>) => {
          console.log(`Execution1 ${i + 1}: ${result}`);
          console.log(`Task Result (${i + 1}): ${result.toString()}`);
          console.log(`Task Method Call: ${result}`);
        })
        Count1.count++
        Count2.count++
      }
      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
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
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let myClassInstance = new SendableTestClass(1)
        taskGroup.addTask(printSendableTestClass1, myClassInstance);
        taskGroup.addTask(printSendableTestClass2, myClassInstance);

        try {
          // 执行任务组
          await taskpool.execute(taskGroup).then((results: Array<Any>) => {
            // 处理返回的结果
            results.forEach((result) => {
              (result as SendableTestClass).printValue();
            });
            Count1.count++;
            Count2.count++;
          });

        } catch (error) {
          error = error as BusinessError;
          console.error(`第 ${i + 1} 次执行任务组时出错:`, error);
        }
      }
      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
      Count1.count = 0;
      Count2.count = 0;
      done()
    })
  })
}