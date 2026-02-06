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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
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
} from '../testability/pages/TaskMethods';
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
} from '../testability/pages/TaskDataFlg';
import { BusinessError } from '@ohos.base';
import { sleep } from '../testability/pages/Utils';


export default function TaskGroupAbilityTest() {
  describe('TaskGroupAbilityTest', (): void  => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void  => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void  => {
      // Presets an action, which is performed before each unit test case starts.
      // The Number of execution times is the same as the Number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      await sleep(2000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The Number of execution times is the same as the Number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void  => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0100
     * @tc.name taskPoolTaskGroupTask0100
     * @tc.desc Create two tasks with string parameters and string return values, and execute them 10 times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const str1: string = "q1";
        const str2: string = "q2"
        taskGroup.addTask(printStr1, str1);
        taskGroup.addTask(printStr2, str2);

        CountStr1.count = ""
        CountStr2.count = ""
        await taskpool.execute(taskGroup).then((num: Array<Any>) => {

          const result1 = (num[0])
          const result2 = (num[1])

          CountStr1.count += result1;
          CountStr2.count += result2;
          Count1.count++;
          Count2.count++;
          console.info('======', CountStr1.count, CountStr2.count)
          console.info('======', Count1.count, Count2.count)
        })
      }

      expect("q1".repeat(1)).assertEqual(String(CountStr1.count))
      expect("q2".repeat(1)).assertEqual(String(CountStr2.count))
      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
      Count1.count = 0
      Count2.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0200
     * @tc.name taskPoolTaskGroupTask0200
     * @tc.desc Create two tasks with string parameters and string return values, and execute them 10 times,error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const str3: string = "q3";
      const str4: string = "q4"
      taskGroup.addTask(printStr3, str3);
      taskGroup.addTask(printStr4, str4);

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0400
     * @tc.name taskPoolTaskGroupTask0400
     * @tc.desc Create two tasks with Number parameters and Number return values, and execute them 10 times,error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const num1: Number = 1;
      const num2: Number = 2
      taskGroup.addTask(printArgs3, num1);
      taskGroup.addTask(printArgs4, num2);
      let count: Number = 0
      Count3.count = 0
      Count4.count = 0

      for (let i = 0; i < 1; i++) {
        try {
           taskpool.execute(taskGroup).then((num: Array<Any>) => {
            Count3.count = Count3.count + (num[0] as Number)
            Count4.count = Count4.count + (num[1] as Number)
            console.info('======', Count3.count, Count4.count)
          }).catch((error: Any) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            count++
            // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }

      while (count < 1) {
        await sleep(100)
      }
      expect(String(0)).assertEqual(String(Count3.count))
      expect(String(0)).assertEqual(String(Count4.count))
      expect(String(1)).assertEqual(String(count))
      Count3.count = 0
      Count4.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0500
     * @tc.name taskPoolTaskGroupTask0500
     * @tc.desc Create two tasks with boolean parameters and boolean return values, and execute them 10 times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printBoolean1, false);
      taskGroup.addTask(printBoolean2, true);

      CountBol1.count = false
      CountBol2.count = true

      for (let i = 0; i < 1; i++) {
         taskpool.execute(taskGroup).then((num: Array<Any>) => {
          CountBol1.count = Boolean(num[0])
          CountBol2.count = Boolean(num[1])
          console.info('======', CountBol1.count, CountBol2.count)
        })
      }

      while (!CountBol2.count) {
        await sleep(100)
      }
      expect(String(false)).assertEqual(String(CountBol1.count))
      expect(String(true)).assertEqual(String(CountBol2.count))
      CountBol1.count = false
      CountBol2.count = true
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0600
     * @tc.name taskPoolTaskGroupTask0600
     * @tc.desc Create two tasks with boolean parameters and boolean return values, and execute them 10 times,error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printBoolean3, false);
      taskGroup.addTask(printBoolean4, true);

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();

      for (let i = 0; i < 1; i++) {
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0800
     * @tc.name taskPoolTaskGroupTask0800
     * @tc.desc Create two tasks with bigint parameters and bigint return values, and execute them 10 times,error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printBigint3, 1n);
      taskGroup.addTask(printBigint4, 2n);

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_0900
     * @tc.name taskPoolTaskGroupTask0900
     * @tc.desc Create two tasks with undefined parameters and undefined return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printUndefined1, undefined);
        taskGroup.addTask(printUndefined2, undefined);
        await taskpool.execute(taskGroup).then((num: Array<Any>) => {
          CountUndefined1.count
          CountUndefined2.count
          console.info('======', CountUndefined1.count, CountUndefined2.count)
        })
      }

      await sleep(1000)
      expect(String('undefined')).assertEqual(String(CountUndefined1.count))
      expect(String('undefined')).assertEqual(String(CountUndefined2.count))
      CountUndefined1.count
      CountUndefined1.count
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1000
     * @tc.name taskPoolTaskGroupTask1000
     * @tc.desc Create two tasks with undefined parameters and undefined return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printUndefined3, undefined);
        taskGroup.addTask(printUndefined4, undefined);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1200
     * @tc.name taskPoolTaskGroupTask1200
     * @tc.desc Create two tasks with null parameters and null return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printNull3, null);
        taskGroup.addTask(printNull4, null);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1300
     * @tc.name taskPoolTaskGroupTask1300
     * @tc.desc Create two tasks with Array parameters and Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const Array1: Array<Number> = new Array<Number>(1, 2, 3)
        const Array2: Array<Number> = new Array<Number>(4, 5, 6)
        taskGroup.addTask(printArray1, Array1);
        taskGroup.addTask(printArray2, Array2);

        await taskpool.execute(taskGroup).then((results: Array<Any>) => {
          Count1.count++;
          Count2.count++;
          console.info('======', Count1.count, Count2.count)
        })
      }
      await sleep(1000)
      expect(String(1)).assertEqual(String(Count1.count))
      expect(String(1)).assertEqual(String(Count2.count))
      Count1.count = 0;
      Count2.count = 0;
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1400
     * @tc.name taskPoolTaskGroupTask1400
     * @tc.desc Create two tasks with Array parameters and Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const Array1: Array<Number> = new Array<Number>(1, 2, 3)
        const Array2: Array<Number> = new Array<Number>(4, 5, 6)
        taskGroup.addTask(printArray3, Array1);
        taskGroup.addTask(printArray4, Array2);

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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_01500
     * @tc.name taskPoolTaskGroupTask01500
     * @tc.desc Create two tasks with Map parameters and Map return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const map1: Map<string, Number> = new Map<string, Number>([["Test1", 1]]);
        const map2: Map<string, Number> = new Map<string, Number>([["Test2", 2]]);
        taskGroup.addTask(printMap1, map1);
        taskGroup.addTask(printMap2, map2);

        await taskpool.execute(taskGroup).then((e: Array<Any>) => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_01600
     * @tc.name taskPoolTaskGroupTask1600
     * @tc.desc Create two tasks with Map parameters and Map return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const map1: Map<string, Number> = new Map<string, Number>([["Test1", 1]]);
        const map2: Map<string, Number> = new Map<string, Number>([["Test2", 2]]);
        taskGroup.addTask(printMap3, map1);
        taskGroup.addTask(printMap4, map2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1700
     * @tc.name taskPoolTaskGroupTask1700
     * @tc.desc Create two tasks with Set parameters and Set return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let array_num1: Number[] = [1, 2, 3];
        const set1:Set<Number> = new Set<Number>(array_num1);
        let array_num2: Number[] = [4, 5, 6];
        const set2:Set<Number> = new Set<Number>(array_num2);
        taskGroup.addTask(printSet1, set1);
        taskGroup.addTask(printSet2, set2);
        await taskpool.execute(taskGroup).then((e: Array<Any>) => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1800
     * @tc.name taskPoolTaskGroupTask1800
     * @tc.desc Create two tasks with Set parameters and Set return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let array_num1: Number[] = [1, 2, 3];
        const set1:Set<Number> = new Set<Number>(array_num1);
        let array_num2: Number[] = [4, 5, 6];
        const set2:Set<Number> = new Set<Number>(array_num2);
        taskGroup.addTask(printSet3, set1);
        taskGroup.addTask(printSet4, set2);

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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_1900
     * @tc.name taskPoolTaskGroupTask1900
     * @tc.desc Create two tasks with Int8Array parameters and Int8Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int8Array1 = new Int8Array([1, 2, 3]);
        const int8Array2 = new Int8Array([4, 5, 6]);
        taskGroup.addTask(printInt8Array1, int8Array1);
        taskGroup.addTask(printInt8Array2, int8Array2);

        await taskpool.execute(taskGroup).then((e: Array<Any>) => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2000
     * @tc.name taskPoolTaskGroupTask2000
     * @tc.desc Create two tasks with Int8Array parameters and Int8Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int8Array1 = new Int8Array([1, 2, 3]);
        const int8Array2 = new Int8Array([4, 5, 6]);
        taskGroup.addTask(printInt8Array3, int8Array1);
        taskGroup.addTask(printInt8Array4, int8Array2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2100
     * @tc.name taskPoolTaskGroupTask2100
     * @tc.desc Create two tasks with Uint8Array parameters and Uint8Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint8Array1 = new Uint8Array([1, 2, 3]);
        const uint8Array2 = new Uint8Array([4, 5, 6]);
        taskGroup.addTask(printUint8Array1, uint8Array1);
        taskGroup.addTask(printUint8Array2, uint8Array2);
        await taskpool.execute(taskGroup).then((e: Array<Any>) => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2200
     * @tc.name taskPoolTaskGroupTask2200
     * @tc.desc Create two tasks with Uint8Array parameters and Uint8Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint8Array1 = new Uint8Array([1, 2, 3]);
        const uint8Array2 = new Uint8Array([4, 5, 6]);
        taskGroup.addTask(printUint8Array3, uint8Array1);
        taskGroup.addTask(printUint8Array4, uint8Array2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2300
     * @tc.name taskPoolTaskGroupTask2300
     * @tc.desc Create two tasks with Int16Array parameters and Int16Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int16Array1 = new Int16Array([1, 2, 3]);
        const int16Array2 = new Int16Array([4, 5, 6]);
        taskGroup.addTask(printInt16Array1, int16Array1);
        taskGroup.addTask(printInt16Array2, int16Array2);

        await taskpool.execute(taskGroup).then((e: Array<Any>) => {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2400
     * @tc.name taskPoolTaskGroupTask2400
     * @tc.desc Create two tasks with Int16Array parameters and Int16Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int16Array1 = new Int16Array([1, 2, 3]);
        const int16Array2 = new Int16Array([4, 5, 6]);
        taskGroup.addTask(printInt16Array3, int16Array1);
        taskGroup.addTask(printInt16Array4, int16Array2);

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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2500
     * @tc.name taskPoolTaskGroupTask2500
     * @tc.desc Create two tasks with Uint16Array parameters and Uint16Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint16Array1 = new Uint16Array([1, 2, 3]);
        const uint16Array2 = new Uint16Array([4, 5, 6]);
        taskGroup.addTask(printUint16Array1, uint16Array1);
        taskGroup.addTask(printUint16Array2, uint16Array2);

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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2600
     * @tc.name taskPoolTaskGroupTask2600
     * @tc.desc Create two tasks with Uint16Array parameters and Uint16Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint16Array1 = new Uint16Array([1, 2, 3]);
        const uint16Array2 = new Uint16Array([4, 5, 6]);
        taskGroup.addTask(printUint16Array3, uint16Array1);
        taskGroup.addTask(printUint16Array4, uint16Array2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2700
     * @tc.name taskPoolTaskGroupTask2700
     * @tc.desc Create two tasks with Int32Array parameters and Int32Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int32Array1 = new Int32Array([1, 2, 3]);
        const int32Array2 = new Int32Array([4, 5, 6]);
        taskGroup.addTask(printInt32Array1, int32Array1);
        taskGroup.addTask(printInt32Array2, int32Array2);
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2800
     * @tc.name taskPoolTaskGroupTask2800
     * @tc.desc Create two tasks with Int32Array parameters and Int32Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const int32Array1 = new Int32Array([1, 2, 3]);
        const int32Array2 = new Int32Array([4, 5, 6]);
        taskGroup.addTask(printInt32Array3, int32Array1);
        taskGroup.addTask(printInt32Array4, int32Array2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_2900
     * @tc.name taskPoolTaskGroupTask2900
     * @tc.desc Create two tasks with Uint32Array parameters and Uint32Array return values, and execute them 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      Count1.count = 0;
      Count2.count = 0;
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint32Array1 = new Uint32Array([1, 2, 3]);
        const uint32Array2 = new Uint32Array([4, 5, 6]);
        taskGroup.addTask(printUint32Array1, uint32Array1);
        taskGroup.addTask(printUint32Array2, uint32Array2);

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
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_TEST_3000
     * @tc.name taskPoolTaskGroupTask3000
     * @tc.desc Create two tasks with Uint32Array parameters and Uint32Array return values, and execute them 10 times,error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolTaskGroupTask3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.


      let count: Number = 0;
      const promises: Array<Promise<void>> = new Array<Promise<void>>();
      for (let i = 0; i < 1; i++) {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const uint32Array1 = new Uint32Array([1, 2, 3]);
        const uint32Array2 = new Uint32Array([4, 5, 6]);
        taskGroup.addTask(printUint32Array3, uint32Array1);
        taskGroup.addTask(printUint32Array4, uint32Array2);
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
              // console.error(`error message error: ${JSON.stringify((error as BusinessError).message)}`)
            });
          promises.push(promise);
        } catch (e) {
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

  })
}