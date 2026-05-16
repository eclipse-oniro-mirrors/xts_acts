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

export default function BuiltinsDataViewByteLengthTest() {
  describe("BuiltinsDataViewByteLengthTest", () => {
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
     * @tc.name    builtinsDataViewByteLengthTest0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0100
     * @tc.desc    Verify byteLength getter returns correct length for full buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewByteLengthTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);

      expect(dataView.byteLength).assertEqual(8);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0200
     * @tc.desc    Verify byteLength getter returns correct length for sliced buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2, 4);

      expect(dataView.byteLength).assertEqual(4);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0300
     * @tc.desc    Verify byteLength getter returns correct length when only offset is specified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 3);

      expect(dataView.byteLength).assertEqual(5);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0400
     * @tc.desc    Verify byteLength getter returns 0 for empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewByteLengthTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);

      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0500
     * @tc.desc    Verify multiple accesses to byteLength property return the same value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);

      const length1 = dataView.byteLength;
      const length2 = dataView.byteLength;
      const length3 = dataView.byteLength;

      expect(length1).assertEqual(8);
      expect(length2).assertEqual(8);
      expect(length3).assertEqual(8);
      expect(length1).assertEqual(length2);
      expect(length1).assertEqual(length3);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0600
     * @tc.desc    Verify byteLength property is not affected by data modifications
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 1, 6);

      const initialLength = dataView.byteLength;

      dataView.setUint8(0, 0xFF);
      dataView.setUint8(1, 0xEE);

      const afterModificationLength = dataView.byteLength;

      expect(initialLength).assertEqual(6);
      expect(afterModificationLength).assertEqual(6);
      expect(initialLength).assertEqual(afterModificationLength);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0700
     * @tc.desc    Verify different DataView instances have correct byteLength
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);

      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer, 2, 5);
      const view3 = new DataView(buffer, 7);

      expect(view1.byteLength).assertEqual(10);
      expect(view2.byteLength).assertEqual(5);
      expect(view3.byteLength).assertEqual(3);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0800
     * @tc.desc    Verify byteLength for large buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewByteLengthTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const largeSize = 1024 * 1024;
      const buffer = new ArrayBuffer(largeSize);
      const dataView = new DataView(buffer, 1024, largeSize - 2048);

      expect(dataView.byteLength).assertEqual(largeSize - 2048);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_0900
     * @tc.desc    Verify the value of DataView byteLength property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 1, 6);
      const originalLength = dataView.byteLength;
      expect(originalLength).assertEqual(6);
    });

    /**
     * @tc.name    builtinsDataViewByteLengthTest1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_LENGTH_TEST_1000
     * @tc.desc    Verify byteLength matches buffer size when no offset or length specified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteLengthTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);
      const dataView = new DataView(buffer);

      expect(dataView.byteLength).assertEqual(buffer.byteLength);
      expect(dataView.byteLength).assertEqual(12);
    });
  })
}