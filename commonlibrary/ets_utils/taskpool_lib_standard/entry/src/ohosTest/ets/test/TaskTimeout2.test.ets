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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import {
  asyncRunnerNestedGroup,
  asyncRunnerNestedTask,
  asyncRunnerTaskNestedTimeout,
  delayedNestedTask,
  demoSenddata,
  level1Task,
  level3Task,
  longTaskNestedGroup,
  longTaskNestedTimeout,
  nestedDifferentTimeout,
  nestedInnerCancelExceptionTimeout,
  nestedInnerExceptionTask,
  nestedInnerTimeout1Task,
  nestedInnerTimeoutTask,
  nestedOuterCancelTask,
  nestedOuterCompleteTask,
  nestedOuterTask,
  nestedTaskGroupTask,
  nestedTimeoutTask,
  outerAwaitMultipleTimeout,
  periodicTaskInner,
  rejectTaskLong,
  rejectTaskShort,
  sendableClassWithTime,
  sequenceRunnerNestedGroup,
  sequenceRunnerNestedTask,
  setTransferListTestWithTime,
  taskAsyncRunnerInnerLongOuterShort,
  taskAsyncRunnerInnerShortOuterLong,
  taskError,
  taskGroupAsyncRunnerInnerLongOuterShort,
  taskGroupAsyncRunnerInnerShortOuterLong,
  taskGroupSequenceRunnerInnerLongOuterShort,
  taskGroupSequenceRunnerInnerShortOuterLong,
  taskSequenceRunnerInnerLongOuterShort,
  taskSequenceRunnerInnerShortOuterLong,
  timeoutDemo,
  timeoutWithLongTask
} from '../utils/TimeoutFuncList';
import { promiseCase } from './testFunclist';
import { SendableClassTest, sendableFunc } from './sendable';
import { level2Task } from '../utils/TimeoutFunc2';
import { nestPeriodicTaskInner } from '../utils/TimeoutFunc3';

export default function TaskTimeout2Test() {
  describe('ActTaskTimeout2Test', () => {
    /**
     * @tc.name   TaskTimeout2TestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0339
     * @tc.desc   HIGH priority + short timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass001';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 50 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0340
     * @tc.desc   LOW priority + long timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass002';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.LOW, timeout: 200 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0341
     * @tc.desc   IDLE priority + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass003';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 600);
      taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0342
     * @tc.desc   Multiple tasks with different priorities and same timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass004';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200);

      taskpool.execute(task1, { priority: taskpool.Priority.HIGH, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task1: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2, { priority: taskpool.Priority.MEDIUM, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task2: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task3, { priority: taskpool.Priority.LOW, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task3: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0343
     * @tc.desc   Task + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass005';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0344
     * @tc.desc   GenericsTask + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass006';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.GenericsTask<[number], number> =
        new taskpool.GenericsTask<[number], number>(timeoutDemo, 200);
      taskpool.execute<[number], number>(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0345
     * @tc.desc   TaskGroup + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass007';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 200);
      taskGroup.addTask(timeoutDemo, 200);
      taskpool.execute(taskGroup, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0346
     * @tc.desc   Mixed task group + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass008';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskGroup.addTask(timeoutDemo, 500);
      taskGroup.addTask(timeoutDemo, 1200);
      taskpool.execute(taskGroup, { timeout: 1000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0347
     * @tc.desc   Multiple timeout tasks concurrent execution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass009';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200);

      taskpool.execute(task1, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task3, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0348
     * @tc.desc   Timeout task and normal task concurrent
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass010';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);

      taskpool.execute(task1, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 2) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2).then(() => {
        count++;
        console.log(`${caseName} then`);
        if (count >= 2) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0349
     * @tc.desc   Multiple task groups concurrent timeout execution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass011';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(timeoutDemo, 200);
      taskGroup2.addTask(timeoutDemo, 200);

      taskpool.execute(taskGroup1, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch taskGroup1: ${e}`);
        count++;
        expect(e.code).assertEqual(10200070);
        if (count >= 2) {
          isTerminate = true;
        }
      })
      taskpool.execute(taskGroup2, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch taskGroup2: ${e}`);
        count++;
        expect(e.code).assertEqual(10200070);
        if (count >= 2) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0350
     * @tc.desc   Timeout task + ArrayBuffer parameters
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass012';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(setTransferListTestWithTime, new Uint8Array(new ArrayBuffer(8)),
        new Uint8Array(new ArrayBuffer(8)), 500);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(16);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0351
     * @tc.desc   Timeout task + Sendable object
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass013';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task = new taskpool.Task(sendableClassWithTime, classTest, 500);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(600);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0352
     * @tc.desc   Timeout task + setTransferList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass014';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(setTransferListTestWithTime, new Uint8Array(new ArrayBuffer(8)),
        new Uint8Array(new ArrayBuffer(8)), 500);
      task.setTransferList([new ArrayBuffer(8)]);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(16);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0353
     * @tc.desc   Timeout task + setCloneList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass015';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task = new taskpool.Task(sendableClassWithTime, classTest, 500);
      task.setCloneList([classTest]);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(600);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0354
     * @tc.desc   Nested timeout task inside normal task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass016';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedOuterTask, 100);
      taskpool.execute(task, { timeout: 2000 }).catch((e: BusinessError) => {
        isTerminate = true;
        console.log(`${caseName} error: ${e.code}, ${e.message}`)
        expect(e.code).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0355
     * @tc.desc   Nested timeout task inside timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass017';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedTimeoutTask, 100);
      taskpool.execute(task, { timeout: 2000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0356
     * @tc.desc   Nested timeout task inside timeout task with different timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass018';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedDifferentTimeout, 100);
      taskpool.execute(task, { timeout: 3000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0357
     * @tc.desc   Nested timeout task group inside timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass019';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedTaskGroupTask, 100);
      taskpool.execute(task, { timeout: 3000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.toString()).assertContain(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0358
     * @tc.desc   Multi-layer nested timeout tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass020';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      taskpool.execute(new taskpool.Task(level1Task), { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0359
     * @tc.desc   Timeout task await multiple timeout tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass021';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(outerAwaitMultipleTimeout);
      taskpool.execute(task, { timeout: 5000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        let data = res as Array<number>
        expect(data.length).assertEqual(2);
        expect(data[0]).assertEqual(100);
        expect(data[1]).assertEqual(100);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0360
     * @tc.desc   AsyncRunner task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass022';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task = new taskpool.Task(asyncRunnerNestedTask);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0361
     * @tc.desc   SequenceRunner task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass023';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task = new taskpool.Task(sequenceRunnerNestedTask);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0362
     * @tc.desc   AsyncRunner task with nested timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass024';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task = new taskpool.Task(asyncRunnerNestedGroup);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0363
     * @tc.desc   SequenceRunner task with nested timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass025';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task = new taskpool.Task(sequenceRunnerNestedGroup);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0364
     * @tc.desc   AsyncRunner onReceiveData with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass026';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task1 = new taskpool.Task(demoSenddata, 300);
      task1.onReceiveData((data: number) => {
        count++;
        if (count === 2) {
          let innerTask = new taskpool.Task(timeoutDemo, 200);
          taskpool.execute(innerTask, { timeout: 100 }).catch((e: BusinessError) => {
            console.log(`${caseName} catch innerTask: ${e}`);
            isTerminate = true;

            expect(e.code).assertEqual(10200058);
          })
        }
      })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0366
     * @tc.desc   Timeout task nested in onExecutionSucceeded
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass028';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onExecutionSucceeded(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        console.info(`${caseName} execute task1 then`);
      }).catch((e: BusinessError) => {
        console.info(`${caseName} catch task1: ${e.message}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0367
     * @tc.desc   Timeout task nested in onExecutionFailed
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass029';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(taskError, 100);
      task1.onExecutionFailed(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1).catch((e: BusinessError) => {
        console.log(`${caseName} catch task1: ${e}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0368
     * @tc.desc   Timeout task nested in onReceiveData
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass030';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task1 = new taskpool.Task(demoSenddata, 300);
      task1.onReceiveData((data: number) => {
        count++;
        if (count === 2) {
          let innerTask = new taskpool.Task(timeoutDemo, 200);
          taskpool.execute(innerTask, { timeout: 100 }).catch((e: BusinessError) => {
            console.log(`${caseName} catch innerTask: ${e}`);
            isTerminate = true;
            expect(e.code).assertEqual(10200058);
          })
        }
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0369
     * @tc.desc   Timeout task nested in onEnqueued
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass031';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onEnqueued(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0370
     * @tc.desc   Timeout task nested in onStartExecution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass032';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onStartExecution(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0371
     * @tc.desc   Timeout task nested in Promise.then
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass033';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task1).then(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0372
     * @tc.desc   Timeout task nested in Promise.catch
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass034';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(taskError, 100);
      taskpool.execute(task1).catch((e: BusinessError) => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0378
     * @tc.desc   Worker onmessage with timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass035';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task1 = new taskpool.Task(demoSenddata, 300);
      task1.onReceiveData((data: number) => {
        count++;
        if (count === 2) {
          let innerTask = new taskpool.Task(timeoutDemo, 200);
          taskpool.execute(innerTask, { timeout: 100 }).catch((e: BusinessError) => {
            console.log(`${caseName} catch innerTask: ${e}`);
            isTerminate = true;
            expect(e.code).assertEqual(10200058);
          })
        }
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0379
     * @tc.desc   Delayed task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass036';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(delayedNestedTask);
      await taskpool.executeDelayed(100, task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        expect(e.toString()).assertContain(10200058);
      });
      let task2 = new taskpool.Task(delayedNestedTask);
      taskpool.execute(task2, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.toString()).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0381
     * @tc.desc   Periodic task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task = new taskpool.Task(periodicTaskInner);
      taskpool.executePeriodically(500, task);
      try {
        taskpool.execute(task).catch((e: BusinessError) => {
        })
      } catch (e) {
        expect(e.code).assertEqual(10200051);
      }
      taskpool.cancel(task);
      done();
    })


    /**
     * @tc.name   TaskTimeout2TestClass038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0383
     * @tc.desc   LongTask with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass038';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let longTask: taskpool.LongTask = new taskpool.LongTask(longTaskNestedTimeout);
      taskpool.execute(longTask, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0384
     * @tc.desc   LongTask with nested timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass039';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let longTask: taskpool.LongTask = new taskpool.LongTask(longTaskNestedGroup);
      taskpool.execute(longTask, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0385
     * @tc.desc   Timeout task with LongTask inside
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass040';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutWithLongTask);
      taskpool.execute(task, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0386
     * @tc.desc   LongTask with timeout=0
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass041';
      console.log(`${caseName} start.`);
      let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100);
      taskpool.execute(longTask, { timeout: 0 }).then((res) => {
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      });
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0387
     * @tc.desc   LongTask with only priority set
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass042';
      console.log(`${caseName} start.`);
      let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100);
      taskpool.execute(longTask, { priority: taskpool.Priority.HIGH }).then((res) => {
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      });
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0388
     * @tc.desc   LongTask with empty configs
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass043';
      console.log(`${caseName} start.`);
      let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100);
      taskpool.execute(longTask, {}).then((res) => {
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      });
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0389
     * @tc.desc   LongTask callback with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass044';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let longTask = new taskpool.LongTask(timeoutDemo, 100);
      longTask.onExecutionSucceeded(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 1000);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(longTask);
      while (!isTerminate) {
        await promiseCase();
      }
      taskpool.terminateTask(longTask);
      console.log(`${caseName} end.`);
      done();
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0390
     * @tc.desc   Cancel task before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass045';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutDemo, 1000);
      taskpool.execute(task, { timeout: 2000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        if (!isTerminate) {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0391
     * @tc.desc   Cancel task after timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass046';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutDemo, 2000);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        expect(e.code).assertEqual(10200058);
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
          console.log(`${caseName} cancel end: `);
          isTerminate = true;
          // expect().assertFail();
        } catch (e) {
          console.log(`${caseName} cancel catch: ${e}`);
          // expect(e.code).assertEqual(10200015);
          isTerminate = true;
        }
      }, 1000);
      while (!isTerminate) {
        await promiseCase();
      }
      done();
      console.log(`${caseName} end.`);
    })

    /**
     * @tc.name   TaskTimeout2TestClass047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0392
     * @tc.desc   Cancel executing timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass047';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutDemo, 200);
      taskpool.execute(task, { timeout: 400 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log(`${caseName} cancel catch: ${e}`);
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0393
     * @tc.desc   Cancel waiting timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass048';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutDemo, 200);
      taskpool.execute(task, { timeout: 400 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      try {
        taskpool.cancel(task);
      } catch (e) {
        console.log(`${caseName} cancel catch: ${e}`);
      }
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0394
     * @tc.desc   Cancel timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass049';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(timeoutDemo, 200);
      group.addTask(timeoutDemo, 200);
      taskpool.execute(group, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(group);
        } catch (e) {
          console.log(`${caseName} cancel catch: ${e}`);
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0395
     * @tc.desc   Partial cancel of timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass050';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      let task1 = new taskpool.Task(timeoutDemo, 100);
      let task2 = new taskpool.Task(timeoutDemo, 200);
      let task3 = new taskpool.Task(timeoutDemo, 100);
      group.addTask(task1);
      group.addTask(task2);
      group.addTask(task3);
      taskpool.execute(group, { timeout: 500 }).then(() => {
        isTerminate = true;
        console.log(`${caseName} then`);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task2);
        } catch (e) {
          console.log(`${caseName} cancel catch: ${e}`);
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0396
     * @tc.desc   Cancel and timeout happen simultaneously
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass051';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(timeoutDemo, 2000);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect([10200016, 10200058]).assertContain(e.code);
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log(`${caseName} cancel catch: ${e}`);
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0397
     * @tc.desc   Execute canceled timeout task again
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass052';
      console.log(`${caseName} start.`);
      let task = new taskpool.Task(timeoutDemo, 2000);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch first execute: ${e}`);
      });
      await promiseCase();
      taskpool.cancel(task);
      await promiseCase();
      try {
        await taskpool.execute(task, { timeout: 5000 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200057);
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0398
     * @tc.desc   Outer timeout inner cancel
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass053';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedOuterCancelTask);
      taskpool.execute(task, { timeout: 400 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
        }
      }, 200);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0399
     * @tc.desc   Outer cancel inner timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass054';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedOuterCancelTask);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0400
     * @tc.desc   Outer cancel inner complete
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass055';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let innerTask = new taskpool.Task(timeoutDemo, 100);
      let task = new taskpool.Task(nestedOuterCompleteTask);
      taskpool.execute(task, { timeout: 5000 }).then((res) => {
        console.log(`${caseName} then`);
        isTerminate = true;
      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0401
     * @tc.desc   Inner cancel outer timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass056';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let innerTask = new taskpool.Task(timeoutDemo, 100);
      let task = new taskpool.Task(nestedInnerTimeoutTask);
      taskpool.execute(task, { timeout: 200 }).then((res) => {
        console.log(`${caseName} then`);
        isTerminate = true;
      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(innerTask);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0402
     * @tc.desc   Inner cancel outer complete
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass057';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedInnerTimeoutTask);
      taskpool.execute(task, { timeout: 5000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(0);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0403
     * @tc.desc   Multi-layer nested sequential cancel
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass058';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0
      let l1Task = new taskpool.Task(level1Task);
      let l2Task = new taskpool.Task(level2Task);
      let l3Task = new taskpool.Task(level3Task);
      taskpool.execute(l1Task).then(() => {
        count++
      }).catch(() => {
        count++
      });
      taskpool.execute(l2Task).then(() => {
        count++
      }).catch(() => {
        count++
      });
      taskpool.execute(l3Task).then(() => {
        count++
      }).catch(() => {
        count++
      });
      setTimeout(() => {
        try {
          taskpool.cancel(l1Task);
          taskpool.cancel(l2Task);
          taskpool.cancel(l3Task);
          isTerminate = true;
        } catch (e) {
          isTerminate = true;
        }
      }, 100);
      while (!isTerminate || count < 3) {
        await promiseCase();
      }
      expect(count).assertEqual(3);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0405
     * @tc.desc   Cancel nested task in task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass059';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let innerTask = new taskpool.Task(timeoutDemo, 200);
      let group = new taskpool.TaskGroup();
      group.addTask(innerTask);
      group.addTask(timeoutDemo, 100);
      taskpool.execute(group, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(innerTask);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0406
     * @tc.desc   Cancel nested timeout task in queue task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass060';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let runnerTaskObj = new taskpool.Task(asyncRunnerTaskNestedTimeout);
      runner.execute(runnerTaskObj).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(runnerTaskObj);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0408
     * @tc.desc   Task exception before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass061';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 100);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.message).assertContain("task error");
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0409
     * @tc.desc   Timeout before task exception
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass062';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 2000);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0410
     * @tc.desc   Exception and timeout happen simultaneously
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass063';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 100);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0411
     * @tc.desc   Nested task inner exception outer timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass064';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let innerTask = new taskpool.Task(taskError, 100);
      let task = new taskpool.Task(nestedInnerExceptionTask);
      taskpool.execute(task, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.toString()).assertContain("task error");
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0412
     * @tc.desc   Nested task outer exception inner timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass065';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedInnerTimeout1Task);
      taskpool.execute(task, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0413
     * @tc.desc   Task group partial exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass066';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskError, 100);
      group.addTask(timeoutDemo, 200);
      taskpool.execute(group, { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.message).assertContain("task error");
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0414
     * @tc.desc   Task group all exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass067';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskError, 100);
      group.addTask(taskError, 100);
      taskpool.execute(group, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.message).assertContain("task error");
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0415
     * @tc.desc   Async task reject before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass068';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(rejectTaskShort);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.message).assertContain("reject");
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0416
     * @tc.desc   Async task reject before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass069';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(rejectTaskLong);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass070
     @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0417
     * @tc.desc   Timeout before async task reject
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass070';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(rejectTaskLong);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0418
     * @tc.desc   Cancel before exception before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass071';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 200);
      taskpool.execute(task, { timeout: 300 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        taskpool.cancel(task);
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0419
     * @tc.desc   Exception before cancel before timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass072';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 100);
      taskpool.execute(task, { timeout: 1000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0420
     * @tc.desc   Timeout before cancel before exception
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass073';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskError, 200);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          expect(e.code).assertEqual(10200015);
        }
      }, 200);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0421
     * @tc.desc   Nested scenario cancel + exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass074';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedInnerCancelExceptionTimeout);
      taskpool.execute(task, { timeout: 5000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0422
     * @tc.desc   Task group cancel + exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass075';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      let task1 = new taskpool.Task(taskError, 100);
      let task2 = new taskpool.Task(timeoutDemo, 300);
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group, { timeout: 300 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task2);
          taskpool.cancel(group);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0423
     * @tc.desc   Queue task cancel + exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass076';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let innerTask = new taskpool.Task(timeoutDemo, 300);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let runnerTaskObj = new taskpool.Task(asyncRunnerTaskNestedTimeout);
      runner.execute(runnerTaskObj).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(innerTask);
          taskpool.cancel(runnerTaskObj);
        } catch (e) {
        }
      }, 100);
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0424
     * @tc.desc   Nested scenario cancel + exception + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass077';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { timeout: 10 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task: ${e}`);
        count++;
        if (count >= 3) {
          isTerminate = true;
        }
      })
      let task1 = new taskpool.Task(taskError, 100);
      taskpool.execute(task1, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task1: ${e}`);
        count++;
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(new taskpool.Task(rejectTaskShort), { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch rejectTaskShort: ${e}`);
        count++;
        if (count >= 3) {
          isTerminate = true;
        }
      })
      while (!isTerminate) {
        await promiseCase();
      }
      expect(count).assertEqual(3);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0425
     * @tc.desc   Task nested AsyncRunner - inner timeout shorter than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass078';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskAsyncRunnerInnerShortOuterLong);
      taskpool.execute(task, { timeout: 2000 }).then((res) => {
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0426
     * @tc.desc   Task nested SequenceRunner - inner timeout shorter than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass079';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskSequenceRunnerInnerShortOuterLong);
      taskpool.execute(task, { timeout: 2000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0427
     * @tc.desc   Task nested AsyncRunner - inner timeout longer than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass080';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskAsyncRunnerInnerLongOuterShort);
      taskpool.execute(task, { timeout: 50 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0428
     * @tc.desc   Task nested SequenceRunner - inner timeout longer than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass081';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(taskSequenceRunnerInnerLongOuterShort);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0429
     * @tc.desc   TaskGroup nested AsyncRunner - inner timeout shorter than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass082';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskGroupAsyncRunnerInnerShortOuterLong);
      group.addTask(taskGroupAsyncRunnerInnerShortOuterLong);
      taskpool.execute(group, { timeout: 2000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res.length).assertEqual(2);
        expect(res[0]).assertEqual(100);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0430
     * @tc.desc   TaskGroup nested SequenceRunner - inner timeout shorter than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass083';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskGroupSequenceRunnerInnerShortOuterLong);
      group.addTask(taskGroupSequenceRunnerInnerShortOuterLong);
      taskpool.execute(group, { timeout: 2000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res.length).assertEqual(2);
        expect(res[0]).assertEqual(100);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0431
     * @tc.desc   TaskGroup nested AsyncRunner - inner timeout longer than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass084';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
      group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
      group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
      group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
      group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
      taskpool.execute(group, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0432
     * @tc.desc   TaskGroup nested SequenceRunner - inner timeout longer than outer
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass085';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let group = new taskpool.TaskGroup();
      group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
      group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
      group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
      group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
      group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
      taskpool.execute(group, { timeout: 200 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })
  })
}
