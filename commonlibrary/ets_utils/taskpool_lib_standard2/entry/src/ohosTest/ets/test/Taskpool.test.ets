/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, describe, expect, it } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import {
  add,
  addAdd,
  addition,
  additionF,
  addOne,
  adds,
  concurrentF,
  dividing,
  funArray,
  funDate,
  funOne,
  mathAbs,
  mathCeil,
  mathFloor,
  mathMax,
  mathMin,
  mathMore,
  mathPow,
  mathRound,
  mathSqrt,
  multiply,
  printABig,
  printABool,
  printArgs,
  printLang,
  printNull,
  printSan,
  printString,
  printTime,
  printUndefined,
  sendDataCatch,
  sendDataFun,
  spileString,
  stringToNumber,
  testFunc,
  testTransfer,
  throwError
} from '../utils';

function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}

function promiseCase(): Promise<void | Object> {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return p;
}

function test1(): void {

}

function noConcurrent(num: number): number {
  return num;
}

export default function TaskpoolTest() {
  describe('ActsTaskPoolTest', () => {

    afterEach(async () => {
      await asyncSleep(1000);
    })

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1300
     * @tc.name      : testTaskpoolGetTaskPoolInfo001
     * @tc.desc      : Obtain the internal information of the task pool, including thread information and task information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolGetTaskPoolInfo001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolGetTaskPoolInfo001';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 10);
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: taskpoolInfo: ${JSON.stringify(taskpoolInfo)}`);
        expect(taskpoolInfo.threadInfos[0].tid != 0).assertTrue();
        expect(taskpoolInfo.threadInfos[0].taskIds).assertDeepEquals([]);
        expect(taskpoolInfo.taskInfos).assertDeepEquals([]);
        expect(taskpoolInfo.threadInfos[0].priority).assertLargerOrEqual(0);
        await promiseCase();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0100
     * @tc.name      : testTaskpoolExecute001
     * @tc.desc      : Put the created task into the task queue in the taskpool and wait for it to be distributed to the worker thread for execution. In the current execution mode, you can try to call cancel the task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecute001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(add, 10, 20);
        let task2: taskpool.Task = new taskpool.Task(multiply, 5, 10);
        let task3: taskpool.Task = new taskpool.Task(dividing, 15, 3);
        taskpool.execute(task1).then(((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as number).assertEqual(30);
        })).catch((error: BusinessError) => {
          console.info(`${caseName}: task1 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        taskpool.execute(task2).then((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as number).assertEqual(50);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task2 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        taskpool.execute(task3).then((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as number).assertEqual(5);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task3 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0200
     * @tc.name      : testTaskpoolExecute002
     * @tc.desc      : Put the created task into the task queue in the taskpool and wait for it to be distributed to the worker thread for execution. In the current execution mode, you can try to call cancel the task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecute002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(addAdd, 'abc', 'def', 'hello');
        let task2: taskpool.Task = new taskpool.Task(addAdd, 'qwe', 'rty', 'hello');
        let task3: taskpool.Task = new taskpool.Task(addAdd, 'zxc', 'vbn', 'hello');
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as string).assertEqual('abcdefhello');
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task1 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        taskpool.execute(task2).then((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as string).assertEqual('qwertyhello');
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task2 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        taskpool.execute(task3).then((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as string).assertEqual('zxcvbnhello');
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task3 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0300
     * @tc.name      : testTaskpoolExecute003
     * @tc.desc      : Put the created task into the task queue in the taskpool and wait for it to be distributed to the worker thread for execution. In the current execution mode, you can set the task priority and try to call cancel to cancel the task. The task cannot be a task group task or a serial queue task. The task can be execute multiple times
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecute003';
      console.info(`${caseName} test start`);
      try {
        let num: number = 0;
        let count: number = 120;
        let taskArray: taskpool.Task[] = [];
        for (let i: number = 0; i < count; i++) {
          let taskExecute1: taskpool.Task = new taskpool.Task(printArgs, i);
          taskArray.push(taskExecute1);
        }
        for (let i: number = 0; i < count; i++) {
          taskpool.execute(taskArray[i], i % 3).then((res: Object) => {
            console.info(`${caseName}: result: ${i % 3}`);
            num++;
            if (num == 120) {
              console.info(`${caseName}: result: ${i % 3}`);
              expect(i % 3 == 2).assertTrue();
            }
          });
        }
        while (!(num == 120)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0400
     * @tc.name      : testTaskpoolExecute004
     * @tc.desc      : Put the created task group into the task queue in the taskpool and wait for it to be distributed to the worker thread for execution. After all tasks in the task group are executed, the result array is returned. The current execution mode is suitable for performing a set of related tasks.
     * @tc.size      : MediumTest
     * @tc.type      : FunctionGroup
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute004', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecute004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: object[] = [];
        let result2: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(printArgs, 10.5);
        taskExecute1.addTask(printString, 'string');
        taskExecute1.addTask(printArgs, -30.6);
        let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printABool, true);
        let task2: taskpool.Task = new taskpool.Task(printABig, 200);
        let task3: taskpool.Task = new taskpool.Task(printABool, false);
        taskExecute2.addTask(task1);
        taskExecute2.addTask(task2);
        taskExecute2.addTask(task3);
        taskpool.execute(taskExecute1).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([10.5, 'string', -30.6]);
        });
        taskpool.execute(taskExecute2).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate2 = true;
          result2 = res as object[];
          expect(result2).assertDeepEquals([true, 200, false]);
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: object[] = result1.concat(result2);
        expect(result).assertDeepEquals([10.5, 'string', -30.6, true, 200, false]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0500
     * @tc.name      : testTaskpoolExecute005
     * @tc.desc      : Put the created task group into the task queue in the taskpool and wait for it to be distributed to the worker thread for execution. After all tasks in the task group are executed, the result array is returned. The current execution mode is suitable for performing a set of related tasks.
     * @tc.size      : MediumTest
     * @tc.type      : FunctionGroup
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute005', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecute005';
      console.info(`${caseName} test start`);
      try {
        let begin: number = Date.now();
        let highTime: number = 0;
        let mediumTime: number = 0;
        let lowTime: number = 0;
        let allCount: number = 99;
        let num: number = 0;
        let taskGroupArray: taskpool.TaskGroup[] = [];
        for (let i: number = 0; i < allCount; i++) {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let taskExecute1: taskpool.Task = new taskpool.Task(printTime, 10);
          taskGroup.addTask(taskExecute1);
          taskGroupArray.push(taskGroup);
        }
        for (let i: number = 0; i < allCount; i++) {
          taskpool.execute(taskGroupArray[i], i % 3).then((res: Object) => {
            console.info(`${caseName}: result: ${i % 3}`);
            num++;
            if (i % 3 == 0) {
              highTime = Date.now() - begin;
            }
            if (i % 3 == 1) {
              mediumTime = Date.now() - begin;
            }
            if (i % 3 == 2) {
              lowTime = Date.now() - begin;
            }
          });
        }
        while (!(num == allCount)) {
          await promiseCase();
        }
        console.info(`${caseName} time:---${lowTime}--${mediumTime}--${highTime}`);
        expect(lowTime > mediumTime && mediumTime > highTime).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0600
     * @tc.name      : testTaskpoolExecuteDelayed001
     * @tc.desc      : Delay the execution of tasks. In the current execution mode, you can set the task priority and try to call cancel to cancel the task. The task cannot be a task group task or a serial queue task. The task can be executedelayed multiple times.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecuteDelayed001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecuteDelayed001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result: number[] = [];
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let task1: taskpool.Task = new taskpool.Task(mathCeil, 99.1);
        let task2: taskpool.Task = new taskpool.Task(mathFloor, 200.8);
        let task3: taskpool.Task = new taskpool.Task(mathRound, 300.4);
        taskpool.executeDelayed(1000, task1).then(((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number;
          expect(result1).assertEqual(100);
          result.push(result1);
          console.info(`${caseName}:  ${result}`);
        })).catch((error: BusinessError) => {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        });
        taskpool.executeDelayed(2000, task2).then(((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number;
          expect(result2).assertEqual(200);
          result.push(result2);
          console.info(`${caseName}:  ${result}`);
        })).catch((error: BusinessError) => {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        });
        taskpool.execute(task3).then(((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as number;
          expect(result3).assertEqual(300);
          result.push(result3);
          console.info(`${caseName}:  ${result}`);
        })).catch((error: BusinessError) => {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        console.info(`resultresult  ${result}`);
        expect(result).assertDeepEquals([300, 100, 200]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_700
     * @tc.name      : testTaskpoolExecuteDelayed002
     * @tc.desc      : Delay the execution of tasks. In the current execution mode, you can set the task priority and try to call cancel to cancel the task. The task cannot be a task group task or a serial queue task. The task can be executedelayed multiple times.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecuteDelayed002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolExecuteDelayed002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result: number[] = [];
        let task1: taskpool.Task = new taskpool.Task(mathAbs, -100);
        let task2: taskpool.Task = new taskpool.Task(mathAbs, -200);
        let task3: taskpool.Task = new taskpool.Task(mathAbs, -300);
        taskpool.executeDelayed(1000, task1).then(((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as number).assertEqual(100);
          result.push(res as number);
        }));
        taskpool.executeDelayed(1000, task2).then(((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as number).assertEqual(200);
          result.push(res as number);
        }));
        taskpool.executeDelayed(1000, task3).then(((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as number).assertEqual(300);
          result.push(res as number);
        }));
        taskpool.cancel(task1);
        taskpool.cancel(task2);
        while (!(isTerminate1 || isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        expect(result).assertDeepEquals([300]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_800
     * @tc.name      : testTaskpoolCancel001
     * @tc.desc      : Cancel a task from the task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolCancel001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let taskExecute1: taskpool.Task = new taskpool.Task(mathPow, 3, 3);
        let taskExecute2: taskpool.Task = new taskpool.Task(mathSqrt, 16);
        let taskExecute3: taskpool.Task = new taskpool.Task(dividing, 60, 5);
        taskpool.execute(taskExecute1, taskpool.Priority.LOW).then((res: Object) => {
          console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number;
          expect(result1).assertDeepEquals(27);
        });
        taskpool.execute(taskExecute2, taskpool.Priority.MEDIUM).then((res: Object) => {
          console.info(`${caseName}: taskExecute2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number;
          expect(result2).assertDeepEquals(4);
        });
        taskpool.execute(taskExecute3, taskpool.Priority.HIGH).then((res: Object) => {
          console.info(`${caseName}: taskExecute3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as number;
        });
        taskpool.cancel(taskExecute3);
        expect(result3).assertDeepEquals(0);
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        let result: number[] = [result1, result2, result3];
        expect(taskpool.Task.isCanceled() == true);
        expect(result).assertDeepEquals([27, 4, 0]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_900
     * @tc.name      : testTaskpoolCancel002
     * @tc.desc      : Cancel a task from the task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolCancel002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let taskExecute1: taskpool.Task = new taskpool.Task(mathMore, 8);
        let taskExecute2: taskpool.Task = new taskpool.Task(mathMore, 16);
        let taskExecute3: taskpool.Task = new taskpool.Task(mathMore, 9);
        taskpool.execute(taskExecute1).then((res: Object) => {
          console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number;
        });

        taskpool.execute(taskExecute2).then((res: Object) => {
          console.info(`${caseName}: taskExecute2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number;
        });
        taskpool.execute(taskExecute3).then((res: Object) => {
          console.info(`${caseName}: taskExecute2 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as number;
          taskpool.cancel(taskExecute3);
          expect(result3).assertEqual(4);
        });
        taskpool.cancel(taskExecute1);
        taskpool.cancel(taskExecute2);
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        expect(taskpool.Task.isCanceled() == true);
        let result: number[] = [result1, result2, result3];
        console.info(`${caseName}: result:  ${result}`);
        expect(result).assertDeepEquals([0, 0, 4]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1000
     * @tc.name      : testTaskpoolCancel003
     * @tc.desc      : Cancel a task group in a task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolCancel003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number[] = [2, 2, 2];
        let result2: number[] = [1, 1, 1];
        let taskGroup1 = new taskpool.TaskGroup();
        taskGroup1.addTask(mathPow, 2, 3);
        taskGroup1.addTask(mathPow, 4, 2);
        taskGroup1.addTask(mathPow, 8, 2);
        let taskGroup2 = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(mathSqrt, 9);
        let task2: taskpool.Task = new taskpool.Task(mathSqrt, 25);
        let task3: taskpool.Task = new taskpool.Task(mathSqrt, 36);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        taskpool.execute(taskGroup1).then((res: Object) => {
          console.info(`${caseName}: taskGroup1 return value: ${JSON.stringify(res)}`);
          result1 = res as number[];
          isTerminate1 = true;
          expect(result1).assertDeepEquals([8, 16, 64]);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: taskGroup1 execute catch error: ${JSON.stringify(error)}`);
          expect(error).not().assertNull();
        });
        taskpool.cancel(taskGroup1);
        expect(result1).assertDeepEquals([2, 2, 2]);
        taskpool.execute(taskGroup2).then((res: Object) => {
          console.info(`${caseName}: taskGroup2 return value: ${JSON.stringify(res)}`);
          result2 = res as number[];
          isTerminate2 = true;
          expect(result2).assertDeepEquals([3, 5, 6]);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: taskGroup2 execute catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        while (!(isTerminate1 || isTerminate2)) {
          await promiseCase();
        }
        expect(taskpool.Task.isCanceled() == true);
        console.info(`${caseName} test end`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        console.info(`${caseName} test end`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1100
     * @tc.name      : testTaskpoolCancel004
     * @tc.desc      : Cancel a task group in a task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel004', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolCancel004';
      console.info(`${caseName} test start`);
      try {
        let result1: number[] = [0, 0, 0];
        let result2: number[] = [1, 1, 1];
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(mathMore, 17);
        taskGroup1.addTask(mathMore, 24);
        taskGroup1.addTask(mathMore, 38);
        let taskGroup2 = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(mathSqrt, 64);
        let task2: taskpool.Task = new taskpool.Task(mathSqrt, 81);
        let task3: taskpool.Task = new taskpool.Task(mathSqrt, 49);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        taskpool.execute(taskGroup1).then((res: Object) => {
          console.info(`${caseName}: taskGroup1 return value: ${JSON.stringify(res)}`);
          taskpool.cancel(taskGroup1);
          result1 = res as number[];
          expect(result1).assertDeepEquals([2, 4, 3]);
        });
        taskpool.execute(taskGroup2).then((res: Object) => {
          console.info(`${caseName}: taskGroup2 return value: ${JSON.stringify(res)}`);
          taskpool.cancel(taskGroup2);
          result2 = res as number[];
          expect(result2).assertDeepEquals([8, 9, 7]);
        });
        expect(taskpool.Task.isCanceled() == true);
        await promiseCase();
        expect(result1).assertDeepEquals([2, 4, 3]);
        expect(result2).assertDeepEquals([8, 9, 7]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1200
     * @tc.name      : testTaskpoolCancel005
     * @tc.desc      : Cancel a task group in a task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel005', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolCancel005';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let num: number[] = [];
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printSan, 300);
        taskpool.execute(task1).then((res: Object) => {
          expect(res as number).assertEqual(100);
          result1 = res as number;
          isTerminate1 = true;
        });
        taskpool.execute(task2).then((res: Object) => {
          expect(res as number).assertEqual(200);
          result2 = res as number;
          isTerminate2 = true;
        });
        taskpool.execute(task3).then((res: Object) => {
          expect(res as number).assertEqual(300);
          result3 = res as number;
          isTerminate3 = true;
        });
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        taskpool.cancel(task3);
        let result: number[] = [result1, result2, result3];
        expect(result).assertDeepEquals([100, 200, 0]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200016);
        expect(error.message).assertEqual("The task is executing when it is canceled.");
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1500
     * @tc.name      : testTaskpoolPriority001
     * @tc.desc      : Indicates the priority of the task that you have created
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolPriority001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolPriority001';
      console.info(`${caseName} test start`);
      try {
        let num1: number = 0;
        let taskArray1: taskpool.Task[] = [];
        let begin1: number = Date.now();
        let highTime1: number = 0;
        let mediumTime1: number = 0;
        let lowTime1: number = 0;
        let allCount1: number = 99;
        for (let i: number = 0; i < allCount1; i++) {
          let taskExecute1: taskpool.Task = new taskpool.Task(printTime, 10);
          taskArray1.push(taskExecute1);
        }
        for (let i: number = 0; i < allCount1; i++) {
          taskpool.execute(taskArray1[i], i % 3).then((res: Object) => {
            console.info(`${caseName}: result: ${i % 3}`);
            num1++;
            if (i % 3 == 0) {
              highTime1 = Date.now() - begin1;
            }
            if (i % 3 == 1) {
              mediumTime1 = Date.now() - begin1;
            }
            if (i % 3 == 2) {
              lowTime1 = Date.now() - begin1;
            }
          });
        }
        while (!(num1 == allCount1)) {
          await promiseCase();
        }
        console.info(`${caseName} time:---${lowTime1}--${mediumTime1}--${highTime1}`);
        expect(lowTime1 > mediumTime1 && mediumTime1 > highTime1).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1600
     * @tc.name      : testTaskpoolTaskConstructor001
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor001';
      console.info(`${caseName} test start`);
      try {
        let check1: boolean = false;
        let check2: boolean = false;
        let check3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task(mathMax, 10, 20);
        let taskConstructor2: taskpool.Task = new taskpool.Task(mathMin, 18, 38);
        let taskConstructor3: taskpool.Task = new taskpool.Task(mathAbs, -60);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          check1 = true;
          expect(res as number).assertEqual(20);
          result1 = res as number;
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          check2 = true;
          expect(res as number).assertEqual(18);
          result2 = res as number;
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          check3 = true;
          expect(res as number).assertEqual(60);
          result3 = res as number;
        });
        while (!(check1 && check2 && check3)) {
          await promiseCase();
        }
        let view: number = result1 + result2 + result3;
        expect(view).assertEqual(98);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1700
     * @tc.name      : testTaskpoolTaskConstructor002
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: string = '';
        let result2: string = '';
        let result3: string = '';
        let taskConstructor1: taskpool.Task = new taskpool.Task(addAdd, 'a', 'b', 'c');
        let taskConstructor2: taskpool.Task = new taskpool.Task(addAdd, 'q', 'e', 'w');
        let taskConstructor3: taskpool.Task = new taskpool.Task(addAdd, 'x', 'y', 'z');
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as string;
          expect(result1).assertEqual('abc');
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as string;
          expect(result2).assertEqual('qew');
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as string;
          expect(result3).assertEqual('xyz');
        });
        taskpool.cancel(taskConstructor2);
        expect(result2).assertDeepEquals('');
        while (!(isTerminate1 && isTerminate3 || isTerminate2)) {
          await promiseCase();
        }
        let result: string = result1 + result2 + result3;
        expect(result).assertDeepEquals('abcxyz');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1800
     * @tc.name      : testTaskpoolTaskConstructor003
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let task1: taskpool.Task = new taskpool.Task(mathMax, 50, 300);
        let task2: taskpool.Task = new taskpool.Task(mathMax, 60, 420);
        let task3: taskpool.Task = new taskpool.Task(mathMax, 80, 510);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
          result1 = res as number;
          isTerminate1 = true;
          expect(result1).assertEqual(300);
        });
        ;
        taskpool.execute(task2).then((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
          result2 = res as number;
          isTerminate2 = true;
          expect(result2).assertEqual(420);
        });
        taskpool.execute(task3).then((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
          result3 = res as number;
          isTerminate3 = true;
          expect(result3).assertEqual(510);
        });
        taskpool.cancel(task3);
        expect(result3).assertEqual(0);
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        let result: number[] = [result1, result2, result3];
        expect(result).assertDeepEquals([300, 420, 0]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1900
     * @tc.name      : testTaskpoolTaskConstructor004
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor004', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let name1: string = ' ';
        let name2: string = ' ';
        let name3: string = ' ';
        let taskConstructor1: taskpool.Task = new taskpool.Task('Hello', mathMax, 10, 50);
        let taskConstructor2: taskpool.Task = new taskpool.Task('Good', mathMin, 35, 68);
        let taskConstructor3: taskpool.Task = new taskpool.Task('morning', mathMore, 68);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as number).assertEqual(50);
          name1 = taskConstructor1.name;
          console.info(`${caseName} name1 1${name1}1`);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as number).assertEqual(35);
          name2 = name2 + taskConstructor2.name;
          console.info(`${caseName} name2 ${name2}`);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as number).assertEqual(3);
          name3 = name3 + taskConstructor3.name;
          console.info(`${caseName}: name3 ${name3}`);
        });
        console.info(`${caseName}: name ${name1} -- ${name2} -- ${name3}`);
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        let name: string[] = [name1, name2, name3];
        expect(name).assertDeepEquals(['Hello', ' Good', ' morning']);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2000
     * @tc.name      : testTaskpoolTaskConstructor005
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor005', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor005';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let name1: string = '';
        let name2: string = '';
        let name3: string = '';
        let taskConstructor1: taskpool.Task = new taskpool.Task('Hello', adds, 'e', 'l');
        let taskConstructor2: taskpool.Task = new taskpool.Task('Good', adds, 'o', 'd');
        let taskConstructor3: taskpool.Task = new taskpool.Task('morning', adds, 'o', 'r');
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as string).assertEqual('el');
          name1 = taskConstructor1.name.replace(res as string, '');
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as string).assertEqual('od');
          name2 = taskConstructor2.name.replace(res as string, '');
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as string).assertEqual('or');
          name3 = taskConstructor3.name.replace(res as string, '');
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        let name: string = addAdd(name1, name2, name3);
        expect(name).assertDeepEquals('HloGomning');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /*'
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2100
     * @tc.name      : testTaskpoolTaskConstructor006
     * @tc.desc      : Task Constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskConstructor006', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskConstructor006';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let name1: number = 0;
        let name2: number = 0;
        let name3: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task('200', printString, '40');
        let taskConstructor2: taskpool.Task = new taskpool.Task('300', printString, '50');
        let taskConstructor3: taskpool.Task = new taskpool.Task('400', printString, '25');
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as string).assertEqual('40');
          name1 = Number(taskConstructor1.name) / (res as number);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as string).assertEqual('50');
          name2 = Number(taskConstructor2.name) / (res as number);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as string).assertEqual('25');
          name3 = Number(taskConstructor3.name) / (res as number);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        let name: number[] = [name1, name2, name3];
        expect(name).assertDeepEquals([5, 6, 16]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2200
     * @tc.name      : testTaskpoolTaskIsCanceled001
     * @tc.desc      : Check if the task that is currently running has been canceled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskIsCanceled001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskIsCanceled001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task(mathSqrt, 100);
        let taskConstructor2: taskpool.Task = new taskpool.Task(mathSqrt, 121);
        let taskConstructor3: taskpool.Task = new taskpool.Task(mathSqrt, 144);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number;
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number;
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as number;
        });
        taskpool.cancel(taskConstructor2);
        taskpool.cancel(taskConstructor3);
        while (!(isTerminate1 || isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        expect(result1).assertEqual(10);
        expect(result2).assertEqual(0);
        expect(result3).assertEqual(0);
        expect(taskpool.Task.isCanceled() == true);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2300
     * @tc.name      : testTaskpoolTaskIsCanceled002
     * @tc.desc      : Check if the task that is currently running has been canceled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskIsCanceled002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskIsCanceled002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let result3: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task(mathPow, 10, 2);
        let taskConstructor2: taskpool.Task = new taskpool.Task(mathPow, 2, 4);
        let taskConstructor3: taskpool.Task = new taskpool.Task(mathPow, 4, 3);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number;
          expect(result1).assertEqual(100);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number;
          expect(result2).assertEqual(16);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result3 = res as number;
          expect(result3).assertEqual(64);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        expect(taskpool.Task.isCanceled() == false);
        let result: number = result1 + result2 + result3;
        expect(result).assertEqual(180);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2400
     * @tc.name      : testTaskpoolTaskSetTransferList001
     * @tc.desc      : Set the transfer list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskSetTransferList001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskSetTransferList001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);
        let buffer2: ArrayBuffer = new ArrayBuffer(32);
        let view2: Uint8Array = new Uint8Array(buffer2);
        let buffer3: ArrayBuffer = new ArrayBuffer(64);
        let view3: Uint8Array = new Uint8Array(buffer3);
        let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        task1.setTransferList([view.buffer, view1.buffer]);
        let task2: taskpool.Task = new taskpool.Task(testTransfer, view2, view3);
        task2.setTransferList([view2.buffer, view3.buffer]);
        taskpool.execute(task1).then((res: Object) => {
          isTerminate1 = true;
          expect(res).assertEqual(24);
          result1 = res as number;
        });
        taskpool.execute(task2).then((res: Object) => {
          isTerminate2 = true;
          expect(res).assertEqual(96);
          result2 = res as number;
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: number[] = [result1, result2];
        expect(result).assertDeepEquals([24, 96]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2500
     * @tc.name      : testTaskpoolTaskSetCloneList001
     * @tc.desc      : Set the copy list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskSetCloneList001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskSetCloneList001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let arr: (number | string)[] = [1, 'a', 3, 'b'];
        let arrayBuffer1: ArrayBuffer = new ArrayBuffer(16);
        let arrayBuffer2: ArrayBuffer = new ArrayBuffer(32);
        let arrayInt1: Int32Array = new Int32Array(arrayBuffer1);
        let arrayInt2: Int32Array = new Int32Array(arrayBuffer2);
        for (let i: number = 0; i < arr.length; i++) {
          arrayInt1[i] = stringToNumber(arr[i]);
          arrayInt2[i] = stringToNumber(arr[i]);
        }
        let task1 = new taskpool.Task(testFunc, arrayInt1);
        let task2 = new taskpool.Task(testFunc, arrayInt2);
        task1.setCloneList([arrayBuffer1]);
        task2.setCloneList([arrayBuffer2]);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: res1: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          console.info(`${caseName}: result1: ${arrayInt1[0]}`);
          expect(arrayInt1[0]).assertEqual(1);
        });
        taskpool.execute(task2).then((res: Object) => {
          console.info(`${caseName}: res2: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          console.info(`${caseName}: result2: ${arrayInt2[0]}`);
          expect(arrayInt2[0]).assertEqual(1);
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
          done();
        }
        console.info(`${caseName}: result11: ${arrayInt1[0]}`);
        console.info(`${caseName}: result22: ${arrayInt2[0]}`);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2600
     * @tc.name      : testTaskpoolTaskSendData001
     * @tc.desc      : Send a message to the host thread and trigger a callback during task execution
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskSendData001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskSendData001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let isTerminate4: boolean = false;
        let taskConstructor1: taskpool.Task = new taskpool.Task(concurrentF, 1);
        let taskConstructor2: taskpool.Task = new taskpool.Task(spileString, 'q', 'e');
        let taskConstructor3: taskpool.Task = new taskpool.Task(funArray, [1, 2, 3]);
        let taskConstructor4: taskpool.Task = new taskpool.Task(funDate, new Date(2024, 0, 1));
        taskConstructor1.onReceiveData((res: Object) => {
          console.info(`${caseName}: taskConstructor5.onReceiveData res: ${JSON.stringify(res)}`);
          expect(res as number).assertEqual(10);
        });
        taskConstructor2.onReceiveData((res: string) => {
          console.info(`${caseName}: taskConstructor1.onReceiveData res: ${JSON.stringify(res)}`);
          expect(res as string).assertEqual('qe');
        });
        taskConstructor3.onReceiveData((res: Object) => {
          console.info(`${caseName}: taskConstructor2.onReceiveData res: ${JSON.stringify(res)}`);
          expect(res as number[]).assertDeepEquals([1, 2, 3]);
        });
        taskConstructor4.onReceiveData((res: object) => {
          console.info(`${caseName}: taskConstructor4.onReceiveData res: ${JSON.stringify(res)}`);
          expect((res as Date).toString()).assertEqual('Mon Jan 01 2024 00:00:00 GMT+0800');
        });
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor4 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
        });
        taskpool.execute(taskConstructor4).then((res: Object) => {
          console.info(`${caseName}: taskConstructor5 return value: ${JSON.stringify(res)}`);
          isTerminate4 = true;
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3 && isTerminate4)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2700
     * @tc.name      : testTaskpoolTaskOnReceiveData001
     * @tc.desc      : Register a callback function for a task to receive and process data from a task pool worker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskOnReceiveData001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskOnReceiveData001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result2: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task(concurrentF, 1);
        taskConstructor1.onReceiveData((res: Object) => {
          console.info(`${caseName}: taskConstructor1.onReceiveData res: ${JSON.stringify(res)}`);
          result2 = res as number;
        });
        taskConstructor1.onReceiveData((res: Object) => {
          console.info(`${caseName}: taskConstructor1.onReceiveData res: ${JSON.stringify(res)}`);
          result2 = (res as number) + 1;
        });
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        while (!(isTerminate1)) {
          await promiseCase();
        }
        expect(result2).assertEqual(11);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2800
     * @tc.name      : testTaskpoolTaskOnReceiveData002
     * @tc.desc      : Register a callback function for a task to receive and process data from a task pool worker
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskOnReceiveData002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskOnReceiveData002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result1: number = 0;
        let taskConstructor1: taskpool.Task = new taskpool.Task(concurrentF, 5);
        taskConstructor1.onReceiveData((res: Object) => {
          result1 = res as number;
        });
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.cancel(taskConstructor1);
        while (isTerminate1) {
          await promiseCase();
        }
        expect(result1).assertEqual(0);
        console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(result1)}`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2900
     * @tc.name      : testTaskpoolTaskAddDependency001
     * @tc.desc      : Adds dependencies to other tasks for the current task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskAddDependency001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskAddDependency001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result: number[] = [];
        let taskConstructor1: taskpool.Task = new taskpool.Task(mathMore, 7);
        let taskConstructor2: taskpool.Task = new taskpool.Task(mathMore, 8);
        let taskConstructor3: taskpool.Task = new taskpool.Task(mathMore, 9);
        taskConstructor1.addDependency(taskConstructor2);
        taskConstructor2.addDependency(taskConstructor3);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result.push(res as number);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result.push(res as number);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result.push(res as number);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        expect(result).assertDeepEquals([4, 3, 2]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3000
     * @tc.name      : testTaskpoolTaskRemoveDependency001
     * @tc.desc      : Deletes the dependencies of the current task on other tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskRemoveDependency001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskRemoveDependency001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let result: number[] = [];
        let taskConstructor1: taskpool.Task = new taskpool.Task(mathSqrt, 36);
        let taskConstructor2: taskpool.Task = new taskpool.Task(mathSqrt, 49);
        let taskConstructor3: taskpool.Task = new taskpool.Task(mathSqrt, 64);
        taskConstructor1.addDependency(taskConstructor2);
        taskConstructor1.removeDependency(taskConstructor2);
        taskConstructor2.addDependency(taskConstructor3);
        await taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result.push(res as number);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result.push(res as number);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          result.push(res as number);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        console.info(`${caseName}: result: ${result}`);
        expect(result).assertDeepEquals([6, 8, 7]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3100
     * @tc.name      : testTaskpoolTaskGroupConstructor001
     * @tc.desc      : TaskGroup's constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupConstructor001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number[] = [];
        let result2: number[] = [];
        let TaskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        TaskGroup1.addTask(mathCeil, 10.1);
        TaskGroup1.addTask(mathCeil, 21.2);
        TaskGroup1.addTask(mathCeil, 32.3);
        let TaskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        TaskGroup2.addTask(mathFloor, 101.5);
        TaskGroup2.addTask(mathFloor, 202.6);
        TaskGroup2.addTask(mathFloor, 303.7);
        taskpool.execute(TaskGroup1).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as number[];
          expect(result1).assertDeepEquals([11, 22, 33]);
        });
        taskpool.execute(TaskGroup2).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate2 = true;
          result2 = res as number[];
          expect(result2).assertDeepEquals([101, 202, 303]);
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: number[] = result1.concat(result2);
        expect(result).assertDeepEquals([11, 22, 33, 101, 202, 303]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3200
     * @tc.name      : testTaskpoolTaskGroupConstructor002
     * @tc.desc      : TaskGroup's constructor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupConstructor002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number[] = [];
        let result2: number[] = [];
        let taskGroup1 = new taskpool.TaskGroup();
        taskGroup1.addTask(mathRound, 100.5);
        taskGroup1.addTask(mathRound, 202.4);
        taskGroup1.addTask(mathRound, 302.9);
        taskpool.execute(taskGroup1).then((res: Object) => {
          console.info(`${caseName}: taskGroup1 return value1: ${JSON.stringify(res)}`);
          expect(res as number[]).assertDeepEquals([101, 202, 303]);
          isTerminate1 = true;
          result1 = res as number[];
        });
        taskpool.execute(taskGroup1).then((res: Object) => {
          console.info(`${caseName}: taskGroup1 return value2: ${JSON.stringify(res)}`);
          expect(res as number[]).assertDeepEquals([101, 202, 303]);
          isTerminate2 = true;
          result2 = res as number[];
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: number[] = result1.concat(result2);
        expect(result).assertDeepEquals([101, 202, 303, 101, 202, 303]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3300
     * @tc.name      : testTaskpoolTaskGroupConstructor003
     * @tc.desc      : TaskGroup's constructor,which allows you to specify the task group name
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupConstructor003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let name1: string = ' ';
        let name2: string = ' ';
        let name3: string = ' ';
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup('constructor');
        taskGroup1.addTask(mathMax, 11, 1);
        taskGroup1.addTask(mathMax, 11, 1);
        taskGroup1.addTask(mathMax, 11, 1);
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup('taskGroupName');
        taskGroup2.addTask(mathMin, 44, 88);
        taskGroup2.addTask(mathMin, 44, 88);
        taskGroup2.addTask(mathMin, 44, 88);
        let taskGroup3: taskpool.TaskGroup = new taskpool.TaskGroup('string');
        taskGroup3.addTask(mathSqrt, 169);
        taskGroup3.addTask(mathSqrt, 169);
        taskGroup3.addTask(mathSqrt, 169);
        taskpool.execute(taskGroup1).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as number[]).assertDeepEquals([11, 11, 11]);
          name1 = taskGroup1.name;
        });
        taskpool.execute(taskGroup2).then((res: Object) => {
          console.info(`${caseName}: result2: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as number[]).assertDeepEquals([44, 44, 44]);
          name2 = name2 + taskGroup2.name;
        });
        taskpool.execute(taskGroup3).then((res: Object) => {
          console.info(`${caseName}: result3: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as number[]).assertDeepEquals([13, 13, 13]);
          name3 = name3 + taskGroup3.name;
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        let name: string = addAdd(name1, name2, name3);
        expect(name).assertDeepEquals('constructor taskGroupName string');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3400
     * @tc.name      : testTaskpoolTaskGroupConstructor004
     * @tc.desc      : TaskGroup's constructor,which allows you to specify the task group name
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor004', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupConstructor004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let name1: number = 0;
        let name2: number = 0;
        let name3: number = 0;
        let taskConstructor1: taskpool.TaskGroup = new taskpool.TaskGroup('10');
        taskConstructor1.addTask(mathSqrt, 121);
        taskConstructor1.addTask(mathSqrt, 121);
        taskConstructor1.addTask(mathSqrt, 121);
        let taskConstructor2: taskpool.TaskGroup = new taskpool.TaskGroup('20');
        taskConstructor2.addTask(mathPow, 22, 2);
        taskConstructor2.addTask(mathPow, 22, 2);
        taskConstructor2.addTask(mathPow, 22, 2);
        let taskConstructor3: taskpool.TaskGroup = new taskpool.TaskGroup('30');
        taskConstructor3.addTask(dividing, 39, 3);
        taskConstructor3.addTask(dividing, 39, 3);
        taskConstructor3.addTask(dividing, 39, 3);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as number[]).assertDeepEquals([11, 11, 11]);
          name1 = Number(taskConstructor1.name);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res as number[]).assertDeepEquals([484, 484, 484]);
          name2 = Number(taskConstructor2.name);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res as number[]).assertDeepEquals([13, 13, 13]);
          name3 = Number(taskConstructor3.name);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        let name: number[] = [name1, name2, name3];
        expect(name).assertDeepEquals([10, 20, 30]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3500
     * @tc.name      : testTaskpoolTaskGroupConstructor005
     * @tc.desc      : TaskGroup's constructor,which allows you to specify the task group name
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor005', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupConstructor005';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let name1: string = 'very';
        let name2: string = 'good';
        let taskGroupName1: string = '';
        let taskGroupName2: string = '';
        let taskConstructor1: taskpool.TaskGroup = new taskpool.TaskGroup(name1);
        taskConstructor1.addTask(funOne, 10);
        taskConstructor1.addTask(funOne, 10);
        taskConstructor1.addTask(funOne, 10);
        let taskConstructor2: taskpool.TaskGroup = new taskpool.TaskGroup(name2);
        taskConstructor2.addTask(funOne, 10);
        taskConstructor2.addTask(funOne, 10);
        taskConstructor2.addTask(funOne, 10);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          name1 = 'think';
          taskGroupName1 = taskConstructor1.name.replace(res as string, '');
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: result1: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          name2 = 'with';
          taskGroupName2 = taskConstructor2.name.replace(res as string, '');
        });
        while (!(isTerminate1 || isTerminate2)) {
          await promiseCase();
        }
        let name: string = name1 + name2;
        expect(name).assertDeepEquals('thinkwith');
        let taskGroupName: string = taskGroupName1 + taskGroupName2;
        console.info(`${caseName}: taskGroupName: ${JSON.stringify(taskGroupName)}`);
        expect(taskGroupName).assertDeepEquals('verygood');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3600
     * @tc.name      : testTaskpoolTaskGroupAddTask001
     * @tc.desc      : Add the function to be executed to the task group
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupAddTask001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number[] | undefined[] = [];
        let result2: number[] | undefined[] = [];
        let taskConstructor1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor1.addTask(printUndefined);
        taskConstructor1.addTask(printString, '');
        let taskConstructor2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor2.addTask(printNull, null);
        taskConstructor2.addTask(printNull);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number[] | undefined[];
          expect(result1).assertDeepEquals([undefined, '']);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result2 = res as number[] | undefined[];
          expect(result2).assertDeepEquals([null, null]);
        });
        while (isTerminate1 && isTerminate2) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3700
     * @tc.name      : testTaskpoolTaskGroupAddTask002
     * @tc.desc      : Add the function to be executed to the task group
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupAddTask002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number[] = [];
        let result2: number[] = [];
        let taskConstructor1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor1.addTask(mathSqrt, 144);
        taskConstructor1.addTask(mathSqrt, 484);
        taskConstructor1.addTask(mathSqrt, 1024);
        let taskConstructor2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor2.addTask(mathSqrt, 1764);
        taskConstructor2.addTask(mathSqrt, 2704);
        taskConstructor2.addTask(mathSqrt, 3844);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          result1 = res as number[];
          expect(result1).assertDeepEquals([12, 22, 32]);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          result2 = res as number[];
          expect(result2).assertDeepEquals([42, 52, 62]);
        });
        while (isTerminate1 && isTerminate2) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3800
     * @tc.name      : testTaskpoolTaskGroupAddTask003
     * @tc.desc      : Set the copy list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolTaskGroupAddTask003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTaskGroupAddTask003';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        taskExecute1.addTask(task3);
        let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute2.addTask(task1);
        taskExecute2.addTask(task2);
        taskExecute2.addTask(task3);
        taskpool.execute(taskExecute1).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
        });
        taskpool.execute(taskExecute2).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
        });
        await promiseCase();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code === 401).assertTrue();
        expect(error.message).assertContain("taskpool:: taskGroup cannot add groupTask");
        done();
      }
      try {
        let result1: number[] = [];
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 100);
        task1.addDependency(task2);
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        taskExecute1.addTask(task3);
        taskpool.execute(taskExecute1).then((res: Array<Object>) => {
          console.info(`${caseName}: execute res is: ${res}`);
          result1 = res as number[];
          console.info(`${caseName}: execute result1 is: ${result1}`);
        });
        await promiseCase();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code === 401).assertTrue();
        expect(error.message).assertContain("taskpool:: dependent task not allowed.");
        done();
      }
      try {
        let isTerminate1: boolean = false;
        let result1: number[] = [];
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as number[];
          console.info(`${caseName}: execute result1 is: ${result1}`);
        });
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        taskExecute1.addTask(task3);
        taskpool.execute(taskExecute1).then((res: Object) => {
          console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as number[];
          console.info(`${caseName}: execute result1 is: ${result1}`);
        });
        while (!isTerminate1) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code === 401).assertTrue();
        expect(error.message).assertContain("taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_3900
     * @tc.name      : testTaskpoolSequenceRunnerConstructor001
     * @tc.desc      : Set the copy list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunnerConstructor001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolSequenceRunnerConstructor001';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let flag1: boolean = false;
        let flag2: boolean = false;
        let flag3: boolean = false;
        let flag4: boolean = false;
        let flag5: boolean = false;
        let flag6: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(printString, 'a');
        let task2: taskpool.Task = new taskpool.Task(printString, 'b');
        let task3: taskpool.Task = new taskpool.Task(printString, 'c');
        let task4: taskpool.Task = new taskpool.Task(printString, 'd');
        let task5: taskpool.Task = new taskpool.Task(printString, 'e');
        let task6: taskpool.Task = new taskpool.Task(printString, 'f');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
        let runner3: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
        runner1.execute(task1).then((res: Object) => {
          flag1 = true;
          finalString += res as string;
          console.info(`${caseName}: seqrunner: task1 done.`);
          expect(finalString).assertDeepEquals('efa');
        });
        runner1.execute(task2).then((res: Object) => {
          flag2 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task2 done`);
          expect(finalString).assertDeepEquals('efab');
        });
        runner2.execute(task3).then((res: Object) => {
          flag3 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task3 done.`);
          expect(finalString).assertDeepEquals('efabc');
        });
        runner2.execute(task4).then((res: Object) => {
          flag4 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task4 done`);
          expect(finalString).assertDeepEquals('efabcd');
        });
        runner3.execute(task5).then((res: Object) => {
          flag5 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task5 done.`);
          expect(finalString).assertDeepEquals('e');
        });
        runner3.execute(task6).then((res: Object) => {
          flag6 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task6 done`);
          expect(finalString).assertDeepEquals('ef');
        });
        while (flag1 && flag2 && flag3 && flag4 && flag5 && flag6) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4000
     * @tc.name      : testTaskpoolSequenceRunnerConstructor002
     * @tc.desc      : Set the copy list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunnerConstructor002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolSequenceRunnerConstructor002';
      console.info(`${caseName} test start`);
      try {
        let finalNumber: number[] = [];
        let flag1: boolean = false;
        let flag2: boolean = false;
        let flag3: boolean = false;
        let flag4: boolean = false;
        let flag5: boolean = false;
        let flag6: boolean = false;
        let flag7: boolean = false;
        let flag8: boolean = false;
        let flag9: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(addition, 100);
        let task2: taskpool.Task = new taskpool.Task(addition, 200);
        let task3: taskpool.Task = new taskpool.Task(addition, 300);
        let task4: taskpool.Task = new taskpool.Task(addition, 400);
        let task5: taskpool.Task = new taskpool.Task(addition, 500);
        let task6: taskpool.Task = new taskpool.Task(addition, 600);
        let task7: taskpool.Task = new taskpool.Task(addition, 700);
        let task8: taskpool.Task = new taskpool.Task(addition, 800);
        let task9: taskpool.Task = new taskpool.Task(addition, 900);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let runner3: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let start: number = new Date().getTime();
        runner1.execute(task1).then((res: Object) => {
          flag1 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task1 done.`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task1 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner1.execute(task2).then((res: Object) => {
          flag2 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task2 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task2 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner1.execute(task7).then((res: Object) => {
          flag7 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task7 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task7 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner2.execute(task3).then((res: Object) => {
          flag3 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task3 done.`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task3 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner2.execute(task4).then((res: Object) => {
          flag4 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task4 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task4 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner1.execute(task8).then((res: Object) => {
          flag8 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task8 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task2 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner3.execute(task5).then((res: Object) => {
          flag5 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task5 done.`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task5 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner3.execute(task6).then((res: Object) => {
          flag6 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task6 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task6 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        runner1.execute(task9).then((res: Object) => {
          flag9 = true;
          finalNumber.push(res as number);
          console.info(`${caseName}: seqrunner: task9 done`);
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: task9 catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        while (!(flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7 && flag8 && flag9)) {
          await promiseCase();
        }
        let time: number = new Date().getTime() - start;
        console.info(`${caseName}: time: ${time}`);
        expect(time).assertLargerOrEqual(500);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4100
     * @tc.name      : testTaskpoolSequenceRunnerConstructor003
     * @tc.desc      : Set the copy list for the task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunnerConstructor003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolSequenceRunnerConstructor003';
      console.info(`${caseName} test start`);
      try {
        let num: number = 0;
        let taskSRArray: taskpool.SequenceRunner[] = [];
        let taskArray: taskpool.Task[] = [];
        let begin: number = Date.now();
        let highTime: number = 0;
        let mediumTime: number = 0;
        let lowTime: number = 0;
        let allCount: number = 300;
        for (let i: number = 0; i < allCount; i++) {
          let taskSR: taskpool.SequenceRunner = new taskpool.SequenceRunner(i % 3);
          taskSRArray.push(taskSR);
        }
        for (let i: number = 0; i < allCount; i++) {
          let task: taskpool.Task = new taskpool.Task(printTime, 10);
          taskArray.push(task);
        }
        for (let i: number = 0; i < allCount; i++) {
          taskSRArray[i].execute(taskArray[i]).then((res: Object) => {
            console.info(`${caseName}: result: ${i % 3}`);
            num++;
            if (i % 3 == 0) {
              highTime = Date.now() - begin;
            }
            if (i % 3 == 1) {
              mediumTime = Date.now() - begin;
            }
            if (i % 3 == 2) {
              lowTime = Date.now() - begin;
            }
          });
        }
        while (!(num == allCount)) {
          await promiseCase();
        }
        console.info(`${caseName} time:---${lowTime}--${mediumTime}--${highTime}`);
        expect(lowTime > mediumTime && mediumTime > highTime).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4200
     * @tc.name      : testTaskpoolSequenceRunnerExecute001
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunnerExecute001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolSequenceRunnerExecute001';
      console.info(`${caseName} test start`);
      try {
        let finalNumber: number[] = [];
        let isTerminate1: boolean = false;
        let isTerminate3: boolean = false;
        let isTerminate4: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(printArgs, 10);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 20);
        let task3: taskpool.Task = new taskpool.Task(throwError);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 40);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner1.execute(task1).then((res: Object) => {
          console.info(`${caseName}: res: ${JSON.stringify(res)}`);
          console.info(`${caseName}: task1 done.`);
          isTerminate1 = true;
          finalNumber.push(res as number);
        });
        taskpool.execute(task2).then((res: Object) => {
          console.info(`${caseName}: res${JSON.stringify(res)}`);
          console.info(`${caseName}: task2 done`);
          finalNumber.push(res as number);
        }).catch((error: BusinessError) => {
          console.info(`${caseName} task2 error -> ${JSON.stringify(error)}`);
          expect(error).not().assertNull();
        })
        taskpool.cancel(task2);
        runner1.execute(task3).then((res: Object) => {
          console.info(`${caseName}: res${JSON.stringify(res)}`);
          console.info(`${caseName}: task3 done.`);
          isTerminate3 = true;
          expect(res.toString()).assertEqual('null');
        });
        runner1.execute(task4).then((res: Object) => {
          console.info(`${caseName}: res${JSON.stringify(res)}`);
          console.info(`${caseName}: task4 done.`);
          isTerminate4 = true;
          finalNumber.push(res as number);
        });
        while (!(isTerminate1 && isTerminate3 && isTerminate4)) {
          await promiseCase();
        }
        expect(finalNumber).assertDeepEquals([10, 40]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4300
     * @tc.name      : testTaskpoolState002
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolState002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolState002';
      console.info(`${caseName} test start`);
      try {
        let testTask1: taskpool.Task = new taskpool.Task(printLang, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printLang, 200);
        let testTask3: taskpool.Task = new taskpool.Task(printLang, 300);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
        });
        taskpool.cancel(testTask1);
        taskpool.execute(testTask2).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
        });
        taskpool.cancel(testTask2);
        taskpool.execute(testTask3).then((res: Object) => {
          console.info(`${caseName}: testTask3 return value: ${JSON.stringify(res)}`);
        });
        taskpool.cancel(testTask3);
        console.info(`${caseName}:state4: ${JSON.stringify(taskpool.getTaskPoolInfo().taskInfos[0].state)}`);
        expect((taskpool.getTaskPoolInfo().taskInfos[0].state) == 3).assertTrue();
        await promiseCase();
        console.info(`${caseName}: state1: ${JSON.stringify(taskpool.getTaskPoolInfo()
          .taskInfos[0]
          .state)} ${JSON.stringify(taskpool.Task.isCanceled())}`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4400
     * @tc.name      : testTaskpoolError001
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError001';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, test1);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner1.execute(task1).then((res: Object) => {
          console.info(`${caseName}: testSequenceRunnerExecute004: task1 done.`);
        });
        await promiseCase();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
        expect(error.message)
          .assertContain("An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4500
     * @tc.name      : testTaskpoolError002
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError002';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, test1);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
        });
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
        expect(error.message)
          .assertContain("An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4600
     * @tc.name      : testTaskpoolError003
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError003', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);
        let buffer2: ArrayBuffer = new ArrayBuffer(4);
        let view2: Uint8Array = new Uint8Array(buffer2);
        let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        let task2: taskpool.Task = new taskpool.Task(testTransfer, view1, view2);
        console.info(`view.buffer be  ${view.buffer}`);
        task1.setTransferList([view.buffer, view1.buffer]);
        console.info(`view.buffer al  ${view.buffer}`);
        task2.setTransferList([view1.buffer, view2.buffer]);
        taskpool.execute(task1).then((res: Object) => {
          isTerminate1 = true;
        });
        taskpool.execute(task2).then((res: Object) => {
          isTerminate2 = true;
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
        expect(error.message)
          .assertContain("An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4700
     * @tc.name      : testTaskpoolError004
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError004', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError004';
      console.info(`${caseName} test start`);
      try {
        let taskConstructor1: taskpool.Task = new taskpool.Task(printArgs, test1);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
        });
        await promiseCase();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
        expect(error.message)
          .assertContain("An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4800
     * @tc.name      : testTaskpoolError005
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError005', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError005';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(noConcurrent, 200);
        taskpool.execute(task1).then((res: Object) => {
          console.info(`${caseName}: gsegs result: ${JSON.stringify(res)}`);
        });
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
        expect(error.message)
          .assertContain('The function is not marked as concurrent, taskpool: failed to serialize function.');
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4900
     * @tc.name      : testTaskpoolError006
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError006', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError006';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let taskConstructor1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor1.addTask(noConcurrent, 12);
        taskConstructor1.addTask(noConcurrent, 22);
        taskConstructor1.addTask(noConcurrent, 32);
        let taskConstructor2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskConstructor2.addTask(addOne, 42);
        taskConstructor2.addTask(addOne, 52);
        taskConstructor2.addTask(addOne, 62);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        while (isTerminate1 && isTerminate2) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
        expect(error.message)
          .assertContain("The function is not marked as concurrent, taskpool: failed to serialize function.");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5000
     * @tc.name      : testTaskpoolError007
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError007', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError007';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400);
        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.cancel(task4);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200015);
        expect(error.message).assertContain("The task to cancel does not exist");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5100
     * @tc.name      : testTaskpoolError008
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError008', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError008';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let taskConstructor1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskConstructor2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let taskConstructor3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res).assertEqual(100);
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
          expect(res).assertEqual(200);
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
          expect(res).assertEqual(300);
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
        taskpool.cancel(taskConstructor1);
        taskpool.cancel(taskConstructor2);
        taskpool.cancel(taskConstructor3);
        expect(taskpool.Task.isCanceled() == false).assertTrue();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200015);
        expect(error.message).assertContain('The task to cancel does not exist');
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5200
     * @tc.name      : testTaskpoolError009
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError009', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError009';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(mathRound, 10.5);
        let task2: taskpool.Task = new taskpool.Task(mathRound, 20.8);
        let task3: taskpool.Task = new taskpool.Task(mathRound, 30.4);
        taskpool.executeDelayed(1000, task1).then(((res: Object) => {
          console.info(`${caseName}: task1 return value: ${JSON.stringify(res)}`);
        }));
        taskpool.executeDelayed(1000, task2).then(((res: Object) => {
          console.info(`${caseName}: task2 return value: ${JSON.stringify(res)}`);
        }));
        taskpool.executeDelayed(-1000, task3).then(((res: Object) => {
          console.info(`${caseName}: task3 return value: ${JSON.stringify(res)}`);
        }));
        await promiseCase();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200028);
        expect(error.message).assertContain("The delayTime is less than zero");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5300
     * @tc.name      : testTaskpoolError010
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError010', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError010';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);
        let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        task1.setTransferList([view.buffer, view1.buffer]);
        task1.setCloneList([buffer1]);
        console.info(`buffer   ${buffer}`);
        taskpool.execute(task1).then((res: Object) => {
          isTerminate1 = true;
          expect(res).assertEqual(24);
          console.info(`buffer   ${buffer}`);
        });
        while (!(isTerminate1)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200029);
        expect(error.message).assertContain("An ArrayBuffer cannot be set as both a transfer list and a clone list");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5400
     * @tc.name      : testTaskpoolError011
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError011', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError011';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let taskConstructor1: taskpool.Task = new taskpool.Task(add, 1, 5);
        let taskConstructor2: taskpool.Task = new taskpool.Task(add, 2, 5);
        let taskConstructor3: taskpool.Task = new taskpool.Task(add, 3, 5);
        taskConstructor1.removeDependency(taskConstructor2);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(taskConstructor2).then((res: Object) => {
          console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        taskpool.execute(taskConstructor3).then((res: Object) => {
          console.info(`${caseName}: taskConstructor3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
        });
        while (!(isTerminate1 && isTerminate2 && isTerminate3)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(10200027);
        expect(error.message).assertContain("The dependency does not exist");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5500
     * @tc.name      : testTaskpoolError012
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError012', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError012';
      console.info(`${caseName} test start`);
      try {
        let result1: number | string = 0;
        let result2: number | string = '';
        let flag: boolean = false;
        let taskConstructor1: taskpool.Task = new taskpool.Task(sendDataCatch, 1);
        taskpool.execute(taskConstructor1).then((res: Object) => {
          result1 = ((res as (number | string)[])[0]);
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)} `);
          console.info(`${caseName}: taskConstructor1 return value:  ${(res as (number | string)[])[0]}`);
          console.info(`${caseName}: taskConstructor1 return value:  ${(res as (number | string)[])[1]}`);
          result2 = ((res as (number | string)[])[1]);
          flag = true;
        });
        while (!(flag)) {
          await promiseCase();
        }
        console.info(`${caseName}: result1,2:  ${result1}; ${result2}`);
        expect(result1).assertEqual(10200024);
        expect(result2).assertContain("The callback is not registered on the host side");
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200024);
        expect(error.message).assertContain("The callback is not registered on the host side");
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_5600
     * @tc.name      : testTaskpoolError013
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTaskpoolError013', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolError013';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskConstructor1: taskpool.Task = new taskpool.Task(sendDataFun, 5);
        taskConstructor1.onReceiveData((res: Object) => {
          console.info(`${caseName}: taskConstructor1 onReceiveData value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(taskConstructor1).then((res: Object) => {
          console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
        });
        while (!isTerminate1) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200023);
        expect(error.message).assertContain("The function is not called in the concurrent function");
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1400
     * @tc.name      : testTaskpoolGetTaskPoolInfo002
     * @tc.desc      : Obtain the internal information of the task pool, including thread information and task information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolGetTaskPoolInfo002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolGetTaskPoolInfo002';
      console.info(`${caseName} test start`);
      try {
        let allCount: number = 300;
        for (let i: number = 0; i < allCount; i++) {
          let task1: taskpool.Task = new taskpool.Task(additionF);
          let task2: taskpool.Task = new taskpool.Task(additionF);
          let task3: taskpool.Task = new taskpool.Task(additionF);
          taskpool.execute(task1, taskpool.Priority.LOW).then(() => {
          }).catch((error: Error) => {
            console.info(`${caseName}: low task error: ${error}`);
          });
          taskpool.execute(task2, taskpool.Priority.MEDIUM).then(() => {
          }).catch((error: Error) => {
            console.info(`${caseName}: medium task error: ${error}`);
          });
          taskpool.execute(task3, taskpool.Priority.HIGH).then(() => {
          }).catch((error: Error) => {
            console.info(`${caseName}: high task error: ${error}`);
          });
        }
        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 1000) {
          continue;
        }
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let tid: number = 0;
        let taskIds: number[] = [];
        let priority: number = 0;
        let taskId: number = 0;
        let state: number = 0;
        let duration: number = 0;
        let threadIS: taskpool.ThreadInfo[] = Array.from(taskpoolInfo.threadInfos);
        for (let threadInfo of threadIS) {
          tid += threadInfo.tid;
          if (threadInfo.taskIds != undefined && threadInfo.priority != undefined) {
            taskIds.length = threadInfo.taskIds.length;
            priority = threadInfo.priority;
          }
          console.info(`${caseName}: threadInfothreadInfo: ${threadInfo}`);
        }

        let taskIS: taskpool.TaskInfo[] = Array.from(taskpoolInfo.taskInfos);
        for (let taskInfo of taskIS) {
          console.info(`${caseName}: taskIdtaskIdtaskId: ${taskInfo}`);
          taskId = taskInfo.taskId;
          state = taskInfo.state;
          if (taskInfo.duration != undefined) {
            duration = taskInfo.duration;
          }
        }
        console.info(`${caseName}: task duration is: ${duration}`);
        expect(tid != 0).assertTrue();
        expect(taskIds.length != 0).assertTrue();
        expect(priority != -1).assertTrue();
        expect(taskId != 0).assertTrue();
        expect(state != 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

  });
}