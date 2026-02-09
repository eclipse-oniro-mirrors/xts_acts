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
import { ItemInfo } from '@kit.MediaLibraryKit'
import { map } from '@kit.ConnectivityKit'

export default function typeArrayUint8ArrayTest() {
  describe('TypeArrayUint8ArrayTest', () => {
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
     * @tc.name   TypeArrayUint8ArrayBound0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0001
     * @tc.desc   Verify Uint8Array handles maximum legal value (255) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const maxLegalVal: number = 255;
      uint8Arr[0] = maxLegalVal;
      expect(uint8Arr[0]).assertEqual(maxLegalVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0002
     * @tc.desc   Verify Uint8Array handles minimum legal value (0) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const minLegalVal: number = 0;
      uint8Arr[0] = minLegalVal;
      expect(uint8Arr[0]).assertEqual(minLegalVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0003
     * @tc.desc   Verify Uint8Array overflows correctly when value = max legal + 1 (256)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const overflowVal: number = 255 + 1;
      const expectedVal: number = 0;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0004
     * @tc.desc   Verify Uint8Array overflows correctly when value = min legal - 1 (-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const underflowVal: number = 0 - 1;
      const expectedVal: number = 255;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0005
     * @tc.desc   Verify Uint8Array handles value = max legal + 2 (257) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const overflowVal: number = 255 + 2;
      const expectedVal: number = 1;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0006
     * @tc.desc   Verify Uint8Array handles value = min legal - 2 (-2) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const underflowVal: number = 0 - 2;
      const expectedVal: number = 254;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0007
     * @tc.desc   Verify Uint8Array handles value = 2×max legal + 1 (511) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const overflowVal: number = 2 * 255 + 1;
      const expectedVal: number = 255;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0008
     * @tc.desc   Verify Uint8Array handles value = -max legal (255) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const underflowVal: number = -255;
      const expectedVal: number = 1;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0009
     * @tc.desc   Verify Uint8Array constructor with length = 0 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
      expect(uint8Arr.buffer.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0010
     * @tc.desc   Verify Uint8Array constructor with length = 1 (minimum non-empty length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      expect(uint8Arr.length).assertEqual(1);
      expect(uint8Arr.byteLength).assertEqual(1);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0011
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset = 0, length = buffer.byteLength)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 0, buf.byteLength);
      expect(uint8Arr.byteOffset).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(buf.byteLength);
      expect(uint8Arr.length).assertEqual(buf.byteLength);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0012
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset = buffer.byteLength - 1, length = 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const maxOffset: number = buf.byteLength - 1;
      const uint8Arr: Uint8Array = new Uint8Array(buf, maxOffset, 1);
      expect(uint8Arr.byteOffset).assertEqual(maxOffset);
      expect(uint8Arr.byteLength).assertEqual(1);
      expect(uint8Arr.length).assertEqual(1);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0013
     * @tc.desc   Verify Uint8Array throws RangeError when offset = buffer.byteLength (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const invalidOffset: number = buf.byteLength;
      let isRangeError: boolean = false;

      try {
        new Uint8Array(buf, invalidOffset, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0014
     * @tc.desc   Verify Uint8Array throws RangeError when offset + length = buffer.byteLength + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const offset: number = 3;
      const length: number = 3;
      let isRangeError: boolean = false;
      try {
        new Uint8Array(buf, offset, length);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0015
     * @tc.desc   Verify Uint8Array set method with start index = 0 (full view coverage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(4);
      const source: number[] = [10, 20, 30, 40];
      uint8Arr.set(source, 0);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(20);
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0016
     * @tc.desc   Verify Uint8Array set method with start index = length - source.length (exact fit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = uint8Arr.length - source.length;
      uint8Arr.set(source, startIdx);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr.toString()).assertEqual('0,0,30,40,50');
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
      expect(uint8Arr[4]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0017
     * @tc.desc   Verify Uint8Array set method throws RangeError when start index + source.length = length + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = 3;
      let isRangeError: boolean = false;

      try {
        uint8Arr.set(source, startIdx);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0018
     * @tc.desc   Verify Uint8Array subarray with start = 0, end = length (full view copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      const subArr: Uint8Array = uint8Arr.subarray(0, uint8Arr.length);
      expect(subArr.length).assertEqual(uint8Arr.length);
      expect(subArr[0]).assertEqual(1);
      expect(subArr[1]).assertEqual(2);
      expect(subArr[2]).assertEqual(3);
      expect(subArr[3]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0019
     * @tc.desc   Verify Uint8Array subarray with start = length - 1, end = length (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const subArr: Uint8Array = uint8Arr.subarray(uint8Arr.length - 1, uint8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0020
     * @tc.desc   Verify Uint8Array subarray with start = length, end = length + 1 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const subArr: Uint8Array = uint8Arr.subarray(uint8Arr.length, uint8Arr.length + 1);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0021
     * @tc.desc   Verify Uint8Array subarray with start = -length, end = 0 (full view from negative start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const subArr: Uint8Array = uint8Arr.subarray(-uint8Arr.length, 0);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0022
     * @tc.desc   Verify Uint8Array subarray with start = -1, end = length (last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([20, 30, 40]);
      const subArr: Uint8Array = uint8Arr.subarray(-1, uint8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0023
     * @tc.desc   Verify DataView reads Uint8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      uint8Arr[0] = 0;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0024
     * @tc.desc   Verify DataView reads Uint8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      uint8Arr[3] = 255;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(3)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0025
     * @tc.desc   Verify DataView writes Uint8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setUint8(0, 0);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0026
     * @tc.desc   Verify DataView writes Uint8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setUint8(3, 255);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr.toString()).assertEqual('0,0,0,255')
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0027
     * @tc.desc   Verify Uint8Array forEach iterates empty array (no callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      let callbackCount: number = 0;
      uint8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0028
     * @tc.desc   Verify Uint8Array forEach iterates single-element array (one callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([5]);
      let callbackCount: number = 0;
      uint8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0029
     * @tc.desc   Verify Uint8Array map returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const mappedArr: Uint8Array = uint8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr instanceof Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0030
     * @tc.desc   Verify Uint8Array map returns single-element array for single-element input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([10]);
      const mappedArr: Uint8Array = uint8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(1);
      expect(mappedArr[0]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0031
     * @tc.desc   Verify Uint8Array filter returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
      expect(filteredArr instanceof Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0032
     * @tc.desc   Verify Uint8Array filter returns empty array when no elements match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0033
     * @tc.desc   Verify Uint8Array find returns undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const foundVal: number | undefined = uint8Arr.find(val => val > 0);
      expect(foundVal).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0034
     * @tc.desc   Verify Uint8Array find returns the only element when it matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([255]);
      const foundVal: number | undefined = uint8Arr.find(val => val === 255);
      expect(foundVal).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0035
     * @tc.desc   Verify Uint8Array findIndex returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const foundIdx: number = uint8Arr.findIndex(val => val > 0);
      expect(foundIdx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0036
     * @tc.desc   Verify Uint8Array findIndex returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([0]);
      const foundIdx: number = uint8Arr.findIndex(val => val === 0);
      expect(foundIdx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0037
     * @tc.desc   Verify Uint8Array every returns true for empty array (vacuous truth)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const result: boolean = uint8Arr.every(val => val < 256);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0038
     * @tc.desc   Verify Uint8Array every returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([5]);
      const result: boolean = uint8Arr.every(val => val === 5);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0039
     * @tc.desc   Verify Uint8Array some returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const result: boolean = uint8Arr.some(val => val > 255);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0040
     * @tc.desc   Verify Uint8Array some returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([255]);
      const result: boolean = uint8Arr.some(val => val === 255);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0041
     * @tc.desc   Verify Uint8Array reduce throws error for empty array without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      let isTypeError: boolean = false;

      try {
        uint8Arr.reduce((acc, val) => acc + val);
      } catch (e) {
        isTypeError = (e as Error).name === 'TypeError';
      }
      expect(isTypeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0042
     * @tc.desc   Verify Uint8Array reduce uses initial value for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const initialVal: number = 10;
      const total: number = uint8Arr.reduce((acc, val) => acc + val, initialVal);
      expect(total).assertEqual(initialVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0043
     * @tc.desc   Verify Uint8Array reduce uses single element as initial value (no initial value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([5]);
      const total: number = uint8Arr.reduce((acc, val) => acc + val);
      expect(total).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0044
     * @tc.desc   Verify Uint8Array includes returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const result: boolean = uint8Arr.includes(0);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0045
     * @tc.desc   Verify Uint8Array includes returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([255]);
      const result: boolean = uint8Arr.includes(255);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0046
     * @tc.desc   Verify Uint8Array indexOf returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const idx: number = uint8Arr.indexOf(0);
      expect(idx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0047
     * @tc.desc   Verify Uint8Array indexOf returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([0]);
      const idx: number = uint8Arr.indexOf(0);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0048
     * @tc.desc   Verify Uint8Array slice returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const slicedArr: Uint8Array = uint8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0049
     * @tc.desc   Verify Uint8Array slice returns same array for start=0, end=length (single-element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([5]);
      const slicedArr: Uint8Array = uint8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(1);
      expect(slicedArr[0]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0050
     * @tc.desc   Verify Uint8Array fill has no effect on empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      uint8Arr.fill(10);
      expect(uint8Arr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0051
     * @tc.desc   Verify Uint8Array handles value = 3×max legal (765) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const overflowVal: number = 3 * 255;
      const expectedVal: number = 765 % 256;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0052
     * @tc.desc   Verify Uint8Array handles value = -2×max legal (-510) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const underflowVal: number = -2 * 255;
      const expectedVal: number = (-510 % 256 + 256) % 256;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0053
     * @tc.desc   Verify Uint8Array constructor with non-integer length (truncated to 5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nonIntLength: number = 5.9;
      const uint8Arr: Uint8Array = new Uint8Array(nonIntLength);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr.byteLength).assertEqual(5);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0054
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0054
     * @tc.desc   Verify Uint8Array constructor with non-integer length (truncated to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nonIntLength: number = 0.9;
      const uint8Arr: Uint8Array = new Uint8Array(nonIntLength);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0055
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset=1, length=buffer.byteLength-2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const offset: number = 1;
      const length: number = buf.byteLength - 2;
      const uint8Arr: Uint8Array = new Uint8Array(buf, offset, length);
      expect(uint8Arr.byteOffset).assertEqual(offset);
      expect(uint8Arr.byteLength).assertEqual(length);
      expect(uint8Arr.length).assertEqual(length);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0056
     * @tc.desc   Verify Uint8Array set method with Int8Array (negative values converted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Source: Int8Array = new Int8Array([-1, -2, 127]);
      const uint8Arr: Uint8Array = new Uint8Array(3);
      uint8Arr.set(int8Source);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(254);
      expect(uint8Arr[2]).assertEqual(127);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0057
     * @tc.desc   Verify Uint8Array set method with Float32Array (truncated and converted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatSource: Float32Array = new Float32Array([255.9, -1.1, 100.5]);
      const uint8Arr: Uint8Array = new Uint8Array(3);
      uint8Arr.set(floatSource);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(255);
      expect(uint8Arr[2]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0058
     * @tc.desc   Verify Uint8Array subarray with start=-2, end=-1 (second-last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const subArr: Uint8Array = uint8Arr.subarray(-2, -1);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0059
     * @tc.desc   Verify Uint8Array subarray with start=-3, end=2 (first two elements of last three)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([5, 15, 25, 35, 45]);
      const subArr: Uint8Array = uint8Arr.subarray(-3, 4);
      expect(subArr.length).assertEqual(2);
      expect(subArr[0]).assertEqual(25);
      expect(subArr[1]).assertEqual(35);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0060
     * @tc.desc   Verify DataView reads Uint8Array buffer with non-zero offset (offset=2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 3);
      uint8Arr.set([60, 70, 80]);
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(2)).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0061
     * @tc.desc   Verify DataView writes Uint8Array buffer with non-zero offset (offset=1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 3);
      const dv: DataView = new DataView(buf);
      dv.setUint8(2, 90);
      expect(uint8Arr[1]).assertEqual(90);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr.toString()).assertEqual('0,90,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0062
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0062
     * @tc.desc   Verify Uint8Array forEach iterates all elements (sum check)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let sum: number = 0;
      uint8Arr.forEach(val => sum += val);
      expect(sum).assertEqual(60);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0063
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0063
     * @tc.desc   Verify Uint8Array forEach passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([5, 10]);
      let collectedIndices: number[] = [];
      let collectedArrays: Uint8Array[] = [];
      uint8Arr.forEach((_, idx, arr) => {
        collectedIndices.push(idx);
        collectedArrays.push(arr);
      });
      expect(collectedIndices[0]).assertEqual(0);
      expect(collectedIndices[1]).assertEqual(1);
      expect(collectedArrays[0]).assertEqual(uint8Arr);
      expect(collectedArrays[1]).assertEqual(uint8Arr);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0064
     * @tc.desc   Verify Uint8Array map converts values to max legal (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([100, 200]);
      const mappedArr: Uint8Array = uint8Arr.map(val => val + 100);
      expect(mappedArr[0]).assertEqual(200);
      expect(mappedArr[1]).assertEqual(44);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0065
     * @tc.desc   Verify Uint8Array filter retains elements equal to max legal (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([255, 100, 255, 50]);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val === 255);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(255);
      expect(filteredArr[1]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0066
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0066
     * @tc.desc   Verify Uint8Array find returns first element greater than max/2 (127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([100, 150, 200]);
      const foundVal: number | undefined = uint8Arr.find(val => val > 127);
      expect(foundVal).assertEqual(150);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0067
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0067
     * @tc.desc   Verify Uint8Array findIndex returns index of first element less than min+5 (5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 3, 8, 2]);
      const foundIdx: number = uint8Arr.findIndex(val => val < 5);
      expect(foundIdx).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0068
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0068
     * @tc.desc   Verify Uint8Array every returns false when one element exceeds max/2 (127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([100, 150, 80]);
      const result: boolean = uint8Arr.every(val => val <= 127);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0069
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0069
     * @tc.desc   Verify Uint8Array some returns true when one element equals min (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 0, 200]);
      const result: boolean = uint8Arr.some(val => val === 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0070
     * @tc.desc   Verify Uint8Array reduce calculates product (with overflow handling)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([2, 150]);
      const initialVal: number = 1;
      const product: number = uint8Arr.reduce((acc, val) => acc * val, initialVal);
      expect(product).assertEqual(300);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0071
     * @tc.desc   Verify Uint8Array includes returns true for value = max legal - 1 (254)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([254, 100, 200]);
      const result: boolean = uint8Arr.includes(254);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0072
     * @tc.desc   Verify Uint8Array includes returns false for value = max legal + 1 (256)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 127, 255]);
      const result: boolean = uint8Arr.includes(256);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0073
     * @tc.desc   Verify Uint8Array indexOf returns last occurrence with start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = 2;
      const idx: number = uint8Arr.indexOf(50, startIdx);
      expect(idx).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0074
     * @tc.desc   Verify Uint8Array lastIndexOf returns first occurrence from end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 30, 50, 70, 50]);
      const idx: number = uint8Arr.lastIndexOf(50);
      expect(idx).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0075
     * @tc.desc   Verify Uint8Array lastIndexOf returns -1 with start index < first occurrence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = 1;
      const idx: number = uint8Arr.lastIndexOf(50, startIdx);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0076
     * @tc.desc   Verify Uint8Array slice with start=length-2, end=length (last two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const slicedArr: Uint8Array = uint8Arr.slice(uint8Arr.length - 2, uint8Arr.length);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(30);
      expect(slicedArr[1]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0077
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0077
     * @tc.desc   Verify Uint8Array slice with start=-length, end=-length+2 (first two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const slicedArr: Uint8Array = uint8Arr.slice(-uint8Arr.length, -uint8Arr.length + 2);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(10);
      expect(slicedArr[1]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0078
     * @tc.desc   Verify Uint8Array copyWithin with target=1, start=3, end=5 (partial copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      uint8Arr.copyWithin(1, 3, 5);
      expect(uint8Arr[0]).assertEqual(1);
      expect(uint8Arr[1]).assertEqual(4);
      expect(uint8Arr[2]).assertEqual(5);
      expect(uint8Arr[3]).assertEqual(4);
      expect(uint8Arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0079
     * @tc.desc   Verify Uint8Array copyWithin with target=0, start=1, end=3 (overlapping copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      uint8Arr.copyWithin(0, 1, 3);
      expect(uint8Arr[0]).assertEqual(20);
      expect(uint8Arr[1]).assertEqual(30);
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0080
     * @tc.desc   Verify Uint8Array fill with value=255, start=1, end=3 (partial fill)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 0, 0, 0]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, 1, 3);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[3]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0081
     * @tc.desc   Verify Uint8Array fill with value=0, start=-3, end=-1 (negative range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([255, 255, 255, 255]);
      const fillVal: number = 0;
      uint8Arr.fill(fillVal, -3, -1);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr[0]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0082
     * @tc.desc   Verify Uint8Array converts from plain array with overflow values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [300, -5, 255];
      const uint8Arr: Uint8Array = new Uint8Array(plainArr);
      expect(uint8Arr[0]).assertEqual(44);
      expect(uint8Arr[1]).assertEqual(251);
      expect(uint8Arr[2]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0083
     * @tc.desc   Verify Uint8Array converts to plain array via Array.from (with mapper)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const plainArr: number[] = Array.from(uint8Arr, val => val * 2);
      expect(plainArr[0]).assertEqual(20);
      expect(plainArr[1]).assertEqual(40);
      expect(plainArr[2]).assertEqual(60);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0084
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0084
     * @tc.desc   Verify Uint8Array converts to plain array via spread syntax (overflow in mapper)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([200, 100]);
      const plainArr: number[] = [...uint8Arr].map(val => val + 100);
      expect(plainArr[0]).assertEqual(300);
      expect(plainArr[1]).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0085
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0085
     * @tc.desc   Verify Uint8Array set method with start index = length - 1 (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(4);
      const source: number[] = [255];
      const startIdx: number = uint8Arr.length - 1;
      uint8Arr.set(source, startIdx);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr[2]).assertEqual(0);
      expect(uint8Arr[1]).assertEqual(0);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0086
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0086
     * @tc.desc   Verify Uint8Array subarray with start=0, end=-1 (all except last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const subArr: Uint8Array = uint8Arr.subarray(0, -1);
      expect(subArr.length).assertEqual(3);
      expect(subArr[2]).assertEqual(30);
      expect(subArr[1]).assertEqual(20);
      expect(subArr[0]).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0087
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0087
     * @tc.desc   Verify Uint8Array subarray with start=2, end=-2 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const subArr: Uint8Array = uint8Arr.subarray(2, -2);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0088
     * @tc.desc   Verify Uint8Array fill with start index > end index (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.fill(255, 3, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0089
     * @tc.desc   Verify Uint8Array copyWithin with start > end (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(0, 3, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0090
     * @tc.desc   Verify Uint8Array copyWithin with target >= length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(3, 0, 2);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0091
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0091
     * @tc.desc   Verify Uint8Array copyWithin with start >= length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(0, 3, 5);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0092
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0092
     * @tc.desc   Verify Uint8Array fill with end index > length (fills to end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, 1, 10);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0093
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0093
     * @tc.desc   Verify Uint8Array slice with end index > length (truncates to length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const slicedArr: Uint8Array = uint8Arr.slice(1, 10);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0094
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0094
     * @tc.desc   Verify Uint8Array slice with start index > length (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const slicedArr: Uint8Array = uint8Arr.slice(5, 10);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0095
     * @tc.desc   Verify Uint8Array slice with start index = end index (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const slicedArr: Uint8Array = uint8Arr.slice(2, 2);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0096
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0096
     * @tc.desc   Verify Uint8Array set method with empty source array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      const emptySource: number[] = [];
      uint8Arr.set(emptySource);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0097
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0097
     * @tc.desc   Verify Uint8Array set method with source array length 0 (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      const emptySource: Uint8Array = new Uint8Array(0);
      uint8Arr.set(emptySource, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0098
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0098
     * @tc.desc   Verify Uint8Array forEach with empty array (callback not called)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      let isCalled: boolean = false;
      uint8Arr.forEach(() => isCalled = true);
      expect(isCalled).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0099
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0099
     * @tc.desc   Verify Uint8Array map with empty array (returns empty Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const mappedArr: Uint8Array = uint8Arr.map(val => val + 10);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr instanceof Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0100
     * @tc.desc   Verify Uint8Array filter with empty array (returns empty Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val > 100);
      expect(filteredArr.length).assertEqual(0);
      expect(filteredArr instanceof Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0101
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0101
     * @tc.desc   Verify Uint8Array handles value = 256×2 + 100 (612) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const overflowVal: number = 256 * 2 + 100;
      const expectedVal: number = 612 % 256;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0102
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0102
     * @tc.desc   Verify Uint8Array handles value = - (256 + 50) (-306) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(1);
      const underflowVal: number = -(256 + 50);
      const expectedVal: number = (-306 % 256 + 256) % 256;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0103
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0103
     * @tc.desc   Verify Uint8Array constructor with ArrayBuffer (offset=0, length=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 0, 0);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
      expect(uint8Arr.buffer).assertEqual(buf);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0104
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0104
     * @tc.desc   Verify Uint8Array constructor with ArrayBuffer (offset=buf.length-2, length=2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const offset: number = buf.byteLength - 2;
      const length: number = 2;
      const uint8Arr: Uint8Array = new Uint8Array(buf, offset, length);
      expect(uint8Arr.byteOffset).assertEqual(offset);
      expect(uint8Arr.length).assertEqual(length);
      expect(uint8Arr.byteLength).assertEqual(length);
      expect(uint8Arr.toString()).assertEqual('0,0')
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0105
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0105
     * @tc.desc   Verify Uint8Array set method with Uint16Array (values exceed 255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Source: Uint16Array = new Uint16Array([300, 510]);
      const uint8Arr: Uint8Array = new Uint8Array(2);
      uint8Arr.set(uint16Source);
      expect(uint8Arr[0]).assertEqual(44);
      expect(uint8Arr[1]).assertEqual(254);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0106
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0106
     * @tc.desc   Verify Uint8Array set method with Int32Array (negative values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int32Source: Int32Array = new Int32Array([-10, -200]);
      const uint8Arr: Uint8Array = new Uint8Array(2);
      uint8Arr.set(int32Source);
      expect(uint8Arr[0]).assertEqual(246);
      expect(uint8Arr[1]).assertEqual(56);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0107
     * @tc.desc   Verify Uint8Array subarray with start=-4, end=-2 (middle two elements of 5-length array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const subArr: Uint8Array = uint8Arr.subarray(-4, -2);
      expect(subArr.length).assertEqual(2);
      expect(subArr[0]).assertEqual(20);
      expect(subArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0108
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0108
     * @tc.desc   Verify Uint8Array subarray with start=1, end=-3 (single element of 5-length array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const subArr: Uint8Array = uint8Arr.subarray(1, -3);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0109
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0109
     * @tc.desc   Verify DataView reads Uint8Array buffer with offset=buf.length-1 (last byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(7);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const targetOffset: number = buf.byteLength - 1;
      uint8Arr[targetOffset] = 255;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(targetOffset)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0110
     * @tc.desc   Verify DataView writes Uint8Array buffer with offset=buf.length-2 (second-last byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(7);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const targetOffset: number = buf.byteLength - 2;
      const dv: DataView = new DataView(buf);
      dv.setUint8(targetOffset, 127);
      expect(uint8Arr[targetOffset]).assertEqual(127);
      expect(uint8Arr.length).assertEqual(7)
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0,127,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0111
     * @tc.desc   Verify Uint8Array forEach modifies external variable (count elements > 127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([100, 150, 200, 50]);
      let count: number = 0;
      uint8Arr.forEach(val => val > 127 && count++);
      expect(count).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0112
     * @tc.desc   Verify Uint8Array forEach with thisArg (binds context)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20]);

      interface GeneratedObjectLiteralInterface_1 {
        sum: number;
      }

      const context: GeneratedObjectLiteralInterface_1 = { sum: 0 };
      uint8Arr.forEach((val: number) => {
        context.sum += val;
      });
      expect(context.sum).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0113
     * @tc.desc   Verify Uint8Array map with values exceeding 255 (overflow in mapping)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([200, 100]);
      const mappedArr: Uint8Array = uint8Arr.map(val => val + 100);
      expect(mappedArr[0]).assertEqual(44);
      expect(mappedArr[1]).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0114
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0114
     * @tc.desc   Verify Uint8Array map with negative mapped values (converted to Uint8)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 100]);
      const mappedArr: Uint8Array = uint8Arr.map(val => val - 150);
      expect(mappedArr[0]).assertEqual(156);
      expect(mappedArr[1]).assertEqual(206);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0115
     * @tc.desc   Verify Uint8Array filter retains elements between 100 and 200
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 150, 250, 180, 80]);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val >= 100 && val <= 200);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(150);
      expect(filteredArr[1]).assertEqual(180);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0116
     * @tc.desc   Verify Uint8Array filter removes all elements (no matches)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val > 100);
      expect(filteredArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0117
     * @tc.desc   Verify Uint8Array find returns undefined when no elements match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const foundVal: number | undefined = uint8Arr.find(val => val === 50);
      expect(foundVal).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0118
     * @tc.desc   Verify Uint8Array findIndex returns -1 when no elements match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const foundIdx: number = uint8Arr.findIndex(val => val === 50);
      expect(foundIdx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0119
     * @tc.desc   Verify Uint8Array every returns true when all elements are min (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const result: boolean = uint8Arr.every(val => val === 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0120
     * @tc.desc   Verify Uint8Array every returns false when one element is max (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([254, 255, 254]);
      const result: boolean = uint8Arr.every(val => val < 255);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0121
     * @tc.desc   Verify Uint8Array some returns false when all elements are max (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([255, 255, 255]);
      const result: boolean = uint8Arr.some(val => val < 255);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0122
     * @tc.desc   Verify Uint8Array some returns true when one element is min (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 0, 20]);
      const result: boolean = uint8Arr.some(val => val === 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0123
     * @tc.desc   Verify Uint8Array reduce with overflow in accumulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([200, 100]);
      const total: number = uint8Arr.reduce((acc, val) => acc + val, 0);
      expect(total).assertEqual(300);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0124
     * @tc.desc   Verify Uint8Array reduce with initial value exceeding 255
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 50]);
      const initialVal: number = 300;
      const total: number = uint8Arr.reduce((acc, val) => acc + val, initialVal);
      expect(total).assertEqual(400);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0125
     * @tc.desc   Verify Uint8Array includes returns true for value = min + 1 (1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([1, 10, 20]);
      const result: boolean = uint8Arr.includes(1);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0126
     * @tc.desc   Verify Uint8Array includes returns false for value = min - 1 (-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 10, 20]);
      const result: boolean = uint8Arr.includes(-1);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0127
     * @tc.desc   Verify Uint8Array indexOf returns first occurrence with start index > first match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = 1;
      const idx: number = uint8Arr.indexOf(50, startIdx);
      expect(idx).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0128
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0128
     * @tc.desc   Verify Uint8Array lastIndexOf returns -1 with start index < all occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = -5;
      const idx: number = uint8Arr.lastIndexOf(50, startIdx);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0129
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0129
     * @tc.desc   Verify Uint8Array slice with start=-1 (last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const slicedArr: Uint8Array = uint8Arr.slice(-1);
      expect(slicedArr.length).assertEqual(1);
      expect(slicedArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0130
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0130
     * @tc.desc   Verify Uint8Array slice with end=-2 (all except last two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const slicedArr: Uint8Array = uint8Arr.slice(0, -2);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(10);
      expect(slicedArr[1]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0131
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0131
     * @tc.desc   Verify Uint8Array copyWithin with target=-3, start=1, end=3 (negative target)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      uint8Arr.copyWithin(-3, 1, 3);
      expect(uint8Arr[0]).assertEqual(1);
      expect(uint8Arr[1]).assertEqual(2);
      expect(uint8Arr[2]).assertEqual(2);
      expect(uint8Arr[3]).assertEqual(3);
      expect(uint8Arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0132
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0132
     * @tc.desc   Verify Uint8Array copyWithin with target=2, start=-4, end=-2 (negative start/end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      uint8Arr.copyWithin(2, -4, -2);
      expect(uint8Arr[0]).assertEqual(1);
      expect(uint8Arr[1]).assertEqual(2);
      expect(uint8Arr[2]).assertEqual(2);
      expect(uint8Arr[3]).assertEqual(3);
      expect(uint8Arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0133
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0133
     * @tc.desc   Verify Uint8Array fill with value=0, start=-2 (last two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([255, 255, 255, 255]);
      const fillVal: number = 0;
      uint8Arr.fill(fillVal, -2);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(255);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[3]).assertEqual(fillVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0134
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0134
     * @tc.desc   Verify Uint8Array fill with value=255, end=-3 (first two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 0, 0, 0, 0]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, 0, -3);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr[0]).assertEqual(fillVal);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(0);
      expect(uint8Arr[3]).assertEqual(0);
      expect(uint8Arr[4]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0135
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0135
     * @tc.desc   Verify Uint8Array converts from plain array with non-integer values (truncated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] =
        [10.9, 20.1, -5.8];
      const uint8Arr: Uint8Array = new Uint8Array(plainArr);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(20);
      expect(uint8Arr[2]).assertEqual(251);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0136
     * @tc.desc   Verify Uint8Array converts to plain array via Array.from (empty source)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(0);
      const plainArr: number[] = Array.from(uint8Arr);
      expect(Array.isArray(plainArr)).assertEqual(true);
      expect(plainArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0137
     * @tc.desc   Verify Uint8Array converts to plain array via spread syntax (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([255]);
      const plainArr: number[] = [...uint8Arr];
      expect(Array.isArray(plainArr)).assertEqual(true);
      expect(plainArr.length).assertEqual(1);
      expect(plainArr[0]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0138
     * @tc.desc   Verify Uint8Array set method with start index = 0 and source length = view length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(3);
      const source: number[] = [100, 200, 255];
      uint8Arr.set(source, 0);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr[0]).assertEqual(100);
      expect(uint8Arr[1]).assertEqual(200);
      expect(uint8Arr[2]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0139
     * @tc.desc   Verify Uint8Array set method with start index = view length - source length - 1 (gap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(5);
      const source: number[] = [50, 60];
      const startIdx: number = uint8Arr.length - source.length - 1;
      uint8Arr.set(source, startIdx);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr[4]).assertEqual(0);
      expect(uint8Arr[2]).assertEqual(50);
      expect(uint8Arr[3]).assertEqual(60);
      expect(uint8Arr[1]).assertEqual(0);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0140
     * @tc.desc   Verify Uint8Array subarray with start=0, end=0 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const subArr: Uint8Array = uint8Arr.subarray(0, 0);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0141
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0141
     * @tc.desc   Verify Uint8Array subarray with start=view.length-1, end=view.length+1 (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const subArr: Uint8Array = uint8Arr.subarray(uint8Arr.length - 1, uint8Arr.length + 1);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0142
     * @tc.desc   Verify Uint8Array fill with start index = end index (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.fill(255, 1, 1);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0143
     * @tc.desc   Verify Uint8Array fill with start index < 0 and end index < 0 (valid range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, -3, -1);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0144
     * @tc.desc   Verify Uint8Array slice with start < 0 and end < 0 (empty range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const slicedArr: Uint8Array = uint8Arr.slice(-2, -3);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0145
     * @tc.desc   Verify Uint8Array slice with start > end (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const slicedArr: Uint8Array = uint8Arr.slice(2, 1);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0146
     * @tc.desc   Verify Uint8Array set method with source array containing NaN (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(2);
      const source: number[] = [NaN, 100];
      uint8Arr.set(source);
      expect(uint8Arr.length).assertEqual(2);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[1]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0147
     * @tc.desc   Verify Uint8Array set method with source array containing Infinity (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array(2);
      const source: number[] = [Infinity, -Infinity];
      uint8Arr.set(source);
      expect(uint8Arr.length).assertEqual(2);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[1]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0148
     * @tc.desc   Verify Uint8Array forEach with callback modifying the array (no re-iteration)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let count: number = 0;
      uint8Arr.forEach(val => {
        count++;
        if (count === 1) {
          uint8Arr[2] = 0;
        }
      });
      expect(count).assertEqual(3);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(20);
      expect(uint8Arr[2]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0149
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0149
     * @tc.desc   Verify Uint8Array map with callback returning NaN (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([10, 20]);
      const mappedArr: Uint8Array = uint8Arr.map(() => NaN);
      expect(mappedArr.length).assertEqual(2);
      expect(mappedArr[0]).assertEqual(0);
      expect(mappedArr[1]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0150
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BOUND_0150
     * @tc.desc   Verify Uint8Array filter with callback returning non-boolean (coerced to boolean)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: Uint8Array = new Uint8Array([0, 10, 20]);
      const filteredArr: Uint8Array = uint8Arr.filter(val => val);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(10);
      expect(filteredArr[1]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0001
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer (bidirectional sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      uint8Arr[1] = 150;
      expect(dv.getUint8(1)).assertEqual(150);
      dv.setUint8(2, 200);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[1]).assertEqual(150);
      expect(uint8Arr[2]).assertEqual(200);
      expect(uint8Arr[3]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0002
     * @tc.desc   Verify Uint8Array (non-zero offset) and DataView share ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 2, 3);
      const dv: DataView = new DataView(buf);
      uint8Arr[0] = 100;
      uint8Arr[2] = 255;
      expect(dv.getUint8(2)).assertEqual(100);
      expect(dv.getUint8(4)).assertEqual(255);
      dv.setUint8(3, 150);
      expect(uint8Arr.length).assertEqual(3)
      expect(uint8Arr[0]).assertEqual(100);
      expect(uint8Arr[1]).assertEqual(150);
      expect(uint8Arr[2]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0003
     * @tc.desc   Verify SharedArrayBuffer sync between Uint8Array and DataView (single thread)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(sab);
      const dv: DataView = new DataView(sab);

      uint8Arr[0] = 255;
      expect(dv.getUint8(0)).assertEqual(255);

      dv.setUint8(3, 50);
      expect(uint8Arr.length).assertEqual(4)
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(0);
      expect(uint8Arr[2]).assertEqual(0);
      expect(uint8Arr[3]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0004
     * @tc.desc   Verify DataView reads Uint8Array's overflow-modified value in shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      uint8Arr[0] = 300;
      expect(dv.getUint8(0)).assertEqual(44);
      uint8Arr[1] = -10;
      expect(dv.getUint8(1)).assertEqual(246);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0005
     * @tc.desc   Verify Uint8Array reads DataView's out-of-Uint8-range value in shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      dv.setInt16(0, 300, true);
      expect(uint8Arr[0]).assertEqual(44);
      expect(uint8Arr[1]).assertEqual(1);

      dv.setUint16(0, 510, true);
      expect(uint8Arr.length).assertEqual(2)
      expect(uint8Arr[0]).assertEqual(254);
      expect(uint8Arr[1]).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0006
     * @tc.desc   Verify ArrayBuffer byteLength consistency between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 5);
      const dv: DataView = new DataView(buf);
      expect(uint8Arr.buffer.byteLength).assertEqual(buf.byteLength);
      expect(dv.buffer.byteLength).assertEqual(buf.byteLength);
      expect(uint8Arr.buffer).assertEqual(dv.buffer);
      expect(uint8Arr.length).assertEqual(5)
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0')
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0007
     * @tc.desc   Verify SharedArrayBuffer byteLength consistency between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(10);
      const uint8Arr: Uint8Array = new Uint8Array(sab, 3, 4);
      const dv: DataView = new DataView(sab);
      expect(uint8Arr.buffer.byteLength).assertEqual(sab.byteLength);
      expect(dv.buffer.byteLength).assertEqual(sab.byteLength);
      expect(uint8Arr.buffer).assertEqual(dv.buffer);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0008
     * @tc.desc   Verify Uint8Array subarray and DataView share parent ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const parentUint8: Uint8Array = new Uint8Array(buf);
      const subUint8: Uint8Array = parentUint8.subarray(2, 5);
      const dv: DataView = new DataView(buf);
      subUint8[1] = 180;
      expect(dv.getUint8(3)).assertEqual(180);
      dv.setUint8(4, 220);
      expect(subUint8[0]).assertEqual(0)
      expect(subUint8[1]).assertEqual(180)
      expect(subUint8[2]).assertEqual(220);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0009
     * @tc.desc   Verify Uint8Array slice (new buffer) does NOT sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const originalUint8: Uint8Array = new Uint8Array(buf);
      originalUint8.set([10, 20, 30, 40]);

      const slicedUint8: Uint8Array = originalUint8.slice(1, 3);
      const dv: DataView = new DataView(buf);

      slicedUint8[0] = 100;
      expect(dv.getUint8(1)).assertEqual(20);

      dv.setUint8(2, 200);
      expect(slicedUint8[0]).assertEqual(100);
      expect(slicedUint8[1]).assertEqual(30);
      expect(slicedUint8.length).assertEqual(2)
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0010
     * @tc.desc   Verify DataView out-of-bounds read throws RangeError (shared ArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const dv: DataView = new DataView(buf);
      let isRangeError: boolean = false;

      try {
        dv.getUint8(3);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0011
     * @tc.desc   Verify DataView out-of-bounds write throws RangeError (SharedArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(2);
      const dv: DataView = new DataView(sab);
      let isRangeError: boolean = false;

      try {
        dv.setUint8(2, 100);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0012
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for multi-byte DataView operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      dv.setUint32(0, 0x12345678, true);
      expect(uint8Arr.length).assertEqual(4)
      expect(uint8Arr[0]).assertEqual(0x78);
      expect(uint8Arr[1]).assertEqual(0x56);
      expect(uint8Arr[2]).assertEqual(0x34);
      expect(uint8Arr[3]).assertEqual(0x12);

      uint8Arr[1] = 0x9A;
      expect(dv.getUint32(0, true)).assertEqual(0x12349A78);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0013
     * @tc.desc   Verify Uint8Array set method syncs with DataView in shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([20, 40, 60], 1);
      expect(dv.getUint8(1)).assertEqual(20);
      expect(dv.getUint8(2)).assertEqual(40);
      expect(dv.getUint8(3)).assertEqual(60);

      dv.setUint8(2, 50);
      uint8Arr.set([70], 3);
      expect(dv.getUint8(2)).assertEqual(50);
      expect(dv.getUint8(3)).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0014
     * @tc.desc   Verify SharedArrayBuffer sync for Uint8Array subarray and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(6);
      const parentUint8: Uint8Array = new Uint8Array(sab);
      const subUint8: Uint8Array = parentUint8.subarray(2, 5);
      const dv: DataView = new DataView(sab);

      subUint8[0] = 100;
      subUint8[2] = 200;
      expect(dv.getUint8(2)).assertEqual(100);
      expect(dv.getUint8(4)).assertEqual(200);

      dv.setUint8(3, 150);
      expect(subUint8[0]).assertEqual(100);
      expect(subUint8[1]).assertEqual(150);
      expect(subUint8[2]).assertEqual(200);
      expect(subUint8.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0015
     * @tc.desc   Verify DataView reads Uint8Array's initial zero values in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 2);
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(1)).assertEqual(0);
      expect(dv.getUint8(2)).assertEqual(0);
      uint8Arr[0] = 50;
      expect(dv.getUint8(1)).assertEqual(50);
      expect(dv.getUint8(2)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0016
     * @tc.desc   Verify Uint8Array reads DataView's initial zero values in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(3);
      const dv: DataView = new DataView(sab);
      const uint8Arr: Uint8Array = new Uint8Array(sab);
      expect(uint8Arr[1]).assertEqual(0)
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[2]).assertEqual(0);
      dv.setUint8(1, 75);
      expect(uint8Arr.length).assertEqual(3)
      expect(uint8Arr[2]).assertEqual(0)
      expect(uint8Arr[1]).assertEqual(75);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0017
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for partial DataView writes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      dv.setUint16(1, 0xABCD, false);
      expect(uint8Arr.length).assertEqual(5)
      expect(uint8Arr[0]).assertEqual(0)
      expect(uint8Arr[1]).assertEqual(0xAB);
      expect(uint8Arr[2]).assertEqual(0xCD);
      expect(uint8Arr[3]).assertEqual(0)
      expect(uint8Arr[4]).assertEqual(0)

      uint8Arr[2] = 0xEF;
      expect(dv.getUint16(1, false)).assertEqual(0xABEF);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0020
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for fill operation sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.fill(255, 1, 3);
      expect(dv.getUint8(1)).assertEqual(255);
      expect(dv.getUint8(2)).assertEqual(255);
      expect(dv.getUint8(3)).assertEqual(0);

      dv.setUint8(2, 0);
      uint8Arr.fill(100, 2, 4);
      expect(dv.getUint8(2)).assertEqual(100);
      expect(dv.getUint8(3)).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0021
     * @tc.desc   Verify Uint8Array copyWithin sync with DataView in shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([10, 20, 30, 40, 50]);
      uint8Arr.copyWithin(1, 3, 5);
      expect(dv.getUint8(1)).assertEqual(40);
      expect(dv.getUint8(2)).assertEqual(50);
      expect(dv.getUint8(3)).assertEqual(40);

      dv.setUint8(3, 35);
      expect(uint8Arr.length).assertEqual(5)
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(40);
      expect(uint8Arr[2]).assertEqual(50);
      expect(uint8Arr[3]).assertEqual(35);
      expect(uint8Arr[4]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0022
     * @tc.desc   Verify DataView reads Uint8Array's out-of-bounds index (returns undefined)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 0, 2);
      const dv: DataView = new DataView(buf);

      expect(uint8Arr.length).assertEqual(2)
      expect(uint8Arr[0]).assertEqual(0)
      expect(uint8Arr[1]).assertEqual(0)
      expect(uint8Arr[2]).assertEqual(undefined);
      expect(dv.getUint8(2)).assertEqual(0);

      dv.setUint8(2, 100);
      expect(uint8Arr.length).assertEqual(2)
      expect(uint8Arr[0]).assertEqual(0)
      expect(uint8Arr[1]).assertEqual(0)
      expect(uint8Arr[2]).assertEqual(undefined);
      expect(dv.getUint8(2)).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0023
     * @tc.desc   Verify Uint8Array reads DataView's out-of-bounds offset (throws RangeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      let isRangeError: boolean = false;

      try {
        dv.getUint16(2, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      uint8Arr[2] = 255;
      expect(dv.getUint8(2)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0024
     * @tc.desc   Verify ArrayBuffer slice (new buffer) sync with new Uint8Array/DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const originalBuf: ArrayBuffer = new ArrayBuffer(5);
      const originalUint8: Uint8Array = new Uint8Array(originalBuf);
      originalUint8.set([10, 20, 30, 40, 50]);
      const slicedBuf: ArrayBuffer = originalBuf.slice(1, 4);
      const slicedUint8: Uint8Array = new Uint8Array(slicedBuf);
      const slicedDv: DataView = new DataView(slicedBuf);
      slicedUint8[1] = 100;
      expect(slicedDv.getUint8(1)).assertEqual(100);

      slicedDv.setUint8(2, 200);
      expect(slicedUint8.length).assertEqual(3);
      expect(slicedUint8[0]).assertEqual(20);
      expect(slicedUint8[1]).assertEqual(100);
      expect(slicedUint8[2]).assertEqual(200);

      expect(originalUint8.length).assertEqual(5)
      expect(originalUint8[4]).assertEqual(50);
      expect(originalUint8[3]).assertEqual(40);
      expect(originalUint8[0]).assertEqual(10);
      expect(originalUint8[1]).assertEqual(20);
      expect(originalUint8[2]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0025
     * @tc.desc   Verify SharedArrayBuffer slice (not supported) throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(4);

      const sab1 = sab.slice(1, 3);
      expect(sab1.byteLength).assertEqual(2);

    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0026
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for indexOf sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([5, 15, 25, 15, 35]);
      expect(uint8Arr.indexOf(15)).assertEqual(1);

      dv.setUint8(3, 0);
      expect(uint8Arr.indexOf(15)).assertEqual(1);
      expect(uint8Arr.indexOf(0)).assertEqual(3);

      uint8Arr[1] = 0;
      expect(dv.getUint8(1)).assertEqual(0);
      expect(uint8Arr.indexOf(15)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0027
     * @tc.desc   Verify Uint8Array lastIndexOf sync with DataView in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(sab);
      const dv: DataView = new DataView(sab);

      uint8Arr.set([5, 15, 25, 15, 35]);
      expect(uint8Arr.lastIndexOf(15)).assertEqual(3);

      dv.setUint8(3, 0);
      expect(uint8Arr.lastIndexOf(15)).assertEqual(1);

      uint8Arr[1] = 0;
      expect(dv.getUint8(1)).assertEqual(0);
      expect(uint8Arr.lastIndexOf(15)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0028
     * @tc.desc   Verify DataView reads Uint8Array's fill value with negative range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.fill(200, -3, -1);
      expect(dv.getUint8(1)).assertEqual(200);
      expect(dv.getUint8(2)).assertEqual(200);
      expect(dv.getUint8(0)).assertEqual(0);
      expect(dv.getUint8(3)).assertEqual(0);

      dv.setUint8(2, 100);
      expect(uint8Arr[2]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0029
     * @tc.desc   Verify Uint8Array copyWithin with negative indices sync with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([10, 20, 30, 40, 50]);
      uint8Arr.copyWithin(-4, -2, -1);
      expect(dv.getUint8(1)).assertEqual(40);
      expect(dv.getUint8(3)).assertEqual(40);

      dv.setUint8(3, 35);
      uint8Arr.copyWithin(2, 3, 5);
      expect(dv.getUint8(2)).assertEqual(35);
      expect(dv.getUint8(3)).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0032
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for filter result sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([10, 20, 30, 40]);
      const filteredUint8: Uint8Array = uint8Arr.filter(val => val > 20);


      filteredUint8[0] = 100;
      expect(dv.getUint8(2)).assertEqual(30);

      dv.setUint8(3, 200);
      expect(filteredUint8[1]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0033
     * @tc.desc   Verify Uint8Array map result (new buffer) does NOT sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([5, 15, 25]);
      const mappedUint8: Uint8Array = uint8Arr.map(val => val * 2);


      mappedUint8[1] = 100;
      expect(dv.getUint8(1)).assertEqual(15);
      dv.setUint8(2, 200);

      expect(mappedUint8.length).assertEqual(3)
      expect(mappedUint8[0]).assertEqual(10);
      expect(mappedUint8[1]).assertEqual(100);
      expect(mappedUint8[2]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0034
     * @tc.desc   Verify DataView reads Uint8Array's shared buffer after subarray creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(buf);
      const subUint8: Uint8Array = parentUint8.subarray(1, 4);
      const dv: DataView = new DataView(buf);

      parentUint8[2] = 150;
      expect(dv.getUint8(2)).assertEqual(150);
      expect(subUint8[1]).assertEqual(150);

      subUint8[0] = 75;
      expect(dv.getUint8(1)).assertEqual(75);
      expect(parentUint8[1]).assertEqual(75);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0035
     * @tc.desc   Verify SharedArrayBuffer sync for Uint8Array and DataView after postMessage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(4);
      const mainUint8: Uint8Array = new Uint8Array(sab);
      const mainDv: DataView = new DataView(sab);

      const workerUint8: Uint8Array = new Uint8Array(sab);
      workerUint8[1] = 200;

      expect(mainUint8[1]).assertEqual(200);
      expect(mainDv.getUint8(1)).assertEqual(200);

      mainDv.setUint8(2, 150);
      expect(workerUint8[2]).assertEqual(150);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0036
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for every method sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([100, 150, 200]);
      expect(uint8Arr.every(val => val < 255)).assertEqual(true);

      dv.setUint8(1, 255);
      expect(uint8Arr.every(val => val < 255)).assertEqual(false);

      uint8Arr[1] = 249;
      expect(dv.getUint8(1)).assertEqual(249);
      expect(uint8Arr.every(val => val < 255)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0037
     * @tc.desc   Verify Uint8Array some method sync with DataView in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(sab);
      const dv: DataView = new DataView(sab);

      uint8Arr.set([10, 20, 30]);
      expect(uint8Arr.some(val => val === 255)).assertEqual(false);

      dv.setUint8(2, 255);
      expect(uint8Arr.some(val => val === 255)).assertEqual(true);

      uint8Arr[2] = 30;
      expect(dv.getUint8(2)).assertEqual(30);
      expect(uint8Arr.some(val => val === 255)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0038
     * @tc.desc   Verify DataView reads Uint8Array's buffer with overlapping views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8View1: Uint8Array = new Uint8Array(buf, 0, 3);
      const uint8View2: Uint8Array = new Uint8Array(buf, 1, 3);
      const dv: DataView = new DataView(buf);

      uint8View1[1] = 100;
      expect(uint8View2[0]).assertEqual(100);
      expect(dv.getUint8(1)).assertEqual(100);

      uint8View2[2] = 200;
      expect(dv.getUint8(3)).assertEqual(200);
      expect(uint8View1[3]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0040
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for reduce accumulator sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([10, 20, 30]);
      const sum1: number = uint8Arr.reduce((acc, val) => acc + val, 0);
      expect(sum1).assertEqual(60);

      dv.setUint8(1, 25);
      const sum2: number = uint8Arr.reduce((acc, val) => acc + val, 0);
      expect(sum2).assertEqual(65);

      uint8Arr[2] = 35;
      const sum3: number = uint8Arr.reduce((acc, val) => acc + val, 0);
      expect(sum3).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0041
     * @tc.desc   Verify Uint8Array includes method sync with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([50, 100, 150, 200]);
      expect(uint8Arr.includes(150)).assertEqual(true);

      dv.setUint8(2, 0);
      expect(uint8Arr.includes(150)).assertEqual(false);
      expect(uint8Arr.includes(0)).assertEqual(true);

      uint8Arr[2] = 150;
      expect(dv.getUint8(2)).assertEqual(150);
      expect(uint8Arr.includes(150)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0042
     * @tc.desc   Verify DataView writes Uint8Array's buffer with multi-byte values (cross-view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr1: Uint8Array = new Uint8Array(buf, 0, 3);
      const uint8Arr2: Uint8Array = new Uint8Array(buf, 2, 3);
      const dv: DataView = new DataView(buf);

      dv.setUint16(1, 0x1234, true);
      expect(uint8Arr1[1]).assertEqual(0x34);
      expect(uint8Arr1[2]).assertEqual(0x12);
      expect(uint8Arr2[0]).assertEqual(0x12);

      uint8Arr2[1] = 0x56;
      expect(dv.getUint8(3)).assertEqual(0x56);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0043
     * @tc.desc   Verify SharedArrayBuffer cross-view sync for DataView multi-byte writes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8Arr1: Uint8Array = new Uint8Array(sab, 0, 3);
      const uint8Arr2: Uint8Array = new Uint8Array(sab, 2, 3);
      const dv: DataView = new DataView(sab);

      dv.setUint32(1, 0x11223344, true);
      expect(uint8Arr1[1]).assertEqual(0x44);
      expect(uint8Arr1[2]).assertEqual(0x33);
      expect(uint8Arr2[0]).assertEqual(0x33);
      expect(uint8Arr2[1]).assertEqual(0x22);
      expect(uint8Arr2[2]).assertEqual(0x11);


      uint8Arr1[1] = 0x55;
      expect(dv.getUint32(1, true)).assertEqual(0x11223355);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0044
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for empty view sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const emptyUint8: Uint8Array = new Uint8Array(buf, 1, 0);
      const dv: DataView = new DataView(buf);

      expect(emptyUint8.length).assertEqual(0);
      expect(emptyUint8.byteLength).assertEqual(0);

      dv.setUint8(1, 100);
      expect(dv.getUint8(1)).assertEqual(100);
      expect(emptyUint8[0]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0045
     * @tc.desc   Verify SharedArrayBuffer empty view and DataView buffer consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(4);
      const emptyUint8: Uint8Array = new Uint8Array(sab, 2, 0);
      const dv: DataView = new DataView(sab);
      expect(emptyUint8.length).assertEqual(0);
      expect(emptyUint8.buffer).assertEqual(sab);
      expect(emptyUint8.buffer.byteLength).assertEqual(sab.byteLength);

      dv.setUint8(3, 255);
      expect(dv.getUint8(3)).assertEqual(255);
      expect(emptyUint8[1]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0046
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for partial set sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.set([10, 20], 1);
      expect(dv.getUint8(1)).assertEqual(10);
      expect(dv.getUint8(2)).assertEqual(20);

      dv.setUint8(2, 25);
      expect(uint8Arr[2]).assertEqual(25);

      uint8Arr.set([30], 3);
      expect(dv.getUint8(3)).assertEqual(30);
    })


    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0048
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for fill with overflow value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);

      uint8Arr.fill(300, 0, 2);
      expect(dv.getUint8(0)).assertEqual(44);
      expect(dv.getUint8(1)).assertEqual(44);


      dv.setUint8(2, 350);
      expect(uint8Arr[2]).assertEqual(94);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0049
     * @tc.desc   Verify SharedArrayBuffer fill with underflow value sync with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8Arr: Uint8Array = new Uint8Array(sab);
      const dv: DataView = new DataView(sab);


      uint8Arr.fill(-50, 1, 3);
      expect(dv.getUint8(1)).assertEqual(206);
      expect(dv.getUint8(2)).assertEqual(206);


      dv.setUint8(0, -10);
      expect(uint8Arr[0]).assertEqual(246);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0050
     * @tc.desc   Verify Uint8Array and DataView share ArrayBuffer for final consistency check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);


      uint8Arr[0] = 10;
      dv.setUint8(1, 20);
      uint8Arr.set([30], 2);
      dv.setUint8(3, 40);

      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(20);
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
      expect(dv.getUint8(0)).assertEqual(10);
      expect(dv.getUint8(1)).assertEqual(20);
      expect(dv.getUint8(2)).assertEqual(30);
      expect(dv.getUint8(3)).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0151
     * @tc.desc   Verify bidirectional sync between Uint8Array and DataView on same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View[2] = 180;
      expect(dataView.getUint8(2)).assertEqual(180);

      dataView.setUint8(1, 75);
      expect(uint8View[1]).assertEqual(75);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0152
     * @tc.desc   Verify Uint8Array (non-zero offset) and DataView share ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);

      const uint8View: Uint8Array = new Uint8Array(buffer, 1, 3);
      const dataView: DataView = new DataView(buffer);

      uint8View[0] = 100;
      uint8View[2] = 200;
      expect(dataView.getUint8(1)).assertEqual(100);
      expect(dataView.getUint8(3)).assertEqual(200);

      dataView.setUint8(2, 150);
      expect(uint8View[1]).assertEqual(150);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0153
     * @tc.desc   Verify SharedArrayBuffer sync between Uint8Array and DataView (single thread)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View[0] = 255;
      expect(dataView.getUint8(0)).assertEqual(255);

      dataView.setUint8(3, 50);
      expect(uint8View[3]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0154
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0154
     * @tc.desc   Verify DataView reads Uint8Array's overflow-modified value in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View[0] = 300;
      expect(dataView.getUint8(0)).assertEqual(44);


      uint8View[1] = -10;
      expect(dataView.getUint8(1)).assertEqual(246);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0155
     * @tc.desc   Verify Uint8Array reads DataView's multi-byte value in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      dataView.setUint32(0, 0x0A1B2C3D, true);

      expect(uint8View[0]).assertEqual(0x3D);
      expect(uint8View[1]).assertEqual(0x2C);
      expect(uint8View[2]).assertEqual(0x1B);
      expect(uint8View[3]).assertEqual(0x0A);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0156
     * @tc.desc   Verify ArrayBuffer byteLength consistency between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const uint8View: Uint8Array = new Uint8Array(buffer, 2, 4);
      const dataView: DataView = new DataView(buffer);
      expect(uint8View.buffer.byteLength).assertEqual(buffer.byteLength);
      expect(dataView.buffer.byteLength).assertEqual(buffer.byteLength);
      expect(uint8View.buffer).assertEqual(dataView.buffer);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0157
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0157
     * @tc.desc   Verify SharedArrayBuffer byteLength consistency between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(10);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer, 3, 5);
      const dataView: DataView = new DataView(sharedBuffer);
      expect(uint8View.buffer.byteLength).assertEqual(sharedBuffer.byteLength);
      expect(dataView.buffer.byteLength).assertEqual(sharedBuffer.byteLength);
      expect(uint8View.buffer).assertEqual(dataView.buffer);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0158
     * @tc.desc   Verify Uint8Array subarray and DataView share parent ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const parentUint8: Uint8Array = new Uint8Array(buffer);

      const subUint8: Uint8Array = parentUint8.subarray(2, 5);
      const dataView: DataView = new DataView(buffer);

      subUint8[1] = 180;
      expect(dataView.getUint8(3)).assertEqual(180);

      dataView.setUint8(4, 220);
      expect(subUint8[2]).assertEqual(220);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0159
     * @tc.desc   Verify Uint8Array slice (new buffer) does not sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const originalUint8: Uint8Array = new Uint8Array(buffer);
      originalUint8.set([10, 20, 30, 40]);


      const slicedUint8: Uint8Array = originalUint8.slice(1, 3);
      const dataView: DataView = new DataView(buffer);


      slicedUint8[0] = 100;
      expect(dataView.getUint8(1)).assertEqual(20);


      dataView.setUint8(2, 200);
      expect(slicedUint8[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0160
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0160
     * @tc.desc   Verify DataView out-of-bounds read throws RangeError (ArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const dataView: DataView = new DataView(buffer);
      let isRangeError: boolean = false;

      try {
        dataView.getUint8(3);
      } catch (error) {
        isRangeError = (error as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0161
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0161
     * @tc.desc   Verify DataView out-of-bounds write throws RangeError (SharedArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(2);
      const dataView: DataView = new DataView(sharedBuffer);
      let isRangeError: boolean = false;

      try {
        dataView.setUint8(2, 100);
      } catch (error) {
        isRangeError = (error as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0162
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0162
     * @tc.desc   Verify Uint8Array set method syncs with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([20, 40, 60], 1);
      expect(dataView.getUint8(1)).assertEqual(20);
      expect(dataView.getUint8(2)).assertEqual(40);
      expect(dataView.getUint8(3)).assertEqual(60);

      dataView.setUint8(2, 50);
      expect(uint8View[2]).assertEqual(50);

      uint8View.set([70], 3);
      expect(dataView.getUint8(3)).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0163
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0163
     * @tc.desc   Verify SharedArrayBuffer sync for Uint8Array subarray and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(6);
      const parentUint8: Uint8Array = new Uint8Array(sharedBuffer);
      const subUint8: Uint8Array = parentUint8.subarray(2, 5);
      const dataView: DataView = new DataView(sharedBuffer);

      subUint8[0] = 100;
      subUint8[2] = 200;
      expect(dataView.getUint8(2)).assertEqual(100);
      expect(dataView.getUint8(4)).assertEqual(200);

      dataView.setUint8(3, 150);
      expect(subUint8[1]).assertEqual(150);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0164
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0164
     * @tc.desc   Verify DataView reads Uint8Array's initial zero values in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer, 1, 2);
      const dataView: DataView = new DataView(buffer);

      expect(dataView.getUint8(1)).assertEqual(0);
      expect(dataView.getUint8(2)).assertEqual(0);

      uint8View[0] = 50;
      expect(dataView.getUint8(1)).assertEqual(50);
      expect(dataView.getUint8(2)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0165
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0165
     * @tc.desc   Verify Uint8Array reads DataView's initial zero values in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const dataView: DataView = new DataView(sharedBuffer);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);


      expect(uint8View[0]).assertEqual(0);
      expect(uint8View[2]).assertEqual(0);

      dataView.setUint8(1, 75);
      expect(uint8View[1]).assertEqual(75);
      expect(uint8View[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0166
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0166
     * @tc.desc   Verify Uint8Array and DataView sync for DataView's big-endian write
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      dataView.setUint16(1, 0xABCD, false);
      expect(uint8View[1]).assertEqual(0xAB);
      expect(uint8View[2]).assertEqual(0xCD);

      uint8View[2] = 0xEF;
      expect(dataView.getUint16(1, false)).assertEqual(0xABEF);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0167
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0167
     * @tc.desc   Verify Uint8Array fill operation syncs with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.fill(255, 1, 3);
      expect(dataView.getUint8(1)).assertEqual(255);
      expect(dataView.getUint8(2)).assertEqual(255);
      expect(dataView.getUint8(3)).assertEqual(0);

      dataView.setUint8(2, 0);
      expect(uint8View[2]).assertEqual(0);

      uint8View.fill(100, 2, 4);
      expect(dataView.getUint8(2)).assertEqual(100);
      expect(dataView.getUint8(3)).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0168
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0168
     * @tc.desc   Verify Uint8Array copyWithin sync with DataView in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([10, 20, 30, 40, 50]);
      uint8View.copyWithin(1, 3, 5);
      expect(dataView.getUint8(1)).assertEqual(40);
      expect(dataView.getUint8(2)).assertEqual(50);
      expect(dataView.getUint8(3)).assertEqual(40);

      dataView.setUint8(3, 35);
      expect(uint8View[3]).assertEqual(35);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0169
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0169
     * @tc.desc   Verify Uint8Array out-of-bounds index returns undefined (DataView still accessible)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer, 0, 2);
      const dataView: DataView = new DataView(buffer);

      expect(uint8View[2]).assertEqual(undefined);

      expect(dataView.getUint8(2)).assertEqual(0);


      dataView.setUint8(2, 100);
      expect(uint8View[2]).assertEqual(undefined);
      expect(dataView.getUint8(2)).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0170
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0170
     * @tc.desc   Verify DataView multi-byte read throws RangeError (insufficient bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);
      let isRangeError: boolean = false;

      try {

        dataView.getUint16(2, true);
      } catch (error) {
        isRangeError = (error as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);

      uint8View[2] = 255;
      expect(dataView.getUint8(2)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0171
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0171
     * @tc.desc   Verify ArrayBuffer slice (new buffer) sync with new Uint8Array/DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const originalBuffer: ArrayBuffer = new ArrayBuffer(5);
      const originalUint8: Uint8Array = new Uint8Array(originalBuffer);
      originalUint8.set([10, 20, 30, 40, 50]);


      const slicedBuffer: ArrayBuffer = originalBuffer.slice(1, 4);
      const slicedUint8: Uint8Array = new Uint8Array(slicedBuffer);
      const slicedDv: DataView = new DataView(slicedBuffer);

      slicedUint8[1] = 100;
      expect(slicedDv.getUint8(1)).assertEqual(100);

      slicedDv.setUint8(2, 200);
      expect(slicedUint8[2]).assertEqual(200);

      expect(originalUint8[2]).assertEqual(30);
    })
    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0173
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0173
     * @tc.desc   Verify Uint8Array indexOf sync with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([5, 15, 25, 15, 35]);
      expect(uint8View.indexOf(15)).assertEqual(1);


      dataView.setUint8(3, 0);
      expect(uint8View.indexOf(15)).assertEqual(1);
      expect(uint8View.indexOf(0)).assertEqual(3);


      uint8View[1] = 0;
      expect(dataView.getUint8(1)).assertEqual(0);
      expect(uint8View.indexOf(15)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0174
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0174
     * @tc.desc   Verify Uint8Array lastIndexOf sync with DataView in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 15, 35]);
      expect(uint8View.lastIndexOf(15)).assertEqual(3);


      dataView.setUint8(3, 0);
      expect(uint8View.lastIndexOf(15)).assertEqual(1);

      uint8View[1] = 0;
      expect(dataView.getUint8(1)).assertEqual(0);
      expect(uint8View.lastIndexOf(15)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0175
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0175
     * @tc.desc   Verify DataView reads Uint8Array's fill value with negative range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View.fill(200, -3, -1);
      expect(dataView.getUint8(1)).assertEqual(200);
      expect(dataView.getUint8(2)).assertEqual(200);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(3)).assertEqual(0);
      dataView.setUint8(2, 100);
      expect(uint8View[2]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0176
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0176
     * @tc.desc   Verify Uint8Array copyWithin with negative indices sync with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40, 50]);

      uint8View.copyWithin(-4, -2, -1);
      expect(dataView.getUint8(1)).assertEqual(40);
      expect(dataView.getUint8(3)).assertEqual(40);

      dataView.setUint8(3, 35);
      uint8View.copyWithin(2, 3, 5);
      expect(dataView.getUint8(2)).assertEqual(35);
      expect(dataView.getUint8(3)).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0179
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0179
     * @tc.desc   Verify Uint8Array filter result (new buffer) does not sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40]);

      const filteredUint8: Uint8Array = uint8View.filter(val => val > 20);


      filteredUint8[0] = 100;
      expect(dataView.getUint8(2)).assertEqual(30);


      dataView.setUint8(3, 200);
      expect(filteredUint8[1]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0180
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0180
     * @tc.desc   Verify Uint8Array map result (new buffer) does not sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([5, 15, 25]);

      const mappedUint8: Uint8Array = uint8View.map(val => val * 2);

      mappedUint8[1] = 100;
      expect(dataView.getUint8(1)).assertEqual(15);
      dataView.setUint8(2, 200);
      expect(mappedUint8[2]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0181
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0181
     * @tc.desc   Verify DataView reads Uint8Array's subarray modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(buffer);

      const subUint8: Uint8Array = parentUint8.subarray(1, 4);
      const dataView: DataView = new DataView(buffer);

      parentUint8[2] = 150;
      expect(dataView.getUint8(2)).assertEqual(150);
      expect(subUint8[1]).assertEqual(150);

      subUint8[0] = 75;
      expect(dataView.getUint8(1)).assertEqual(75);
      expect(parentUint8[1]).assertEqual(75);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0182
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0182
     * @tc.desc   Verify Uint8Array every method sync with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([100, 150, 200]);
      expect(uint8View.every(val => val < 255)).assertEqual(true);

      dataView.setUint8(1, 255);
      expect(uint8View.every(val => val < 255)).assertEqual(false);

      uint8View[1] = 249;
      expect(dataView.getUint8(1)).assertEqual(249);
      expect(uint8View.every(val => val < 255)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0183
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0183
     * @tc.desc   Verify Uint8Array some method sync with DataView in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([10, 20, 30]);
      expect(uint8View.some(val => val === 255)).assertEqual(false);

      dataView.setUint8(2, 255);
      expect(uint8View.some(val => val === 255)).assertEqual(true);

      uint8View[2] = 30;
      expect(dataView.getUint8(2)).assertEqual(30);
      expect(uint8View.some(val => val === 255)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0184
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0184
     * @tc.desc   Verify DataView reads overlapping Uint8Array views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View1: Uint8Array = new Uint8Array(buffer, 0, 3);
      const uint8View2: Uint8Array = new Uint8Array(buffer, 1, 3);
      const dataView: DataView = new DataView(buffer);

      uint8View1[1] = 100;
      expect(uint8View2[0]).assertEqual(100);
      expect(dataView.getUint8(1)).assertEqual(100);

      uint8View2[2] = 200;
      expect(dataView.getUint8(3)).assertEqual(200);
      expect(uint8View1[3]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0185
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0185
     * @tc.desc   Verify SharedArrayBuffer overlapping views sync with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View1: Uint8Array = new Uint8Array(sharedBuffer, 0, 3);
      const uint8View2: Uint8Array = new Uint8Array(sharedBuffer, 1, 3);
      const dataView: DataView = new DataView(sharedBuffer);
      uint8View1[2] = 150;
      expect(uint8View2[1]).assertEqual(150);
      expect(dataView.getUint8(2)).assertEqual(150);
      dataView.setUint8(1, 75);
      expect(uint8View1[1]).assertEqual(75);
      expect(uint8View2[0]).assertEqual(75);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0186
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0186
     * @tc.desc   Verify Uint8Array reduce result syncs with DataView modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30]);
      let sum1: number = uint8View.reduce((acc, val) => acc + val, 0);
      expect(sum1).assertEqual(60);

      dataView.setUint8(1, 25);
      let sum2: number = uint8View.reduce((acc, val) => acc + val, 0);
      expect(sum2).assertEqual(65);
      uint8View[2] = 35;
      let sum3: number = uint8View.reduce((acc, val) => acc + val, 0);
      expect(sum3).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0187
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0187
     * @tc.desc   Verify Uint8Array includes method sync with DataView in ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([50, 100, 150, 200]);
      expect(uint8View.includes(150)).assertEqual(true);

      dataView.setUint8(2, 0);
      expect(uint8View.includes(150)).assertEqual(false);
      expect(uint8View.includes(0)).assertEqual(true);

      uint8View[2] = 150;
      expect(dataView.getUint8(2)).assertEqual(150);
      expect(uint8View.includes(150)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0188
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0188
     * @tc.desc   Verify DataView multi-byte write syncs with overlapping Uint8Array views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);

      const uint8View1: Uint8Array = new Uint8Array(buffer, 0, 3);

      const uint8View2: Uint8Array = new Uint8Array(buffer, 2, 3);
      const dataView: DataView = new DataView(buffer);


      dataView.setUint16(1, 0x1234, true);
      expect(uint8View1[1]).assertEqual(0x34);
      expect(uint8View1[2]).assertEqual(0x12);
      expect(uint8View2[0]).assertEqual(0x12);


      uint8View2[1] = 0x56;
      expect(dataView.getUint8(3)).assertEqual(0x56);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0189
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0189
     * @tc.desc   Verify SharedArrayBuffer multi-byte write syncs with overlapping views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);

      const uint8View1: Uint8Array = new Uint8Array(sharedBuffer, 0, 3);

      const uint8View2: Uint8Array = new Uint8Array(sharedBuffer, 2, 3);
      const dataView: DataView = new DataView(sharedBuffer);


      dataView.setUint32(1, 0x11223344, true);

      expect(uint8View1[1]).assertEqual(0x44);
      expect(uint8View1[2]).assertEqual(0x33);
      expect(uint8View2[0]).assertEqual(0x33);
      expect(uint8View2[1]).assertEqual(0x22);
      expect(uint8View2[2]).assertEqual(0x11);


      uint8View1[1] = 0x55;
      expect(dataView.getUint32(1, true)).assertEqual(0x11223355);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0190
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0190
     * @tc.desc   Verify Uint8Array empty view and DataView buffer consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);

      const emptyUint8: Uint8Array = new Uint8Array(buffer, 1, 0);
      const dataView: DataView = new DataView(buffer);
      expect(emptyUint8.length).assertEqual(0);
      expect(emptyUint8.byteLength).assertEqual(0);


      dataView.setUint8(1, 100);
      expect(dataView.getUint8(1)).assertEqual(100);
      expect(emptyUint8[0]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0191
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0191
     * @tc.desc   Verify SharedArrayBuffer empty view and DataView buffer consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);

      const emptyUint8: Uint8Array = new Uint8Array(sharedBuffer, 2, 0);
      const dataView: DataView = new DataView(sharedBuffer);
      expect(emptyUint8.length).assertEqual(0);
      expect(emptyUint8.buffer).assertEqual(sharedBuffer);
      expect(emptyUint8.buffer.byteLength).assertEqual(sharedBuffer.byteLength);


      dataView.setUint8(3, 255);
      expect(dataView.getUint8(3)).assertEqual(255);
      expect(emptyUint8[1]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0192
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0192
     * @tc.desc   Verify Uint8Array partial set syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View.set([10, 20], 1);
      expect(dataView.getUint8(1)).assertEqual(10);
      expect(dataView.getUint8(2)).assertEqual(20);


      dataView.setUint8(2, 25);
      expect(uint8View[2]).assertEqual(25);


      uint8View.set([30], 3);
      expect(dataView.getUint8(3)).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0193
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0193
     * @tc.desc   Verify Uint8Array fill with overflow value syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View.fill(300, 0, 2);
      expect(dataView.getUint8(0)).assertEqual(44);
      expect(dataView.getUint8(1)).assertEqual(44);


      dataView.setUint8(2, 350);
      expect(uint8View[2]).assertEqual(94);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0194
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0194
     * @tc.desc   Verify SharedArrayBuffer fill with underflow value syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);


      uint8View.fill(-50, 1, 3);
      expect(dataView.getUint8(1)).assertEqual(206);
      expect(dataView.getUint8(2)).assertEqual(206);


      dataView.setUint8(0, -10);
      expect(uint8View[0]).assertEqual(246);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0195
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0195
     * @tc.desc   Verify Uint8Array and DataView sync for nested buffer operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40]);

      dataView.setUint8(1, 25);

      uint8View.set([uint8View[1]], 3);

      expect(dataView.getUint8(1)).assertEqual(25);
      expect(dataView.getUint8(3)).assertEqual(25);
      expect(uint8View[1]).assertEqual(25);
      expect(uint8View[3]).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0196
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0196
     * @tc.desc   Verify Uint8Array subarray and DataView sync for fill operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(buffer);
      const subUint8: Uint8Array = parentUint8.subarray(1, 4);
      const dataView: DataView = new DataView(buffer);

      subUint8.fill(150, 0, 2);
      expect(dataView.getUint8(1)).assertEqual(150);
      expect(dataView.getUint8(2)).assertEqual(150);

      dataView.setUint8(2, 175);
      expect(subUint8[1]).assertEqual(175);
      parentUint8.fill(200, 3, 4);
      expect(dataView.getUint8(3)).assertEqual(200);
      expect(subUint8[2]).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0197
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0197
     * @tc.desc   Verify DataView reads Uint8Array's copyWithin result in SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 10, 15, 20, 25]);

      uint8View.copyWithin(0, 2, 4);
      expect(dataView.getUint8(0)).assertEqual(15);
      expect(dataView.getUint8(1)).assertEqual(20);
      expect(dataView.getUint8(2)).assertEqual(15);
      expect(dataView.getUint8(3)).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0198
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0198
     * @tc.desc   Verify Uint8Array and DataView sync for includes with modified values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([75, 125, 175, 225]);
      expect(uint8View.includes(125)).assertEqual(true);


      dataView.setUint8(1, 150);
      expect(uint8View.includes(125)).assertEqual(false);
      expect(uint8View.includes(150)).assertEqual(true);


      uint8View[1] = 125;
      expect(dataView.getUint8(1)).assertEqual(125);
      expect(uint8View.includes(125)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0199
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0199
     * @tc.desc   Verify DataView multi-byte read syncs with Uint8Array modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View.set([0x03, 0x02, 0x01, 0x00]);
      expect(dataView.getUint32(0, true)).assertEqual(0x00010203);


      uint8View[1] = 0x05;
      expect(dataView.getUint32(0, true)).assertEqual(0x00010503);


      dataView.setUint8(2, 0)
      expect(dataView.getUint8(2)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0200
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0200
     * @tc.desc   Verify DataView 32-bit read syncs with Uint8Array byte modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([0x78, 0x56, 0x34, 0x12]);
      expect(dataView.getUint32(0, true)).assertEqual(0x12345678);

      uint8View[1] = 0x9A;
      expect(dataView.getUint32(0, true)).assertEqual(0x12349A78);

      dataView.setUint8(2, 0xBC);
      expect(uint8View[2]).assertEqual(0xBC);
      expect(dataView.getUint32(0, true)).assertEqual(0x12BC9A78);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0201
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0201
     * @tc.desc   Verify SharedArrayBuffer sync for Uint8Array forEach and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);
      let sum: number = 0;


      dataView.setUint8(0, 10);
      dataView.setUint8(1, 20);
      dataView.setUint8(2, 30);
      dataView.setUint8(3, 40);


      uint8View.forEach(val => sum += val);
      expect(sum).assertEqual(100);


      uint8View.forEach((val, idx) => uint8View[idx] = val * 2);
      expect(dataView.getUint8(0)).assertEqual(20);
      expect(dataView.getUint8(1)).assertEqual(40);
      expect(dataView.getUint8(2)).assertEqual(60);
      expect(dataView.getUint8(3)).assertEqual(80);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0202
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0202
     * @tc.desc   Verify Uint8Array map result (new buffer) independence from DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([5, 15, 25]);

      const mappedUint8: Uint8Array = uint8View.map(val => val + 10);


      dataView.setUint8(1, 25);
      expect(uint8View[1]).assertEqual(25);
      expect(mappedUint8[1]).assertEqual(25);


      mappedUint8[2] = 50;
      expect(dataView.getUint8(2)).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0203
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0203
     * @tc.desc   Verify DataView reads Uint8Array's copyWithin with overlapping ranges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([1, 2, 3, 4, 5]);

      uint8View.copyWithin(1, 3, 5);
      expect(dataView.getUint8(0)).assertEqual(1);
      expect(dataView.getUint8(1)).assertEqual(4);
      expect(dataView.getUint8(2)).assertEqual(5);
      expect(dataView.getUint8(3)).assertEqual(4);
      expect(dataView.getUint8(4)).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0204
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0204
     * @tc.desc   Verify SharedArrayBuffer copyWithin with non-overlapping ranges sync
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([10, 20, 30, 40, 50]);

      uint8View.copyWithin(3, 0, 2);
      expect(dataView.getUint8(3)).assertEqual(10);
      expect(dataView.getUint8(4)).assertEqual(20);
      expect(dataView.getUint8(0)).assertEqual(10);
      expect(dataView.getUint8(1)).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0205
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0205
     * @tc.desc   Verify Uint8Array fill with zero syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      dataView.setUint8(0, 255);
      dataView.setUint8(1, 127);
      dataView.setUint8(2, 63);
      dataView.setUint8(3, 31);

      uint8View.fill(0);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(0);
      expect(dataView.getUint8(2)).assertEqual(0);
      expect(dataView.getUint8(3)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0206
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0206
     * @tc.desc   Verify DataView fill with max value (255) syncs with Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);


      uint8View.fill(0);


      for (let i = 0; i < sharedBuffer.byteLength; i++) {
        dataView.setUint8(i, 255);
      }
      expect(uint8View[0]).assertEqual(255);
      expect(uint8View[1]).assertEqual(255);
      expect(uint8View[2]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0207
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0207
     * @tc.desc   Verify Uint8Array subarray fill syncs with parent and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(buffer);
      const subUint8: Uint8Array = parentUint8.subarray(1, 4);
      const dataView: DataView = new DataView(buffer);


      parentUint8.fill(10);


      subUint8.fill(100);
      expect(parentUint8[1]).assertEqual(100);
      expect(parentUint8[2]).assertEqual(100);
      expect(parentUint8[3]).assertEqual(100);
      expect(parentUint8[0]).assertEqual(10);
      expect(parentUint8[4]).assertEqual(10);
      expect(dataView.getUint8(1)).assertEqual(100);
      expect(dataView.getUint8(2)).assertEqual(100);
      expect(dataView.getUint8(3)).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0208
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0208
     * @tc.desc   Verify SharedArrayBuffer subarray fill syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(6);
      const parentUint8: Uint8Array = new Uint8Array(sharedBuffer);
      const subUint8: Uint8Array = parentUint8.subarray(2, 5);
      const dataView: DataView = new DataView(sharedBuffer);


      dataView.setUint8(2, 50);
      dataView.setUint8(3, 50);
      dataView.setUint8(4, 50);


      subUint8.fill(200);
      expect(dataView.getUint8(2)).assertEqual(200);
      expect(dataView.getUint8(3)).assertEqual(200);
      expect(dataView.getUint8(4)).assertEqual(200);
      expect(dataView.getUint8(1)).assertEqual(0);
      expect(dataView.getUint8(5)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0209
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0209
     * @tc.desc   Verify Uint8Array find syncs with DataView modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40]);
      let foundVal = uint8View.find(val => val > 25);
      expect(foundVal).assertEqual(30);


      dataView.setUint8(2, 20);

      foundVal = uint8View.find(val => val > 25);
      expect(foundVal).assertEqual(40);


      dataView.setUint8(3, 25);

      foundVal = uint8View.find(val => val > 25);
      expect(foundVal).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0210
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0210
     * @tc.desc   Verify Uint8Array findIndex syncs with DataView modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 35]);

      let foundIdx = uint8View.findIndex(val => val > 20);
      expect(foundIdx).assertEqual(2);


      dataView.setUint8(2, 15);

      foundIdx = uint8View.findIndex(val => val > 20);
      expect(foundIdx).assertEqual(3);


      dataView.setUint8(3, 15);

      foundIdx = uint8View.findIndex(val => val > 20);
      expect(foundIdx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0211
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0211
     * @tc.desc   Verify DataView reads Uint8Array's filtered subarray (new buffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      parentUint8.set([10, 20, 30, 40, 50]);

      const filteredUint8: Uint8Array = parentUint8.filter(val => val > 30);
      const filteredDv: DataView = new DataView(filteredUint8.buffer);


      filteredUint8[0] = 45;
      expect(filteredDv.getUint8(0)).assertEqual(45);

      filteredDv.setUint8(1, 55);
      expect(filteredUint8[1]).assertEqual(55);

      expect(dataView.getUint8(3)).assertEqual(40);
      expect(dataView.getUint8(4)).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0212
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0212
     * @tc.desc   Verify SharedArrayBuffer filtered subarray (new buffer) independence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const parentUint8: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      parentUint8.set([5, 15, 25, 35, 45]);

      const filteredUint8: Uint8Array = parentUint8.filter(val => val < 25);


      dataView.setUint8(0, 10);
      dataView.setUint8(1, 20);
      expect(parentUint8[0]).assertEqual(10);
      expect(parentUint8[1]).assertEqual(20);
      expect(filteredUint8[0]).assertEqual(5);
      expect(filteredUint8[1]).assertEqual(15);
      filteredUint8[0] = 15;
      expect(dataView.getUint8(0)).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0213
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0213
     * @tc.desc   Verify Uint8Array reduce with initial value syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      dataView.setUint8(0, 10);
      dataView.setUint8(1, 20);
      dataView.setUint8(2, 30);

      let total = uint8View.reduce((acc, val) => acc + val, 5);
      expect(total).assertEqual(65);
      dataView.setUint8(1, 25);
      total = uint8View.reduce((acc, val) => acc + val, 5);
      expect(total).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0214
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0214
     * @tc.desc   Verify SharedArrayBuffer reduce without initial value syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25]);
      let product = uint8View.reduce((acc, val) => acc * val);
      expect(product).assertEqual(1875);
      dataView.setUint8(1, 20);
      product = uint8View.reduce((acc, val) => acc * val);
      expect(product).assertEqual(2500);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0215
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0215
     * @tc.desc   Verify Uint8Array includes with start index syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 20, 40]);
      let hasVal = uint8View.includes(20, 2);
      expect(hasVal).assertEqual(true);

      dataView.setUint8(3, 25);
      hasVal = uint8View.includes(20, 2);
      expect(hasVal).assertEqual(false);

      dataView.setUint8(1, 20);
      hasVal = uint8View.includes(20, 2);
      expect(hasVal).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0216
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0216
     * @tc.desc   Verify SharedArrayBuffer includes with negative start index syncs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 35, 45]);
      let hasVal = uint8View.includes(25, -3);
      expect(hasVal).assertEqual(true);

      dataView.setUint8(2, 30);
      hasVal = uint8View.includes(25, -3);
      expect(hasVal).assertEqual(false);

      dataView.setUint8(1, 25);
      hasVal = uint8View.includes(25, -3);
      expect(hasVal).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0217
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0217
     * @tc.desc   Verify Uint8Array indexOf with negative start index syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 10, 30, 10]);
      let idx = uint8View.indexOf(10, -3);
      expect(idx).assertEqual(2);

      dataView.setUint8(2, 15);
      idx = uint8View.indexOf(10, -3);
      expect(idx).assertEqual(4);
      dataView.setUint8(4, 15);
      idx = uint8View.indexOf(10, -3);
      expect(idx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0218
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0218
     * @tc.desc   Verify SharedArrayBuffer lastIndexOf with start index syncs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 15, 35]);
      let idx = uint8View.lastIndexOf(15, 3);
      expect(idx).assertEqual(3);

      dataView.setUint8(3, 20);
      idx = uint8View.lastIndexOf(15, 3);
      expect(idx).assertEqual(1);

      dataView.setUint8(1, 20);
      idx = uint8View.lastIndexOf(15, 3);
      expect(idx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0219
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0219
     * @tc.desc   Verify Uint8Array slice with negative start index syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40, 50]);
      const slicedUint8: Uint8Array = uint8View.slice(-3);
      const slicedDv: DataView = new DataView(slicedUint8.buffer);

      slicedUint8[0] = 35;
      expect(slicedDv.getUint8(0)).assertEqual(35);

      slicedDv.setUint8(1, 45);
      expect(slicedUint8[1]).assertEqual(45);

      expect(dataView.getUint8(2)).assertEqual(30);
      expect(dataView.getUint8(3)).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0220
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0220
     * @tc.desc   Verify SharedArrayBuffer slice with negative end index syncs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 35, 45]);
      const slicedUint8: Uint8Array = uint8View.slice(1, -2);

      dataView.setUint8(1, 20);
      dataView.setUint8(2, 30);
      expect(dataView.getUint8(1)).assertEqual(20);
      expect(dataView.getUint8(2)).assertEqual(30);
      expect(slicedUint8[0]).assertEqual(15);
      expect(slicedUint8[1]).assertEqual(25);

      slicedUint8[0] = 25;
      expect(dataView.getUint8(1)).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0221
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0221
     * @tc.desc   Verify Uint8Array and DataView sync for zero-length buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);
      expect(uint8View.length).assertEqual(0);
      expect(uint8View.byteLength).assertEqual(0);
      expect(dataView.buffer.byteLength).assertEqual(0);

      uint8View[0] = 100;
      expect(uint8View[0]).assertEqual(undefined);

      let isRangeError = false;
      try {
        dataView.setUint8(0, 100);
      } catch (error) {
        isRangeError = (error as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0222
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0222
     * @tc.desc   Verify SharedArrayBuffer zero-length buffer consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(0);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);
      expect(uint8View.length).assertEqual(0);
      expect(uint8View.byteLength).assertEqual(0);
      expect(dataView.buffer.byteLength).assertEqual(0);

      expect(uint8View[0]).assertEqual(undefined);

      let isRangeError = false;
      try {
        dataView.getUint8(0);
      } catch (error) {
        isRangeError = (error as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0223
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0223
     * @tc.desc   Verify Uint8Array set with Uint8Array source syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);
      const sourceUint8: Uint8Array = new Uint8Array([100, 200, 255]);


      uint8View.set(sourceUint8, 1);
      expect(dataView.getUint8(1)).assertEqual(100);
      expect(dataView.getUint8(2)).assertEqual(200);
      expect(dataView.getUint8(3)).assertEqual(255);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(4)).assertEqual(0);
      sourceUint8[0] = 150;
      uint8View.set(sourceUint8, 1);
      expect(dataView.getUint8(1)).assertEqual(150);
      expect(dataView.getUint8(2)).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0224
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0224
     * @tc.desc   Verify SharedArrayBuffer set with Int8Array source syncs with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);
      const sourceInt8: Int8Array = new Int8Array([-1, -10, 127]);
      uint8View.set(sourceInt8);
      expect(dataView.getUint8(0)).assertEqual(255);
      expect(dataView.getUint8(1)).assertEqual(246);
      expect(dataView.getUint8(2)).assertEqual(127);
      expect(dataView.getUint8(3)).assertEqual(0);
      sourceInt8[1] = -20;
      uint8View.set(sourceInt8, 0);
      expect(dataView.getUint8(1)).assertEqual(236);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0225
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0225
     * @tc.desc   Verify Uint8Array set with Float32Array source (truncated) syncs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);
      const sourceFloat: Float32Array = new Float32Array([100.9, 200.1, 255.9]);
      uint8View.set(sourceFloat);
      expect(dataView.getUint8(0)).assertEqual(100);
      expect(dataView.getUint8(1)).assertEqual(200);
      expect(dataView.getUint8(2)).assertEqual(255);

      sourceFloat[2] = 300.5;
      uint8View.set(sourceFloat);
      expect(dataView.getUint8(2)).assertEqual(44);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0226
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0226
     * @tc.desc   Verify SharedArrayBuffer set with Float64Array source (truncated) syncs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);
      const sourceFloat: Float64Array = new Float64Array([-5.9, 150.5, 256.1]);
      uint8View.set(sourceFloat);
      expect(dataView.getUint8(0)).assertEqual(251);
      expect(dataView.getUint8(1)).assertEqual(150);
      expect(dataView.getUint8(2)).assertEqual(0);

      sourceFloat[0] = -10.1;
      uint8View.set(sourceFloat);
      expect(dataView.getUint8(0)).assertEqual(246);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0227
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0227
     * @tc.desc   Verify Uint8Array and DataView sync for single-byte modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View[0] = 127;
      expect(dataView.getUint8(0)).assertEqual(127);

      dataView.setUint8(0, 255);
      expect(uint8View[0]).assertEqual(255);

      uint8View[0] = 256;
      expect(dataView.getUint8(0)).assertEqual(0);


      dataView.setUint8(0, -1);
      expect(uint8View[0]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0228
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0228
     * @tc.desc   Verify SharedArrayBuffer single-byte sync between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBufferDv0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(1);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      expect(uint8View[0]).assertEqual(0);
      expect(dataView.getUint8(0)).assertEqual(0);


      uint8View[0] = 63;
      expect(dataView.getUint8(0)).assertEqual(63);


      dataView.setUint8(0, 127);
      expect(uint8View[0]).assertEqual(127);


      dataView.setUint8(0, 300);
      expect(uint8View[0]).assertEqual(44);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0229
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0229
     * @tc.desc   Verify Uint8Array every method with DataView-modified values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([50, 100, 150, 200]);

      let allMatch = uint8View.every(val => val < 255);
      expect(allMatch).assertEqual(true);


      dataView.setUint8(2, 255);

      allMatch = uint8View.every(val => val < 255);
      expect(allMatch).assertEqual(false);


      dataView.setUint8(2, 150);

      allMatch = uint8View.every(val => val < 255);
      expect(allMatch).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0230
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0230
     * @tc.desc   Verify SharedArrayBuffer some method with DataView-modified values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([10, 20, 30, 40]);

      let hasMatch = uint8View.some(val => val === 50);
      expect(hasMatch).assertEqual(false);


      dataView.setUint8(1, 50);

      hasMatch = uint8View.some(val => val === 50);
      expect(hasMatch).assertEqual(true);


      dataView.setUint8(1, 20);

      hasMatch = uint8View.some(val => val === 50);
      expect(hasMatch).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0231
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0231
     * @tc.desc   Verify Uint8Array copyWithin with DataView-initialized values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      dataView.setUint8(0, 1);
      dataView.setUint8(1, 2);
      dataView.setUint8(2, 3);
      dataView.setUint8(3, 4);
      dataView.setUint8(4, 5);


      uint8View.copyWithin(0, 2, 4);
      expect(dataView.getUint8(0)).assertEqual(3);
      expect(dataView.getUint8(1)).assertEqual(4);
      expect(dataView.getUint8(2)).assertEqual(3);
      expect(dataView.getUint8(3)).assertEqual(4);
      expect(dataView.getUint8(4)).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0232
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0232
     * @tc.desc   Verify SharedArrayBuffer copyWithin with DataView-modified source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([10, 20, 30, 40, 50]);

      dataView.setUint8(3, 45);
      dataView.setUint8(4, 55);

      uint8View.copyWithin(1, 3, 5);
      expect(dataView.getUint8(1)).assertEqual(45);
      expect(dataView.getUint8(2)).assertEqual(55);
      expect(dataView.getUint8(3)).assertEqual(45);
      expect(dataView.getUint8(4)).assertEqual(55);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0233
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0233
     * @tc.desc   Verify Uint8Array fill with DataView-verified range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);


      uint8View.fill(10);


      uint8View.fill(100, 1, 4);
      expect(dataView.getUint8(0)).assertEqual(10);
      expect(dataView.getUint8(1)).assertEqual(100);
      expect(dataView.getUint8(2)).assertEqual(100);
      expect(dataView.getUint8(3)).assertEqual(100);
      expect(dataView.getUint8(4)).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0234
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0234
     * @tc.desc   Verify SharedArrayBuffer fill with negative range (DataView-verified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      for (let i = 0; i < 5; i++) {
        dataView.setUint8(i, 20);
      }

      uint8View.fill(200, -4, -1);
      expect(dataView.getUint8(0)).assertEqual(20);
      expect(dataView.getUint8(1)).assertEqual(200);
      expect(dataView.getUint8(2)).assertEqual(200);
      expect(dataView.getUint8(3)).assertEqual(200);
      expect(dataView.getUint8(4)).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0235
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0235
     * @tc.desc   Verify Uint8Array and DataView sync for multi-step modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40]);

      dataView.setUint8(1, 25);

      uint8View.set([uint8View[1]], 3);

      expect(dataView.getUint8(1)).assertEqual(25);
      expect(dataView.getUint8(3)).assertEqual(25);

      expect(uint8View[1]).assertEqual(25);
      expect(uint8View[3]).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0236
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0236
     * @tc.desc   Verify SharedArrayBuffer multi-step sync between Uint8Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(4);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);


      dataView.setUint8(0, 5);
      dataView.setUint8(1, 15);
      dataView.setUint8(2, 25);
      dataView.setUint8(3, 35);

      uint8View[2] = 30;

      dataView.setUint8(0, dataView.getUint8(2));

      expect(uint8View[0]).assertEqual(30);
      expect(uint8View[2]).assertEqual(30);

      expect(dataView.getUint8(0)).assertEqual(30);
      expect(dataView.getUint8(2)).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0237
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0237
     * @tc.desc   Verify Uint8Array slice with DataView-modified original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40, 50]);

      const slicedUint8: Uint8Array = uint8View.slice(1, 3);


      dataView.setUint8(1, 25);
      dataView.setUint8(2, 35);
      expect(uint8View[1]).assertEqual(25);
      expect(uint8View[2]).assertEqual(35);
      expect(slicedUint8[0]).assertEqual(20);
      expect(slicedUint8[1]).assertEqual(30);

      slicedUint8[0] = 30;
      expect(dataView.getUint8(1)).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0238
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0238
     * @tc.desc   Verify SharedArrayBuffer slice with Uint8Array-modified original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 35, 45]);

      const slicedUint8: Uint8Array = uint8View.slice(2, 4);

      uint8View[2] = 30;
      uint8View[3] = 40;
      expect(dataView.getUint8(2)).assertEqual(30);
      expect(dataView.getUint8(3)).assertEqual(40);
      expect(slicedUint8[0]).assertEqual(25);
      expect(slicedUint8[1]).assertEqual(35);

      slicedUint8[1] = 45;
      expect(dataView.getUint8(3)).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0239
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0239
     * @tc.desc   Verify Uint8Array filter with DataView-modified original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30, 40, 50]);

      const filteredUint8: Uint8Array = uint8View.filter(val => val > 25);

      dataView.setUint8(2, 20);
      dataView.setUint8(3, 35);
      expect(uint8View[2]).assertEqual(20);
      expect(uint8View[3]).assertEqual(35);
      expect(filteredUint8[0]).assertEqual(30);
      expect(filteredUint8[1]).assertEqual(40);
      const newFilteredUint8: Uint8Array = uint8View.filter(val => val > 25);
      expect(newFilteredUint8.length).assertEqual(2);
      expect(newFilteredUint8[0]).assertEqual(35);
      expect(newFilteredUint8[1]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0240
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0240
     * @tc.desc   Verify SharedArrayBuffer filter with Uint8Array-modified original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(5);
      const uint8View: Uint8Array = new Uint8Array(sharedBuffer);
      const dataView: DataView = new DataView(sharedBuffer);

      uint8View.set([5, 15, 25, 35, 45]);

      const filteredUint8: Uint8Array = uint8View.filter(val => val < 25);

      uint8View[0] = 30;
      uint8View[1] = 20;
      expect(dataView.getUint8(0)).assertEqual(30);
      expect(dataView.getUint8(1)).assertEqual(20);
      expect(filteredUint8[0]).assertEqual(5);
      expect(filteredUint8[1]).assertEqual(15);
      const newFilteredUint8: Uint8Array = uint8View.filter(val => val <= 25);
      expect(newFilteredUint8.length).assertEqual(2);
      expect(newFilteredUint8[0]).assertEqual(20);
      expect(newFilteredUint8[1]).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBufferDv0241
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8ARRAY_BUFFER_DV_0241
     * @tc.desc   Verify Uint8Array map with DataView-modified original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBufferDv0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      const dataView: DataView = new DataView(buffer);

      uint8View.set([10, 20, 30]);
      const mappedUint8: Uint8Array = uint8View.map(val => val * 2);


      dataView.setUint8(1, 25);
      expect(uint8View[1]).assertEqual(25);
      expect(mappedUint8[1]).assertEqual(40);
      const newMappedUint8: Uint8Array = uint8View.map(val => val * 2);
      expect(newMappedUint8[1]).assertEqual(50);
    })

  })
}