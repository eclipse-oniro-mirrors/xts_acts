/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArkTSUtils, collections, HashMap, JSON, lang, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import { delay, getTaskStateByTaskName } from '../utils/taskPoolCommon';
import { inspectStatus, additionDelay, printArgs } from '../utils/taskPoolTask';

import { testTransfer, Concurrent } from '../utils/taskPool';
import { Sleep } from '../utils/utils';

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

interface Person {
  name: string;
  age: number;
}


@Concurrent
function printNum(args: number): number {
  console.info("printNum: " + args);
  return args;
}

function printNumNoConcurrent(args: number): number {
  console.info("printNum: " + args);
  return args;
}

@Concurrent
function sendDataParameters(num: number): number {
  taskpool.Task.sendData(num);
  return num;
}

@Concurrent
function sendDataNoSerialize(num: number): number {
  taskpool.Task.sendData(() => {
  });
  return num;
}

@Concurrent
function sendDataSetTime(num: number): number {
  let res: number = 0;
  setTimeout(() => {
    try {
      taskpool.Task.sendData(1);
    } catch (e) {
      console.info(`testTaskErrorCode0005 catch error: code => ${e.code} message => ${e.message}`);
      res = e.code
    }
  }, 100)
  return res;
}

function printLog(data: number): void {
  sendDataSetTime(data);
}

function test1(): void {

}

@Concurrent
function test2(args: number) {
  let t = Date.now()
  while ((Date.now() - t) < 100) {
    continue;
  }
  let hashMap1: HashMap<string, number> = new HashMap();
  hashMap1.set('a', args);
  return hashMap1;
}

@Concurrent
function printStr(args: string): string {
  console.info("printNum: " + args);
  return args;
}


function printStrNo(args: string): string {
  console.info("printNum: " + args);
  return args;
}

@Concurrent
function printTask(args: taskpool.Task): taskpool.Task {
  console.info("printNum: " + args);
  return args;
}

export default function TaskPoolErrorCodeTest() {
  describe('TaskPoolErrorCodeTest', () => {
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0100
     * @tc.name      : testTaskErrorCode0001
     * @tc.desc      : Task constructor 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNumNoConcurrent, 100);
        taskpool.execute(task).then(() => {
          console.info("Taskpool: constructor 10200014 fail");
        });
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0200
     * @tc.name      : testTaskErrorCode0002
     * @tc.desc      : Task constructor11+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0002';
      console.info(`${caseName} test start`);
      try {
        let taskName: string = "taskName";
        let task: taskpool.Task = new taskpool.Task(taskName, printNumNoConcurrent, 100);
        let name: string = task.name;
        taskpool.execute(task).then(() => {
          console.info("Taskpool: constructor11 10200014 fail");
        });
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0300
     * @tc.name      : testTaskErrorCode0003
     * @tc.desc      : Task sendData 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataParameters, test1);
        task.onReceiveData((data: number) => {
          console.info(`${caseName} onReceiveData res : ` + data);
        });
        await taskpool.execute(task).then(() => {
          console.info("Taskpool: sendData 10200006 fail");
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0400
     * @tc.name      : testTaskErrorCode0004
     * @tc.desc      : Task sendData 10200022.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0004';
      console.info(`${caseName} test start`);
      let num = 0;
      let task: taskpool.Task = new taskpool.Task(printNum, 100);
      task.onReceiveData((data: number) => {
        console.info(`${caseName} onReceiveData res : ` + data);
      });
      await taskpool.execute(task).then(() => {
        console.info("Taskpool: sendData 10200022 fail");
      });
      try {
        taskpool.Task.sendData(4);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200022);
      }
      await promiseCase()
      console.info(`${caseName} catch error: code => ${num}`);
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0500
     * @tc.name      : testTaskErrorCode0005
     * @tc.desc      : Task sendData 10200023.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0005';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataSetTime, 100);
        task.onReceiveData(printLog);
        taskpool.execute(task).then(() => {
          console.info("Taskpool: sendData 10200023 code");
        }).catch((error: BusinessError) => {
          console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        });
        await Sleep(3000)
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200023);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0600
     * @tc.name      : testTaskErrorCode0006
     * @tc.desc      : Task transferList 10200029.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0006';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);
        let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        task1.setCloneList([buffer1]);
        task1.setTransferList([view.buffer, view1.buffer]);
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
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0700
     * @tc.name      : testTaskErrorCode0007
     * @tc.desc      : Task addDependency 10200026.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0007';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        task1.addDependency(task2);
        task2.addDependency(task3);
        task3.addDependency(task1);
        console.info("dependency: add dependency end");

        console.info("dependency: start execute second")
        taskpool.execute(task1).then(() => {
          console.info("dependency: second task1 success");
        })
        taskpool.execute(task2).then(() => {
          console.info("dependency: second task2 success");
        })
        taskpool.execute(task3).then(() => {
          console.info("dependency: second task3 success");
        })
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200026);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0800
     * @tc.name      : testTaskErrorCode0008
     * @tc.desc      : Task addDependency 10200052.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0008';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printNum, 100); // 100: test number
        taskpool.executePeriodically(1000, task1); // 1000: period is 1000ms
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        console.info("dependency: add dependency end");
        console.info("dependency: start execute second")
        taskpool.execute(task1).then(() => {
          console.info("dependency: second task1 success");
        })
        taskpool.execute(task2).then(() => {
          console.info("dependency: second task2 success");
        })
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200052);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0900
     * @tc.name      : testTaskErrorCode0009
     * @tc.desc      : Task addDependency 10200056.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0009';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task1).then(() => {
          console.info("asyncRunner: task" + " done.");
        }).catch((e: BusinessError) => {
          console.info("asyncRunner: task" + " error." + e.code + "-" + e.message);
        });
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200056);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1000
     * @tc.name      : testTaskErrorCode0010
     * @tc.desc      : Task addDependency 10200027
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0010';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        task1.removeDependency(task2);
        console.info("dependency: start execute second")
        taskpool.execute(task1).then(() => {
          console.info("dependency: second task1 success");
        })
        taskpool.execute(task2).then(() => {
          console.info("dependency: second task2 success");
        })
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200027);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1100
     * @tc.name      : testTaskErrorCode0011
     * @tc.desc      : Task addDependency 10200052.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0011';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printNum, 100); // 100: test number
        taskpool.executePeriodically(1000, task1); // 1000: period is 1000ms
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        task1.removeDependency(task2);
        console.info("dependency: start execute second")
        taskpool.execute(task1).then(() => {
          console.info("dependency: second task1 success");
        })
        taskpool.execute(task2).then(() => {
          console.info("dependency: second task2 success");
        })
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200052);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1200
     * @tc.name      : testTaskErrorCode0012
     * @tc.desc      : Task addDependency 10200056.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0012';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task1).then(() => {
          console.info("asyncRunner: task" + " done.");
        }).catch((e: BusinessError) => {
          console.info("asyncRunner: task" + " error." + e.code + "-" + e.message);
        });
        let task2: taskpool.Task = new taskpool.Task(delay, 100);
        task1.addDependency(task2);
        task1.removeDependency(task2);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200056);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1300
     * @tc.name      : testTaskErrorCode0013
     * @tc.desc      : Task onEnqueued 10200034.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0013';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        taskpool.execute(task).then(() => {
          console.info("taskpool: execute task success")
        });
        task.onEnqueued(() => {
          console.info("taskpool: onEnqueued")
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1400
     * @tc.name      : testTaskErrorCode0014
     * @tc.desc      : Task onEnqueued 10200034.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0014';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        taskpool.execute(task).then(() => {
          console.info("taskpool: execute task success")
        });
        task.onEnqueued(() => {
          console.info("taskpool: onEnqueued")
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1500
     * @tc.name      : testTaskErrorCode0015
     * @tc.desc      : Task onStartExecution 10200034.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0015';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        taskpool.execute(task).then(() => {
          console.info("taskpool: execute task success")
        });
        task.onStartExecution(() => {
          console.info("taskpool: onStartExecution")
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1600
     * @tc.name      : testTaskErrorCode0016
     * @tc.desc      : Task onExecutionFailed 10200034.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0016';
      console.info(`${caseName} test start`);
      try {
        let task2 = new taskpool.Task(test2, 1);
        taskpool.execute(task2).then(() => {
          console.info("taskpool: execute task success")
        }).catch((e: BusinessError) => {
          console.error(`taskpool: error code: ${e.code}, error info: ${e.message}`);
        })
        task2.onExecutionFailed((e: Error) => {
          console.info("taskpool: onExecutionFailed error is " + e);
        })
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1700
     * @tc.name      : testTaskErrorCode0017
     * @tc.desc      : Task onStartExecution 10200034.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0017';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        taskpool.execute(task).then(() => {
          console.info("taskpool: execute task success")
        });
        task.onExecutionSucceeded(() => {
          console.info("taskpool: onExecutionSucceeded")
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1800
     * @tc.name      : testTaskErrorCode0018
     * @tc.desc      : TaskGroup addTask 10200014.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0018';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printNumNoConcurrent, 100); // 100: test number
        taskpool.execute(taskGroup).then(() => {
          console.info("taskpool: execute task success")
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_1900
     * @tc.name      : testTaskErrorCode0019
     * @tc.desc      : SequenceRunner execute 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0019';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printNum, test1);
        let task2: taskpool.Task = new taskpool.Task(printNum, test1);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        runner.execute(task2).then(() => {
          console.info("seqrunner: task2 done");
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2000
     * @tc.name      : testTaskErrorCode0020
     * @tc.desc      : SequenceRunner execute 10200025
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0020';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printNum, 100);
        let task2: taskpool.Task = new taskpool.Task(printNum, 200);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        task1.addDependency(task2);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        runner.execute(task2).then(() => {
          console.info("seqrunner: task2 done");
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200025);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2100
     * @tc.name      : testTaskErrorCode0021
     * @tc.desc      : SequenceRunner execute 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0021';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100);
        taskpool.executePeriodically(1000, task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2200
     * @tc.name      : testTaskErrorCode0022
     * @tc.desc      : SequenceRunner execute 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2300
     * @tc.name      : testTaskErrorCode0023
     * @tc.desc      : GenericsTask constructor13+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0023';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[string], string>(printStr, "this is my first LongTask");
        let task2: taskpool.Task = new taskpool.GenericsTask<[string], string>(printStrNo, "this is my first LongTask");
        taskpool.execute(task1)
        taskpool.execute(task2)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2400
     * @tc.name      : testTaskErrorCode0024
     * @tc.desc      : GenericsTask constructor13+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0024';
      console.info(`${caseName} test start`);
      try {
        let taskName: string = "taskName";
        let task1: taskpool.Task =
          new taskpool.GenericsTask<[string], string>(taskName, printStr, "this is my first LongTask");
        let task2: taskpool.Task =
          new taskpool.GenericsTask<[string], string>(taskName, printStrNo, "this is my first LongTask");
        let name: string = task2.name;
        taskpool.execute(task1)
        taskpool.execute(task2)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2500
     * @tc.name      : testTaskErrorCode0025
     * @tc.desc      : taskpool execute 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0025';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, test1)
        taskpool.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2600
     * @tc.name      : testTaskErrorCode0026
     * @tc.desc      : taskpool execute 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0026';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNumNoConcurrent, 100)
        taskpool.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2700
     * @tc.name      : testTaskErrorCode0027
     * @tc.desc      : taskpool execute 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0027';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100);
        taskpool.executePeriodically(1000, task);
        taskpool.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2800
     * @tc.name      : testTaskErrorCode0028
     * @tc.desc      : taskpool execute 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0028';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_2900
     * @tc.name      : testTaskErrorCode0029
     * @tc.desc      : taskpool execute13+ 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0029';
      console.info(`${caseName} test start`);
      try {
        let task3: taskpool.Task = new taskpool.Task(printNum, 1000);
        let task1: taskpool.Task = new taskpool.GenericsTask<[taskpool.Task], taskpool.Task>(printTask, task3);
        let task2: taskpool.Task = new taskpool.GenericsTask<[taskpool.Task], taskpool.Task>(printTask, task3);
        taskpool.execute<[number], number>(task1, taskpool.Priority.LOW)
        taskpool.execute<[number], number>(task2, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3000
     * @tc.name      : testTaskErrorCode0030
     * @tc.desc      : taskpool execute13+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0030';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNumNoConcurrent, 100);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNumNoConcurrent, 100);
        taskpool.execute<[number], number>(task1, taskpool.Priority.LOW)
        taskpool.execute<[number], number>(task2, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3100
     * @tc.name      : testTaskErrorCode0031
     * @tc.desc      : taskpool execute13+ 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0031';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        taskpool.executePeriodically<[number], number>(100, task1, taskpool.Priority.LOW)
        taskpool.execute<[number], number>(task1, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3200
     * @tc.name      : testTaskErrorCode0032
     * @tc.desc      : taskpool execute13+ 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0032';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.execute<[number], number>(task1, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3300
     * @tc.name      : testTaskErrorCode0033
     * @tc.desc      : taskpool executeDelayed 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0033';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(printNum, 100)
        let task: taskpool.Task = new taskpool.Task(printTask, task1)
        taskpool.executeDelayed(500, task).catch((error: BusinessError) => {
          console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
          expect(error.code).assertEqual(10200006);
        })
        await Sleep(1500)
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3400
     * @tc.name      : testTaskErrorCode0034
     * @tc.desc      : taskpool executeDelayed 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0034';
      console.info(`${caseName} test start`);
      let num = 0;
      let task: taskpool.Task = new taskpool.Task(printNumNoConcurrent, 100)
      taskpool.executeDelayed(100, task).catch((error: BusinessError) => {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
        num++;
      })
      while (num < 1) {
        await promiseCase();
      }
      await asyncSleep(1000)
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3500
     * @tc.name      : testTaskErrorCode0035
     * @tc.desc      : taskpool executeDelayed 10200028
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0035';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100)
        taskpool.executeDelayed(-100, task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200028);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3600
     * @tc.name      : testTaskErrorCode0036
     * @tc.desc      : taskpool executeDelayed 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0036';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100);
        taskpool.executePeriodically(1000, task);
        taskpool.executeDelayed(100, task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3700
     * @tc.name      : testTaskErrorCode0037
     * @tc.desc      : taskpool executeDelayed 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3800
     * @tc.name      : testTaskErrorCode0038
     * @tc.desc      : taskpool executeDelayed13+ 10200028
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0038';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        taskpool.executeDelayed<[number], number>(-100, task1, taskpool.Priority.LOW)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200028);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_3900
     * @tc.name      : testTaskErrorCode0039
     * @tc.desc      : taskpool executeDelayed13+ 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0039';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        taskpool.executePeriodically<[number], number>(100, task1, taskpool.Priority.LOW)
        taskpool.executeDelayed<[number], number>(100, task1, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4000
     * @tc.name      : testTaskErrorCode0040
     * @tc.desc      : taskpool executeDelayed13+ 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0040';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executeDelayed<[number], number>(100, task1, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4100
     * @tc.name      : testTaskErrorCode0041
     * @tc.desc      : taskpool executePeriodically12+ 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0041';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, test1)
        taskpool.executePeriodically(1000, task);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4200
     * @tc.name      : testTaskErrorCode0042
     * @tc.desc      : taskpool executePeriodically12+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0042';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNumNoConcurrent, 100)
        taskpool.executePeriodically(100, task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4300
     * @tc.name      : testTaskErrorCode0043
     * @tc.desc      : taskpool executePeriodically12+ 10200028
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0043';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100)
        taskpool.executePeriodically(-100, task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200028);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4400
     * @tc.name      : testTaskErrorCode0044
     * @tc.desc      : taskpool executePeriodically12+ 10200050
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0044';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printNum, 100);
        taskpool.execute(task)
        taskpool.executePeriodically(1000, task);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200050);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4500
     * @tc.name      : testTaskErrorCode0045
     * @tc.desc      : taskpool executePeriodically12+ 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4600
     * @tc.name      : testTaskErrorCode0046
     * @tc.desc      : taskpool executePeriodically13+ 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0046';
      console.info(`${caseName} test start`);
      try {
        let task3: taskpool.Task = new taskpool.Task(printNum, 1000);
        let task1: taskpool.Task = new taskpool.GenericsTask<[taskpool.Task], taskpool.Task>(printTask, task3);
        let task2: taskpool.Task = new taskpool.GenericsTask<[taskpool.Task], taskpool.Task>(printTask, task3);
        taskpool.executePeriodically<[number], number>(1000, task1, taskpool.Priority.LOW)
        taskpool.executePeriodically<[number], number>(1000, task2, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4700
     * @tc.name      : testTaskErrorCode0047
     * @tc.desc      : taskpool executePeriodically13+ 10200014
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0047';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNumNoConcurrent, 100);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNumNoConcurrent, 100);
        taskpool.executePeriodically<[number], number>(1000, task1, taskpool.Priority.LOW)
        taskpool.executePeriodically<[number], number>(1000, task2, taskpool.Priority.HIGH)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200014);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4800
     * @tc.name      : testTaskErrorCode0048
     * @tc.desc      : taskpool executePeriodically13+ 10200028
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0048';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        taskpool.executePeriodically<[number], number>(-100, task1, taskpool.Priority.LOW)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200028);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_4900
     * @tc.name      : testTaskErrorCode0049
     * @tc.desc      : taskpool executePeriodically13+ 10200050
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0049';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        taskpool.execute<[number], number>(task1, taskpool.Priority.HIGH)
        taskpool.executePeriodically<[number], number>(100, task1, taskpool.Priority.LOW)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200050);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5000
     * @tc.name      : testTaskErrorCode0050
     * @tc.desc      : taskpool executePeriodically13+ 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0050';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printNum, 100);
        runner.execute(task1).then(() => {
          console.info("seqrunner: task1 done.");
        });
        taskpool.executePeriodically<[number], number>(100, task1, taskpool.Priority.MEDIUM)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5100
     * @tc.name      : testTaskErrorCode0051
     * @tc.desc      : taskpool cancel 10200015
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0051';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(inspectStatus, 100);
        taskpool.cancel(task1);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200015);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5300
     * @tc.name      : testTaskErrorCode0053
     * @tc.desc      : Taskpool cancel10+ 10200018
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0053';
      console.info(`${caseName} test start`);
      try {
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(printArgs, 10);
        taskpool.cancel(taskGroup1);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200018);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5400
     * @tc.name      : testTaskErrorCode0054
     * @tc.desc      : Taskpool cancel16+ 10200015
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0054';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(inspectStatus, 100);
        taskpool.cancel(task1);
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200015);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5600
     * @tc.name      : testTaskErrorCode0056
     * @tc.desc      : AsyncRunner execute16+ 10200006
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0056';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(printNum, test1)
        runner.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200006);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5700
     * @tc.name      : testTaskErrorCode0057
     * @tc.desc      : AsyncRunner execute16+ 10200025
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200025);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5800
     * @tc.name      : testTaskErrorCode0058
     * @tc.desc      : AsyncRunner execute16+ 10200051
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0058';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(printNum, 100)
        taskpool.executePeriodically(1000, task);
        runner.execute(task)
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_5900
     * @tc.name      : testTaskErrorCode0059
     * @tc.desc      : AsyncRunner execute16+ 10200054
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0059';
      console.info(`${caseName} test start`);
      let num = 0;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
      for (let i = 0; i < 30; i++) {
        let task1: taskpool.Task = new taskpool.Task(printNum, 100)
        runner.execute(task1).catch((error: BusinessError) => {
          console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
          num = error.code
        });
      }
      await Sleep(1000)
      expect(num).assertEqual(10200054);
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_6000
     * @tc.name      : testTaskErrorCode0060
     * @tc.desc      : AsyncRunner execute16+ 10200057
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0060';
      console.info(`${caseName} test start`);
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner("runner1", 5, 5);
        let task: taskpool.Task = new taskpool.Task(additionDelay, 1000);
        taskpool.execute(task)
        runner.execute(task).then(() => {
          console.info("seqrunner: task1 done.");
        });
        await promiseCase()
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0061
     * @tc.name      : testTaskErrorCode0061
     * @tc.desc      : Task transferList no param.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0061';
      console.info(`${caseName} test start`);
      let isTerminate1: boolean = false;
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);
      let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
      task1.setTransferList();
      console.info(`buffer   ${buffer}`);
      taskpool.execute(task1).then((res: Object) => {
        isTerminate1 = true;
        expect(res).assertEqual(100);
        console.info(`buffer   ${buffer}`);
      });
      while (!(isTerminate1)) {
        await promiseCase();
      }
      expect(view1.byteLength).assertEqual(16);
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0062
     * @tc.name      : testTaskErrorCode0062
     * @tc.desc      : Task onReceiveData no param
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0062';
      console.info(`${caseName} test start`);
      let task: taskpool.Task = new taskpool.Task(sendDataSetTime, 100);
      task.onReceiveData();
      await taskpool.execute(task).then(() => {
        console.info("Taskpool: sendData 10200023 code");
      }).catch((error: BusinessError) => {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
      });
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0065
     * @tc.name      : testTaskErrorCode0065
     * @tc.desc      : Task addTask no period
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0065';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executePeriodically(1000, task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task)
        taskpool.cancel(task)
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200051);
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ERROR_CODE_0066
     * @tc.name      : testTaskErrorCode0066
     * @tc.desc      : Task addTask no two apis
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskErrorCode0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testTaskErrorCode0066';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
        runner.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task)
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200057);
      }
      console.info(`${caseName} test end`);
      done();
    });
  });
}