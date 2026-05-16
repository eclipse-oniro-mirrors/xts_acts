/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function SharedArrayBuffer1Test() {
  describe('SharedArrayBuffer1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   SharedArrayBuffer1Test001
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(1024);
      expect(basicSAB.byteLength).assertEqual(1024);

    });
    /**
     * @tc.name   SharedArrayBuffer1Test002
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(1024);
      const negSliceSAB = basicSAB.slice(-100);
      expect(negSliceSAB.byteLength).assertEqual(100);
    });
    /**
     * @tc.name   SharedArrayBuffer1Test003
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(1024);
      const rangeSliceSAB = basicSAB.slice(100, 300);
      expect(rangeSliceSAB.byteLength).assertEqual(200);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test004
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigSAB = new SharedArrayBuffer(1024 * 1024);
      expect(bigSAB.byteLength).assertEqual(1048576);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test005
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(1024);
      expect(basicSAB.constructor).assertEqual(SharedArrayBuffer);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test006
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const comboNegSliceSAB = new SharedArrayBuffer(1000);
      const comboNegSliced = comboNegSliceSAB.slice(-500, -300);
      expect(comboNegSliced.byteLength).assertEqual(200);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test007
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintSAB = new SharedArrayBuffer(8);
      const bigUintView = new BigUint64Array(bigUintSAB);
      bigUintView[0] = 123456789012345n;
      expect(bigUintView[0]).assertEqual(123456789012345n);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test008
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceBufferSAB = new SharedArrayBuffer(8);
      const sliced = sliceBufferSAB.slice(2, 6);
      const slicedView = new Uint8Array(sliced);
      expect(slicedView.buffer).assertEqual(sliced);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test009
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_0900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const clampedSAB = new SharedArrayBuffer(4);
      const clampedView = new Uint8ClampedArray(clampedSAB);
      clampedView[0] = 300;
      expect(clampedView[0]).assertEqual(255);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test010
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const overNegStartSAB = new SharedArrayBuffer(1000);
      const overNegSliced = overNegStartSAB.slice(-1000, 500);
      expect(overNegSliced.byteLength).assertEqual(500);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test011
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatSAB = new SharedArrayBuffer(4);
      const floatView = new Float32Array(floatSAB);
      floatView[0] = 3.14159;
      expect(floatView[0]).assertClose(3.14159, 5);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test012
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16SAB = new SharedArrayBuffer(4);
      const int16View = new Int16Array(int16SAB);
      int16View[1] = -32768; // Int16最小值
      expect(int16View[1]).assertEqual(-32768);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test013
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const offsetSliceSAB = new SharedArrayBuffer(8);
      const offsetSliced = offsetSliceSAB.slice(2, 6);
      const offsetView = new Uint8Array(offsetSliced);
      expect(offsetView.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test014
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntNegSAB = new SharedArrayBuffer(8);
      const bigIntNegView = new BigInt64Array(bigIntNegSAB);
      bigIntNegView[0] = -9223372036854775808n;
      expect(bigIntNegView[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test015
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptySAB = new SharedArrayBuffer(0);
      const emptySlicedSAB = emptySAB.slice(1, 3);
      expect(emptySlicedSAB.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test016
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32SAB = new SharedArrayBuffer(4);
      const uint32View = new Uint32Array(uint32SAB);
      uint32View[0] = 4294967295;
      expect(uint32View[0]).assertEqual(4294967295);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test017
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      expect(basicSAB.byteLength).assertEqual(100);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test018
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const uint8View = new Uint8Array(basicSAB);
      uint8View[0] = 255;
      expect(uint8View[0]).assertEqual(255);

    });

    /**
     * @tc.name   SharedArrayBuffer1Test019
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_1900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const int16View = new Int16Array(basicSAB);
      int16View[1] = -32768; // Int16最小值
      expect(int16View[1]).assertEqual(-32768);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test020
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const slicedSAB = basicSAB.slice(10, 30);
      expect(slicedSAB.byteLength).assertEqual(20);
    });
    /**
     * @tc.name   SharedArrayBuffer1Test021
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const endSliceSAB = basicSAB.slice(50);
      expect(endSliceSAB.byteLength).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test022
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const negSliceSAB = basicSAB.slice(-20);
      expect(negSliceSAB.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test023
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicSAB = new SharedArrayBuffer(100);
      const emptySliceSAB = basicSAB.slice(30, 20);
      expect(emptySliceSAB.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test024
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(128);
      expect(sab.byteLength).assertEqual(128);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test025
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(64);
      const view = new Uint8Array(sab);
      view[10] = 0xAB;
      expect(view[10]).assertEqual(0xAB);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test026
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(32);
      const sliced = sab.slice(5, 15);
      expect(sliced.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test027
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(48);
      const view = new Int16Array(sab);
      view[3] = -32768;
      expect(view[3]).assertEqual(-32768);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test028
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(16);
      const sliced = sab.slice(-8);
      expect(sliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test029
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_2900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(96);
      const view = new Uint8Array(sab);
      Atomics.store(view, 20, 0xCD);
      expect(Atomics.load(view, 20)).assertEqual(0xCD);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test030
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(64);
      const sliced = sab.slice(40);
      expect(sliced.byteLength).assertEqual(24);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test031
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const view = new Uint32Array(sab);
      view[2] = 4294967295;
      expect(view[2]).assertEqual(4294967295);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test032
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(100);
      const sliced = sab.slice(70, 120);
      expect(sliced.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test033
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(20);
      expect(sab.constructor).assertEqual(SharedArrayBuffer);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test034
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(56);
      const view = new Float32Array(sab);
      view[4] = 2.718;
      expect(view[4]).assertClose(2.718, 3);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test035
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const sliced = sab.slice(25, 20);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test036
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(36);
      const view = new Uint8Array(sab);
      Atomics.store(view, 10, 0x10);
      Atomics.add(view, 10, 0x05);
      expect(Atomics.load(view, 10)).assertEqual(0x15);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test037
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(44);
      const view = new Int32Array(sab);
      view[5] = -123456;
      expect(view[5]).assertEqual(-123456);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test038
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(72);
      const sliced = sab.slice(-40, -20);
      expect(sliced.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test039
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_3900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(52);
      const view = new Uint8ClampedArray(sab);
      view[8] = 300;
      expect(view[8]).assertEqual(255);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test040
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(60);
      const view = new Uint8Array(sab);
      Atomics.store(view, 15, 0x20);
      Atomics.compareExchange(view, 15, 0x20, 0x30);
      expect(Atomics.load(view, 15)).assertEqual(0x30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test041
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(16);
      const sliced = sab.slice(4, 12);
      expect(sliced instanceof SharedArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test042
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(88);
      const view = new Float64Array(sab);
      view[3] = Math.PI;
      expect(view[3]).assertClose(Math.PI, 10);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test043
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(24);
      const sliced = sab.slice(0, 0);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test044
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(48);
      const view = new Uint8Array(sab);
      Atomics.store(view, 25, 0x40);
      const oldVal = Atomics.exchange(view, 25, 0x50);
      expect(oldVal).assertEqual(0x40);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test045
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(32);
      const view = new BigUint64Array(sab);
      view[1] = 123456789012345n;
      expect(view[1]).assertEqual(123456789012345n);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test046
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(64);
      const sliced = sab.slice(-50, 20);
      expect(sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test047
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(76);
      const view = new Int8Array(sab);
      view[12] = -128;
      expect(view[12]).assertEqual(-128);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test048
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(200);
      const sliced = sab.slice(150, 180);
      expect(sliced.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test049
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_4900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(0);
      expect(sab.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test050
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(90);
      const view = new Uint8Array(sab);
      expect(Atomics.load(view, 45)).assertEqual(0);
    });
    /**
     * @tc.name   SharedArrayBuffer1Test051
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const view = new Uint8Array(sab);
      expect(view[35]).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test052
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const view = new Int16Array(sab);
      view[5] = 32767;
      expect(view[5]).assertEqual(32767);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test053
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(120);
      const slicedSab = sab.slice(20, 70);
      expect(slicedSab.byteLength).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test054
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(30);
      const view = new Uint8Array(sab);
      Atomics.store(view, 10, 0xEF);
      expect(view[10]).assertEqual(0xEF);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test055
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(60);
      const view = new Uint32Array(sab);
      view[4] = 0;
      expect(view[4]).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test056
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(90);
      const slicedSab = sab.slice(-30, -10);
      expect(slicedSab.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test057
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(52);
      const view = new Float32Array(sab);
      view[3] = 0.0;
      expect(view[3]).assertEqual(0.0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test058
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(150);
      const slicedSab = sab.slice(100);
      expect(slicedSab.byteLength).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test059
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_5900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(45);
      const view = new Uint8Array(sab);
      Atomics.store(view, 5, 0x10);
      Atomics.add(view, 5, 0x20);
      expect(Atomics.load(view, 5)).assertEqual(0x30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test060
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(72);
      const view = new Int32Array(sab);
      view[6] = 123456789;
      expect(view[6]).assertEqual(123456789);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test061
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(35);
      const slicedSab = sab.slice(15, 15);
      expect(slicedSab.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test062
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(55);
      const view = new Uint8ClampedArray(sab);
      view[8] = 0;
      expect(view[8]).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test063
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(110);
      const slicedSab = sab.slice(-80, 50);
      expect(slicedSab.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test064
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(20);
      expect(sab.constructor).assertEqual(SharedArrayBuffer);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test065
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(64);
      const view = new Float64Array(sab);
      view[2] = Math.E;
      expect(view[2]).assertClose(Math.E, 5);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test066
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const slicedSab = sab.slice(25, 10);
      expect(slicedSab.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test067
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(95);
      const view = new Uint8Array(sab);
      Atomics.store(view, 30, 0x60);
      const oldVal = Atomics.exchange(view, 30, 0x70);
      expect(oldVal).assertEqual(0x60);
      expect(Atomics.load(view, 30)).assertEqual(0x70);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test068
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(30);
      const view = new Int8Array(sab);
      view[7] = 127;
      expect(view[7]).assertEqual(127);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test069
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_6900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(100);
      const slicedSab = sab.slice(0, 50);
      expect(slicedSab.byteLength).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test070
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(50);
      expect(sab.toString()).assertEqual("[object SharedArrayBuffer]");
    });

    /**
     * @tc.name   SharedArrayBuffer1Test071
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(70);
      const view = new Uint16Array(sab);
      view[9] = 123;
      expect(view[9]).assertEqual(123);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test072
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const slicedSab = sab.slice(-50, -30);
      expect(slicedSab.byteLength).assertEqual(10);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test073
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const view = new Uint8Array(sab);
      expect(Atomics.load(view, 40)).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test074
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(32);
      const view = new BigUint64Array(sab);
      view[1] = 0n;
      expect(view[1]).assertEqual(0n);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test075
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(60);
      const slicedSab = sab.slice(10, 40);
      expect(slicedSab.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test076
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const view = new Float32Array(sab);
      view[5] = -1.234;
      expect(view[5]).assertClose(-1.234, 3);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test077
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(120);
      const slicedSab = sab.slice(-100, 80);
      expect(slicedSab.byteLength).assertEqual(60);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test078
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(50);
      const view = new Uint8Array(sab);
      view[10] = 0x11;
      view[20] = 0x22;
      view[30] = 0x33;
      expect(view[30]).assertEqual(0x33);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test079
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_7900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(70);
      const slicedSab = sab.slice(5, 55);
      expect(slicedSab.byteLength).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test080
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(30);
      const uint8View = new Uint8Array(sab);
      Atomics.store(uint8View, 0, 0xFF);
      const uint16View = new Uint16Array(sab);
      expect(uint16View[0]).assertEqual(255);
    });
    /**
     * @tc.name   SharedArrayBuffer1Test081
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(60);
      const view = new Int16Array(sab);
      view[8] = -1234;
      expect(view[8]).assertEqual(-1234);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test082
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(100);
      const slicedSab = sab.slice(-60, 70);
      expect(slicedSab.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test083
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const view = new Uint8Array(sab);
      Atomics.store(view, 5, 10);
      Atomics.add(view, 5, 20);
      let sum = 0;
      for (let i = 0; i < view.length; i++) {
        sum += view[i];
      }
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test084
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const view = new Uint32Array(sab);
      for (let i = 0; i < view.length; i++) {
        view[i] = i * 10;
      }
      expect(view[5]).assertEqual(50);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test085
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(25);
      const slicedSab = sab.slice(10, 0);
      expect(slicedSab.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test086
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(55);
      const view = new Uint8Array(sab);
      Atomics.store(view, 15, 0x80);
      Atomics.compareExchange(view, 15, 0x80, 0x90);
      expect(Atomics.load(view, 15)).assertEqual(0x90);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test087
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(72);
      const view = new Float32Array(sab);
      view[4] = 0.123456;
      expect(view[4]).assertClose(0.123456, 5);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test088
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(35);
      const slicedSab = sab.slice(-15);
      expect(slicedSab.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test089
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_8900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(44);
      const view = new Int32Array(sab);
      view[3] = 2147483647;
      expect(view[3]).assertEqual(2147483647);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test090
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(65);
      const slicedSab = sab.slice(20, 20);
      const slicedView = new Uint8Array(slicedSab);
      expect(slicedView.length).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test091
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9100
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(85);
      const view = new Uint8ClampedArray(sab);
      view[10] = -50;
      expect(view[10]).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test092
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9200
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(50);
      const view = new Uint8Array(sab);
      view[10] = 0xEF;
      const slicedSab = sab.slice(0, 30);
      const slicedView = new Uint8Array(slicedSab);
      expect(slicedView[10]).assertEqual(0xEF);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test093
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9300
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(72);
      const view = new Float64Array(sab);
      view[2] = 123456789.123456;
      expect(view[2]).assertClose(123456789.123456, 6);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test094
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9400
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(30);
      const slicedSab = sab.slice(-25, -5);
      expect(slicedSab.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test095
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9500
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(40);
      const view = new Uint8Array(sab);
      expect(Atomics.load(view, 0)).assertEqual(0);
      expect(Atomics.load(view, 19)).assertEqual(0);
      expect(Atomics.load(view, 39)).assertEqual(0);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test096
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9600
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(60);
      const view = new Int8Array(sab);
      view[25] = -10;
      expect(view[25]).assertEqual(-10);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test097
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9700
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(95);
      const slicedSab = sab.slice(40, 100);
      expect(slicedSab.byteLength).assertEqual(55);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test098
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9800
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(56);
      const view = new Uint16Array(sab);
      view[7] = 65535;
      expect(view[7]).assertEqual(65535);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test099
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_9900
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(80);
      const slicedSab = sab.slice(-90, 20);
      expect(slicedSab.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   SharedArrayBuffer1Test100
     * @tc.number SUB_BUILTINS_SharedArrayBuffer1_TEST_10000
     * @tc.desc   test SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBuffer1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(64);
      const view = new BigUint64Array(sab);
      view[3] = 9876543210123456789n;
      expect(view[3]).assertEqual(9876543210123456789n);
    });

  })
}