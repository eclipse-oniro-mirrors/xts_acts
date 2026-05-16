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

export default function BuiltinsDataViewGetBigInt64Test() {
  describe("BuiltinsDataViewGetBigInt64Test", () => {
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
     * @tc.name    builtinsDataViewGetBigInt64Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0100
     * @tc.desc    Verify getBigInt64 works correctly with positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewGetBigInt64Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'));
      dataView.setBigInt64(8, -BigInt('0x123456789ABCDEF'));
      expect(dataView.getBigInt64(0)).assertEqual(BigInt('0x123456789ABCDEF'));
      expect(dataView.getBigInt64(8)).assertEqual(-BigInt('0x123456789ABCDEF'));
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0200
     * @tc.desc    Verify getBigInt64 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(-1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0300
     * @tc.desc    Verify getBigInt64 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getBigInt64(8);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0400
     * @tc.desc    Verify getBigInt64 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetBigInt64Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.getBigInt64(intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0500
     * @tc.desc    Verify getBigInt64 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetBigInt64Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getBigInt64(intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0600
     * @tc.desc    Verify getBigInt64 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);
      const fullView = new DataView(buffer);
      fullView.setBigInt64(4, BigInt('0x123456789ABCDEF'));
      expect(dataView.getBigInt64(0)).assertEqual(BigInt('0x123456789ABCDEF'));
      let threwError = false;
      try {
        dataView.getBigInt64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0700
     * @tc.desc    Verify getBigInt64 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetBigInt64Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(0);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0800
     * @tc.desc    Verify getBigInt64 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'));
      expect(dataView.getBigInt64(0)).assertEqual(BigInt('0x123456789ABCDEF'));
      let threwError = false;
      try {
        dataView.getBigInt64(1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_0900
     * @tc.desc    Verify getBigInt64 with various BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(56);
      const dataView = new DataView(buffer);
      const testValues = [0n, 1n, -1n, BigInt('0x7FFFFFFFFFFFFFFF'), -BigInt('0x8000000000000000'), BigInt('0x123456789ABCDEF'), -BigInt('0x123456789ABCDEF')];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setBigInt64(i * 8, value);
        expect(dataView.getBigInt64(i * 8)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1000
     * @tc.desc    Verify getBigInt64 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'), false);
      expect(dataView.getBigInt64(0, false)).assertEqual(BigInt('0x123456789ABCDEF'));
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1100
     * @tc.desc    Verify getBigInt64 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'), true);
      expect(dataView.getBigInt64(0, true)).assertEqual(BigInt('0x123456789ABCDEF'));
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1200
     * @tc.desc    Verify getBigInt64 with littleEndian and negative offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(-1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1300
     * @tc.desc    Verify getBigInt64 with littleEndian and out of bounds offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1400
     * @tc.desc    Verify getBigInt64 with littleEndian and int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewGetBigInt64Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.getBigInt64(intMin, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getBigInt64(intMax, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1500
     * @tc.desc    Verify getBigInt64 with littleEndian and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewGetBigInt64Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.getBigInt64(0, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewGetBigInt64Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_GET_BIGINT_SixtyFour_TEST_1600
     * @tc.desc    Verify getBigInt64 with littleEndian and boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewGetBigInt64Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'), true);
      expect(dataView.getBigInt64(0, true)).assertEqual(BigInt('0x123456789ABCDEF'));
      dataView.setBigInt64(0, BigInt('0x123456789ABCDEF'), false);
      expect(dataView.getBigInt64(0, false)).assertEqual(BigInt('0x123456789ABCDEF'));
      let threwError = false;
      try {
        dataView.getBigInt64(1, true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.getBigInt64(1, false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });
  })
}