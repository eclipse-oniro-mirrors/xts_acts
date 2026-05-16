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
  exportTest1,
  exportTest2,
  exportTest3,
  exportTest4,
  exportTest5,
  exportTest6,
  exportTest7,
  exportTest8,
  exportTest9,
  exportTest10,
  exportTest11,
  exportTest12,
  exportTest13,
  exportTest14,
  exportTest15,
  exportTest16,
  exportTest17,
  exportTest18,
  exportTest19,
  exportTest20,
  exportTest21,
  exportTest22,
  exportTest23,
  exportTest24,
  exportTest25,
} from 'library1/src/main/ets/components/TSProjectAsyncMethod'

import {
  testfunction1,
  testfunction2,
  testfunction3,
  testfunction4,
  testfunction5,
  testfunction6,
  testfunction7,
  testfunction8,
  testfunction9,
} from '../testability/TSProjectTestfun';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function TSProjectAsyncTest() {
  describe('TSProjectAsyncTest', () => {
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
     * @tc.name   TSProjectAsyncTest0100
     * @tc.number TS_PROJECT_ASYNC_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0100';
        console.info(`${caseName} test start`);
        const p: number = await exportTest1();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0200
     * @tc.number TS_PROJECT_ASYNC_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0200';
        console.info(`${caseName} test start`);
        const p: number = await exportTest2();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0300
     * @tc.number TS_PROJECT_ASYNC_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0300';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest3();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0400
     * @tc.number TS_PROJECT_ASYNC_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest4();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0500
     * @tc.number TS_PROJECT_ASYNC_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest5(null);
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0600
     * @tc.number TS_PROJECT_ASYNC_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0600';
        console.info(`${caseName} test start`);
        const p: string = await exportTest6();
        expect(p).assertEqual('66');
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0700
     * @tc.number TS_PROJECT_ASYNC_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0700';
        console.info(`${caseName} test start`);
        const p: string = await exportTest7();
        expect(p).assertEqual('66');
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0800
     * @tc.number TS_PROJECT_ASYNC_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0800';
        console.info(`${caseName} test start`);
        const p: number = await exportTest8();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest0900
     * @tc.number TS_PROJECT_ASYNC_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest0900';
        console.info(`${caseName} test start`);
        const p: boolean = await exportTest9();
        expect(p).assertTrue();
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1000
     * @tc.number TS_PROJECT_ASYNC_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1000';
        console.info(`${caseName} test start`);
        const p: bigint = await exportTest10();
        expect(p).assertEqual(66n);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1100
     * @tc.number TS_PROJECT_ASYNC_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1100';
        console.info(`${caseName} test start`);
        const p = await exportTest11();
        expect(p.age).assertEqual(30);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1200
     * @tc.number TS_PROJECT_ASYNC_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1200';
        console.info(`${caseName} test start`);
        const p = await exportTest12();
        expect(p.age).assertEqual(30);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1300
     * @tc.number TS_PROJECT_ASYNC_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1300';
        console.info(`${caseName} test start`);
        const p: number[] = await exportTest13();
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1400
     * @tc.number TS_PROJECT_ASYNC_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1400';
        console.info(`${caseName} test start`);
        const p = await exportTest14();
        const q = p();
        expect(q).assertEqual('Hello World!');
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1500
     * @tc.number TS_PROJECT_ASYNC_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest15();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1600
     * @tc.number TS_PROJECT_ASYNC_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1600';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest16();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1700
     * @tc.number TS_PROJECT_ASYNC_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1700';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest17();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1800
     * @tc.number TS_PROJECT_ASYNC_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1800';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          const q = await exportTest18();
          throw q;
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest1900
     * @tc.number TS_PROJECT_ASYNC_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest1900';
        console.info(`${caseName} test start`);
        const p = await exportTest19();
        expect(p.name).assertEqual('John');
        expect(p.surname).assertEqual('Smith');
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2000
     * @tc.number TS_PROJECT_ASYNC_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2000';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest20();
        } catch (e) {
          p = 66;
        }
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2100
     * @tc.number TS_PROJECT_ASYNC_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2100';
        console.info(`${caseName} test start`);
        const p = await exportTest21();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2200
     * @tc.number TS_PROJECT_ASYNC_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2200';
        console.info(`${caseName} test start`);
        const p = await exportTest22();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2300
     * @tc.number TS_PROJECT_ASYNC_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2300';
        console.info(`${caseName} test start`);
        const p = await exportTest23();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2400
     * @tc.number TS_PROJECT_ASYNC_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2400';
        console.info(`${caseName} test start`);
        const p = await exportTest24();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2500
     * @tc.number TS_PROJECT_ASYNC_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2500';
        console.info(`${caseName} test start`);
        const p = await exportTest25();
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2600
     * @tc.number TS_PROJECT_ASYNC_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2600';
        console.info(`${caseName} test start`);
        let p = 0;
        await exportTest1().then((result) => {
          expect(result).assertEqual(66);
        })

        await exportTest9().then((result) => {
          expect(result).assertTrue();
        })

        await exportTest24().then((result) => {
          expect(result).assertEqual(66);
        })
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2700
     * @tc.number TS_PROJECT_ASYNC_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2700';
        console.info(`${caseName} test start`);
        let p = 0;
        await exportTest4().catch(() => {
          p++;
          expect(p).assertEqual(1);
        })

        await exportTest20().catch(() => {
          p++;
          expect(p).assertEqual(2);
        })
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2800
     * @tc.number TS_PROJECT_ASYNC_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2800';
        console.info(`${caseName} test start`);
        let p = 0;
        await exportTest11().finally(() => {
          p++;
          expect(p).assertEqual(1);
        })

        try {
          await exportTest4().finally(() => {
            p++;
          });
        } catch (e) {
          expect(p).assertEqual(2);
        }
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest2900
     * @tc.number TS_PROJECT_ASYNC_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest2900';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = exportTest8();
        const promise2: Promise<number> = exportTest21();
        const promise3: Promise<number> = exportTest22();
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
     * @tc.name   TSProjectAsyncTest3000
     * @tc.number TS_PROJECT_ASYNC_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3000';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = exportTest1();
        const promise2: Promise<number> = exportTest8();
        const promise3: Promise<number> = exportTest24();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.race(promises);
        expect(p).assertEqual(66);
        Done();
      });


    /**
     * @tc.name   TSProjectAsyncTest3100
     * @tc.number TS_PROJECT_ASYNC_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3100';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = exportTest1();
        const promise2: Promise<number> = exportTest8();
        const promise3: Promise<number> = exportTest22();
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
     * @tc.name   TSProjectAsyncTest3200
     * @tc.number TS_PROJECT_ASYNC_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3200';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = exportTest8();
        const promise2: Promise<number> = exportTest22();
        const promise3: Promise<number> = exportTest25();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.any(promises)
        expect(p).assertEqual(66);
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest3300
     * @tc.number TS_PROJECT_ASYNC_3300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3300';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await exportTest5(null);
        } catch (e) {
          p++;
        }

        try {
          await exportTest17();
        } catch (e) {
          p++;
        }

        try {
          await exportTest20();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(3);
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest3400
     * @tc.number TS_PROJECT_ASYNC_3400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await testfunction1();
        } catch (e) {
          p++;
        }
        try {
          await testfunction2();
        } catch (e) {
          p++;
        }
        try {
          await testfunction3();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(3);
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest3500
     * @tc.number TS_PROJECT_ASYNC_3500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction4);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.name   TSProjectAsyncTest3600
     * @tc.number TS_PROJECT_ASYNC_3600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction5);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.name   TSProjectAsyncTest3700
     * @tc.number TS_PROJECT_ASYNC_3700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction6);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66n);
          Done();
        })
      })

    /**
     * @tc.name   TSProjectAsyncTest3900
     * @tc.number TS_PROJECT_ASYNC_3900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest3900';
        console.info(`${caseName} test start`);
        let num: string = '';
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/TSProjectWorker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          num = e.data;
          WorkThread.terminate();
        }
        while (num != 'Hello World!') {
          await sleep(100)
        }
        expect(num).assertEqual('Hello World!');
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest4000
     * @tc.number TS_PROJECT_ASYNC_4000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4000';
        console.info(`${caseName} test start`);
        let num: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/TSProjectWorker1');
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
     * @tc.name   TSProjectAsyncTest4100
     * @tc.number TS_PROJECT_ASYNC_4100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4100';
        console.info(`${caseName} test start`);
        let p = await new Promise<string>((resolve, reject) => {
          let result = exportTest7();
          resolve(result);
        });
        expect(p).assertEqual('66');
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest4200
     * @tc.number TS_PROJECT_ASYNC_4200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4200';
        console.info(`${caseName} test start`);
        let p = await new Promise<number[]>((resolve, reject) => {
          let result = exportTest13();
          resolve(result);
        });
        expect(p[0]).assertEqual(65);
        expect(p[1]).assertEqual(66);
        expect(p[2]).assertEqual(67);
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest4300
     * @tc.number TS_PROJECT_ASYNC_4300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4300';
        console.info(`${caseName} test start`);
        let p = await new Promise<bigint>((resolve, reject) => {
          let result = exportTest10();
          resolve(result);
        });
        expect(p).assertEqual(66n);
        Done();
      })


    /**
     * @tc.name   TSProjectAsyncTest4400
     * @tc.number TS_PROJECT_ASYNC_4400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4400';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await exportTest12()
          expect(p.age).assertEqual(30);
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      })


    /**
     * @tc.name   TSProjectAsyncTest4500
     * @tc.number TS_PROJECT_ASYNC_4500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4500';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await exportTest9()
          expect(p).assertTrue();
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      })


    /**
     * @tc.name   TSProjectAsyncTest4600
     * @tc.number TS_PROJECT_ASYNC_4600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4600';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await exportTest19()
          expect(p.name).assertEqual('John');
          expect(p.surname).assertEqual('Smith');
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      })


    /**
     * @tc.name   TSProjectAsyncTest4700
     * @tc.number TS_PROJECT_ASYNC_4700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4700';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await exportTest11()
          expect(p.age).assertEqual(30);
          Done();
        }, 1000);
      })


    /**
     * @tc.name   TSProjectAsyncTest4800
     * @tc.number TS_PROJECT_ASYNC_4800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4800';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await exportTest25()
          expect(p).assertEqual(66);
          Done();
        }, 1000);
      })


    /**
     * @tc.name   TSProjectAsyncTest4900
     * @tc.number TS_PROJECT_ASYNC_4900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest4900';
        console.info(`${caseName} test start`);
        setTimeout(async () => {
          let p = await exportTest7()
          expect(p).assertEqual('66');
          Done();
        }, 1000);
      })


    /**
     * @tc.name   TSProjectAsyncTest5000
     * @tc.number TS_PROJECT_ASYNC_5000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest5000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction7);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.name   TSProjectAsyncTest5100
     * @tc.number TS_PROJECT_ASYNC_5100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest5100';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction8);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })


    /**
     * @tc.name   TSProjectAsyncTest5200
     * @tc.number TS_PROJECT_ASYNC_5200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TSProjectAsyncTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectAsyncTest5200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunction9);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(66);
          Done();
        })
      })
  })
};