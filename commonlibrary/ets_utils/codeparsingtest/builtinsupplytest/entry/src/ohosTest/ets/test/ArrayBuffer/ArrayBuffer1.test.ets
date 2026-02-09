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

export default function ArrayBuffer1Test() {
  describe('ArrayBuffer1Test', () => {
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
      await sleep(40);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   arraybuffer1Test001
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicBuffer = new ArrayBuffer(8);
      expect(basicBuffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name   arraybuffer1Test002
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const resizableBuffer = new ArrayBuffer(4);
      // const resizableBuffer = new ArrayBuffer(4, { maxByteLength: 12 });
      expect(resizableBuffer.byteLength).assertEqual(4);
    });
    /**
     * @tc.name   arraybuffer1Test003
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const zeroLengthBuffer = new ArrayBuffer(0);
      // const zeroLengthBuffer = new ArrayBuffer(0, { maxByteLength: 8 });
      expect(zeroLengthBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test004
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new ArrayBuffer(-4);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   arraybuffer1Test005
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiftyByteNegativeSliceBuffer = new ArrayBuffer(50);
      const fiftyByteNegativeSlice = fiftyByteNegativeSliceBuffer.slice(-20, -5);
      expect(fiftyByteNegativeSlice.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   arraybuffer1Test006
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const overSafeLength = Number.MAX_SAFE_INTEGER + 1;
        new ArrayBuffer(overSafeLength);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("");
      }
    });

    /**
     * @tc.name   arraybuffer1Test007
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const initTestBuffer = new ArrayBuffer(3);
      const initView = new Uint8Array(initTestBuffer);
      expect(initView[0]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test008
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoFiftySixByteFloat64Buffer = new ArrayBuffer(256);
      const twoFiftySixByteFloat64View = new Float64Array(twoFiftySixByteFloat64Buffer);
      expect(twoFiftySixByteFloat64View.length).assertEqual(32);
    });

    /**
     * @tc.name   arraybuffer1Test009
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_0900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const floatIntLengthBuffer = new ArrayBuffer(8.0);
      expect(floatIntLengthBuffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer1Test010
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoUint16Buffer = new ArrayBuffer(4);
      const twoUint16View = new Uint16Array(twoUint16Buffer);
      twoUint16View[0] = 0xABCD;
      twoUint16View[1] = 0xEF12;
      expect(twoUint16View[0]).assertEqual(0xABCD);
    });

    /**
     * @tc.name   arraybuffer1Test011
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minFixedBuffer = new ArrayBuffer(1);
      expect(minFixedBuffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer1Test012
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fixedViewTest = new ArrayBuffer(2);
      const int16View = new Int16Array(fixedViewTest);
      expect(int16View[0]).assertEqual(0); // 2字节初始值为0
    });

    /**
     * @tc.name   arraybuffer1Test013
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new ArrayBuffer(Number.MIN_SAFE_INTEGER);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   arraybuffer1Test014
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const commonSizeBuffer = new ArrayBuffer(1024);
      expect(commonSizeBuffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name   arraybuffer1Test015
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const zeroFloatBuffer = new ArrayBuffer(0.0);
      expect(zeroFloatBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test016
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negativeZeroBuffer = new ArrayBuffer(-0.0);
      expect(negativeZeroBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test017
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteInt8Buffer = new ArrayBuffer(1);
      const oneByteInt8View = new Int8Array(oneByteInt8Buffer);
      oneByteInt8View[0] = -1;
      expect(oneByteInt8View[0]).assertEqual(-1);
    });

    /**
     * @tc.name   arraybuffer1Test018
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16MaxBuffer = new ArrayBuffer(65536);
      expect(uint16MaxBuffer.byteLength).assertEqual(65536);
    });

    /**
     * @tc.name   arraybuffer1Test019
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_1900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneTwentyEightByteUint8Buffer = new ArrayBuffer(128);
      const oneTwentyEightByteUint8View = new Uint8Array(oneTwentyEightByteUint8Buffer);
      oneTwentyEightByteUint8View[64] = 0x55;
      expect(oneTwentyEightByteUint8View[64]).assertEqual(0x55);
    });

    /**
     * @tc.name   arraybuffer1Test020
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneMBLength = 1024 * 1024;
      const oneMBLengthBuffer = new ArrayBuffer(oneMBLength);
      expect(oneMBLengthBuffer.byteLength).assertEqual(oneMBLength);
    });
    /**
     * @tc.name   arraybuffer1Test021
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new ArrayBuffer(Number.MAX_VALUE);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   arraybuffer1Test022
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolTrueBuffer = new ArrayBuffer(1);
      expect(boolTrueBuffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer1Test023
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const overOneGBLength = 2 ^ 30 + 1;
      if (overOneGBLength <= Number.MAX_SAFE_INTEGER) { // 确保不超安全整数
        const overOneGBBuffer = new ArrayBuffer(overOneGBLength);
        expect(overOneGBBuffer.byteLength).assertEqual(overOneGBLength);
      }
    });

    /**
     * @tc.name   arraybuffer1Test024
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const writeTestBuffer = new ArrayBuffer(4);
      const writeView = new Uint32Array(writeTestBuffer);
      writeView[0] = 0x12345678; // 写入数据
      expect(writeView[0]).assertEqual(0x12345678); // 验证写入成功
    });

    /**
     * @tc.name   arraybuffer1Test025
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fixedTransferBuffer = new ArrayBuffer(5);
      expect(fixedTransferBuffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.name   arraybuffer1Test026
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyUint8Buffer = new ArrayBuffer(0);
      const emptyUint8View = new Uint8Array(emptyUint8Buffer);
      expect(emptyUint8View.length).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test027
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewBuffer = new ArrayBuffer(8);
      const dataView = new DataView(dataViewBuffer);
      dataView.setInt32(0, 0x11223344, true);
      expect(dataView.getInt32(0, true)).assertEqual(0x11223344);
    });

    /**
     * @tc.name   arraybuffer1Test028
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const basicFixedBuffer = new ArrayBuffer(8);
      expect(basicFixedBuffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer1Test029
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_2900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minFixedBuffer = new ArrayBuffer(1);
      expect(minFixedBuffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name   arraybuffer1Test030
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const zeroLengthFixedBuffer = new ArrayBuffer(0);
      expect(zeroLengthFixedBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test031
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixtyFourByteSliceLenBuffer = new ArrayBuffer(64);
      const sixtyFourByteSliceLen = sixtyFourByteSliceLenBuffer.slice(20, 40);
      expect(sixtyFourByteSliceLen.byteLength).assertEqual(20);
    });

    /**
     * @tc.name   arraybuffer1Test032
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewInt64Buffer = new ArrayBuffer(16);
      const dataViewInt64 = new DataView(dataViewInt64Buffer);
      const int64Value = -987654321012345n;
      dataViewInt64.setBigInt64(4, int64Value, false);
      expect(dataViewInt64.getBigInt64(4, false)).assertEqual(int64Value);
    });

    /**
     * @tc.name   arraybuffer1Test033
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneKBFixedBuffer = new ArrayBuffer(1024);
      expect(oneKBFixedBuffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name   arraybuffer1Test034
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneMBFixedBuffer = new ArrayBuffer(1024 * 1024);
      expect(oneMBFixedBuffer.byteLength).assertEqual(1048576);
    });

    /**
     * @tc.name   arraybuffer1Test035
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8TestBuffer = new ArrayBuffer(4);
      const uint8View = new Uint8Array(uint8TestBuffer);
      uint8View[0] = 255;
      expect(uint8View[0]).assertEqual(255);
    });

    /**
     * @tc.name   arraybuffer1Test036
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewTestBuffer = new ArrayBuffer(8);
      const dataView = new DataView(dataViewTestBuffer);
      dataView.setInt32(0, 123456, true);
      expect(dataView.getInt32(0, true)).assertEqual(123456);
    });

    /**
     * @tc.name   arraybuffer1Test037
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceSourceBuffer = new ArrayBuffer(8);
      const slicedFixedBuffer = sliceSourceBuffer.slice(2, 6);
      expect(slicedFixedBuffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer1Test038
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negativeSliceBuffer = new ArrayBuffer(8);
      const negativeSlicedBuffer = negativeSliceBuffer.slice(-3);
      expect(negativeSlicedBuffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer1Test039
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_3900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptySliceBuffer = new ArrayBuffer(8);
      const emptySlicedBuffer = emptySliceBuffer.slice(4, 2);
      expect(emptySlicedBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test040
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32TestBuffer = new ArrayBuffer(1048576);
      const float32View = new Float32Array(float32TestBuffer);
      expect(float32View.length).assertEqual(262144);
    });

    /**
     * @tc.name   arraybuffer1Test041
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16FullBuffer = new ArrayBuffer(65536);
      const uint16View = new Uint16Array(uint16FullBuffer);
      expect(uint16View.length).assertEqual(32768);
    });

    /**
     * @tc.name   arraybuffer1Test042
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixteenByteBuffer = new ArrayBuffer(16);
      expect(sixteenByteBuffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name   arraybuffer1Test043
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const multiByteUint8Buffer = new ArrayBuffer(4);
      const multiByteUint8View = new Uint8Array(multiByteUint8Buffer);
      multiByteUint8View[1] = 127;
      expect(multiByteUint8View[1]).assertEqual(127);
    });

    /**
     * @tc.name   arraybuffer1Test044
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int16Buffer = new ArrayBuffer(4);
      const int16View = new Int16Array(int16Buffer);
      int16View[0] = -32768;
      expect(int16View[0]).assertEqual(-32768);
    });

    /**
     * @tc.name   arraybuffer1Test045
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float32Buffer = new ArrayBuffer(4);
      const float32View = new Float32Array(float32Buffer);
      float32View[0] = 3.1414;
      expect(float32View[0]).assertEqual(3.141400098800659);
    });

    /**
     * @tc.name   arraybuffer1Test046
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewUint32Buffer = new ArrayBuffer(4);
      const dataViewUint32 = new DataView(dataViewUint32Buffer);
      dataViewUint32.setUint32(0, 0x12345678, false);
      expect(dataViewUint32.getUint32(0, false)).assertEqual(0x12345678);
    });

    /**
     * @tc.name   arraybuffer1Test047
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewInt8Buffer = new ArrayBuffer(4);
      const dataViewInt8 = new DataView(dataViewInt8Buffer);
      dataViewInt8.setInt8(2, -128);
      expect(dataViewInt8.getInt8(2)).assertEqual(-128);
    });

    /**
     * @tc.name   arraybuffer1Test048
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceFromStartBuffer = new ArrayBuffer(8);
      const sliceFromStart = sliceFromStartBuffer.slice(0, 4);
      expect(sliceFromStart.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer1Test049
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_4900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceToEndBuffer = new ArrayBuffer(8);
      const sliceToEnd = sliceToEndBuffer.slice(4);
      expect(sliceToEnd.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer1Test050
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceSingleByteBuffer = new ArrayBuffer(8);
      const sliceSingleByte = sliceSingleByteBuffer.slice(3, 4);
      expect(sliceSingleByte.byteLength).assertEqual(1);

    });
    /**
     * @tc.name   arraybuffer1Test051
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptySliceSource = new ArrayBuffer(0);
      const emptySliced = emptySliceSource.slice(0);
      expect(emptySliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test052
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoKBBuffer = new ArrayBuffer(1024 * 2);
      expect(twoKBBuffer.byteLength).assertEqual(2048);
    });

    /**
     * @tc.name   arraybuffer1Test053
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fullUint32Buffer = new ArrayBuffer(4);
      const fullUint32View = new Uint32Array(fullUint32Buffer);
      fullUint32View[0] = 4294967295;
      expect(fullUint32View[0]).assertEqual(4294967295);
    });

    /**
     * @tc.name   arraybuffer1Test054
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const partialInt32Buffer = new ArrayBuffer(8);
      const partialInt32View = new Int32Array(partialInt32Buffer);
      partialInt32View[1] = 2147483647;
      expect(partialInt32View[1]).assertEqual(2147483647);
    });

    /**
     * @tc.name   arraybuffer1Test055
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const independentSliceSource = new ArrayBuffer(4);
      const independentSlice = independentSliceSource.slice(0);
      const sourceView = new Uint8Array(independentSliceSource);
      sourceView[0] = 255;
      const sliceView = new Uint8Array(independentSlice);
      expect(sliceView[0]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test056
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const overLengthSliceSource = new ArrayBuffer(8);
      const overLengthSlice = overLengthSliceSource.slice(5, 10);
      expect(overLengthSlice.byteLength).assertEqual(3);
    });

    /**
     * @tc.name   arraybuffer1Test057
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const negativeComboSliceSource = new ArrayBuffer(8);
      const negativeComboSlice = negativeComboSliceSource.slice(-6, -2);
      expect(negativeComboSlice.byteLength).assertEqual(4);
    });

    /**
     * @tc.name   arraybuffer1Test058
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteUint8Buffer = new ArrayBuffer(1);
      const oneByteUint8View = new Uint8Array(oneByteUint8Buffer);
      oneByteUint8View[0] = 0;
      expect(oneByteUint8View[0]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test059
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_5900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new ArrayBuffer(-100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   arraybuffer1Test060
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const overSafeHundred = Number.MAX_SAFE_INTEGER + 100;
      try {
        new ArrayBuffer(overSafeHundred);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
        expect(error.message).assertContain("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    });

    /**
     * @tc.name   arraybuffer1Test061
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveTwelveByteBuffer = new ArrayBuffer(512);
      const fiveTwelveSlice = fiveTwelveByteBuffer.slice(128, 256);
      expect(fiveTwelveSlice.byteLength).assertEqual(128);
    });

    /**
     * @tc.name   arraybuffer1Test062
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyDataViewBuffer = new ArrayBuffer(4);
      const emptyDataView = new DataView(emptyDataViewBuffer);
      expect(emptyDataView.getInt16(0)).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test063
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint16TwoByteBuffer = new ArrayBuffer(2);
      const uint16TwoView = new Uint16Array(uint16TwoByteBuffer);
      uint16TwoView[0] = 0x1234;
      expect(uint16TwoView[0]).assertEqual(0x1234);
    });

    /**
     * @tc.name   arraybuffer1Test064
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int32MinBuffer = new ArrayBuffer(4);
      const int32MinView = new Int32Array(int32MinBuffer);
      int32MinView[0] = -2147483648;
      expect(int32MinView[0]).assertEqual(-2147483648);
    });

    /**
     * @tc.name   arraybuffer1Test065
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const float64PiBuffer = new ArrayBuffer(8);
      const float64PiView = new Float64Array(float64PiBuffer);
      float64PiView[0] = Math.PI;
      expect(float64PiView[0]).assertClose(Math.PI, 10);
    });

    /**
     * @tc.name   arraybuffer1Test066
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewUint16Buffer = new ArrayBuffer(6);
      const dataViewUint16 = new DataView(dataViewUint16Buffer);
      dataViewUint16.setUint16(4, 0xABCD);
      expect(dataViewUint16.getUint16(4)).assertEqual(0xABCD);
    });

    /**
     * @tc.name   arraybuffer1Test067
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewInt32LEBuffer = new ArrayBuffer(8);
      const dataViewInt32LE = new DataView(dataViewInt32LEBuffer);
      dataViewInt32LE.setInt32(2, 987654321, true);
      expect(dataViewInt32LE.getInt32(2, true)).assertEqual(987654321);
    });

    /**
     * @tc.name   arraybuffer1Test068
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceZeroRangeBuffer = new ArrayBuffer(8);
      const sliceZeroRange = sliceZeroRangeBuffer.slice(0, 0);
      expect(sliceZeroRange.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test069
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_6900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sliceEndEqualLengthBuffer = new ArrayBuffer(8);
      const sliceEndEqualLength = sliceEndEqualLengthBuffer.slice(8, 8);
      expect(sliceEndEqualLength.byteLength).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test070
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hundredByteBuffer = new ArrayBuffer(100);
      const hundredByteSlice = hundredByteBuffer.slice(20, 50);
      expect(hundredByteSlice.byteLength).assertEqual(30);
    });

    /**
     * @tc.name   arraybuffer1Test071
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8DefaultBuffer = new ArrayBuffer(3);
      const uint8DefaultView = new Uint8Array(uint8DefaultBuffer);
      uint8DefaultView[1] = 0xFF;
      expect(uint8DefaultView[0]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test072
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8Buffer = new ArrayBuffer(5);
      const int8View = new Int8Array(int8Buffer);
      int8View[2] = 0x7F;
      expect(int8View[3]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test073
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoFiftySixByteBuffer = new ArrayBuffer(256);
      const twoFiftySixSlice = twoFiftySixByteBuffer.slice(-128, -64);
      expect(twoFiftySixSlice.byteLength).assertEqual(64);
    });

    /**
     * @tc.name   arraybuffer1Test074
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewDefaultBuffer = new ArrayBuffer(4);
      const dataViewDefault = new DataView(dataViewDefaultBuffer);
      expect(dataViewDefault.getUint32(0)).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test075
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoUint32Buffer = new ArrayBuffer(8);
      const twoUint32View = new Uint32Array(twoUint32Buffer);
      twoUint32View[1] = 123456789;
      expect(twoUint32View[1]).assertEqual(123456789);
    });

    /**
     * @tc.name   arraybuffer1Test076
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const threeFloat32Buffer = new ArrayBuffer(12);
      const threeFloat32View = new Float32Array(threeFloat32Buffer);
      threeFloat32View[0] = 1.618;
      expect(threeFloat32View[0]).assertClose(1.618, 3);
    });

    /**
     * @tc.name   arraybuffer1Test077
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixtyFourByteSliceBuffer = new ArrayBuffer(64);
      const sixtyFourByteSlice = sixtyFourByteSliceBuffer.slice(16, 48);
      expect(sixtyFourByteSlice.byteLength).assertEqual(32);
    });

    /**
     * @tc.name   arraybuffer1Test078
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteZeroBuffer = new ArrayBuffer(1);
      const oneByteZeroView = new Uint8Array(oneByteZeroBuffer);
      oneByteZeroView[0] = 0x00;
      expect(oneByteZeroView[0]).assertEqual(0x00);
    });

    /**
     * @tc.name   arraybuffer1Test079
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_7900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewFloat64Buffer = new ArrayBuffer(10);
      const dataViewFloat64 = new DataView(dataViewFloat64Buffer);
      dataViewFloat64.setFloat64(2, 0.123456789, false);
      expect(dataViewFloat64.getFloat64(2, false)).assertClose(0.123456789, 9);
    });

    /**
     * @tc.name   arraybuffer1Test080
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint32FourByteBuffer = new ArrayBuffer(4);
      const uint32FourView = new Uint32Array(uint32FourByteBuffer);
      uint32FourView[0] = 0xFFFFFFFE;
      expect(uint32FourView[0]).assertEqual(0xFFFFFFFE);
    });
    /**
     * @tc.name   arraybuffer1Test081
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int64MaxBuffer = new ArrayBuffer(8);
      const int64MaxView = new BigInt64Array(int64MaxBuffer);
      int64MaxView[0] = 9223372036854775807n;
      expect(int64MaxView[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   arraybuffer1Test082
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8TwoByteViewBuffer = new ArrayBuffer(2);
      const uint8TwoByteView = new Uint8Array(uint8TwoByteViewBuffer);
      uint8TwoByteView[0] = 0x11;
      uint8TwoByteView[1] = 0x22;
      expect(uint8TwoByteView[1]).assertEqual(0x22);
    });

    /**
     * @tc.name   arraybuffer1Test083
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewInt16Buffer = new ArrayBuffer(8);
      const dataViewInt16 = new DataView(dataViewInt16Buffer);
      dataViewInt16.setInt16(3, -456);
      expect(dataViewInt16.getInt16(3)).assertEqual(-456);
    });

    /**
     * @tc.name   arraybuffer1Test084
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewFloat32LEBuffer = new ArrayBuffer(6);
      const dataViewFloat32LE = new DataView(dataViewFloat32LEBuffer);
      dataViewFloat32LE.setFloat32(1, 2.718, true);
      expect(dataViewFloat32LE.getFloat32(1, true)).assertClose(2.718, 3);
    });

    /**
     * @tc.name   arraybuffer1Test085
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sixteenByteSliceBuffer = new ArrayBuffer(16);
      const sixteenByteSlice = sixteenByteSliceBuffer.slice(4, 12);
      expect(sixteenByteSlice.byteLength).assertEqual(8);
    });

    /**
     * @tc.name   arraybuffer1Test086
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const thirtyTwoByteSliceEndBuffer = new ArrayBuffer(32);
      const thirtyTwoByteSliceEnd = thirtyTwoByteSliceEndBuffer.slice(10);
      expect(thirtyTwoByteSliceEnd.byteLength).assertEqual(22);
    });

    /**
     * @tc.name   arraybuffer1Test087
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const uint8FiveByteDefaultBuffer = new ArrayBuffer(5);
      const uint8FiveByteDefaultView = new Uint8Array(uint8FiveByteDefaultBuffer);
      uint8FiveByteDefaultView[2] = 0x0A;
      expect(uint8FiveByteDefaultView[4]).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test088
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoInt16Buffer = new ArrayBuffer(4);
      const twoInt16View = new Int16Array(twoInt16Buffer);
      twoInt16View[0] = 32767;
      expect(twoInt16View[0]).assertEqual(32767);
    });

    /**
     * @tc.name   arraybuffer1Test089
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_8900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoFloat64Buffer = new ArrayBuffer(16);
      const twoFloat64View = new Float64Array(twoFloat64Buffer);
      twoFloat64View[1] = 0.000123;
      expect(twoFloat64View[1]).assertClose(0.000123, 6);
    });

    /**
     * @tc.name   arraybuffer1Test090
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fiveTwelveByteLengthBuffer = new ArrayBuffer(512);
      expect(fiveTwelveByteLengthBuffer.byteLength).assertEqual(512);
    });

    /**
     * @tc.name   arraybuffer1Test091
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9100
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneKBUint8Buffer = new ArrayBuffer(1024);
      const oneKBUint8View = new Uint8Array(oneKBUint8Buffer);
      expect(oneKBUint8View.length).assertEqual(1024);
    });

    /**
     * @tc.name   arraybuffer1Test092
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9200
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoKBInt32Buffer = new ArrayBuffer(2048);
      const twoKBInt32View = new Int32Array(twoKBInt32Buffer);
      expect(twoKBInt32View.length).assertEqual(512);
    });

    /**
     * @tc.name   arraybuffer1Test093
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9300
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dataViewUint8DefaultBuffer = new ArrayBuffer(10);
      const dataViewUint8Default = new DataView(dataViewUint8DefaultBuffer);
      expect(dataViewUint8Default.getUint8(5)).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test094
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9400
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const threeUint32Buffer = new ArrayBuffer(12);
      const threeUint32View = new Uint32Array(threeUint32Buffer);
      threeUint32View[0] = 100;
      threeUint32View[1] = 200;
      threeUint32View[2] = 300;
      expect(threeUint32View[2]).assertEqual(300);
    });

    /**
     * @tc.name   arraybuffer1Test095
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9500
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fourFloat32Buffer = new ArrayBuffer(16);
      const fourFloat32View = new Float32Array(fourFloat32Buffer);
      fourFloat32View[1] = 0.618;
      expect(fourFloat32View[1]).assertClose(0.618, 3);
    });

    /**
     * @tc.name   arraybuffer1Test096
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9600
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const thirtyByteSliceBuffer = new ArrayBuffer(30);
      const thirtyByteSlice = thirtyByteSliceBuffer.slice(10, 25);
      expect(thirtyByteSlice.byteLength).assertEqual(15);
    });

    /**
     * @tc.name   arraybuffer1Test097
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9700
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyUint8Buffer = new ArrayBuffer(0);
      const emptyUint8View = new Uint8Array(emptyUint8Buffer);
      expect(emptyUint8View.length).assertEqual(0);
    });

    /**
     * @tc.name   arraybuffer1Test098
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9800
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oneByteInt8Buffer = new ArrayBuffer(1);
      const oneByteInt8View = new Int8Array(oneByteInt8Buffer);
      oneByteInt8View[0] = -1;
      expect(oneByteInt8View[0]).assertEqual(-1);
    });

    /**
     * @tc.name   arraybuffer1Test099
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_9900
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const twoUint16Buffer = new ArrayBuffer(4);
      const twoUint16View = new Uint16Array(twoUint16Buffer);
      twoUint16View[0] = 0xABCD;
      twoUint16View[1] = 0xEF12;
      expect(twoUint16View[0]).assertEqual(0xABCD);
    });

    /**
     * @tc.name   arraybuffer1Test100
     * @tc.number SUB_BUILTINS_arraybuffer1_TEST_10000
     * @tc.desc   test arraybuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arraybuffer1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigUint64Buffer = new ArrayBuffer(8);
      const bigUint64View = new BigUint64Array(bigUint64Buffer);
      bigUint64View[0] = 123456789012345n;
      expect(bigUint64View[0]).assertEqual(123456789012345n);
    });

  })
}

