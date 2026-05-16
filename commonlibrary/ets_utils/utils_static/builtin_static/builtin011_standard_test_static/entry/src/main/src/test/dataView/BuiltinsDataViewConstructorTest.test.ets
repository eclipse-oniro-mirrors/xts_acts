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

export default function BuiltinsDataViewConstructorTest() {
  describe("BuiltinsDataViewConstructorTest", () => {
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
     * @tc.name    builtinsDataViewConstructorTest0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify constructor with only buffer parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(0);
      expect(dataView.byteLength).assertEqual(8);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify constructor with buffer and byteOffset parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(2);
      expect(dataView.byteLength).assertEqual(6);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify constructor with all three parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer, 2, 5);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(2);
      expect(dataView.byteLength).assertEqual(5);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify constructor with negative byteOffset throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      let threwError = false;
      try {
        new DataView(buffer, -1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify constructor with negative byteLength throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      let threwError = false;
      try {
        new DataView(buffer, 0, -1);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify constructor with boundary errors throws RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const buffer = new ArrayBuffer(8);

      let threwError = false;
      try {
        new DataView(buffer, 9);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        new DataView(buffer, 2, 7);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify constructor with integer extreme values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const buffer = new ArrayBuffer(8);
      const intMin = -2147483648;
      const intMax = 2147483647;

      let threwError = false;
      try {
        new DataView(buffer, intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        new DataView(buffer, intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        new DataView(buffer, 0, intMin);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();

      threwError = false;
      try {
        new DataView(buffer, 0, intMax);
      } catch (e) {
        threwError = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(threwError).assertTrue();
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify constructor with byteOffset equal to buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 8, 0);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(8);
      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify constructor with zero byteLength
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2, 0);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(2);
      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify constructor with empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(0);
      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify constructor with empty buffer and zero offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer, 0, 0);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(0);
      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify constructor with large valid byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const largeSize = 1024 * 1024;
      const buffer = new ArrayBuffer(largeSize);
      const offset = largeSize / 2;
      const length = largeSize / 4;
      const dataView = new DataView(buffer, offset, length);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteOffset).assertEqual(offset);
      expect(dataView.byteLength).assertEqual(length);
    });

    /**
     * @tc.name    builtinsDataViewConstructorTest1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify constructor with boundary and edge case values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewConstructorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const buffer = new ArrayBuffer(10);

      const intOffsets = [0, 1, 9, 10, 11];
      for (let i = 0; i < intOffsets.length; i++) {
        const offset = intOffsets[i];
        try {
          const dataView = new DataView(buffer, offset);
          if (offset >= 0 && offset <= 10) {
            expect(dataView.byteOffset).assertEqual(offset);
          }
        } catch (e) {
          expect(e instanceof RangeError).assertTrue();
        }
      }

      const intLengths = [0, 1, 10, 11, -1];
      for (let i = 0; i < intLengths.length; i++) {
        const length = intLengths[i];
        try {
          const dataView = new DataView(buffer, 0, length);
          if (length >= 0 && length <= 10) {
            expect(dataView.byteLength).assertEqual(length);
          }
        } catch (e) {
          expect(e instanceof RangeError).assertTrue();
        }
      }

      const largeOffsets = [2147483647, 2147483646, -2147483648, -2147483647];
      for (let i = 0; i < largeOffsets.length; i++) {
        const offset = largeOffsets[i];
        let threwError = false;
        try {
          new DataView(buffer, offset);
        } catch (e) {
          threwError = true;
          expect(e instanceof RangeError).assertTrue();
        }
        expect(threwError).assertTrue();
      }

      const testValues = [0, 1, -1, 9, 10, 11];
      for (let i = 0; i < testValues.length; i++) {
        const offset = testValues[i];
        try {
          const dataView = new DataView(buffer, offset);
          if (offset >= 0 && offset <= 10) {
            expect(dataView.byteOffset).assertEqual(offset);
          }
        } catch (e) {
          expect(e instanceof RangeError).assertTrue();
        }
      }
    });

  })
}