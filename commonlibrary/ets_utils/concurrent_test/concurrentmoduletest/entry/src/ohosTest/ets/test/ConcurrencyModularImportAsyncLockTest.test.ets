/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  lock,
  lock1,
  tasklockexclusive,
  timelock,
  workerlock,
  workerlockexclusive
} from 'library1/src/main/ets/components/ConcurrencyModularImportAsyncLockTest';
import { task } from 'library1/src/main/ets/components/ConcurrencyModularImportTaskTest';
import { printArgsshared, tasklock2, timelock2 } from '../testability/pages/methods';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function ConcurrencyModularImportAsyncLockTest() {
  describe('ConcurrencyModularImportAsyncLockTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0100
     * @tc.name ConcurrencyModularImportAsyncLockTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          try {
            await taskpool.execute(task).then(() => {
              console.info('seqrunner: task1 done.');
            })
          } catch (e) {
            flag = true;
            console.info(e.message);
          }
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0200
     * @tc.name ConcurrencyModularImportAsyncLockTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock1.lockAsync(async () => {
          try {
            await taskpool.execute(task).then(() => {
              console.info('seqrunner: task1 done.');
            })
          } catch (e) {
            flag = true;
            console.info(e.message);
          }
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0300
     * @tc.name ConcurrencyModularImportAsyncLockTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          try {
            await taskpool.execute(task).then(() => {
              console.info('seqrunner: task1 done.');
            })
          } catch (e) {
            flag = await workerlock();
            console.info(e.message);
          }
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0400
     * @tc.name ConcurrencyModularImportAsyncLockTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          try {
            await taskpool.execute(task).then(() => {
              console.info('seqrunner: task1 done.');
            })
          } catch (e) {
            flag = await workerlock();
            console.info(e.message);
          }
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0500
     * @tc.name ConcurrencyModularImportAsyncLockTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(printArgsshared);
        await taskpool.execute(task1).then(async () => {
          await lock.lockAsync(async () => {
            try {
              await taskpool.execute(task).then(() => {
                console.info('seqrunner: task1 done.');
              })
            } catch (e) {
              flag = true;
              console.info(e.message);
            }
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        });
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0600
     * @tc.name ConcurrencyModularImportAsyncLockTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(4);
        WorkThread.onmessage = (e: MessageEvents): void => {
          flag = e.data;
          WorkThread.terminate();
        }
        while (flag === false) {
          await sleep(300)
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0700
     * @tc.name ConcurrencyModularImportAsyncLockTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0700';
        console.info(`${caseName} test start`);
        let count: number = 1;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(5);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count === 1) {
          await sleep(300)
        }
        expect(count).assertEqual(5);
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0800
     * @tc.name ConcurrencyModularImportAsyncLockTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0800';
        console.info(`${caseName} test start`);
        let count: number = 1;
        await tasklock2().then(() => {
          count++;
        });
        while (count === 1) {
          await sleep(300)
        }
        expect(count).assertEqual(2);
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_0900
     * @tc.name ConcurrencyModularImportAsyncLockTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest0900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          await timelock(100).then(() => {
            flag = true;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1000
     * @tc.name ConcurrencyModularImportAsyncLockTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          await timelock(100).then(() => {
            flag = true;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1100
     * @tc.name ConcurrencyModularImportAsyncLockTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          await timelock2(100).then(() => {
            flag = true;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1200
     * @tc.name ConcurrencyModularImportAsyncLockTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(6);
        WorkThread.onmessage = (e: MessageEvents): void => {
          flag = e.data;
          WorkThread.terminate();
        }
        while (flag === false) {
          await sleep(300)
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1300
     * @tc.name ConcurrencyModularImportAsyncLockTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(7);
        WorkThread.onmessage = (e: MessageEvents): void => {
          flag = e.data;
          WorkThread.terminate();
        }
        while (flag === false) {
          await sleep(300)
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1400
     * @tc.name ConcurrencyModularImportAsyncLockTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(8);
        WorkThread.onmessage = (e: MessageEvents): void => {
          flag = e.data;
          WorkThread.terminate();
        }
        while (flag === false) {
          await sleep(300)
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1500
     * @tc.name ConcurrencyModularImportAsyncLockTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(8);
        WorkThread.onmessage = (e: MessageEvents): void => {
          flag = e.data;
          WorkThread.terminate();
        }
        while (flag === false) {
          await sleep(300)
        }
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1600
     * @tc.name ConcurrencyModularImportAsyncLockTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1600';
        console.info(`${caseName} test start`);
        let count: number = 1;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(9);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count !== 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1700
     * @tc.name ConcurrencyModularImportAsyncLockTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          await workerlockexclusive().then(() => {
            flag = true;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_ASYNCLOCK_TEST_1800
     * @tc.name ConcurrencyModularImportAsyncLockTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAsyncLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAsyncLockTest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        await lock.lockAsync(async () => {
          await tasklockexclusive().then(() => {
            flag = true;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect(flag).assertTrue();
        console.log(`${caseName} test end`);
        Done();
      });
  })
}

