/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';


export function asyncSleep(time: int): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined)
    }, time)
  })
}

async function promiseCase(): Promise<void> {
  await asyncSleep(100)
}

export function sleepFunc(delay: int): void {
  let start = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}


export function sleepFuncErr(delay: int): void {
  let start = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  throw new Error('err')
}


export function sleepFuncSend(delay: int): int {
  taskpool.Task.sendData(delay)
  let start = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return delay
}

export default function taskListeningTest() {
  describe('taskListeningTest', () => {
    /**
     * @tc.name   TaskAllListeningTest001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0100
     * @tc.desc   Task execute HIGH priority + onEnqueued nested task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest001';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onReceiveCount: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let outerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        outerTask.onEnqueued(() => {
          console.log(`${caseName} outer onEnqueued start`);
          onEnqueue.fetchAdd(1);
          let innerTask1: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask1.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask1.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask1.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          innerTask1.onReceiveData((data: int) => {
            onReceiveData = data;
            onReceiveCount++;
          })
          taskpool.execute(innerTask1).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        outerTask.onStartExecution(() => {
          onStartExecution.fetchAdd(1);
        })

        outerTask.onReceiveData((data: int) => {
          onReceiveCount++;
        })
        outerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        outerTask.onExecutionFailed(() => {
          onExecutionFailed.fetchAdd(1);
        })

        taskpool.execute(outerTask, taskpool.Priority.HIGH).then((res) => {
          console.log(`${caseName} outer task executed`);
          count++;
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        expect(onExecutionFailed.load()).assertEqual(0);
        expect(onReceiveData).assertEqual(100);
        expect(onReceiveCount).assertEqual(2);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0200
     * @tc.desc   TaskGroup execute with nested tasks in all listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest002';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup('testGroup');
        // Add main task to group
        let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);
        mainTask.onEnqueued(() => {
          console.log(`${caseName} main task onEnqueued start`);
          onEnqueue.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        mainTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        // Add additional tasks to group
        let task1: taskpool.Task = new taskpool.Task(sleepFunc, 50);
        task1.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        task1.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        let task2: taskpool.Task = new taskpool.Task(sleepFunc, 75);
        task2.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        task2.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        taskGroup.addTask(mainTask);
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);

        taskpool.execute(taskGroup, taskpool.Priority.MEDIUM).then((res: Array<Any>) => {
          console.log(`${caseName} taskGroup executed, result length: ${res.length}`);
          count += res.length;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 4) {
          await promiseCase();
        }
        expect(count).assertEqual(4);
        expect(onEnqueue.load()).assertEqual(4); // mainTask + 2 inner tasks + 2 additional tasks
        expect(onExecutionSucceeded.load()).assertEqual(4);
        expect(onStartExecution.load()).assertEqual(1);
        expect(onReceiveData).assertEqual(100);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0300
     * @tc.desc   SequenceRunner with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest003';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
        let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

        mainTask.onEnqueued(() => {
          console.log(`${caseName} main task onEnqueued start`);
          onEnqueue.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        mainTask.onStartExecution(() => {
          onStartExecution.fetchAdd(1);
        })

        mainTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        sequenceRunner.execute(mainTask).then((res) => {
          console.log(`${caseName} sequence task executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        expect(onReceiveData).assertEqual(100);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0500
     * @tc.desc   LongTask with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest005';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let longTask: taskpool.LongTask = new taskpool.LongTask(sleepFunc, 100);

        longTask.onEnqueued(() => {
          console.log(`${caseName} longTask onEnqueued start`);
          onEnqueue.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        longTask.onStartExecution(() => {
          onStartExecution.fetchAdd(1);
        })

        longTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        longTask.onReceiveData((data: int) => {
          onReceiveData = data;
        })

        taskpool.execute(longTask, taskpool.Priority.IDLE).then((res) => {
          console.log(`${caseName} longTask executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        expect(onReceiveData).assertEqual(100);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0600
     * @tc.desc   GenericsTask with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest006';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);
        let result: int = 0;

        let genericsTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);

        genericsTask.onStartExecution(() => {
          console.log(`${caseName} genericsTask onStartExecution start`);
          onStartExecution.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        genericsTask.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        genericsTask.onReceiveData((data: int) => {
          onReceiveData = data;
        })

        genericsTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        taskpool.execute(genericsTask, taskpool.Priority.HIGH).then((res) => {
          console.log(`${caseName} genericsTask executed, result: ${res}`);
          result = res as int;
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        expect(onReceiveData).assertEqual(100);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0700
     * @tc.desc   executeDelayed with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest007';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let delayedTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

        delayedTask.onEnqueued(() => {
          console.log(`${caseName} delayedTask onEnqueued start`);
          onEnqueue.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        delayedTask.onStartExecution(() => {
          onStartExecution.fetchAdd(1);
        })
        delayedTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        taskpool.executeDelayed(200, delayedTask, taskpool.Priority.MEDIUM).then((res) => {
          console.log(`${caseName} delayed task executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        expect(onReceiveData).assertEqual(100);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0900
     * @tc.desc   Task execution failed scenario with nested tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest009';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let errorTask: taskpool.Task = new taskpool.Task(sleepFuncErr, 100);

        errorTask.onExecutionFailed(() => {
          console.log(`${caseName} errorTask onEnqueued start`);
          onExecutionFailed.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution.fetchAdd(1);
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        errorTask.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        errorTask.onStartExecution(() => {
          onStartExecution.fetchAdd(1);
        })

        errorTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        taskpool.execute(errorTask, taskpool.Priority.HIGH).then((res) => {
          console.log(`${caseName} errorTask executed unexpectedly`);
        }).catch((err: Error) => {
          console.log(`${caseName} errorTask caught error: ${err}`);
          count++;
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(2);
        expect(onStartExecution.load()).assertEqual(2);
        expect(onExecutionSucceeded.load()).assertEqual(1);
        expect(onExecutionFailed.load()).assertEqual(1);
        expect(onReceiveData).assertEqual(50);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_1000
     * @tc.desc   TaskGroup priority test with nested tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest010';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let runner = new taskpool.AsyncRunner(caseName, 50);
        let task1: taskpool.Task = new taskpool.Task(sleepFunc, 50);
        task1.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        task1.onExecutionSucceeded(() => {
          console.log(`${caseName} task1 onExecutionSucceeded`);
          onExecutionSucceeded.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })
        runner.execute(task1).then((res) => {
          console.log(`${caseName} task executed`);
          count++;
        });
        let task2: taskpool.Task = new taskpool.Task(sleepFuncErr, 75);
        task2.onEnqueued(() => {
          onEnqueue.fetchAdd(1);
        })
        task2.onExecutionFailed(() => {
          console.log(`${caseName} task2 onExecutionFailed`);
          onExecutionFailed.fetchAdd(1);
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          innerTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          innerTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        })

        runner.execute(task2).then((res) => {
          console.log(`${caseName} executed with HIGH priority`);
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
          count++;
        });

        while (count < 4) {
          await promiseCase();
        }
        expect(count).assertEqual(4);
        expect(onEnqueue.load()).assertEqual(4); // 3 main tasks + 1 inner task
        expect(onExecutionSucceeded.load()).assertEqual(3);
        expect(onExecutionFailed.load()).assertEqual(1);
        expect(onReceiveData).assertEqual(50);
        console.log(`${caseName} end.`);
        done();
      })

    /**
     * @tc.name   TaskAllListeningTest011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_1100
     * @tc.desc   Nested tasks with different priorities
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest011';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

        mainTask.onExecutionSucceeded(() => {
          console.log(`${caseName} mainTask onExecutionSucceeded`);
          onExecutionSucceeded.fetchAdd(1);

          // Create inner tasks with different priorities
          let highTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          highTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          highTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          highTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })
          // Execute inner tasks with different priorities
          taskpool.executeDelayed(100, highTask, taskpool.Priority.HIGH).then((res) => {
            console.log(`${caseName} high priority task executed`);
            count++;
          });
        })

        taskpool.execute(mainTask, taskpool.Priority.MEDIUM).then((res) => {
          console.log(`${caseName} main task executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 2) {
          await promiseCase();
        }
        expect(count).assertEqual(2);
        expect(onEnqueue.load()).assertEqual(1);
        expect(onExecutionSucceeded.load()).assertEqual(2);
        console.log(`${caseName} end.`);
        done();
      })
    /**
     * @tc.name   TaskAllListeningTest012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_1200
     * @tc.desc   Nested tasks with different priorities
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'TaskAllListeningTest012';
        console.log(`${caseName} start.`);
        let count: int = 0;
        let onEnqueue = new AtomicInt(0);
        let onReceiveData: int = 0;
        let onStartExecution = new AtomicInt(0);
        let onExecutionSucceeded = new AtomicInt(0);
        let onExecutionFailed = new AtomicInt(0);

        let mainTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);

        mainTask.onReceiveData(() => {
          console.log(`${caseName} mainTask onEnqueued`);
          onEnqueue.fetchAdd(1);

          // Create inner tasks with different priorities
          let highTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          highTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          highTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          highTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })

          let mediumTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          mediumTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          mediumTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          mediumTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })

          let lowTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          lowTask.onEnqueued(() => {
            onEnqueue.fetchAdd(1);
          })
          lowTask.onReceiveData((data: int) => {
            onReceiveData = data;
          })
          lowTask.onExecutionSucceeded(() => {
            onExecutionSucceeded.fetchAdd(1);
          })

          // Execute inner tasks with different priorities
          taskpool.execute(highTask, taskpool.Priority.HIGH).then((res) => {
            console.log(`${caseName} high priority task executed`);
            count++;
          });

          taskpool.execute(mediumTask, taskpool.Priority.MEDIUM).then((res) => {
            console.log(`${caseName} medium priority task executed`);
            count++;
          });

          taskpool.execute(lowTask, taskpool.Priority.LOW).then((res) => {
            console.log(`${caseName} low priority task executed`);
            count++;
          });

        })

        mainTask.onExecutionSucceeded(() => {
          onExecutionSucceeded.fetchAdd(1);
        })

        taskpool.execute(mainTask, taskpool.Priority.MEDIUM).then((res) => {
          console.log(`${caseName} main task executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} error: ${err}`);
        });

        while (count < 4) {
          await promiseCase();
        }
        expect(count).assertEqual(4);
        expect(onEnqueue.load()).assertEqual(4);
        expect(onExecutionSucceeded.load()).assertEqual(4);
        console.log(`${caseName} end.`);
        done();
      })

  })
}
