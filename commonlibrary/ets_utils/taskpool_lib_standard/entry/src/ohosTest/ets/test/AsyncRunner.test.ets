/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { taskpool, collections, TreeSet, MessageEvents } from '@kit.ArkTS'
import worker from '@ohos.worker'
import { BusinessError } from '@ohos.base'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, sequenceRunnerPriorityTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, noUseConcurrentTest, sendDataTest, sendableClassTestFunc, Int8ArrayTestFunc,
  SetTestFunc, MapTestFunc, simpleSendableClassTestFunc, Uint8ClampedArrayTestFunc, testWithThreeParams, testWithArray,
  sendableFuncTest, sendableClassTest, promiseTest, measureTest, loop, returnError, longString, sendableClassArrFunc,
  promiseNumber, TreeSetTestFunc, getCreateTaskId, taskSendManyFunc, taskErrFunc } from './testFunclist'
import { A, B, StrCat, printArgs, printStrArgs, fun, cancelById, getLongString, getTaskResult } from './exportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest, TaskInfoClass } from './sendable';
import HashMap from '@ohos.util.HashMap';

export default function asyncRunnerTest() {
  describe('asyncRunnerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   TaskPoolTestClass207
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0207
     * @tc.desc   Create AsyncRunner error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        new taskpool.AsyncRunner(0);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, RunningCapacity must be greater than zero.');
      }

      try {
        new taskpool.AsyncRunner("async207", 5, -1);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, WaitingCapacity must be greater than or equal zero.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass208
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0208
     * @tc.desc   Create AsyncRunner error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      new taskpool.AsyncRunner("async208", 5);
      try {
        new taskpool.AsyncRunner("async208", 4);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner runningCapacity can not changed.');
      }

      try {
        new taskpool.AsyncRunner("async208", 5, 10);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner waitingCapacity can not changed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass209
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0209
     * @tc.desc   AsyncRunner execute error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async209", 5, 5);
      let task: taskpool.Task = new taskpool.Task("task209", printArgs, 100);
      try {
        asyncRunner.execute(task, 4);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, Priority value is error.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass210
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0210
     * @tc.desc   AsyncRunner cancel task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async210", 2);
      let num = 0;
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
        asyncRunner.execute(task).then(() => {
          num++;
        }).catch((e: BusinessError) => {
          num++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task has been canceled.');
        })
        if (i > 3) {
          taskpool.cancel(task);
        }
      }
      while (num < 5) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass211
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0211
     * @tc.desc   AsyncRunner cannot execute seqRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async211", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq211");
      seqRunner.execute(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass212
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0212
     * @tc.desc   AsyncRunner cannot execute groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async212", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup212");
      taskGroup.addTask(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute groupTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass213
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0213
     * @tc.desc   AsyncRunner cannot execute dependent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async213", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      task.addDependency(task2);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: AsyncRunner:: dependent task not allowed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass214
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0214
     * @tc.desc   AsyncRunner cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214", 2);
      let asyncRunner2: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214-1", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        asyncRunner2.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass215
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0215
     * @tc.desc   AsyncRunner cannot execute executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async215", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      taskpool.execute(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass216
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0216
     * @tc.desc   AsyncRunner cannot execute periodicTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async216", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      taskpool.executePeriodically(1000, task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The periodic task cannot be executed again, AsyncRunner cannot execute the periodicTask.');
      }
      setTimeout(()=>{
        taskpool.cancel(task);
      }, 2000);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass217
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0217
     * @tc.desc   sequenceRunner cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async217", 2);
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq217");
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        seqRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, SequenceRunner cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass218
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0218
     * @tc.desc   taskGroup cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async218", 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup218");
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskGroup.addTask(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, TaskGroup cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass219
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0219
     * @tc.desc   asyncRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async219", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot execute outside.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass220
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0220
     * @tc.desc   asyncRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async220", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        task2.addDependency(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task has been executed by AsyncRunner.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass221
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0221
     * @tc.desc   asyncRunnerTask cannot executed periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async221", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.executePeriodically(1000, task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot executePeriodically.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass222
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0222
     * @tc.desc   asyncRunnerTask cannot executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async222", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.executeDelayed(1000, task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot executeDelayed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass223
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0223
     * @tc.desc   asyncRunner task discarded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async223", 5, 2);
      let success = 0;
      let failure = 0;
      let size = 10;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task, taskpool.Priority.HIGH).then(() => {
          success++;
        }).catch((e: BusinessError) => {
          failure++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task is discarded.');
        });
      }
      while (success + failure < size) {
        await promiseCase();
      }
      expect(success >= 5).assertTrue();
      expect(success).assertLess(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass224
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0224
     * @tc.desc   asyncRunner task has been canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async224", 2);
      let success = 0;
      let failure = 0;
      let size = 5;
      let arr: Array<taskpool.Task> = [];
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).then(() => {
          success++;
        }).catch((e: BusinessError) => {
          failure++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task has been canceled.');
        });
        if (i > 3) {
          arr.push(task);
        }
      }
      for (let i = 0; i < arr.length; i++) {
        try {
          taskpool.cancel(arr[i]);
        } catch (e) {
        }
      }
      while (success + failure < size) {
        await promiseCase();
      }
      expect(failure).assertEqual(arr.length);
      done();
    })
  })
}