/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
} from '../../../hypium/index';

function simpleCallback() {
}

function printLog(): void {
}

function onReceiveData004(callback: () => void) {
}

function onExecutionSucceeded001(error: Error): void {
}

function task004(): string {
  return '20';
}

function task002(args: int): String {
  return args.toString();
}

function onReceiveData001(): void {
}

function onReceiveData006(data: number): number {
  let res: number = data * 10;
  taskpool.Task.sendData(res);
  return data;
}

function taskSendData001(arg: string): string {
  taskpool.Task.sendData(arg);
  executedFlag = true;
  return arg;
}

function onReceiveData002(id: string): string | null | undefined {
  if (id === "valid") {
    return "Found Item";
  } else if (id === "invalid") {
    return null;
  }
  return undefined;
}

function taskSendData002(arg: BigInt): void {
  let temPromise = new Promise<BigInt>((res) => {
    res(arg)
  });
  taskpool.Task.sendData(temPromise);
}

function taskSendData003(arg: Function): void {
  taskpool.Task.sendData(arg);
}

function onReceiveData003(params: string): void {
}

function testString(args: string): Promise<number> {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      const randomNumber: number = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  });
}

let executedFlag = false

export default function taskTest() {
  describe("taskTest", () => {
    /**
     * @tc.number SUB_TASK_TEST_0100
     * @tc.name TaskTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest001';
        console.info(`${TAG} test start`);
        let result: number = 101;
        let task: taskpool.Task = new taskpool.Task(testString, "hello");
        try {
          let temp = await taskpool.execute(task);
          result = temp as number
          expect(result < 100).assertTrue();
          let Fun = task.taskFunction;
          expect(await (Fun.unsafeCall() as Promise<number>) < 100).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_0200
     * @tc.name TaskTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest002';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task002, 22);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as string).assertEqual('22');
            let arguments = task.arguments;
            expect(arguments?.length).assertEqual(1);
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_0300
     * @tc.name TaskTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest003';
      console.info(`${TAG} test start`);
      try {
        let taskName: string = "taskName";
        let task: taskpool.Task = new taskpool.Task(taskName, task002, 20);
        let name = task.name as string;
        expect(String(name)).assertEqual('taskName');
        await taskpool.execute(task).then((value: Any) => {
          expect(value as string).assertEqual('20');
        });
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_0400
     * @tc.name TaskTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest004';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task004);
          let totalDuration: Number = task.totalDuration;
          expect(totalDuration >= 0).assertEqual(true);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as string).assertEqual('20');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_0500
     * @tc.name TaskTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest005';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task004);
          let ioDuration: Number = task.ioDuration;
          expect(ioDuration >= 0).assertEqual(true);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as string).assertEqual('20');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_0600
     * @tc.name TaskTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest006';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task004);
          let cpuDuration: Number = task.cpuDuration;
          expect(cpuDuration >= 0).assertEqual(true);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as string).assertEqual('20');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_0700
     * @tc.name TaskTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest007';
        console.info(`${TAG} test start`);
        let result: number = 101;
        let task: taskpool.Task = new taskpool.Task(testString, "hello");
        try {
          let temp = await taskpool.execute(task);
          result = temp as number;
          expect(result < 100).assertTrue();
          let Fun = task.taskFunction as Object;
          ;
          expect(Fun != 0).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_0800
     * @tc.name TaskTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest008';
        console.info(`${TAG} test start`);
        let arguments: number = 0;
        let result: number = 101;
        let task: taskpool.Task = new taskpool.Task(testString, "hello");
        let temp = await taskpool.execute(task)
        try {
          result = temp as number
          expect(result < 100).assertTrue();
          let args = task.arguments;
          expect(args?.length != 0).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_0900
     * @tc.name TaskTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest009';
      console.info(`${TAG} test start`);
      try {
        let taskName: string = "taskName";
        let task: taskpool.Task = new taskpool.Task(taskName, task002, 20);
        taskpool.execute(task).then((value: Any) => {
          expect(value as string).assertEqual('20');
          let name = task.name as string;
          expect(String(name)).assertEqual(taskName);
        });
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_1000
     * @tc.name TaskTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest010';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task004);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as string).assertEqual('20');
            let totalDuration: Number = task.totalDuration;
            expect(totalDuration >= 0).assertEqual(true);
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_1100
     * @tc.name TaskTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest011';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(task004);
          await taskpool.execute(task).then((value:Any) => {
            let cpuDuration: Number = task.cpuDuration;
            expect(cpuDuration >= 0).assertEqual(true);
            expect(value as string).assertEqual('20');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_1200
     * @tc.name TaskTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest012';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(taskSendData001, 'test');
          task.onReceiveData(printLog);
          await taskpool.execute(task).then((value:Any) => {
            expect(value as string).assertEqual('test');
            expect(executedFlag).assertEqual(true);
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_1300
     * @tc.name TaskTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest013';
        console.info(`${TAG} test start`);
        let taskValue: boolean = false;
        try {
          let task: taskpool.Task = new taskpool.Task(taskSendData002, 2n);
          task.onReceiveData(printLog);
          await taskpool.execute(task).then((value:Any) => {
            taskValue = true;
          });
          expect(taskValue).assertTrue();
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_1400
     * @tc.name TaskTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest014';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(taskSendData003, () => {
            return 'hi';
          });
          task.onReceiveData(printLog);
          await taskpool.execute(task).then((value:Any) => {
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_1500
     * @tc.name TaskTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest015';
        console.info(`${TAG} test start`);
        let taskFlag = false;
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData001);
          task.onReceiveData(printLog);
          await taskpool.execute(task).then((value:Any) => {
            taskFlag = true;
          });
          expect(taskFlag).assertEqual(true);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_TASK_TEST_1600
     * @tc.name TaskTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest016';
        let taskFlag: boolean = false;
        console.info(`${TAG} test start`);
        try {
          let task = new taskpool.Task(onReceiveData006, Number(1));
          task.onReceiveData(() => {
            taskFlag = true;
          });
          await taskpool.execute(task).then((value:Any) => {
            expect(taskFlag).assertEqual(true);
            expect(value as number).assertEqual(1);
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_1700
     * @tc.name TaskTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest017';
        let taskValue: number = 0;
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData006, Number(1));
          task.onReceiveData((data:number) => {
            taskValue = data;
          });
          await taskpool.execute(task).then((value:Any) => {
            expect(taskValue).assertEqual(10);
            expect(value as number).assertEqual(1);
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_1800
     * @tc.name TaskTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest018';
        console.info(`${TAG} test start`);
        let taskValue: number = 0;
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData006, Number(1));
          task.onReceiveData((data: number): Any => {
            taskValue = data + 1;
            return null;
          });
          await taskpool.execute(task).then((value)=> {
            expect(value).assertEqual(1);
          });
          expect(taskValue).assertEqual(11);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_1900
     * @tc.name TaskTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest019';
        console.info(`${TAG} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData001);
          task.onEnqueued(() => {
          });
          await taskpool.execute(task).then((res:Any) => {
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_2000
     * @tc.name TaskTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("TaskTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskTest020';
        console.info(`${TAG} test start`);
        let taskFlag = false;
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData004, simpleCallback);
          task.onEnqueued(() => {
          });
          await taskpool.execute(task).then((res:Any) => {
            taskFlag = true;
          });
          expect(taskFlag).assertEqual(true);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASK_TEST_2100
     * @tc.name TaskTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest021';
      console.info(`${TAG} test start`);
      let taskFlag = false;
      try {
        let task: taskpool.Task = new taskpool.Task(onReceiveData001);
        task.onStartExecution(() => {
        });
        await taskpool.execute(task).then((value:Any) => {
          taskFlag = true;
        });
        expect(taskFlag).assertEqual(true);
      } catch (error) {
        error = error as Error;
        console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_2200
     * @tc.name TaskTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest022';
      console.info(`${TAG} test start`);
      let taskFlag = false;
      try {
        let task: taskpool.Task = new taskpool.Task(onReceiveData004, simpleCallback);
        task.onStartExecution(() => {
        });
        await taskpool.execute(task).then((res:Any) => {
          taskFlag = true;
        });
        expect(taskFlag).assertEqual(true);
      } catch (error) {
        error = error as Error;
        console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`)
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_2300
     * @tc.name TaskTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest023';
      console.info(`${TAG} test start`);
      let taskFlag = false;
      try {
        const testError = new Error('Task Execution Failed');
        let task: taskpool.Task = new taskpool.Task(onExecutionSucceeded001, testError);
        task.onExecutionFailed((e: Error) => {
        })
        await taskpool.execute(task).then((value:Any) => {
          taskFlag = true;
        });
        expect(taskFlag).assertEqual(true);
      } catch (error) {
        error = error as Error;
        console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_2400
     * @tc.name TaskTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest024';
      console.info(`${TAG} test start`);
      let taskFlag = false;
      try {
        let task: taskpool.Task = new taskpool.Task(onReceiveData001);
        task.onExecutionSucceeded(() => {
        });
        await taskpool.execute(task).then((value:Any) => {
          taskFlag = true;
        });
        expect(taskFlag).assertEqual(true);
      } catch (error) {
        error = error as Error;
        console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_TASK_TEST_2500
     * @tc.name TaskTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TaskTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TaskTest025';
      console.info(`${TAG} test start`);
      let taskFlag = false;
      try {
        let task: taskpool.Task = new taskpool.Task(onReceiveData004, simpleCallback);
        task.onExecutionSucceeded(() => {
        });
        await taskpool.execute(task).then((value:Any) => {
          taskFlag = true;
        });
        expect(taskFlag).assertEqual(true);
      } catch (error) {
        error = error as Error;
        console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });
  })
}