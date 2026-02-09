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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';
import { BusinessError } from "@ohos.base";
import {
  printArgs3,
  printArgs1,
  sendData1,
  printArgsLock1,
  printArgsLock3,
  printArgsLock5,
  printArgsLock7,
  printArgsPromise1,
  printArgsPromise5,
  printArgsPromise7,
  printArgsPromise3,
  printArgsSettimeout1,
  printArgsSettimeout3,
  printArgsWait,
  printArgsWait1,
  printArgsWait2,
  printArgsWait3,
  printArgsTaskpool,
  printArgsTaskpool1,
  printArgsTaskpool2,
  printArgsTaskpool3
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2 } from '../testability/pages/DataFlg';
import { AsyncLockTest1, AsyncLockTest2 } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';

let tag: string = 'taskPoolAsyncRunner'

export default function taskPoolAsyncRunnerErrorTest() {
  describe('TaskPoolAsyncRunnerErrorTest', () => {
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
	  await sleep(50);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1001
     * @tc.name taskPoolAsyncRunnerErrorTest0100
     * @tc.desc test Common tasks are exceptional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info(`${tag} taskPoolAsyncRunnerErrorTest0100: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 2.0);
          try {
            asyncRunner.execute(task).catch((err: Error) => {
              console.log(`${tag} then task catch111: ${String(err)}`);
              expect(err.message).assertContain('Out of bounds');
              Count1++;
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.log(`${tag} then task2 catch222: ${String(err)}`);
              expect(err.message).assertContain('Out of bounds');
              Count2++;
            })
          } catch (e) {
            const err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info(`${tag} taskPoolAsyncRunnerErrorTest0100: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1002
     * @tc.name taskPoolAsyncRunnerErrorTest0200
     * @tc.desc test GenericsTask throws exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.info(`${tag} taskPoolAsyncRunnerErrorTest0200: start`);
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArgs3, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 2.0);
          try {
            asyncRunner.execute(task).catch((err: Error) => {
              Count1++;
              console.log(`${tag} ${Count1}: task1 catch: ${String(err)}`);
              expect(err.message).assertContain('Out of bounds');
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.log(`${tag} ${Count2}: task2 catch: ${String(err)}`);
              expect(err.message).assertContain('Out of bounds');
              Count2++;
            })
          } catch (e) {
            const err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.info(`${tag} taskPoolAsyncRunnerErrorTest0200: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1003
     * @tc.name taskPoolAsyncRunnerErrorTest0300
     * @tc.desc test OnEnqueued callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0300: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 1);
          task1.onEnqueued(() => {
            try {
              console.info('taskpool: onEnqueued')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              Count1++;
            }
          });
          task2.onEnqueued(() => {
            try {
              console.info('taskpool: onEnqueued')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              Count2++;
            }
          });
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.log(`${tag} then ${task2.name} catch: ${JSON.stringify(err)}`);
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0300: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1004
     * @tc.name taskPoolAsyncRunnerErrorTest0400
     * @tc.desc test OnStartExecution callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0400: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let lock1 = new Mutex();
        let lock2 = new Mutex();
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
          task1.onStartExecution(() => {
            try {
              console.info('taskpool: onStartExecution')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              lock1.lock();
              Count1++;
              lock1.unlock();
            }
          });
          task2.onStartExecution(() => {
            try {
              console.info('taskpool: onStartExecution')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              lock2.lock();
              Count2++;
              lock2.unlock();
            }
          });
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.log(`${tag} then ${task2.name} catch: ${JSON.stringify(err)}`);
            })
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0400: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1005
     * @tc.name taskPoolAsyncRunnerErrorTest0500
     * @tc.desc test OnExecutionFailed callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0500: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let lock1 = new Mutex();
        let lock2 = new Mutex();
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 2);
          task1.onExecutionFailed((e: Error) => {
            try {
              console.info('taskpool: onExecutionFailed error is ' + e);
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              lock1.lock();
              Count1++;
              lock1.unlock();
            }
          });
          task2.onExecutionFailed((e: Error) => {
            try {
              console.info('taskpool: onExecutionFailed error is ' + e);
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              lock2.lock();
              Count2++;
              lock2.unlock();
            }
          });
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0500: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST__1006
     * @tc.name taskPoolAsyncRunnerErrorTest0600
     * @tc.desc test OnExecutionSucceeded callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0600: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let lock = new Mutex();
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
          console.info('taskPoolAsyncRunnerErrorTest0600========1')
          task1.onExecutionSucceeded(() => {
            console.info('taskPoolAsyncRunnerErrorTest0600========2')
            try {
              console.info('taskPoolAsyncRunnerErrorTest0600========3')
              expect().assertFail();
              console.info('taskpool: onExecutionSucceededRCJ')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              console.info('taskPoolAsyncRunnerErrorTest0600========4')
              let err = e as Error;
              console.info(`${tag} execute errorRCJ:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
              lock.lock();
              Count1++;
              lock.unlock();
            }
          });
          task2.onExecutionSucceeded(() => {
            try {
              expect().assertFail()
              console.info('taskpool: onExecutionSucceeded')
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Out of bounds');
            }
          });
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              Count1++
              console.log(`${tag} taskPoolAsyncRunnerErrorTest0600 then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              Count2++
              console.log(`${tag} taskPoolAsyncRunnerErrorTest0600 then ${task2.name} catch: ${JSON.stringify(err)}`);
            })
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0400: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1007
     * @tc.name taskPoolAsyncRunnerErrorTest0700
     * @tc.desc test OnReceiveData callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0700: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(sendData1, 1);
          let task2: taskpool.Task = new taskpool.Task(sendData1, 2);
          let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
          task1.onReceiveData((data: number) => {
            try {
              console.info('taskpool: data is: ' + data);
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Cannot read property split of undefined');
              Count1++;
            }
          });
          task2.onReceiveData((data: number) => {
            try {
              console.info('taskpool: data is: ' + data);
              let s: string[] = [];
              s[0].split('')[1].toString();
            } catch (e) {
              let err = e as Error;
              console.info(`${tag} execute error:${err.message}`);
              expect(err.message).assertContain('Cannot read property split of undefined');
              Count2++;
            }
          });
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              Count1++;
              console.log(`${tag} then ${task1.name} catch: ${JSON.stringify(err)}`);
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              Count2++;
              console.log(`${tag} then ${task2.name} catch: ${JSON.stringify(err)}`);
            })
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0700: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1008
     * @tc.name taskPoolAsyncRunnerErrorTest0800
     * @tc.desc test Then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0800: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 2);
          try {
            asyncRunner.execute(task1).then(() => {
              try {
                console.info('dependency: second task1 success');
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Cannot read property split of undefined');
                Count1++;
              }
            }).catch((err: Error) => {
              Count1++;
              console.error('err: ' + err.message);
            });
            asyncRunner.execute(task2).then(() => {
              try {
                console.info('dependency: second task1 success');
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Cannot read property split of undefined');
                Count2++;
              }
            }).catch((err: Error) => {
              Count2++;
              console.error('err: ' + err.message);
            });
          }
          catch (e) {
            let err = e as Error;
            console.info(`${tag} taskPoolAsyncRunnerErrorTest0800:execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0800: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1009
     * @tc.name taskPoolAsyncRunnerErrorTest0900
     * @tc.desc test Catch callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0900: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 2);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              try {
                console.error('taskpool test occur error: ' + err.message);
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Out of bounds');
                Count1++;
              }
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              try {
                console.error('taskpool test occur error: ' + err.message);
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Out of bounds');
                Count2++;
              }
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest0900: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1010
     * @tc.name taskPoolAsyncRunnerErrorTest1000
     * @tc.desc test Finally callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1000: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs3, 1);
          let task2: taskpool.Task = new taskpool.Task(printArgs3, 2);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err.message);
            }).finally(() => {
              try {
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Out of bounds');
                Count1++;
              }
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err.message);
            }).finally(() => {
              try {
                let s: string[] = [];
                s[0].split('')[1].toString();
              } catch (e) {
                let err = e as Error;
                console.info(`${tag} execute error:${err.message}`);
                expect(err.message).assertContain('Out of bounds');
                Count2++;
              }
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1000: end`);

      })


    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1011
     * @tc.name taskPoolAsyncRunnerErrorTest1100
     * @tc.desc test AsyncLock callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1100: start`);
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsLock1);
          let task2: taskpool.Task = new taskpool.Task(printArgsLock1);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count1++;
            });
            ;
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1100: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1012
     * @tc.name taskPoolAsyncRunnerErrorTest1200
     * @tc.desc test AsyncLock's then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1200: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsLock3);
          let task2: taskpool.Task = new taskpool.Task(printArgsLock3);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count1++;
            });
            ;
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1200: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1013
     * @tc.name taskPoolAsyncRunnerErrorTest1300
     * @tc.desc test AsyncLock's catch callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1300: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsLock5);
          let task2: taskpool.Task = new taskpool.Task(printArgsLock5);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count1++;
            });
            ;
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1300: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1014
     * @tc.name taskPoolAsyncRunnerErrorTest1400
     * @tc.desc test AsyncLock's finally callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1400: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsLock7);
          let task2: taskpool.Task = new taskpool.Task(printArgsLock7);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Out of bounds');
              Count1++;
            });
            ;
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Out of bounds');
              Count2++;
            })
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1400: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1015
     * @tc.name taskPoolAsyncRunnerErrorTest1500
     * @tc.desc test Promise callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1500: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsPromise1);
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise1);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in task execution.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1500: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1016
     * @tc.name taskPoolAsyncRunnerErrorTest1600
     * @tc.desc test Promise's then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1600: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsPromise3);
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise3);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in then callback.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in then callback.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1600: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1017
     * @tc.name taskPoolAsyncRunnerErrorTest1700
     * @tc.desc test Promise's catch callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1700: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsPromise5);
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise5);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in then callback.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in then callback.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1700: end`);

      })

    /**
     * @tc.number SUB_SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1018
     * @tc.name taskPoolAsyncRunnerErrorTest1800
     * @tc.desc test Promise's finally callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1800: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsPromise7);
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise7);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
              Count1++;
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in finally callback.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
              Count2++;
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in finally callback.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1800: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1019
     * @tc.name taskPoolAsyncRunnerErrorTest1900
     * @tc.desc test Settimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1900: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsSettimeout1);
          let task2: taskpool.Task = new taskpool.Task(printArgsSettimeout1);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in setTimeout callback.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in setTimeout callback.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest1900: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1020
     * @tc.name taskPoolAsyncRunnerErrorTest2000
     * @tc.desc test Asynchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2000: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsSettimeout3);
          let task2: taskpool.Task = new taskpool.Task(printArgsSettimeout3);
          try {
            asyncRunner.execute(task1).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err.message);
              expect(err.message).assertContain('Simulated error in async operation.');
              Count1++;
            });
            asyncRunner.execute(task2).then(() => {
              console.info('taskpool: execute task success');
            }).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err);
              expect(err.message).assertContain('Simulated error in async operation.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.info(`${tag} execute error:${err.message}`);
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2000: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1025
     * @tc.name taskPoolAsyncRunnerErrorTest2500
     * @tc.desc test Worker callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerErrorTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     console.log(`${tag} taskPoolAsyncRunnerErrorTest2500: start`);
    //     let Count1: number = 0;
    //     let Count2: number = 0;
    //     let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //     for (let i = 0; i < 10; i++) {
    //       let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
    //       let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
    //       asyncRunner.execute(task1).then(() => {
    //         let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
    //         work.onerror = (e: ErrorEvent): void => {
    //           try {
    //             let s: string[] = [];
    //             s[0].split('')[1].toString();
    //           } catch (e) {
    //             Count1++;
    //             work.terminate();
    //           }
    //         }
    //         work.postMessage('2');
    //       });
    //       asyncRunner.execute(task2).then(() => {
    //         let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
    //         work.onerror = (e: ErrorEvent): void => {
    //           try {
    //             let s: string[] = [];
    //             s[0].split('')[1].toString();
    //           } catch (e) {
    //             Count2++;
    //             work.terminate();
    //           }
    //         }
    //         work.postMessage('2');
    //       })
    //     }
    //     while (Count1 < 10 || Count2 < 10) {
    //       await sleep(100);
    //     }
    //     expect(10).assertEqual(Count1);
    //     expect(10).assertEqual(Count2);
    //     Count1 = 0;
    //     Count2 = 0;
    //     console.log(`${tag} taskPoolAsyncRunnerErrorTest2500: end`);
    //
    //   })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1026
     * @tc.name taskPoolAsyncRunnerErrorTest2600
     * @tc.desc test Worker callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('taskPoolAsyncRunnerErrorTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     console.log(`${tag} taskPoolAsyncRunnerErrorTest2600: start`);
    //     let Count1: number = 0;
    //     let Count2: number = 0;
    //     let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
    //     for (let i = 0; i < 10; i++) {
    //       let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
    //       let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
    //       asyncRunner.execute(task1).then(() => {
    //         let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
    //         work.onmessage = (e: MessageEvents): void => {
    //           try {
    //             let s: string[] = [];
    //             s[0].split('')[1].toString();
    //           } catch (e) {
    //             Count1++;
    //             work.terminate();
    //           }
    //         }
    //         work.postMessage('1');
    //       });
    //       asyncRunner.execute(task2).then(() => {
    //         let work = new worker.ThreadWorker('../testability/pages/workers/Worker.ets');
    //         work.onmessage = (e: MessageEvents): void => {
    //           try {
    //             let s: string[] = [];
    //             s[0].split('')[1].toString();
    //           } catch (e) {
    //             Count2++;
    //             work.terminate();
    //           }
    //         }
    //         work.postMessage('1');
    //       });
    //     }
    //     while (Count1 < 10 || Count2 < 10) {
    //       await sleep(100);
    //     }
    //     expect(10).assertEqual(Count1);
    //     expect(10).assertEqual(Count2);
    //     Count1 = 0;
    //     Count2 = 0;
    //     console.log(`${tag} taskPoolAsyncRunnerErrorTest2600: end`);
    //
    //   })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1027
     * @tc.name taskPoolAsyncRunnerErrorTest2700
     * @tc.desc test Taskpool callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2700: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool, 2.0);
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              Count1++;
              console.error(`${Count1}_taskpool test occur error: ` + JSON.stringify(err));
              expect(err.message).assertContain('Simulated error in task execution');
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.error(`${Count2}_taskpool test occur error: ` + JSON.stringify(err));
              Count2++;
              expect(err.message).assertContain('Simulated error in task execution');
            });
          } catch (e) {
            let err = e as Error;
            console.error('taskpool test occur error: ' + JSON.stringify(err.message));
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2700: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1028
     * @tc.name taskPoolAsyncRunnerErrorTest2800
     * @tc.desc test Taskpool's then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2800: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool1, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool1, 1.0);
          asyncRunner.execute(task1).catch((err: Error) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertContain('Simulated error in then execution.');
            Count1++;
          });
          asyncRunner.execute(task2).catch((err: Error) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertContain('Simulated error in then execution.');
            Count2++;
          });
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2800: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1029
     * @tc.name taskPoolAsyncRunnerErrorTest2900
     * @tc.desc test Taskpool's catch callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2900: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool2, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool2, 2.0);
          try {
            asyncRunner.execute(task1).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err.message);
              expect(err.message).assertContain('Simulated error in catch execution.');
              Count1++;
            });
            asyncRunner.execute(task2).catch((err: Error) => {
              console.error('taskpool test occur error: ' + err.message);
              expect(err.message).assertContain('Simulated error in catch execution.');
              Count2++;
            });
          } catch (e) {
            let err = e as Error;
            console.error('catch callback occur error: ' + JSON.stringify(err.message));
          }
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest2900: end`);

      })

    /**
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ERROR_TEST_1030
     * @tc.name taskPoolAsyncRunnerErrorTest3000
     * @tc.desc test Taskpool's fianlly callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolAsyncRunnerErrorTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (): Promise<void> => {
        console.log(`${tag} taskPoolAsyncRunnerErrorTest3000: start`);
        let Count1: number = 0;
        let Count2: number = 0;
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgsTaskpool3, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgsTaskpool3, 1.0);
          asyncRunner.execute(task1).catch((err: Error) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertContain('Simulated error in finally execution.');
            Count1++;
          });
          asyncRunner.execute(task2).catch((err: Error) => {
            console.error('taskpool test occur error: ' + err.message);
            expect(err.message).assertContain('Simulated error in finally execution.');
            Count2++;
          });
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log(`${tag} taskPoolAsyncRunnerErrorTest3000: end`);

      })
  })
}