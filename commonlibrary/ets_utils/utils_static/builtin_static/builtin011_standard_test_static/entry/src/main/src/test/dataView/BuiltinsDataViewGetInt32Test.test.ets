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

export default function BuiltinsDataViewGetInt32Test() {
  describe("BuiltinsDataViewGetInt32Test", () => {
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
     * @tc.name    builtinsDataViewGetInt32Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0100
     * @tc.desc    Verify getInt32 returns correct value for positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetInt32Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678);
      dataView.setInt32(4, 0x87654321);
      expect(dataView.getInt32(0)).assertEqual(0x12345678);
      expect(dataView.getInt32(4)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0200
     * @tc.desc    Verify getInt32 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0300
     * @tc.desc    Verify getInt32 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(5);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(8);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0400
     * @tc.desc    Verify getInt32 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt32Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.getInt32(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0500
     * @tc.desc    Verify getInt32 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt32Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getInt32(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0600
     * @tc.desc    Verify getInt32 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer, 1, 8);
      const fullView = new DataView(buffer);
      fullView.setInt32(1, 0x11223344);
      fullView.setInt32(5, 0x55667788);
      expect(dataView.getInt32(0)).assertEqual(0x11223344);
      expect(dataView.getInt32(4)).assertEqual(0x55667788);
      let threwError = false;
      try {
        dataView.getInt32(5);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0700
     * @tc.desc    Verify getInt32 returns correct value for int32 boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0);
      dataView.setInt32(4, 2147483647);
      dataView.setInt32(8, -2147483648);
      dataView.setInt32(12, -1);
      expect(dataView.getInt32(0)).assertEqual(0);
      expect(dataView.getInt32(4)).assertEqual(2147483647);
      expect(dataView.getInt32(8)).assertEqual(-2147483648);
      expect(dataView.getInt32(12)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0800
     * @tc.desc    Verify getInt32 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetInt32Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_0900
     * @tc.desc    Verify getInt32 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678);
      expect(dataView.getInt32(0)).assertEqual(0x12345678);
      let threwError = false;
      try {
        dataView.getInt32(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1000
     * @tc.desc    Verify getInt32 precision with various values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(52);
      const dataView = new DataView(buffer);
      const testValues = [0, 1, -1, 127, -128, 255, -256, 1024, -1024, 32767, -32768, 65535, -65536];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setInt32(i * 4, value);
        expect(dataView.getInt32(i * 4)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1100
     * @tc.desc    Verify getInt32 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678, false);
      dataView.setInt32(4, 0x87654321, false);
      expect(dataView.getInt32(0, false)).assertEqual(0x12345678);
      expect(dataView.getInt32(4, false)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1200
     * @tc.desc    Verify getInt32 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678, true);
      dataView.setInt32(4, 0x87654321, true);
      expect(dataView.getInt32(0, true)).assertEqual(0x12345678);
      expect(dataView.getInt32(4, true)).assertEqual(-2023406815);
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1300
     * @tc.desc    Verify getInt32 with littleEndian parameter and negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(-1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(-1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1400
     * @tc.desc    Verify getInt32 with littleEndian parameter and out of bounds byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(5, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(5, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1500
     * @tc.desc    Verify getInt32 with littleEndian parameter and int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt32Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getInt32(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(intMin, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(intMax, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1600
     * @tc.desc    Verify getInt32 with littleEndian parameter and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getInt32(0, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(0, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt32Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_ThirtyTwo_TEST_1700
     * @tc.desc    Verify getInt32 with littleEndian parameter and byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt32Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 0x12345678);
      expect(dataView.getInt32(0, true)).assertEqual(2018915346);
      expect(dataView.getInt32(0, false)).assertEqual(305419896);
      let threwError = false;
      try {
        dataView.getInt32(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getInt32(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });
  })
}