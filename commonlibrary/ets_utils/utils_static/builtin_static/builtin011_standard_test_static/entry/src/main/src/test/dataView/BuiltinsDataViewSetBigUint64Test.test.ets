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

export default function BuiltinsDataViewSetBigUint64Test() {
  describe("BuiltinsDataViewSetBigUint64Test", () => {
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
     * @tc.name    builtinsDataViewSetBigUint64Test0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0100
     * @tc.desc    Verify setBigUint64 works correctly with positive byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewSetBigUint64Test0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, BigInt(0));
      dataView.setBigUint64(8, BigInt(1));
      expect(dataView.getBigUint64(0)).assertEqual(BigInt(0));
      expect(dataView.getBigUint64(8)).assertEqual(BigInt(1));
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0200
     * @tc.desc    Verify setBigUint64 throws RangeError for negative byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(-1, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0300
     * @tc.desc    Verify setBigUint64 throws RangeError for byteOffset exceeding buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setBigUint64(8, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0400
     * @tc.desc    Verify setBigUint64 with int min value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetBigUint64Test0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      let threwError = false;
      try {
        dataView.setBigUint64(intMin, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0500
     * @tc.desc    Verify setBigUint64 with int max value as byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetBigUint64Test0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setBigUint64(intMax, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0600
     * @tc.desc    Verify setBigUint64 with sliced DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);
      dataView.setBigUint64(0, BigInt(123));
      const fullView = new DataView(buffer);
      expect(fullView.getBigUint64(4)).assertEqual(BigInt(123));
      let threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0700
     * @tc.desc    Verify setBigUint64 with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetBigUint64Test0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(0, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0800
     * @tc.desc    Verify setBigUint64 with byteOffset at buffer boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, BigInt(123));
      expect(dataView.getBigUint64(0)).assertEqual(BigInt(123));
      let threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0));
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_0900
     * @tc.desc    Verify setBigUint64 with various BigUint64 values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(40);
      const dataView = new DataView(buffer);
      const testValues = [BigInt(0), BigInt(1), BigInt(1234567890), BigInt('0x7FFFFFFFFFFFFFFF'), BigInt('0xFFFFFFFFFFFFFFFF')];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setBigUint64(i * 8, value);
        expect(dataView.getBigUint64(i * 8)).assertEqual(value);
      }
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1000
     * @tc.desc    Verify setBigUint64 with uint64 boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(24);
      const dataView = new DataView(buffer);
      const uint64Min = BigInt(0);
      const uint64Max = BigInt('0xFFFFFFFFFFFFFFFF');
      const midValue = BigInt('0x7FFFFFFFFFFFFFFF');
      dataView.setBigUint64(0, uint64Min);
      dataView.setBigUint64(8, uint64Max);
      dataView.setBigUint64(16, midValue);
      expect(dataView.getBigUint64(0)).assertEqual(uint64Min);
      expect(dataView.getBigUint64(8)).assertEqual(uint64Max);
      expect(dataView.getBigUint64(16)).assertEqual(midValue);
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1100
     * @tc.desc    Verify setBigUint64 with littleEndian parameter (big-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, BigInt(123), false);
      expect(dataView.getBigUint64(0, false)).assertEqual(BigInt(123));
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1200
     * @tc.desc    Verify setBigUint64 with littleEndian parameter (little-endian)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, BigInt(123), true);
      expect(dataView.getBigUint64(0, true)).assertEqual(BigInt(123));
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1300
     * @tc.desc    Verify setBigUint64 with littleEndian and negative offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(-1, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1400
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1400
     * @tc.desc    Verify setBigUint64 with littleEndian and out of bounds offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1500
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1500
     * @tc.desc    Verify setBigUint64 with littleEndian and int boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewSetBigUint64Test1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const intMin = -2147483648;
      const intMax = 2147483647;
      let threwError = false;
      try {
        dataView.setBigUint64(intMin, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setBigUint64(intMax, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1600
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1600
     * @tc.desc    Verify setBigUint64 with littleEndian and empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewSetBigUint64Test1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      let threwError = false;
      try {
        dataView.setBigUint64(0, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1700
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1700
     * @tc.desc    Verify setBigUint64 with littleEndian and boundary offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setBigUint64(0, BigInt(123), true);
      expect(dataView.getBigUint64(0, true)).assertEqual(BigInt(123));
      dataView.setBigUint64(0, BigInt(456), false);
      expect(dataView.getBigUint64(0, false)).assertEqual(BigInt(456));
      let threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0), true);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        dataView.setBigUint64(1, BigInt(0), false);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1800
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1800
     * @tc.desc    Verify setBigUint64 with 9007199254740991n as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      const testValue = 9007199254740991n;
      dataView.setBigUint64(0, testValue);
      expect(dataView.getBigUint64(0)).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test1900
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_1900
     * @tc.desc    Verify setBigUint64 with 9007199254740991n and different endianness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);
      const testValue = 9007199254740991n;
      dataView.setBigUint64(0, testValue, false);
      expect(dataView.getBigUint64(0, false)).assertEqual(testValue);
      dataView.setBigUint64(8, testValue, true);
      expect(dataView.getBigUint64(8, true)).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsDataViewSetBigUint64Test2000
     * @tc.number  SUB_BUILTINS_DATAVIEW_SET_BIGUINT_TEST_2000
     * @tc.desc    Verify setBigUint64 with various bigint values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewSetBigUint64Test2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(40);
      const dataView = new DataView(buffer);
      const testValues = [0n, 1n, 1234567890n, 9007199254740991n];
      for (let i = 0; i < testValues.length; i++) {
        const value = testValues[i];
        dataView.setBigUint64(i * 8, value);
        expect(dataView.getBigUint64(i * 8)).assertEqual(value);
      }
    });
  })
}