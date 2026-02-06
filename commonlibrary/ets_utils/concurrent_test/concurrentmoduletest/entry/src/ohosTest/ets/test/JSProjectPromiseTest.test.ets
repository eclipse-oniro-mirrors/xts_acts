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
  Person,
  JSpromiseTest1,
  JSpromiseTest2,
  JSpromiseTest3,
  JSpromiseTest4,
  JSpromiseTest5,
  JSpromiseTest6,
  JSpromiseTest7,
  JSpromiseTest10,
  JSpromiseTest11,
  JSpromiseTest12,
  JSpromiseTest13,
  JSpromiseTest14,
  JSpromiseTest15,
  JSpromiseTest16,
  JSpromiseTest17,
  JSpromiseTest18,
  JSpromiseTest19,
  JSpromiseTest23,
  JSpromiseTest24,
  JSpromiseTest25,
  JSpromiseTest26,
  JSpromiseTest27,
  JSpromiseTest28,
  JSpromiseTest29,
} from 'library1/src/main/ets/components/JSProjectPromiseMethod'

import {
  JSpromiseTestFunc1,
  JSpromiseTestFunc2,
  JSpromiseTestFunc3,
  JSpromiseTestFunc4,
  JSpromiseTestFunc5,
  JSpromiseTestFunc6,
  JSpromiseTestFunc7,
  JSpromiseTestFunc8,
  JSpromiseTestFunc9,
} from '../testability/JSProjectTestfun2';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function JSProjectPromiseTest() {
  describe('JSProjectPromiseTest', () => {
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
     * @tc.number JS_PROJECT_PROMISE_METHOD_0100
     * @tc.name JSProjectPromiseTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0100';
        console.info(`${caseName} test start`);
        const p: string = await JSpromiseTest1;
        expect(p).assertEqual('66');
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0200
     * @tc.name JSProjectPromiseTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0200';
        console.info(`${caseName} test start`);
        const p: number[] = await JSpromiseTest7;
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0300
     * @tc.name JSProjectPromiseTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0300';
        console.info(`${caseName} test start`);
        const p: undefined = await JSpromiseTest11;
        expect(p).assertEqual(undefined);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0400
     * @tc.name JSProjectPromiseTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0400';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSpromiseTest4.then((result: bigint) => {
          expect(result).assertEqual(66n);
        })

        await JSpromiseTest3.then((result: boolean) => {
          expect(result).assertTrue();
        })

        await JSpromiseTest14.then((result: number) => {
          expect(result).assertEqual(66);
        })
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0500
     * @tc.name JSProjectPromiseTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0500';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSpromiseTest12.catch(() => {
          p++;
          expect(p).assertEqual(1);
        })

        await JSpromiseTest15.catch(() => {
          p++;
          expect(p).assertEqual(2);
        })
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0600
     * @tc.name JSProjectPromiseTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0600';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSpromiseTest5.finally(() => {
          p++;
          expect(p).assertEqual(1);
        })

        try {
          await JSpromiseTest6.finally(() => {
            p++;
          });
        } catch (e) {
          expect(p).assertEqual(2);
        }
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0700
     * @tc.name JSProjectPromiseTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0700';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSpromiseTest2;
        const promise2: Promise<number> = JSpromiseTest14;
        const promise3: Promise<number> = JSpromiseTest16;
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.all(promises);
        expect(p[0]).assertEqual(66);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0800
     * @tc.name JSProjectPromiseTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0800';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSpromiseTest14;
        const promise2: Promise<number> = JSpromiseTest24(1);
        const promise3: Promise<number> = JSpromiseTest27;
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.race(promises);
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_0900
     * @tc.name JSProjectPromiseTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest0900';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSpromiseTest2;
        const promise2: Promise<number> = JSpromiseTest14;
        const promise3: Promise<number> = JSpromiseTest24(33);
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        await Promise.allSettled(promises)
          .then((results) => {
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                expect(result.status).assertEqual('fulfilled');
                expect(result.value).assertEqual(66);
              } else {
                throw new Error;
              }
            });
          });
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1000
     * @tc.name JSProjectPromiseTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1000';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSpromiseTest2;
        const promise2: Promise<number> = JSpromiseTest14;
        const promise3: Promise<number> = JSpromiseTest16;
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.any(promises)
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1100
     * @tc.name JSProjectPromiseTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1100';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSpromiseTest17();
        } catch (e) {
          p++;
        }

        try {
          await JSpromiseTest18();
        } catch (e) {
          p++;
        }

        try {
          await JSpromiseTest19();
        } catch (e) {
          p++;
        }

        try {
          await JSpromiseTest23(1);
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(4);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1200
     * @tc.name JSProjectPromiseTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1200';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSpromiseTestFunc1();
        } catch (e) {
          p++;
        }
        try {
          await JSpromiseTestFunc2();
        } catch (e) {
          p++;
        }
        try {
          await JSpromiseTestFunc3();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(3);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1300
     * @tc.name JSProjectPromiseTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc4);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('Hello World!');
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1400
     * @tc.name JSProjectPromiseTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc5);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(null);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1500
     * @tc.name JSProjectPromiseTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc6);
        await taskpool.execute(task).then((result) => {
          expect(result).assertTrue();
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1600
     * @tc.name JSProjectPromiseTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1600';
        console.info(`${caseName} test start`);
        let num: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/JSProjectWorker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 16) {
          await sleep(100)
        }
        expect(num).assertEqual(16);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1700
     * @tc.name JSProjectPromiseTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1700';
        console.info(`${caseName} test start`);
        let num: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/JSProjectWorker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 7) {
          await sleep(100)
        }
        expect(num).assertEqual(7);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1800
     * @tc.name JSProjectPromiseTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1800';
        console.info(`${caseName} test start`);
        let num: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/JSProjectWorker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 4) {
          await sleep(100)
        }
        expect(num).assertEqual(4);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_1900
     * @tc.name JSProjectPromiseTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest1900';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve, reject) => {
          let result: Promise<number> = JSpromiseTest26(1);
          resolve(result);
        });
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2000
     * @tc.name JSProjectPromiseTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2000';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve, reject) => {
          let result: Promise<number> = JSpromiseTest24(1);
          resolve(result);
        });
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2100
     * @tc.name JSProjectPromiseTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2100';
        console.info(`${caseName} test start`);

        let p = await new Promise<PromiseSettledResult<number>[]>((resolve) => {
          let result: Promise<PromiseSettledResult<number>[]> = JSpromiseTest25(1);
          resolve(result);
        });

        expect(p[0].status).assertEqual('fulfilled');
        expect((p[0] as PromiseFulfilledResult<number>).value).assertEqual(2);

        expect(p[1].status).assertEqual('fulfilled');
        expect((p[1] as PromiseFulfilledResult<number>).value).assertEqual(3);

        expect(p[2].status).assertEqual('rejected');
        expect((p[2] as PromiseRejectedResult).reason.message).assertEqual('For test');

        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2200
     * @tc.name JSProjectPromiseTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2200';
        console.info(`${caseName} test start`);

        let person = await new Promise<Person>((resolve) => {
          let result: Promise<Person> = JSpromiseTest13;
          resolve(result);
        });

        expect(person.name).assertEqual('John');
        Done();
      });


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2300
     * @tc.name JSProjectPromiseTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2300';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p: number = await JSpromiseTest28;
          expect(p).assertEqual(7);
          Done();
        }, 1000);
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2400
     * @tc.name JSProjectPromiseTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2400';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p: number = await JSpromiseTest29;
          expect(p).assertEqual(4);
          Done();
        }, 1000);
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2500
     * @tc.name JSProjectPromiseTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2500';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p: null = await JSpromiseTest10;
          expect(p).assertEqual(null);
          Done();
        }, 1000);
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2600
     * @tc.name JSProjectPromiseTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc7);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66n);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2700
     * @tc.name JSProjectPromiseTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc8);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(16);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_PROMISE_METHOD_2800
     * @tc.name JSProjectPromiseTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectPromiseTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectPromiseTest2800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSpromiseTestFunc9);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })
  })
};