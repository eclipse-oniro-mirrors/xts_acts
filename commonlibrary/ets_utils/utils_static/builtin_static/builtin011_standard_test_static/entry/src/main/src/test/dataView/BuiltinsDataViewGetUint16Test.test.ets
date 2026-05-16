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

export default function BuiltinsDataViewGetUint16Test() {
  describe("BuiltinsDataViewGetUint16Test", () => {
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
     * @tc.name    builtinsDataViewGetUint16Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0100
     * @tc.desc    Verify getUint16 returns correct value for positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetUint16Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      dataView.setInt8(2, 0x56);
      dataView.setInt8(3, 0x78);
      expect(dataView.getUint16(0)).assertEqual(0x1234);
      expect(dataView.getUint16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0200
     * @tc.desc    Verify getUint16 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0300
     * @tc.desc    Verify getUint16 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(3);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(4);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0400
     * @tc.desc    Verify getUint16 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetUint16Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.getUint16(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0500
     * @tc.desc    Verify getUint16 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetUint16Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getUint16(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0600
     * @tc.desc    Verify getUint16 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 1, 4);
      const fullView = new DataView(buffer);
      fullView.setInt8(0, 0x00);
      fullView.setInt8(1, 0x11);
      fullView.setInt8(2, 0x22);
      fullView.setInt8(3, 0x33);
      fullView.setInt8(4, 0x44);
      fullView.setInt8(5, 0x55);
      expect(dataView.getUint16(0)).assertEqual(0x1122);
      expect(dataView.getUint16(2)).assertEqual(0x3344);
      let threwError = false;
      try {
        dataView.getUint16(3);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0700
     * @tc.desc    Verify getUint16 returns correct value for values close to uint16 max
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0xFF);
      dataView.setInt8(1, 0xFF);
      dataView.setInt8(2, 0x7F);
      dataView.setInt8(3, 0xFF);
      expect(dataView.getUint16(0)).assertEqual(0xFFFF);
      expect(dataView.getUint16(2)).assertEqual(0x7FFF);
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0800
     * @tc.desc    Verify getUint16 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetUint16Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_0900
     * @tc.desc    Verify getUint16 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      expect(dataView.getUint16(0)).assertEqual(0x1234);
      let threwError = false;
      try {
        dataView.getUint16(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1000
     * @tc.desc    Verify getUint16 precision with various values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(26);
      const dataView = new DataView(buffer);
      const testValues = [0, 1, 127, 255, 256, 1024, 4096, 8192, 16384, 32767, 32768, 65534, 65535];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setUint16(i * 2, value);
        expect(dataView.getUint16(i * 2)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1100
     * @tc.desc    Verify getUint16 precision with littleEndian parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const testValues = [0x1234, 0x5678, 0xABCD, 0xFFFF];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setUint16(i * 2, value, false);
        expect(dataView.getUint16(i * 2, false)).assertEqual(value);
      }
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setUint16(i * 2, value, true);
        expect(dataView.getUint16(i * 2, true)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1200
     * @tc.desc    Verify getUint16 precision with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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
     * @tc.name    builtinsDataViewGetUint16Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1300
     * @tc.desc    Verify getUint16 precision with byte manipulation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      dataView.setInt8(2, 0x56);
      dataView.setInt8(3, 0x78);
      expect(dataView.getUint16(0)).assertEqual(0x1234);
      expect(dataView.getUint16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1400
     * @tc.desc    Verify getUint16 with littleEndian parameter and negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(-1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(-1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1500
     * @tc.desc    Verify getUint16 with littleEndian parameter and out of bounds byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetUint16Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(3, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(3, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1600
     * @tc.desc    Verify getUint16 with littleEndian parameter and int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetUint16Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getUint16(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(intMin, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(intMax, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1700
     * @tc.desc    Verify getUint16 with littleEndian parameter and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetUint16Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getUint16(0, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(0, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetUint16Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_UINT_Sixteen_TEST_1800
     * @tc.desc    Verify getUint16 with littleEndian parameter and byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetUint16Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      expect(dataView.getUint16(0, true)).assertEqual(0x3412);
      expect(dataView.getUint16(0, false)).assertEqual(0x1234);
      let threwError = false;
      try {
        dataView.getUint16(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getUint16(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });
  })
}