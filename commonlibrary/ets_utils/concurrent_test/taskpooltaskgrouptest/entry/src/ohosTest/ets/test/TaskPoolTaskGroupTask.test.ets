/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  printArgs1,
  printArgs3,
  printArgs5,
  printArgsLock1,
  printArgsLock3,
  printArgsLock5,
  printArgsLock7,
  printArgsPromise1,
  printArgsPromise3,
  printArgsPromise5,
  printArgsPromise7,
  printArgsSettimeout1,
  printArgsSettimeout3,
  printArgsTaskpool,
  printArgsTaskpool1,
  printArgsTaskpool2,
  printArgsTaskpool3,
  printArgsWait,
  printArgsWait1,
  printArgsWait2,
  printArgsWait3,
  printArgsWorker1
} from '../testability/pages/TaskMethod';
import { AsyncLockTest, AsyncLockTest1, WorkThread } from '../testability/pages/lock';
import { sleep } from '../testability/pages/Utils';

let Count1: number = 0;
let Count2: number = 0;
let tag: string = 'taskPoolTaskGroup'


export default function taskPoolTaskGroup() {
  describe('TaskPoolTaskGroup', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      Count1 = 0
      Count2 = 0
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(2000)
      Count1 = 0
      Count2 = 0
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await sleep(500)
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0100
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1001
     * @tc.desc   test Common tasks are exceptional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskGroupTask0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This ApI supports three parameters: test case name, filter parameter, and test case function.hilog.info(0x0000,'testTag''%{public}s','it begin');
      
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs1, 1);
      taskGroup.addTask(printArgs1, 2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${taskGroup.name} catch: ${JSON.stringify(err)}`)
            expect(err.message).assertEqual('TypeError: Cannot read property split of undefined')
            Count1++;
            Count2++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0200
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1002
     * @tc.desc   test GenericsTask throws exceptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolTaskGroupTask0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    // Defines a test case. This ApI supports three parameters: test case name, filter parameter, and test case function.hilog.info(0x0000,'testTag''%{public}s','it begin');
      
      let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${taskGroup.name} catch: ${JSON.stringify(err)}`)
            expect(err.message).assertEqual('TypeError: Cannot read property split of undefined')
            Count1++;
            Count2++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0300
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1003
     * @tc.desc   test OnEnqueued callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
     let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
      ;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      task1.onEnqueued(() => {
        try {
          console.info('taskpool: onEnqueued')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count1++;
        }
      });
      task2.onEnqueued(() => {
        try {
          console.info('taskpool: onEnqueued')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count2++;
        }
      });
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0400
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1004
     * @tc.desc   test OnStartExecution callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      
      let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      task1.onStartExecution(() => {
        try {
          console.info('taskpool: onStartExecution')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count1++;
        }
      });
      task2.onStartExecution(() => {
        try {
          console.info('taskpool: onStartExecution')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count2++;
        }
      });
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0500
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1005
     * @tc.desc   test OnExecutionFailed callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      
      let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
      task1.onExecutionFailed((e: Error) => {
        try {
          console.info('taskpool: onExecutionFailed error is ' + e);
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count1++;
        }
      });
      task2.onExecutionFailed((e: Error) => {
        try {
          console.info('taskpool: onExecutionFailed error is ' + e);
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count2++;
        }
      });
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(task1).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
        try {
          taskpool.execute(task2).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }

      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0600
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK__1006
     * @tc.desc   test OnExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      task1.onExecutionSucceeded(() => {
        try {
          console.info('taskpool: onExecutionSucceeded')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count1++;
        }
      });
      task2.onExecutionSucceeded(() => {
        try {
          console.info('taskpool: onExecutionSucceeded')
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count2++;
        }
      });

      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0700
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1007
     * @tc.desc   test OnReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      
      let task1: taskpool.Task = new taskpool.Task(printArgs5, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs5, 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      task1.onReceiveData((data: number) => {
        try {
          console.info('taskpool: data is: ' + data);
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count1++;
        }
      });
      task2.onReceiveData((data: number) => {
        try {
          console.info('taskpool: data is: ' + data);
          let s: string[] = []
          s[0].split('')[1].toString()
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
          expect(e.message).assertEqual('Cannot read property split of undefined')
          Count2++;
        }
      });

      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).catch((err: BusinessError) => {
            console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`)
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0800
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1008
     * @tc.desc   test Then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs3, 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            try {
              console.info('dependency: second task1 success');
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              console.info(`${tag} execute error:${e.message}`)
              expect(e.message).assertEqual('Cannot read property split of undefined')
              Count1++;
              Count2++;
            }
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask0900
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1009
     * @tc.desc   test Catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: string) => {
            try {
              console.error('taskpool test occur error: ' + err);
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              console.info(`${tag} execute error:${e.message}`)
              expect(e.message).assertEqual('Cannot read property split of undefined')
              Count1++;
              Count2++;
            }
          });
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1000
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1010
     * @tc.desc   test Finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: string) => {
            console.error('taskpool test occur error: ' + err);
          }).finally(() => {
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              console.info(`${tag} execute error:${e.message}`)
              expect(e.message).assertEqual('Cannot read property split of undefined')
              Count1++;
              Count2++;
            }
          })

        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })


    /**
     * @tc.name   taskPoolTaskGroupTask1100
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1011
     * @tc.desc   test AsyncLock callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      await sleep(5000)
      let task1: taskpool.Task = new taskpool.Task(printArgsLock1);
      let task2: taskpool.Task = new taskpool.Task(printArgsLock1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in task execution.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1200
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1012
     * @tc.desc   test AsyncLock's then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsLock3);
      let task2: taskpool.Task = new taskpool.Task(printArgsLock3);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in task execution.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1300
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1013
     * @tc.desc   test AsyncLock's catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsLock5);
      let task2: taskpool.Task = new taskpool.Task(printArgsLock5);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in task execution.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1400
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1014
     * @tc.desc   test AsyncLock's finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsLock7);
      let task2: taskpool.Task = new taskpool.Task(printArgsLock7);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Cannot read property split of undefined')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1500
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1015
     * @tc.desc   test Promise callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsPromise1);
      let task2: taskpool.Task = new taskpool.Task(printArgsPromise1);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in task execution.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1600
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1016
     * @tc.desc   test Promise's then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsPromise3);
      let task2: taskpool.Task = new taskpool.Task(printArgsPromise3);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in then callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1700
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1017
     * @tc.desc   test Promise's catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsPromise5);
      let task2: taskpool.Task = new taskpool.Task(printArgsPromise5);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in then callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1800
     * @tc.number SUB_SUB_TASKPOOL_TASKGROUP_TASK_1018
     * @tc.desc   test Promise's finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsPromise7);
      let task2: taskpool.Task = new taskpool.Task(printArgsPromise7);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in finally callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask1900
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1019
     * @tc.desc   test Settimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsSettimeout1);
      let task2: taskpool.Task = new taskpool.Task(printArgsSettimeout1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          taskpool.execute(taskGroup1).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err);
            expect(err.message).assertEqual('Simulated error in setTimeout callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2000
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1020
     * @tc.desc   test Asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsSettimeout3);
      let task2: taskpool.Task = new taskpool.Task(printArgsSettimeout3);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(taskGroup1).then(() => {
            console.info('taskpool: execute task success')
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertEqual('Simulated error in async operation.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2100
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1021
     * @tc.desc   test Wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let asyncLockTest = new AsyncLockTest()
      let task1: taskpool.Task = new taskpool.Task(printArgsWait, asyncLockTest);
      let task2: taskpool.Task = new taskpool.Task(printArgsWait, asyncLockTest);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(taskGroup1).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertEqual('Simulated error in wait callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2200
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1022
     * @tc.desc   test Wait's then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let asyncLockTest = new AsyncLockTest1()
      let task1: taskpool.Task = new taskpool.Task(printArgsWait1, asyncLockTest);
      let task2: taskpool.Task = new taskpool.Task(printArgsWait1, asyncLockTest);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(taskGroup1).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertEqual('Simulated error in then callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2300
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1023
     * @tc.desc   test Wait's catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let asyncLockTest = new AsyncLockTest1()
      let task1: taskpool.Task = new taskpool.Task(printArgsWait2, asyncLockTest);
      let task2: taskpool.Task = new taskpool.Task(printArgsWait2, asyncLockTest);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(taskGroup1).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertEqual('Simulated error in catch callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2400
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1024
     * @tc.desc   test Wait's finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let asyncLockTest = new AsyncLockTest1()
      let task1: taskpool.Task = new taskpool.Task(printArgsWait3, asyncLockTest);
      let task2: taskpool.Task = new taskpool.Task(printArgsWait3, asyncLockTest);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await taskpool.execute(taskGroup1).then(() => {
            console.info('taskpool: execute task success');
          }).catch((err: BusinessError) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertEqual('Simulated error in finally callback.')
            Count1++
            Count2++
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2500
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1025
     * @tc.desc   test Worker callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup1).then(() => {
          let work = new worker.ThreadWorker('../workers/Worker');
          work.onerror = (e: ErrorEvent): void => {
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              Count1++
              Count2++
              work.terminate()
            }
          }
          work.postMessage('2')
        })
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      await sleep(100)
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2600
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1026
     * @tc.desc   test Worker callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);

      for (let i = 0; i < 10; i++) {
        taskpool.execute(taskGroup1).then(() => {
          let work = new worker.ThreadWorker('../workers/Worker');
          work.onmessage = (e: MessageEvents): void => {
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              Count1++
              Count2++
              work.terminate()
            }
          }
          work.postMessage('1')
        })
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      await sleep(100)
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2700
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1027
     * @tc.desc   test Taskpool callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await printArgsTaskpool(1);
          taskpool.execute(taskGroup1)
          console.info('taskpool: execute task success');
        } catch (err) {
          console.error('taskpool test occur error: ' + err.message);
          expect(err.message).assertEqual('Simulated error in task execution.');
          Count1++;
          Count2++;
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2800
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1028
     * @tc.desc   test Taskpool's then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool1, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool1, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await printArgsTaskpool1(1);
          taskpool.execute(taskGroup1)
          console.info('taskpool: execute task success');
        } catch (err) {
          console.error('taskpool test occur error: ' + err.message);
          expect(err.message).assertEqual('Simulated error in then execution.');
          Count1++;
          Count2++;
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask2900
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1029
     * @tc.desc   test Taskpool's catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool2, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool2, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await printArgsTaskpool2(1);
          taskpool.execute(taskGroup1)
          console.info('taskpool: execute task success');
        } catch (err) {
          console.error('taskpool test occur error: ' + err.message);
          expect(err.message).assertEqual('Simulated error in catch execution.');
          Count1++;
          Count2++;
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })

    /**
     * @tc.name   taskPoolTaskGroupTask3000
     * @tc.number SUB_TASKPOOL_TASKGROUP_TASK_1030
     * @tc.desc   test Taskpool's fianlly callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolTaskGroupTask3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool3, 1);
      let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool3, 1);
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(task1);
      taskGroup1.addTask(task2);
      for (let i = 0; i < 10; i++) {
        try {
          await printArgsTaskpool3(1);
          taskpool.execute(taskGroup1)
          console.info('taskpool: execute task success');
        } catch (err) {
          console.error('taskpool test occur error: ' + err.message);
          expect(err.message).assertEqual('Simulated error in finally execution.');
          Count1++;
          Count2++;
        }
      }
      while (Count1 < 10 || Count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(Count1)
      expect(10).assertEqual(Count2)
      Count1 = 0
      Count2 = 0
      done()
    })
  })
}