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

export default function BuiltinsDataViewSetFloat32Test() {
  describe("BuiltinsDataViewSetFloat32Test", () => {
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
     * @tc.name    builtinsDataViewSetFloat32Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0100
     * @tc.desc    Verify setFloat32 works correctly with positive byteOffset and value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetFloat32Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456);
      dataView.setFloat32(4, -789.012);
      expect(dataView.getFloat32(0)).assertClose(123.456, 0.001);
      expect(dataView.getFloat32(4)).assertClose(-789.012, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0200
     * @tc.desc    Verify setFloat32 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(-1, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0300
     * @tc.desc    Verify setFloat32 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(1, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setFloat32(4, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0400
     * @tc.desc    Verify setFloat32 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat32Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setFloat32(intMin, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0500
     * @tc.desc    Verify setFloat32 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat32Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setFloat32(intMax, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0600
     * @tc.desc    Verify setFloat32 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2, 4);
      dataView.setFloat32(0, 3.14159);
      const fullView = new DataView(buffer);
      expect(fullView.getFloat32(2)).assertClose(3.14159, 0.00001);
      let threwError = false;
      try {
        dataView.setFloat32(1, 2.71828);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0700
     * @tc.desc    Verify setFloat32 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetFloat32Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(0, 123.456);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0800
     * @tc.desc    Verify setFloat32 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 2.71828);
      expect(dataView.getFloat32(0)).assertClose(2.71828, 0.00001);
      let threwError = false;
      try {
        dataView.setFloat32(1, 3.14159);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_0900
     * @tc.desc    Verify setFloat32 with various float values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      const testValues = [0.0, 1.0, -1.0, 0.5, -0.5, 1000.0, -1000.0, 0.0001];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setFloat32(i * 4, value);
        expect(dataView.getFloat32(i * 4)).assertClose(value, 0.000001);
      }
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1000
     * @tc.desc    Verify setFloat32 with float min and max values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const floatMinPositive = 1.40129846432481707e-45;
      const floatMax = 3.40282346638528860e+38;
      const floatMinNegative = -1.40129846432481707e-45;
      const floatMaxNegative = -3.40282346638528860e+38;
      dataView.setFloat32(0, floatMinPositive);
      dataView.setFloat32(4, floatMax);
      dataView.setFloat32(8, floatMinNegative);
      dataView.setFloat32(12, floatMaxNegative);
      expect(dataView.getFloat32(0)).assertClose(floatMinPositive, 1e-50);
      expect(dataView.getFloat32(4)).assertClose(floatMax, 1e+33);
      expect(dataView.getFloat32(8)).assertClose(floatMinNegative, 1e-50);
      expect(dataView.getFloat32(12)).assertClose(floatMaxNegative, 1e+33);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1100
     * @tc.desc    Verify setFloat32 with NaN and Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, NaN);
      dataView.setFloat32(4, Infinity);
      dataView.setFloat32(8, -Infinity);
      const resultNaN = dataView.getFloat32(0);
      expect(isNaN(resultNaN)).assertTrue();
      expect(dataView.getFloat32(4)).assertEqual(Infinity);
      expect(dataView.getFloat32(8)).assertEqual(-Infinity);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1200
     * @tc.desc    Verify setFloat32 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, false);
      expect(dataView.getFloat32(0, false)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1300
     * @tc.desc    Verify setFloat32 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, true);
      expect(dataView.getFloat32(0, true)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1400
     * @tc.desc    Verify setFloat32 with littleEndian and negative offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(-1, 123.456, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1500
     * @tc.desc    Verify setFloat32 with littleEndian and out of bounds offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(1, 123.456, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1600
     * @tc.desc    Verify setFloat32 with littleEndian and int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat32Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setFloat32(intMin, 123.456, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setFloat32(intMax, 123.456, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1700
     * @tc.desc    Verify setFloat32 with littleEndian and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetFloat32Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat32(0, 123.456, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1800
     * @tc.desc    Verify setFloat32 with littleEndian and boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, true);
      expect(dataView.getFloat32(0, true)).assertClose(123.456, 0.001);
      dataView.setFloat32(0, 123.456, false);
      expect(dataView.getFloat32(0, false)).assertClose(123.456, 0.001);
      let threwError = false;
      try {
        dataView.setFloat32(1, 456.789, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setFloat32(1, 456.789, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_1900
     * @tc.desc    Verify setFloat32 with Math.floor values and small range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, Math.floor(1.5));
      dataView.setFloat32(4, Math.floor(2.9));
      dataView.setFloat32(8, Math.floor(-1.5));
      dataView.setFloat32(12, -128);
      dataView.setFloat32(16, 0);
      dataView.setFloat32(20, 127);
      dataView.setFloat32(24, 128);
      dataView.setFloat32(28, -129);
      expect(dataView.getFloat32(0)).assertClose(1.0, 0.0001);
      expect(dataView.getFloat32(4)).assertClose(2.0, 0.0001);
      expect(dataView.getFloat32(8)).assertClose(-2.0, 0.0001);
      expect(dataView.getFloat32(12)).assertClose(-128.0, 0.0001);
      expect(dataView.getFloat32(16)).assertClose(0.0, 0.0001);
      expect(dataView.getFloat32(20)).assertClose(127.0, 0.0001);
      expect(dataView.getFloat32(24)).assertClose(128.0, 0.0001);
      expect(dataView.getFloat32(28)).assertClose(-129.0, 0.0001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2000
     * @tc.desc    Verify setFloat32 with int16 range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, -32768);
      dataView.setFloat32(4, 32767);
      dataView.setFloat32(8, -32769);
      dataView.setFloat32(12, 32768);
      dataView.setFloat32(16, 0);
      dataView.setFloat32(20, -1);
      expect(dataView.getFloat32(0)).assertClose(-32768.0, 0.0001);
      expect(dataView.getFloat32(4)).assertClose(32767.0, 0.0001);
      expect(dataView.getFloat32(8)).assertClose(-32769.0, 0.0001);
      expect(dataView.getFloat32(12)).assertClose(32768.0, 0.0001);
      expect(dataView.getFloat32(16)).assertClose(0.0, 0.0001);
      expect(dataView.getFloat32(20)).assertClose(-1.0, 0.0001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2100
     * @tc.desc    Verify setFloat32 with float and double range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat32Test2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(32);
      const dataView = new DataView(buffer);
      const floatMin = 1.40129846432481707e-45;
      const floatMax = 3.40282346638528860e+38;
      const floatMinNegative = -1.40129846432481707e-45;
      const floatMaxNegative = -3.40282346638528860e+38;
      const floatBeyondMax = floatMax * 2;
      const floatBeyondMin = floatMaxNegative * 2;
      const doubleMin = 4.94065645841246544e-324;
      const doubleMax = 1.79769313486231570e+308;
      const doubleMinNegative = -4.94065645841246544e-324;
      const doubleMaxNegative = -1.79769313486231570e+308;
      dataView.setFloat32(0, floatMin);
      dataView.setFloat32(4, floatBeyondMax);
      dataView.setFloat32(8, floatMinNegative);
      dataView.setFloat32(12, floatBeyondMin);
      dataView.setFloat32(16, doubleMin);
      dataView.setFloat32(20, doubleMax);
      dataView.setFloat32(24, doubleMinNegative);
      dataView.setFloat32(28, doubleMaxNegative);
      const result0 = dataView.getFloat32(0);
      const result8 = dataView.getFloat32(8);
      const result16 = dataView.getFloat32(16);
      const result24 = dataView.getFloat32(24);
      expect(!isNaN(result0)).assertTrue();
      expect(result0 > 0).assertTrue();
      expect(dataView.getFloat32(4)).assertEqual(Infinity);
      expect(!isNaN(result8)).assertTrue();
      expect(result8 < 0).assertTrue();
      expect(dataView.getFloat32(12)).assertEqual(-Infinity);
      expect(!isNaN(result16)).assertTrue();
      expect(result16 > 0).assertFalse();
      expect(dataView.getFloat32(20)).assertEqual(Infinity);
      expect(!isNaN(result24)).assertTrue();
      expect(result24 < 0).assertFalse();
      expect(dataView.getFloat32(28)).assertEqual(-Infinity);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2200
     * @tc.desc    Verify setFloat32 with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat32Test2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      const longMinPlusOne = longMin + 1;
      const longMaxMinusOne = longMax - 1;
      dataView.setFloat32(0, longMin);
      dataView.setFloat32(4, longMax);
      dataView.setFloat32(8, longMinPlusOne);
      dataView.setFloat32(12, longMaxMinusOne);
      expect(dataView.getFloat32(0)).assertClose(longMin, 1e+18);
      expect(dataView.getFloat32(4)).assertClose(longMax, 1e+18);
      expect(dataView.getFloat32(8)).assertClose(longMinPlusOne, 1e+18);
      expect(dataView.getFloat32(12)).assertClose(longMaxMinusOne, 1e+18);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2300
     * @tc.desc    Verify setFloat32 with special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, Infinity);
      dataView.setFloat32(4, -Infinity);
      dataView.setFloat32(8, NaN);
      dataView.setFloat32(12, 0);
      expect(dataView.getFloat32(0)).assertEqual(Infinity);
      expect(dataView.getFloat32(4)).assertEqual(-Infinity);
      expect(isNaN(dataView.getFloat32(8))).assertTrue();
      expect(dataView.getFloat32(12)).assertClose(0.0, 0.0001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2400
     * @tc.desc    Verify setFloat32 with edge case floating-point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 0.0);
      dataView.setFloat32(4, -0.0);
      dataView.setFloat32(8, 1.0);
      dataView.setFloat32(12, -1.0);
      dataView.setFloat32(16, 0.999999);
      dataView.setFloat32(20, 1.000001);
      expect(dataView.getFloat32(0)).assertClose(0.0, 0.0001);
      expect(dataView.getFloat32(4)).assertClose(0.0, 0.0001);
      expect(dataView.getFloat32(8)).assertClose(1.0, 0.0001);
      expect(dataView.getFloat32(12)).assertClose(-1.0, 0.0001);
      expect(dataView.getFloat32(16)).assertClose(0.999999, 0.000001);
      expect(dataView.getFloat32(20)).assertClose(1.000001, 0.000001);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat32Test2500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_ThirtyTwo_TEST_2500
     * @tc.desc    Verify setFloat32 with littleEndian parameter and special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat32Test2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, Infinity, false);
      dataView.setFloat32(4, -Infinity, true);
      dataView.setFloat32(8, NaN, false);
      dataView.setFloat32(12, 0, true);
      expect(dataView.getFloat32(0, false)).assertEqual(Infinity);
      expect(dataView.getFloat32(4, true)).assertEqual(-Infinity);
      expect(isNaN(dataView.getFloat32(8, false))).assertTrue();
      expect(dataView.getFloat32(12, true)).assertClose(0.0, 0.0001);
    });
  })
}