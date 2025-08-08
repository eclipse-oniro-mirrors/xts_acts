import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';
import { ArkTSUtils, taskpool, worker } from '@kit.ArkTS';
import testNapi from 'libentry.so';
import {
  throwErrorTask,
  normalTask,
  longErrorTask,
  longTaskWithData,
  AsyncTask,
  AsyncTaskWithError
} from '../testability/pages/Taskpool';
import { process } from '@kit.ArkTS';

function promiseFunc(observer: errorManager.GlobalError) {
  console.info('[Demo] result name :' + observer.name);
  console.info('[Demo] result message :' + observer.message);
  console.info('[Demo] result stack :' + observer.stack);
  console.info('[Demo] result instanceName :' + observer.instanceName);
  console.info('[Demo] result instaceType :' + observer.instanceType);
  let pro = new process.ProcessManager();
  pro.exit(0);
}

let errorCaught = "";

function handleUnhandledRejection(observer: errorManager.GlobalError) {
  errorCaught = observer.message;
  console.info('[Test] Unhandled rejection caught:', errorCaught);
}

const err = 'error';

function throwError() {
  throw new Error('error');
}


async function asyncThrow() {
  throw new Error('error');
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

@Concurrent
function task1() {
  setTimeout(() => {
  }, 50);
}

@Concurrent
function task2() {
  throw new Error('error2');
}

@Concurrent
function task3() {
  setTimeout(() => {
    throw new Error('error3');
  }, 50);
}

@Concurrent
function task4() {
  new Promise<void>(() => {
    setTimeout(() => {
      throw new Error('error4');
    }, 50);
  });
}

@Concurrent
function task5() {
  Promise.resolve().then(() => {
    throw new Error('error5');
  });
}

@Concurrent
function task6() {
  Promise.reject(new Error('origin error'))
    .catch(() => {
      throw new Error('error6');
    });
}

@Concurrent
function task7() {
  Promise.resolve()
    .finally(() => {
      throw new Error('error7');
    });
}

@Concurrent
function task8() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
    throw new Error('error8');
  });
}

@Concurrent
function task9() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
  }).then(() => {
    throw new Error('error9');
  });
}

@Concurrent
function task10() {
  const lock = new ArkTSUtils.locks.AsyncLock();
  lock.lockAsync<void>(() => {
    throw new Error('error10');
  }).catch(() => {
    throw new Error('error10');
  });
}

@Concurrent
function task11() {
  const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
  conditionVariable.waitFor(10)
    .finally(() => {
      throw new Error('error11');
    });
}

@Concurrent
function task12() {
  const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
  conditionVariable.waitFor(10).then(() => {
    throw new Error('error12');
  });
}

@Concurrent
function task13() {
  return Promise.reject(new Error('error13'));
}

@Concurrent
function task14() {
  setTimeout(() => {
    testNapi.addWithTwoNumber();
  }, 0);
}

@Concurrent
function task15() {
  let task: taskpool.Task = new taskpool.Task(AsyncTaskWithError);
  taskpool.execute(task);
}

@Concurrent
function task16() {
  let task: taskpool.Task = new taskpool.Task(normalTask);
  taskpool.execute(task).then(() => {
    throw new Error('error16');
  });
}

@Concurrent
function task17() {
  let task: taskpool.Task = new taskpool.Task(throwErrorTask);
  taskpool.execute(task).catch(() => {
    throw new Error('error17');
  });
}

@Concurrent
function task18() {
  let task: taskpool.Task = new taskpool.Task(longTaskWithData, 1);
  task.onReceiveData(() => {
    throw new Error('error18');
  });
  taskpool.execute(task);
}

@Concurrent
function task19() {
  let myWorker = new worker.ThreadWorker('../testability/workers/Worker1');
}

@Concurrent
function task20() {
  let myWorker = new worker.ThreadWorker('../testability/workers/Worker2');
  myWorker.postMessage({ foo: 'bar' });
}

const tasks = [
  task1, task2, task3, task4, task5,
  task6, task7, task8, task9, task10,
  task11, task12, task13, task14, task15,
  task16, task17, task18, task19, task20
];

export default function abilityTest() {
  describe('ErrManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(800);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SetTimeoutThrowErrorTest0100
     * @tc.name      : SetTimeoutThrowErrorTest0100
     * @tc.desc      : 主线程_setTimeOut中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SetTimeoutThrowErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      let errorCaught = "";
      errorManager.on('globalErrorOccurred', (err) => {
        errorCaught = err.message;
      });
      setTimeout(() => {
        throwError();
      }, 50);
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : PromiseThrowErrorTest0200
     * @tc.name      : PromiseThrowErrorTest0200
     * @tc.desc      : 主线程_promise中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PromiseThrowErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      let errorCaught = "";
      errorManager.on('globalErrorOccurred', (err) => {
        errorCaught = err.message;
      });
      new Promise<void>(() => {
        setTimeout(() => {
          throwError();
        }, 50);
      });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : PromiseThenThrowErrorTest0300
     * @tc.name      : PromiseThenThrowErrorTest0300
     * @tc.desc      : 主线程_promise的then中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PromiseThenThrowErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        try {
          errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
          Promise.resolve().then(() => {
            throwError();
          });
          await sleep(800);
          expect(errorCaught).assertEqual(err);
        } finally {
          errorManager.off('globalUnhandledRejectionDetected', handleUnhandledRejection);
        }
        Done();
      });


    /**
     * @tc.number    : PromiseCatchThrowErrorTest0400
     * @tc.name      : PromiseCatchThrowErrorTest0400
     * @tc.desc      : 主线程_promise的catch中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PromiseCatchThrowErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        try {
          errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
          Promise.reject(new Error('error'))
            .catch(() => {
              throwError();
            });
          await sleep(800);
          expect(errorCaught).assertEqual(err);
        } finally {
          errorManager.off('globalUnhandledRejectionDetected', handleUnhandledRejection);
        }
        Done();
      });


    /**
     * @tc.number    : PromiseFinallyThrowErrorTest0500
     * @tc.name      : PromiseFinallyThrowErrorTest0500
     * @tc.desc      : 主线程_promise的finally中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('PromiseFinallyThrowErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
        Promise.resolve()
          .finally(() => {
            throwError();
          });
        await sleep(800);
        expect(errorCaught).assertEqual(err);
        Done();
      });

    /**
     * @tc.number    : AsyncLockThrowErrorTest0600
     * @tc.name      : AsyncLockThrowErrorTest0600
     * @tc.desc      : 主线程_asyncLock中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLockThrowErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
      const lock = new ArkTSUtils.locks.AsyncLock();
      lock.lockAsync<void>(() => {
        throwError();
      });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : AsyncLockThrowErrorTest0700
     * @tc.name      : AsyncLockThrowErrorTest0700
     * @tc.desc      : 主线程_asyncLock.then中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLockThrowErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
      const lock = new ArkTSUtils.locks.AsyncLock();
      lock.lockAsync<void>(() => {
      }).then(() => {
        throwError();
      });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : AsyncLockThrowErrorTest0800
     * @tc.name      : AsyncLockThrowErrorTest0800
     * @tc.desc      : 主线程_asyncLock.catch中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncLockThrowErrorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
      const lock = new ArkTSUtils.locks.AsyncLock();
      lock.lockAsync<void>(() => {
        throwError();
      }).catch(() => {
        throwError();
      });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : WaitForThrowErrorTest0900
     * @tc.name      : WaitForThrowErrorTest0900
     * @tc.desc      : 主线程_waitFor.finally中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WaitForThrowErrorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
      const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
      conditionVariable.waitFor(10)
        .finally(() => {
          throwError();
        });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : WaitForErrorTest1000
     * @tc.name      : WaitForErrorTest1000
     * @tc.desc      : 主线程_wait/waitFor中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WaitForErrorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
      errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
      const conditionVariable = new ArkTSUtils.locks.ConditionVariable();
      conditionVariable.waitFor(10).then(() => {
        throwError();
      });
      await sleep(800);
      expect(errorCaught).assertEqual(err);
      Done();
    });

    /**
     * @tc.number    : AsyncFunctionThrowErrorTest1100
     * @tc.name      : AsyncFunctionThrowErrorTest1100
     * @tc.desc      : 主线程_async异步方法中抛异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('AsyncFunctionThrowErrorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
        asyncThrow();
        await sleep(800);
        expect(errorCaught).assertEqual(err);
        Done();
      });

    /**
     * @tc.number    : TaskpoolTaskThrowErrorTest1300
     * @tc.name      : TaskpoolTaskThrowErrorTest1300
     * @tc.desc      : taskpool线程中普通task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolTaskThrowErrorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let task: taskpool.Task = new taskpool.Task(throwErrorTask);
        taskpool.execute(task);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolGenericTaskThenThrowErrorTest1400
     * @tc.name      : TaskpoolGenericTaskThenThrowErrorTest1400
     * @tc.desc      : taskpool线程中泛型任务的then回调抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolGenericTaskThenThrowErrorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(normalTask);
        taskpool.execute(taskGroup).then((res: Array<Object>) => {
          throwError();
        });
        await sleep(800);
        expect(errorCaught).assertEqual(err);
        Done();
      });

    /**
     * @tc.number    : TaskpoolTaskGroupTaskThrowErrorTest1500
     * @tc.name      : TaskpoolTaskGroupTaskThrowErrorTest1500
     * @tc.desc      : taskgroup中的task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolTaskGroupTaskThrowErrorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(throwErrorTask);
        taskpool.execute(taskGroup);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolTaskGroupTaskThrowErrorTest1600
     * @tc.name      : TaskpoolTaskGroupTaskThrowErrorTest1600
     * @tc.desc      : taskgroup中的task1正常，task2抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolTaskGroupTaskThrowErrorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(normalTask);
        taskGroup.addTask(throwErrorTask);
        taskpool.execute(taskGroup);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolTaskGroupOnExecutionFailedThrowErrorTest1700
     * @tc.name      : TaskpoolTaskGroupOnExecutionFailedThrowErrorTest1700
     * @tc.desc      : taskgroup中task1的onExecutionFailed回调抛出异常，task2抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolTaskGroupOnExecutionFailedThrowErrorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let task1: taskpool.Task = new taskpool.Task(normalTask);
        task1.onExecutionFailed((err: Error) => {
          throw new Error('onExecutionFailed error');
        })
        let task2: taskpool.Task = new taskpool.Task(throwErrorTask);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup);
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(errorCaughtList.includes('taskpool error')).assertTrue();
        expect(!errorCaughtList.includes('onExecutionFailed error')).assertTrue();
        Done();
      });

    /**
     * @tc.number    : TaskpoolDelayedTaskThrowErrorTest1800
     * @tc.name      : TaskpoolDelayedTaskThrowErrorTest1800
     * @tc.desc      : 延时任务的task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolDelayedTaskThrowErrorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let task: taskpool.Task = new taskpool.Task(throwErrorTask);
        taskpool.executeDelayed(100, task);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolDelayedTaskCatchThrowErrorTest1900
     * @tc.name      : TaskpoolDelayedTaskCatchThrowErrorTest1900
     * @tc.desc      : 延时任务的task的catch回调中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolDelayedTaskCatchThrowErrorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        errorManager.on('globalUnhandledRejectionDetected', handleUnhandledRejection);
        let task: taskpool.Task = new taskpool.Task(throwErrorTask);
        taskpool.executeDelayed(100, task)
          .catch(() => {
            throw new Error('catch callback error');
          });
        await sleep(800);
        expect(errorCaught).assertEqual('catch callback error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolPeriodicTaskThrowErrorTest2000
     * @tc.name      : TaskpoolPeriodicTaskThrowErrorTest2000
     * @tc.desc      : 周期任务的task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolPeriodicTaskThrowErrorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let task: taskpool.Task = new taskpool.Task(throwErrorTask);
        taskpool.executePeriodically(100, task);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        taskpool.cancel(task);
        Done();
      });

    /**
     * @tc.number    : TaskpoolPeriodicTaskOnEnqueuedThrowErrorTest2100
     * @tc.name      : TaskpoolPeriodicTaskOnEnqueuedThrowErrorTest2100
     * @tc.desc      : 周期任务的task的onEnqueued回调中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolPeriodicTaskOnEnqueuedThrowErrorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let task: taskpool.Task = new taskpool.Task(normalTask);
        task.onEnqueued(() => {
          throw new Error('onEnqueued callback error');
        });
        taskpool.executePeriodically(100, task);
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(!errorCaughtList.includes('onEnqueued callback error')).assertTrue();
        taskpool.cancel(task);
        Done();
      });

    /**
     * @tc.number    : TaskpoolLongTaskThrowErrorTest2200
     * @tc.name      : TaskpoolLongTaskThrowErrorTest2200
     * @tc.desc      : longTask抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolLongTaskThrowErrorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let task: taskpool.LongTask = new taskpool.LongTask(longErrorTask);
        taskpool.execute(task);
        await sleep(800);
        expect(errorCaught).assertEqual('long task error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolLongTaskOnReceiveDataThrowErrorTest2300
     * @tc.name      : TaskpoolLongTaskOnReceiveDataThrowErrorTest2300
     * @tc.desc      : LongTask的onReceiveData回调中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolLongTaskOnReceiveDataThrowErrorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let task: taskpool.LongTask = new taskpool.LongTask(longTaskWithData, 1);
        task.onReceiveData(throwError);
        taskpool.execute(task);
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(!errorCaughtList.includes('error')).assertTrue();
        Done();
      });

    /**
     * @tc.number    : TaskpoolSerialTaskThrowErrorTest2400
     * @tc.name      : TaskpoolSerialTaskThrowErrorTest2400
     * @tc.desc      : 串行队列task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolSerialTaskThrowErrorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let runner = new taskpool.SequenceRunner();
        let task = new taskpool.Task(throwErrorTask);
        runner.execute(task);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolSerialTask1ErrorTask2NormalTest2500
     * @tc.name      : TaskpoolSerialTask1ErrorTask2NormalTest2500
     * @tc.desc      : 串行队列task1抛出异常，task2正常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolSerialTask1ErrorTask2NormalTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let runner = new taskpool.SequenceRunner();
        let task1 = new taskpool.Task(throwErrorTask);
        let task2 = new taskpool.Task(normalTask);
        runner.execute(task1);
        runner.execute(task2);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolSerialTask1OnStartExecutionErrorTask2NormalTest2600
     * @tc.name      : TaskpoolSerialTask1OnStartExecutionErrorTask2NormalTest2600
     * @tc.desc      : 串行队列task1的onStartExecution回调中抛出异常，task2正常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolSerialTask1OnStartExecutionErrorTask2NormalTest2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let runner = new taskpool.SequenceRunner();
        let task1 = new taskpool.Task(normalTask);
        task1.onStartExecution(() => {
          throw new Error('onStartExecution error');
        });
        let task2 = new taskpool.Task(normalTask);
        runner.execute(task1);
        runner.execute(task2);
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(!errorCaughtList.includes('onStartExecution error')).assertTrue();
        Done();
      });

    /**
     * @tc.number    : TaskpoolAsyncTaskThrowErrorTest2700
     * @tc.name      : TaskpoolAsyncTaskThrowErrorTest2700
     * @tc.desc      : 异步队列的task抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolAsyncTaskThrowErrorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let runner = new taskpool.AsyncRunner(4);
        let task = new taskpool.Task(throwErrorTask);
        runner.execute(task);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolAsyncTask1NormalTask2ErrorTest2800
     * @tc.name      : TaskpoolAsyncTask1NormalTask2ErrorTest2800
     * @tc.desc      : 异步队列的task1正常，task2抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolAsyncTask1NormalTask2ErrorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let runner = new taskpool.AsyncRunner(4);
        let task1 = new taskpool.Task(normalTask);
        let task2 = new taskpool.Task(throwErrorTask);
        runner.execute(task1);
        runner.execute(task2);
        await sleep(800);
        expect(errorCaught).assertEqual('taskpool error');
        Done();
      });

    /**
     * @tc.number    : TaskpoolAsyncTask1OnExecutionSucceededErrorTask2ErrorTest2900
     * @tc.name      : TaskpoolAsyncTask1OnExecutionSucceededErrorTask2ErrorTest2900
     * @tc.desc      : 异步队列的task1的onExecutionSucceeded回调中抛出异常，task2抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskpoolAsyncTask1OnExecutionSucceededErrorTask2ErrorTest2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let runner = new taskpool.AsyncRunner(4);
        let task1 = new taskpool.Task(normalTask);
        task1.onExecutionSucceeded(() => {
          throw new Error('onExecutionSucceeded error');
        });
        let task2 = new taskpool.Task(throwErrorTask);
        runner.execute(task1);
        runner.execute(task2);
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(errorCaughtList.includes('taskpool error')).assertTrue();
        expect(!errorCaughtList.includes('onExecutionSucceeded error')).assertTrue();
        Done();
      });

    /**
     * @tc.number    : WorkerTopLevelThrowErrorTest3000
     * @tc.name      : WorkerTopLevelThrowErrorTest3000
     * @tc.desc      : worker线程的顶级作用域中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WorkerTopLevelThrowErrorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let myWorker = new worker.ThreadWorker('../testability/workers/Worker1');
        await sleep(800);
        expect(errorCaught).assertEqual('worker top level error');
        try {
          setTimeout(() => {
            myWorker.terminate();
            console.log('主线程已terminate worker');
          }, 100);
        } catch(err) {
          console.error('终止 Worker 失败:', err);
        }
        Done();
      });

    /**
     * @tc.number    : WorkerSubWorkerThrowErrorTest3500
     * @tc.name      : WorkerSubWorkerThrowErrorTest3500
     * @tc.desc      : worker线程的顶级作用域创建的二级worker中的onmessage抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WorkerSubWorkerThrowErrorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaughtList: string[] = [];
        errorManager.on('globalErrorOccurred', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason) => {
          errorCaughtList.push(`${reason.message}`);
        });
        errorManager.on('globalUnhandledRejectionDetected', (reason: Error) => {
          if (reason instanceof Error) {
            errorCaughtList.push(`${reason.message}`);
          }
        }
        );
        let myWorker = new worker.ThreadWorker('../testability/workers/Worker6');
        await sleep(800);
        console.log('errorCaughtList(JSON):', JSON.stringify(errorCaughtList, null, 2));
        expect(errorCaughtList.includes('worker onmessage error')).assertTrue();
        try {
          setTimeout(() => {
            myWorker.terminate();
            console.log('主线程已terminate worker');
          }, 100);
        } catch(err) {
          console.error('终止 Worker 失败:', err);
        }
        Done();
      });

    /**
     * @tc.number    : WorkerSubWorkerThrowErrorTest3600
     * @tc.name      : WorkerSubWorkerThrowErrorTest3600
     * @tc.desc      : worker线程的onmessage中创建的二级worker中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WorkerSubWorkerThrowErrorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let myWorker = new worker.ThreadWorker('../testability/workers/Worker8');
        myWorker.postMessage({ foo: 'bar' });
        await sleep(800);
        expect(errorCaught).assertEqual('worker top level error');
        try {
          setTimeout(() => {
            myWorker.terminate();
            console.log('主线程已terminate worker');
          }, 100);
        } catch(err) {
          console.error('终止 Worker 失败:', err);
        }
        Done();
      });

    /**
     * @tc.number    : WorkerSubWorkerThrowErrorTest3700
     * @tc.name      : WorkerSubWorkerThrowErrorTest3700
     * @tc.desc      : worker线程的onmessage中抛出异常前，主线程terminate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WorkerSubWorkerThrowErrorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let myWorker = new worker.ThreadWorker('../testability/workers/Worker9');
        myWorker.postMessage({ foo: 'bar' });
        setTimeout(() => {
          myWorker.terminate();
          console.log('主线程已terminate worker');
        }, 100);
        expect(errorCaught).assertEqual("");
        Done();
      });

    /**
     * @tc.number    : WorkerSubWorkerThrowErrorTest3800
     * @tc.name      : WorkerSubWorkerThrowErrorTest3800
     * @tc.desc      : worker的宿主线程回调onmessage中抛出异常
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('WorkerSubWorkerThrowErrorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void) => {
        let errorCaught = "";
        errorManager.on('globalErrorOccurred', (err) => {
          errorCaught = err.message;
        });
        let myWorker = new worker.ThreadWorker('../testability/workers/Worker10');
        myWorker.onmessage = (event) => {
          console.log('主线程收到worker消息:', event.data);
          throw new Error('主线程onmessage回调异常');
        };
        myWorker.postMessage({ foo: 'bar' });
        sleep(200);
        expect(errorCaught).assertEqual("");
        try {
          setTimeout(() => {
            myWorker.terminate();
            console.log('主线程已terminate worker');
          }, 100);
        } catch(err) {
          console.error('终止 Worker 失败:', err);
        }
        Done();
      });

  })
}



