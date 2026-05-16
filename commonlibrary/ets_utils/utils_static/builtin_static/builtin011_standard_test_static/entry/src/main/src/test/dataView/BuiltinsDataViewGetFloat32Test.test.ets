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

export default function BuiltinsDataViewGetFloat32Test() {
  describe("BuiltinsDataViewGetFloat32Test", () => {
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
     * @tc.name    builtinsDataViewGetFloat32Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0100
     * @tc.desc    Verify getFloat32 works correctly with positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetFloat32Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456);
      dataView.setFloat32(4, -789.012);
      expect(dataView.getFloat32(0)).assertClose(123.456, 0.001);
      expect(dataView.getFloat32(4)).assertClose(-789.012, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0200
     * @tc.desc    Verify getFloat32 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0300
     * @tc.desc    Verify getFloat32 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getFloat32(4);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0400
     * @tc.desc    Verify getFloat32 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat32Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.getFloat32(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0500
     * @tc.desc    Verify getFloat32 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat32Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getFloat32(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0600
     * @tc.desc    Verify getFloat32 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2, 4);
      const fullView = new DataView(buffer);
      fullView.setFloat32(2, 3.14159);
      expect(dataView.getFloat32(0)).assertClose(3.14159, 0.00001);
      let threwError = false;
      try {
        dataView.getFloat32(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0700
     * @tc.desc    Verify getFloat32 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetFloat32Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0800
     * @tc.desc    Verify getFloat32 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 2.71828);
      expect(dataView.getFloat32(0)).assertClose(2.71828, 0.00001);
      let threwError = false;
      try {
        dataView.getFloat32(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_0900
     * @tc.desc    Verify getFloat32 with various float values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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
     * @tc.name    builtinsDataViewGetFloat32Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1000
     * @tc.desc    Verify getFloat32 with NaN and Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetFloat32Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
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
     * @tc.name    builtinsDataViewGetFloat32Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1100
     * @tc.desc    Verify getFloat32 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, false);
      expect(dataView.getFloat32(0, false)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1200
     * @tc.desc    Verify getFloat32 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, true);
      expect(dataView.getFloat32(0, true)).assertClose(123.456, 0.001);
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1300
     * @tc.desc    Verify getFloat32 with littleEndian and negative offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(-1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1400
     * @tc.desc    Verify getFloat32 with littleEndian and out of bounds offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1500
     * @tc.desc    Verify getFloat32 with littleEndian and int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetFloat32Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getFloat32(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getFloat32(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1600
     * @tc.desc    Verify getFloat32 with littleEndian and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetFloat32Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getFloat32(0, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetFloat32Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_FLOAT_ThirtyTwo_TEST_1700
     * @tc.desc    Verify getFloat32 with littleEndian and boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetFloat32Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dataView = new DataView(buffer);
      dataView.setFloat32(0, 123.456, true);
      expect(dataView.getFloat32(0, true)).assertClose(123.456, 0.001);
      dataView.setFloat32(0, 123.456, false);
      expect(dataView.getFloat32(0, false)).assertClose(123.456, 0.001);
      let threwError = false;
      try {
        dataView.getFloat32(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getFloat32(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });
  })
}