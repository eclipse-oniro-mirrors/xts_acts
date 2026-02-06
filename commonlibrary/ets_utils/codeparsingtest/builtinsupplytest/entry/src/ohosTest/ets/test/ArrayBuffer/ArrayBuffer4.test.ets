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

export default function ArrayBuffer4Test() {
  describe('ArrayBuffer4Test', () => {
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
     * @tc.name   arraybuffer4Test001
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicBuffer = new ArrayBuffer(8);
      const basicSliced = basicBuffer.slice(2, 6);
      expect(basicSliced.byteLength).assertEqual(4);

    });
    /**
     * @tc.name   arraybuffer4Test002
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const noEndBuffer = new ArrayBuffer(8);
      const noEndSliced = noEndBuffer.slice(3);
      expect(noEndSliced.byteLength).assertEqual(5);
    });
    /**
     * @tc.name   arraybuffer4Test003
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fullSliceBuffer = new ArrayBuffer(8);
      const fullSliced = fullSliceBuffer.slice(3, 5);
      expect(fullSliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test004
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negativeStartBuffer = new ArrayBuffer(8);
      const negativeStartSliced = negativeStartBuffer.slice(-3);
      expect(negativeStartSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test005
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negativeEndBuffer = new ArrayBuffer(8);
      const negativeEndSliced = negativeEndBuffer.slice(1, -2);
      expect(negativeEndSliced.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer4Test006
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startTooSmallBuffer = new ArrayBuffer(8);
      const startTooSmallSliced = startTooSmallBuffer.slice(-10, 5);
      expect(startTooSmallSliced.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer4Test007
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endTooSmallBuffer = new ArrayBuffer(8);
      const endTooSmallSliced = endTooSmallBuffer.slice(2, -10);
      expect(endTooSmallSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test008
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startTooBigBuffer = new ArrayBuffer(8);
      const startTooBigSliced = startTooBigBuffer.slice(8);
      expect(startTooBigSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test009
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_0900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endTooBigBuffer = new ArrayBuffer(8);
      const endTooBigSliced = endTooBigBuffer.slice(2, 10);
      expect(endTooBigSliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   arraybuffer4Test010
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endBeforeStartBuffer = new ArrayBuffer(8);
      const endBeforeStartSliced = endBeforeStartBuffer.slice(5, 3);
      expect(endBeforeStartSliced.byteLength).assertEqual(0);
    });

    //todo slice不能传空置
    /**
     * @tc.name   arraybuffer4Test011
     * @tc.number arraybuffer4Test011
     * @tc.desc   arraybuffer4Test011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const independentBuffer = new ArrayBuffer(4);
      const independentView = new Uint8Array(independentBuffer);
      independentView[0] = 255;
      const independentSliced = independentBuffer.slice(3);
      const slicedView = new Uint8Array(independentSliced);
      independentView[0] = 0;
      expect(slicedView[0]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test012
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyBuffer = new ArrayBuffer(0);
      const emptySliced = emptyBuffer.slice(1, 3);
      expect(emptySliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test013
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const zeroRangeBuffer = new ArrayBuffer(8);
      const zeroRangeSliced = zeroRangeBuffer.slice(0, 0);
      expect(zeroRangeSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test014
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const comboIndexBuffer = new ArrayBuffer(8);
      const comboIndexSliced = comboIndexBuffer.slice(-5, -2);
      expect(comboIndexSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test015
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteBuffer = new ArrayBuffer(1);
      const oneByteSliced = oneByteBuffer.slice(0, 1);
      expect(oneByteSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test016
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigBuffer = new ArrayBuffer(1024);
      const bigSliced = bigBuffer.slice(512, 1024);
      expect(bigSliced.byteLength).assertEqual(512);
    });

    /**
     * @tc.name   arraybuffer4Test017
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewBuffer = new ArrayBuffer(4);
      const viewSliced = viewBuffer.slice(0, 4);
      const uint16View = new Uint16Array(viewSliced);
      uint16View[0] = 0x1234;
      expect(uint16View[0]).assertEqual(0x1234);
    });

    /**
     * @tc.name   arraybuffer4Test018
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewBuffer = new ArrayBuffer(8);
      const dataViewSliced = dataViewBuffer.slice(2, 6);
      const dataView = new DataView(dataViewSliced);
      dataView.setInt32(0, 12345, true);
      expect(dataView.getInt32(0, true)).assertEqual(12345);
    });

    /**
     * @tc.name   arraybuffer4Test019
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_1900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatStartBuffer = new ArrayBuffer(8);
      const floatStartSliced = floatStartBuffer.slice(2.8, 6);
      expect(floatStartSliced.byteLength).assertEqual(4);

    });

    /**
     * @tc.name   arraybuffer4Test020
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatEndBuffer = new ArrayBuffer(8);
      const floatEndSliced = floatEndBuffer.slice(1, 5.2);
      expect(floatEndSliced.byteLength).assertEqual(4);
    });
    /**
     * @tc.name   arraybuffer4Test021
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const resizableBuffer = new ArrayBuffer(8);
      const resizableSliced = resizableBuffer.slice(2, 6);
      expect(resizableSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test022
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const detachedCheckBuffer = new ArrayBuffer(8);
      const detachedCheckSliced = detachedCheckBuffer.slice(1, 6);
      expect(detachedCheckSliced.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer4Test023
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sourceBuffer = new ArrayBuffer(8);
      const slicedBuffer = sourceBuffer.slice(2, 6);
      expect(slicedBuffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test024
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fullRangeBuffer = new ArrayBuffer(8);
      const fullRangeSliced = fullRangeBuffer.slice(0, 8);
      expect(fullRangeSliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test025
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startZeroNegEndBuffer = new ArrayBuffer(8);
      const startZeroNegEndSliced = startZeroNegEndBuffer.slice(0, -4);
      expect(startZeroNegEndSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test026
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negStartPosEndBuffer = new ArrayBuffer(8);
      const negStartPosEndSliced = negStartPosEndBuffer.slice(-6, 5);
      expect(negStartPosEndSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test027
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxLenCheckBuffer = new ArrayBuffer(8);
      const maxLenCheckSliced = maxLenCheckBuffer.slice(2, 6);
      expect(maxLenCheckSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test028
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneMBBuffer = new ArrayBuffer(1024 * 1024);
      const oneMBSliced = oneMBBuffer.slice(1024, 2048);
      expect(oneMBSliced.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name   arraybuffer4Test029
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_2900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const syncCheckBuffer = new ArrayBuffer(4);
      const syncCheckView = new Uint8Array(syncCheckBuffer);
      syncCheckView[0] = 0xFF;
      const syncCheckSliced = syncCheckBuffer.slice(0, 0);
      const slicedCheckView = new Uint8Array(syncCheckSliced);
      if (slicedCheckView.length > 0) {
        slicedCheckView[0] = 0x00;
      }
      expect(syncCheckView[0]).assertEqual(0xFF);
    });

    /**
     * @tc.name   arraybuffer4Test030
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startEqualNegLenBuffer = new ArrayBuffer(8);
      const startEqualNegLenSliced = startEqualNegLenBuffer.slice(-8, 4);
      expect(startEqualNegLenSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test031
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startEqualNegLenBuffer = new ArrayBuffer(8);
      const startEqualNegLenSliced = startEqualNegLenBuffer.slice(-8, 4);
      expect(startEqualNegLenSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test032
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endEqualNegLenBuffer = new ArrayBuffer(8);
      const endEqualNegLenSliced = endEqualNegLenBuffer.slice(0, -8);
      expect(endEqualNegLenSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test033
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintBuffer = new ArrayBuffer(8);
      const bigUintSliced = bigUintBuffer.slice(0, 8);
      const bigUintView = new BigUint64Array(bigUintSliced);
      bigUintView[0] = 123456789012345n;
      expect(bigUintView[0]).assertEqual(123456789012345n);
    });

    /**
     * @tc.name   arraybuffer4Test034
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataSourceBuffer = new ArrayBuffer(4);
      const dataSourceView = new Uint8Array(dataSourceBuffer);
      dataSourceView[1] = 0xAB; // 原缓冲区索引1写入0xAB
      const dataSliced = dataSourceBuffer.slice(0, 4);
      const dataSlicedView = new Uint8Array(dataSliced);
      expect(dataSlicedView[1]).assertEqual(0xAB);
    });

    /**
     * @tc.name   arraybuffer4Test035
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const halfLenBuffer = new ArrayBuffer(8);
      const halfLenSliced = halfLenBuffer.slice(0, 4);
      expect(halfLenSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test036
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latterHalfBuffer = new ArrayBuffer(8);
      const latterHalfSliced = latterHalfBuffer.slice(4, 8);
      expect(latterHalfSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test037
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatBuffer = new ArrayBuffer(4);
      const floatSliced = floatBuffer.slice(0, 4);
      const floatView = new Float32Array(floatSliced);
      floatView[0] = 3.14159;
      expect(floatView[0]).assertClose(3.14159, 5);
    });

    /**
     * @tc.name   arraybuffer4Test038
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startZeroNoEndBuffer = new ArrayBuffer(12);
      const startZeroNoEndSliced = startZeroNoEndBuffer.slice(0);
      expect(startZeroNoEndSliced.byteLength).assertEqual(12);
    });

    /**
     * @tc.name   arraybuffer4Test039
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_3900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endNegOverBuffer = new ArrayBuffer(8);
      const endNegOverSliced = endNegOverBuffer.slice(2, -10);
      expect(endNegOverSliced.byteLength).assertEqual(0);

    });

    /**
     * @tc.name   arraybuffer4Test040
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nineByteNegRangeBuffer = new ArrayBuffer(9);
      const nineByteNegRangeSliced = nineByteNegRangeBuffer.slice(-6, -3);
      expect(nineByteNegRangeSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test041
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoByteBuffer = new ArrayBuffer(2);
      const twoByteSliced = twoByteBuffer.slice(1, 2);
      expect(twoByteSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test042
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Buffer = new ArrayBuffer(4);
      const int16Sliced = int16Buffer.slice(0, 4);
      const int16View = new Int16Array(int16Sliced);
      int16View[1] = -32768; // Int16最小值
      expect(int16View[1]).assertEqual(-32768);
    });

    /**
     * @tc.name   arraybuffer4Test043
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negStartPosEndBuffer = new ArrayBuffer(8);
      const negStartPosEndSliced = negStartPosEndBuffer.slice(-5, 6);
      expect(negStartPosEndSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test044
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minValStart5EndBuffer = new ArrayBuffer(8);
      const minValStart5EndSliced = minValStart5EndBuffer.slice(Number.MIN_VALUE, 5);
      expect(minValStart5EndSliced.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer4Test045
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixteenByteBuffer = new ArrayBuffer(16);
      const sixteenByteSliced = sixteenByteBuffer.slice(4, 12);
      expect(sixteenByteSliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test046
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const multiTypeBuffer = new ArrayBuffer(8);
      const multiTypeSliced = multiTypeBuffer.slice(0, 8);
      const multiTypeDataView = new DataView(multiTypeSliced);
      multiTypeDataView.setUint8(0, 0xFF);
      multiTypeDataView.setFloat32(4, 2.718);
      expect(multiTypeDataView.getUint8(0)).assertEqual(0xFF);
      expect(multiTypeDataView.getFloat32(4)).assertClose(2.718, 3);
    });

    /**
     * @tc.name   arraybuffer4Test047
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const lastByteBuffer = new ArrayBuffer(8);
      const lastByteSliced = lastByteBuffer.slice(7, 8);
      expect(lastByteSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test048
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16EndianBuffer = new ArrayBuffer(4);
      const int16EndianSliced = int16EndianBuffer.slice(0, 4);
      const int16EndianDataView = new DataView(int16EndianSliced);
      int16EndianDataView.setInt16(1, -32768, true);
      expect(int16EndianDataView.getInt16(1, true)).assertEqual(-32768);
    });

    /**
     * @tc.name   arraybuffer4Test049
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_4900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const thirtyTwoByteBuffer = new ArrayBuffer(32);
      const thirtyTwoByteSliced = thirtyTwoByteBuffer.slice(-16, -8);
      expect(thirtyTwoByteSliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test050
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const clampedBuffer = new ArrayBuffer(4);
      const clampedSliced = clampedBuffer.slice(0, 4);
      const clampedView = new Uint8ClampedArray(clampedSliced);
      clampedView[0] = 300; // 超出范围→裁剪为255
      expect(clampedView[0]).assertEqual(255);

    });
    /**
     * @tc.name   arraybuffer4Test051
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteZeroEndBuffer = new ArrayBuffer(1);
      const oneByteZeroEndSliced = oneByteZeroEndBuffer.slice(0, 1);
      expect(oneByteZeroEndSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test052
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntNegBuffer = new ArrayBuffer(8);
      const bigIntNegSliced = bigIntNegBuffer.slice(0, 8);
      const bigIntNegView = new BigInt64Array(bigIntNegSliced);
      bigIntNegView[0] = -9223372036854775808n; // BigInt64最小值
      expect(bigIntNegView[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   arraybuffer4Test053
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatNegStartBuffer = new ArrayBuffer(8);
      const floatNegStartSliced = floatNegStartBuffer.slice(-2.9, 5);
      expect(floatNegStartSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test054
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nestedSliceBuffer = new ArrayBuffer(8);
      const firstSlice = nestedSliceBuffer.slice(1, 4);
      const secondSlice = firstSlice.slice(1, 2);
      expect(secondSlice.byteLength).assertEqual(1);

    });

    /**
     * @tc.name   arraybuffer4Test055
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixtyFourByteBuffer = new ArrayBuffer(64);
      const sixtyFourByteSliced = sixtyFourByteBuffer.slice(16, 48);
      expect(sixtyFourByteSliced.byteLength).assertEqual(32);
    });

    /**
     * @tc.name   arraybuffer4Test056
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewBufferPropBuffer = new ArrayBuffer(8);
      const viewBufferPropSliced = viewBufferPropBuffer.slice(2, 6);
      const viewBufferPropView = new Uint8Array(viewBufferPropSliced);
      expect(viewBufferPropView.buffer).assertEqual(viewBufferPropSliced);
    });

    /**
     * @tc.name   arraybuffer4Test057
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minSafeStartBuffer = new ArrayBuffer(8);
      const minSafeStartSliced = minSafeStartBuffer.slice(Number.MIN_SAFE_INTEGER, 3);
      expect(minSafeStartSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test058
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveTwelveKBBuffer = new ArrayBuffer(524288);
      const fiveTwelveKBSliced = fiveTwelveKBBuffer.slice(131072, 393216);
      expect(fiveTwelveKBSliced.byteLength).assertEqual(262144);
    });

    /**
     * @tc.name   arraybuffer4Test059
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_5900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneTwentyEightBuffer = new ArrayBuffer(128);
      const oneTwentyEightSliced = oneTwentyEightBuffer.slice(-64, 0);
      expect(oneTwentyEightSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test060
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintToStringBuffer = new ArrayBuffer(8);
      const bigUintToStringSliced = bigUintToStringBuffer.slice(0, 8);
      const bigUintToStringView = new BigUint64Array(bigUintToStringSliced);
      bigUintToStringView[0] = 9876543210123456789n;
      expect(bigUintToStringView.toString()).assertEqual("9876543210123456789");
    });

    /**
     * @tc.name   arraybuffer4Test061
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const start1EndNeg1Buffer = new ArrayBuffer(8);
      const start1EndNeg1Sliced = start1EndNeg1Buffer.slice(1, -1);
      expect(start1EndNeg1Sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   arraybuffer4Test062
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32LenBuffer = new ArrayBuffer(8);
      const uint32LenSliced = uint32LenBuffer.slice(2, 6);
      const uint32LenView = new Uint32Array(uint32LenSliced);
      expect(uint32LenView.length).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test063
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negLenPlus2Buffer = new ArrayBuffer(8);
      const negLenPlus2Sliced = negLenPlus2Buffer.slice(-6, 5);
      expect(negLenPlus2Sliced.byteLength).assertEqual(3)
    });

    /**
     * @tc.name   arraybuffer4Test064
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const forEachBuffer = new ArrayBuffer(4);
      const forEachSliced = forEachBuffer.slice(0, 4);
      const forEachView = new Uint8Array(forEachSliced);
      forEachView[1] = 0xCD;
      let forEachCount = 0;
      forEachView.forEach(() => forEachCount++);
      expect(forEachCount).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test065
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startEqualLenBuffer = new ArrayBuffer(8);
      const startEqualLenSliced = startEqualLenBuffer.slice(8, 13);
      expect(startEqualLenSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test066
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightByteNeg8End3Buffer = new ArrayBuffer(8);
      const eightByteNeg8End3Sliced = eightByteNeg8End3Buffer.slice(-8, 3);
      expect(eightByteNeg8End3Sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test067
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoFiftySixBuffer = new ArrayBuffer(256);
      const twoFiftySixSliced = twoFiftySixBuffer.slice(64, 192);
      expect(twoFiftySixSliced.byteLength).assertEqual(128);
    });

    /**
     * @tc.name   arraybuffer4Test068
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintByteLenBuffer = new ArrayBuffer(16);
      const bigUintByteLenSliced = bigUintByteLenBuffer.slice(4, 12); // 8字节
      const bigUintByteLenView = new BigUint64Array(bigUintByteLenSliced);
      expect(bigUintByteLenView.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test069
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_6900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxSafeEndBuffer = new ArrayBuffer(8);
      const maxSafeEndSliced = maxSafeEndBuffer.slice(0, Number.MAX_SAFE_INTEGER);
      expect(maxSafeEndSliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test070
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const findBuffer = new ArrayBuffer(4);
      const findSliced = findBuffer.slice(0, 4);
      const findView = new Uint8Array(findSliced);
      findView[2] = 0xEF;
      const foundVal = findView.find(val => val === 0xEF);
      expect(foundVal).assertEqual(0xEF);
    });

    /**
     * @tc.name   arraybuffer4Test071
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startEndEqualBuffer = new ArrayBuffer(8);
      const startEndEqualSliced = startEndEqualBuffer.slice(3, 3);
      expect(startEndEqualSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test072
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tenByteStart4EndNeg2Buffer = new ArrayBuffer(10);
      const tenByteStart4EndNeg2Sliced = tenByteStart4EndNeg2Buffer.slice(4, -2);
      expect(tenByteStart4EndNeg2Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test073
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const lastByteNegStartBuffer = new ArrayBuffer(8);
      const lastByteNegStartSliced = lastByteNegStartBuffer.slice(-1, 8);
      expect(lastByteNegStartSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test074
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const doubleSliceBuffer = new ArrayBuffer(8);
      const firstDoubleSlice = doubleSliceBuffer.slice(2, 6);
      const secondDoubleSlice = firstDoubleSlice.slice(1, 3);
      expect(secondDoubleSlice.byteLength).assertEqual(2);
      expect(doubleSliceBuffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test075
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minValStartBuffer = new ArrayBuffer(8);
      const minValStartSliced = minValStartBuffer.slice(Number.MIN_VALUE, 4);
      expect(minValStartSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test076
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const reduceBuffer = new ArrayBuffer(4);
      const reduceSliced = reduceBuffer.slice(0, 4);
      const reduceView = new Uint8Array(reduceSliced);
      reduceView[0] = 10;
      reduceView[2] = 20;
      const total = reduceView.reduce((acc, val) => acc + val, 0);
      expect(total).assertEqual(30);

    });

    /**
     * @tc.name   arraybuffer4Test077
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const startGtNegEndBuffer = new ArrayBuffer(8);
      const startGtNegEndSliced = startGtNegEndBuffer.slice(5, -2);
      expect(startGtNegEndSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test078
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8NegBuffer = new ArrayBuffer(4);
      const int8NegSliced = int8NegBuffer.slice(0, 4);
      const int8NegView = new Int8Array(int8NegSliced);
      int8NegView[1] = -128;
      expect(int8NegView[1]).assertEqual(-128);
    });

    /**
     * @tc.name   arraybuffer4Test079
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_7900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveTwelveBuffer = new ArrayBuffer(512);
      const fiveTwelveSliced = fiveTwelveBuffer.slice(-256, -128);
      expect(fiveTwelveSliced.byteLength).assertEqual(128);
    });

    /**
     * @tc.name   arraybuffer4Test080
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneMBBuffer = new ArrayBuffer(1048576);
      const oneMBSliced = oneMBBuffer.slice(-262144, -131072);
      expect(oneMBSliced.byteLength).assertEqual(131072);
    });
    /**
     * @tc.name   arraybuffer4Test081
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endMinSafeBuffer = new ArrayBuffer(8);
      const endMinSafeSliced = endMinSafeBuffer.slice(2, Number.MIN_SAFE_INTEGER);
      expect(endMinSafeSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test082
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sevenByteStart2End6Buffer = new ArrayBuffer(7);
      const sevenByteStart2End6Sliced = sevenByteStart2End6Buffer.slice(2, 6);
      expect(sevenByteStart2End6Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test083
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoByteZeroEndBuffer = new ArrayBuffer(2);
      const twoByteZeroEndSliced = twoByteZeroEndBuffer.slice(0, 1);
      expect(twoByteZeroEndSliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test084
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const subarrayBuffer = new ArrayBuffer(8);
      const subarraySliced = subarrayBuffer.slice(2, 6);
      const subarrayView = new Uint8Array(subarraySliced).subarray(1, 3);
      expect(subarrayView.length).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test085
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negStartNegEndBuffer = new ArrayBuffer(8);
      const negStartNegEndSliced = negStartNegEndBuffer.slice(-3, -1);
      expect(negStartNegEndSliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test086
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const someBuffer = new ArrayBuffer(4);
      const someSliced = someBuffer.slice(0, 4);
      const someView = new Uint8Array(someSliced);
      someView[1] = 0xBC;
      const hasBC = someView.some(val => val === 0xBC);
      expect(hasBC).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer4Test087
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const midToEndBuffer = new ArrayBuffer(8);
      const midToEndSliced = midToEndBuffer.slice(4, 8);
      expect(midToEndSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test088
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntLenBuffer = new ArrayBuffer(16);
      const bigIntLenSliced = bigIntLenBuffer.slice(4, 12); // 8字节
      const bigIntLenView = new BigInt64Array(bigIntLenSliced);
      expect(bigIntLenView.length).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test089
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_8900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const start1EndLenMin1Buffer = new ArrayBuffer(8);
      const start1EndLenMin1Sliced = start1EndLenMin1Buffer.slice(1, 7);
      expect(start1EndLenMin1Sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name   arraybuffer4Test090
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const toStringBuffer = new ArrayBuffer(8);
      const toStringSliced = toStringBuffer.slice(2, 6);
      expect(toStringSliced.toString()).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name   arraybuffer4Test091
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negStart6EndBuffer = new ArrayBuffer(8);
      const negStart6EndSliced = negStart6EndBuffer.slice(-4, 6);
      expect(negStart6EndSliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test092
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nineByteNeg4End6Buffer = new ArrayBuffer(9);
      const nineByteNeg4End6Sliced = nineByteNeg4End6Buffer.slice(-4, 6);
      expect(nineByteNeg4End6Sliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test093
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endEqualNegTotalBuffer = new ArrayBuffer(8);
      const endEqualNegTotalSliced = endEqualNegTotalBuffer.slice(0, -8);
      expect(endEqualNegTotalSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test094
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endianDataViewBuffer = new ArrayBuffer(4);
      const endianDataViewSliced = endianDataViewBuffer.slice(0, 4);
      const endianDataView = new DataView(endianDataViewSliced);
      endianDataView.setUint16(1, 0xABCD, true); // 小端写入
      expect(endianDataView.getUint16(1, true)).assertEqual(0xABCD);
    });

    /**
     * @tc.name   arraybuffer4Test095
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneKBBuffer = new ArrayBuffer(1024);
      const oneKBSliced = oneKBBuffer.slice(256, 768);
      expect(oneKBSliced.byteLength).assertEqual(512);
    });

    /**
     * @tc.name   arraybuffer4Test096
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintOffsetBuffer = new ArrayBuffer(16);
      const bigUintOffsetSliced = bigUintOffsetBuffer.slice(4, 12); // 8字节
      const bigUintOffsetView = new BigUint64Array(bigUintOffsetSliced);
      expect(bigUintOffsetView.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test097
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const safeMaxMin1StartBuffer = new ArrayBuffer(8);
      const safeMaxMin1StartSliced = safeMaxMin1StartBuffer.slice(Number.MAX_SAFE_INTEGER - 1);
      expect(safeMaxMin1StartSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test098
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightMBBuffer = new ArrayBuffer(8388608);
      const eightMBSliced = eightMBBuffer.slice(2097152, 6291456);
      expect(eightMBSliced.byteLength).assertEqual(4194304);
    });

    /**
     * @tc.name   arraybuffer4Test099
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_9900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const start3EndNeg4Buffer = new ArrayBuffer(8);
      const start3EndNeg4Sliced = start3EndNeg4Buffer.slice(3, -4);
      expect(start3EndNeg4Sliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test100
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32MaxBuffer = new ArrayBuffer(4);
      const int32MaxSliced = int32MaxBuffer.slice(0, 4);
      const int32MaxView = new Int32Array(int32MaxSliced);
      int32MaxView[0] = 2147483647; // Int32最大值
      expect(int32MaxView[0]).assertEqual(2147483647);
    });

    /**
     * @tc.name   arraybuffer4Test101
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoKBBuffer = new ArrayBuffer(2048);
      const twoKBSliced = twoKBBuffer.slice(-1024, -512);
      expect(twoKBSliced.byteLength).assertEqual(512);
    });

    /**
     * @tc.name   arraybuffer4Test102
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewOffsetBuffer = new ArrayBuffer(8);
      const dataViewOffsetSliced = dataViewOffsetBuffer.slice(2, 6);
      const dataViewOffset = new DataView(dataViewOffsetSliced);
      expect(dataViewOffset.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test103
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const threeByteZeroEndBuffer = new ArrayBuffer(3);
      const threeByteZeroEndSliced = threeByteZeroEndBuffer.slice(0, 2);
      expect(threeByteZeroEndSliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test104
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const everyBuffer = new ArrayBuffer(4);
      const everySliced = everyBuffer.slice(0, 4);
      const everyView = new Uint8Array(everySliced);
      everyView[0] = 10;
      everyView[1] = 20;
      const allPositive = everyView.every(val => val >= 0);
      expect(allPositive).assertEqual(true);
    });

    /**
     * @tc.name   arraybuffer4Test105
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endOverLenBuffer = new ArrayBuffer(8);
      const endOverLenSliced = endOverLenBuffer.slice(-2, 11);
      expect(endOverLenSliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name   arraybuffer4Test106
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32ByteLenBuffer = new ArrayBuffer(8);
      const float32ByteLenSliced = float32ByteLenBuffer.slice(2, 6); // 4字节
      const float32ByteLenView = new Float32Array(float32ByteLenSliced);
      expect(float32ByteLenView.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test107
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minValStartEndBuffer = new ArrayBuffer(8);
      const minValStartEndSliced = minValStartEndBuffer.slice(Number.MIN_VALUE, Number.MIN_VALUE);
      expect(minValStartEndSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test108
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const multiViewBuffer = new ArrayBuffer(8);
      const multiViewSliced = multiViewBuffer.slice(0, 8);
      const uint8View = new Uint8Array(multiViewSliced);
      const int16View = new Int16Array(multiViewSliced);
      uint8View[1] = 0xFF;
      expect(int16View[0]).assertEqual(-256);
    });

    /**
     * @tc.name   arraybuffer4Test109
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_10900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const start5End8Buffer = new ArrayBuffer(8);
      const start5End8Sliced = start5End8Buffer.slice(5, 8);
      expect(start5End8Sliced.byteLength).assertEqual(3);
    });
    /**
     * @tc.name   arraybuffer4Test110
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntPosBuffer = new ArrayBuffer(8);
      const bigIntPosSliced = bigIntPosBuffer.slice(0, 8);
      const bigIntPosView = new BigInt64Array(bigIntPosSliced);
      bigIntPosView[0] = 9223372036854775807n;
      expect(bigIntPosView[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   arraybuffer4Test111
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fourKBBuffer = new ArrayBuffer(4096);
      const fourKBSliced = fourKBBuffer.slice(1024, 3072);
      expect(fourKBSliced.byteLength).assertEqual(2048);
    });

    /**
     * @tc.name   arraybuffer4Test112
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const keysBuffer = new ArrayBuffer(4);
      const keysSliced = keysBuffer.slice(0, 4);
      const keysView = new Uint8Array(keysSliced);
      const keys = Array.from(keysView.keys());
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify([0, 1, 2, 3]));
    });

    /**
     * @tc.name   arraybuffer4Test113
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negStart7End5Buffer = new ArrayBuffer(8);
      const negStart7End5Sliced = negStart7End5Buffer.slice(-7, 5);
      expect(negStart7End5Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test114
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64EndianBuffer = new ArrayBuffer(8);
      const float64EndianSliced = float64EndianBuffer.slice(0, 8);
      const float64EndianDataView = new DataView(float64EndianSliced);
      float64EndianDataView.setFloat64(0, Math.E, false);
      expect(float64EndianDataView.getFloat64(0, false)).assertClose(Math.E, 10);
    });

    /**
     * @tc.name   arraybuffer4Test115
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const threeByteEqualStartEndBuffer = new ArrayBuffer(3);
      const threeByteEqualStartEndSliced = threeByteEqualStartEndBuffer.slice(2, 2);
      expect(threeByteEqualStartEndSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test116
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const clampedZeroBuffer = new ArrayBuffer(4);
      const clampedZeroSliced = clampedZeroBuffer.slice(0, 4);
      const clampedZeroView = new Uint8ClampedArray(clampedZeroSliced);
      clampedZeroView[2] = 0;
      expect(clampedZeroView[2]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test117
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightKBBuffer = new ArrayBuffer(8192);
      const eightKBSliced = eightKBBuffer.slice(-4096, 0);
      expect(eightKBSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test118
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nineByteNeg5End7Buffer = new ArrayBuffer(9);
      const nineByteNeg5End7Sliced = nineByteNeg5End7Buffer.slice(-5, 7);
      expect(nineByteNeg5End7Sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test119
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_11900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoMBBuffer = new ArrayBuffer(2097152);
      const twoMBSliced = twoMBBuffer.slice(524288, 1572864);
      expect(twoMBSliced.byteLength).assertEqual(1048576);
    });

    /**
     * @tc.name   arraybuffer4Test120
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightByteStart3EndNeg1Buffer = new ArrayBuffer(8);
      const eightByteStart3EndNeg1Sliced = eightByteStart3EndNeg1Buffer.slice(3, -1);
      expect(eightByteStart3EndNeg1Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test121
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tenByteNegRangeBuffer = new ArrayBuffer(10);
      const tenByteNegRangeSliced = tenByteNegRangeBuffer.slice(-5, -2);
      expect(tenByteNegRangeSliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test122
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const copyWithinBuffer = new ArrayBuffer(4);
      const copyWithinSliced = copyWithinBuffer.slice(0, 4);
      const copyWithinView = new Uint16Array(copyWithinSliced);
      copyWithinView[1] = 0xABCD;
      copyWithinView.copyWithin(0, 1);
      expect(copyWithinView[0]).assertEqual(0xABCD);
    });

    /**
     * @tc.name   arraybuffer4Test123
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const safeMaxStartEndBuffer = new ArrayBuffer(8);
      const safeMaxStartEndSliced = safeMaxStartEndBuffer.slice(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER);
      expect(safeMaxStartEndSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test124
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8DataViewBuffer = new ArrayBuffer(4);
      const int8DataViewSliced = int8DataViewBuffer.slice(0, 4);
      const int8DataView = new DataView(int8DataViewSliced);
      int8DataView.setInt8(2, -64);
      expect(int8DataView.getInt8(2)).assertEqual(-64);

    });

    /**
     * @tc.name   arraybuffer4Test125
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixteenKBBuffer = new ArrayBuffer(16384);
      const sixteenKBSliced = sixteenKBBuffer.slice(4096, 12288);
      expect(sixteenKBSliced.byteLength).assertEqual(8192);
    });

    /**
     * @tc.name   arraybuffer4Test126
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUintFillBuffer = new ArrayBuffer(8);
      const bigUintFillSliced = bigUintFillBuffer.slice(0, 8);
      const bigUintFillView = new BigUint64Array(bigUintFillSliced);
      bigUintFillView.fill(12345n);
      expect(bigUintFillView[0]).assertEqual(12345n);

    });

    /**
     * @tc.name   arraybuffer4Test127
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const endMinSafeZeroStartBuffer = new ArrayBuffer(8);
      const endMinSafeZeroStartSliced = endMinSafeZeroStartBuffer.slice(0, Number.MIN_SAFE_INTEGER);
      expect(endMinSafeZeroStartSliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer4Test128
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const findIndexBuffer = new ArrayBuffer(4);
      const findIndexSliced = findIndexBuffer.slice(0, 4);
      const findIndexView = new Uint8Array(findIndexSliced);
      findIndexView[3] = 0x7F;
      const foundIdx = findIndexView.findIndex(val => val === 0x7F);
      expect(foundIdx).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test129
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_12900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tenByteStart4EndNeg3Buffer = new ArrayBuffer(10);
      const tenByteStart4EndNeg3Sliced = tenByteStart4EndNeg3Buffer.slice(4, -3);
      expect(tenByteStart4EndNeg3Sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test130
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixByteStart1End4Buffer = new ArrayBuffer(6);
      const sixByteStart1End4Sliced = sixByteStart1End4Buffer.slice(1, 4);
      expect(sixByteStart1End4Sliced.byteLength).assertEqual(3);
    });
    /**
     * @tc.name   arraybuffer4Test131
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const thirtyTwoKBBuffer = new ArrayBuffer(32768);
      const thirtyTwoKBSliced = thirtyTwoKBBuffer.slice(-16384, -8192);
      expect(thirtyTwoKBSliced.byteLength).assertEqual(8192);
    });

    /**
     * @tc.name   arraybuffer4Test132
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntValueOfBuffer = new ArrayBuffer(8);
      const bigIntValueOfSliced = bigIntValueOfBuffer.slice(0, 8);
      const bigIntValueOfView = new BigInt64Array(bigIntValueOfSliced);
      bigIntValueOfView[0] = -123456789n;
      const bigIntValueOf = bigIntValueOfView.valueOf();
      expect(bigIntValueOf[0]).assertEqual(-123456789n);
    });

    /**
     * @tc.name   arraybuffer4Test133
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tenByteMaxSafeEndBuffer = new ArrayBuffer(10);
      const tenByteMaxSafeEndSliced = tenByteMaxSafeEndBuffer.slice(2, Number.MAX_SAFE_INTEGER);
      expect(tenByteMaxSafeEndSliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer4Test134
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fixedLenEqualBuffer = new ArrayBuffer(8);
      const fixedLenEqualSliced = fixedLenEqualBuffer.slice(2, 6);
      expect(fixedLenEqualSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test135
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightByteNegStart10Buffer = new ArrayBuffer(8);
      const eightByteNegStart10Sliced = eightByteNegStart10Buffer.slice(-10, 5);
      expect(eightByteNegStart10Sliced.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer4Test136
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32EndianBuffer = new ArrayBuffer(4);
      const uint32EndianSliced = uint32EndianBuffer.slice(0, 4);
      const uint32EndianDataView = new DataView(uint32EndianSliced);
      uint32EndianDataView.setUint32(0, 0x12345678, false); // 大端写入
      expect(uint32EndianDataView.getUint32(0, false)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   arraybuffer4Test137
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixtyFourKBBuffer = new ArrayBuffer(65536);
      const sixtyFourKBSliced = sixtyFourKBBuffer.slice(16384, 49152);
      expect(sixtyFourKBSliced.byteLength).assertEqual(32768);
    });

    /**
     * @tc.name   arraybuffer4Test138
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const everyNonNegBuffer = new ArrayBuffer(4);
      const everyNonNegSliced = everyNonNegBuffer.slice(0, 4);
      const everyNonNegView = new Int8Array(everyNonNegSliced);
      everyNonNegView[1] = -10;
      const allNonNeg = everyNonNegView.every(val => val >= 0);
      expect(allNonNeg).assertEqual(false);
    });

    /**
     * @tc.name   arraybuffer4Test139
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_13900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightByteStart3End7Buffer = new ArrayBuffer(8);
      const eightByteStart3End7Sliced = eightByteStart3End7Buffer.slice(3, 7);
      expect(eightByteStart3End7Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test140
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntSubarrayBuffer = new ArrayBuffer(8);
      const bigIntSubarraySliced = bigIntSubarrayBuffer.slice(0, 8);
      const bigIntSubarrayView = new BigInt64Array(bigIntSubarraySliced);
      const bigIntSub = bigIntSubarrayView.subarray(0, 1);
      expect(bigIntSub.length).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer4Test141
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14100
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneTwentyEightKBBuffer = new ArrayBuffer(131072);
      const oneTwentyEightKBSliced = oneTwentyEightKBBuffer.slice(-65536, -32768);
      expect(oneTwentyEightKBSliced.byteLength).assertEqual(32768);
    });

    /**
     * @tc.name   arraybuffer4Test142
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14200
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const viewToStringBuffer = new ArrayBuffer(4);
      const viewToStringSliced = viewToStringBuffer.slice(0, 4);
      const viewToStringView = new Uint8Array(viewToStringSliced);
      viewToStringView[1] = 0xAB;
      expect(viewToStringView.toString()).assertEqual("0,171,0,0");
    });

    /**
     * @tc.name   arraybuffer4Test143
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14300
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveByteZeroEndBuffer = new ArrayBuffer(5);
      const fiveByteZeroEndSliced = fiveByteZeroEndBuffer.slice(0, 4);
      expect(fiveByteZeroEndSliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test144
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14400
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewByteLenBuffer = new ArrayBuffer(8);
      const dataViewByteLenSliced = dataViewByteLenBuffer.slice(2, 6); // 4字节
      const dataViewByteLen = new DataView(dataViewByteLenSliced);
      expect(dataViewByteLen.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test145
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14500
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eightByteNeg3End9Buffer = new ArrayBuffer(8);
      const eightByteNeg3End9Sliced = eightByteNeg3End9Buffer.slice(-3, 9);
      expect(eightByteNeg3End9Sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test146
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14600
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveByteZeroEnd3Buffer = new ArrayBuffer(5);
      const fiveByteZeroEnd3Sliced = fiveByteZeroEnd3Buffer.slice(0, 3);
      expect(fiveByteZeroEnd3Sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer4Test147
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14700
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoFiftySixKBBuffer = new ArrayBuffer(262144);
      const twoFiftySixKBSliced = twoFiftySixKBBuffer.slice(65536, 196608);
      expect(twoFiftySixKBSliced.byteLength).assertEqual(131072);
    });

    /**
     * @tc.name   arraybuffer4Test148
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14800
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const valueOfBuffer = new ArrayBuffer(4);
      const valueOfSliced = valueOfBuffer.slice(0, 4);
      const valueOfView = new Uint8Array(valueOfSliced);
      valueOfView[2] = 0xCD;
      const valueOfResult = valueOfView.valueOf();
      expect(valueOfResult[2]).assertEqual(0xCD);
    });

    /**
     * @tc.name   arraybuffer4Test149
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_14900
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixByteStart1End5Buffer = new ArrayBuffer(6);
      const sixByteStart1End5Sliced = sixByteStart1End5Buffer.slice(1, 5);
      expect(sixByteStart1End5Sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer4Test150
     * @tc.number SUB_BUILTINS_arraybuffer4_TEST_15000
     * @tc.desc   test arraybuffer slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer4Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fourMBBuffer = new ArrayBuffer(4194304);
      const fourMBSliced = fourMBBuffer.slice(-1048576, -524288);
      expect(fourMBSliced.byteLength).assertEqual(524288);
    });
  })
}

