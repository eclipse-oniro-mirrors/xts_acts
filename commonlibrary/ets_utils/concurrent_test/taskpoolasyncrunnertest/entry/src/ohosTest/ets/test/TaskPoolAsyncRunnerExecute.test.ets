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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import {
  idCancel,
  printArgs,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  sendData1,
  sendData2,
  testFunc,
  testTransfer
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import { BusinessError } from '@kit.BasicServicesKit';
import { BaseClass } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolAsyncRunnerExecute() {
  describe('TaskPoolAsyncRunnerExecute', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(200);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1001
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0100
     * @tc.desc   test AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count1: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 100);
          runner.execute(task).then((num: object) => {
            count1 = count1 + Number(num);
            console.info('======count1', count1);
          });
          runner.execute(task2).then((num: object) => {
            count2 = count2 + Number(num);
            console.info('======count2', count2);
          });
        }
        while (count1 < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count1);
        expect(10).assertEqual(count2);
        count1 = 0;
        count2 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1001_2
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0200
     * @tc.desc   test AsyncRunner error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1001_2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count3: number = 0;
        let count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1, 100);
          runner.execute(task).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined');
            count3 = count3 + 1;
            console.info('======', count3);
            console.error(`error message error: ${JSON.stringify(error)}`);
          })
          runner.execute(task2).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined');
            count4 = count4 + 1;
            console.info('======', count4);
            console.error(`error message error: ${JSON.stringify(error)}`);
          })
        }
        while (count4 < 10 || count3 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count3);
        expect(10).assertEqual(count4);
        count3 = 0;
        count4 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1002
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0300
     * @tc.desc   test GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count1: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.GenericsTask<[number, number], number>(printArgs2, 1, 100);
          runner.execute(task1).then((num: object) => {
            count1 = count1 + Number(num);
            console.info('======', count1);
          });
          runner.execute(task2).then((num: object) => {
            count2 = count2 + Number(num);
            console.info('======', count2);
          });
        }
        while (count1 < 10 || count2 < 10 ) {
          await sleep(100);
        }
        expect(10).assertEqual(count1);
        expect(10).assertEqual(count2);
        count1 = 0;
        count2 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1002_2
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0400
     * @tc.desc   test GenericsTask error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1002_2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count3: number = 0;
        let count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.GenericsTask<[number, number], number>(printArgs4, 1, 100);
          runner.execute(task1).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined');
            count3 = count3 + 1;
            console.info('======', count3);
            console.error(`error message error: ${JSON.stringify(error)}`);
          })
          runner.execute(task2).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined');
            count4 = count4 + 1;
            console.info('======', count4);
            console.error(`error message error: ${JSON.stringify(error)}`);
          })
        }
        while (count4 < 10 || count3 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count3);
        expect(10).assertEqual(count4);
        count3 = 0;
        count4 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1003
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0500
     * @tc.desc   test AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count1: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task('TaskName1', printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task('TaskName2', printArgs2, 1, 100);
          runner.execute(task1).then((num: object) => {
            count1 = count1 + Number(num);
            console.info('======', count1);
          });
          runner.execute(task2).then((num: object) => {
            count2 = count2 + Number(num);
            console.info('======', count2);
          });
          expect('TaskName1').assertEqual(task1.name);
          expect('TaskName2').assertEqual(task2.name);
        }
        while (count1 < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count1);
        expect(10).assertEqual(count2);
        count1 = 0;
        count2 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1004
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0600
     * @tc.desc   test isCanceled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count1: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 1, 50);
          runner.execute(task).then((num: object) => {
            taskpool.cancel(task)
            count1 = count1 + Number(num);
            console.info('======', count1);
          })
          runner.execute(task2).then((num: object) => {
            count2 = count2 + Number(num);
            taskpool.cancel(task2)
            console.info('======', count2);
          })
        }
        while (count2 < 10 || count1 < 0) {
          await sleep(100);
        }
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(10);
        count1 = 0;
        count2 = 0;
        Done();
      });

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1005
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0700
     * @tc.desc   test taskId isCanceled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count1: number = 0;
        let count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(idCancel, task.taskId, 50);
          runner.execute(task).then((num: object) => { 
           count1++;
          }).catch((e:Error)=>{
            count1++;
            console.info('=====', e.message);
          });
            runner.execute(task2).then(() => {
              count2++;
            }).catch((e:Error)=>{
              count2++;
              console.info('=====', e.message);
            })
        }
        while (count2 < 10 || count1 < 10) {
          await sleep(100);
        }
        expect(count1).assertEqual(10);
        expect(count2).assertEqual(10);
        count1 = 0;
        count2 = 0;
        Done();
      });


    /**
     * @tc.name   taskPoolAsyncRunnerExecute1006
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0800
     * @tc.desc   test setTransferList
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);

        let buffers: ArrayBuffer = new ArrayBuffer(8);
        let views: Uint8Array = new Uint8Array(buffers);
        let buffers1: ArrayBuffer = new ArrayBuffer(16);
        let views1: Uint8Array = new Uint8Array(buffers1);

        console.info('testTransfer view byteLength: ' + view.byteLength);
        console.info('testTransfer view1 byteLength: ' + view1.byteLength);
        console.info('testTransfer views byteLength: ' + views.byteLength);
        console.info('testTransfer views1 byteLength: ' + views1.byteLength);

        expect(8).assertEqual(view.byteLength);
        expect(16).assertEqual(view1.byteLength);
        expect(8).assertEqual(views.byteLength);
        expect(16).assertEqual(views1.byteLength);

        let task: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        task.setTransferList([view.buffer, view1.buffer]);
        let task2: taskpool.Task = new taskpool.Task(testTransfer, views, views1);
        task2.setTransferList([views.buffer, views1.buffer]);

        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 1; i++) {
          runner.execute(task).then((res: Object) => {
            console.info('test result: ' + res);
          }).catch((e: string) => {
            console.error('test catch: ' + e);
          });
          runner.execute(task2).then((res: Object) => {
            console.info('test result: ' + res);
          }).catch((e: string) => {
            console.error('test catch: ' + e);
          })
        }

        while (view.byteLength > 0||view1.byteLength > 0||views.byteLength > 0||views1.byteLength > 0 ) {
          await sleep(100);
        }
        console.info('testTransfer view2 byteLength: ' + view.byteLength);
        console.info('testTransfer view3 byteLength: ' + view1.byteLength);
        console.info('testTransfer view4 byteLength: ' + views.byteLength);
        console.info('testTransfer view5 byteLength: ' + views1.byteLength);
        expect(0).assertEqual(view.byteLength);
        expect(0).assertEqual(view1.byteLength);
        expect(0).assertEqual(views.byteLength);
        expect(0).assertEqual(views1.byteLength);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1007
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_0900
     * @tc.desc   test setCloneList
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let ret1: number = 0;
        let ret2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let baseInstance1: BaseClass = new BaseClass();
          let array1 = new Array<BaseClass>();
          array1.push(baseInstance1);
          let task1 = new taskpool.Task(testFunc, array1, 10);
          task1.setCloneList(array1);

          let baseInstance2: BaseClass = new BaseClass();
          let array2 = new Array<BaseClass>();
          array2.push(baseInstance2);
          let task2 = new taskpool.Task(testFunc, array2, 10);
          task2.setCloneList(array2);

          runner.execute(task1).then((res: Object) => {
            console.info('sendable: task1 res is: ' + res);
            ret1 = res as number;
          }).catch((e: BusinessError) => {
            console.error(`sendable: task1 execute Code is ${e.code}, message is ${e.message}`);
          });
          runner.execute(task2).then((res: Object) => {
            console.info('sendable: task2 res is: ' + res);
            ret2 = res as number;
          }).catch((e: BusinessError) => {
            console.error(`sendable: task2 execute Code is ${e.code}, message is ${e.message}`);
          });
        }

        while (ret1 != 55 || ret2 != 55) {
          await sleep(100);
        }
        expect(55).assertEqual(ret1);
        expect(55).assertEqual(ret2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1008
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1000
     * @tc.desc   test onEnqueued
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let count3: number = 0;
        let count4: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onEnqueued(() => {
            count++;
          });
          task2.onEnqueued(() => {
            count2++;
          });
          runner.execute(task).then((num: object) => {
            count3++;
            console.info('taskpool: execute task success');
          }).catch((e:Error)=>{
            console.info('==========',e.message)
          })

          runner.execute(task2).then((num: object) => {
            count4++
            console.info('taskpool: execute task success');
          }).catch((e:Error)=>{
            console.info('==========',e.message)
          });
        }

        while (count < 10 || count3 < 10 || count4 < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        expect(10).assertEqual(count3);
        expect(10).assertEqual(count4);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1009
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1100
     * @tc.desc   test onEnqueued
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count1: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onEnqueued(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count1++;
            }
          })
          task2.onEnqueued(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          })

          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100);
        }

        expect(10).assertEqual(count1);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1010
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1200
     * @tc.desc   test onStartExecution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let count3: number = 0;
        let count4: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onStartExecution(() => {
            count++;
          });
          task2.onStartExecution(() => {
            count2++;
          });
          runner.execute(task).then((num: object) => {
            count3++;
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then((num: object) => {
            count4++;
            console.info('taskpool: execute task success');
          });
        }

        while (count < 10 || count3< 10 || count4< 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count3);
        expect(10).assertEqual(count);
        expect(10).assertEqual(count4);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1011
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1300
     * @tc.desc   test onStartExecution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let count3: number = 0;
        let count4: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onStartExecution(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count++;
            }
          });
          task2.onStartExecution(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          });
          runner.execute(task).then((num: object) => {
            count3++;
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then((num: object) => {
            count4++;
            console.info('taskpool: execute task success');
          });
        }

        while (count < 10 || count3 < 10 || count4 < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count4);
        expect(10).assertEqual(count);
        expect(10).assertEqual(count3);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1012
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1400
     * @tc.desc   test onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1, 50);
          task.onExecutionFailed(() => {
            count++;
          });
          task2.onExecutionFailed((e: Error) => {
            count2++;
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(20).assertEqual(count + count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1012_2
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1500
     * @tc.desc   test onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1012_2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1, 50);
          task.onExecutionFailed(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count++;
            }
          })
          task2.onExecutionFailed(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(20).assertEqual(count + count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1013
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1600
     * @tc.desc   test onExecutionSucceeded
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onExecutionSucceeded(() => {
            count++;
          });
          task2.onExecutionSucceeded(() => {
            count2++;
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1013_2
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1700
     * @tc.desc   test onExecutionSucceeded
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1013_2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          task.onExecutionSucceeded(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count++;
            }
          })
          task2.onExecutionSucceeded(() => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2++;
            }
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1014
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1800
     * @tc.desc   test onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(sendData1, 1);
          let task2: taskpool.Task = new taskpool.Task(sendData2, 1, 50);
          task.onReceiveData((num: number) => {
            console.info('======num', num);
            count += num;
          });
          task2.onReceiveData((num: number) => {
            count2 += num;
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1014_2
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_1900
     * @tc.desc   test onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1014_2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let count: number = 0;
        let count2: number = 0;
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(sendData1, 1);
          let task2: taskpool.Task = new taskpool.Task(sendData2, 1, 50);
          task.onReceiveData((num: number) => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              console.info('======num', num);
              count += num;
            }
          });
          task2.onReceiveData((num: number) => {
            try {
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              count2 += num;
            }
          })
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
        }
        while (count2 < 10 || count < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(count2);
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1015
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_2000
     * @tc.desc   test isDone
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs2, 1, 50);
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
          while (!task2.isDone() || !task.isDone()) {
            await sleep(100);
          }
          expect(task.isDone()).assertTrue();
          expect(task2.isDone()).assertTrue();
        }
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerExecute1016
     * @tc.number SUB_TASKPOOL_ASYNCRUNNER_EXECUTE_2100
     * @tc.desc   test isDone
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerExecute1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(sendData1, 1);
          let task2: taskpool.Task = new taskpool.Task(sendData2, 1, 50);
          runner.execute(task).then(() => {
            console.info('taskpool: execute task success');
          });
          runner.execute(task2).then(() => {
            console.info('taskpool: execute task success');
          });
          while (!task2.isDone() || !task.isDone()) {
            await sleep(100);
          }
          expect(task.isDone()).assertTrue();
          expect(task2.isDone()).assertTrue();
        }
        Done();
      })
  })
}