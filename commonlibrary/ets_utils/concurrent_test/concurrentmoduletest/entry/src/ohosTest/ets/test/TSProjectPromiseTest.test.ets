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
  TSpromiseTest1,
  TSpromiseTest2,
  TSpromiseTest3,
  TSpromiseTest4,
  TSpromiseTest5,
  TSpromiseTest6,
  TSpromiseTest7,
  TSpromiseTest8,
  TSpromiseTest9,
  TSpromiseTest10,
  TSpromiseTest11,
  TSpromiseTest12,
  TSpromiseTest13,
  TSpromiseTest14,
  TSpromiseTest16,
  TSpromiseTest17,
  TSpromiseTest18,
  TSpromiseTest19,
  TSpromiseTest24,
  TSpromiseTest25,
  TSpromiseTest26,
  TSpromiseTest27,
  TSpromiseTest28,
  TSpromiseTest29,
} from 'library1/src/main/ets/components/TSProjectPromiseMethod'

import {
  TSpromiseTestFunc2,
  TSpromiseTestFunc3,
  TSpromiseTestFunc4,
  TSpromiseTestFunc5,
  TSpromiseTestFunc6,
  TSpromiseTestFunc7,
  TSpromiseTestFunc8,
  TSpromiseTestFunc9,
} from '../testability/TSProjectTestfun2';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function TSProjectPromiseTest() {
  describe('TSProjectPromiseTest', () => {
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
     * @tc.number PROMISE_TS_PROJECT_0100
     * @tc.name TSProjectPromiseTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0100';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest1;
        expect(p).assertEqual('66');
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0200
     * @tc.name TSProjectPromiseTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0200';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest2;
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0300
     * @tc.name TSProjectPromiseTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0300';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest3;
        expect(p).assertTrue();
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0400
     * @tc.name TSProjectPromiseTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0400';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest4;
        expect(p).assertEqual(66n);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0500
     * @tc.name TSProjectPromiseTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0500';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest5;
        expect(p.age).assertEqual(30);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0600
     * @tc.name TSProjectPromiseTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0600';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest6;
        expect(p.age).assertEqual(30);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0700
     * @tc.name TSProjectPromiseTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0700';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest7;
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_0800
     * @tc.name TSProjectPromiseTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest0800';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest8;
        let q = p();
        expect(q).assertEqual('Hello World!');
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1000
     * @tc.name TSProjectPromiseTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1000';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest10;
        expect(p).assertEqual(null);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1100
     * @tc.name TSProjectPromiseTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1100';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest11;
        expect(p).assertEqual(undefined);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1200
     * @tc.name TSProjectPromiseTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1200';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await TSpromiseTest12;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1300
     * @tc.name TSProjectPromiseTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1300';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest13;
        expect(p.name).assertEqual('John');
        expect(p.surname).assertEqual('Smith');
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1400
     * @tc.name TSProjectPromiseTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1400';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest29;
        expect(p).assertEqual(4);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1600
     * @tc.name TSProjectPromiseTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1600';
        console.info(`${caseName} test start`);
        const p = await TSpromiseTest16;
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1700
     * @tc.name TSProjectPromiseTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await TSpromiseTest17;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1800
     * @tc.name TSProjectPromiseTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1800';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await TSpromiseTest18;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_1900
     * @tc.name TSProjectPromiseTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest1900';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await TSpromiseTest19;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      })

    /**
     * @tc.number PROMISE_TS_PROJECT_2400
     * @tc.name TSProjectPromiseTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest2400';
        console.info(`${caseName} test start`);
        let p: number = 0;
        try {
          p = await TSpromiseTest24(1);
        } catch (e) {
          console.error('error');
        }
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_2500
     * @tc.name TSProjectPromiseTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest2500';
        console.info(`${caseName} test start`);
        let p: number = 0;
        try {
          const results = await TSpromiseTest25(1);
          for (const result of results) {
            if (result.status === 'fulfilled') {
              p = result.value;
              break;
            }
          }
        } catch (e) {
          console.error('error');
        }
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number PROMISE_TS_PROJECT_2600
     * @tc.name TSProjectPromiseTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest2600';
        console.info(`${caseName} test start`);
        let p: number = 0;
        try {
          p = await TSpromiseTest26(1);
        } catch (e) {
          console.error('error');
        }
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_3300
     * @tc.name TSProjectPromiseTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3300';
        console.info(`${caseName} test start`);
        let p = 0;
        await TSpromiseTest1.then((result) => {
          expect(result).assertEqual('66');
        })

        await TSpromiseTest3.then((result) => {
          expect(result).assertTrue();
        })

        await TSpromiseTest7.then((result) => {
          expect(result[0]).assertEqual(65);
          expect(result[1]).assertEqual(66);
          expect(result[2]).assertEqual(67);
        })
        Done();
      });

    /**
     * @tc.number TS_PROJECT_3500
     * @tc.name TSProjectPromiseTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3500';
        console.info(`${caseName} test start`);
        let p = 0;
        await TSpromiseTest16.finally(() => {
          p++;
          expect(p).assertEqual(1);
        })

        try {
          await TSpromiseTest28.finally(() => {
            p++;
          });
        } catch (e) {
          expect(p).assertEqual(2);
        }
        Done();
      });


    /**
     * @tc.number TS_PROJECT_3600
     * @tc.name TSProjectPromiseTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3600';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = TSpromiseTest16;
        const promise2: Promise<number> = TSpromiseTest14;
        const promise3: Promise<number> = TSpromiseTest2;
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
     * @tc.number TS_PROJECT_3700
     * @tc.name TSProjectPromiseTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3700';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = TSpromiseTest14;
        const promise2: Promise<number> = TSpromiseTest24(1);
        const promise3: Promise<number> = TSpromiseTest26(1);
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.race(promises);
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number TS_PROJECT_3800
     * @tc.name TSProjectPromiseTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3800';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = TSpromiseTest2;
        const promise2: Promise<number> = TSpromiseTest14;
        const promise3: Promise<number> = TSpromiseTest16;
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
     * @tc.number TS_PROJECT_3900
     * @tc.name TSProjectPromiseTest3900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest3900';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = TSpromiseTest2;
        const promise2: Promise<number> = TSpromiseTest24(1);
        const promise3: Promise<number> = TSpromiseTest26(1);
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.any(promises)
        expect(p).assertEqual(66);
        Done();
      })

    /**
     * @tc.number TS_PROJECT_4200
     * @tc.name TSProjectPromiseTest4200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc4);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(2);
          Done();
        })
      })


    /**
     * @tc.number TS_PROJECT_4300
     * @tc.name TSProjectPromiseTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc5);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66n);
          Done();
        })
      })


    /**
     * @tc.number TS_PROJECT_4400
     * @tc.name TSProjectPromiseTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc6);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('Hello World!');
          Done();
        })
      })


    /**
     * @tc.number TS_PROJECT_4500
     * @tc.name TSProjectPromiseTest4500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4500';
        console.info(`${caseName} test start`);
        let num: bigint = 0n;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/TSProjectWorker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 66n) {
          await sleep(100)
        }
        expect(num).assertEqual(66n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_4600
     * @tc.name TSProjectPromiseTest4600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4600';
        console.info(`${caseName} test start`);
        let num: string = '';
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/TSProjectWorker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != '66') {
          await sleep(100)
        }
        expect(num).assertEqual('66');
        Done();
      })


    /**
     * @tc.number TS_PROJECT_4700
     * @tc.name TSProjectPromiseTest4700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4700';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve, reject) => {
          let result = TSpromiseTest14;
          resolve(result);
        });
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_4800
     * @tc.name TSProjectPromiseTest4800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4800';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve, reject) => {
          let result = TSpromiseTest24(1);
          resolve(result);
        });
        expect(p).assertEqual(2);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_4900
     * @tc.name TSProjectPromiseTest4900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest4900';
        console.info(`${caseName} test start`);
        let p = await new Promise<number[]>((resolve, reject) => {
          let result = TSpromiseTest7;
          resolve(result);
        });
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_5000
     * @tc.name TSProjectPromiseTest5000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5000';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await TSpromiseTest5;
          expect(p.age).assertEqual(30);
          Done();
        }, 1000);
      })


    /**
     * @tc.number TS_PROJECT_5100
     * @tc.name TSProjectPromiseTest5100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5100';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await TSpromiseTest6;
          expect(p.age).assertEqual(30);
          Done();
        }, 1000);
      })


    /**
     * @tc.number TS_PROJECT_5200
     * @tc.name TSProjectPromiseTest5200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5200';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await TSpromiseTest27;
          expect(p).assertEqual(16);
          Done();
        }, 1000);
      })


    /**
     * @tc.number TS_PROJECT_5300
     * @tc.name TSProjectPromiseTest5300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc7);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.number TS_PROJECT_5400
     * @tc.name TSProjectPromiseTest5400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc8);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.number TS_PROJECT_5500
     * @tc.name TSProjectPromiseTest5500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectPromiseTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectPromiseTest5500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(TSpromiseTestFunc9);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })
  })
};