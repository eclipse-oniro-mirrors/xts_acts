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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Size,
  Level,
  TestType
} from '@ohos/hypium';
import { sleep } from '../testability/pages/Utils';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  ConcurrentFunc1,
  TaskFun1,
  TaskFun39,
  TaskFun42,
  TaskFun44,
  TaskFun46,
  TaskFun49
} from '../testability/pages/Utils2';

export default function AsynclockDifferentForthTest() {
  describe('AsynclockDifferentForthTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(300);
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
     * @tc.name   AsynclockDifferentThirdTest3800
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_THIRD_TEST_3800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3800';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await lock3.lockAsync(async () => {
                await new Promise<void>((resolve) => {
                  setTimeout(() => {
                    console.log('Asynchronous operation completed');
                    resolve();
                    count++;
                  }, 200);
                });
                console.log('Exit EXCLUSIVE lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit shared lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            console.log('Exit EXCLUSIVE lock lock1');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit EXCLUSIVE lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest3900
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_3900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest3900';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun39, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          }).catch(() => {
            console.log('taskpool failed');
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4000
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4000';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let count1: number = 0;
        let task: taskpool.Task = new taskpool.Task(ConcurrentFunc1, 1);
        let onReceiveDataCallback: (data: number) => void = () => {
          count++;
          console.log('enter onReceiveData:' + count);
        };
        task.onReceiveData(onReceiveDataCallback);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then(() => {
            count1++;
          }).catch((error: Error) => {
            console.error('taskpool execute failed: ', error);
          });
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        expect(count1).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4100
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4100';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              await lock3.lockAsync(async () => {
                setTimeout(() => {
                  console.log('Asynchronous operation completed');
                  count++;
                }, 200);
                console.log('Exit shared lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
              console.log('Exit shared lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit shared lock lock1');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4200
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4200';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun42, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          }).catch(() => {
            console.log('taskpool failed');
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4300
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4300';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            console.log('Enter shared lock lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter EXCLUSIVE lock lock2');
              await lock3.lockAsync(async () => {
                let WorkThread: worker.ThreadWorker;
                WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
                WorkThread.postMessage(caseName);
                WorkThread.onmessage = (e: MessageEvents): void => {
                  count = e.data;
                  console.log('e:' + JSON.stringify(e));
                  console.info('main2 thread count is  ' + count);
                  WorkThread.terminate();
                }
                console.log('Exit EXCLUSIVE lock lock3');
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
              console.log('Exit EXCLUSIVE lock lock2');
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit shared lock lock1');
          }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          console.log('Exit shared lock lock1');
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4400
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4400';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun44, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4500
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4500';
        console.info(`${caseName} test start`);
        const promises: Promise<void>[] = [];
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun1, 1);
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options1.timeout = 1000;
        const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options2.timeout = 1000;
        for (let i = 0; i < 10; i++) {
          const promise = lock1.lockAsync(async () => {
            console.log('Enter EXCLUSIVE lock1');
            await lock2.lockAsync(async () => {
              console.log('Enter SHARED lock2');
              try {
                await taskpool.execute(task);
                count++;
                console.log('Taskpool execution success');
              } catch (error) {
                console.error('Taskpool execution failed:', error);
              }
              console.log('Exit SHARED lock2');
            }, ArkTSUtils.locks.AsyncLockMode.SHARED, options2);
            console.log('Exit EXCLUSIVE lock1');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options1);
          promises.push(promise);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:', count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4600
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4600';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun46, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4700
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4800
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4800';
        console.info(`${caseName} test start`);
        const promises: void[] = [];
        let count = 0;
        const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
        const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
        const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options1.timeout = 1000;
        const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
        options2.timeout = 1000;
        for (let i = 0; i < 10; i++) {
          try {
            const promise1 = await lock1.lockAsync(async () => {
              console.log(`Iteration ${i}: Entered EXCLUSIVE lock1`);
              try {
                await lock2.lockAsync(async () => {
                  console.log(`Iteration ${i}: Entered EXCLUSIVE lock2`);
                  setTimeout(() => {
                    count++;
                    console.log(`Iteration ${i}: Logic inside setTimeout executed`);
                  }, 1000);
                  console.log(`Iteration ${i}: Exited EXCLUSIVE lock2`);
                }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options2);
              } catch (lock2Err) {
                console.error(`Iteration ${i}: Error acquiring lock2`, lock2Err);
              }
              console.log(`Iteration ${i}: Exited EXCLUSIVE lock1`);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options1);
            promises.push(promise1);
          } catch (lock1Err) {
            console.error(`Iteration ${i}: Error acquiring lock1`, lock1Err);
          }
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count < 10) {
          await sleep(300);
        }
        console.log('Success execution count: ' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest4900
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_4900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest4900';
        console.info(`${caseName} test start`);
        let count = 0;
        let task: taskpool.Task = new taskpool.Task(TaskFun49, 1);
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((value) => {
            count++;
            console.log('value:' + value);
          })
        }
        while (count != 3) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   AsynclockDifferentThirdTest5000
     * @tc.number SUB_ASYNCLOCK_DIFFERENT_TEST_5000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockDifferentThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockDifferentThirdTest5000';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while (count != 1) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

  })
}