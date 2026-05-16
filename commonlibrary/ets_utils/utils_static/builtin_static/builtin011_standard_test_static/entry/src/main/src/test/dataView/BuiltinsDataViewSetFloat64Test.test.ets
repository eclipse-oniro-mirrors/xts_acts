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

export default function BuiltinsDataViewSetFloat64Test() {
  describe("BuiltinsDataViewSetFloat64Test", () => {
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
     * @tc.name    builtinsDataViewSetFloat64Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0100
     * @tc.desc    Verify setFloat64 works correctly with positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetFloat64Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 0.0);
      dataView.setFloat64(8, 1.0);
      expect(dataView.getFloat64(0)).assertEqual(0.0);
      expect(dataView.getFloat64(8)).assertEqual(1.0);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0200
     * @tc.desc    Verify setFloat64 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat64(-1, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0300
     * @tc.desc    Verify setFloat64 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat64(1, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setFloat64(8, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0400
     * @tc.desc    Verify setFloat64 with Infinity value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, Infinity);
      expect(dataView.getFloat64(0)).assertEqual(Infinity);
      dataView.setFloat64(8, -Infinity);
      expect(dataView.getFloat64(8)).assertEqual(-Infinity);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0500
     * @tc.desc    Verify setFloat64 with Math.floor(1.5) value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const testValue = Math.floor(1.5);
      dataView.setFloat64(0, testValue);
      expect(dataView.getFloat64(0)).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0600
     * @tc.desc    Verify setFloat64 with various number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(72);
      const dataView = new DataView(buffer);
      const testValues = [
        0.0,
        1.0,
        -1.0,
        123.456,
        -123.456,
        1e308,
        -1e308,
        1e-308,
        -1e-308
      ];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setFloat64(i * 8, value);
        expect(dataView.getFloat64(i * 8)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0700
     * @tc.desc    Verify setFloat64 with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      const float64Max = Number.MAX_VALUE;
      const float64Min = -Number.MAX_VALUE;
      const float64Epsilon = Number.EPSILON;
      dataView.setFloat64(0, float64Max);
      dataView.setFloat64(8, float64Min);
      dataView.setFloat64(16, float64Epsilon);
      expect(dataView.getFloat64(0)).assertEqual(float64Max);
      expect(dataView.getFloat64(8)).assertEqual(float64Min);
      expect(dataView.getFloat64(16)).assertEqual(float64Epsilon);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0800
     * @tc.desc    Verify setFloat64 with NaN value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, NaN);
      const result = dataView.getFloat64(0);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_0900
     * @tc.desc    Verify setFloat64 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456, false);
      expect(dataView.getFloat64(0, false)).assertEqual(123.456);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1000
     * @tc.desc    Verify setFloat64 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456, true);
      expect(dataView.getFloat64(0, true)).assertEqual(123.456);
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1100
     * @tc.desc    Verify setFloat64 with int boundary values as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetFloat64Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setFloat64(intMin, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setFloat64(intMax, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1200
     * @tc.desc    Verify setFloat64 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetFloat64Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setFloat64(0, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1300
     * @tc.desc    Verify setFloat64 with boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat64(0, 123.456);
      expect(dataView.getFloat64(0)).assertEqual(123.456);
      let threwError = false;
      try {
        dataView.setFloat64(1, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1400
     * @tc.desc    Verify setFloat64 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);
      dataView.setFloat64(0, 123.456);
      const fullView = new DataView(buffer);
      expect(fullView.getFloat64(4)).assertEqual(123.456);
      let threwError = false;
      try {
        dataView.setFloat64(1, 0.0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetFloat64Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_FLOAT_TEST_1500
     * @tc.desc    Verify setFloat64 with repeated set and get operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetFloat64Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const testValues = [0.0, 1.0, -1.0, 123.456, -123.456];
      for (const value of testValues) {
        dataView.setFloat64(0, value);
        expect(dataView.getFloat64(0)).assertEqual(value);
      }
    });
  })
}