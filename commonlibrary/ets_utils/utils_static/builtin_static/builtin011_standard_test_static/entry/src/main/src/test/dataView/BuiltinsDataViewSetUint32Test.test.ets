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

export default function BuiltinsDataViewSetUint32Test() {
  describe("BuiltinsDataViewSetUint32Test", () => {
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
     * @tc.name    builtinsDataViewSetUint32Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_TW_TEST_0100
     * @tc.desc    Verify setUint32 works with positive byteOffset and valid values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetUint32Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0x12345678);
      dataView.setUint32(4, 0x87654321);
      expect(dataView.getUint32(0)).assertEqual(0x12345678);
      expect(dataView.getUint32(4)).assertEqual(0x87654321);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0200
     * @tc.desc    Verify setUint32 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(-1, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0300
     * @tc.desc    Verify setUint32 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(5, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(8, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0400
     * @tc.desc    Verify setUint32 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setUint32(intMin, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0500
     * @tc.desc    Verify setUint32 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setUint32(intMax, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0600
     * @tc.desc    Verify setUint32 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer, 1, 8);
      dataView.setUint32(0, 0x11223344);
      dataView.setUint32(4, 0x55667788);
      const fullView = new DataView(buffer);
      expect(fullView.getUint32(1)).assertEqual(0x11223344);
      expect(fullView.getUint32(5)).assertEqual(0x55667788);
      let threwError = false;
      try {
        dataView.setUint32(5, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0700
     * @tc.desc    Verify setUint32 with uint32 boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0);
      dataView.setUint32(4, 4294967295);
      dataView.setUint32(8, 1);
      dataView.setUint32(12, 2147483647);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(4294967295);
      expect(dataView.getUint32(8)).assertEqual(1);
      expect(dataView.getUint32(12)).assertEqual(2147483647);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0800
     * @tc.desc    Verify setUint32 with negative values (should wrap)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, -1);
      dataView.setUint32(4, -2);
      dataView.setUint32(8, -2147483648);
      expect(dataView.getUint32(0)).assertEqual(4294967295);
      expect(dataView.getUint32(4)).assertEqual(4294967294);
      expect(dataView.getUint32(8)).assertEqual(2147483648);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_0900
     * @tc.desc    Verify setUint32 with long boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808n;
      const longMax = 9223372036854775807n;
      dataView.setUint32(0, Number(longMin));
      dataView.setUint32(4, Number(longMax));
      dataView.setUint32(8, 0);
      dataView.setUint32(12, 4294967295);
      dataView.setUint32(16, 2147483647);
      dataView.setUint32(20, 2147483648);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(0);
      expect(dataView.getUint32(8)).assertEqual(0);
      expect(dataView.getUint32(12)).assertEqual(4294967295);
      expect(dataView.getUint32(16)).assertEqual(2147483647);
      expect(dataView.getUint32(20)).assertEqual(2147483648);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1000
     * @tc.desc    Verify setUint32 with values outside uint32 range (should wrap)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 4294967296);
      dataView.setUint32(4, 4294967297);
      dataView.setUint32(8, -4294967296);
      dataView.setUint32(12, -4294967297);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(1);
      expect(dataView.getUint32(8)).assertEqual(0);
      expect(dataView.getUint32(12)).assertEqual(4294967295);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1100
     * @tc.desc    Verify setUint32 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetUint32Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(0, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1200
     * @tc.desc    Verify setUint32 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0x12345678);
      expect(dataView.getUint32(0)).assertEqual(0x12345678);
      let threwError = false;
      try {
        dataView.setUint32(1, 0x12345678);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1300
     * @tc.desc    Verify setUint32 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0x12345678, false);
      dataView.setUint32(4, 0x87654321, false);
      expect(dataView.getUint32(0, false)).assertEqual(0x12345678);
      expect(dataView.getUint32(4, false)).assertEqual(0x87654321);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1400
     * @tc.desc    Verify setUint32 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0x12345678, true);
      dataView.setUint32(4, 0x87654321, true);
      expect(dataView.getUint32(0, true)).assertEqual(0x12345678);
      expect(dataView.getUint32(4, true)).assertEqual(0x87654321);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1500
     * @tc.desc    Verify setUint32 with littleEndian parameter and negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(-1, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(-1, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1600
     * @tc.desc    Verify setUint32 with littleEndian parameter and out of bounds byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(5, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(5, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1700
     * @tc.desc    Verify setUint32 with littleEndian parameter and int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setUint32(intMin, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(intMax, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(intMin, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(intMax, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1800
     * @tc.desc    Verify setUint32 with littleEndian parameter and long boundary values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808n;
      const longMax = 9223372036854775807n;
      dataView.setUint32(0, Number(longMin), true);
      dataView.setUint32(4, Number(longMax), true);
      dataView.setUint32(8, Number(longMin), false);
      dataView.setUint32(12, Number(longMax), false);
      expect(dataView.getUint32(0, true)).assertEqual(0);
      expect(dataView.getUint32(4, true)).assertEqual(0);
      expect(dataView.getUint32(8, false)).assertEqual(0);
      expect(dataView.getUint32(12, false)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_1900
     * @tc.desc    Verify setUint32 with littleEndian parameter and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetUint32Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint32(0, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(0, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2000
     * @tc.desc    Verify setUint32 with littleEndian parameter and byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0x12345678, true);
      expect(dataView.getUint32(0, true)).assertEqual(0x12345678);
      dataView.setUint32(0, 0x87654321, false);
      expect(dataView.getUint32(0, false)).assertEqual(0x87654321);
      let threwError = false;
      try {
        dataView.setUint32(1, 0x12345678, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setUint32(1, 0x12345678, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2100
     * @tc.desc    Verify setUint32 with Math.floor values and small range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, Math.floor(1.5));
      dataView.setUint32(4, Math.floor(2.9));
      dataView.setUint32(8, Math.floor(-1.5));
      dataView.setUint32(12, -128);
      dataView.setUint32(16, 0);
      dataView.setUint32(20, 127);
      dataView.setUint32(24, 128);
      dataView.setUint32(28, -129);
      expect(dataView.getUint32(0)).assertEqual(1);
      expect(dataView.getUint32(4)).assertEqual(2);
      expect(dataView.getUint32(8)).assertEqual(4294967294);
      expect(dataView.getUint32(12)).assertEqual(4294967168);
      expect(dataView.getUint32(16)).assertEqual(0);
      expect(dataView.getUint32(20)).assertEqual(127);
      expect(dataView.getUint32(24)).assertEqual(128);
      expect(dataView.getUint32(28)).assertEqual(4294967167);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2200
     * @tc.desc    Verify setUint32 with int16 range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, -32768);
      dataView.setUint32(4, 32767);
      dataView.setUint32(8, -32769);
      dataView.setUint32(12, 32768);
      dataView.setUint32(16, 0);
      dataView.setUint32(20, -1);
      expect(dataView.getUint32(0)).assertEqual(4294934528);
      expect(dataView.getUint32(4)).assertEqual(32767);
      expect(dataView.getUint32(8)).assertEqual(4294934527);
      expect(dataView.getUint32(12)).assertEqual(32768);
      expect(dataView.getUint32(16)).assertEqual(0);
      expect(dataView.getUint32(20)).assertEqual(4294967295);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2300
     * @tc.desc    Verify setUint32 with float and double range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      const floatMin = 1.40129846432481707e-45;
      const floatMax = 3.40282346638528860e+38;
      const doubleMin = 4.94065645841246544e-324;
      const doubleMax = 1.79769313486231570e+308;
      dataView.setUint32(0, floatMin);
      dataView.setUint32(4, floatMax);
      dataView.setUint32(8, -floatMin);
      dataView.setUint32(12, -floatMax);
      dataView.setUint32(16, doubleMin);
      dataView.setUint32(20, doubleMax);
      dataView.setUint32(24, -doubleMin);
      dataView.setUint32(28, -doubleMax);
      // Verify specific values
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(0);
      expect(dataView.getUint32(8)).assertEqual(0);
      expect(dataView.getUint32(12)).assertEqual(0);
      expect(dataView.getUint32(16)).assertEqual(0);
      expect(dataView.getUint32(20)).assertEqual(0);
      expect(dataView.getUint32(24)).assertEqual(0);
      expect(dataView.getUint32(28)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2400
     * @tc.desc    Verify setUint32 with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint32Test2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setUint32(0, longMin);
      dataView.setUint32(4, longMax);
      dataView.setUint32(8, longMin + 1);
      dataView.setUint32(12, longMax - 1);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(0);
      expect(dataView.getUint32(8)).assertEqual(1);
      expect(dataView.getUint32(12)).assertEqual(4294967294);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2500
     * @tc.desc    Verify setUint32 with special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, Infinity);
      dataView.setUint32(4, -Infinity);
      dataView.setUint32(8, NaN);
      dataView.setUint32(12, 0);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(0);
      expect(dataView.getUint32(8)).assertEqual(0);
      expect(dataView.getUint32(12)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2600
     * @tc.desc    Verify setUint32 with edge case floating-point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, 0.0);
      dataView.setUint32(4, -0.0);
      dataView.setUint32(8, 1.0);
      dataView.setUint32(12, -1.0);
      dataView.setUint32(16, 0.999999);
      dataView.setUint32(20, 1.000001);
      expect(dataView.getUint32(0)).assertEqual(0);
      expect(dataView.getUint32(4)).assertEqual(0);
      expect(dataView.getUint32(8)).assertEqual(1);
      expect(dataView.getUint32(12)).assertEqual(4294967295);
      expect(dataView.getUint32(16)).assertEqual(0);
      expect(dataView.getUint32(20)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsDataViewSetUint32Test2700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_ThirtyTwo_TEST_2700
     * @tc.desc    Verify setUint32 with littleEndian parameter and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint32Test2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setUint32(0, Infinity, false);
      dataView.setUint32(4, -Infinity, true);
      dataView.setUint32(8, NaN, false);
      dataView.setUint32(12, 0, true);
      expect(dataView.getUint32(0, false)).assertEqual(0);
      expect(dataView.getUint32(4, true)).assertEqual(0);
      expect(dataView.getUint32(8, false)).assertEqual(0);
      expect(dataView.getUint32(12, true)).assertEqual(0);
    });
  })
}