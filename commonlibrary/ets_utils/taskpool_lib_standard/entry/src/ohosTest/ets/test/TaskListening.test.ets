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
import { promiseCase } from './testFunclist';
import { asyncSleep } from './exportFunclist';

@Concurrent
export function sleepFunc(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

@Concurrent
export function sleepFuncErr(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  throw new Error('err')
}

@Concurrent
export function sleepFuncSend(delay: number): void {
  taskpool.Task.sendData(delay)
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

export default function TaskListeningTest() {
  describe('TaskListeningTest', () => {
    /**
     * @tc.name   TaskAllListeningTest001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0100
     * @tc.desc   Task execute HIGH priority + onEnqueued nested task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest001';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onReceiveCount = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let outerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
      outerTask.onEnqueued(() => {
        console.log(`${caseName} outer onEnqueued start`);
        onEnqueue++;
        let innerTask1: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask1.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask1.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask1.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        innerTask1.onReceiveData((data: number) => {
          onReceiveData = data;
          onReceiveCount++;
        })
        taskpool.execute(innerTask1).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      outerTask.onStartExecution(() => {
        onStartExecution++;
      })

      outerTask.onReceiveData((data: number) => {
        onReceiveCount++;
      })
      outerTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      outerTask.onExecutionFailed(() => {
        onExecutionFailed++;
      })

      taskpool.execute(outerTask, taskpool.Priority.HIGH).then((res) => {
        console.log(`${caseName} outer task executed`);
        count++;
      });

      while (count < 2) {
        await promiseCase();
      }
      expect(count).assertEqual(2);
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
      expect(onExecutionFailed).assertEqual(0);
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
    it('TaskAllListeningTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest002';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup('testGroup');
      // Add main task to group
      let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);
      mainTask.onEnqueued(() => {
        console.log(`${caseName} main task onEnqueued start`);
        onEnqueue++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      mainTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      // Add additional tasks to group
      let task1: taskpool.Task = new taskpool.Task(sleepFunc, 50);
      task1.onEnqueued(() => {
        onEnqueue++;
      })
      task1.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      let task2: taskpool.Task = new taskpool.Task(sleepFunc, 75);
      task2.onEnqueued(() => {
        onEnqueue++;
      })
      task2.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      taskGroup.addTask(mainTask);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);

      taskpool.execute(taskGroup, taskpool.Priority.MEDIUM).then((res: Array<Object>) => {
        console.log(`${caseName} taskGroup executed, result length: ${res.length}`);
        count += res.length;
      }).catch((err: Error) => {
        console.error(`${caseName} error: ${err}`);
      });

      while (count < 4) {
        await promiseCase();
      }
      expect(count).assertEqual(4);
      expect(onEnqueue).assertEqual(4); // mainTask + 2 inner tasks + 2 additional tasks
      expect(onExecutionSucceeded).assertEqual(4);
      expect(onStartExecution).assertEqual(1);
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
    it('TaskAllListeningTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest003';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

      mainTask.onEnqueued(() => {
        console.log(`${caseName} main task onEnqueued start`);
        onEnqueue++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      mainTask.onStartExecution(() => {
        onStartExecution++;
      })

      mainTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
      expect(onReceiveData).assertEqual(100);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskAllListeningTest004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0400
     * @tc.desc   AsyncRunner with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest004';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner('async', 3, 3);
      let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

      mainTask.onEnqueued(() => {
        console.log(`${caseName} main task onEnqueued start`);
        onEnqueue++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        asyncRunner.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        }).catch((err: Error) => {
          console.error(`${caseName} inner task error: ${err}`);
        });
      })

      mainTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      mainTask.onStartExecution(() => {
        onStartExecution++;
      })
      asyncRunner.execute(mainTask).then((res) => {
        console.log(`${caseName} async task executed`);
        count++;
      }).catch((err: Error) => {
        console.error(`${caseName} error: ${err}`);
      });

      while (count < 2) {
        await promiseCase();
      }
      expect(count).assertEqual(2);
      expect(onEnqueue).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
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
    it('TaskAllListeningTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest005';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let longTask: taskpool.LongTask = new taskpool.LongTask(sleepFunc, 100);

      longTask.onEnqueued(() => {
        console.log(`${caseName} longTask onEnqueued start`);
        onEnqueue++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      longTask.onStartExecution(() => {
        onStartExecution++;
      })

      longTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      longTask.onReceiveData((data: number) => {
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
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
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
    it('TaskAllListeningTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest006';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;
      let result: number = 0;

      let genericsTask: taskpool.GenericsTask<[number], number> = new taskpool.GenericsTask(sleepFuncSend, 100);

      genericsTask.onStartExecution(() => {
        console.log(`${caseName} genericsTask onStartExecution start`);
        onStartExecution++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      genericsTask.onEnqueued(() => {
        onEnqueue++;
      })
      genericsTask.onReceiveData((data: number) => {
        onReceiveData = data;
      })

      genericsTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
      })

      taskpool.execute(genericsTask, taskpool.Priority.HIGH).then((res) => {
        console.log(`${caseName} genericsTask executed, result: ${res}`);
        result = res as number;
        count++;
      }).catch((err: Error) => {
        console.error(`${caseName} error: ${err}`);
      });

      while (count < 2) {
        await promiseCase();
      }
      expect(count).assertEqual(2);
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
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
    it('TaskAllListeningTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest007';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let delayedTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

      delayedTask.onEnqueued(() => {
        console.log(`${caseName} delayedTask onEnqueued start`);
        onEnqueue++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      delayedTask.onStartExecution(() => {
        onStartExecution++;
      })
      delayedTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(2);
      expect(onReceiveData).assertEqual(100);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskAllListeningTest008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_LISTENING_0800
     * @tc.desc   executePeriodically with nested tasks in listeners
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskAllListeningTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest008';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;
      let executionCount = 0;

      let periodicTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);

      periodicTask.onEnqueued(() => {
        console.log(`${caseName} periodicTask onEnqueued start`);
        onEnqueue++;
        if (executionCount < 2) {
          let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
          innerTask.onEnqueued(() => {
            onEnqueue++;
          })
          innerTask.onReceiveData((data: number) => {
            onReceiveData = data;
          })
          innerTask.onStartExecution(() => {
            onStartExecution++;
          })
          innerTask.onExecutionSucceeded(() => {
            onExecutionSucceeded++;
          })
          taskpool.execute(innerTask).then((res) => {
            console.log(`${caseName} inner task executed`);
            count++;
          });
        }
      })

      periodicTask.onStartExecution(() => {
        onStartExecution++;
      })

      periodicTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
        executionCount++;
      })

      periodicTask.onReceiveData((data: number) => {
        onReceiveData = data;
        console.log(`${caseName} received data: ${data}`);
      })

      taskpool.executePeriodically(100, periodicTask, taskpool.Priority.HIGH);

      await asyncSleep(200)
      taskpool.cancel(periodicTask)
      expect(count).assertEqual(1);
      expect(onEnqueue).assertLargerOrEqual(1);
      expect(onStartExecution).assertLargerOrEqual(2);
      expect(onExecutionSucceeded).assertEqual(1);
      expect(onReceiveData).assertEqual(50);
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
    it('TaskAllListeningTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest009';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let errorTask: taskpool.Task = new taskpool.Task(sleepFuncErr, 100);

      errorTask.onExecutionFailed(() => {
        console.log(`${caseName} errorTask onEnqueued start`);
        onExecutionFailed++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onStartExecution(() => {
          onStartExecution++;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })
        taskpool.execute(innerTask).then((res) => {
          console.log(`${caseName} inner task executed`);
          count++;
        });
      })

      errorTask.onEnqueued(() => {
        onEnqueue++;
      })
      errorTask.onStartExecution(() => {
        onStartExecution++;
      })

      errorTask.onExecutionSucceeded(() => {
        onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(2);
      expect(onStartExecution).assertEqual(2);
      expect(onExecutionSucceeded).assertEqual(1);
      expect(onExecutionFailed).assertEqual(1);
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
    it('TaskAllListeningTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest010';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let runner = new taskpool.AsyncRunner(caseName, 50);
      let task1: taskpool.Task = new taskpool.Task(sleepFunc, 50);
      task1.onEnqueued(() => {
        onEnqueue++;
      })
      task1.onExecutionSucceeded(() => {
        console.log(`${caseName} task1 onExecutionSucceeded`);
        onExecutionSucceeded++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
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
        onEnqueue++;
      })
      task2.onExecutionFailed(() => {
        console.log(`${caseName} task2 onExecutionFailed`);
        onExecutionFailed++;
        let innerTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        innerTask.onEnqueued(() => {
          onEnqueue++;
        })
        innerTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        innerTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(4); // 3 main tasks + 1 inner task
      expect(onExecutionSucceeded).assertEqual(3);
      expect(onExecutionFailed).assertEqual(1);
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
    it('TaskAllListeningTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest011';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let mainTask: taskpool.Task = new taskpool.Task(sleepFunc, 100);

      mainTask.onExecutionSucceeded(() => {
        console.log(`${caseName} mainTask onExecutionSucceeded`);
        onExecutionSucceeded++;

        // Create inner tasks with different priorities
        let highTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        highTask.onEnqueued(() => {
          onEnqueue++;
        })
        highTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        highTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(1);
      expect(onExecutionSucceeded).assertEqual(2);
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
    it('TaskAllListeningTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskAllListeningTest012';
      console.log(`${caseName} start.`);
      let count = 0;
      let onEnqueue = 0;
      let onReceiveData = 0;
      let onStartExecution = 0;
      let onExecutionSucceeded = 0;
      let onExecutionFailed = 0;

      let mainTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 100);

      mainTask.onReceiveData(() => {
        console.log(`${caseName} mainTask onEnqueued`);
        onEnqueue++;

        // Create inner tasks with different priorities
        let highTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        highTask.onEnqueued(() => {
          onEnqueue++;
        })
        highTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        highTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })

        let mediumTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        mediumTask.onEnqueued(() => {
          onEnqueue++;
        })
        mediumTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        mediumTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
        })

        let lowTask: taskpool.Task = new taskpool.Task(sleepFuncSend, 50);
        lowTask.onEnqueued(() => {
          onEnqueue++;
        })
        lowTask.onReceiveData((data: number) => {
          onReceiveData = data;
        })
        lowTask.onExecutionSucceeded(() => {
          onExecutionSucceeded++;
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
        onExecutionSucceeded++;
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
      expect(onEnqueue).assertEqual(4);
      expect(onExecutionSucceeded).assertEqual(4);
      console.log(`${caseName} end.`);
      done();
    })

  })
}
