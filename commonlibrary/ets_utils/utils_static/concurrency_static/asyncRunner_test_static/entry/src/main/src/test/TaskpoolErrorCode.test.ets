/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';

// import { ArkTSUtils, collections, HashMap, JSON, lang, taskpool } from '@kit.ArkTS';

import { BusinessError } from '@ohos.base';
import { delay, getTaskStateByTaskName } from '../utils/taskPoolCommon';
import { inspectStatus, additionDelay, printArgs } from '../utils/taskPoolTask';

// import { testTransfer, Concurrent } from '../utils/taskPool';
// import { Sleep } from '../utils/utils';

declare class ArkTools {
  static forceFullGC(): void;
}

class Person1 {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name}.`);
  }
}



function promiseCase(): Promise<void> {
  return new Promise<void>((resolve: (v:undefined) => void,reject: (e:Error) => void) => {
    setTimeout(() => {
      resolve(undefined);
    }, 100);
  }).catch((e: Error) => {

  });
}

// //@Concurrent
function printNum(args: number): number {
  console.info("printNum: " + args);
  return args;
}

async function Sleep(time: int): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

interface Person {
  name: string;
  age: number;
}


function test1(): void {

}


export default function TaskPoolErrorCodeTest() {
  describe('TaskPoolErrorCodeTest', () => {

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0900
     * @tc.name testTaskErrorCode0009
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0009';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task1).then(() => {
          console.info("asyncRunner: task" + " done.");
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("asyncRunner: task" + " error." + err.code + "-" + err.message);
        });
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        await promiseCase()
        expect().assertFail();
      } catch (e) {
        console.error(`${caseName} catch error: code =>  message => ${e}`); //e.message

        console.info('testTaskErrorCode0009=====2')
        expect(e.toString()).assertContain('asyncRunnerTask or seqRunnerTask or executedTask cannot addDependency');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1200
     * @tc.name testTaskErrorCode0012
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0012';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task1).then(() => {
          console.info("asyncRunner: task" + " done.");
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("asyncRunner: task" + " error." + err.code + "-" + err.message);
        });
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        // new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        task1.removeDependency(task2);
        await promiseCase()

      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        console.info('testTaskErrorCode0012=====2')
        expect(err.toString()).assertContain('asyncRunnerTask');
        // expect(false).assertEqual(10200056);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2200
     * @tc.name testTaskErrorCode0022
     * @tc.desc test async runner error code SequenceRunner execute 10200057
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0022';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100);
        let runner1: taskpool.AsyncRunner = new taskpool.AsyncRunner(5);
        runner1.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        await promiseCase()

      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0022=====2')
        expect(err.toString()).assertContain('sequenceRunner cannot execute seqRunnerTask or executedTask');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2800
     * @tc.name testTaskErrorCode0028
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0028';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        // taskpool.execute(task)  //execute(task)
        try{
          taskpool.execute(task);
        }catch(e){
          expect(e.message).assertContain('fail_asyncRunner task has been executed');
        };
        await promiseCase()

      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0028=====2')
        expect(err.toString()).assertContain('asyncRunnerTask');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3200
     * @tc.name testTaskErrorCode0032
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0032';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        // let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        let task1: taskpool.Task = new taskpool.Task(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.execute(task1, taskpool.Priority.HIGH).then((value: Any) => {
          console.info(0x0000, "testTag", "taskpool result: " + value);
        });
        await promiseCase()

      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0032=====2')
        expect(err.toString()).assertContain('asyncRunnerTask');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3700
     * @tc.name testTaskErrorCode0037
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0037';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executeDelayed(100, task)
        await promiseCase()
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0037=====2')
        expect(err.toString()).assertContain('asyncRunnerTask cannot executeDelayed outside');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4000
     * @tc.name testTaskErrorCode0040
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0040';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executeDelayed(100, task1, taskpool.Priority.HIGH)//taskpool.executeDelayed<[number], number>
        await promiseCase()
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0040=====2')
        expect(err.toString()).assertContain('asyncRunnerTask cannot executeDelayed outside');
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4500
     * @tc.name testTaskErrorCode0045
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0045';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executePeriodically(100, task)
        await promiseCase()
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0045=====2')
        expect(err.toString()).assertContain('The concurrent task has been executed and cannot be executed periodically');
      }

      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5000
     * @tc.name testTaskErrorCode0050
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0050';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);  //let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executePeriodically(100, task1, taskpool.Priority.MEDIUM)
        await promiseCase()
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
        // expect(false).assertEqual(10200057);
        console.info('testTaskErrorCode0050=====2')
        expect(err.toString()).assertContain('The concurrent task has been executed and cannot be executed periodically');
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5200
     * @tc.name testTaskErrorCode0052
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0052';
      console.info(`${caseName} test start`);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let count = 0;
        let task: taskpool.Task = new taskpool.Task(additionDelay, 100);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
          count++;

          taskpool.cancel(task);
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("asyncRunner: task" + " error." + err.code + "-" + err.message);
          count++;
          // expect(false).assertEqual(10200055);

          console.info('testTaskErrorCode0052=====2',e.message)
          expect(e.toString()).assertContain('asyncRunner task has been executed');
        });
        await promiseCase();
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5500
     * @tc.name testTaskErrorCode0055
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0055';
      console.info(`${caseName} test start`);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let count = 0;
      // for (let i = 0; i < 100; i++) {
        let task: taskpool.Task = new taskpool.Task(inspectStatus, 100);
        runner.execute(task).then(() => {
          console.info(`cancel2 ${caseName} then`);
          count++;
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("asyncRunner: task" + " error." + err.code + "-" + err.message);
          count++;
        });
        try{
          taskpool.cancel(task);  //cancel(task.taskId)
          console.info('testTaskErrorCode0055=====',)
        }catch(e){
          console.info('testTaskErrorCode0055=====2',e.message)
          expect(e.toString()).assertContain('asyncRunner task has been executed');////////////////////////////////////////////////////////////////////
        };
      // }
      // while (count < 100) {
        await promiseCase();
      // }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5600
     * @tc.name testTaskErrorCode0056
     * @tc.desc test async runner error code AsyncRunner execute16+ 10200006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0056';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(printNum, test1)
        console.info('testTaskErrorCode0056=====1')
        runner.execute(task)
        await promiseCase()

        // taskpool.cancel(task);
        // console.info('testTaskErrorCode0056=====',);
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message
         console.info('testTaskErrorCode0056=====2',err)
         expect(err.toString()).assertContain('asyncRunner cannot execute executedTask');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5700
     * @tc.name testTaskErrorCode0057
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0057';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(printNum, 100)
        let task2: taskpool.Task = new taskpool.Task(printNum, 100)
        task1.addDependency(task2)
        runner.execute(task1)
        taskpool.execute(task2)
        await promiseCase()
        expect().assertFail();

        // taskpool.cancel(task1);
        // console.info('testTaskErrorCode0057=====',);
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message

        // expect(false).assertEqual(10200025);
        console.info('testTaskErrorCode0057=====2',err)
        expect(err.toString()).assertContain('taskpool:: asyncRunner dependent task not allowed.');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5800
     * @tc.name testTaskErrorCode0058
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0058';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(printNum, 100)
        taskpool.executePeriodically(1000, task);
        runner.execute(task)
        await promiseCase()
        expect().assertFail()

        // taskpool.cancel(task);
        // console.info('testTaskErrorCode0058=====',);
      } catch (err) {
        console.error(`${caseName} catch error: code =>  message => ${err}`); //err.message

        console.info('testTaskErrorCode0058=====2',err)
        expect(err.toString()).assertContain('asyncRunner cannot execute executedTask');
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5900
     * @tc.name testTaskErrorCode0059
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0059';
      console.info(`${caseName} test start`);
      let num = 0;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
      // for (let i = 0; i < 1; i++) {
      console.info('1=====================testTaskErrorCode0059')
        let task1: taskpool.Task = new taskpool.Task(printNum, 100)
      console.info('2=====================testTaskErrorCode0059')
        runner.execute(task1)
          .catch((e: Error) => {
          console.info('3=====================testTaskErrorCode0059')
          // let err = e as BusinessError;
          // console.info(String(err));
          // console.info('4=====================testTaskErrorCode0059')
          console.info("asyncRunner: task" + " error." + e.code + "-" + e.message);
          num = e.code
        });
      // }
      await Sleep(1000)
      try{
        taskpool.cancel(task1);
      }catch(e){
        console.info('5=====================testTaskErrorCode0059')
        expect(e.message).assertContain('asyncRunner task has been executed');
      };

      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_6000
     * @tc.name testTaskErrorCode0060
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0060';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        taskpool.execute(task)  //execute(task)
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        await promiseCase()
        // expect().assertFail();
      } catch (err) {
        console.info(`${caseName} catch error: code =>  message => ${err.message}`);
         expect(err.message).assertContain('taskpool:: asyncRunner cannot execute executedTask');
         console.info('testTaskErrorCode0060=======')
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_6600
     * @tc.name testTaskErrorCode0066
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0066';
      console.info(`${caseName} test start`);

      let hasExpectedError = false;

      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        runner.execute(task); // 执行后 task 状态变为已执行

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task); //  不允许添加已执行的 Task
      } catch (err) {
        console.info(`${caseName} catch error: ${err}`);
        if (err.toString().indexOf('taskGroup cannot add seqRunnerTask or executedTask') !== -1) {
          hasExpectedError = true;
        }
      }

      expect(hasExpectedError).assertTrue();
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5220
     * @tc.name testTaskErrorCode0052_2
     * @tc.desc test async runner error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0052_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0052_2';
      console.info(`${caseName} test start`);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let count = 0;
      // for (let i = 0; i < 20; i++) {
        let task: taskpool.Task = new taskpool.Task(additionDelay, 100);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
          count++;
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("asyncRunner: task" + " error." + err.code + "-" + err.message);
          count++;
          expect(false).assertEqual(10200055);
        });
        try{
          taskpool.cancel(task);  //cancel(task.taskId)
        }catch(e){
          expect(e.message).assertContain('asyncRunner task has been executed');
        };
      // }
      // while (count < 20) {
      //   await promiseCase();
      // }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_6700
     * @tc.name testTaskErrorCode0067
     * @tc.desc test async runner error code taskpool state waiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTaskErrorCode0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskErrorCode0067';
      console.info(`${caseName} test start`);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let count = 0;
     // for (let i = 0; i < 3; i++) {  //20
        let task: taskpool.Task = new taskpool.Task(additionDelay, 100);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
          count++;
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(String(err));
          console.info("testTaskErrorCode0067 asyncRunner: task" + " error." + err.code + "-" + err.message);
          count++;
          expect(false).assertEqual(10200055);
        });
        try{
          taskpool.cancel(task)
          console.info('testTaskErrorCode0067=====',)
        }catch(e){
          console.info('testTaskErrorCode0067=====2',e.message)
          expect(e.toString()).assertContain('asyncRunner task has been executed');////////////////////////////////////////////////////////////////////
        };
     // }
     //  while (count < 1) {   //20
     //    await promiseCase();
     //  }
      console.info(`${caseName} test end`);
      expect(taskpool.State.WAITING.valueOf()).assertEqual(1);
      done();
    });


  });
}