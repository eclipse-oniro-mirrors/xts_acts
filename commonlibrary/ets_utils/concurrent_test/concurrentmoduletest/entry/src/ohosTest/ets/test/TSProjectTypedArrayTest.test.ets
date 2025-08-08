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
  TSint8Array,
  TSuint8Array,
  TSint16Array,
  TSuint16Array,
  TSint32Array,
  TSuint32Array,
  TSuint8ClampedArray,
  TSfloat32Array,
  TSbigint64Array,
  TSbiguint64Array,
} from 'library1/src/main/ets/components/TSProjectTypedArrayMethod'

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function TSProjectTypedArrayTest() {
  describe('TSProjectTypedArrayTest', () => {
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
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0100
     * @tc.name TSProjectTypedArrayTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0100';
        console.info(`${caseName} test start`);
        Atomics.add(TSint32Array, 1, 2147483647);
        expect(TSint32Array[1]).assertEqual(2147483647);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0200
     * @tc.name TSProjectTypedArrayTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0200';
        console.info(`${caseName} test start`);
        Atomics.add(TSbiguint64Array, 6, 18446744073709551615n);
        expect(TSbiguint64Array[6]).assertEqual(18446744073709551615n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0300
     * @tc.name TSProjectTypedArrayTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0300';
        console.info(`${caseName} test start`);
        Atomics.store(TSint16Array, 5, 20);
        Atomics.add(TSint16Array, 5, 10);
        expect(TSint16Array[5]).assertEqual(30);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0400
     * @tc.name TSProjectTypedArrayTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0400';
        console.info(`${caseName} test start`);
        Atomics.store(TSbigint64Array, 0, 15n);
        Atomics.and(TSbigint64Array, 0, 10n);
        expect(TSbigint64Array[0]).assertEqual(10n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0500
     * @tc.name TSProjectTypedArrayTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0500';
        console.info(`${caseName} test start`);
        Atomics.store(TSint32Array, 3, 0b1100);
        Atomics.and(TSint32Array, 3, 0b1000);
        expect(TSint32Array[3]).assertEqual(0b1000);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0600
     * @tc.name TSProjectTypedArrayTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0600';
        console.info(`${caseName} test start`);
        Atomics.store(TSbiguint64Array, 2, 0xFFFFFFFFFFFFFFFFn);
        Atomics.and(TSbiguint64Array, 2, 0n);
        expect(TSbiguint64Array[2]).assertEqual(0n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0700
     * @tc.name TSProjectTypedArrayTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0700';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint8Array, 4, 255);
        Atomics.compareExchange(TSuint8Array, 4, 255, 300);
        expect(TSuint8Array[4]).assertEqual(44);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0800
     * @tc.name TSProjectTypedArrayTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0800';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint32Array, 3, 66);
        Atomics.compareExchange(TSuint32Array, 3, 666, 100);
        expect(TSuint32Array[3]).assertEqual(66);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_0900
     * @tc.name TSProjectTypedArrayTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest0900';
        console.info(`${caseName} test start`);
        Atomics.store(TSbigint64Array, 0, 9223372036854775807n);
        Atomics.compareExchange(TSbigint64Array, 0, 9223372036854775806n, 9223372036854775805n);
        expect(TSbigint64Array[0]).assertEqual(9223372036854775807n);
        Done();
      })

    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1200
     * @tc.name TSProjectTypedArrayTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1200';
        console.info(`${caseName} test start`);
        Atomics.exchange(TSint8Array, 1, -128);
        expect(TSint8Array[1]).assertEqual(-128);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1300
     * @tc.name TSProjectTypedArrayTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1300';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint16Array, 7, 65535);
        Atomics.load(TSuint16Array, 7);
        expect(TSuint16Array[7]).assertEqual(65535);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1400
     * @tc.name TSProjectTypedArrayTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1400';
        console.info(`${caseName} test start`);
        Atomics.store(TSbigint64Array, 0, 115n);
        Atomics.load(TSbigint64Array, 0);
        expect(TSbigint64Array[0]).assertEqual(115n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1500
     * @tc.name TSProjectTypedArrayTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1500';
        console.info(`${caseName} test start`);
        Atomics.store(TSint32Array, 6, -2147483648);
        Atomics.load(TSint32Array, 6);
        expect(TSint32Array[6]).assertEqual(-2147483648);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1600
     * @tc.name TSProjectTypedArrayTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1600';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint16Array, 1, 0b1010);
        Atomics.or(TSuint16Array, 1, 0b0101);
        expect(TSuint16Array[1]).assertEqual(0b1111);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1700
     * @tc.name TSProjectTypedArrayTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1700';
        console.info(`${caseName} test start`);
        Atomics.store(TSint32Array, 0, 2147483647);
        Atomics.or(TSint32Array, 0, 0x0000FFFF);
        expect(TSint32Array[0]).assertEqual(2147483647);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1800
     * @tc.name TSProjectTypedArrayTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1800';
        console.info(`${caseName} test start`);
        Atomics.store(TSint32Array, 0, 0b00001010);
        Atomics.or(TSint32Array, 0, 0b01010011);
        expect(TSint32Array[0]).assertEqual(0b01011011);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_1900
     * @tc.name TSProjectTypedArrayTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest1900';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint8Array, 2, 255);
        Atomics.sub(TSuint8Array, 2, 0);
        expect(TSuint8Array[2]).assertEqual(255);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2000
     * @tc.name TSProjectTypedArrayTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2000';
        console.info(`${caseName} test start`);
        Atomics.store(TSbigint64Array, 0, -600n);
        Atomics.sub(TSbigint64Array, 0, -350n);
        expect(TSbigint64Array[0]).assertEqual(-250n);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2100
     * @tc.name TSProjectTypedArrayTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2100';
        console.info(`${caseName} test start`);
        Atomics.store(TSint8Array, 0, -128);
        Atomics.sub(TSint8Array, 0, -127);
        expect(TSint8Array[0]).assertEqual(-1);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2200
     * @tc.name TSProjectTypedArrayTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2200';
        console.info(`${caseName} test start`);
        Atomics.store(TSint16Array, 3, 0b1100);
        Atomics.xor(TSint16Array, 3, 0b0101);
        expect(TSint16Array[3]).assertEqual(0b1001);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2300
     * @tc.name TSProjectTypedArrayTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2300';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint8Array, 0, 0b11110000);
        Atomics.xor(TSuint8Array, 0, 0);
        expect(TSuint8Array[0]).assertEqual(0b11110000);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2400
     * @tc.name TSProjectTypedArrayTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2400';
        console.info(`${caseName} test start`);
        Atomics.store(TSuint16Array, 0, 0b1010);
        Atomics.xor(TSuint16Array, 0, 0b1010);
        expect(TSuint16Array[0]).assertEqual(0);
        Done();
      })


    /**
     * @tc.number TS_PROJECT_TYPEDARRAY_METHOD_2500
     * @tc.name TSProjectTypedArrayTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TSProjectTypedArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TSProjectTypedArrayTest2500';
        console.info(`${caseName} test start`);
        Atomics.store(TSint32Array, 0, 666);
        const status = Atomics.wait(TSint32Array, 0, 1000)
        expect(status).assertEqual('not-equal');
        Done();
      })
  })
};