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

export default function BuiltinsDataViewSetInt32Test() {
  describe("BuiltinsDataViewSetInt32Test", () => {
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
     * @tc.name    builtinsDataViewSetInt32Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0100
     * @tc.desc    Verify setInt32 with positive byteOffset and valid value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetInt32Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678);
      dataView.setInt32(4, 0x87654321);
      expect(dataView.getInt32(0)).assertEqual(0x12345678);
      expect(dataView.getInt32(4)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0200
     * @tc.desc    Verify setInt32 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(-1, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0300
     * @tc.desc    Verify setInt32 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(5, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(8, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0400
     * @tc.desc    Verify setInt32 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt32Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setInt32(intMin, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0500
     * @tc.desc    Verify setInt32 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt32Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setInt32(intMax, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0600
     * @tc.desc    Verify setInt32 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer, 1, 8);
      dataView.setInt32(0, 0x11223344);
      dataView.setInt32(4, 0x55667788);
      const fullView = new DataView(buffer);
      expect(fullView.getInt32(1)).assertEqual(0x11223344);
      expect(fullView.getInt32(5)).assertEqual(0x55667788);
      let threwError = false;
      try {
        dataView.setInt32(5, 0x99AABBCC);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0700
     * @tc.desc    Verify setInt32 with int32 boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0);
      dataView.setInt32(4, 2147483647);
      dataView.setInt32(8, -2147483648);
      dataView.setInt32(12, 1);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(2147483647);
      expect(dataView.getInt32(8)).assertEqual(-2147483648);
      expect(dataView.getInt32(12)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0800
     * @tc.desc    Verify setInt32 with values outside int32 range (wrapping behavior)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 2147483648);
      dataView.setInt32(4, -2147483649);
      dataView.setInt32(8, 4294967295);
      dataView.setInt32(12, -4294967296);
      expect(dataView.getInt32(0)).assertEqual(-2147483648);
      expect(dataView.getInt32(4)).assertEqual(2147483647);
      expect(dataView.getInt32(8)).assertEqual(-1);
      expect(dataView.getInt32(12)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_0900
     * @tc.desc    Verify setInt32 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetInt32Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(0, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1000
     * @tc.desc    Verify setInt32 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678);
      expect(dataView.getInt32(0)).assertEqual(0x12345678);
      let threwError = false;
      try {
        dataView.setInt32(1, 0x87654321);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1100
     * @tc.desc    Verify setInt32 with int boundary values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      dataView.setInt32(0, intMin);
      dataView.setInt32(4, intMax);
      dataView.setInt32(8, intMin + 1);
      dataView.setInt32(12, intMax - 1);
      expect(dataView.getInt32(0)).assertEqual(intMin);
      expect(dataView.getInt32(4)).assertEqual(intMax);
      expect(dataView.getInt32(8)).assertEqual(intMin + 1);
      expect(dataView.getInt32(12)).assertEqual(intMax - 1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1200
     * @tc.desc    Verify setInt32 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678, false);
      dataView.setInt32(4, 0x87654321, false);
      expect(dataView.getInt32(0, false)).assertEqual(0x12345678);
      expect(dataView.getInt32(4, false)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1300
     * @tc.desc    Verify setInt32 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678, true);
      dataView.setInt32(4, 0x87654321, true);
      expect(dataView.getInt32(0, true)).assertEqual(0x12345678);
      expect(dataView.getInt32(4, true)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1400
     * @tc.desc    Verify setInt32 with littleEndian parameter and negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(-1, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(-1, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1500
     * @tc.desc    Verify setInt32 with littleEndian parameter and out of bounds byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(5, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(5, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1600
     * @tc.desc    Verify setInt32 with littleEndian parameter and int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt32Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setInt32(intMin, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(intMax, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(intMin, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(intMax, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1700
     * @tc.desc    Verify setInt32 with littleEndian parameter and values outside int32 range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 2147483648, true);
      dataView.setInt32(4, -2147483649, true);
      dataView.setInt32(8, 4294967295, false);
      dataView.setInt32(12, -4294967296, false);
      expect(dataView.getInt32(0, true)).assertEqual(-2147483648);
      expect(dataView.getInt32(4, true)).assertEqual(2147483647);
      expect(dataView.getInt32(8, false)).assertEqual(-1);
      expect(dataView.getInt32(12, false)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1800
     * @tc.desc    Verify setInt32 with littleEndian parameter and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetInt32Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt32(0, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(0, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_1900
     * @tc.desc    Verify setInt32 with littleEndian parameter and byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678, true);
      expect(dataView.getInt32(0, true)).assertEqual(0x12345678);
      dataView.setInt32(0, 0x87654321, false);
      expect(dataView.getInt32(0, false)).assertEqual(-2023406815);
      let threwError = false;
      try {
        dataView.setInt32(1, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setInt32(1, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2000
     * @tc.desc    Verify setInt32 with Math.floor values and small range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, Math.floor(1.5));
      dataView.setInt32(4, Math.floor(2.9));
      dataView.setInt32(8, Math.floor(-1.5));
      dataView.setInt32(12, -128);
      dataView.setInt32(16, 0);
      dataView.setInt32(20, 127);
      dataView.setInt32(24, 128);
      dataView.setInt32(28, -129);
      expect(dataView.getInt32(0)).assertEqual(1);
      expect(dataView.getInt32(4)).assertEqual(2);
      expect(dataView.getInt32(8)).assertEqual(-2);
      expect(dataView.getInt32(12)).assertEqual(-128);
      expect(dataView.getInt32(16)).assertEqual(0);
      expect(dataView.getInt32(20)).assertEqual(127);
      expect(dataView.getInt32(24)).assertEqual(128);
      expect(dataView.getInt32(28)).assertEqual(-129);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2100
     * @tc.desc    Verify setInt32 with int16 range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, -32768);
      dataView.setInt32(4, 32767);
      dataView.setInt32(8, -32769);
      dataView.setInt32(12, 32768);
      dataView.setInt32(16, 0);
      dataView.setInt32(20, -1);
      expect(dataView.getInt32(0)).assertEqual(-32768);
      expect(dataView.getInt32(4)).assertEqual(32767);
      expect(dataView.getInt32(8)).assertEqual(-32769);
      expect(dataView.getInt32(12)).assertEqual(32768);
      expect(dataView.getInt32(16)).assertEqual(0);
      expect(dataView.getInt32(20)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2200
     * @tc.desc    Verify setInt32 with float and double range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt32Test2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      const floatMin = 1.40129846432481707e-45;
      const floatMax = 3.40282346638528860e+38;
      const doubleMin = 4.94065645841246544e-324;
      const doubleMax = 1.79769313486231570e+308;
      dataView.setInt32(0, floatMin);
      dataView.setInt32(4, floatMax);
      dataView.setInt32(8, -floatMin);
      dataView.setInt32(12, -floatMax);
      dataView.setInt32(16, doubleMin);
      dataView.setInt32(20, doubleMax);
      dataView.setInt32(24, -doubleMin);
      dataView.setInt32(28, -doubleMax);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(0);
      expect(dataView.getInt32(8)).assertEqual(0);
      expect(dataView.getInt32(12)).assertEqual(0);
      expect(dataView.getInt32(16)).assertEqual(0);
      expect(dataView.getInt32(20)).assertEqual(0);
      expect(dataView.getInt32(24)).assertEqual(0);
      expect(dataView.getInt32(28)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2300
     * @tc.desc    Verify setInt32 with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt32Test2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setInt32(0, longMin);
      dataView.setInt32(4, longMax);
      dataView.setInt32(8, longMin + 1);
      dataView.setInt32(12, longMax - 1);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(0);
      expect(dataView.getInt32(8)).assertEqual(0);
      expect(dataView.getInt32(12)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2400
     * @tc.desc    Verify setInt32 with special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, Infinity);
      dataView.setInt32(4, -Infinity);
      dataView.setInt32(8, NaN);
      dataView.setInt32(12, 0);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(0);
      expect(dataView.getInt32(8)).assertEqual(0);
      expect(dataView.getInt32(12)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2500
     * @tc.desc    Verify setInt32 with edge case floating-point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0.0);
      dataView.setInt32(4, -0.0);
      dataView.setInt32(8, 1.0);
      dataView.setInt32(12, -1.0);
      dataView.setInt32(16, 0.999999);
      dataView.setInt32(20, 1.000001);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(0);
      expect(dataView.getInt32(8)).assertEqual(1);
      expect(dataView.getInt32(12)).assertEqual(-1);
      expect(dataView.getInt32(16)).assertEqual(0);
      expect(dataView.getInt32(20)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt32Test2600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_ThirtyTwo_TEST_2600
     * @tc.desc    Verify setInt32 with littleEndian parameter and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt32Test2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, Infinity, false);
      dataView.setInt32(4, -Infinity, true);
      dataView.setInt32(8, NaN, false);
      dataView.setInt32(12, 0, true);
      expect(dataView.getInt32(0, false)).assertEqual(0);
      expect(dataView.getInt32(4, true)).assertEqual(0);
      expect(dataView.getInt32(8, false)).assertEqual(0);
      expect(dataView.getInt32(12, true)).assertEqual(0);
    });
  })
}