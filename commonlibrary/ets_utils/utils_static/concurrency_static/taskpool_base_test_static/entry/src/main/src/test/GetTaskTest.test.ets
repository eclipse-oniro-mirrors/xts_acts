'use static'

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';

export function sleep(time: int): Promise<number> {
  return new Promise<number>((re, je): void => {
    setTimeout(() => {
      re(1)
    }, time)
  })
}

export class TaskInfoClass {
  private count: int = 0;
  private errCount: int = 0;
  private enqueue: int = 0;
  private onReceicve: int = 0;
  private startExecute: int = 0;
  private executeFailed: int = 0;
  private executeSuccess: int = 0;
  lock_: AsyncLock = new AsyncLock();

  public async getCount(): Promise<int> {

    return this.lock_.lockAsync(() => {
      return this.count;
    })
  }

  public async increaseCount() {
    await this.lock_.lockAsync(() => {
      this.count++;
    })
  }

  public async getErrCount(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.errCount;
    })
  }

  public async increaseErrCount() {
    await this.lock_.lockAsync(() => {
      this.errCount++;
    })
  }

  public async getEnqueue(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.enqueue;
    })
  }

  public async increaseEnqueue() {
    await this.lock_.lockAsync(() => {
      this.enqueue++;
    })
  }

  public async getOnReceicve(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.onReceicve;
    })
  }

  public async increaseOnReceicve() {
    await this.lock_.lockAsync(() => {
      this.onReceicve++;
    })
  }

  public async getStartExecute(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.startExecute;
    })
  }

  public async increaseStartExecute() {
    await this.lock_.lockAsync(() => {
      this.startExecute++;
    })
  }

  public async getExecuteFailed(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.executeFailed;
    })
  }

  public async increaseExecuteFailed() {
    await this.lock_.lockAsync(() => {
      this.executeFailed++;
    })
  }

  public async getExecuteSuccess(): Promise<int> {
    return this.lock_.lockAsync(() => {
      return this.executeSuccess;
    })
  }

  public async increaseExecuteSuccess() {
    await this.lock_.lockAsync(() => {
      this.executeSuccess++;
    })
  }
}

export function printArgs(args: int): number {
  return args;
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


export function multiplyFunc(args: int): int {
  return args * 2;
}

export function getCreateTaskId(): int {
  let task = new taskpool.Task(printArgs, 10);
  return task.taskId;
}

export function getTaskResult(taskId: int): boolean {
  let task: taskpool.Task | undefined = taskpool.getTask(taskId);
  if (task == undefined) {
    return false;
  }
  return true;
}

export async function taskSendManyFunc(time: int, value: int) {
  for (let i: int = 0; i < value; i++) {
    await sleep(time);
    taskpool.Task.sendData(value);
  }
}


export async function taskErrFunc(time: int) {
  await sleep(time);
  throw new Error("taskErrFunc error");
}

export default function getTaskTest() {
  describe('getTaskTest', () => {
    afterEach(async () => {
      await sleep(50)
    })
    /**
     * @tc.name   TaskPoolTestClass261
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0261
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task | undefined = taskpool.getTask(0);
        expect(task).assertEqual(undefined);

        let task2: taskpool.Task | undefined = taskpool.getTask(-1);
        expect(task2).assertEqual(undefined);
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass262
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0262
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(promiseNumber, 1000);
        let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId, "");
        expect(task2).assertEqual(undefined);

        let task3: taskpool.Task | undefined = taskpool.getTask(task.taskId, "default");
        expect(task3).assertEqual(undefined);

        let task4: taskpool.Task | undefined = taskpool.getTask(task.taskId, "PromiseNumber");
        expect(task4).assertEqual(undefined);

        let task5: taskpool.Task | undefined = taskpool.getTask(task.taskId, "promiseNumber");
        expect(task5).assertEqual(task);
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass263
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0263
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
        let terminate = false;
        taskpool.execute(getTaskResult, task.taskId).then((res) => {
          terminate = true;
          expect(res as boolean).assertFalse();
        })
        while (!terminate) {
          await sleep(100);
        }
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass264
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0264
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let terminate = false;
        taskpool.execute(getCreateTaskId).then((res) => {
          terminate = true;
          let task: taskpool.Task | undefined = taskpool.getTask((res as number).toInt());
          expect(task).assertEqual(undefined);
        })
        while (!terminate) {
          await sleep(100);
        }
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass265
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0265
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
        let result: boolean = true;
        let eaw2 = new EAWorker()
        eaw2.start()
        await eaw2.run<void>(() => {
          let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
          if (task2 == undefined) {
            result = false;
          }
        })
        eaw2.quit()
        expect(result).assertFalse()
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass266
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0266
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: boolean = true;
        let eaw = new EAWorker()
        eaw.start()
        let resolver:((value: Any)=>void) | undefined = undefined;
        let waiter = new Promise<Any>((resolve) => {
          resolver = resolve;
        })
        await eaw.run<void>(() => {
          let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
          let eaw2 = new EAWorker()
          eaw2.start()
          let p = eaw2.run<void>(() => {
            let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
            if (task2 == undefined) {
              result = false;
            }
          })
          p.then(() => {
            resolver!(undefined);
          })
          eaw2.quit()
        })
        await waiter;
        eaw.quit()
        expect(result).assertFalse()
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass267
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0267
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
        let task1: taskpool.Task | undefined = taskpool.getTask(task.taskId, task.name);
        expect(task1!.taskId).assertEqual(task.taskId);
        expect(task1!.name).assertEqual(task.name);
        expect(task1!.taskFunction).assertEqual(task.taskFunction);
        expect(task1!.arguments).assertEqual(task.arguments);
        expect(task1!.totalDuration).assertEqual(task.totalDuration);
        expect(task1!.ioDuration).assertEqual(task.ioDuration);
        expect(task1!.cpuDuration).assertEqual(task.cpuDuration);
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass268
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0268
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let class1 = new TaskInfoClass();
        let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
        taskpool.execute(task).then(() => {
          class1.increaseCount();
        })
        let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
        task2?.onReceiveData(() => {
          class1.increaseOnReceicve();
        })
        expect(task2!.isDone()).assertEqual(false);
        while (await class1.getCount() < 1) {
          await sleep(100);
        }
        expect(await class1.getOnReceicve()).assertEqual(20);
        expect(task2!.isDone()).assertEqual(true);
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass269
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0269
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let class1 = new TaskInfoClass();
        let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
        let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
        task2?.onExecutionSucceeded(() => {
          class1.increaseExecuteSuccess();
        })
        task2?.onEnqueued(() => {
          class1.increaseEnqueue();
        })
        task2?.onStartExecution(() => {
          class1.increaseStartExecute();
        })
        task2?.onReceiveData(() => {
          class1.increaseOnReceicve();
        })
        taskpool.execute(task2 as taskpool.Task).then(() => {
          class1.increaseCount();
        }).catch(() => {
          class1.increaseErrCount()
        })

        while (await class1.getCount() < 1) {
          await sleep(100);
        }
        expect(await class1.getEnqueue()).assertEqual(1);
        expect(await class1.getStartExecute()).assertEqual(1);
        expect(await class1.getExecuteSuccess()).assertEqual(1);
        expect(await class1.getOnReceicve()).assertEqual(20);
        done()
      })

    /**
     * @tc.name   TaskPoolTestClass270
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0270
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let class1 = new TaskInfoClass();
        let task: taskpool.Task = new taskpool.Task(taskErrFunc, 50);
        let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
        task2?.onExecutionFailed(() => {
          class1.increaseExecuteFailed();
        })
        task2?.onEnqueued(() => {
          class1.increaseEnqueue();
        })
        task2?.onStartExecution(() => {
          class1.increaseStartExecute();
        })
        taskpool.execute(task2 as taskpool.Task).then(() => {
          class1.increaseCount();
        }).catch(() => {
          class1.increaseErrCount()
        })

        while (await class1.getErrCount() < 1) {
          await sleep(100);
        }
        expect(await class1.getEnqueue()).assertEqual(1);
        expect(await class1.getStartExecute()).assertEqual(1);
        expect(await class1.getExecuteFailed()).assertEqual(1);
        done()
      })
  })
}
