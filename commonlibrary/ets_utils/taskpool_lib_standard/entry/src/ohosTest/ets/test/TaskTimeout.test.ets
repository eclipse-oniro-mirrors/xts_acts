/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { taskpool } from '@kit.ArkTS'
import { BusinessError } from '@ohos.base'
import { timeoutDemo, demoSenddata, taskFunc, sendableClassWithTime, taskError, sendableFuncWithTime,
  setTransferListTestWithTime, setCloneListTestWithTime} from '../utils/TimeoutFuncList';
import { promiseCase } from './testFunclist';
import { SendableClassTest, sendableFunc } from './sendable';

export default function TaskTimeoutTest() {
  describe('ActTaskTimeoutTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   TaskTimeoutTestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0271
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 300;
      let timeout = 100;
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      let config: taskpool.Configs = {timeout: timeout};
      taskpool.execute(task, config).then((res) => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0272
     * @tc.desc   GenericsTask set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 1200;
      let timeout = 1000;
      let terminate = false;
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(timeoutDemo, dealTime);
      taskpool.execute<[number], number>(task, {timeout: timeout}).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0273
     * @tc.desc   TaskGroup set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 500;
      let timeout = 200;
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      taskpool.execute(taskGroup, {timeout: timeout}).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200070);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0274
     * @tc.desc   Timeout TaskGroup execute again
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 1200;
      let timeout = 1000;
      let count = 0;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, dealTime);
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      taskpool.execute(taskGroup, {timeout: timeout}).catch((e:BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200070);
      })
      try {
        taskpool.execute(taskGroup)
        count++;
      } catch (e) {
        expect(e.code).assertEqual(10200059);
        count++;
      }
      while (count == 2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0275
     * @tc.desc   configs set undefined, throwing 401 error
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      try {
        await taskpool.execute(task, undefined);
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0276
     * @tc.desc   When configs is an empty object, default values are used for execution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let result = await taskpool.execute(task, {});
      expect(result).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0277
     * @tc.desc   When only the priority is set in configs, the timeout defaults to 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 300);
      let result = await taskpool.execute(task, {priority: taskpool.Priority.HIGH});
      expect(result).assertEqual(300);

      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 400);
      let result2 = await taskpool.execute(task2, {priority: taskpool.Priority.MEDIUM});
      expect(result2).assertEqual(400);

      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 500);
      let result3 = await taskpool.execute(task3, {priority: taskpool.Priority.LOW});
      expect(result3).assertEqual(500);

      let task4: taskpool.Task = new taskpool.Task(timeoutDemo, 600);
      let result4 = await taskpool.execute(task4, {priority: taskpool.Priority.HIGH});
      expect(result4).assertEqual(600);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0278
     * @tc.desc   configs set priority and timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 500);
      let result = await taskpool.execute(task, {priority: taskpool.Priority.HIGH, timeout: 1000});
      expect(result).assertEqual(500);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0279
     * @tc.desc   configs type error, throwing 401 error
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      try {
        await taskpool.execute(task, 123);
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0280
     * @tc.desc   When timeout is 0, it means that no timeout has been set and the task has been completed normally
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let result = await taskpool.execute(task, {timeout: 0});
      expect(result).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0281
     * @tc.desc   When timeout is negative -1, it is processed as 0, indicating that timeout has not been set
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: -1});
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0282
     * @tc.desc   When timeout is negative -100, it is processed as 0, indicating that timeout has not been set
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: -100});
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0283
     * @tc.desc   Timeout is executed normally when it is a decimal
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1200);
      let terminate = false;
      taskpool.execute(task, {timeout: 1000.5}).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0284
     * @tc.desc   When timeout is set to Infinity, use the default value with no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: Infinity});
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0285
     * @tc.desc   When timeout is set to -Infinity, use the default value with no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: -Infinity});
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0286
     * @tc.desc   When timeout is set to NaN, use the default value with no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let result = await taskpool.execute(task, {timeout: NaN});
      expect(result).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0287
     * @tc.desc   When timeout is set to undefined, use the default value with no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: undefined});
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0288
     * @tc.desc   Different priorities
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let terminate = false;
      taskpool.execute(task, {priority: taskpool.Priority.MEDIUM, timeout: 500}).catch((e:BusinessError) => {
        expect(e.code).assertEqual(10200058);
      })
      taskpool.execute(task2, {priority: taskpool.Priority.LOW, timeout: 500}).catch((e:BusinessError) => {
        expect(e.code).assertEqual(10200058);
      })
      taskpool.execute(task3, {priority: taskpool.Priority.IDLE, timeout: 600}).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0289
     * @tc.desc   Priority is 999, throwing 401 error
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      try {
        taskpool.execute(task, { priority: 999, timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0290
     * @tc.desc   Use default MEDIUM priority when priority is undefined
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1500);
      let terminate = false;
      taskpool.execute(task, {priority: undefined, timeout: 1000}).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0291
     * @tc.desc   Timeout is 10
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let terminate = false;
      taskpool.execute(task, {timeout: 10}).then(() => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0292
     * @tc.desc   Timeout is less than or equal to int32_max, task cannot be executed again
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let time = 2147483647;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: time});
      expect(result).assertEqual(100);
      try {
        taskpool.execute(task, {timeout: time});
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0293
     * @tc.desc   When timeout greater than int32_max, no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let time = 2147483648;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: time});
      expect(result).assertEqual(100);
      let result2 = await taskpool.execute(task, {timeout: time});
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0294
     * @tc.desc   When timeout is Number.MAX_SAFE_INTEGER, no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let time = Number.MAX_SAFE_INTEGER;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: time});
      expect(result).assertEqual(100);
      let result2 = await taskpool.execute(task, {timeout: time});
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0295
     * @tc.desc   Timeout equals the task execution time
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let terminate = false;
      taskpool.execute(task, {timeout: 1000}).then((res) => {
        terminate = true;
        expect(res).assertEqual(1000);
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0296
     * @tc.desc   Return results normally when timeout is slightly greater than task execution time
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let result = await taskpool.execute(task, {timeout: 1100});
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0297
     * @tc.desc   Timeout slightly less than the task execution time, throwing 10200058 error
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      taskpool.execute(task, {timeout: 900}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0298
     * @tc.desc   When timeout is Number.MIN_VALUE, no timeout limit
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let time = Number.MIN_VALUE;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task, {timeout: time});
      expect(result).assertEqual(100);
      let result2 = await taskpool.execute(task, {timeout: time});
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0299
     * @tc.desc   Verify serialization error
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let task2: taskpool.Task = new taskpool.Task(taskFunc, task);
      try {
        taskpool.execute(task2, { timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(10200006);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0300
     * @tc.desc   AsyncTask can not set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      runner.execute(task);
      try {
        taskpool.execute(task, { timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0301
     * @tc.desc   Executed task can not set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task);
      try {
        taskpool.execute(task, { timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0302
     * @tc.desc   Task throw error before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(taskError, 100);
      let terminate = false;
      taskpool.execute(task, { timeout: 1000 }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.message).assertContain("task error");
      });
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0303
     * @tc.desc   Task throw error after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(taskError, 1000);
      let terminate = false;
      taskpool.execute(task, { timeout: 500 }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0304
     * @tc.desc   TaskGroup task throw error before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(taskError, 200);
      taskGroup.addTask(taskError, 300);
      taskGroup.addTask(taskError, 400);
      taskpool.execute(taskGroup, {timeout: 1000}).catch((e:BusinessError) => {
        expect(e.message).assertContain("task error");
        terminate = true;
      })

      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0305
     * @tc.desc   TaskGroup task throw error after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(taskError, 1000);
      taskGroup.addTask(taskError, 1000);
      taskGroup.addTask(taskError, 1000);
      taskpool.execute(taskGroup, {timeout: 500}).catch((e:BusinessError) => {
        expect(e.code).assertEqual(10200070);
        terminate = true;
      })

      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0306
     * @tc.desc   TaskGroup task throw error after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskGroup.addTask(timeoutDemo, 500);
      taskGroup.addTask(timeoutDemo, 1000);
      taskpool.execute(taskGroup, {timeout: 500}).catch((e:BusinessError) => {
        expect(e.code).assertEqual(10200070);
        terminate = true;
      })

      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0307
     * @tc.desc   Empty TaskGroup set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskpool.execute(taskGroup, {timeout: 500}).then((res) => {
        terminate = true;
        expect(res.length).assertEqual(0);
      })

      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0308
     * @tc.desc   Executed Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.execute(task);
      expect(result).assertEqual(100);
      try {
        taskpool.execute(task, { timeout: 100 });
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0309
     * @tc.desc   DelayedTask set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.executeDelayed(100, task);
      expect(result).assertEqual(100);
      try {
        taskpool.execute(task, { timeout: 100 });
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0310
     * @tc.desc   PeriodicallyTask set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.executePeriodically(100, task);
      try {
        taskpool.execute(task, { timeout: 100 });
      } catch (e) {
        expect(e.code).assertEqual(10200051);
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0311
     * @tc.desc   SequenceTask can not set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      runner.execute(task);
      try {
        taskpool.execute(task, { timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0312
     * @tc.desc   TimeoutTask can not addDependency
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      task.addDependency(task2);
      try {
        taskpool.execute(task, { timeout: 1000 });
      } catch (e) {
        console.log(`taskpool: e:${e.code}`)
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0313
     * @tc.desc   Task can not addDependency TimeoutTask
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      task.addDependency(task2);
      try {
        taskpool.execute(task2, { timeout: 1000 });
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0314
     * @tc.desc   Normal taskGroup set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskpool.execute(taskGroup).then(() => {
        terminate = true;
      })
      try {
        taskpool.execute(taskGroup, { timeout: 100 })
      } catch (e) {
        expect(e.code).assertEqual(10200059);
      }
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0315
     * @tc.desc   LongTask set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let task: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 1200);
      taskpool.execute(task, {timeout: 1000}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      taskpool.terminateTask(task);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0316
     * @tc.desc   Task can be executed repeatedly when timeout=0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result1 = await taskpool.execute(task, {timeout: 0});
      let result2 = await taskpool.execute(task, {timeout: 0});
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0317
     * @tc.desc   Task can be executed again when timeout=0, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result1 = await taskpool.execute(task);
      let result2 = await taskpool.execute(task, {timeout: 0});
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0318
     * @tc.desc   Tasks can be executed repeatedly without setting timeout, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result1 = await taskpool.execute(task, {priority: taskpool.Priority.HIGH});
      let result2 = await taskpool.execute(task, {priority: taskpool.Priority.HIGH});
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0319
     * @tc.desc   Constraint not applicable when negative timeout occurs, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result1 = await taskpool.execute(task, {timeout: -1});
      let result2 = await taskpool.execute(task, {timeout: -1});
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0320
     * @tc.desc   Constraint not applicable when empty configs, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result1 = await taskpool.execute(task, {});
      let result2 = await taskpool.execute(task, {});
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0321
     * @tc.desc   TaskGroup can be executed again when timeout=0, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskGroup.addTask(timeoutDemo, 200);
      let result1 = await taskpool.execute(taskGroup, {timeout: 0});
      let result2 = await taskpool.execute(taskGroup, {timeout: 0});
      expect(result1[0]).assertEqual(100);
      expect(result1[1]).assertEqual(200);
      expect(result2[0]).assertEqual(100);
      expect(result2[1]).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0322
     * @tc.desc   TaskGroup can be executed repeatedly without setting timeout, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskGroup.addTask(timeoutDemo, 200);
      let result1 = await taskpool.execute(taskGroup, {priority: taskpool.Priority.HIGH});
      let result2 = await taskpool.execute(taskGroup, {priority: taskpool.Priority.HIGH});
      expect(result1[0]).assertEqual(100);
      expect(result1[1]).assertEqual(200);
      expect(result2[0]).assertEqual(100);
      expect(result2[1]).assertEqual(200);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0323
     * @tc.desc   DelayedTask can be executed repeatedly without setting timeout, not throwing anomalies
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let result = await taskpool.executeDelayed(100, task);
      expect(result).assertEqual(100);
      let result2 = await taskpool.execute(task, { timeout: 0 });
      expect(result2).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0324
     * @tc.desc   TimeoutTask can addDependency task when timeout = 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      task.addDependency(task2);
      let count = 0;
      taskpool.execute(task, { timeout: 0 }).then((res) => {
        count++;
        expect(res).assertEqual(100);
      });
      taskpool.execute(task2).then((res) => {
        count++;
        expect(res).assertEqual(100);
      });
      while (count < 2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0325
     * @tc.desc   Task can addDependency timeoutTask when timeout = 0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      task.addDependency(task2);
      let count = 0;
      taskpool.execute(task2, { timeout: 0 }).then((res) => {
        count++;
        expect(res).assertEqual(100);
      });
      taskpool.execute(task).then((res) => {
        count++;
        expect(res).assertEqual(100);
      });
      while (count < 2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0326
     * @tc.desc   Do not trigger onExecutionFailed after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let failedCalled = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      task.onExecutionFailed(() => {
        failedCalled = true;
      });
      taskpool.execute(task, {timeout: 100}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
        expect(failedCalled).assertFalse();
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0327
     * @tc.desc   Do not trigger sendData after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let count = 0;
      let task: taskpool.Task = new taskpool.Task(demoSenddata, 1500);
      task.onReceiveData(() => {
        count++;
      });
      taskpool.execute(task, {timeout: 1000}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(count).assertLessOrEqual(10);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0328
     * @tc.desc   Do trigger sendData before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let count = 0;
      let task: taskpool.Task = new taskpool.Task(demoSenddata, 1200);
      task.onReceiveData(() => {
        count++;
      });
      taskpool.execute(task, {timeout: 2000}).then(() => {
        terminate = true;
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(count).assertLargerOrEqual(10);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0329
     * @tc.desc   Normal completion trigger onExecutionSucceeded
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let count = 0;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      task.onExecutionSucceeded(() => {
        terminate = true;
      });
      taskpool.execute(task, {timeout: 2000}).then(() => {
        count += 10;
      });
      while (!terminate) {
        await promiseCase();
      }
      expect(count).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0330
     * @tc.desc   OnEnqueued status verification after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let enqueuedCalled = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      task.onEnqueued(() => {
        enqueuedCalled = true;
      });
      taskpool.execute(task, {timeout: 100}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
        expect(enqueuedCalled).assertTrue();
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0331
     * @tc.desc   onStartExecution status verification after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let startCalled = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      task.onStartExecution(() => {
        startCalled = true;
      });
      taskpool.execute(task, {timeout: 100}).catch((e: BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
        expect(startCalled).assertTrue();
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0332
     * @tc.desc   Different priorities
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let task4: taskpool.Task = new taskpool.Task(timeoutDemo, 1000);
      let terminate = false;
      let str = '';
      let config1: taskpool.Configs = {priority: taskpool.Priority.HIGH, timeout: 500};
      taskpool.execute(task, config1).catch((e:BusinessError) => {
        str += 'a';
        expect(e.code).assertEqual(10200058);
      })
      let config2: taskpool.Configs = {priority: taskpool.Priority.MEDIUM, timeout: 500};
      taskpool.execute(task2, config2).catch((e:BusinessError) => {
        str += 'b';
        expect(e.code).assertEqual(10200058);
      })
      let config3: taskpool.Configs = {priority: taskpool.Priority.LOW, timeout: 500};
      taskpool.execute(task3, config3).catch((e:BusinessError) => {
        str += 'c';
        expect(e.code).assertEqual(10200058);
      })
      let config4: taskpool.Configs = {priority: taskpool.Priority.IDLE, timeout: 500};
      taskpool.execute(task4, config4).catch((e:BusinessError) => {
        str += 'd';
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('abcd');
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0333
     * @tc.desc   TimeoutTask use sendable params
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1 = new taskpool.Task(sendableFuncWithTime, sendableFunc, 500);
      taskpool.execute(task1, {timeout: 1000}).then((res) => {
        isTerminate1 = true;
        expect(res).assertEqual(500);
      })

      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task2 = new taskpool.Task(sendableClassWithTime, classTest, 500);
      taskpool.execute(task2, {timeout: 1000}).then((res) => {
        isTerminate2 = true;
        expect(res).assertEqual(600);
      })

      while (!isTerminate1 && !isTerminate2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0334
     * @tc.desc   TimeoutTask use sendable params
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1 = new taskpool.Task(sendableFuncWithTime, sendableFunc, 500);
      taskpool.execute(task1, {timeout: 100}).catch((e: BusinessError) => {
        isTerminate1 = true;
        expect(e.code).assertEqual(10200058);
      })

      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task2 = new taskpool.Task(sendableClassWithTime, classTest, 500);
      taskpool.execute(task2, {timeout: 100}).catch((e: BusinessError) => {
        isTerminate2 = true;
        expect(e.code).assertEqual(10200058);
      })

      while (!isTerminate1 && !isTerminate2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0335
     * @tc.desc   TimeoutTask use ArrayBuffer params
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);

      let task: taskpool.Task = new taskpool.Task(setTransferListTestWithTime, view, view1, 500);
      task.setTransferList([view.buffer, view1.buffer]);
      taskpool.execute(task).then((ret)=>{
        result = ret as number;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(24);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0336
     * @tc.desc   TimeoutTask use ArrayBuffer params
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);

      let task: taskpool.Task = new taskpool.Task(setTransferListTestWithTime, view, view1, 1000);
      task.setTransferList([view.buffer, view1.buffer]);
      taskpool.execute(task, {timeout: 500}).catch((e: BusinessError)=>{
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0337
     * @tc.desc   TimeoutTask use setCloneList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let arr: Array<number> = [1, 2, 3, 4];
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let arrayInt: Int32Array = new Int32Array(arrayBuffer);
      for (let i: number = 0; i < arr.length; i++) {
        arrayInt[i] = arr[i];
      }
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(setCloneListTestWithTime, arrayInt, 500);
      task.setCloneList([arrayBuffer]);
      taskpool.execute(task, {timeout: 1000}).then(() => {
        isTerminate = true;
        expect(arrayInt[0]).assertEqual(1);
      })
      while (!isTerminate) {
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0338
     * @tc.desc   TimeoutTask use setCloneList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let arr: Array<number> = [1, 2, 3, 4];
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let arrayInt: Int32Array = new Int32Array(arrayBuffer);
      for (let i: number = 0; i < arr.length; i++) {
        arrayInt[i] = arr[i];
      }
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(setCloneListTestWithTime, arrayInt, 1000);
      task.setCloneList([arrayBuffer]);
      taskpool.execute(task, {timeout: 500}).catch((e: BusinessError) => {
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!isTerminate) {
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_1001
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 300;
      let timeout = 300;
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task('', timeoutDemo, dealTime);
      let config: taskpool.Configs = {priority: taskpool.Priority.IDLE, timeout: timeout};
      taskpool.execute(task, config).then((res) => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(terminate).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_1002
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 300;
      let timeout = 300;
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task('timeoutDemo', timeoutDemo, [dealTime]);
      let config: taskpool.Configs = {priority: taskpool.Priority.MEDIUM, timeout: timeout};
      taskpool.execute(task, config).then((res) => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(terminate).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_1003
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 300;
      let timeout = 300;
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task('1', timeoutDemo, []);
      let config: taskpool.Configs = {priority: taskpool.Priority.HIGH, timeout: timeout};
      taskpool.execute(task, config).then((res) => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200058);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(terminate).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskTimeoutTestClass072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_1004
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTimeoutTestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dealTime = 300;
      let timeout = 300;
      let terminate = false;
      let task: taskpool.Task = new taskpool.Task('', timeoutDemo, dealTime);
      let group: taskpool.TaskGroup = new taskpool.TaskGroup('');
      group.addTask(task);
      let config: taskpool.Configs = {priority: taskpool.Priority.LOW, timeout: timeout};
      taskpool.execute(group, config).then((res) => {
        terminate = true;
      }).catch((e:BusinessError) => {
        terminate = true;
        expect(e.code).assertEqual(10200070);
      })
      while (!terminate) {
        await promiseCase();
      }
      expect(terminate).assertEqual(true);
      done();
    })
  })
}