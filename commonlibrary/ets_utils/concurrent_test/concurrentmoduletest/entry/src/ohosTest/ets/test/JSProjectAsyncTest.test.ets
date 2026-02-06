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
  JSasyncTest1,
  JSasyncTest2,
  JSasyncTest3,
  JSasyncTest4,
  JSasyncTest5,
  JSasyncTest6,
  JSasyncTest7,
  JSasyncTest8,
  JSasyncTest9,
  JSasyncTest10,
  JSasyncTest11,
  JSasyncTest12,
  JSasyncTest13,
  JSasyncTest14,
  JSasyncTest15,
  JSasyncTest16,
  JSasyncTest17,
  JSasyncTest18,
  JSasyncTest19,
  JSasyncTest20,
  JSasyncTest21,
  JSasyncTest22,
  JSasyncTest23,
  JSasyncTest24,
  JSasyncTest25,
  JSasyncTest26,
} from 'library1/src/main/ets/components/JSProjectAsyncMethod'

import {
  JSasyncTestFunc1,
  JSasyncTestFunc2,
  JSasyncTestFunc3,
  JSasyncTestFunc4,
  JSasyncTestFunc5,
  JSasyncTestFunc6,
  JSasyncTestFunc7,
  JSasyncTestFunc8,
  JSasyncTestFunc9,
} from '../testability/JSProjectTestfun';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function JSProjectAsyncTest() {
  describe('JSProjectAsyncTest', () => {
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
     * @tc.number JS_PROJECT_ASYNC_METHOD_0100
     * @tc.name JSProjectAsyncTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0100';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest1();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0200
     * @tc.name JSProjectAsyncTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0200';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest2();
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0300
     * @tc.name JSProjectAsyncTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0300';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest3();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0400
     * @tc.name JSProjectAsyncTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest4();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0500
     * @tc.name JSProjectAsyncTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest5();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0600
     * @tc.name JSProjectAsyncTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0600';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest6(null);
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0700
     * @tc.name JSProjectAsyncTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0700';
        console.info(`${caseName} test start`);
        const p: string = await JSasyncTest7();
        expect(p).assertEqual('66');
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0800
     * @tc.name JSProjectAsyncTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0800';
        console.info(`${caseName} test start`);
        const p: string = await JSasyncTest8();
        expect(p).assertEqual('66');
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_0900
     * @tc.name JSProjectAsyncTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest0900';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest9();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1000
     * @tc.name JSProjectAsyncTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1000';
        console.info(`${caseName} test start`);
        const p: boolean = await JSasyncTest10();
        expect(p).assertTrue();
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1100
     * @tc.name JSProjectAsyncTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1100';
        console.info(`${caseName} test start`);
        const p: bigint = await JSasyncTest11();
        expect(p).assertEqual(66n);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1400
     * @tc.name JSProjectAsyncTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1400';
        console.info(`${caseName} test start`);
        const p: number[] = await JSasyncTest14();
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1600
     * @tc.name JSProjectAsyncTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1600';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest16();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1700
     * @tc.name JSProjectAsyncTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1700';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest17();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1800
     * @tc.name JSProjectAsyncTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1800';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest18();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_1900
     * @tc.name JSProjectAsyncTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest1900';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          const q: Error = await JSasyncTest19();
          throw q;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2100
     * @tc.name JSProjectAsyncTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2100';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest21();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2200
     * @tc.name JSProjectAsyncTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2200';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest22();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2300
     * @tc.name JSProjectAsyncTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2300';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest23();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2400
     * @tc.name JSProjectAsyncTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2400';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest24();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2500
     * @tc.name JSProjectAsyncTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2500';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest25();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2600
     * @tc.name JSProjectAsyncTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2600';
        console.info(`${caseName} test start`);
        const p: number = await JSasyncTest26();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2700
     * @tc.name JSProjectAsyncTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2700';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSasyncTest2().then((result: number) => {
          expect(result).assertEqual(66);
        })

        await JSasyncTest3().then((result: number) => {
          expect(result).assertEqual(66);
        })

        await JSasyncTest26().then((result: number) => {
          expect(result).assertEqual(66);
        })
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2800
     * @tc.name JSProjectAsyncTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2800';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSasyncTest5().catch(() => {
          p++;
          expect(p).assertEqual(1);
        })

        await JSasyncTest21().catch(() => {
          p++;
          expect(p).assertEqual(2);
        })
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_2900
     * @tc.name JSProjectAsyncTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest2900';
        console.info(`${caseName} test start`);
        let p = 0;
        await JSasyncTest9().finally(() => {
          p++;
          expect(p).assertEqual(1);
        })

        try {
          await JSasyncTest6(null).finally(() => {
            p++;
          });
        } catch (e) {
          expect(p).assertEqual(2);
        }

        await JSasyncTest3().finally(() => {
          p++;
          expect(p).assertEqual(3);
        })
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3000
     * @tc.name JSProjectAsyncTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3000';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSasyncTest1();
        const promise2: Promise<number> = JSasyncTest9();
        const promise3: Promise<number> = JSasyncTest24();
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
     * @tc.number JS_PROJECT_ASYNC_METHOD_3100
     * @tc.name JSProjectAsyncTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3100';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSasyncTest22();
        const promise2: Promise<number> = JSasyncTest25();
        const promise3: Promise<number> = JSasyncTest26();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.race(promises);
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3200
     * @tc.name JSProjectAsyncTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3200';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSasyncTest1();
        const promise2: Promise<number> = JSasyncTest9();
        const promise3: Promise<number> = JSasyncTest26();
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
     * @tc.number JS_PROJECT_ASYNC_METHOD_3300
     * @tc.name JSProjectAsyncTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3300';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = JSasyncTest3();
        const promise2: Promise<number> = JSasyncTest9();
        const promise3: Promise<number> = JSasyncTest23();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.any(promises)
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3400
     * @tc.name JSProjectAsyncTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTest6(null);
        } catch (e) {
          p++;
        }

        try {
          await JSasyncTest17();
        } catch (e) {
          p++;
        }

        try {
          await JSasyncTest18();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(3);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3500
     * @tc.name JSProjectAsyncTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await JSasyncTestFunc1();
        } catch (e) {
          p++;
        }
        try {
          await JSasyncTestFunc2();
        } catch (e) {
          p++;
        }
        try {
          await JSasyncTestFunc3();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(3);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3600
     * @tc.name JSProjectAsyncTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc4);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3700
     * @tc.name JSProjectAsyncTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc5);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66n);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3800
     * @tc.name JSProjectAsyncTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc6);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('66');
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_3900
     * @tc.name JSProjectAsyncTest3900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest3900';
        console.info(`${caseName} test start`);
        let num: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/JSProjectWorker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 66) {
          await sleep(300)
        }
        expect(num).assertEqual(66);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_4100
     * @tc.name JSProjectAsyncTest4100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest4100';
        console.info(`${caseName} test start`);
        let num: string = '';
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/JSProjectWorker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != '66') {
          await sleep(300)
        }
        expect(num).assertEqual('66');
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_4200
     * @tc.name JSProjectAsyncTest4200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest4200';
        console.info(`${caseName} test start`);
        let p = await new Promise<boolean>((resolve, reject) => {
          let result: Promise<boolean> = JSasyncTest10();
          resolve(result);
        });
        expect(p).assertTrue();
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_4300
     * @tc.name JSProjectAsyncTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest4300';
        console.info(`${caseName} test start`);
        let p = await new Promise<number[]>((resolve, reject) => {
          let result: Promise<number[]> = JSasyncTest14();
          resolve(result);
        });
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_4400
     * @tc.name JSProjectAsyncTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest4400';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve, reject) => {
          let result: Promise<number> = JSasyncTest1();
          resolve(result);
        });
        expect(p).assertEqual(66);
        Done();
      })

    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_4900
     * @tc.name JSProjectAsyncTest4900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest4900';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p: number[] = await JSasyncTest14()
          expect(p[0]).assertEqual(65);
          expect(p[1]).assertEqual(66);
          expect(p[2]).assertEqual(67);
          Done();
        }, 1000);
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_5000
     * @tc.name JSProjectAsyncTest5000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest5000';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p: bigint = await JSasyncTest11()
          expect(p).assertEqual(66n);
          Done();
        }, 1000);
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_5100
     * @tc.name JSProjectAsyncTest5100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest5100';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc7);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('66');
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_5200
     * @tc.name JSProjectAsyncTest5200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest5200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc8);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.number JS_PROJECT_ASYNC_METHOD_5300
     * @tc.name JSProjectAsyncTest5300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectAsyncTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectAsyncTest5300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(JSasyncTestFunc9);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })
  })
};