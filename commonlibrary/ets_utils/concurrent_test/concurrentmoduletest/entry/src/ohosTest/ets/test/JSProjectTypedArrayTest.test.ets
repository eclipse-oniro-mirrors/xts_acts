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
  JSint8Array,
  JSuint8Array,
  JSint16Array,
  JSuint16Array,
  JSint32Array,
  JSuint32Array,
  JSuint8ClampedArray,
  JSfloat32Array,
  JSbigint64Array,
  JSbiguint64Array,
} from 'library1/src/main/ets/components/JSProjectTypedArrayMethod'

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export default function JSProjectTypedArrayTest() {
  describe('JSProjectTypedArrayTest', () => {
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
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0100
     * @tc.name JSProjectTypedArrayTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0100';
        console.info(`${caseName} test start`);
        Atomics.add(JSint8Array, 0, 10);
        expect(JSint8Array[0]).assertEqual(10);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0200
     * @tc.name JSProjectTypedArrayTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0200';
        console.info(`${caseName} test start`);
        Atomics.add(JSbigint64Array, 6, 10n);
        expect(JSbigint64Array[6]).assertEqual(10n);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0300
     * @tc.name JSProjectTypedArrayTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0300';
        console.info(`${caseName} test start`);
        Atomics.add(JSuint32Array, 7, 10);
        expect(JSuint32Array[7]).assertEqual(10);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0400
     * @tc.name JSProjectTypedArrayTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0400';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint8Array, 0, 0b11001100);
        Atomics.and(JSuint8Array, 0, 0b10101010);
        expect(JSuint8Array[0]).assertEqual(0b10001000);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0500
     * @tc.name JSProjectTypedArrayTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0500';
        console.info(`${caseName} test start`);
        Atomics.store(JSint32Array, 6, 0xFFFF0000);
        Atomics.and(JSint32Array, 6, 0x00FF00FF);
        expect(JSint32Array[6]).assertEqual(0x00FF0000);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0600
     * @tc.name JSProjectTypedArrayTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0600';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint16Array, 2, 0b1100110011001100);
        Atomics.and(JSuint16Array, 2, 0b1010101010101010);
        expect(JSuint16Array[2]).assertEqual(0b1000100010001000);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0700
     * @tc.name JSProjectTypedArrayTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0700';
        console.info(`${caseName} test start`);
        Atomics.store(JSint16Array, 1, 50);
        Atomics.compareExchange(JSint16Array, 1, 100, 300);
        expect(JSint16Array[1]).assertEqual(50);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0800
     * @tc.name JSProjectTypedArrayTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0800';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint8Array, 3, 60);
        Atomics.compareExchange(JSuint8Array, 3, 60, 100);
        expect(JSuint8Array[3]).assertEqual(100);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_0900
     * @tc.name JSProjectTypedArrayTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest0900';
        console.info(`${caseName} test start`);
        Atomics.store(JSbiguint64Array, 0, 50n);
        Atomics.compareExchange(JSbiguint64Array, 0, 100n, 200n);
        expect(JSbiguint64Array[0]).assertEqual(50n);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1000
     * @tc.name JSProjectTypedArrayTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1000';
        console.info(`${caseName} test start`);
        Atomics.store(JSint8Array, 5, 10);
        Atomics.exchange(JSint8Array, 5, 20);
        expect(JSint8Array[5]).assertEqual(20);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1100
     * @tc.name JSProjectTypedArrayTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1100';
        console.info(`${caseName} test start`);
        Atomics.exchange(JSbigint64Array, 5, -66n);
        expect(JSbigint64Array[5]).assertEqual(-66n);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1200
     * @tc.name JSProjectTypedArrayTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1200';
        console.info(`${caseName} test start`);
        Atomics.exchange(JSint32Array, 4, 60);
        expect(JSint32Array[4]).assertEqual(60);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1300
     * @tc.name JSProjectTypedArrayTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1300';
        console.info(`${caseName} test start`);
        Atomics.store(JSint16Array, 0, -32768);
        Atomics.load(JSint16Array, 0);
        expect(JSint16Array[0]).assertEqual(-32768);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1400
     * @tc.name JSProjectTypedArrayTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1400';
        console.info(`${caseName} test start`);
        Atomics.store(JSbiguint64Array, 0, 18446744073709551615n);
        Atomics.load(JSbiguint64Array, 0);
        expect(JSbiguint64Array[0]).assertEqual(18446744073709551615n);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1500
     * @tc.name JSProjectTypedArrayTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1500';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint32Array, 0, 4294967295);
        Atomics.load(JSuint32Array, 0);
        expect(JSuint32Array[0]).assertEqual(4294967295);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1600
     * @tc.name JSProjectTypedArrayTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1600';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint32Array, 1, 0x0000FFFF);
        Atomics.or(JSuint32Array, 1, 0xFFFF0000);
        expect(JSuint32Array[1]).assertEqual(0xFFFFFFFF);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1700
     * @tc.name JSProjectTypedArrayTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1700';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint8Array, 7, 0b10101010);
        Atomics.or(JSuint8Array, 7, 0b01010101);
        expect(JSuint8Array[7]).assertEqual(0b11111111);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1800
     * @tc.name JSProjectTypedArrayTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1800';
        console.info(`${caseName} test start`);
        Atomics.store(JSbiguint64Array, 2, 0x00000000FFFFFFFFn);
        Atomics.or(JSbiguint64Array, 2, 0xFFFFFFFF00000000n);
        expect(JSbiguint64Array[2]).assertEqual(0xFFFFFFFFFFFFFFFFn);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_1900
     * @tc.name JSProjectTypedArrayTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest1900';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint8Array, 6, 100);
        Atomics.sub(JSuint8Array, 6, 30);
        expect(JSuint8Array[6]).assertEqual(70);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2000
     * @tc.name JSProjectTypedArrayTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2000';
        console.info(`${caseName} test start`);
        Atomics.store(JSbigint64Array, 0, 60n);
        Atomics.sub(JSbigint64Array, 0, 35n);
        expect(JSbigint64Array[0]).assertEqual(25n);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2100
     * @tc.name JSProjectTypedArrayTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2100';
        console.info(`${caseName} test start`);
        Atomics.store(JSint32Array, 0, -2147483648);
        Atomics.sub(JSint32Array, 0, 1);
        expect(JSint32Array[0]).assertEqual(2147483647);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2200
     * @tc.name JSProjectTypedArrayTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2200';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint32Array, 0, 0xAAAAAAAA);
        Atomics.xor(JSuint32Array, 0, 0x55555555);
        expect(JSuint32Array[0]).assertEqual(0xFFFFFFFF);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2300
     * @tc.name JSProjectTypedArrayTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2200';
        console.info(`${caseName} test start`);
        Atomics.store(JSbiguint64Array, 0, 0xAAAAAAAAAAAAAAAAn);
        Atomics.xor(JSbiguint64Array, 0, 0x5555555555555555n);
        expect(JSbiguint64Array[0]).assertEqual(0xFFFFFFFFFFFFFFFFn);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2400
     * @tc.name JSProjectTypedArrayTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2400';
        console.info(`${caseName} test start`);
        Atomics.store(JSuint16Array, 0, 0x5555);
        Atomics.xor(JSuint16Array, 0, 0x5555);
        expect(JSuint16Array[0]).assertEqual(0);
        Done();
      })


    /**
     * @tc.number JS_PROJECT_TYPEDARRAY_METHOD_2500
     * @tc.name JSProjectTypedArrayTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('JSProjectTypedArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'JSProjectTypedArrayTest2500';
        console.info(`${caseName} test start`);
        Atomics.store(JSint32Array, 0, 66);
        const status = Atomics.wait(JSint32Array, 0, 100)
        expect(status).assertEqual('not-equal');
        Done();
      })
  })
};