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
import {
  test1,
  test2,
  test3,
  test4,
  test5,
  test6,
  test7,
  test8,
  test9,
  test10,
  test11,
  test12,
  test13,
  test14,
  test15,
  test16,
  test17,
  test18,
  test19,
  test20,
  test21,
  test22,
  test23,
  test24,
  test25,
  test26,
  test27,
  test28,
  test29,
  test30,
  test31,
  test32,
  test33,
  test34,
} from 'library1/src/main/ets/components/ConcurrencyModularImportAndExportTest';
import {
  ClassForTest1,
  ClassForTest2,
  ClassForTest3,
  ClassForTest4,
  testfunc1,
  testfunc10,
  testfunc11,
  testfunc12,
  testfunc13,
  testfunc14,
  testfunc2,
  testfunc3,
  testfunc4,
  testfunc5,
  testfunc6,
  testfunc7,
  testfunc8,
  testfunc9
} from '../testability/testfun';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function ConcurrencyModularImportAndExportTest() {
  describe('ConcurrencyModularImportAndExportTest', () => {
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
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0100
     * @tc.name ConcurrencyModularImportAndExportTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0100';
        console.info(`${caseName} test start`);
        const p: number = await test1();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0200
     * @tc.name ConcurrencyModularImportAndExportTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0200';
        console.info(`${caseName} test start`);
        const p: number = await test2();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0300
     * @tc.name ConcurrencyModularImportAndExportTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0300';
        console.info(`${caseName} test start`);
        const p: number = await test3();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0400
     * @tc.name ConcurrencyModularImportAndExportTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0400';
        console.info(`${caseName} test start`);
        const p: number = await test4();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0500
     * @tc.name ConcurrencyModularImportAndExportTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test5();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0600
     * @tc.name ConcurrencyModularImportAndExportTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0600';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test6();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0700
     * @tc.name ConcurrencyModularImportAndExportTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0700';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test7(null);
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0800
     * @tc.name ConcurrencyModularImportAndExportTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0800';
        console.info(`${caseName} test start`);
        const p: string = await test8();
        const q = Number(p);
        expect(q).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_0900
     * @tc.name ConcurrencyModularImportAndExportTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest0900';
        console.info(`${caseName} test start`);
        const p: string = await test9();
        const q = Number(p);
        expect(q).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1100
     * @tc.name ConcurrencyModularImportAndExportTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1100';
        console.info(`${caseName} test start`);
        const p: boolean = await test11();
        expect(p).assertTrue();
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1200
     * @tc.name ConcurrencyModularImportAndExportTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1200';
        console.info(`${caseName} test start`);
        const p: bigint = await test12();
        expect(p).assertEqual(42n);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1300
     * @tc.name ConcurrencyModularImportAndExportTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1300';
        console.info(`${caseName} test start`);
        const p = await test13();
        expect(p.age).assertEqual(30);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1400
     * @tc.name ConcurrencyModularImportAndExportTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1400';
        console.info(`${caseName} test start`);
        const p = await test14();
        expect(p.age).assertEqual(30);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1500
     * @tc.name ConcurrencyModularImportAndExportTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1500';
        console.info(`${caseName} test start`);
        const p: number[] = await test15();
        expect(p[0]).assertEqual(41);
        expect(p[1]).assertEqual(42);
        expect(p[2]).assertEqual(43);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1600
     * @tc.name ConcurrencyModularImportAndExportTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1600';
        console.info(`${caseName} test start`);
        const p = await test16();
        const q = p();
        expect(q).assertEqual('Hello, World!');
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1700
     * @tc.name ConcurrencyModularImportAndExportTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1700';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test17();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1800
     * @tc.name ConcurrencyModularImportAndExportTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1800';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test18();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message)
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_1900
     * @tc.name ConcurrencyModularImportAndExportTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest1900';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test19();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2000
     * @tc.name ConcurrencyModularImportAndExportTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2000';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          const q = await test20();
          throw q;
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2300
     * @tc.name ConcurrencyModularImportAndExportTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2300';
        console.info(`${caseName} test start`);
        const p = await test23();
        const q = p();
        expect(q).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2500
     * @tc.name ConcurrencyModularImportAndExportTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test25();
        } catch (e) {
          p = 42;
          expect('For test').assertEqual(e.message);
        }
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2600
     * @tc.name ConcurrencyModularImportAndExportTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2600';
        console.info(`${caseName} test start`);
        const p = await test26();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2700
     * @tc.name ConcurrencyModularImportAndExportTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2700';
        console.info(`${caseName} test start`);
        const p = await test27();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2800
     * @tc.name ConcurrencyModularImportAndExportTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2800';
        console.info(`${caseName} test start`);
        const p = await test28();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_2900
     * @tc.name ConcurrencyModularImportAndExportTest2900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest2900';
        console.info(`${caseName} test start`);
        const p = await test29();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3000
     * @tc.name ConcurrencyModularImportAndExportTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3000';
        console.info(`${caseName} test start`);
        const p = await test30();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3100
     * @tc.name ConcurrencyModularImportAndExportTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3100';
        console.info(`${caseName} test start`);
        const p = await test31();
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3200
     * @tc.name ConcurrencyModularImportAndExportTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3200';
        console.info(`${caseName} test start`);
        const p = await test32();
        expect(p).assertEqual(24);
        Done();
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3300
     * @tc.name ConcurrencyModularImportAndExportTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3300';
        console.info(`${caseName} test start`);
        const p = await test33();
        expect(p).assertEqual(24);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3400
     * @tc.name ConcurrencyModularImportAndExportTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3400';
        console.info(`${caseName} test start`);
        const p = await test34();
        expect(p).assertEqual(24);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3500
     * @tc.name ConcurrencyModularImportAndExportTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3500';
        console.info(`${caseName} test start`);
        await test1().then((result) => {
          expect(result).assertEqual(42);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3700
     * @tc.name ConcurrencyModularImportAndExportTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3700';
        console.info(`${caseName} test start`);
        await test26().then((result) => {
          expect(result).assertEqual(42);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3800
     * @tc.name ConcurrencyModularImportAndExportTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3800';
        console.info(`${caseName} test start`);
        await test30().then((result) => {
          expect(result).assertEqual(42);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_3900
     * @tc.name ConcurrencyModularImportAndExportTest3900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest3900';
        console.info(`${caseName} test start`);
        let p = 0;
        await test5().catch((e: Error) => {
          p++;
          expect('For test').assertEqual(e.message);
        });
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4000
     * @tc.name ConcurrencyModularImportAndExportTest4000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4000';
        console.info(`${caseName} test start`);
        let p = 0;
        await test18().catch((e: Error) => {
          p++;
          expect('For test').assertEqual(e.message);
        });
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4100
     * @tc.name ConcurrencyModularImportAndExportTest4100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4100';
        console.info(`${caseName} test start`);
        let p = 0;
        await test25().catch((e: Error) => {
          p++;
          expect('For test').assertEqual(e.message);
        });
        expect(p).assertEqual(1);
        Done();
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4300
     * @tc.name ConcurrencyModularImportAndExportTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4300';
        console.info(`${caseName} test start`);
        let p = 0;
        await test3().finally(() => {
          p++;
          expect(p).assertEqual(1);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4400
     * @tc.name ConcurrencyModularImportAndExportTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test7(null).finally(() => {
            p++;
          });
        } catch (e) {
          expect(p).assertEqual(1);
        }
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4500
     * @tc.name ConcurrencyModularImportAndExportTest4500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4500';
        console.info(`${caseName} test start`);
        let p = 0;
        await test27().finally(() => {
          p++;
          expect(p).assertEqual(1);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4600
     * @tc.name ConcurrencyModularImportAndExportTest4600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4600';
        console.info(`${caseName} test start`);
        let p = 0;
        await test32().finally(() => {
          p++;
          expect(p).assertEqual(1);
        });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4700
     * @tc.name ConcurrencyModularImportAndExportTest4700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4700';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = test4();
        const promise2: Promise<number> = test10();
        const promise3: Promise<number> = test28();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.all(promises);
        expect(p[0]).assertEqual(42);
        expect(p[1]).assertEqual(42);
        expect(p[2]).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4800
     * @tc.name ConcurrencyModularImportAndExportTest4800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4800';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = test1();
        const promise2: Promise<number> = test30();
        const promise3: Promise<number> = test31();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.race(promises);
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_4900
     * @tc.name ConcurrencyModularImportAndExportTest4900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest4900';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = test32();
        const promise2: Promise<number> = test33();
        const promise3: Promise<number> = test34();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        await Promise.allSettled(promises)
          .then((results) => {
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                expect(result.status).assertEqual('fulfilled');
                expect(result.value).assertEqual(24);
              } else {
                throw new Error;
              }
            });
          });
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5000
     * @tc.name ConcurrencyModularImportAndExportTest5000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5000';
        console.info(`${caseName} test start`);
        const promises: Promise<number>[] = [];
        const promise1: Promise<number> = test29();
        const promise2: Promise<number> = test30();
        const promise3: Promise<number> = test31();
        promises.push(promise1);
        promises.push(promise2);
        promises.push(promise3);
        const p = await Promise.any(promises)
        expect(p).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5100
     * @tc.name ConcurrencyModularImportAndExportTest5100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5100';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test6();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5200
     * @tc.name ConcurrencyModularImportAndExportTest5200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5200';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test17();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5300
     * @tc.name ConcurrencyModularImportAndExportTest5300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5300';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test19();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5400
     * @tc.name ConcurrencyModularImportAndExportTest5400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5400';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await test25();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5500
     * @tc.name ConcurrencyModularImportAndExportTest5500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5500';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await testfunc1();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5600
     * @tc.name ConcurrencyModularImportAndExportTest5600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5600';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await testfunc2();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5700
     * @tc.name ConcurrencyModularImportAndExportTest5700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5700';
        console.info(`${caseName} test start`);
        let p = 0;
        try {
          await testfunc3();
        } catch (e) {
          p++;
        }
        expect(p).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5800
     * @tc.name ConcurrencyModularImportAndExportTest5800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc4);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(24);
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_5900
     * @tc.name ConcurrencyModularImportAndExportTest5900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest5900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc5);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('Hello, World!');
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6000
     * @tc.name ConcurrencyModularImportAndExportTest6000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc6);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6100
     * @tc.name ConcurrencyModularImportAndExportTest6100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6200
     * @tc.name ConcurrencyModularImportAndExportTest6200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6200';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6300
     * @tc.name ConcurrencyModularImportAndExportTest6300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6400
     * @tc.name ConcurrencyModularImportAndExportTest6400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6400';
        console.info(`${caseName} test start`);
        let p = await new Promise<string>((resolve,) => {
          let result = test9()
          resolve(result);
        });
        expect(p).assertEqual('42');
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6500
     * @tc.name ConcurrencyModularImportAndExportTest6500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6500';
        console.info(`${caseName} test start`);
        let p = await new Promise<bigint>((resolve,) => {
          let result = test12()
          resolve(result);
        });
        expect(p).assertEqual(42n);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6600
     * @tc.name ConcurrencyModularImportAndExportTest6600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6600';
        console.info(`${caseName} test start`);
        let p = await new Promise<boolean>((resolve) => {
          let result = test11()
          resolve(result);
        });
        expect(p).assertEqual(true);
        Done();
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6700
     * @tc.name ConcurrencyModularImportAndExportTest6700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6700';
        console.info(`${caseName} test start`);
        let p = await new Promise<number>((resolve) => {
          let result = test29()
          resolve(result);
        });
        expect(p).assertEqual(42);
        Done();
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6800
     * @tc.name ConcurrencyModularImportAndExportTest6800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6800';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await test13()
          expect(p.age).assertEqual(30);
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_6900
     * @tc.name ConcurrencyModularImportAndExportTest6900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest6900';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await test14()
          expect(p.age).assertEqual(30);
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_7000
     * @tc.name ConcurrencyModularImportAndExportTest7000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest7000';
        console.info(`${caseName} test start`);
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        lock1.lockAsync(async () => {
          let p = await test16()
          let q = p();
          expect(q).assertEqual('Hello, World!');
          Done();
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_7600
     * @tc.name ConcurrencyModularImportAndExportTest7600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest7600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc7);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(24);
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_7700
     * @tc.name ConcurrencyModularImportAndExportTest7700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest7700';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc8);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual('Hello, World!');
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_7800
     * @tc.name ConcurrencyModularImportAndExportTest7800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest7800';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc9);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_7900
     * @tc.name ConcurrencyModularImportAndExportTest7900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest7900';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc10);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8000
     * @tc.name ConcurrencyModularImportAndExportTest8000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(test3);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8100
     * @tc.name ConcurrencyModularImportAndExportTest8100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8100';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc11, test1);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8200
     * @tc.name ConcurrencyModularImportAndExportTest8200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8200';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc12, test10);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8300
     * @tc.name ConcurrencyModularImportAndExportTest8300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8300';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc13, test12);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42n);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8400
     * @tc.name ConcurrencyModularImportAndExportTest8400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8400';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc14, test25);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8500
     * @tc.name ConcurrencyModularImportAndExportTest8500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8500';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc14, test25);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_8600
     * @tc.name ConcurrencyModularImportAndExportTest8600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest8600';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(testfunc14, test25);
        await taskpool.execute(task).then((result) => {
          expect(result).assertEqual(42);
          Done();
        })
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_9100
     * @tc.name ConcurrencyModularImportAndExportTest9100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest9100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker2');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(test1);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_9200
     * @tc.name ConcurrencyModularImportAndExportTest9200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest9200';
        console.info(`${caseName} test start`);
        let count: bigint = 0n;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker3');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(test12);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42n) {
          await sleep(300)
        }
        expect(count).assertEqual(42n);
        Done();
      });

    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_9300
     * @tc.name ConcurrencyModularImportAndExportTest9300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest9300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker4');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(test25);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });


    /**
     * @tc.number SUB_CONCURRENCY_MODULAR_IMPORT_AND_EXPORT_TEST_9400
     * @tc.name ConcurrencyModularImportAndExportTest9400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ConcurrencyModularImportAndExportTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'ConcurrencyModularImportAndExportTest9400';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker5');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(test31);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          WorkThread.terminate();
        }
        while (count != 42) {
          await sleep(300)
        }
        expect(count).assertEqual(42);
        Done();
      });


  })
}