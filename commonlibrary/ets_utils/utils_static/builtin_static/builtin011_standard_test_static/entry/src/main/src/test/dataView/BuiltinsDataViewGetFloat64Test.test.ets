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

export default function BuiltinsDataViewGetFloat64Test() {
  describe("BuiltinsDataViewGetFloat64Test", () => {
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
     * @tc.name    builtinsDataViewGetFloat64Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0100
     * @tc.desc    Verify getFloat64 works correctly with positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetFloat64Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 0.0);
      dataView.setFloat64(8, 1.0);
      
      expect(dataView.getFloat64(0)).assertClose(0.0, 0.001);
      expect(dataView.getFloat64(8)).assertClose(1.0, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0200
     * @tc.desc    Verify getFloat64 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0300
     * @tc.desc    Verify getFloat64 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      
      threwError = false;
      try {
        dataView.getFloat64(8);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0400
     * @tc.desc    Verify getFloat64 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat64Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      
      let threwError = false;
      try {
        dataView.getFloat64(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0500
     * @tc.desc    Verify getFloat64 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat64Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      
      let threwError = false;
      try {
        dataView.getFloat64(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0600
     * @tc.desc    Verify getFloat64 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);
      const fullView = new DataView(buffer);
      fullView.setFloat64(4, 123.456);
      
      expect(dataView.getFloat64(0)).assertClose(123.456, 0.001);
      let threwError = false;
      try {
        dataView.getFloat64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0700
     * @tc.desc    Verify getFloat64 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetFloat64Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0800
     * @tc.desc    Verify getFloat64 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      
      dataView.setFloat64(0, 123.456);
      expect(dataView.getFloat64(0)).assertClose(123.456, 0.001);
      
      let threwError = false;
      try {
        dataView.getFloat64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_0900
     * @tc.desc    Verify getFloat64 with various Float64 values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(56);
      const dataView = new DataView(buffer);
      const testValues = [0.0, 1.0, -1.0, 123.456, -123.456, 1e10, 1e-10];
      
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setFloat64(i * 8, value);
        expect(dataView.getFloat64(i * 8)).assertClose(value, 0.001);
      }
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1000
     * @tc.desc    Verify getFloat64 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456, false);
      expect(dataView.getFloat64(0, false)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1100
     * @tc.desc    Verify getFloat64 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456, true);
      expect(dataView.getFloat64(0, true)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1200
     * @tc.desc    Verify getFloat64 with littleEndian and negative offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(-1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1300
     * @tc.desc    Verify getFloat64 with littleEndian and out of bounds offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1400
     * @tc.desc    Verify getFloat64 with littleEndian and int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat64Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      
      let threwError = false;
      try {
        dataView.getFloat64(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      
      threwError = false;
      try {
        dataView.getFloat64(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1500
     * @tc.desc    Verify getFloat64 with littleEndian and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetFloat64Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      
      let threwError = false;
      try {
        dataView.getFloat64(0, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat64Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_TEST_1600
     * @tc.desc    Verify getFloat64 with littleEndian and boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat64Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456, true);
      expect(dataView.getFloat64(0, true)).assertClose(123.456, 0.001);
      dataView.setFloat64(0, 456.789, false);
      expect(dataView.getFloat64(0, false)).assertClose(456.789, 0.001);
      let threwError = false;
      try {
        dataView.getFloat64(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
      threwError = false;
      try {
        dataView.getFloat64(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });
  })
}