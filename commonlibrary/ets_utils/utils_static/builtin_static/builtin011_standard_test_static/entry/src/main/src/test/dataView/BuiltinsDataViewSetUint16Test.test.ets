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

export default function BuiltinsDataViewSetUint16Test() {
  describe("BuiltinsDataViewSetUint16Test", () => {
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
     * @tc.name    builtinsDataViewSetUint16Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0100
     * @tc.desc    Verify setUint16 with positive byteOffset and valid value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetUint16Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0x1234);
      dataView.setUint16(2, 0x5678);
      expect(dataView.getUint16(0)).assertEqual(0x1234);
      expect(dataView.getUint16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0200
     * @tc.desc    Verify setUint16 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(-1, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0300
     * @tc.desc    Verify setUint16 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(3, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(4, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0400
     * @tc.desc    Verify setUint16 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint16Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setUint16(intMin, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0500
     * @tc.desc    Verify setUint16 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint16Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setUint16(intMax, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0600
     * @tc.desc    Verify setUint16 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 1, 4);
      dataView.setUint16(0, 0x1122);
      dataView.setUint16(2, 0x3344);
      const fullView = new DataView(buffer);
      expect(fullView.getUint16(1)).assertEqual(0x1122);
      expect(fullView.getUint16(3)).assertEqual(0x3344);
      let threwError = false;
      try {
        dataView.setUint16(3, 0x5566);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0700
     * @tc.desc    Verify setUint16 with uint16 boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0);
      dataView.setUint16(2, 65535);
      dataView.setUint16(4, 32767);
      dataView.setUint16(6, 32768);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(65535);
      expect(dataView.getUint16(4)).assertEqual(32767);
      expect(dataView.getUint16(6)).assertEqual(32768);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0800
     * @tc.desc    Verify setUint16 with values outside uint16 range (wrapping behavior)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 65536);
      dataView.setUint16(2, -1);
      dataView.setUint16(4, 65537);
      dataView.setUint16(6, -2);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(65535);
      expect(dataView.getUint16(4)).assertEqual(1);
      expect(dataView.getUint16(6)).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_0900
     * @tc.desc    Verify setUint16 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetUint16Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(0, 0x1234);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1000
     * @tc.desc    Verify setUint16 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0x1234);
      expect(dataView.getUint16(0)).assertEqual(0x1234);
      let threwError = false;
      try {
        dataView.setUint16(1, 0x5678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1100
     * @tc.desc    Verify setUint16 with int boundary values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      dataView.setUint16(0, intMin);
      dataView.setUint16(2, intMax);
      dataView.setUint16(4, intMin + 1);
      dataView.setUint16(6, intMax - 1);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(65535);
      expect(dataView.getUint16(4)).assertEqual(1);
      expect(dataView.getUint16(6)).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1200
     * @tc.desc    Verify setUint16 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0x1234, false);
      dataView.setUint16(2, 0x5678, false);
      expect(dataView.getUint16(0, false)).assertEqual(0x1234);
      expect(dataView.getUint16(2, false)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1300
     * @tc.desc    Verify setUint16 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0x1234, true);
      dataView.setUint16(2, 0x5678, true);
      expect(dataView.getUint16(0, true)).assertEqual(0x1234);
      expect(dataView.getUint16(2, true)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1400
     * @tc.desc    Verify setUint16 with littleEndian parameter and negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(-1, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(-1, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1500
     * @tc.desc    Verify setUint16 with littleEndian parameter and out of bounds byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(3, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(3, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1600
     * @tc.desc    Verify setUint16 with littleEndian parameter and int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint16Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setUint16(intMin, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(intMax, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(intMin, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(intMax, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1700
     * @tc.desc    Verify setUint16 with littleEndian parameter and values outside uint16 range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 65536, true);
      dataView.setUint16(2, -1, true);
      dataView.setUint16(4, 65537, false);
      dataView.setUint16(6, -2, false);
      expect(dataView.getUint16(0, true)).assertEqual(0);
      expect(dataView.getUint16(2, true)).assertEqual(65535);
      expect(dataView.getUint16(4, false)).assertEqual(1);
      expect(dataView.getUint16(6, false)).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1800
     * @tc.desc    Verify setUint16 with littleEndian parameter and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetUint16Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint16(0, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(0, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_1900
     * @tc.desc    Verify setUint16 with littleEndian parameter and byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0x1234, true);
      expect(dataView.getUint16(0, true)).assertEqual(0x1234);
      dataView.setUint16(0, 0x5678, false);
      expect(dataView.getUint16(0, false)).assertEqual(0x5678);
      let threwError = false;
      try {
        dataView.setUint16(1, 0x1234, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint16(1, 0x1234, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2000
     * @tc.desc    Verify setUint16 with littleEndian parameter and int boundary values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      dataView.setUint16(0, intMin, true);
      dataView.setUint16(2, intMax, true);
      dataView.setUint16(4, intMin, false);
      dataView.setUint16(6, intMax, false);
      dataView.setUint16(8, intMin + 1, true);
      dataView.setUint16(10, intMax - 1, true);
      dataView.setUint16(12, intMin + 1, false);
      dataView.setUint16(14, intMax - 1, false);
      expect(dataView.getUint16(0, true)).assertEqual(0);
      expect(dataView.getUint16(2, true)).assertEqual(65535);
      expect(dataView.getUint16(4, false)).assertEqual(0);
      expect(dataView.getUint16(6, false)).assertEqual(65535);
      expect(dataView.getUint16(8, true)).assertEqual(1);
      expect(dataView.getUint16(10, true)).assertEqual(65534);
      expect(dataView.getUint16(12, false)).assertEqual(1);
      expect(dataView.getUint16(14, false)).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2100
     * @tc.desc    Verify setUint16 with floating-point values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 1.1);
      dataView.setUint16(2, 1.999999);
      dataView.setUint16(4, 2.000001);
      dataView.setUint16(6, -1.1);
      dataView.setUint16(8, -1.999999);
      dataView.setUint16(10, 65535.999);
      expect(dataView.getUint16(0)).assertEqual(1);
      expect(dataView.getUint16(2)).assertEqual(1);
      expect(dataView.getUint16(4)).assertEqual(2);
      expect(dataView.getUint16(6)).assertEqual(65535);
      expect(dataView.getUint16(8)).assertEqual(65535);
      expect(dataView.getUint16(10)).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2200
     * @tc.desc    Verify setUint16 with special values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, Infinity);
      dataView.setUint16(2, -Infinity);
      dataView.setUint16(4, NaN);
      dataView.setUint16(6, 0);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(0);
      expect(dataView.getUint16(4)).assertEqual(0);
      expect(dataView.getUint16(6)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2300
     * @tc.desc    Verify setUint16 with littleEndian parameter and floating-point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 123.456, false);
      dataView.setUint16(2, 789.999, true);
      dataView.setUint16(4, -456.789, false);
      dataView.setUint16(6, -987.123, true);
      expect(dataView.getUint16(0, false)).assertEqual(123);
      expect(dataView.getUint16(2, true)).assertEqual(789);
      expect(dataView.getUint16(4, false)).assertEqual(65080);
      expect(dataView.getUint16(6, true)).assertEqual(64549);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2400
     * @tc.desc    Verify setUint16 with littleEndian parameter and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, Infinity, false);
      dataView.setUint16(2, -Infinity, true);
      dataView.setUint16(4, NaN, false);
      dataView.setUint16(6, 0, true);
      expect(dataView.getUint16(0, false)).assertEqual(0);
      expect(dataView.getUint16(2, true)).assertEqual(0);
      expect(dataView.getUint16(4, false)).assertEqual(0);
      expect(dataView.getUint16(6, true)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2500
     * @tc.desc    Verify setUint16 with edge case values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0);
      dataView.setUint16(2, 65535);
      dataView.setUint16(4, 32767);
      dataView.setUint16(6, 32768);
      dataView.setUint16(8, 1);
      dataView.setUint16(10, 65534);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(65535);
      expect(dataView.getUint16(4)).assertEqual(32767);
      expect(dataView.getUint16(6)).assertEqual(32768);
      expect(dataView.getUint16(8)).assertEqual(1);
      expect(dataView.getUint16(10)).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2600
     * @tc.desc    Verify setUint16 with Math.floor values and small range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, Math.floor(1.5));
      dataView.setUint16(2, Math.floor(2.9));
      dataView.setUint16(4, Math.floor(-1.5));
      dataView.setUint16(6, -128);
      dataView.setUint16(8, 0);
      dataView.setUint16(10, 127);
      dataView.setUint16(12, 128);
      dataView.setUint16(14, -129);
      expect(dataView.getUint16(0)).assertEqual(1);
      expect(dataView.getUint16(2)).assertEqual(2);
      expect(dataView.getUint16(4)).assertEqual(65534);
      expect(dataView.getUint16(6)).assertEqual(65408);
      expect(dataView.getUint16(8)).assertEqual(0);
      expect(dataView.getUint16(10)).assertEqual(127);
      expect(dataView.getUint16(12)).assertEqual(128);
      expect(dataView.getUint16(14)).assertEqual(65407);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2700
     * @tc.desc    Verify setUint16 with int16 range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, -32768);
      dataView.setUint16(2, -1);
      dataView.setUint16(4, 0);
      dataView.setUint16(6, 32767);
      dataView.setUint16(8, 32768);
      dataView.setUint16(10, -32769);
      expect(dataView.getUint16(0)).assertEqual(32768);
      expect(dataView.getUint16(2)).assertEqual(65535);
      expect(dataView.getUint16(4)).assertEqual(0);
      expect(dataView.getUint16(6)).assertEqual(32767);
      expect(dataView.getUint16(8)).assertEqual(32768);
      expect(dataView.getUint16(10)).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2800
     * @tc.desc    Verify setUint16 with float and double range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint16Test2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const floatMin = 1.40129846432481707e-45;
      const floatMax = 3.40282346638528860e+38;
      const doubleMin = 4.94065645841246544e-324;
      const doubleMax = 1.79769313486231570e+308;
      dataView.setUint16(0, floatMin);
      dataView.setUint16(2, floatMax);
      dataView.setUint16(4, -floatMin);
      dataView.setUint16(6, -floatMax);
      dataView.setUint16(8, doubleMin);
      dataView.setUint16(10, doubleMax);
      dataView.setUint16(12, -doubleMin);
      dataView.setUint16(14, -doubleMax);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(0);
      expect(dataView.getUint16(4)).assertEqual(0);
      expect(dataView.getUint16(6)).assertEqual(0);
      expect(dataView.getUint16(8)).assertEqual(0);
      expect(dataView.getUint16(10)).assertEqual(0);
      expect(dataView.getUint16(12)).assertEqual(0);
      expect(dataView.getUint16(14)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test2900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_2900
     * @tc.desc    Verify setUint16 with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint16Test2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setUint16(0, longMin);
      dataView.setUint16(2, longMax);
      dataView.setUint16(4, longMin + 1);
      dataView.setUint16(6, longMax - 1);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(0);
      expect(dataView.getUint16(4)).assertEqual(0);
      expect(dataView.getUint16(6)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint16Test3000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Sixteen_TEST_3000
     * @tc.desc    Verify setUint16 with edge case floating-point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint16Test3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);
      dataView.setUint16(0, 0.0);
      dataView.setUint16(2, -0.0);
      dataView.setUint16(4, 1.0);
      dataView.setUint16(6, -1.0);
      dataView.setUint16(8, 0.999999);
      dataView.setUint16(10, 1.000001);
      expect(dataView.getUint16(0)).assertEqual(0);
      expect(dataView.getUint16(2)).assertEqual(0);
      expect(dataView.getUint16(4)).assertEqual(1);
      expect(dataView.getUint16(6)).assertEqual(65535);
      expect(dataView.getUint16(8)).assertEqual(0);
      expect(dataView.getUint16(10)).assertEqual(1);
    });
  })
}