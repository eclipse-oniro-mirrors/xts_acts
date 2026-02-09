/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'


export default function typeArrayInt8ArrayTest() {
  describe('TypeArrayInt8ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   TypeArrayInt8ArrayTest0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0001
     * @tc.desc   Verify basic properties of Int8Array constructed with ArrayBuffer (offset 0, length 8)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 0, 8);
      let errorMsg: string = '';

      if (int8Arr.buffer !== buf) {
        errorMsg = 'Buffer reference mismatch';
      } else if (int8Arr.byteOffset !==
        0) {
        errorMsg = 'byteOffset should be 0';
      } else if (int8Arr.byteLength !== 8) {
        errorMsg =
          'byteLength should be 8';
      } else if (int8Arr.length !== 8) {
        errorMsg = 'length should be 8';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== 0) {
            errorMsg = `Initial value at index ${i} should be 0`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0002
     * @tc.desc   Verify Int8Array basic properties with ArrayBuffer (offset 2, length 3)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 3);
      let errorMsg: string = '';

      if (int8Arr.byteOffset !== 2) {
        errorMsg = 'byteOffset should be 2';
      } else if (int8Arr.byteLength !== 3) {
        errorMsg =
          'byteLength should be 3';
      } else if (int8Arr.length !== 3) {
        errorMsg =
          'length should be 3';
      } else if (int8Arr.buffer !== buf) {
        errorMsg = 'Buffer reference mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0003
     * @tc.desc   Verify Int8Array initial values are all 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== 0) {
          errorMsg = `Initial value at index ${i} is not 0`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0004
     * @tc.desc   Verify Int8Array stores legal maximum value (127) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const maxValue: number = 127;
      int8Arr[0] = maxValue;
      let errorMsg: string = '';

      if (int8Arr[0] !== maxValue) {
        errorMsg = `Should store max value ${maxValue}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0005
     * @tc.desc   Verify Int8Array stores legal minimum value (-128) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const minValue: number = -128;
      int8Arr[0] = minValue;
      let errorMsg: string = '';

      if (int8Arr[0] !== minValue) {
        errorMsg = `Should store min value ${minValue}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0006
     * @tc.desc   Verify Int8Array overflows to -128 when value is 128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 128;
      const expectedVal: number = -128;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0007
     * @tc.desc   Verify Int8Array overflows to 127 when value is -129
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = -129;
      const expectedVal: number = 127;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0008
     * @tc.desc   Verify Int8Array stores 0 correctly (middle of range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const testVal: number = 0;
      int8Arr[0] = testVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== testVal) {
        errorMsg = `Should store value ${testVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0009
     * @tc.desc   Verify Int8Array set method with plain array (start index 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const int8Arr: Int8Array = new Int8Array(buf);
      const sourceArr: number[] = [10, 20, 30, 40, 50];
      int8Arr.set(sourceArr);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== sourceArr[i]) {
          errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${sourceArr[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0010
     * @tc.desc   Verify Int8Array set method with plain array (start index 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const int8Arr: Int8Array = new Int8Array(buf);
      const sourceArr: number[] = [40, 50];
      const startIdx: number = 2;
      int8Arr.set(sourceArr, startIdx);
      let errorMsg: string = '';

      if (int8Arr[startIdx] !== 40) {
        errorMsg = `Value at index ${startIdx} should be 40`;
      } else if (int8Arr[startIdx +
        1] !== 50) {
        errorMsg = `Value at index ${startIdx + 1} should be 50`;
      } else if (int8Arr[0] !== 0) {
        errorMsg =
          'Unassigned index 0 should be 0';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0011
     * @tc.desc   Verify Int8Array set method with Uint8Array (start index 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      const uint8Source: Uint8Array = new Uint8Array([60, 70]);
      const startIdx: number = 1;
      int8Arr.set(uint8Source, startIdx);
      let errorMsg: string = '';

      if (int8Arr[startIdx] !== 60) {
        errorMsg = `Value at index ${startIdx} should be 60`;
      } else if (int8Arr[startIdx +
        1] !== 70) {
        errorMsg = `Value at index ${startIdx + 1} should be 70`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0012
     * @tc.desc   Verify Int8Array set method truncates Int16Array values to 8-bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      const int16Source: Int16Array = new Int16Array([200, 300]);
      int8Arr.set(int16Source);
      let errorMsg: string = '';

      if (int8Arr[0] !== -56) {
        errorMsg = 'Truncated value -56 mismatch';
      } else if (int8Arr[1] !== 44) {
        errorMsg =
          'Truncated value 300 should be 44';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0013
     * @tc.desc   Verify Int8Array set method throws RangeError when source length exceeds view
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      const sourceArr: number[] = [1, 2, 3, 4];
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        int8Arr.set(sourceArr);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for excess source length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0014
     * @tc.desc   Verify Int8Array subarray shares buffer with original view (modify subarray)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([1, 2, 3, 4, 5]);
      const subArr: Int8Array = int8Arr.subarray(1, 4);
      subArr[0] = 20;
      let errorMsg: string = '';

      if (int8Arr[1] !== 20) {
        errorMsg =
          'Original view not updated by subarray modification';
      } else if (subArr.length !== 3) {
        errorMsg =
          'Subarray length should be 3';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0015
     * @tc.desc   Verify Int8Array subarray with start index 0 (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30]);
      const subArr: Int8Array = int8Arr.subarray(0);
      let errorMsg: string = '';

      if (subArr.length !== int8Arr.length) {
        errorMsg = 'Subarray length should match original';
      } else if (subArr[2] !==
        30) {
        errorMsg = 'Subarray last value should be 30';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0016
     * @tc.desc   Verify Int8Array subarray returns empty view when start=end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 6, 7]);
      const subArr: Int8Array = int8Arr.subarray(2, 2);
      let errorMsg: string = '';

      if (subArr.length !== 0) {
        errorMsg = 'Subarray should be empty when start=end';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0018
     * @tc.desc   Verify DataView reads Int8Array shared ArrayBuffer (offset 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';

      if (dv.getInt8(0) !== -10) {
        errorMsg = 'DataView read offset 0 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0019
     * @tc.desc   Verify DataView reads Int8Array shared ArrayBuffer (offset 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';

      if (dv.getInt8(2) !== -30) {
        errorMsg = 'DataView read offset 2 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0020
     * @tc.desc   Verify DataView modifies Int8Array shared ArrayBuffer (offset 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      const modifyVal: number = 50;
      dv.setInt8(1, modifyVal);
      let errorMsg: string = '';

      if (int8Arr[1] !== modifyVal) {
        errorMsg = 'Int8Array not updated by DataView';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0021
     * @tc.desc   Verify bidirectional sync between DataView and Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';
      int8Arr[0] = 40;
      if (dv.getInt8(0) !== 40) {
        errorMsg = 'DataView not synced from Int8Array';
      } else {
        dv.setInt8(1, -60);
        if (int8Arr[1] !== -60) {
          errorMsg = 'Int8Array not synced from DataView';
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0022
     * @tc.desc   Verify Int8Array converts to plain array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5, 0, 5]);
      const plainArr: number[] = Array.from(int8Arr);
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr[0] !==
        -5) {
        errorMsg = 'Converted value at index 0 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0023
     * @tc.desc   Verify Int8Array converts to plain array via spread syntax
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, 20, -30]);
      const plainArr: number[] = [...int8Arr];
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr[2] !==
        -30) {
        errorMsg = 'Converted value at index 2 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0024
     * @tc.desc   Verify modifying converted plain array does not affect original Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2]);
      const plainArr: number[] = Array.from(int8Arr);
      plainArr[0] = 100;
      let errorMsg: string = '';

      if (int8Arr[0] !== 1) {
        errorMsg = 'Original Int8Array should remain unchanged';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0025
     * @tc.desc   Verify Int8Array converts to plain array with map via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      const plainArr: number[] = Array.from(int8Arr, x => x * 2);
      let errorMsg: string = '';

      if (plainArr[1] !== 8) {
        errorMsg = 'Mapped value at index 1 should be 8';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0026
     * @tc.desc   Verify plain array with overflow values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [130, -130];
      const int8Arr: Int8Array = new Int8Array(plainArr);
      let errorMsg: string = '';

      if (int8Arr[0] !== -126) {
        errorMsg = '130 should convert to -128';
      } else if (int8Arr[1] !== 126) {
        errorMsg =
          '-130 should convert to 126';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0027
     * @tc.desc   Verify Int8Array returns undefined for negative index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[-1];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'Negative index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0028
     * @tc.desc   Verify Int8Array returns undefined for out-of-bounds index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[5];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'Out-of-bounds index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0029
     * @tc.desc   Verify Int8Array ignores assignment to negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20]);
      const initialVal0: number = int8Arr[0];
      const initialVal1: number = int8Arr[1];
      int8Arr[-1] = 30;
      let errorMsg: string = '';

      if (int8Arr[0] !== initialVal0 || int8Arr[1] !== initialVal1) {
        errorMsg =
          'Negative index assignment should be ignored';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0030
     * @tc.desc   Verify Int8Array ignores assignment to out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20]);
      const initialVal0: number = int8Arr[0];
      const initialVal1: number = int8Arr[1];
      int8Arr[5] = 30;
      let errorMsg: string = '';

      if (int8Arr[0] !== initialVal0 || int8Arr[1] !== initialVal1) {
        errorMsg =
          'Out-of-bounds index assignment should be ignored';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0031
     * @tc.desc   Verify Int8Array returns undefined for NaN index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[NaN as number];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'NaN index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })


    /**
     * @tc.name   TypeArrayInt8ArrayTest0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0040
     * @tc.desc   Verify Int8Array throws RangeError when offset exceeds buffer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new Int8Array(buf, 5, 1);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for invalid offset';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0041
     * @tc.desc   Verify Int8Array throws RangeError when offset+length exceeds buffer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new Int8Array(buf, 2, 3);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for invalid offset+length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0042
     * @tc.desc   Verify Int8Array forEach method iterates all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      let sum: number = 0;
      int8Arr.forEach(val => sum += val);
      let errorMsg: string = '';

      if (sum !== 12) {
        errorMsg = 'forEach should sum all elements to 12';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0043
     * @tc.desc   Verify Int8Array map method returns new Int8Array with mapped values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3]);
      const mappedArr: Int8Array = int8Arr.map(val => val * 2);
      let errorMsg: string = '';

      if (!(mappedArr instanceof Int8Array)) {
        errorMsg = 'map should return Int8Array';
      } else if (mappedArr[1] !==
        4) {
        errorMsg = 'mapped value at index 1 should be 4';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0044
     * @tc.desc   Verify Int8Array filter method returns new Int8Array with filtered values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5, 0, 5, 10]);
      const filteredArr: Int8Array = int8Arr.filter(val => val > 0);
      let errorMsg: string = '';

      if (filteredArr.length !== 2) {
        errorMsg = 'filtered array length should be 2';
      } else if (filteredArr[0] !==
        5) {
        errorMsg = 'first filtered value should be 5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0045
     * @tc.desc   Verify Int8Array find method returns first matching value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, 20, -30, 40]);
      const foundVal: number | undefined = int8Arr.find(val => val < -20);
      let errorMsg: string = '';

      if (foundVal !== -30) {
        errorMsg = 'find should return first value < -20 (-30)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0046
     * @tc.desc   Verify Int8Array findIndex method returns first matching index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, 20, -30, 40]);
      const foundIdx: number = int8Arr.findIndex(val => val > 20);
      let errorMsg: string = '';

      if (foundIdx !== 3) {
        errorMsg = 'findIndex should return index 3 (value 40)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0047
     * @tc.desc   Verify Int8Array every method checks all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-50, -30, -10]);
      const allNegative: boolean = int8Arr.every(val => val < 0);
      let errorMsg: string = '';

      if (!allNegative) {
        errorMsg = 'every should return true for all negative values';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0048
     * @tc.desc   Verify Int8Array some method checks at least one element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-50, -30, 10]);
      const hasPositive: boolean = int8Arr.some(val => val > 0);
      let errorMsg: string = '';

      if (!hasPositive) {
        errorMsg = 'some should return true for at least one positive value';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0049
     * @tc.desc   Verify Int8Array reduce method accumulates values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const total: number = int8Arr.reduce((acc, val) => acc + val, 0);
      let errorMsg: string = '';

      if (total !== 10) {
        errorMsg = 'reduce should accumulate to 10';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0050
     * @tc.desc   Verify Int8Array includes method checks element existence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-127, 0, 127]);
      const has127: boolean = int8Arr.includes(127);
      const has128: boolean = int8Arr.includes(128);
      let errorMsg: string = '';

      if (!has127) {
        errorMsg = 'includes should find 127';
      } else if (has128) {
        errorMsg = 'includes should not find 128';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0051
     * @tc.desc   Verify Int8Array constructed with plain array (length 3)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sourceArr: number[] = [10, 20, 30];
      const int8Arr: Int8Array = new Int8Array(sourceArr);
      let errorMsg: string = '';

      if (int8Arr.length !== sourceArr.length) {
        errorMsg = 'Length mismatch with source array';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== sourceArr[i]) {
            errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${sourceArr[i]}`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0052
     * @tc.desc   Verify Int8Array constructed with Uint8Array (valid range values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const uint8Source: Uint8Array = new Uint8Array([120, 60, 90]);
      const int8Arr: Int8Array = new Int8Array(uint8Source);
      let errorMsg: string = '';

      if (int8Arr.length !== uint8Source.length) {
        errorMsg = 'Length mismatch with Uint8Array';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== uint8Source[i]) {
            errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${uint8Source[i]}`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0053
     * @tc.desc   Verify Int8Array constructed with Int16Array (truncated to 8-bit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int16Source: Int16Array = new Int16Array([250, 300]);
      const int8Arr: Int8Array = new Int8Array(int16Source);
      let errorMsg: string = '';

      if (int8Arr[0] !== -6) {
        errorMsg = 'Truncated value -6 mismatch';
      } else if (int8Arr[1] !== 44) {
        errorMsg =
          'Truncated value 300 should be 44';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0055
     * @tc.desc   Verify Int8Array byteLength property matches length × 1 (1 byte per element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLengths: number[] = [1, 5, 10];
      let errorMsg: string = '';

      for (const len of testLengths) {
        const int8Arr: Int8Array = new Int8Array(len);
        if (int8Arr.byteLength !== len * 1) {
          errorMsg = `byteLength mismatch for length ${len}: ${int8Arr.byteLength} vs ${len * 1}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0056
     * @tc.desc   Verify Int8Array byteOffset property is correct for offset buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const offsets: number[] = [1, 3, 5];
      let errorMsg: string = '';

      for (const offset of offsets) {
        const int8Arr: Int8Array = new Int8Array(buf, offset, 2);
        if (int8Arr.byteOffset !== offset) {
          errorMsg = `byteOffset mismatch for offset ${offset}: ${int8Arr.byteOffset} vs ${offset}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0057
     * @tc.desc   Verify Int8Array set method with empty source array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([10, 20, 30, 40]);
      const originalVals: number[] = [...int8Arr];
      const emptySource: number[] = [];

      int8Arr.set(emptySource);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after set with empty array`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0059
     * @tc.desc   Verify Int8Array subarray with negative start index (treats as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(-2, 3);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
      expect(subArr[2]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0060
     * @tc.desc   Verify Int8Array subarray with end index exceeding view length (treats as view length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(1, 10);
      let errorMsg: string = '';

      if (subArr.length !== 3) {
        errorMsg = 'Subarray length should be 3 (end=10 treated as 4)';
      } else if (subArr[0] !==
        20 || subArr[2] !== 40) {
        errorMsg = 'Subarray values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0061
     * @tc.desc   Verify DataView reads Int8Array buffer with non-zero byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 4);
      int8Arr.set([-5, 15, -25, 35]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';


      if (dv.getInt8(2) !== -5) {
        errorMsg = 'DataView read offset 2 mismatch';
      } else if (dv.getInt8(5) !==
        35) {
        errorMsg = 'DataView read offset 5 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0062
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0062
     * @tc.desc   Verify DataView writes to Int8Array buffer with non-zero byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 3, 3);
      const dv: DataView = new DataView(buf);
      dv.setInt8(3, 40);
      dv.setInt8(5, 60);
      let errorMsg: string = '';

      if (int8Arr[0] !== 40) {
        errorMsg = 'Int8Array[0] mismatch after DataView write';
      } else if (int8Arr[2] !==
        60) {
        errorMsg = 'Int8Array[2] mismatch after DataView write';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0063
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0063
     * @tc.desc   Verify Int8Array converts to plain array with Array.from (empty Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const plainArr: number[] = Array.from(int8Arr);
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr.length !==
        0) {
        errorMsg = 'Converted array should be empty';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0064
     * @tc.desc   Verify Int8Array converts to plain array with spread syntax (empty Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const plainArr: number[] = [...int8Arr];
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr.length !==
        0) {
        errorMsg = 'Converted array should be empty';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0065
     * @tc.desc   Verify plain array with zero values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const plainArr: number[] = [0, 0, 0];
      const int8Arr: Int8Array = new Int8Array(plainArr);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== 0) {
          errorMsg = `Value at index ${i} should be 0`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0066
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0066
     * @tc.desc   Verify Int8Array index access with valid integer index (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-128, -64, 0, 64, 127]);
      const testIndices: number[] = [0, 2, 4];
      const expectedVals: number[] = [-128, 0, 127];
      let errorMsg: string = '';

      for (let i = 0; i < testIndices.length; i++) {
        const idx: number = testIndices[i];
        if (int8Arr[idx] !== expectedVals[i]) {
          errorMsg = `Value at index ${idx} mismatch: ${int8Arr[idx]} vs ${expectedVals[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0067
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0067
     * @tc.desc   Verify Int8Array assignment with valid integer index (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(5);
      const assignIndices: number[] = [0, 2, 4];
      const assignVals: number[] = [-128, 0, 127];
      let errorMsg: string = '';

      for (let i = 0; i < assignIndices.length; i++) {
        const idx: number = assignIndices[i];
        int8Arr[idx] = assignVals[i];
        if (int8Arr[idx] !== assignVals[i]) {
          errorMsg = `Assignment at index ${idx} failed: ${int8Arr[idx]} vs ${assignVals[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0068
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0068
     * @tc.desc   Verify Int8Array forEach method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 15]);

      interface GeneratedTypeLiteralInterface_1 {
        val: number;
        idx: number;
        arr: Int8Array;
      }

      const log: GeneratedTypeLiteralInterface_1[] = [];
      int8Arr.forEach((val, idx, arr) => {
        log.push({ val, idx, arr });
      });
      let errorMsg: string = '';

      if (log.length !== int8Arr.length) {
        errorMsg = 'forEach should iterate all elements';
      } else if (log[1].val !==
        10 || log[1].idx !== 1) {
        errorMsg = 'forEach callback params mismatch at index 1';
      } else if (log[0].arr !==
        int8Arr) {
        errorMsg = 'forEach callback array param should be original Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0069
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0069
     * @tc.desc   Verify Int8Array map method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      const mappedVals: number[] = [];
      int8Arr.map((val, _idx) => {
        mappedVals.push(val * 2);
        return val * 2;
      });
      let errorMsg: string = '';

      if (mappedVals[0] !== 4 || mappedVals[2] !== 12) {
        errorMsg =
          'map callback val param mismatch';
      } else if (mappedVals.length !== int8Arr.length) {
        errorMsg =
          'map should process all elements';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0070
     * @tc.desc   Verify Int8Array filter method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-3, 0, 3, -6, 6]);
      const filteredIndices: number[] = [];
      int8Arr.filter((val, idx) => {
        if (val > 0) {
          filteredIndices.push(idx);
        }
        return val > 0;
      });
      let errorMsg: string = '';

      if (filteredIndices.join(',') !== '2,4') {
        errorMsg = 'filter callback idx param mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0071
     * @tc.desc   Verify Int8Array find method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let foundIdx: number | undefined;
      const targetVal: number = 30;
      int8Arr.find((val, idx) => {
        if (val === targetVal) {
          foundIdx = idx;
        }
        return val === targetVal;
      });
      let errorMsg: string = '';

      if (foundIdx !== 2) {
        errorMsg = `find callback idx param mismatch: ${foundIdx} vs 2`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0072
     * @tc.desc   Verify Int8Array findIndex method passes correct value and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5, -10, -15, -20]);
      let checkedVal: number | undefined;
      const targetIdx: number = 2;
      int8Arr.findIndex((val, idx) => {
        if (idx === targetIdx) {
          checkedVal = val;
        }
        return idx === targetIdx;
      });
      let errorMsg: string = '';

      if (checkedVal !== -15) {
        errorMsg = `findIndex callback val param mismatch: ${checkedVal} vs -15`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0073
     * @tc.desc   Verify Int8Array every method stops iterating on first false condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4, 0, 5]);
      let iterateCount: number = 0;
      const result: boolean = int8Arr.every(val => {
        iterateCount++;
        return val > 0;
      });
      let errorMsg: string = '';

      if (result !== false) {
        errorMsg = 'every should return false for array with 0';
      } else if (iterateCount !==
        5) {
        errorMsg = 'every should stop at first false (index 4), iterateCount=5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0074
     * @tc.desc   Verify Int8Array some method stops iterating on first true condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([-1, -2, -3, 4, -5]);
      let iterateCount: number = 0;
      const result: boolean = int8Arr.some(val => {
        iterateCount++;
        return val > 0;
      });
      let errorMsg: string = '';

      if (result !== true) {
        errorMsg = 'some should return true for array with 4';
      } else if (iterateCount !==
        4) {
        errorMsg = 'some should stop at first true (index 3), iterateCount=4';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0075
     * @tc.desc   Verify Int8Array reduce method uses initial value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([3, 6, 9]);
      const initialVal: number = 10;
      const total: number = int8Arr.reduce((acc, val) => acc + val, initialVal);
      let errorMsg: string = '';

      const expectedTotal: number = initialVal + 3 + 6 + 9;
      if (total !== expectedTotal) {
        errorMsg = `reduce total mismatch: ${total} vs ${expectedTotal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0076
     * @tc.desc   Verify Int8Array reduce method without initial value uses first element as initial
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);

      const total: number = int8Arr.reduce((acc, val) => acc + val);
      let errorMsg: string = '';

      if (total !== 12) {
        errorMsg = `reduce total without initial value mismatch: ${total} vs 12`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0077
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0077
     * @tc.desc   Verify Int8Array includes method returns false for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-120, -60, 60, 120]);
      const testVals: number[] = [-100, 0, 100];
      let errorMsg: string = '';

      for (const val of testVals) {
        if (int8Arr.includes(val)) {
          errorMsg = `includes should return false for non-existent value ${val}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0078
     * @tc.desc   Verify Int8Array includes method works with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 5, 15, 5]);
      let errorMsg: string = '';

      if (!int8Arr.includes(5)) {
        errorMsg = 'includes should find duplicate value 5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0079
     * @tc.desc   Verify Int8Array indexOf method returns first occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([8, 4, 8, 2, 8]);
      const targetVal: number = 8;
      const firstIdx: number = int8Arr.indexOf(targetVal);
      let errorMsg: string = '';

      if (firstIdx !== 0) {
        errorMsg = `indexOf should return first occurrence index 0 for ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0080
     * @tc.desc   Verify Int8Array indexOf method returns -1 for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-7, -3, 3, 7]);
      const targetVal: number = 0;
      const idx: number = int8Arr.indexOf(targetVal);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = `indexOf should return -1 for non-existent value ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0081
     * @tc.desc   Verify Int8Array lastIndexOf method returns last occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([12, 6, 12, 3, 12]);
      const targetVal: number = 12;
      const lastIdx: number = int8Arr.lastIndexOf(targetVal);
      let errorMsg: string = '';

      if (lastIdx !== 4) {
        errorMsg = `lastIndexOf should return last occurrence index 4 for ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0082
     * @tc.desc   Verify Int8Array lastIndexOf method returns -1 for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-11, -5, 5, 11]);
      const targetVal: number = 0;
      const idx: number = int8Arr.lastIndexOf(targetVal);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = `lastIndexOf should return -1 for non-existent value ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0083
     * @tc.desc   Verify Int8Array slice method returns new Int8Array (no buffer share)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const slicedArr: Int8Array = int8Arr.slice(1, 3);
      slicedArr[0] = 20;
      let errorMsg: string = '';

      if (int8Arr[1] === 20) {
        errorMsg = 'slice should return new array (no buffer share)';
      } else if (slicedArr[0] !==
        20) {
        errorMsg = 'sliced array modification failed';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0084
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0084
     * @tc.desc   Verify Int8Array slice method with negative start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const slicedArr: Int8Array = int8Arr.slice(-3);
      let errorMsg: string = '';

      if (slicedArr.length !== 3) {
        errorMsg = 'sliced array length should be 3 (start=-3)';
      } else if (slicedArr[0] !==
        30 || slicedArr[2] !== 50) {
        errorMsg = 'sliced array values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0085
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0085
     * @tc.desc   Verify Int8Array slice method with negative end index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const slicedArr: Int8Array = int8Arr.slice(1, -2);
      let errorMsg: string = '';

      if (slicedArr.length !== 2) {
        errorMsg =
          'sliced array length should be 2 (start=1, end=-2)';
      } else if (slicedArr[0] !== 20 ||
        slicedArr[1] !== 30) {
        errorMsg = 'sliced array values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0086
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0086
     * @tc.desc   Verify Int8Array copyWithin method copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      int8Arr.copyWithin(0, 3);
      let errorMsg: string = '';

      if (int8Arr[0] !== 4 || int8Arr[1] !== 5) {
        errorMsg =
          'copyWithin result mismatch at start';
      } else if (int8Arr[2] !== 3) {
        errorMsg =
          'copyWithin should retain unoverwritten values';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0087
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0087
     * @tc.desc   Verify Int8Array copyWithin method with target, start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60]);

      int8Arr.copyWithin(4, 2, 4);
      let errorMsg: string = '';

      if (int8Arr[4] !== 30 || int8Arr[5] !== 40) {
        errorMsg = 'copyWithin result mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0088
     * @tc.desc   Verify Int8Array fill method fills all elements with specified value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      const fillVal: number = -15;
      int8Arr.fill(fillVal);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== fillVal) {
          errorMsg = `Value at index ${i} not filled with ${fillVal}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0089
     * @tc.desc   Verify Int8Array fill method with start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const fillVal: number = 9;
      const startIdx: number = 2;
      int8Arr.fill(fillVal, startIdx);
      let errorMsg: string = '';

      if (int8Arr[0] === 9 || int8Arr[1] === 9) {
        errorMsg =
          'fill should not affect elements before start index';
      } else if (int8Arr[2] !== 9 ||
        int8Arr[4] !== 9) {
        errorMsg = 'fill should affect elements from start index';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0090
     * @tc.desc   Verify Int8Array fill method with start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      const fillVal: number = 7;
      const startIdx: number = 1;
      const endIdx: number = 4;

      int8Arr.fill(fillVal, startIdx, endIdx);
      let errorMsg: string = '';

      if (int8Arr[1] !== 7 || int8Arr[3] !== 7) {
        errorMsg =
          'fill should affect elements in [start, end)';
      } else if (int8Arr[0] === 7 || int8Arr[4] === 7) {
        errorMsg =
          'fill should not affect elements outside [start, end)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0091
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0091
     * @tc.desc   Verify Int8Array fill method with overflow value (auto-handled)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(2);
      const overflowVal: number = 130;
      int8Arr.fill(overflowVal);
      let errorMsg: string = '';

      if (int8Arr[0] !== -126 || int8Arr[1] !== -126) {
        errorMsg =
          `fill with ${overflowVal} should auto-handle overflow to -126`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0092
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0092
     * @tc.desc   Verify Int8Array constructor throws RangeError with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new Int8Array(-5);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError with negative length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0094
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0094
     * @tc.desc   Verify Int8Array constructor with ArrayBuffer and length exceeding buffer capacity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new Int8Array(buf, 0, 5);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError when length exceeds buffer capacity';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0095
     * @tc.desc   Verify Int8Array constructor with valid length (large but within limit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLength: number = 100;
      const int8Arr: Int8Array = new Int8Array(testLength);
      let errorMsg: string = '';

      if (int8Arr.length !== testLength) {
        errorMsg =
          `Length mismatch: ${int8Arr.length} vs ${testLength}`;
      } else if (int8Arr.byteLength !==
        testLength * 1) {
        errorMsg = `byteLength mismatch for length ${testLength}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0096
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0096
     * @tc.desc   Verify Int8Array set method with Uint8ClampedArray (clamped values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clampedSource: Uint8ClampedArray = new Uint8ClampedArray([260, -10]);
      const int8Arr: Int8Array = new Int8Array(2);
      int8Arr.set(clampedSource);
      expect(int8Arr[0]).assertEqual(-1);
      expect(int8Arr[1]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0097
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0097
     * @tc.desc   Verify Int8Array subarray with same start and end as original view (full copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-3, -2, -1, 0, 1, 2, 3]);
      const subArr: Int8Array = int8Arr.subarray(0, int8Arr.length);
      let errorMsg: string = '';

      if (subArr.length !== int8Arr.length) {
        errorMsg = 'Subarray length should match original';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (subArr[i] !== int8Arr[i]) {
            errorMsg = `Value at index ${i} mismatch between subarray and original`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0098
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0098
     * @tc.desc   Verify Int8Array subarray modification affects original view (buffer share)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 15, 20]);
      const subArr: Int8Array = int8Arr.subarray(1, 3);
      subArr[1] = 150;
      expect(int8Arr[2]).assertEqual(-106);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0099
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0099
     * @tc.desc   Verify Int8Array with maximum valid length (2^53-1, within safe integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const safeMaxLength: number = Number.MAX_SAFE_INTEGER;
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {

        const int8Arr: Int8Array = new Int8Array(safeMaxLength);
        if (int8Arr.length !== safeMaxLength) {
          errorMsg = 'Length mismatch for safe max length';
        }
      } catch (e) {

        if ((e as Error).name !== 'RangeError') {
          hasError = true;
        }
      }

      if (hasError) {
        errorMsg = 'Should not throw non-RangeError for safe max length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0100
     * @tc.desc   Verify Int8Array constructor with single value (treated as length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLength: number = 5;
      const int8Arr: Int8Array = new Int8Array(testLength);
      let errorMsg: string = '';

      if (int8Arr.length !== testLength) {
        errorMsg = `Length mismatch: ${int8Arr.length} vs ${testLength}`;
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== 0) {
            errorMsg = `Initial value at index ${i} should be 0`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0101
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0101
     * @tc.desc   Verify Int8Array constructed with ArrayBuffer (offset 1, length 5) basic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const int8Arr: Int8Array = new Int8Array(buf, 1, 5);
      let errorMsg: string = '';

      if (int8Arr.buffer !== buf) {
        errorMsg = 'Buffer reference mismatch';
      } else if (int8Arr.byteOffset !==
        1) {
        errorMsg = 'byteOffset should be 1';
      } else if (int8Arr.byteLength !== 5) {
        errorMsg =
          'byteLength should be 5';
      } else if (int8Arr.length !== 5) {
        errorMsg = 'length should be 5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0102
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0102
     * @tc.desc   Verify Int8Array stores positive value within range (64) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const testVal: number = 64;
      int8Arr[0] = testVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== testVal) {
        errorMsg = `Should store positive value ${testVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0103
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0103
     * @tc.desc   Verify Int8Array stores negative value within range (-64) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const testVal: number = -64;
      int8Arr[0] = testVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== testVal) {
        errorMsg = `Should store negative value ${testVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0104
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0104
     * @tc.desc   Verify Int8Array overflows to 0 when value is 256
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 256;
      const expectedVal: number = 0;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0105
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0105
     * @tc.desc   Verify Int8Array overflows to 0 when value is -256
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = -256;
      const expectedVal: number = 0;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0106
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0106
     * @tc.desc   Verify Int8Array set method with Float32Array (truncated to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatSource: Float32Array = new Float32Array([10.9, 20.1, 30.5]);
      const int8Arr: Int8Array = new Int8Array(3);
      int8Arr.set(floatSource);
      let errorMsg: string = '';

      if (int8Arr[0] !== 10) {
        errorMsg = 'Truncated float 10.9 should be 10';
      } else if (int8Arr[1] !== 20) {
        errorMsg =
          'Truncated float 20.1 should be 20';
      } else if (int8Arr[2] !== 30) {
        errorMsg =
          'Truncated float 30.5 should be 30';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0107
     * @tc.desc   Verify Int8Array set method with start index 0 (full view coverage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      const sourceArr: number[] = [-10, -20, -30, -40];
      int8Arr.set(sourceArr, 0);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== sourceArr[i]) {
          errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${sourceArr[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0108
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0108
     * @tc.desc   Verify Int8Array subarray with start index larger than end index (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 15, 25, 35]);
      const subArr: Int8Array = int8Arr.subarray(3, 1);
      let errorMsg: string = '';

      if (subArr.length !== 0) {
        errorMsg = 'Subarray should be empty when start > end';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0109
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0109
     * @tc.desc   Verify DataView reads Int8Array buffer with offset and length mismatch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 2);
      int8Arr.set([20, 30]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';

      if (dv.getInt8(2) !== 20) {
        errorMsg =
          'DataView read offset 2 (Int8Array[0]) mismatch';
      } else if (dv.getInt8(3) !== 30) {
        errorMsg =
          'DataView read offset 3 (Int8Array[1]) mismatch';
      } else if (dv.getInt8(1) !== 0) {
        errorMsg =
          'DataView read unassigned offset 1 should be 0';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0110
     * @tc.desc   Verify DataView writes to Int8Array buffer outside view range (no effect on Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const int8Arr: Int8Array = new Int8Array(buf, 1, 3);
      int8Arr.set([10, 20, 30]);
      const dv: DataView = new DataView(buf);
      dv.setInt8(0, 40);
      dv.setInt8(4, 50);
      let errorMsg: string = '';

      if (int8Arr[0] !== 10 || int8Arr[2] !== 30) {
        errorMsg =
          'Int8Array view values should remain unchanged';
      } else if (dv.getInt8(0) !== 40 ||
        dv.getInt8(4) !== 50) {
        errorMsg = 'DataView should write to buffer outside view';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0111
     * @tc.desc   Verify Int8Array converts to plain array with Array.from (custom mapper)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([-3, -6, -9]);
      const plainArr: number[] = Array.from(int8Arr, val => val * (-1));
      let errorMsg: string = '';

      if (plainArr[0] !== 3 || plainArr[1] !== 6 || plainArr[2] !== 9) {
        errorMsg = 'Custom mapper result mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0112
     * @tc.desc   Verify plain array with mixed valid and overflow values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [127, 128, -128, -129];
      const int8Arr: Int8Array = new Int8Array(plainArr);
      let errorMsg: string = '';

      if (int8Arr[0] !== 127) {
        errorMsg = 'Valid value 127 mismatch';
      } else if (int8Arr[1] !== -128) {
        errorMsg =
          'Overflow value 128 should be -128';
      } else if (int8Arr[2] !== -128) {
        errorMsg =
          'Valid value -128 mismatch';
      } else if (int8Arr[3] !== 127) {
        errorMsg = 'Underflow value -129 should be 127';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0113
     * @tc.desc   Verify Int8Array index access with maximum valid index (length-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 15, 20]);
      const maxIdx: number = int8Arr.length - 1;
      let errorMsg: string = '';

      if (int8Arr[maxIdx] !== 20) {
        errorMsg = `Value at max index ${maxIdx} should be 20`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0114
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0114
     * @tc.desc   Verify Int8Array assignment with maximum valid index (length-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      const maxIdx: number = int8Arr.length - 1;
      const assignVal: number = 25;
      int8Arr[maxIdx] = assignVal;
      let errorMsg: string = '';

      if (int8Arr[maxIdx] !== assignVal) {
        errorMsg = `Assignment at max index ${maxIdx} failed`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0115
     * @tc.desc   Verify Int8Array forEach method with empty array (no iteration)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      let iterateCount: number = 0;
      int8Arr.forEach(() => iterateCount++);
      let errorMsg: string = '';

      if (iterateCount !== 0) {
        errorMsg = 'forEach should not iterate empty array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0116
     * @tc.desc   Verify Int8Array map method with empty array (returns empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const mappedArr: Int8Array = int8Arr.map(val => val * 2);
      let errorMsg: string = '';

      if (mappedArr.length !== 0) {
        errorMsg =
          'map should return empty array for empty Int8Array';
      } else if (!(mappedArr instanceof Int8Array)) {
        errorMsg =
          'map should return Int8Array type';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0117
     * @tc.desc   Verify Int8Array filter method with empty array (returns empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const filteredArr: Int8Array = int8Arr.filter(val => val > 0);
      let errorMsg: string = '';

      if (filteredArr.length !== 0) {
        errorMsg =
          'filter should return empty array for empty Int8Array';
      } else if (!(filteredArr instanceof
        Int8Array)) {
        errorMsg = 'filter should return Int8Array type';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0118
     * @tc.desc   Verify Int8Array find method with empty array (returns undefined)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const foundVal: number | undefined = int8Arr.find(val => val > 0);
      let errorMsg: string = '';

      if (foundVal !== undefined) {
        errorMsg = 'find should return undefined for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0119
     * @tc.desc   Verify Int8Array findIndex method with empty array (returns -1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const foundIdx: number = int8Arr.findIndex(val => val > 0);
      let errorMsg: string = '';

      if (foundIdx !== -1) {
        errorMsg = 'findIndex should return -1 for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0120
     * @tc.desc   Verify Int8Array every method with empty array (returns true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.every(val => val > 0);
      let errorMsg: string = '';

      if (result !== true) {
        errorMsg = 'every should return true for empty Int8Array (vacuous truth)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0121
     * @tc.desc   Verify Int8Array some method with empty array (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.some(val => val > 0);
      let errorMsg: string = '';

      if (result !== false) {
        errorMsg = 'some should return false for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0122
     * @tc.desc   Verify Int8Array reduce method with empty array and initial value (uses initial)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const initialVal: number = 5;
      const total: number = int8Arr.reduce((acc, val) => acc + val, initialVal);
      let errorMsg: string = '';

      if (total !== initialVal) {
        errorMsg = 'reduce should use initial value for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0123
     * @tc.desc   Verify Int8Array includes method with empty array (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.includes(0);
      let errorMsg: string = '';

      if (result !== false) {
        errorMsg = 'includes should return false for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0124
     * @tc.desc   Verify Int8Array indexOf method with empty array (returns -1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const idx: number = int8Arr.indexOf(0);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = 'indexOf should return -1 for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0125
     * @tc.desc   Verify Int8Array lastIndexOf method with empty array (returns -1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const idx: number = int8Arr.lastIndexOf(0);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = 'lastIndexOf should return -1 for empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0126
     * @tc.desc   Verify Int8Array slice method with empty array (returns empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const slicedArr: Int8Array = int8Arr.slice(0, 1);
      let errorMsg: string = '';

      if (slicedArr.length !== 0) {
        errorMsg =
          'slice should return empty array for empty Int8Array';
      } else if (!(slicedArr instanceof Int8Array)) {
        errorMsg =
          'slice should return Int8Array type';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0127
     * @tc.desc   Verify Int8Array copyWithin method with empty array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      int8Arr.copyWithin(0, 1);
      let errorMsg: string = '';

      if (int8Arr.length !== 0) {
        errorMsg = 'copyWithin should not modify empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0128
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0128
     * @tc.desc   Verify Int8Array fill method with empty array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      int8Arr.fill(10);
      let errorMsg: string = '';

      if (int8Arr.length !== 0) {
        errorMsg = 'fill should not modify empty Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0129
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0129
     * @tc.desc   Verify Int8Array constructor with Float64Array (truncated to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatSource: Float64Array = new Float64Array([-15.999, 25.001, 35.5]);
      const int8Arr: Int8Array = new Int8Array(floatSource);
      let errorMsg: string = '';

      if (int8Arr[0] !== -15) {
        errorMsg = 'Truncated float -15.999 should be -15';
      } else if (int8Arr[1] !==
        25) {
        errorMsg = 'Truncated float 25.001 should be 25';
      } else if (int8Arr[2] !== 35) {
        errorMsg =
          'Truncated float 35.5 should be 35';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0135
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0135
     * @tc.desc   Verify Int8Array subarray with end index 0 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30]);
      const subArr: Int8Array = int8Arr.subarray(0, 0);
      let errorMsg: string = '';

      if (subArr.length !== 0) {
        errorMsg = 'Subarray should be empty when end index = start index (0)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0136
     * @tc.desc   Verify Int8Array slice method with start index equal to end index (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 15, 25]);
      const slicedArr: Int8Array = int8Arr.slice(1, 1);
      let errorMsg: string = '';

      if (slicedArr.length !== 0) {
        errorMsg =
          'slice should return empty array when start = end';
      } else if (!(slicedArr instanceof Int8Array)) {
        errorMsg =
          'slice should return Int8Array type';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0137
     * @tc.desc   Verify Int8Array copyWithin method with target index beyond array length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const originalVals: number[] = [...int8Arr];
      int8Arr.copyWithin(5, 0);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after copyWithin with target beyond length`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0138
     * @tc.desc   Verify Int8Array fill method with start index beyond array length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30]);
      const originalVals: number[] = [...int8Arr];
      const fillVal: number = 40;
      const startIdx: number = int8Arr.length + 1;
      int8Arr.fill(fillVal, startIdx);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after fill with start beyond length`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0139
     * @tc.desc   Verify Int8Array fill method with start index > end index (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 15, 20]);
      const originalVals: number[] = [...int8Arr];
      const fillVal: number = 25;
      const startIdx: number = 3;
      const endIdx: number = 1;
      int8Arr.fill(fillVal, startIdx, endIdx);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after fill with start > end`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0140
     * @tc.desc   Verify Int8Array constructor with non-integer length (truncated to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nonIntLength: number = 4.9;
      const int8Arr: Int8Array = new Int8Array(nonIntLength);
      let errorMsg: string = '';

      if (int8Arr.length !== 4) {
        errorMsg = `Non-integer length ${nonIntLength} should be truncated to 4`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0141
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0141
     * @tc.desc   Verify Int8Array constructor with zero length (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      let errorMsg: string = '';

      if (int8Arr.length !== 0) {
        errorMsg =
          'Zero length constructor should return empty Int8Array';
      } else if (int8Arr.byteLength !== 0) {
        errorMsg =
          'Empty Int8Array should have byteLength 0';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0142
     * @tc.desc   Verify Int8Array set method with source array containing NaN (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(3);
      const sourceArr: number[] = [10, NaN, 20];
      int8Arr.set(sourceArr);
      let errorMsg: string = '';

      if (int8Arr[0] !== 10) {
        errorMsg = 'Valid value 10 mismatch';
      } else if (int8Arr[1] !== 0) {
        errorMsg =
          'NaN in source should be converted to 0';
      } else if (int8Arr[2] !== 20) {
        errorMsg = 'Valid value 20 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0143
     * @tc.desc   Verify Int8Array set method with source array containing Infinity (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(3);
      const sourceArr: number[] = [Infinity, -Infinity, 15];
      int8Arr.set(sourceArr);
      let errorMsg: string = '';

      if (int8Arr[0] !== 0) {
        errorMsg = 'Infinity in source should be converted to 0';
      } else if (int8Arr[1] !==
        0) {
        errorMsg = '-Infinity in source should be converted to 0';
      } else if (int8Arr[2] !== 15) {
        errorMsg =
          'Valid value 15 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0144
     * @tc.desc   Verify Int8Array indexOf method with start index (searches from start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 5, 15, 5]);
      const targetVal: number = 5;
      const startIdx: number = 2;
      const expectedIdx: number = 2;
      const foundIdx: number = int8Arr.indexOf(targetVal, startIdx);
      let errorMsg: string = '';

      if (foundIdx !== expectedIdx) {
        errorMsg = `indexOf with start ${startIdx} should find index ${expectedIdx}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0145
     * @tc.desc   Verify Int8Array lastIndexOf method with start index (searches backward from start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 5, 15, 5]);
      const targetVal: number = 5;
      const startIdx: number = 3;
      const expectedIdx: number = 2;
      const foundIdx: number = int8Arr.lastIndexOf(targetVal, startIdx);
      let errorMsg: string = '';

      if (foundIdx !== expectedIdx) {
        errorMsg = `lastIndexOf with start ${startIdx} should find index ${expectedIdx}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0146
     * @tc.desc   Verify Int8Array includes method with start index (searches from start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([-5, -10, -15, -20]);
      const targetVal: number = -15;
      const startIdx: number = 2;
      const result: boolean = int8Arr.includes(targetVal, startIdx);
      let errorMsg: string = '';

      if (!result) {
        errorMsg = `includes with start ${startIdx} should find ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0147
     * @tc.desc   Verify Int8Array includes method with start index beyond array length (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([-5, -10, -15]);
      const targetVal: number = -5;
      const startIdx: number = 5;
      const result: boolean = int8Arr.includes(targetVal, startIdx);
      let errorMsg: string = '';

      if (result) {
        errorMsg = `includes with start ${startIdx} (beyond length) should return false`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0148
     * @tc.desc   Verify Int8Array slice method with end index beyond array length (truncated to length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const startIdx: number = 1;
      const endIdx: number = 10;
      const slicedArr: Int8Array = int8Arr.slice(startIdx, endIdx);
      let errorMsg: string = '';

      if (slicedArr.length !== 3) {
        errorMsg =
          `slice with end ${endIdx} should have length 3`;
      } else if (slicedArr[0] !== 20 ||
        slicedArr[2] !== 40) {
        errorMsg = 'sliced array values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0149
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0149
     * @tc.desc   Verify Int8Array copyWithin method with start index beyond array length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3]);
      const originalVals: number[] = [...int8Arr];
      int8Arr.copyWithin(0, 5);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after copyWithin with start beyond length`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0150
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0150
     * @tc.desc   Verify Int8Array copyWithin method with start > end (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const originalVals: number[] = [...int8Arr];
      int8Arr.copyWithin(1, 3, 2);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after copyWithin with start > end`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })
    /**
     * @tc.name   TypeArrayInt8ArrayTest0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0151
     * @tc.desc   Verify Int8Array constructed with ArrayBuffer (offset 0, length 3) basic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf, 0, 3);
      expect(int8Arr.buffer).assertEqual(buf);
      expect(int8Arr.byteOffset).assertEqual(0);
      expect(int8Arr.byteLength).assertEqual(3);
      expect(int8Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0152
     * @tc.desc   Verify Int8Array constructed with ArrayBuffer (offset 2, length 2) basic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 2);
      expect(int8Arr.buffer).assertEqual(buf);
      expect(int8Arr.byteOffset).assertEqual(2);
      expect(int8Arr.byteLength).assertEqual(2);
      expect(int8Arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0153
     * @tc.desc   Verify Int8Array initial values are all 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      expect(int8Arr[0]).assertEqual(0);
      expect(int8Arr[1]).assertEqual(0);
      expect(int8Arr[2]).assertEqual(0);
      expect(int8Arr[3]).assertEqual(0);
      expect(int8Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0154
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0154
     * @tc.desc   Verify Int8Array stores legal maximum value (127) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const maxValue: number = 127;
      int8Arr[0] = maxValue;
      expect(int8Arr[0]).assertEqual(maxValue);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0155
     * @tc.desc   Verify Int8Array stores legal minimum value (-128) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const minValue: number = -128;
      int8Arr[0] = minValue;
      expect(int8Arr[0]).assertEqual(minValue);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0156
     * @tc.desc   Verify Int8Array overflows to -128 when value is 128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 128;
      const expectedVal: number = -128;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0157
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0157
     * @tc.desc   Verify Int8Array overflows to 127 when value is -129
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = -129;
      const expectedVal: number = 127;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0158
     * @tc.desc   Verify Int8Array overflows to 0 when value is 256
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 256;
      const expectedVal: number = 0;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0159
     * @tc.desc   Verify Int8Array stores positive value within range (64) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const testVal: number = 64;
      int8Arr[0] = testVal;
      expect(int8Arr[0]).assertEqual(testVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0160
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0160
     * @tc.desc   Verify Int8Array stores negative value within range (-64) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const testVal: number = -64;
      int8Arr[0] = testVal;
      expect(int8Arr[0]).assertEqual(testVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0161
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0161
     * @tc.desc   Verify Int8Array set method with plain array (start index 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      const sourceArr: number[] = [10, 20, 30, 40];
      int8Arr.set(sourceArr, 0);
      expect(int8Arr[0]).assertEqual(10);
      expect(int8Arr[1]).assertEqual(20);
      expect(int8Arr[2]).assertEqual(30);
      expect(int8Arr[3]).assertEqual(40);
      expect(int8Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0162
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0162
     * @tc.desc   Verify Int8Array set method with plain array (start index 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(5);
      const sourceArr: number[] = [50, 60];
      const startIdx: number = 2;
      int8Arr.set(sourceArr, startIdx);
      expect(int8Arr[startIdx]).assertEqual(50);
      expect(int8Arr[startIdx + 1]).assertEqual(60);
      expect(int8Arr[0]).assertEqual(0);
      expect(int8Arr[1]).assertEqual(0);
      expect(int8Arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0163
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0163
     * @tc.desc   Verify Int8Array set method with empty plain array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3]);
      const emptySource: number[] = [];
      int8Arr.set(emptySource);
      expect(int8Arr[0]).assertEqual(1);
      expect(int8Arr[1]).assertEqual(2);
      expect(int8Arr[2]).assertEqual(3);
      expect(int8Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0164
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0164
     * @tc.desc   Verify Int8Array set method with Uint8Array (valid range values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const uint8Source: Uint8Array = new Uint8Array([70, 80]);
      const int8Arr: Int8Array = new Int8Array(2);
      int8Arr.set(uint8Source);
      expect(int8Arr[0]).assertEqual(70);
      expect(int8Arr[1]).assertEqual(80);
      expect(int8Arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0165
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0165
     * @tc.desc   Verify Int8Array set method with Int16Array (truncated to 8-bit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int16Source: Int16Array = new Int16Array([200, 300]);
      const int8Arr: Int8Array = new Int8Array(2);
      int8Arr.set(int16Source);
      expect(int8Arr[0]).assertEqual(-56);
      expect(int8Arr[1]).assertEqual(44);
      expect(int8Arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0166
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0166
     * @tc.desc   Verify Int8Array set method with Uint8ClampedArray (clamped values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clampedSource: Uint8ClampedArray = new Uint8ClampedArray([260, -10]);
      const int8Arr: Int8Array = new Int8Array(2);
      int8Arr.set(clampedSource);
      expect(int8Arr[0]).assertEqual(-1);
      expect(int8Arr[1]).assertEqual(0);
      expect(int8Arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0167
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0167
     * @tc.desc   Verify Int8Array set method throws RangeError when source length exceeds view
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(3);
      const overLengthSource: number[] = [1, 2, 3, 4];
      let isRangeError: boolean = false;

      try {
        int8Arr.set(overLengthSource);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0168
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0168
     * @tc.desc   Verify Int8Array subarray shares buffer with original view (modify subarray)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const subArr: Int8Array = int8Arr.subarray(1, 3);
      subArr[0] = 20;
      expect(int8Arr[1]).assertEqual(20);
      expect(subArr[0]).assertEqual(20);
      expect(subArr[1]).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0169
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0169
     * @tc.desc   Verify Int8Array subarray with start index 0 (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 6, 7]);
      const subArr: Int8Array = int8Arr.subarray(0);
      expect(subArr.length).assertEqual(int8Arr.length);
      expect(subArr[0]).assertEqual(5);
      expect(subArr[1]).assertEqual(6);
      expect(subArr[2]).assertEqual(7);
      expect(subArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0170
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0170
     * @tc.desc   Verify Int8Array subarray returns empty view when start=end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([8, 9, 10]);
      const subArr: Int8Array = int8Arr.subarray(2, 2);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0171
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0171
     * @tc.desc   Verify Int8Array subarray with negative start index (treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(-2, 3);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
      expect(subArr[1]).assertEqual(undefined);
      expect(subArr[2]).assertEqual(undefined);
      expect(subArr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0172
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0172
     * @tc.desc   Verify Int8Array subarray with end index exceeding view length (treated as view length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(1, 10);
      expect(subArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(20);
      expect(subArr[1]).assertEqual(30);
      expect(subArr[2]).assertEqual(40);
      expect(subArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0173
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0173
     * @tc.desc   Verify DataView reads Int8Array shared buffer (offset 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(-10);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0174
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0174
     * @tc.desc   Verify DataView reads Int8Array shared buffer (offset 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      expect(dv.getInt8(2)).assertEqual(-30);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0175
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0175
     * @tc.desc   Verify DataView modifies Int8Array shared buffer (offset 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      const modifyVal: number = 50;
      dv.setInt8(1, modifyVal);
      expect(int8Arr[1]).assertEqual(modifyVal);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0176
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0176
     * @tc.desc   Verify bidirectional sync between DataView and Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);


      int8Arr[0] = 40;
      expect(dv.getInt8(0)).assertEqual(40);


      dv.setInt8(1, -60);
      expect(int8Arr[1]).assertEqual(-60);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0177
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0177
     * @tc.desc   Verify DataView reads Int8Array buffer with non-zero byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 2);
      int8Arr.set([20, 30]);
      const dv: DataView = new DataView(buf);

      expect(dv.getInt8(2)).assertEqual(20);
      expect(dv.getInt8(3)).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0178
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0178
     * @tc.desc   Verify Int8Array converts to plain array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5, 0, 5]);
      const plainArr: number[] = Array.from(int8Arr);
      expect(Array.isArray(plainArr)).assertEqual(true);
      expect(plainArr[0]).assertEqual(-5);
      expect(plainArr[1]).assertEqual(0);
      expect(plainArr[2]).assertEqual(5);
      expect(plainArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0179
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0179
     * @tc.desc   Verify Int8Array converts to plain array via spread syntax
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, 20, -30]);
      const plainArr: number[] = [...int8Arr];
      expect(Array.isArray(plainArr)).assertEqual(true);
      expect(plainArr[0]).assertEqual(-10);
      expect(plainArr[1]).assertEqual(20);
      expect(plainArr[2]).assertEqual(-30);
      expect(plainArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0180
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0180
     * @tc.desc   Verify modifying converted plain array does not affect original Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2]);
      const plainArr: number[] = Array.from(int8Arr);
      plainArr[0] = 100;
      expect(int8Arr[0]).assertEqual(1);
      expect(plainArr[0]).assertEqual(100);
      expect(plainArr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0181
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0181
     * @tc.desc   Verify Int8Array converts to plain array with map via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      const plainArr: number[] = Array.from(int8Arr, val => val * 2);
      expect(plainArr[0]).assertEqual(4);
      expect(plainArr[1]).assertEqual(8);
      expect(plainArr[2]).assertEqual(12);
      expect(plainArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0182
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0182
     * @tc.desc   Verify plain array with overflow values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [128, -129, 255];
      const int8Arr: Int8Array = new Int8Array(plainArr);
      expect(int8Arr[0]).assertEqual(-128);
      expect(int8Arr[1]).assertEqual(127);
      expect(int8Arr[2]).assertEqual(-1);
      expect(int8Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0183
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0183
     * @tc.desc   Verify Int8Array forEach method iterates all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([3, 6, 9]);
      let sum: number = 0;
      int8Arr.forEach(val => sum += val);
      expect(sum).assertEqual(18);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0184
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0184
     * @tc.desc   Verify Int8Array forEach method passes correct index to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30]);
      let collectedIndices: number[] = [];
      int8Arr.forEach((_, idx) => collectedIndices.push(idx));
      expect(collectedIndices[0]).assertEqual(0);
      expect(collectedIndices[1]).assertEqual(1);
      expect(collectedIndices[2]).assertEqual(2);
      expect(collectedIndices.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0185
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0185
     * @tc.desc   Verify Int8Array map method returns new Int8Array with mapped values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3]);
      const mappedArr: Int8Array = int8Arr.map(val => val + 5);
      expect(mappedArr[0]).assertEqual(6);
      expect(mappedArr[1]).assertEqual(7);
      expect(mappedArr[2]).assertEqual(8);
      expect(mappedArr instanceof Int8Array).assertEqual(true);
      expect(mappedArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0186
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0186
     * @tc.desc   Verify Int8Array filter method returns new Int8Array with filtered values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5, 0, 5, 10, -10]);
      const filteredArr: Int8Array = int8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(5);
      expect(filteredArr[1]).assertEqual(10);
      expect(filteredArr instanceof Int8Array).assertEqual(true);
      expect(filteredArr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0187
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0187
     * @tc.desc   Verify Int8Array find method returns first matching value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([15, 25, 35, 45]);
      const foundVal: number | undefined = int8Arr.find(val => val > 30);
      expect(foundVal).assertEqual(35);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0188
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0188
     * @tc.desc   Verify Int8Array findIndex method returns first matching index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([15, 25, 35, 45]);
      const foundIdx: number = int8Arr.findIndex(val => val > 30);
      expect(foundIdx).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0189
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0189
     * @tc.desc   Verify Int8Array every method returns true when all elements match condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, -20, -30]);
      const allNegative: boolean = int8Arr.every(val => val < 0);
      expect(allNegative).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0190
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0190
     * @tc.desc   Verify Int8Array some method returns true when at least one element matches condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-10, -20, 30]);
      const hasPositive: boolean = int8Arr.some(val => val > 0);
      expect(hasPositive).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0191
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0191
     * @tc.desc   Verify Int8Array reduce method accumulates values with initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      const initialVal: number = 10;
      const total: number = int8Arr.reduce((acc, val) => acc + val, initialVal);
      expect(total).assertEqual(22);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0192
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0192
     * @tc.desc   Verify Int8Array reduce method accumulates values without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([2, 4, 6]);
      const total: number = int8Arr.reduce((acc, val) => acc + val);
      expect(total).assertEqual(12);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0193
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0193
     * @tc.desc   Verify Int8Array includes method returns true for existing value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-127, 0, 127]);
      const has127: boolean = int8Arr.includes(127);
      expect(has127).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0194
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0194
     * @tc.desc   Verify Int8Array includes method returns false for non-existing value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-127, 0, 127]);
      const has128: boolean = int8Arr.includes(128);
      expect(has128).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0195
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0195
     * @tc.desc   Verify Int8Array indexOf method returns first occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 5, 15]);
      const firstIdx: number = int8Arr.indexOf(5);
      expect(firstIdx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0196
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0196
     * @tc.desc   Verify Int8Array lastIndexOf method returns last occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 5, 15]);
      const lastIdx: number = int8Arr.lastIndexOf(5);
      expect(lastIdx).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0197
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0197
     * @tc.desc   Verify Int8Array slice method returns new Int8Array (no buffer share)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const slicedArr: Int8Array = int8Arr.slice(1, 3);
      slicedArr[0] = 20;
      expect(int8Arr[1]).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0198
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0198
     * @tc.desc   Verify Int8Array copyWithin method copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      int8Arr.copyWithin(0, 3);
      expect(int8Arr[0]).assertEqual(4);
      expect(int8Arr[1]).assertEqual(5);
      expect(int8Arr[2]).assertEqual(3);
      expect(int8Arr[3]).assertEqual(4);
      expect(int8Arr[4]).assertEqual(5);
      expect(int8Arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0199
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0199
     * @tc.desc   Verify Int8Array fill method fills all elements with specified value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(3);
      const fillVal: number = -15;
      int8Arr.fill(fillVal);
      expect(int8Arr[0]).assertEqual(-15);
      expect(int8Arr[1]).assertEqual(-15);
      expect(int8Arr[2]).assertEqual(-15);
      expect(int8Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0200
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0200
     * @tc.desc   Verify Int8Array fill method fills elements with specified range (start index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const fillVal: number = 9;
      const startIdx: number = 2;
      int8Arr.fill(fillVal, startIdx);
      expect(int8Arr[0]).assertEqual(1);
      expect(int8Arr[1]).assertEqual(2);
      expect(int8Arr[2]).assertEqual(9);
      expect(int8Arr[3]).assertEqual(9);
      expect(int8Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0001
     * @tc.desc   Verify Int8Array handles maximum legal value (127) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const maxLegalVal: number = 127;
      int8Arr[0] = maxLegalVal;
      expect(int8Arr[0]).assertEqual(maxLegalVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0002
     * @tc.desc   Verify Int8Array handles minimum legal value (-128) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const minLegalVal: number = -128;
      int8Arr[0] = minLegalVal;
      expect(int8Arr[0]).assertEqual(minLegalVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0003
     * @tc.desc   Verify Int8Array overflows correctly when value = max legal + 1 (128)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 127 + 1;
      const expectedVal: number = -128;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0004
     * @tc.desc   Verify Int8Array overflows correctly when value = min legal - 1 (-129)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const underflowVal: number = -128 - 1;
      const expectedVal: number = 127;
      int8Arr[0] = underflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0005
     * @tc.desc   Verify Int8Array handles value = max legal + 2 (129) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 127 + 2;
      const expectedVal: number = -127;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0006
     * @tc.desc   Verify Int8Array handles value = min legal - 2 (-130) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const underflowVal: number = -128 - 2;
      const expectedVal: number = 126;
      int8Arr[0] = underflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0007
     * @tc.desc   Verify Int8Array handles value = 2×max legal + 1 (255) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = 2 * 127 + 1;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(-1);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0008
     * @tc.desc   Verify Int8Array handles value = -2×min legal (256) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      const overflowVal: number = -2 * (-128);
      const expectedVal: number = 0;
      int8Arr[0] = overflowVal;
      expect(int8Arr[0]).assertEqual(expectedVal);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0009
     * @tc.desc   Verify Int8Array constructor with length = 0 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      expect(int8Arr.length).assertEqual(0);
      expect(int8Arr.byteLength).assertEqual(0);
      expect(int8Arr.buffer.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0010
     * @tc.desc   Verify Int8Array constructor with length = 1 (minimum non-empty length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(1);
      expect(int8Arr.length).assertEqual(1);
      expect(int8Arr.byteLength).assertEqual(1);
      expect(int8Arr[0]).assertEqual(0);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0011
     * @tc.desc   Verify Int8Array with ArrayBuffer (offset = 0, length = buffer.byteLength)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 0, buf.byteLength);
      expect(int8Arr.byteOffset).assertEqual(0);
      expect(int8Arr.byteLength).assertEqual(buf.byteLength);
      expect(int8Arr.length).assertEqual(buf.byteLength);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0012
     * @tc.desc   Verify Int8Array with ArrayBuffer (offset = buffer.byteLength - 1, length = 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const maxOffset: number = buf.byteLength - 1;
      const int8Arr: Int8Array = new Int8Array(buf, maxOffset, 1);
      expect(int8Arr.byteOffset).assertEqual(maxOffset);
      expect(int8Arr.byteLength).assertEqual(1);
      expect(int8Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0013
     * @tc.desc   Verify Int8Array throws RangeError when offset = buffer.byteLength (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const invalidOffset: number = buf.byteLength;
      let isRangeError: boolean = false;

      try {
        new Int8Array(buf, invalidOffset, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0014
     * @tc.desc   Verify Int8Array throws RangeError when offset + length = buffer.byteLength + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const offset: number = 3;
      const length: number = 3;
      let isRangeError: boolean = false;

      try {
        new Int8Array(buf, offset, length);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0015
     * @tc.desc   Verify Int8Array set method with start index = 0 (full view coverage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(4);
      const source: number[] = [10, 20, 30, 40];
      int8Arr.set(source, 0);
      expect(int8Arr[0]).assertEqual(10);
      expect(int8Arr[1]).assertEqual(20);
      expect(int8Arr[2]).assertEqual(30);
      expect(int8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0016
     * @tc.desc   Verify Int8Array set method with start index = length - source.length (exact fit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = int8Arr.length - source.length;
      int8Arr.set(source, startIdx);
      expect(int8Arr[2]).assertEqual(30);
      expect(int8Arr[3]).assertEqual(40);
      expect(int8Arr[4]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0017
     * @tc.desc   Verify Int8Array set method throws RangeError when start index + source.length = length + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = 3;
      let isRangeError: boolean = false;

      try {
        int8Arr.set(source, startIdx);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0018
     * @tc.desc   Verify Int8Array subarray with start = 0, end = length (full view copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const subArr: Int8Array = int8Arr.subarray(0, int8Arr.length);
      expect(subArr.length).assertEqual(int8Arr.length);
      expect(subArr[0]).assertEqual(1);
      expect(subArr[3]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0019
     * @tc.desc   Verify Int8Array subarray with start = length - 1, end = length (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(int8Arr.length - 1, int8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0020
     * @tc.desc   Verify Int8Array subarray with start = length, end = length + 1 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([1, 2, 3]);
      const subArr: Int8Array = int8Arr.subarray(int8Arr.length, int8Arr.length + 1);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0021
     * @tc.desc   Verify Int8Array subarray with start = -length, end = 0 (full view from negative start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5, 10, 15]);
      const subArr: Int8Array = int8Arr.subarray(-int8Arr.length, 0);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0022
     * @tc.desc   Verify Int8Array subarray with start = -1, end = length (last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([20, 30, 40]);
      const subArr: Int8Array = int8Arr.subarray(-1, int8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0023
     * @tc.desc   Verify DataView reads Int8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr[0] = -128;
      const dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(-128);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0024
     * @tc.desc   Verify DataView reads Int8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr[3] = 127;
      const dv: DataView = new DataView(buf);
      expect(dv.getInt8(3)).assertEqual(127);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0025
     * @tc.desc   Verify DataView writes Int8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setInt8(0, -128);
      expect(int8Arr[0]).assertEqual(-128);
      expect(int8Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0026
     * @tc.desc   Verify DataView writes Int8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setInt8(3, 127);
      expect(int8Arr[3]).assertEqual(127);
      expect(int8Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0027
     * @tc.desc   Verify Int8Array forEach iterates empty array (no callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      let callbackCount: number = 0;
      int8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0028
     * @tc.desc   Verify Int8Array forEach iterates single-element array (one callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5]);
      let callbackCount: number = 0;
      int8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(1);

    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0029
     * @tc.desc   Verify Int8Array map returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const mappedArr: Int8Array = int8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr instanceof Int8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0030
     * @tc.desc   Verify Int8Array map returns single-element array for single-element input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([10]);
      const mappedArr: Int8Array = int8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(1);
      expect(mappedArr[0]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0031
     * @tc.desc   Verify Int8Array filter returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const filteredArr: Int8Array = int8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
      expect(filteredArr instanceof Int8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0032
     * @tc.desc   Verify Int8Array filter returns empty array when no elements match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([-5, -10, -15]);
      const filteredArr: Int8Array = int8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0033
     * @tc.desc   Verify Int8Array find returns undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const foundVal: number | undefined = int8Arr.find(val => val > 0);
      expect(foundVal).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0034
     * @tc.desc   Verify Int8Array find returns the only element when it matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([127]);
      const foundVal: number | undefined = int8Arr.find(val => val === 127);
      expect(foundVal).assertEqual(127);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0035
     * @tc.desc   Verify Int8Array findIndex returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const foundIdx: number = int8Arr.findIndex(val => val > 0);
      expect(foundIdx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0036
     * @tc.desc   Verify Int8Array findIndex returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-128]);
      const foundIdx: number = int8Arr.findIndex(val => val === -128);
      expect(foundIdx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0037
     * @tc.desc   Verify Int8Array every returns true for empty array (vacuous truth)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.every(val => val > 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0038
     * @tc.desc   Verify Int8Array every returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5]);
      const result: boolean = int8Arr.every(val => val === 5);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0039
     * @tc.desc   Verify Int8Array some returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.some(val => val > 0);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0040
     * @tc.desc   Verify Int8Array some returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-5]);
      const result: boolean = int8Arr.some(val => val < 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0041
     * @tc.desc   Verify Int8Array reduce throws error for empty array without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      let isTypeError: boolean = false;

      try {
        int8Arr.reduce((acc, val) => acc + val);
      } catch (e) {
        isTypeError = (e as Error).name === 'TypeError';
      }
      expect(isTypeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0042
     * @tc.desc   Verify Int8Array reduce uses initial value for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const initialVal: number = 10;
      const total: number = int8Arr.reduce((acc, val) => acc + val, initialVal);
      expect(total).assertEqual(initialVal);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0043
     * @tc.desc   Verify Int8Array reduce uses single element as initial value (no initial value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayBound0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: Int8Array = new Int8Array([5]);
      const total: number = int8Arr.reduce((acc, val) => acc + val);
      expect(total).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0044
     * @tc.desc   Verify Int8Array includes returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const result: boolean = int8Arr.includes(0);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0045
     * @tc.desc   Verify Int8Array includes returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([127]);
      const result: boolean = int8Arr.includes(127);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0046
     * @tc.desc   Verify Int8Array indexOf returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const idx: number = int8Arr.indexOf(0);
      expect(idx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0047
     * @tc.desc   Verify Int8Array indexOf returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([-128]);
      const idx: number = int8Arr.indexOf(-128);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0048
     * @tc.desc   Verify Int8Array slice returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      const slicedArr: Int8Array = int8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0049
     * @tc.desc   Verify Int8Array slice returns same array for start=0, end=length (single-element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array([5]);
      const slicedArr: Int8Array = int8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(1);
      expect(slicedArr[0]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayBound0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_BOUND_0050
     * @tc.desc   Verify Int8Array fill has no effect on empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayBound0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: Int8Array = new Int8Array(0);
      int8Arr.fill(10);
      expect(int8Arr.length).assertEqual(0);
    })

  })
}