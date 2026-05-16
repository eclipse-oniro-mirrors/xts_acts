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

export default function BuiltinsDataViewGetInt16Test() {
  describe("BuiltinsDataViewGetInt16Test", () => {
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
     * @tc.name    builtinsDataViewGetInt16Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0100
     * @tc.desc    Verify getInt16 returns correct value for positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetInt16Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      dataView.setInt8(2, 0x56);
      dataView.setInt8(3, 0x78);
      
      expect(dataView.getInt16(0)).assertEqual(0x1234);
      expect(dataView.getInt16(2)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0200
     * @tc.desc    Verify getInt16 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getInt16(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0300
     * @tc.desc    Verify getInt16 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getInt16(3);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      
      threwError = false;
      try {
        dataView.getInt16(4);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0400
     * @tc.desc    Verify getInt16 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt16Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      
      let threwError = false;
      try {
        dataView.getInt16(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0500
     * @tc.desc    Verify getInt16 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt16Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      
      let threwError = false;
      try {
        dataView.getInt16(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0600
     * @tc.desc    Verify getInt16 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 1, 4);
      const fullView = new DataView(buffer);
      fullView.setInt8(0, 0x00);
      fullView.setInt8(1, 0x11);
      fullView.setInt8(2, 0x22);
      fullView.setInt8(3, 0x33);
      fullView.setInt8(4, 0x44);
      fullView.setInt8(5, 0x55);
      expect(dataView.getInt16(0)).assertEqual(0x1122);
      expect(dataView.getInt16(2)).assertEqual(0x3344);
      let threwError = false;
      try {
        dataView.getInt16(3);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0700
     * @tc.desc    Verify getInt16 returns correct value for negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0xFF);
      dataView.setInt8(1, 0xFE);
      dataView.setInt8(2, 0x7F);
      dataView.setInt8(3, 0xFF);
      
      expect(dataView.getInt16(0)).assertEqual(-2);
      expect(dataView.getInt16(2)).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0800
     * @tc.desc    Verify getInt16 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetInt16Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getInt16(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_0900
     * @tc.desc    Verify getInt16 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      expect(dataView.getInt16(0)).assertEqual(0x1234);
      
      let threwError = false;
      try {
        dataView.getInt16(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_1000
     * @tc.desc    Verify getInt16 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      dataView.setInt8(2, 0x56);
      dataView.setInt8(3, 0x78);
      expect(dataView.getInt16(0, false)).assertEqual(0x1234);
      expect(dataView.getInt16(2, false)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_1100
     * @tc.desc    Verify getInt16 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x34);
      dataView.setInt8(1, 0x12);
      dataView.setInt8(2, 0x78);
      dataView.setInt8(3, 0x56);
      expect(dataView.getInt16(0, true)).assertEqual(0x1234);
      expect(dataView.getInt16(2, true)).assertEqual(0x5678);
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_1200
     * @tc.desc    Verify getInt16 with littleEndian and negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0xFF);
      dataView.setInt8(1, 0xFF);
      dataView.setInt8(2, 0xFF);
      dataView.setInt8(3, 0xFF);
      expect(dataView.getInt16(0, false)).assertEqual(-1);
      expect(dataView.getInt16(2, true)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_1300
     * @tc.desc    Verify getInt16 with out of bounds byteOffset and littleEndian
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetInt16Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getInt16(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      
      threwError = false;
      try {
        dataView.getInt16(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetInt16Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_INT_Sixteen_TEST_1400
     * @tc.desc    Verify getInt16 with int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetInt16Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getInt16(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      threwError = false;
      try {
        dataView.getInt16(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      threwError = false;
      try {
        dataView.getInt16(intMin, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      threwError = false;
      try {
        dataView.getInt16(intMax, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

  })
}