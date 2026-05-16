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

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
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

import { SendableClassTest, sendableFunc } from '../utils/sendable';
import { level2Task } from '../utils/TimeoutFunc2';
import { nestPeriodicTaskInner } from '../utils/TimeoutFunc3';
import hilog from '@ohos.hilog';


export function sleep(time: int): Promise<number> {
  return new Promise<number>((re, je): void => {
    setTimeout(() => {
      re(1)
    }, time)
  })
}


export default function TaskTimeout2Test() {
  describe('ActTaskTimeout2Test', () => {
    afterEach(async () => {
      await sleep(100)
    })

    /**
     * @tc.name   TaskTimeout2TestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0339
     * @tc.desc   taskpool.execute HIGH priority short timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass001';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100.0);
        taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 50 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0340
     * @tc.desc   taskpool.execute LOW priority long timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass002';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100.0);
        taskpool.execute(task, { priority: taskpool.Priority.MEDIUM, timeout: 2000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          // expect(res).assertEqual(100);
        }).catch((e: Error) => {
          console.info(caseName + " catch:" + e.message);
          console.info(`${caseName} catch: ${e.message}`);
          hilog.info(0x0000, 'testTag', `${caseName} catch: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0341
     * @tc.desc   taskpool.execute IDLE priority timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass003';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task: taskpool.Task = new taskpool.Task(timeoutDemo, 600.0);
        taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0342
     * @tc.desc   taskpool.execute multiple tasks different priorities same timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass004';
        console.info(`${caseName} start.`);
        let count: int = 0;
        let isTerminate = false;
        let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);

        taskpool.execute(task1, { priority: taskpool.Priority.HIGH, timeout: 100 }).then((res) => {
          console.info(`${caseName} task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        taskpool.execute(task2, { priority: taskpool.Priority.MEDIUM, timeout: 100 }).then((res) => {
          console.info(`${caseName} task2 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task2: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        taskpool.execute(task3, { priority: taskpool.Priority.LOW, timeout: 100 }).then((res) => {
          console.info(`${caseName} task3 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task3: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        });

        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0343
     * @tc.desc   taskpool.execute task timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass005';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0344
     * @tc.desc   taskpool.execute taskGroup timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass006';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(timeoutDemo, 200.0);
        taskGroup.addTask(timeoutDemo, 200.0);
        taskpool.execute(taskGroup, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })


    /**
     * @tc.name   TaskTimeout2TestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0345
     * @tc.desc   taskpool.execute timeout task Sendable object test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass007';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
        let task = new taskpool.Task(sendableClassWithTime, classTest, 500.0);
        taskpool.execute(task, { timeout: 1000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(600);

        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0346
     * @tc.desc   taskpool.execute nested timeout task inside normal task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass008';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedOuterTask, 100.0);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          isTerminate = true;
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0347
     * @tc.desc   taskpool.execute nested timeout task inside timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass009';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedTimeoutTask, 100.0);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0348
     * @tc.desc   taskpool.execute nested timeout task with different timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass010';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedDifferentTimeout, 100.0);
        taskpool.execute(task, { timeout: 3000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);

        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0349
     * @tc.desc   taskpool.execute nested timeout taskGroup inside timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass011';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedTaskGroupTask, 100.0);
        taskpool.execute(task, { timeout: 3000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0350
     * @tc.desc   taskpool.execute multi-layer nested timeout tasks test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass012';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        taskpool.execute(new taskpool.Task(level1Task), { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0351
     * @tc.desc   taskpool.execute timeout task await multiple timeout tasks test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass013';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(outerAwaitMultipleTimeout);
        taskpool.execute(task, { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0352
     * @tc.desc   taskpool.AsyncRunner execute nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass014';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        let task = new taskpool.Task(asyncRunnerNestedTask);
        runner.execute(task).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0353
     * @tc.desc   taskpool.SequenceRunner execute nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass015';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let task = new taskpool.Task(sequenceRunnerNestedTask);
        runner.execute(task).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0354
     * @tc.desc   taskpool.AsyncRunner execute nested timeout taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass016';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        let task = new taskpool.Task(asyncRunnerNestedGroup);
        runner.execute(task).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0355
     * @tc.desc   taskpool.SequenceRunner execute nested timeout taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass017';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let task = new taskpool.Task(sequenceRunnerNestedGroup);
        runner.execute(task).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0356
     * @tc.desc   taskpool.AsyncRunner onReceiveData nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass018';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let count: int = 0;
        let task1 = new taskpool.Task(demoSenddata, 300.0);
        task1.onReceiveData((data: int) => {
          count++;
          if (count === 2) {
            let innerTask = new taskpool.Task(timeoutDemo, 200.0);
            taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
              console.info(`${caseName} then`);
              isTerminate = true;
            }).catch((e: Error) => {
              console.info(`${caseName} catch innerTask: ${e.message}`);
              isTerminate = true;
            })
          }
        })
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        runner.execute(task1);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0357
     * @tc.desc   taskpool.execute timeout task nested in onExecutionSucceeded test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass019';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task1 = new taskpool.Task(timeoutDemo, 100.0);
        task1.onExecutionSucceeded(() => {
          let innerTask = new taskpool.Task(timeoutDemo, 300.0);
          taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
            console.info(`${caseName} then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        })

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
          console.info(`${caseName} execute task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0358
     * @tc.desc   taskpool.execute timeout task nested in onExecutionFailed test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass020';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task1 = new taskpool.Task(taskError, 100.0);
        task1.onExecutionFailed(() => {
          let innerTask = new taskpool.Task(timeoutDemo, 300.0);
          taskpool.execute(innerTask, { timeout: 200 }).then(() => {
            console.info(`${caseName} execute innerTask then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        })
        taskpool.execute(task1).then(() => {
          console.info(`${caseName} execute task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0359
     * @tc.desc   taskpool.execute timeout task nested in onReceiveData test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass021';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let count: int = 0;
        let task1 = new taskpool.Task(demoSenddata, 300.0);
        task1.onReceiveData((data: int) => {
          count++;
          if (count === 2) {
            let innerTask = new taskpool.Task(timeoutDemo, 100.0);
            taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
              console.info(`${caseName} then`);
              isTerminate = true;
            }).catch((e: Error) => {
              console.info(`${caseName} catch innerTask: ${e.message}`);
            })
          }
        })
        taskpool.execute(task1).then(() => {
          console.info(`${caseName} execute task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })


    /**
     * @tc.name   TaskTimeout2TestClass022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0360
     * @tc.desc   taskpool.execute timeout task nested in onStartExecution test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass022';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task1 = new taskpool.Task(timeoutDemo, 100.0);
        task1.onStartExecution(() => {
          let innerTask = new taskpool.Task(timeoutDemo, 300.0);
          taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
            console.info(`${caseName} then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        })
        taskpool.execute(task1).then(() => {
          console.info(`${caseName} execute task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0361
     * @tc.desc   taskpool.execute timeout task nested in Promise.then test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass023';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task1 = new taskpool.Task(timeoutDemo, 100.0);
        taskpool.execute(task1).then(() => {
          let innerTask = new taskpool.Task(timeoutDemo, 300.0);
          taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
            console.info(`${caseName} then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0362
     * @tc.desc   taskpool.execute timeout task nested in Promise.catch test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass024';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task1 = new taskpool.Task(taskError, 100.0);
        taskpool.execute(task1).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          let innerTask = new taskpool.Task(timeoutDemo, 300.0);
          taskpool.execute(innerTask, { timeout: 200 }).then((res) => {
            console.info(`${caseName} then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0363
     * @tc.desc   taskpool.execute Worker onReceiveData nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass025';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let count: int = 0;
        let task1 = new taskpool.Task(demoSenddata, 300.0);
        task1.onReceiveData((data: int) => {
          count++;
          if (count === 2) {
            let innerTask = new taskpool.Task(timeoutDemo, 200.0);
            taskpool.execute(innerTask, { timeout: 100 }).then((res) => {
              console.info(`${caseName} then`);
            }).catch((e: Error) => {
              console.info(`${caseName} catch innerTask: ${e.message}`);
              isTerminate = true;
            })
          }
        })
        taskpool.execute(task1).then(() => {
          console.info(`${caseName} execute task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0364
     * @tc.desc   taskpool.executeDelayed delayed task nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass026';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(delayedNestedTask);
        await taskpool.executeDelayed(100, task).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
        });
        let task2 = new taskpool.Task(delayedNestedTask);
        taskpool.execute(task2, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then2`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0365
     * @tc.desc   taskpool.executePeriodically periodic task nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass027';
        let task = new taskpool.Task(periodicTaskInner);
        taskpool.executePeriodically(500, task)
        try {
          taskpool.execute(task).then((res) => {
            console.info(`${caseName} then`);
          }).catch((e: Error) => {
            console.info(`${caseName} catch: ${e.message}`);
          })
        } catch (e) {

        }
        taskpool.cancel(task);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0366
     * @tc.desc   taskpool.execute longTask nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass028';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let longTask: taskpool.LongTask = new taskpool.LongTask(longTaskNestedTimeout);
        taskpool.execute(longTask, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        taskpool.terminateTask(longTask);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0367
     * @tc.desc   taskpool.execute longTask nested timeout taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass029';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let longTask: taskpool.LongTask = new taskpool.LongTask(longTaskNestedGroup);
        taskpool.execute(longTask, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        taskpool.terminateTask(longTask);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0368
     * @tc.desc   taskpool.execute timeout task with longTask inside test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass030';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutWithLongTask);
        taskpool.execute(task, { timeout: 50 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0369
     * @tc.desc   taskpool.execute longTask timeout equals 0 test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass031';
        console.info(`${caseName} start.`);
        let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100.0);
        taskpool.execute(longTask, { timeout: 0 }).then((res) => {
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        taskpool.terminateTask(longTask);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0370
     * @tc.desc   taskpool.execute longTask only priority set test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass032';
        console.info(`${caseName} start.`);
        let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100.0);
        taskpool.execute(longTask, { priority: taskpool.Priority.HIGH }).then((res) => {
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        taskpool.terminateTask(longTask);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0371
     * @tc.desc   taskpool.execute longTask empty configs test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass033';
        console.info(`${caseName} start.`);
        let longTask: taskpool.LongTask = new taskpool.LongTask(timeoutDemo, 100.0);
        taskpool.execute(longTask, {}).then((res) => {
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);
        });
        taskpool.terminateTask(longTask);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0372
     * @tc.desc   taskpool.execute longTask callback nested timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass034';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let longTask = new taskpool.LongTask(timeoutDemo, 100.0);
        longTask.onExecutionSucceeded(() => {
          let innerTask = new taskpool.Task(timeoutDemo, 400.0);
          taskpool.execute(innerTask, { timeout: 400 }).then((res) => {
            console.info(`${caseName} then`);
            isTerminate = true;
          }).catch((e: Error) => {
            console.info(`${caseName} catch innerTask: ${e.message}`);
            isTerminate = true;
          })
        })
        taskpool.execute(longTask, { timeout: 200 }).then(() => {
          console.info(`${caseName} execute longTask then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch longTask: ${e.message}`);
        });
        while (!isTerminate) {
          await sleep(100);
        }
        taskpool.terminateTask(longTask);
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0373
     * @tc.desc   taskpool.cancel task before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass035';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutDemo, 1000.0);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          console.info(`${caseName} then`);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
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
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0374
     * @tc.desc   taskpool.cancel task after timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass036';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutDemo, 2000.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
            console.info(`${caseName} cancel end: `);
            isTerminate = true;
          } catch (e) {
            console.info(`${caseName} cancel catch: ${e.message}`);
            isTerminate = true;
          }
        }, 1000);
        while (!isTerminate) {
          await sleep(100);
        }
        done()
        console.info(`${caseName} end.`);
      })

    /**
     * @tc.name   TaskTimeout2TestClass037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0375
     * @tc.desc   taskpool.cancel executing timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass037';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutDemo, 200.0);
        taskpool.execute(task, { timeout: 400 }).then((res) => {
          console.info(`${caseName} then`);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
            console.info(`${caseName} cancel catch: ${e.message}`);
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0376
     * @tc.desc   taskpool.cancel waiting timeout task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass038';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutDemo, 200.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
        });
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.info(`${caseName} cancel catch: ${e.message}`);
        }
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0377
     * @tc.desc   taskpool.cancel timeout taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass039';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(timeoutDemo, 200.0);
        group.addTask(timeoutDemo, 200.0);
        taskpool.execute(group, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(group);
          } catch (e) {
            console.info(`${caseName} cancel catch: ${e.message}`);
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0378
     * @tc.desc   taskpool.cancel partial timeout taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass040';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        let task1 = new taskpool.Task(timeoutDemo, 100.0);
        let task2 = new taskpool.Task(timeoutDemo, 200.0);
        let task3 = new taskpool.Task(timeoutDemo, 100.0);
        group.addTask(task1);
        group.addTask(task2);
        group.addTask(task3);
        taskpool.execute(group, { timeout: 500 }).then(() => {
          isTerminate = true;
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task2);
          } catch (e) {
            console.info(`${caseName} cancel catch: ${e.message}`);
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0379
     * @tc.desc   taskpool.cancel timeout happen simultaneously test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass041';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(timeoutDemo, 2000.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
            console.info(`${caseName} cancel catch: ${e.message}`);
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0380
     * @tc.desc   taskpool.execute canceled timeout task again test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass042';
        console.info(`${caseName} start.`);
        let task = new taskpool.Task(timeoutDemo, 1000.0);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch first execute: ${e.message}`);
        });
        try {
          await sleep(100);
          taskpool.cancel(task);
          await sleep(100);
          await taskpool.execute(task, { timeout: 5000 })
          expect().assertFail();
        } catch (e) {
          expect(e.code).assertEqual(10200057);
        }
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0381
     * @tc.desc   taskpool.cancel outer timeout inner cancel test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass043';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedOuterCancelTask);
        taskpool.execute(task, { timeout: 400 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }, 200);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0382
     * @tc.desc   taskpool.cancel outer cancel inner timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass044';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(timeoutDemo, 2000.0);
        let task = new taskpool.Task(nestedOuterCancelTask);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0383
     * @tc.desc   taskpool.cancel outer cancel inner complete test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass045';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(timeoutDemo, 100.0);
        let task = new taskpool.Task(nestedOuterCompleteTask);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0384
     * @tc.desc   taskpool.cancel inner cancel outer timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass046';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(timeoutDemo, 100.0);
        let task = new taskpool.Task(nestedInnerTimeoutTask);
        taskpool.execute(task, { timeout: 200 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(innerTask);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0385
     * @tc.desc   taskpool.cancel inner cancel outer complete test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass047';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedInnerTimeoutTask);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(200);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0386
     * @tc.desc   taskpool.cancel multi-layer nested sequential test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass048';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let count: int = 0
        let l1Task = new taskpool.Task(level1Task);
        let l2Task = new taskpool.Task(level2Task);
        let l3Task = new taskpool.Task(level3Task);
        taskpool.execute(l1Task).then((res) => {
          console.info(`${caseName} then1`);
        }).catch(() => {
          count++
        });
        taskpool.execute(l2Task).then((res) => {
          console.info(`${caseName} then2`);
        }).catch(() => {
          count++
        });
        taskpool.execute(l3Task).then((res) => {
          console.info(`${caseName} then3`);
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
          await sleep(100);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0387
     * @tc.desc   taskpool.cancel nested task in taskGroup test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass049';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(timeoutDemo, 200.0);
        let group = new taskpool.TaskGroup();
        group.addTask(innerTask);
        group.addTask(timeoutDemo, 100.0);
        taskpool.execute(group, { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
        });
        setTimeout(() => {
          try {
            taskpool.cancel(innerTask);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0388
     * @tc.desc   taskpool.cancel nested timeout task in queue task test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass050';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        let runnerTaskObj = new taskpool.Task(asyncRunnerTaskNestedTimeout);
        runner.execute(runnerTaskObj).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(runnerTaskObj);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0389
     * @tc.desc   taskpool.execute task exception before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass051';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 100.0);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0390
     * @tc.desc   taskpool.execute timeout before task exception test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass052';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 2000.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0391
     * @tc.desc   taskpool.execute exception timeout simultaneously test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass053';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 100.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0392
     * @tc.desc   taskpool.execute nested task inner exception outer timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass054';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(taskError, 100.0);
        let task = new taskpool.Task(nestedInnerExceptionTask);
        taskpool.execute(task, { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0393
     * @tc.desc   taskpool.execute nested task outer exception inner timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass055';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedInnerTimeout1Task);
        taskpool.execute(task, { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0394
     * @tc.desc   taskpool.execute taskGroup partial exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass056';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskError, 100.0);
        group.addTask(timeoutDemo, 200.0);
        taskpool.execute(group, { timeout: 500 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0395
     * @tc.desc   taskpool.execute taskGroup all exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass057';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskError, 100.0);
        group.addTask(taskError, 100.0);
        taskpool.execute(group, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0396
     * @tc.desc   taskpool.execute async task reject before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass058';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(rejectTaskShort);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0397
     * @tc.desc   taskpool.execute async task reject before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass059';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(rejectTaskLong);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0398
     * @tc.desc   taskpool.execute timeout before async task reject test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass060';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(rejectTaskLong);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0399
     * @tc.desc   taskpool.cancel before exception before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass061';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 200.0);
        taskpool.execute(task, { timeout: 300 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          taskpool.cancel(task);
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0400
     * @tc.desc   taskpool.cancel exception before cancel before timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass062';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 100.0);
        taskpool.execute(task, { timeout: 1000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0401
     * @tc.desc   taskpool.cancel timeout before cancel before exception test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass063';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskError, 200.0);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {

          }
        }, 200);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0402
     * @tc.desc   taskpool.cancel nested scenario exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass064';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(nestedInnerCancelExceptionTimeout);
        taskpool.execute(task, { timeout: 5000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
          }
        }, 100);
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0403
     * @tc.desc   taskpool.cancel taskGroup exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass065';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        let task1 = new taskpool.Task(taskError, 100.0);
        let task2 = new taskpool.Task(timeoutDemo, 300.0);
        group.addTask(task1);
        group.addTask(task2);
        taskpool.execute(group, { timeout: 300 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
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
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0404
     * @tc.desc   taskpool.cancel queue task exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass066';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let innerTask = new taskpool.Task(timeoutDemo, 300.0);
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        let runnerTaskObj = new taskpool.Task(asyncRunnerTaskNestedTimeout);
        runner.execute(runnerTaskObj).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
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
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0405
     * @tc.desc   taskpool.execute nested scenario exception timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass067';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let count: int = 0;
        let task = new taskpool.Task(timeoutDemo, 100.0);
        taskpool.execute(task, { timeout: 10 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        let task1 = new taskpool.Task(taskError, 100.0);
        taskpool.execute(task1, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then1`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch task1: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        taskpool.execute(new taskpool.Task(rejectTaskShort), { timeout: 100 }).then((res) => {
          console.info(`${caseName} then2`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch rejectTaskShort: ${e.message}`);
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        while (!isTerminate) {
          await sleep(100);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0406
     * @tc.desc   taskpool.AsyncRunner inner timeout shorter than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass068';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskAsyncRunnerInnerShortOuterLong);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);
          isTerminate = true;
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0407
     * @tc.desc   taskpool.SequenceRunner inner timeout shorter than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass069';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskSequenceRunnerInnerShortOuterLong);
        taskpool.execute(task, { timeout: 2000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(100);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0408
     * @tc.desc   taskpool.AsyncRunner inner timeout longer than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass070';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskAsyncRunnerInnerLongOuterShort);
        taskpool.execute(task, { timeout: 50 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0409
     * @tc.desc   taskpool.SequenceRunner inner timeout longer than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass071';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(taskSequenceRunnerInnerLongOuterShort);
        taskpool.execute(task, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0410
     * @tc.desc   taskGroup nested AsyncRunner inner timeout shorter than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass072';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskGroupAsyncRunnerInnerShortOuterLong);
        group.addTask(taskGroupAsyncRunnerInnerShortOuterLong);
        taskpool.execute(group, { timeout: 2000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res.length).assertEqual(2);
          expect(res[0] as number).assertEqual(100);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0411
     * @tc.desc   taskGroup nested SequenceRunner inner timeout shorter than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass073';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskGroupSequenceRunnerInnerShortOuterLong);
        group.addTask(taskGroupSequenceRunnerInnerShortOuterLong);
        taskpool.execute(group, { timeout: 2000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res.length).assertEqual(2);
          expect(res[0] as number).assertEqual(100);
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0412
     * @tc.desc   taskGroup nested AsyncRunner inner timeout longer than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass074';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
        group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
        group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
        group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
        group.addTask(taskGroupAsyncRunnerInnerLongOuterShort);
        taskpool.execute(group, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0413
     * @tc.desc   taskGroup nested SequenceRunner inner timeout longer than outer test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass075';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let group = new taskpool.TaskGroup();
        group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
        group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
        group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
        group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
        group.addTask(taskGroupSequenceRunnerInnerLongOuterShort);
        taskpool.execute(group, { timeout: 200 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })


    /**
     * @tc.name   TaskTimeout2TestClass076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0414
     * @tc.desc   taskpool.execute mixed taskGroup timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass076';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(timeoutDemo, 100.0);
        taskGroup.addTask(timeoutDemo, 500.0);
        taskGroup.addTask(timeoutDemo, 1200.0);
        taskpool.execute(taskGroup, { timeout: 1000 }).then((res) => {
          console.info(`${caseName} then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0415
     * @tc.desc   taskpool.execute multiple timeout tasks concurrent test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass077';
        console.info(`${caseName} start.`);
        let count: int = 0;
        let isTerminate = false;
        let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);

        taskpool.execute(task1, { timeout: 100 }).then((res) => {
          console.info(`${caseName} task1 then`);
        }).catch((e: Error) => {
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        taskpool.execute(task2, { timeout: 100 }).then((res) => {
          console.info(`${caseName} task2 then`);
        }).catch((e: Error) => {
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        })
        taskpool.execute(task3, { timeout: 100 }).then((res) => {
          console.info(`${caseName} task3 then`);
        }).catch((e: Error) => {
          count++;
          if (count >= 3) {
            isTerminate = true;
          }
        });

        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0416
     * @tc.desc   taskpool.execute timeout task normal task concurrent test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass078';
        console.info(`${caseName} start.`);
        let count: int = 0;
        let isTerminate = false;
        let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200.0);
        let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100.0);

        taskpool.execute(task1, { timeout: 100 }).then((res) => {
          console.info(`${caseName} task1 then`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          count++;

          if (count >= 2) {
            isTerminate = true;
          }
        })
        taskpool.execute(task2).then(() => {
          count++;
          console.info(`${caseName} then`);
          if (count >= 2) {
            isTerminate = true;
          }
        }).catch((e: Error) => {
          console.info(`${caseName} error: ${e.code}, ${e.message}`)
        });

        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0417
     * @tc.desc   taskpool.execute multiple taskGroups concurrent timeout test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass079';
        console.info(`${caseName} start.`);
        let count: int = 0;
        let isTerminate = false;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(timeoutDemo, 200.0);
        taskGroup2.addTask(timeoutDemo, 200.0);

        taskpool.execute(taskGroup1, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then1`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch taskGroup1: ${e.message}`);
          count++;

          if (count >= 2) {
            isTerminate = true;
          }
        })
        taskpool.execute(taskGroup2, { timeout: 100 }).then((res) => {
          console.info(`${caseName} then2`);
        }).catch((e: Error) => {
          console.info(`${caseName} catch taskGroup2: ${e.message}`);
          count++;

          if (count >= 2) {
            isTerminate = true;
          }
        });

        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })

    /**
     * @tc.name   TaskTimeout2TestClass080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0418
     * @tc.desc   taskpool.execute timeout task ArrayBuffer parameters test.
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskTimeout2TestClass080';
        console.info(`${caseName} start.`);
        let isTerminate = false;
        let task = new taskpool.Task(setTransferListTestWithTime, new Uint8Array(new ArrayBuffer(8)),
          new Uint8Array(new ArrayBuffer(8)), 500.0);
        taskpool.execute(task, { timeout: 1000 }).then((res) => {
          isTerminate = true;
          console.info(`${caseName} then`);
          expect(res as number).assertEqual(16);
        }).catch((e: Error) => {
          console.info(`${caseName} catch: ${e.message}`);
          isTerminate = true;
        });
        while (!isTerminate) {
          await sleep(100);
        }
        expect(isTerminate).assertEqual(true);
        console.info(`${caseName} end.`);
        done()
      })
  })
}
