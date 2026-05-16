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

export default function BuiltinsDataViewBufferTest() {
  describe("BuiltinsDataViewBufferTest", () => {
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

    const TEST_DATA = [0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xDE, 0xF0];

    /**
     * @tc.name    builtinsDataViewBufferTest0100
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0100
     * @tc.desc    Verify buffer getter returns the original ArrayBuffer object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsDataViewBufferTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalBuffer = new ArrayBuffer(8);
      const dataView = new DataView(originalBuffer);
      const returnedBuffer = dataView.buffer;

      expect(returnedBuffer).assertEqual(originalBuffer);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0200
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0200
     * @tc.desc    Verify ArrayBuffer obtained through buffer property maintains original data
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);
      const uint8View = new Uint8Array(originalBuffer);
      for (let i = 0; i < TEST_DATA.length; i++) {
        uint8View[i] = TEST_DATA[i];
      }

      const dataView = new DataView(originalBuffer);
      const returnedBuffer = dataView.buffer;
      const returnedUint8View = new Uint8Array(returnedBuffer);

      for (let i = 0; i < TEST_DATA.length; i++) {
        expect(returnedUint8View[i]).assertEqual(TEST_DATA[i]);
      }
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0300
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0300
     * @tc.desc    Verify modifications through DataView are reflected in buffer property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);
      const dataView = new DataView(originalBuffer);

      dataView.setUint8(0, 0xFF);
      dataView.setUint8(1, 0xEE);

      const returnedBuffer = dataView.buffer;
      const uint8View = new Uint8Array(returnedBuffer);

      expect(uint8View[0]).assertEqual(0xFF);
      expect(uint8View[1]).assertEqual(0xEE);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0400
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0400
     * @tc.desc    Verify modifications through buffer property are reflected in DataView
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);
      const dataView = new DataView(originalBuffer);

      const returnedBuffer = dataView.buffer;
      const uint8View = new Uint8Array(returnedBuffer);

      uint8View[2] = 0xAA;
      uint8View[3] = 0xBB;

      expect(dataView.getUint8(2)).assertEqual(0xAA);
      expect(dataView.getUint8(3)).assertEqual(0xBB);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0500
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0500
     * @tc.desc    Verify different DataView instances accessing the same buffer return the same ArrayBuffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);

      const dataView1 = new DataView(originalBuffer);
      const dataView2 = new DataView(originalBuffer, 2, 4);
      const dataView3 = new DataView(originalBuffer);

      expect(dataView1.buffer).assertEqual(dataView2.buffer);
      expect(dataView1.buffer).assertEqual(dataView3.buffer);
      expect(dataView2.buffer).assertEqual(dataView3.buffer);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0600
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0600
     * @tc.desc    Verify buffer property of sliced DataView returns the complete original buffer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);
      const uint8View = new Uint8Array(originalBuffer);
      for (let i = 0; i < TEST_DATA.length; i++) {
        uint8View[i] = TEST_DATA[i];
      }

      const slicedView = new DataView(originalBuffer, 2, 4);
      const fullBuffer = slicedView.buffer;

      expect(fullBuffer.byteLength).assertEqual(originalBuffer.byteLength);
      expect(fullBuffer).assertEqual(originalBuffer);

      const returnedUint8View = new Uint8Array(fullBuffer);
      for (let i = 0; i < TEST_DATA.length; i++) {
        expect(returnedUint8View[i]).assertEqual(TEST_DATA[i]);
      }
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0700
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0700
     * @tc.desc    Verify ArrayBuffer returned by buffer property has correct length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(16);
      const dataView = new DataView(originalBuffer);

      const returnedBuffer = dataView.buffer;

      expect(returnedBuffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0800
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0800
     * @tc.desc    Verify multiple accesses to buffer property return the same object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsDataViewBufferTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const originalBuffer = new ArrayBuffer(8);
      const dataView = new DataView(originalBuffer);

      const buffer1 = dataView.buffer;
      const buffer2 = dataView.buffer;
      const buffer3 = dataView.buffer;

      expect(buffer1).assertEqual(buffer2);
      expect(buffer1).assertEqual(buffer3);
      expect(buffer2).assertEqual(buffer3);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest0900
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_0900
     * @tc.desc    Verify DataView with empty ArrayBuffer works correctly
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewBufferTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyBuffer = new ArrayBuffer(0);
      const dataView = new DataView(emptyBuffer);

      const returnedBuffer = dataView.buffer;

      expect(returnedBuffer).assertEqual(emptyBuffer);
      expect(returnedBuffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest1000
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_1000
     * @tc.desc    Verify DataView with large ArrayBuffer works correctly
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsDataViewBufferTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const largeSize = 1024 * 1024;
      const largeBuffer = new ArrayBuffer(largeSize);
      const dataView = new DataView(largeBuffer);

      const returnedBuffer = dataView.buffer;

      expect(returnedBuffer).assertEqual(largeBuffer);
      expect(returnedBuffer.byteLength).assertEqual(largeSize);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest1100
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_1100
     * @tc.desc    Verify multiple DataViews modifying data through buffer property remain synchronized
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewBufferTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const buffer = new ArrayBuffer(4);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer, 1, 2);

      view1.setInt32(0, 0x12345678);

      const bufferFromView2 = view2.buffer;
      const uint8FromBuffer = new Uint8Array(bufferFromView2);

      expect(uint8FromBuffer[0]).assertEqual(0x12);
      expect(uint8FromBuffer[1]).assertEqual(0x34);
      expect(uint8FromBuffer[2]).assertEqual(0x56);
      expect(uint8FromBuffer[3]).assertEqual(0x78);

      const uint8FromView2 = new Uint8Array(bufferFromView2);
      uint8FromView2[1] = 0xFF;

      expect(view1.getUint8(1)).assertEqual(0xFF);
      expect(view2.getUint8(0)).assertEqual(0xFF);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest1200
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_1200
     * @tc.desc    Verify readonly nature of buffer property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewBufferTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const originalBuffer = new ArrayBuffer(8);
      const dataView = new DataView(originalBuffer);

      expect(dataView.buffer).assertEqual(originalBuffer);

      expect(dataView.buffer.byteLength).assertEqual(8);

      expect(dataView.buffer).assertEqual(originalBuffer);

      const buffer1 = dataView.buffer;
      const buffer2 = dataView.buffer;
      expect(buffer1).assertEqual(buffer2);
    });

    /**
     * @tc.name    builtinsDataViewBufferTest1300
     * @tc.number  SUB_BUILTINS_DATAVIEW_BUFFER_TEST_1300
     * @tc.desc    Verify all data can be read through buffer property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL4
     */
    it('builtinsDataViewBufferTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, () => {
      const originalBuffer = new ArrayBuffer(8);
      const uint8View = new Uint8Array(originalBuffer);
      for (let i = 0; i < TEST_DATA.length; i++) {
        uint8View[i] = TEST_DATA[i];
      }

      const partialView = new DataView(originalBuffer, 2, 4);

      const fullBuffer = partialView.buffer;
      const fullUint8View = new Uint8Array(fullBuffer);

      expect(fullUint8View[0]).assertEqual(TEST_DATA[0]);
      expect(fullUint8View[1]).assertEqual(TEST_DATA[1]);
      expect(fullUint8View[2]).assertEqual(TEST_DATA[2]);
      expect(fullUint8View[5]).assertEqual(TEST_DATA[5]);
      expect(fullUint8View[6]).assertEqual(TEST_DATA[6]);
      expect(fullUint8View[7]).assertEqual(TEST_DATA[7]);
    });
  });
}