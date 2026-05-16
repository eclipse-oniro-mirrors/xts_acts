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

export default function BuiltinsDataViewSetUint8Test(){
  describe("BuiltinsDataViewSetUint8Test", () => {
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
     * @tc.name    builtinsDataViewSetUint8Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0100
     * @tc.desc    Verify setUint8 works correctly with positive byteOffset and value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetUint8Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, 0x12);
      dataView.setUint8(1, 0x34);
      dataView.setUint8(2, 0x56);
      dataView.setUint8(3, 0x78);
      expect(dataView.getUint8(0)).assertEqual(0x12);
      expect(dataView.getUint8(1)).assertEqual(0x34);
      expect(dataView.getUint8(2)).assertEqual(0x56);
      expect(dataView.getUint8(3)).assertEqual(0x78);
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0200
     * @tc.desc    Verify setUint8 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint8(-1, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0300
     * @tc.desc    Verify setUint8 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint8(4, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0400
     * @tc.desc    Verify setUint8 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint8Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setUint8(intMin, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0500
     * @tc.desc    Verify setUint8 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint8Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setUint8(intMax, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0600
     * @tc.desc    Verify setUint8 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 2, 4);
      dataView.setUint8(0, 0x02);
      dataView.setUint8(1, 0x03);
      dataView.setUint8(2, 0x04);
      dataView.setUint8(3, 0x05);
      const fullView = new DataView(buffer);
      expect(fullView.getUint8(0)).assertEqual(0);
      expect(fullView.getUint8(1)).assertEqual(0);
      expect(fullView.getUint8(2)).assertEqual(0x02);
      expect(fullView.getUint8(3)).assertEqual(0x03);
      expect(fullView.getUint8(4)).assertEqual(0x04);
      expect(fullView.getUint8(5)).assertEqual(0x05);
      let threwError = false;
      try {
        dataView.setUint8(4, 0x06);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0700
     * @tc.desc    Verify setUint8 works with values at upper range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, 0xFF);
      dataView.setUint8(1, 0x80);
      expect(dataView.getUint8(0)).assertEqual(255);
      expect(dataView.getUint8(1)).assertEqual(128);
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0800
     * @tc.desc    Verify setUint8 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetUint8Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setUint8(0, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_0900
     * @tc.desc    Verify setUint8 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, 0x42);
      expect(dataView.getUint8(0)).assertEqual(0x42);
      let threwError = false;
      try {
        dataView.setUint8(1, 0x43);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_1000
     * @tc.desc    Verify setUint8 with int min and max values as value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, -2147483648);
      dataView.setUint8(1, 2147483647);
      dataView.setUint8(2, -1);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(255);
      expect(dataView.getUint8(2)).assertEqual(255);
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_1100
     * @tc.desc    Verify setUint8 with special values and precision testing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, Infinity);
      dataView.setUint8(1, -Infinity);
      dataView.setUint8(2, Math.floor(1.5));
      dataView.setUint8(3, 1.999999);
      dataView.setUint8(4, 2.000001);
      dataView.setUint8(5, 255.999999);
      dataView.setUint8(6, 1.40129846432481707e-45);
      dataView.setUint8(7, 3.40282346638528860e+38);
      dataView.setUint8(8, 4.94065645841246544e-324);
      dataView.setUint8(9, 1.79769313486231570e+308);
      for (let i = 0; i < 10; i++) {
        const result = dataView.getUint8(i);
        expect(typeof result).assertEqual('int');
      }
      expect(dataView.getUint8(2)).assertEqual(1);
      expect(dataView.getUint8(3)).assertEqual(1);
      expect(dataView.getUint8(4)).assertEqual(2);
      expect(dataView.getUint8(5)).assertEqual(255);
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_1200
     * @tc.desc    Verify setUint8 with boundary values and overflow handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetUint8Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer);
      dataView.setUint8(0, 0);
      dataView.setUint8(1, 255);
      dataView.setUint8(2, -1);
      dataView.setUint8(3, 256);
      dataView.setUint8(4, -32768);
      dataView.setUint8(5, 32767);
      dataView.setUint8(6, -2147483648);
      dataView.setUint8(7, 2147483647);
      dataView.setUint8(8, -32769);
      dataView.setUint8(9, 32768);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(255);
      expect(dataView.getUint8(2)).assertEqual(255);
      expect(dataView.getUint8(3)).assertEqual(0);
      for (let i = 0; i < 10; i++) {
        const result = dataView.getUint8(i);
        expect(typeof result).assertEqual('int');
      }
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_1300
     * @tc.desc    Verify setUint8 with long range values (-9223372036854775808 to 9223372036854775807)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint8Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      dataView.setUint8(0, longMin);
      dataView.setUint8(1, longMax);
      const longMidPositive = 4611686018427387904;
      const longMidNegative = -4611686018427387904;
      dataView.setUint8(2, longMidPositive);
      dataView.setUint8(3, longMidNegative);
      const nearLongMin = -9223372036854775807;
      const nearLongMax = 9223372036854775806;
      dataView.setUint8(4, nearLongMin);
      dataView.setUint8(5, nearLongMax);
      const largePositive = 1000000000000000000;
      const largeNegative = -1000000000000000000;
      dataView.setUint8(6, largePositive);
      dataView.setUint8(7, largeNegative);
      for (let i = 0; i < 8; i++) {
        const result = dataView.getUint8(i);
        expect(typeof result).assertEqual('int');
      }
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewSetUint8Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_UINT_Eight_TEST_1400
     * @tc.desc    Verify setUint8 with Long.MAX_VALUE and Long.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetUint8Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      const longMin = -9223372036854775808;
      const longMax = 9223372036854775807;
      
      dataView.setUint8(0, longMin);
      dataView.setUint8(1, longMax);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(0);
    });
  })
}