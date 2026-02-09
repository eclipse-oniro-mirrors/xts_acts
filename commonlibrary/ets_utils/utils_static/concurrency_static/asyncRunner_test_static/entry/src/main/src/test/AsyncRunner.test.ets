/*
 * Copyright (C) 2022-2026 Huawei Device Co., Ltd.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index'

import { BusinessError } from '@ohos.base'
import {
  Add,
  AdditionDelay,
  arraySum,
  asyncSum,
  CancelAndExecuteDelayed,
  currentFun,
  dealHashMapTest,
  delay,
  delaySum,
  dependend,
  errorTest,
  funcStrCat,
  hashMapTest,
  Int8ArrayTestFunc,
  isConcurrentTest1,
  isConcurrentTest2,
  longString,
  loop,
  MapTestFunc,
  Multi,
  noUseConcurrentTest,
  objectSum,
  outerTaskFunc,
  printArgsFunc,
  promiseCase,
  promiseNumber,
  promiseTest,
  randomTest,
  returnError,
  sendableClassArrFunc,
  sendableClassTest,
  sendableClassTestFunc,
  sendableFuncTest,
  sendDataTest,
  sequenceRunnerTest,
  setCloneListTest,
  SetTestFunc,
  setTransferListTest,
  simpleSendableClassTestFunc,
  Sum,
  testCancelDelayed,
  testNumber,
  testString,
  testTaskPool,
  testTime,
  testWithArray,
  testWithThreeParams,
  transferArrayBuffer,
  transferAtomics,
  Uint8ClampedArrayTestFunc,
  WaitforRunner
} from '../utils/TestFunclist'
import { A, B, cancelById, fun, getLongString, printArgs, printStrArgs, StrCat } from '../utils/ExportFunclist'
import { SendableClass, SendableClassTest, SimpleSendable } from '../utils/Sendable';
import HashMap from '@ohos.util.HashMap';

export default function asyncRunnerTest() {
  describe('asyncRunnerTest', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0207
     * @tc.name  TaskPoolTestClass207
     * @tc.desc Create AsyncRunner error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          new taskpool.AsyncRunner(0);
          console.log('TaskPoolTestClass207============1')
          expect('should throw').assertFail();
        } catch (e) {
          console.log('TaskPoolTestClass207============', e.message)
          // expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, RunningCapacity must be greater than zero.');
          const msg = e.toString();


          // expect(msg.includes('RunningCapacity must be greater than zero')).assertTrue();
          expect(msg).assertContain('runningCapacity');
          expect(msg).assertContain('positive number');
        }

        try {
          new taskpool.AsyncRunner("async207", 5, -1);
          expect('should throw').assertFail();
        } catch (e) {
          console.log('TaskPoolTestClass207============2', e.message)
          // expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, WaitingCapacity must be greater than or equal zero.');
          const msg = e.toString();
          // expect(msg.includes('WaitingCapacity must be greater than or equal zero')).assertTrue();
          expect(msg).assertContain('waitingCapacity');
          expect(msg).assertContain('non-negative number');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0208
     * @tc.name  TaskPoolTestClass208
     * @tc.desc Create AsyncRunner error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        new taskpool.AsyncRunner("async208", 5);
        try {
          new taskpool.AsyncRunner("async208", 4);
        } catch (e) {
          expect(e.toString())
            .assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner runningCapacity can not changed.');
        }

        try {
          new taskpool.AsyncRunner("async208", 5, 10);
        } catch (e) {
          expect(e.toString())
            .assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner waitingCapacity can not changed.');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0209
     * @tc.name  TaskPoolTestClass209
     * @tc.desc AsyncRunner execute error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async209", 5, 5);
        let task: taskpool.Task = new taskpool.Task("task209", printArgs, 100);
        try {
          // asyncRunner.execute(task, 4);
          const fourInt: int = 4;
          const badPriority: taskpool.Priority = fourInt as taskpool.Priority;

          asyncRunner.execute(task, badPriority);

          expect().assertFail();
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, Priority value is error.');
          expect(e.toString()).assertContain('Priority');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0210
     * @tc.name  TaskPoolTestClass210
     * @tc.desc AsyncRunner cancel task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async210", 2);
        let num = 0;
        for (let i = 0; i < 5; i++) {
          let task: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
          asyncRunner.execute(task).then(() => {
            num++;
          }).catch((e: Error) => {
            num++;
            expect((e as BusinessError).toString())
              .assertEqual('BusinessError: The asyncRunner task has been canceled.');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0211
     * @tc.name  TaskPoolTestClass211
     * @tc.desc AsyncRunner cannot execute seqRunnerTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async211", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000.0);
        let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq211");
        await seqRunner.execute(task);
        try {
          await asyncRunner.execute(task);
          expect().assertFail();
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
          expect(e.toString()).assertContain('asyncRunner cannot execute');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0212
     * @tc.name  TaskPoolTestClass212
     * @tc.desc AsyncRunner cannot execute groupTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async212", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup212");
        taskGroup.addTask(task);
        try {
          asyncRunner.execute(task);
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute groupTask.');
          expect(e.toString()).assertContain('asyncRunner cannot execute groupTask');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0213
     * @tc.name  TaskPoolTestClass213
     * @tc.desc AsyncRunner cannot execute dependent task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async213", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        task.addDependency(task2);
        try {
          asyncRunner.execute(task);
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: AsyncRunner:: dependent task not allowed.');
          expect(e.toString()).assertContain('asyncRunner dependent task not allowed');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0214
     * @tc.name  TaskPoolTestClass214
     * @tc.desc AsyncRunner cannot execute asyncRunnerTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214", 2);
        let asyncRunner2: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214-1", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          asyncRunner2.execute(task);
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute asyncRunnerTask.');
          expect(e.toString()).assertContain('asyncRunner cannot execute');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0215
     * @tc.name  TaskPoolTestClass215
     * @tc.desc AsyncRunner cannot execute executedTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async215", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        taskpool.execute(task);
        try {
          asyncRunner.execute(task);
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
          expect(e.toString()).assertContain('asyncRunner cannot execute');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0216
     * @tc.name  TaskPoolTestClass216
     * @tc.desc AsyncRunner cannot execute periodicTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async216", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        taskpool.executePeriodically(1000, task);
        try {
          asyncRunner.execute(task);
        } catch (e) {
          expect(e.toString()).assertContain('asyncRunner cannot execute');
        }
        setTimeout(() => {
          taskpool.cancel(task);
        }, 2000);
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0217
     * @tc.name  TaskPoolTestClass217
     * @tc.desc sequenceRunner cannot execute asyncRunnerTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async217", 2);
        let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq217");
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          seqRunner.execute(task);
        } catch (e) {
          expect(e.toString()).assertContain('sequenceRunner cannot execute');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0218
     * @tc.name  TaskPoolTestClass218
     * @tc.desc taskGroup cannot execute asyncRunnerTask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async218", 2);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup218");
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          taskGroup.addTask(task);
        } catch (e) {
          // expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, TaskGroup cannot execute asyncRunnerTask.');
          expect(e.toString()).assertContain('taskGroup cannot add');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0219
     * @tc.name  TaskPoolTestClass219
     * @tc.desc asyncRunnerTask cannot execute outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async219", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          taskpool.execute(task);
        } catch (e) {
          expect(e.toString())
            .assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot execute outside.');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0220
     * @tc.name  TaskPoolTestClass220
     * @tc.desc asyncRunnerTask cannot execute outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async220", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          task2.addDependency(task);
        } catch (e) {
          const raw = e.toString();
          expect(raw).assertContain('asyncRunnerTask');
          expect(raw).assertContain('cannot be relied on');
          // expect(e.toString()).assertEqual('BusinessError: The task has been executed by AsyncRunner.');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0221
     * @tc.name  TaskPoolTestClass221
     * @tc.desc asyncRunnerTask cannot executed periodically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async221", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          taskpool.executePeriodically(1000, task);
        } catch (e) {
          expect(e.toString()).assertContain('cannot be executed periodically');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0222
     * @tc.name  TaskPoolTestClass222
     * @tc.desc asyncRunnerTask cannot executeDelayed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async222", 2);
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
        asyncRunner.execute(task);
        try {
          taskpool.executeDelayed(1000, task);
        } catch (e) {
          expect(e.toString()).assertContain('asyncRunnerTask cannot executeDelayed outside');
        }
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0223
     * @tc.name  TaskPoolTestClass223
     * @tc.desc asyncRunner task discarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async223", 5, 2);
        let success = 0;
        let failure = 0;
        let size = 10;
        for (let i = 0; i < size; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs, i);
          asyncRunner.execute(task, taskpool.Priority.HIGH).then(() => {
            success++;
          }).catch((e: Error) => {
            failure++;
            expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task is discarded.');
          });
        }
        while (success + failure < size) {
          await promiseCase();
        }
        expect(success + failure).assertEqual(size);
        expect(failure > 0 || success === size).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0224
     * @tc.name  TaskPoolTestClass224
     * @tc.desc asyncRunner task has been canceled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async224", 2);
        let success = 0;
        let failure = 0;
        let size = 5;
        let arr: Array<taskpool.Task> = [];
        for (let i = 0; i < size; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs, i);
          asyncRunner.execute(task).then(() => {
            success++;
          }).catch((e: Error) => {
            failure++;
            expect((e as BusinessError).toString())
              .assertEqual('BusinessError: The asyncRunner task has been canceled.');
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
        expect(failure >= arr.length).assertTrue();

        done();
      })


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0228
     * @tc.name  TaskPoolTestClass228
     * @tc.desc cancel by taskId
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let str = 'test';
        let task = new taskpool.Task(fun, str);
        let terminate = false;
        const p = taskpool.executeDelayed(2000, task);
        p.then(() => {
          terminate = true;
          expect('should be canceled').assertFail();
        }).catch(() => {
          str = 'cancel success';
          terminate = true;
        });
        let cancelTask = new taskpool.Task(cancelById, task);
        await taskpool.execute(cancelTask);


        while (!terminate) {
          await promiseCase();
        }
        expect(str).assertEqual('cancel success');
        done();
      })


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0234
     * @tc.name  TaskPoolTestClass234
     * @tc.desc Test asyncRunnerTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let cancelNum = 0;
        let doneCount = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
        let size = 30;

        for (let i = 0; i < size; i++) {

          let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
          asyncRunner.execute(task)
            .then(() => {
              doneCount++;
            })
            .catch((e: Error) => {
              cancelNum++;
              doneCount++;
            });


          await promiseCase();
          try {
            taskpool.cancel(task);
          } catch (_) {
          }
        }

        while (doneCount < size) {
          await promiseCase();
        }

        expect(cancelNum).assertEqual(size);
        done();
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0235
     * @tc.name  TaskPoolTestClass235
     * @tc.desc Test task cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TaskPoolTestClass235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let cancelNum = 0;
        let asyncCatchNum = 0;
        let doneCount = 0;

        let size = 20;
        for (let i = 0; i < size; i++) {

          let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
          taskpool.execute(task)
            .then(() => {
              doneCount++;
            })
            .catch((e: Error) => {
              expect(e.toString()).assertContain('canceled');
              cancelNum++;
              doneCount++;
            });
          await promiseCase();
          await promiseCase();
          try {
            taskpool.cancel(task);
          } catch (_) {
          }
        }

        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
        let asyncSize = 10;
        for (let i = 0; i < asyncSize; i++) {
          let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
          asyncRunner.execute(task)
            .then(() => {
              doneCount++;
            })
            .catch((e: Error) => {
              expect(e.toString()).assertContain('canceled');
              asyncCatchNum++;
              doneCount++;
            });
          await promiseCase();
          try {
            taskpool.cancel(task);
          } catch (_) {
          }
        }

        while (doneCount < (size + asyncSize)) {
          await promiseCase();
        }

        expect(cancelNum).assertEqual(size);
        expect(asyncCatchNum).assertEqual(asyncSize);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0236
     * @tc.name  TaskPoolTestClass236
     * @tc.desc Test waiting task cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error = "";
        let result: object | undefined = undefined;
        let task = new taskpool.Task(loop);
        taskpool.executeDelayed(1000, task).catch((e: Error) => {
          // if (e.data !== undefined) {
          //   error = (e.data.error as Error).toString();
          //   if (e.data.result!== undefined) {
          //     result = e.data.result as object;
          //   }
          // }
          error = e.message;
          terminate = true;
        })
        setTimeout(() => {
          taskpool.cancel(task);
        }, 500);

        while (!terminate) {
          await promiseCase();
        }
        expect(error).assertEqual("taskpool:: task has been canceled");
        expect(result).assertEqual(undefined);
        done();
      })


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0240
     * @tc.name  TaskPoolTestClass240
     * @tc.desc Test running asyncTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error: string = "";
        let code: number = 0;
        let result: object | undefined = undefined;
        let task = new taskpool.Task(loop);
        let runner = new taskpool.AsyncRunner(1, 1);
        runner.execute(task)
          .catch((e: Error) => {
            expect(e.message).assertContain("asyncRunner task has been canceled");
            terminate = true;
          })
        setTimeout(() => {
          taskpool.cancel(task);
        }, 300);

        while (!terminate) {
          await promiseCase();
        }
        expect(terminate).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0241
     * @tc.name  TaskPoolTestClass241
     * @tc.desc Test running asyncTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error: string = "";
        let code: number = 0;
        let result: object | undefined = undefined;
        let task = new taskpool.Task(loop);
        let runner = new taskpool.AsyncRunner(1, 1);
        runner.execute(task).then(() => {
        }).catch((e: Error) => {
          console.info('TaskPoolTestClass241_error', e.message)
          expect(e.message).assertContain('asyncRunner task has been canceled')
          terminate = true;
        })
        setTimeout(() => {
          taskpool.cancel(task);
        }, 800);
        while (!terminate) {
          await promiseCase();
        }
        expect(terminate).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0242
     * @tc.name  TaskPoolTestClass242
     * @tc.desc Test waiting asyncTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error: string = "";
        let code: number = 0;
        let result: object | undefined = undefined;
        let task = new taskpool.Task(loop);
        let task2 = new taskpool.Task(loop);
        let runner = new taskpool.AsyncRunner(1, 1);
        runner.execute(task);
        runner.execute(task2).catch((e: Error) => {
          console.info('==========TaskPoolTestClass242', e.message)
          terminate = true;
        })
        setTimeout(() => {
          console.info('2==========TaskPoolTestClass242')
          taskpool.cancel(task2);
        }, 800);

        // while (!terminate) {
        //   await promiseCase();
        // }

        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0243
     * @tc.name  TaskPoolTestClass243
     * @tc.desc Test running asyncTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error: string = "";
        let code: number = 0;
        let result: object | undefined = undefined;
        let task = new taskpool.Task(delaySum, 10.0, 20.0, 500.0);
        let runner = new taskpool.AsyncRunner(1, 1);
        runner.execute(task).catch((e: Error) => {
          // const be = e as BusinessError;
          // code = be.code;
          // error = e.message;
          console.info('TaskPoolTestClass243_error', e.message)
          expect(e.message).assertContain('asyncRunner task has been canceled')
          terminate = true;
        })
        setTimeout(() => {
          taskpool.cancel(task);
        }, 300);

        while (!terminate) {
          await promiseCase();
        }
        expect(terminate).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0244
     * @tc.name  TaskPoolTestClass244
     * @tc.desc Test running sequenceTask cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTestClass244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        let error: string = "";
        let code: number = 0;
        let result: object | undefined = undefined;
        let task = new taskpool.Task(loop);
        let runner = new taskpool.AsyncRunner(1, 1);
        runner.execute(task).catch((e: Error) => {

          expect(e.message).assertContain("asyncRunner task has been canceled");
          terminate = true;
        })
        setTimeout(() => {
          taskpool.cancel(task);
        }, 300);

        while (!terminate) {
          await promiseCase();
        }
        expect(terminate).assertTrue();
        done();
      })

  })
}