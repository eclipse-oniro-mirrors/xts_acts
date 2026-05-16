'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';

export function sleep(time: int): Promise<number> {
  return new Promise<number>((re, je): void => {
    setTimeout(() => {
      re(1)
    }, time)
  })
}


export class SendableClass {
  num: number;
  para: undefined;

  constructor(num: number) {
    this.num = num;
  }

  GetNum() {
    return this.num;
  }
}

export function getLongString(): string {
  let res = "";
  let size = 100 * 1024;
  for (let i = 0; i < size; i++) {
    res += "a";
  }
  return res;
}

export function delaySum(value1: int, value2: int, delay: int): int {
  "use concurrent"
  let start = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return value1 + value2;
}

export function loop(): Error | number {
  let start: number = Date.now();
  while (Date.now() - start < 500) {
  }
  if (taskpool.Task.isCanceled()) {
    return 0;
  }
  while (Date.now() - start < 1000) {
  }
  if (taskpool.Task.isCanceled()) {
    throw new Error("this is loop error");
  }
  return 1;
}


export function returnError(delay: int): Error {
  let start: number = Date.now();
  while (Date.now() - start < delay) {
  }
  return new Error("this is return error");
}


export function longString(delay: int): string {
  let start: number = Date.now();
  while (Date.now() - start < delay) {
  }
  return getLongString();
}


export function sendableClassArrFunc(arr: Array<SendableClass>): Array<SendableClass> {
  let start: number = Date.now();
  while (Date.now() - start < 500) {
  }
  if (taskpool.Task.isCanceled()) {
    return arr;
  }
  while (Date.now() - start < 1000) {
  }
  return new Array<SendableClass>();
}

export function printArgs(args: int): number {
  return args;
}

export function cancelById(taskId: int) {
  let start: number = Date.now();
  while (Date.now() - start < 500) {
  }
  taskpool.cancel(taskId);
}

export function fun(args: string): string {
  let t = Date.now();
  while (Date.now() - t < 3000) {
    continue;
  }
  if (taskpool.Task.isCanceled()) {
    args = 'canceled';
    return args;
  }
  return 'finish';
}

export async function promiseNumber(num: int): Promise<int> {

  let t = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
  let p = await new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(num);
    }, 200);
  })
  return p;
}

export default function taskpoolCancelTest() {
  describe('taskpoolCancelTest', () => {
    afterEach(async () => {
      await sleep(50)
    })
    /**
     * @tc.name   TaskPoolTestClass225
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0225
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass225';
      console.info(`${caseName} start`);
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then`);
        str = data as string;
        terminate = true;
      }).catch(() => {
        console.info(`${caseName} catch: cancel success`);
        str = 'cancel success';
        terminate = true;
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 1000);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + str);
      expect(str).assertEqual('canceled');
      done()
    })


    /**
     * @tc.name   TaskPoolTestClass226
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0226
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass226';
      console.info(`${caseName} start`);
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then`);
        str = data as string;
        terminate = true;
      }).catch(() => {
        console.info(`${caseName} catch: cancel success`);
        str = 'cancel success';
        terminate = true;
      });
      let eaw = new EAWorker();
      eaw.start();
      eaw.run<void>(cancelById, task.taskId)
      await eaw.join();
      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + str);
      expect(str).assertEqual('canceled');
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass227
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0227
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass227';
      console.info(`${caseName} start`);
      let result = "";
      let count = 0;
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(task1).then(()=>{
          count++;
        });
        taskpool.execute(task2).then(()=>{
          count++;
        });
        taskpool.execute(task3).then(()=>{
          count++;
        });
        let start: number = new Date().getTime();
        while (count < 3) {
          await sleep(100);
        }
        taskpool.cancel(task1.taskId);
      } catch (e) {
        result = "cancel error";
      }
      console.log(`${caseName} result: ` + result);
      expect(result).assertEqual("cancel error");
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass228
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0228
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass228';
      console.info(`${caseName} start`);
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.executeDelayed(2000, task).then((data: Any) => {
        console.info(`${caseName} then`);
        str = data as string;
        terminate = true;
      }).catch(() => {
        console.info(`${caseName} catch: cancel success`);
        str = 'cancel success';
        terminate = true;
      });
      let eaw = new EAWorker();
      eaw.start();
      eaw.run<void>(cancelById, task.taskId)
      await eaw.join();
      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + str);
      expect(str).assertEqual('canceled');
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass229
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0229
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass229';
      console.info(`${caseName} start`);
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      try {
        taskpool.cancel(task.taskId);
        expect(false).assertFail();
      } catch (e) {
        console.info(`${caseName} catch: cancel fail - ${e}`);
      }
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass230
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0230
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass230';
      console.info(`${caseName} start`);
      let str = 'test';
      let task1 = new taskpool.Task(printArgs, 100);
      let task2 = new taskpool.Task(printArgs, 100);
      let task3 = new taskpool.Task(fun, str);
      let taskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      let terminate = false;
      taskpool.execute(taskGroup).then(() => {
        console.info(`${caseName} then: finish success`);
        str = 'finish success';
        terminate = true;
      }).catch(() => {
        console.info(`${caseName} catch: cancel success`);
        terminate = true;
        str = 'cancel success';
      });
      setTimeout(() => {
        try {
          taskpool.cancel(task3.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 1000);
      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + str);
      expect(str).assertEqual('finish success');
      done()
    })
    /**
     * @tc.name   TaskPoolTestClass237
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0237
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass237';
      console.info(`${caseName} start`);
      let terminate = false;
      let error = "";
      let result: number = -1;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then`);
        result = data as number
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 300);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + result);
      expect(result == 0).assertEqual(true);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass238
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0238
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass238';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("this is loop error");
      expect(result).assertEqual(undefined);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass239
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0239
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass239';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: string = "";
      let task = new taskpool.Task(returnError, 1000);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Error).message);
        result = (data as Error).message;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 500);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual("this is return error");
      done()
    })
    /**
     * @tc.name   TaskPoolTestClass245
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0245
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass245';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as number;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("this is loop error");
      expect(result).assertEqual(undefined);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass246
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0246
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass246';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(delaySum, 10, 20, 1000);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as int;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(30);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass247
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0247
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass247';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as number;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(0);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass248
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0248
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass248';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).then((data: Any) => {
        console.info(`${caseName} then`);
        result = data as number
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 1300);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: ` + result)
      expect(error).assertEqual('this is loop error');
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass249
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0249
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass249';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.Task(longString, 500);
      taskpool.executeDelayed(500, task).then((data: Any) => {
        console.info(`${caseName} then result: ${result}`);
        result = data as string;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(getLongString());
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass250
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0250
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass250';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Array<int>)[0]);
        result = (data as Array<int>)[0];
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task1);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 500);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(20);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass251
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0251
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass251';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Array<int>)[0]);
        result = (data as Array<int>)[0];
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(group);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 200);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(20);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass252
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0252
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass252';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task1 = new taskpool.Task(loop);
      let task2 = new taskpool.Task(loop);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Array<number>)[0]);
        result = (data as Array<number>)[0];
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task1.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("this is loop error");
      expect(result).assertEqual(undefined);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass253
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0253
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass253';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task1 = new taskpool.Task(longString, 1000);
      let task2 = new taskpool.Task(longString, 2000);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).then((data: Any) => {
        console.info(`${caseName} then result: ${result}`);
        result = (data as Array<string>)[0];
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task1.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(getLongString());
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass254
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0254
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass254';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.LongTask(delaySum, 10, 10, 1000);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as int;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 500);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(20);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass255
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0255
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass255';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as number;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 300);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(0);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass256
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0256
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass256';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as number;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("this is loop error");
      expect(result).assertEqual(undefined);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass257
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0257
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass257';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: int = -1;
      let size: int = 1024;
      let arr = new Array<SendableClass>()
      for (let i: int = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Array<SendableClass>).length);
        result = (data as Array<SendableClass>).length;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 400);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(size);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass258
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0258
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass258';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: int = -1;
      let size: int = 1024;
      let arr = new Array<SendableClass>()
      for (let i: int = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + (data as Array<SendableClass>).length);
        result = (data as Array<SendableClass>).length;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task.taskId);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(0);
      done()
    })

    /**
     * @tc.name   TaskPoolTestClass259
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0259
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'TaskPoolTestClass259';
      console.info(`${caseName} start`);
      let terminate = false;
      let error: string = "";
      let result: int = -1;
      let value: int = 500;
      let task: taskpool.Task = new taskpool.Task(promiseNumber, value);
      taskpool.execute(task).then((data: Any) => {
        console.info(`${caseName} then result: ` + data);
        result = data as int;
        terminate = true;
      }).catch((e: Error) => {
        console.info(`${caseName} catch: ${e.message}`);
        error = e.message;
        terminate = true;
      })
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log('cancel error: ' + e)
        }
      }, 800);

      while (!terminate) {
        await sleep(100);
      }
      console.log(`${caseName} result: error=${error}, result=${result}`);
      expect(error).assertEqual("");
      expect(result).assertEqual(value);
      done()
    })
  })
}