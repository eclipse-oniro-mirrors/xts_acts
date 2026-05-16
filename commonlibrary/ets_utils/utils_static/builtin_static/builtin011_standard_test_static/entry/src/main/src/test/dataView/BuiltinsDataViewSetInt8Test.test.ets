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

export default function BuiltinsDataViewSetInt8Test() {
  describe("BuiltinsDataViewSetInt8Test", () => {
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
     * @tc.name    builtinsDataViewSetInt8Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0100
     * @tc.desc    Verify setInt8 works correctly with positive byteOffset and value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetInt8Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x12);
      dataView.setInt8(1, 0x34);
      dataView.setInt8(2, 0x56);
      dataView.setInt8(3, 0x78);
      expect(dataView.getInt8(0)).assertEqual(0x12);
      expect(dataView.getInt8(1)).assertEqual(0x34);
      expect(dataView.getInt8(2)).assertEqual(0x56);
      expect(dataView.getInt8(3)).assertEqual(0x78);
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0200
     * @tc.desc    Verify setInt8 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt8(-1, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0300
     * @tc.desc    Verify setInt8 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt8(4, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0400
     * @tc.desc    Verify setInt8 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt8Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setInt8(intMin, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0500
     * @tc.desc    Verify setInt8 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetInt8Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setInt8(intMax, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0600
     * @tc.desc    Verify setInt8 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(6);
      const dataView = new DataView(buffer, 2, 4);
      dataView.setInt8(0, 0x02);
      dataView.setInt8(1, 0x03);
      dataView.setInt8(2, 0x04);
      dataView.setInt8(3, 0x05);
      const fullView = new DataView(buffer);
      expect(fullView.getInt8(0)).assertEqual(0);
      expect(fullView.getInt8(1)).assertEqual(0);
      expect(fullView.getInt8(2)).assertEqual(0x02);
      expect(fullView.getInt8(3)).assertEqual(0x03);
      expect(fullView.getInt8(4)).assertEqual(0x04);
      expect(fullView.getInt8(5)).assertEqual(0x05);
      let threwError = false;
      try {
        dataView.setInt8(4, 0x06);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0700
     * @tc.desc    Verify setInt8 works with negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(2);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, -1);
      dataView.setInt8(1, -128);
      expect(dataView.getInt8(0)).assertEqual(-1);
      expect(dataView.getInt8(1)).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0800
     * @tc.desc    Verify setInt8 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetInt8Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setInt8(0, 0x12);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_0900
     * @tc.desc    Verify setInt8 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(1);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, 0x42);
      expect(dataView.getInt8(0)).assertEqual(0x42);
      let threwError = false;
      try {
        dataView.setInt8(1, 0x43);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_1000
     * @tc.desc    Verify setInt8 with int32 min and max values (overflow behavior)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const int32Min = -2147483648;
      const int32Max = 2147483647;
      dataView.setInt8(0, int32Min);
      dataView.setInt8(1, int32Max);
      expect(dataView.getInt8(0)).assertEqual(0);
      expect(dataView.getInt8(1)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsDataViewSetInt8Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_INT_Eight_TEST_1100
     * @tc.desc    Verify setInt8 with special values (Infinity, float extremes) and conversion behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetInt8Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer);
      dataView.setInt8(0, Infinity);
      dataView.setInt8(1, -Infinity);
      dataView.setInt8(2, Math.floor(1.5));
      dataView.setInt8(3, 1.999999);
      dataView.setInt8(4, 2.000001);
      dataView.setInt8(5, -1.999999);
      dataView.setInt8(6, 1.40129846432481707e-45);
      dataView.setInt8(7, 3.40282346638528860e+38);
      dataView.setInt8(8, 4.94065645841246544e-324);
      dataView.setInt8(9, 1.79769313486231570e+308);
      for (let i = 0; i < 10; i++) {
        const result = dataView.getInt8(i);
        expect(typeof result).assertEqual('int');
      }
      expect(dataView.getInt8(2)).assertEqual(1);
      expect(dataView.getInt8(3)).assertEqual(1);
      expect(dataView.getInt8(4)).assertEqual(2);
      expect(dataView.getInt8(5)).assertEqual(-1);
    });

  })
}