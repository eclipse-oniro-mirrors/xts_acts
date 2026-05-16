/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsDataViewSetInt16Test() {
  describe("BuiltinsDataViewSetInt16Test", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsDataViewSetInt16Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0100
     * @tc.desc    Verify setInt16 works correctly with positive byteOffset and value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetInt16Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0x1234);
      dataView.setInt16(2, 0x5678);
      expect(dataView.getInt16(0)).assertEqual(0x1234);
      expect(dataView.getInt16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0200
     * @tc.desc    Verify setInt16 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt16(-1, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0300
     * @tc.desc    Verify setInt16 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt16(3, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt16(4, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0400
     * @tc.desc    Verify setInt16 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt16Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setInt16(intMin, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0500
     * @tc.desc    Verify setInt16 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt16Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setInt16(intMax, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0600
     * @tc.desc    Verify setInt16 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 1, 4);
      dataView.setInt16(0, 0x1122);
      dataView.setInt16(2, 0x3344);
      const fullView = new DataView(buffer);
      expect(fullView.getInt8(0)).assertEqual(0);
      expect(fullView.getInt16(1)).assertEqual(0x1122);
      expect(fullView.getInt16(3)).assertEqual(0x3344);
      expect(fullView.getInt8(5)).assertEqual(0);
      let threwError = false;
      try {
        dataView.setInt16(3, 0x5566);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0700
     * @tc.desc    Verify setInt16 works with negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, -1);
      dataView.setInt16(2, -32768);
      expect(dataView.getInt16(0)).assertEqual(-1);
      expect(dataView.getInt16(2)).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0800
     * @tc.desc    Verify setInt16 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetInt16Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt16(0, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_0900
     * @tc.desc    Verify setInt16 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0x1234);
      expect(dataView.getInt16(0)).assertEqual(0x1234);
      let threwError = false;
      try {
        dataView.setInt16(1, 0x5678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1000
     * @tc.desc    Verify setInt16 with int min and max values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, -2147483648);
      dataView.setInt16(2, 2147483647);
      expect(dataView.getInt16(0)).assertEqual(0);
      expect(dataView.getInt16(2)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1100
     * @tc.desc    Verify setInt16 with various value ranges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, -32768);
      expect(dataView.getInt16(0)).assertEqual(-32768);
      dataView.setInt16(2, 32767);
      expect(dataView.getInt16(2)).assertEqual(32767);
      dataView.setInt16(4, 0);
      expect(dataView.getInt16(4)).assertEqual(0);
      dataView.setInt16(6, 123);
      expect(dataView.getInt16(6)).assertEqual(123);
      dataView.setInt16(8, -123);
      expect(dataView.getInt16(8)).assertEqual(-123);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1200
     * @tc.desc    Verify setInt16 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0x1234, false);
      expect(dataView.getUint8(0)).assertEqual(0x12);
      expect(dataView.getUint8(1)).assertEqual(0x34);
      expect(dataView.getInt16(0, false)).assertEqual(0x1234);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1300
     * @tc.desc    Verify setInt16 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0x1234, true);
      expect(dataView.getUint8(0)).assertEqual(0x34);
      expect(dataView.getUint8(1)).assertEqual(0x12);
      expect(dataView.getInt16(0, true)).assertEqual(0x1234);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1400
     * @tc.desc    Verify setInt16 with littleEndian and negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, -1, false);
      expect(dataView.getInt16(0, false)).assertEqual(-1);
      dataView.setInt16(2, -1, true);
      expect(dataView.getInt16(2, true)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1500
     * @tc.desc    Verify setInt16 with littleEndian and various values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0xABCD, false);
      dataView.setInt16(2, -12345, false);
      dataView.setInt16(4, 0xABCD, true);
      dataView.setInt16(6, -12345, true);
      expect(dataView.getInt16(0, false)).assertEqual(-21555);
      expect(dataView.getInt16(2, false)).assertEqual(-12345);
      expect(dataView.getInt16(4, true)).assertEqual(-21555);
      expect(dataView.getInt16(6, true)).assertEqual(-12345);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1600
     * @tc.desc    Verify setInt16 with out of bounds byteOffset and littleEndian
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt16(1, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt16(1, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1700
     * @tc.desc    Verify setInt16 with different byteOffsets and littleEndian
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, 0x1111, false);
      dataView.setInt16(2, 0x2222, false);
      dataView.setInt16(4, 0x3333, false);
      dataView.setInt16(6, 0x4444, true);
      expect(dataView.getInt16(0, false)).assertEqual(0x1111);
      expect(dataView.getInt16(2, false)).assertEqual(0x2222);
      expect(dataView.getInt16(4, false)).assertEqual(0x3333);
      expect(dataView.getInt16(6, true)).assertEqual(0x4444);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1800
     * @tc.desc    Verify setInt16 with int boundary values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      dataView.setInt16(0, intMin);
      dataView.setInt16(2, intMax);
      dataView.setInt16(4, intMin + 1);
      dataView.setInt16(6, intMax - 1);
      expect(dataView.getInt16(0)).assertEqual(0);
      expect(dataView.getInt16(2)).assertEqual(-1);
      expect(dataView.getInt16(4)).assertEqual(1);
      expect(dataView.getInt16(6)).assertEqual(-2);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_1900
     * @tc.desc    Verify setInt16 with special values and precision testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, Infinity, false);
      dataView.setInt16(2, -Infinity, false);
      dataView.setInt16(4, Infinity, true);
      dataView.setInt16(6, -Infinity, true);
      dataView.setInt16(8, Math.floor(1.5), false);
      dataView.setInt16(10, Math.floor(1.5), true);
      dataView.setInt16(12, 1.999999, false);
      dataView.setInt16(14, 2, true);
      for (let i = 0; i < 16; i += 2) {
        const result = dataView.getInt16(i);
        expect(typeof result).assertEqual('int');
      }
      expect(dataView.getInt16(8, false)).assertEqual(1);
      expect(dataView.getInt16(10, true)).assertEqual(1);
      expect(dataView.getInt16(12, false)).assertEqual(1);
      expect(dataView.getInt16(14, true)).assertEqual(2);
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_2000
     * @tc.desc    Verify setInt16 with boundary values and overflow handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt16Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(20);
      const dataView = new DataView(buffer);
      dataView.setInt16(0, -32768, false);
      dataView.setInt16(2, 32767, false);
      dataView.setInt16(4, -32769, false);
      dataView.setInt16(6, 32768, false);
      dataView.setInt16(8, -32768, true);
      dataView.setInt16(10, 32767, true);
      dataView.setInt16(12, -32769, true);
      dataView.setInt16(14, 32768, true);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setInt16(16, longMin, false);
      dataView.setInt16(18, longMax, true);
      expect(dataView.getInt16(0, false)).assertEqual(-32768);
      expect(dataView.getInt16(2, false)).assertEqual(32767);
      expect(dataView.getInt16(8, true)).assertEqual(-32768);
      expect(dataView.getInt16(10, true)).assertEqual(32767);
      expect(dataView.getInt16(4, false)).assertEqual(32767);
      expect(dataView.getInt16(6, false)).assertEqual(-32768);
      expect(dataView.getInt16(12, true)).assertEqual(32767);
      expect(dataView.getInt16(14, true)).assertEqual(-32768);
      for (let i = 0; i < 20; i += 2) {
        const result = dataView.getInt16(i);
        expect(typeof result).assertEqual('int');
      }
    });

    /**
     * @tc.name    builtinsDataViewSetInt16Test2100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Sixteen_TEST_2100
     * @tc.desc    Verify setInt16 with Long.MAX_VALUE and Long.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt16Test2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setInt16(0, longMin, false);
      dataView.setInt16(2, longMax, false);
      dataView.setInt16(4, longMin, true);
      dataView.setInt16(6, longMax, true);
      expect(dataView.getInt16(0)).assertEqual(0);
      expect(dataView.getInt16(2)).assertEqual(0);
      expect(dataView.getInt16(4)).assertEqual(0);
      expect(dataView.getInt16(6)).assertEqual(0);
    });
  })
}