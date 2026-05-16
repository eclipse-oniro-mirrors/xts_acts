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

export default function BuiltinsDataViewByteOffsetTest() {
  describe("BuiltinsDataViewByteOffsetTest", () => {
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
     * @tc.name    builtinsDataViewByteOffsetTest0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0100
     * @tc.desc    Verify byteOffset getter returns 0 when no offset is specified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewByteOffsetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);

      expect(dataView.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0200
     * @tc.desc    Verify byteOffset getter returns correct offset when specified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 3);

      expect(dataView.byteOffset).assertEqual(3);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0300
     * @tc.desc    Verify byteOffset getter returns correct offset when both offset and length are specified
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer, 2, 5);

      expect(dataView.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0400
     * @tc.desc    Verify multiple accesses to byteOffset property return the same value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4);

      const offset1 = dataView.byteOffset;
      const offset2 = dataView.byteOffset;
      const offset3 = dataView.byteOffset;

      expect(offset1).assertEqual(4);
      expect(offset2).assertEqual(4);
      expect(offset3).assertEqual(4);
      expect(offset1).assertEqual(offset2);
      expect(offset1).assertEqual(offset3);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0500
     * @tc.desc    Verify byteOffset property is not affected by data modifications
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 1, 6);

      const initialOffset = dataView.byteOffset;

      dataView.setUint8(0, 0xFF);
      dataView.setUint8(1, 0xEE);

      const afterModificationOffset = dataView.byteOffset;

      expect(initialOffset).assertEqual(1);
      expect(afterModificationOffset).assertEqual(1);
      expect(initialOffset).assertEqual(afterModificationOffset);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0600
     * @tc.desc    Verify different DataView instances have correct byteOffset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(12);

      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer, 2, 6);
      const view3 = new DataView(buffer, 8);

      expect(view1.byteOffset).assertEqual(0);
      expect(view2.byteOffset).assertEqual(2);
      expect(view3.byteOffset).assertEqual(8);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0700
     * @tc.desc    Verify the value of DataView byteOffset property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer, 2);
      const originalOffset = dataView.byteOffset;
      expect(originalOffset).assertEqual(2);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0800
     * @tc.desc    Verify byteOffset for empty buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewByteOffsetTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(0);
      const dataView = new DataView(buffer);

      expect(dataView.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_0900
     * @tc.desc    Verify byteOffset with maximum possible offset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsDataViewByteOffsetTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(10);
      const dataView = new DataView(buffer, 10, 0);

      expect(dataView.byteOffset).assertEqual(10);
      expect(dataView.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewByteOffsetTest1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_BYTE_OFFSET_TEST_1000
     * @tc.desc    Verify byteOffset relationship with byteLength and buffer size
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewByteOffsetTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer, 4, 8);

      expect(dataView.byteOffset).assertEqual(4);
      expect(dataView.byteLength).assertEqual(8);
      expect(dataView.byteOffset + dataView.byteLength).assertEqual(12);
      expect(dataView.byteOffset + dataView.byteLength).assertLessOrEqual(buffer.byteLength);
    });
  })
}