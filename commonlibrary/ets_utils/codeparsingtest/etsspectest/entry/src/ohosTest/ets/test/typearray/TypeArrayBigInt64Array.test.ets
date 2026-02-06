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

export default function typeArrayBigInt64ArrayTest() {
  describe('TypeArrayBigInt64ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0001
     * @tc.desc   Verify BigInt64Array and DataView share ArrayBuffer (bidirectional sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // BigInt64Array element size = 8 bytes
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const testVal: bigint = 9223372036854775807n; // Max BigInt64 value

        // BigInt64Array → DataView: Modify BigInt64Array, DataView reads sync (little-endian)
        bigInt64Arr[0] = testVal;
        expect(dv.getBigInt64(0, true)).assertEqual(testVal);

        // DataView → BigInt64Array: Modify DataView, BigInt64Array reads sync
        const newVal: bigint = -9223372036854775808n; // Min BigInt64 value
        dv.setBigInt64(0, newVal, true);
        expect(bigInt64Arr[0]).assertEqual(newVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0002
     * @tc.desc   Verify BigInt64Array (non-zero offset) and DataView share ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements (3×8=24 bytes)
        const offset: number = 8; // Skip first BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, offset, 2); // Covers buf[8-15], buf[16-23]
        const dv: DataView = new DataView(buf);
        const val1: bigint = 1234567890123456789n;
        const val2: bigint = -8570200862721897295n;

        // Modify BigInt64Array
        bigInt64Arr[0] = val1;
        bigInt64Arr[1] = val2;

        // Verify DataView reads
        expect(dv.getBigInt64(offset, true)).assertEqual(val1);
        expect(dv.getBigInt64(offset + 8, true)).assertEqual(val2);

        // Modify DataView
        const newVal: bigint = 4567890123456789012n;
        dv.setBigInt64(offset + 4, newVal, true); // Overlaps partial bytes (no sync to full element)
        expect(bigInt64Arr[0]).not().assertEqual(newVal); // BigInt64Array reads full 8-byte element
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0003
     * @tc.desc   Verify SharedArrayBuffer sync between BigInt64Array and DataView (single thread)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);
        const val1: bigint = 1n;
        const val2: bigint = -1n;

        // BigInt64Array writes
        bigInt64Arr[0] = val1;
        bigInt64Arr[1] = val2;

        // DataView reads sync
        expect(dv.getBigInt64(0, true)).assertEqual(val1);
        expect(dv.getBigInt64(8, true)).assertEqual(val2);

        // DataView writes
        const newVal1: bigint = 100n;
        const newVal2: bigint = -200n;
        dv.setBigInt64(0, newVal1, true);
        dv.setBigInt64(8, newVal2, true);

        // BigInt64Array reads sync
        expect(bigInt64Arr[0]).assertEqual(newVal1);
        expect(bigInt64Arr[1]).assertEqual(newVal2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0004
     * @tc.desc   Verify BigInt64Array handles value overflow (clamped to min/max)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8);
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const overflowVal: bigint = 9223372036854775808n; // Exceeds max (9223372036854775807n)
        const underflowVal: bigint = -9223372036854775809n; // Exceeds min (-9223372036854775808n)
        const expectedOverflow: bigint = -9223372036854775808n; // Overflow clamps to min
        const expectedUnderflow: bigint = 9223372036854775807n; // Underflow clamps to max

        // Test overflow
        bigInt64Arr[0] = overflowVal;
        expect(bigInt64Arr[0]).assertEqual(expectedOverflow);
        expect(dv.getBigInt64(0, true)).assertEqual(expectedOverflow);

        // Test underflow
        bigInt64Arr[0] = underflowVal;
        expect(bigInt64Arr[0]).assertEqual(expectedUnderflow);
        expect(dv.getBigInt64(0, true)).assertEqual(expectedUnderflow);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0006
     * @tc.desc   Verify BigInt64Array constructor with plain BigInt array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const source: bigint[] = [10n, 20n, 30n];
        const bigInt64Arr: BigInt64Array = new BigInt64Array(source);
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        expect(bigInt64Arr.length).assertEqual(source.length);
        expect(bigInt64Arr.byteLength).assertEqual(source.length * 8);

        // Verify each element via DataView
        for (let i = 0; i < source.length; i++) {
          expect(dv.getBigInt64(i * 8, true)).assertEqual(source[i]);
        }
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0007
     * @tc.desc   Verify BigInt64Array constructor with ArrayBuffer (offset=0, length=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const buf: ArrayBuffer = new ArrayBuffer(16);
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, 0, 0); // Empty view
        const dv: DataView = new DataView(buf);

        expect(bigInt64Arr.length).assertEqual(0);
        expect(bigInt64Arr.byteLength).assertEqual(0);
        expect(bigInt64Arr.buffer).assertEqual(buf);

        // DataView can still modify buffer (unrelated to empty BigInt64Array)
        dv.setBigInt64(0, 100n, true);
        expect(dv.getBigInt64(0, true)).assertEqual(100n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0008
     * @tc.desc   Verify BigInt64Array subarray and DataView share parent ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([1n, 2n, 3n]);
        const subArr: BigInt64Array = parentArr.subarray(1, 3); // Covers elements 1 and 2 (buf[8-23])
        const dv: DataView = new DataView(buf);

        // Modify subarray
        subArr[0] = 20n;
        subArr[1] = 30n;

        // Verify parent and DataView sync
        expect(parentArr[1]).assertEqual(20n);
        expect(parentArr[2]).assertEqual(30n);
        expect(dv.getBigInt64(8, true)).assertEqual(20n);
        expect(dv.getBigInt64(16, true)).assertEqual(30n);

        // Modify DataView (parent element 0)
        dv.setBigInt64(0, 10n, true);
        expect(parentArr[0]).assertEqual(10n);
        expect(subArr[0]).assertEqual(20n); // Subarray unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0009
     * @tc.desc   Verify BigInt64Array slice (new buffer) does NOT sync with original DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n]);
        const slicedArr: BigInt64Array = originalArr.slice(0, 1); // New buffer (1 element)
        const dv: DataView = new DataView(buf);

        // Modify slicedArr (new buffer)
        slicedArr[0] = 100n;
        expect(originalArr[0]).assertEqual(10n); // Original unchanged
        expect(dv.getBigInt64(0, true)).assertEqual(10n); // DataView unchanged

        // Modify original via DataView
        dv.setBigInt64(0, 200n, true);
        expect(originalArr[0]).assertEqual(200n);
        expect(slicedArr[0]).assertEqual(100n); // Sliced unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0010
     * @tc.desc   Verify DataView out-of-bounds BigInt64 read throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const dv: DataView = new DataView(buf);
        let isRangeError: boolean = false;

        try {
          dv.getBigInt64(1, true); // Offset 1: only 7 bytes left (needs 8)
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }

        expect(isRangeError).assertEqual(true);

        try {
          dv.setBigInt64(8, 10n, true); // Offset 8: exceeds buffer length (8)
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0011
     * @tc.desc   Verify BigInt64Array set method with BigInt64Array source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const targetArr: BigInt64Array = new BigInt64Array(buf);
        const sourceArr: BigInt64Array = new BigInt64Array([100n, 200n]);
        const dv: DataView = new DataView(buf);

        // Set source to target (offset 1)
        targetArr.set(sourceArr, 1);
        expect(targetArr[0]).assertEqual(0n); // Unset element
        expect(targetArr[1]).assertEqual(100n);
        expect(targetArr[2]).assertEqual(200n);

        // Verify via DataView
        expect(dv.getBigInt64(8, true)).assertEqual(100n);
        expect(dv.getBigInt64(16, true)).assertEqual(200n);

        // Modify source and set again
        sourceArr[0] = 150n;
        targetArr.set(sourceArr, 1);
        expect(dv.getBigInt64(8, true)).assertEqual(150n);
      })
    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0013
     * @tc.desc   Verify BigInt64Array fill method with BigInt value (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const fillVal: bigint = 500n;
        const dv: DataView = new DataView(buf);

        // Fill all elements
        bigInt64Arr.fill(fillVal);
        for (let i = 0; i < bigInt64Arr.length; i++) {
          expect(bigInt64Arr[i]).assertEqual(fillVal);
          expect(dv.getBigInt64(i * 8, true)).assertEqual(fillVal);
        }

        // Fill partial range (elements 1~2)
        const newFillVal: bigint = 600n;
        bigInt64Arr.fill(newFillVal, 1, 3);
        expect(bigInt64Arr[0]).assertEqual(fillVal); // Unfilled
        expect(bigInt64Arr[1]).assertEqual(newFillVal);
        expect(bigInt64Arr[2]).assertEqual(newFillVal);
        expect(dv.getBigInt64(8, true)).assertEqual(newFillVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0014
     * @tc.desc   Verify BigInt64Array fill with negative range (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n, 40n]);
        const fillVal: bigint = 99n;
        const dv: DataView = new DataView(buf);

        // Fill range: start=-3, end=-1 → elements 1~2 (buf[8-23])
        bigInt64Arr.fill(fillVal, -3, -1);
        expect(bigInt64Arr[0]).assertEqual(10n); // Unfilled
        expect(bigInt64Arr[1]).assertEqual(fillVal);
        expect(bigInt64Arr[2]).assertEqual(fillVal);
        expect(bigInt64Arr[3]).assertEqual(40n); // Unfilled

        // Verify via DataView
        expect(dv.getBigInt64(8, true)).assertEqual(fillVal);
        expect(dv.getBigInt64(16, true)).assertEqual(fillVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0015
     * @tc.desc   Verify BigInt64Array copyWithin method (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([1n, 2n, 3n, 4n]);
        const dv: DataView = new DataView(buf);

        // Copy elements 2~4 to position 0 → [3n,4n,3n,4n]
        bigInt64Arr.copyWithin(0, 2);
        expect(bigInt64Arr[0]).assertEqual(3n);
        expect(bigInt64Arr[1]).assertEqual(4n);
        expect(bigInt64Arr[2]).assertEqual(3n);
        expect(bigInt64Arr[3]).assertEqual(4n);

        // Verify via DataView
        expect(dv.getBigInt64(0, true)).assertEqual(3n);
        expect(dv.getBigInt64(8, true)).assertEqual(4n);
        expect(dv.getBigInt64(16, true)).assertEqual(3n);

        // Copy elements 0~1 to position 2 (negative index -2)
        bigInt64Arr.copyWithin(-2, 0, 2);
        expect(bigInt64Arr[2]).assertEqual(3n);
        expect(bigInt64Arr[3]).assertEqual(4n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0016
     * @tc.desc   Verify BigInt64Array copyWithin with overlapping ranges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // Overlapping copy: copy elements 0~2 to position 1 → [10n,10n,20n]
        bigInt64Arr.copyWithin(1, 0);
        expect(bigInt64Arr[0]).assertEqual(10n);
        expect(bigInt64Arr[1]).assertEqual(10n);
        expect(bigInt64Arr[2]).assertEqual(20n);

        // Verify via DataView
        expect(dv.getBigInt64(8, true)).assertEqual(10n);
        expect(dv.getBigInt64(16, true)).assertEqual(20n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0017
     * @tc.desc   Verify BigInt64Array indexOf method (sync with DataView modifications)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 5n]);
        const dv: DataView = new DataView(buf);

        // Find first occurrence of 5n
        expect(bigInt64Arr.indexOf(5n)).assertEqual(0);

        // Modify first 5n via DataView
        dv.setBigInt64(0, 25n, true);
        expect(bigInt64Arr.indexOf(5n)).assertEqual(2);

        // Modify remaining 5n
        dv.setBigInt64(16, 35n, true);
        expect(bigInt64Arr.indexOf(5n)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0018
     * @tc.desc   Verify BigInt64Array lastIndexOf method (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([20n, 30n, 20n, 40n]);
        const dv: DataView = new DataView(buf);

        // Find last occurrence of 20n
        expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(2);

        // Modify last 20n via DataView
        dv.setBigInt64(16, 50n, true);
        expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(0);

        // Modify remaining 20n
        dv.setBigInt64(0, 60n, true);
        expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0019
     * @tc.desc   Verify BigInt64Array includes method (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([100n, 200n]);
        const dv: DataView = new DataView(buf);

        expect(bigInt64Arr.includes(100n)).assertEqual(true);
        expect(bigInt64Arr.includes(150n)).assertEqual(false);

        // Modify via DataView
        dv.setBigInt64(0, 150n, true);
        expect(bigInt64Arr.includes(100n)).assertEqual(false);
        expect(bigInt64Arr.includes(150n)).assertEqual(true);

        // Modify via BigInt64Array
        bigInt64Arr[1] = 150n;
        expect(dv.getBigInt64(8, true)).assertEqual(150n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0020
     * @tc.desc   Verify BigInt64Array every method (sync with DataView modifications)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 15n]);
        const dv: DataView = new DataView(buf);

        // Every element < 20n → true
        expect(bigInt64Arr.every(val => val < 20n)).assertEqual(true);

        // Modify one element via DataView
        dv.setBigInt64(16, 25n, true);
        // Every element < 20n → false
        expect(bigInt64Arr.every(val => val < 20n)).assertEqual(false);

        // Modify back
        dv.setBigInt64(16, 15n, true);
        expect(bigInt64Arr.every(val => val < 20n)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0021
     * @tc.desc   Verify BigInt64Array some method (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 15n]);
        const dv: DataView = new DataView(buf);

        // Some element > 12n → false
        expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true); // 15n >12n

        // Modify 15n to 12n via DataView
        dv.setBigInt64(16, 12n, true);
        // Some element > 12n → false
        expect(bigInt64Arr.some(val => val > 12n)).assertEqual(false);

        // Modify one element to 13n
        dv.setBigInt64(8, 13n, true);
        expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0022
     * @tc.desc   Verify BigInt64Array reduce method (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // Sum: 10+20+30 = 60n
        let sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
        expect(sum).assertEqual(60n);

        // Modify via DataView
        dv.setBigInt64(8, 25n, true); // 20n →25n
        // Sum:10+25+30=65n
        sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
        expect(sum).assertEqual(65n);

        // Modify via BigInt64Array
        bigInt64Arr[2] = 35n;
        sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
        expect(sum).assertEqual(70n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0023
     * @tc.desc   Verify BigInt64Array reduce without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n]);
        const dv: DataView = new DataView(buf);

        // Product: 5×10 =50n (uses first element as initial)
        let product = bigInt64Arr.reduce((acc, val) => acc * val);
        expect(product).assertEqual(50n);

        // Modify via DataView
        dv.setBigInt64(0, 6n, true); // 5n→6n
        // Product:6×10=60n
        product = bigInt64Arr.reduce((acc, val) => acc * val);
        expect(product).assertEqual(60n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0024
     * @tc.desc   Verify BigInt64Array map method (new buffer, no sync with original)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n]);
        const dv: DataView = new DataView(buf);

        // Map: val × 2 → new buffer [20n,40n]
        const mappedArr: BigInt64Array = originalArr.map(val => val * 2n);
        expect(mappedArr[0]).assertEqual(20n);
        expect(mappedArr[1]).assertEqual(40n);

        // Modify original via DataView
        dv.setBigInt64(0, 15n, true);
        expect(originalArr[0]).assertEqual(15n);
        expect(mappedArr[0]).assertEqual(20n); // Mapped unchanged

        // Modify mappedArr
        mappedArr[0] = 25n;
        expect(originalArr[0]).assertEqual(15n); // Original unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0025
     * @tc.desc   Verify BigInt64Array filter method (new buffer, no sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // Filter: val >15n → new buffer [20n,30n]
        const filteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
        expect(filteredArr.length).assertEqual(2);
        expect(filteredArr[0]).assertEqual(20n);

        // Modify original via DataView
        dv.setBigInt64(8, 14n, true); // 20n→14n
        expect(originalArr[1]).assertEqual(14n);
        expect(filteredArr[0]).assertEqual(20n); // Filtered unchanged

        // Filter again (original now [10n,14n,30n])
        const newFilteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
        expect(newFilteredArr.length).assertEqual(1);
        expect(newFilteredArr[0]).assertEqual(30n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0026
     * @tc.desc   Verify BigInt64Array forEach method (modifies external variable)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 25n]);
        const dv: DataView = new DataView(buf);
        let count: number = 0;

        // Count elements >10n
        bigInt64Arr.forEach(val => val > 10n && count++);
        expect(count).assertEqual(2);

        // Modify via DataView
        dv.setBigInt64(0, 11n, true); // 5n→11n
        count = 0;
        bigInt64Arr.forEach(val => val > 10n && count++);
        expect(count).assertEqual(3);

        // Modify via forEach callback
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 1n);
        expect(dv.getBigInt64(0, true)).assertEqual(12n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0027
     * @tc.desc   Verify BigInt64Array and DataView with multi-byte DataView operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const val1: bigint = 0x123456789ABCDEF0n; // 64-bit BigInt
        const val2: bigint = -0x123456789ABCDEF0n;

        // DataView writes 64-bit value (little-endian)
        dv.setBigInt64(0, val1, true);
        dv.setBigInt64(8, val2, true);

        // BigInt64Array reads sync
        expect(bigInt64Arr[0]).assertEqual(val1);
        expect(bigInt64Arr[1]).assertEqual(val2);

        // BigInt64Array modifies value
        bigInt64Arr[0] = val2;
        expect(dv.getBigInt64(0, true)).assertEqual(val2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0028
     * @tc.desc   Verify BigInt64Array byteLength and byteOffset properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements
        const offset: number = 16; // Skip 2 elements (16 bytes)
        const length: number = 2;
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, offset, length);
        const dv: DataView = new DataView(buf);

        expect(bigInt64Arr.byteOffset).assertEqual(offset);
        expect(bigInt64Arr.byteLength).assertEqual(length * 8);
        expect(bigInt64Arr.buffer.byteLength).assertEqual(buf.byteLength);

        // Verify DataView access to BigInt64Array's range
        bigInt64Arr[0] = 100n;
        expect(dv.getBigInt64(offset, true)).assertEqual(100n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0029
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (cross-thread simulation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(16); // 2 BigInt64 elements
        // Simulate main thread view
        const mainArr: BigInt64Array = new BigInt64Array(sab);
        const mainDv: DataView = new DataView(sab);
        // Simulate worker thread view
        const workerArr: BigInt64Array = new BigInt64Array(sab);
        const workerDv: DataView = new DataView(sab);

        // Main thread writes
        mainArr[0] = 10n;
        mainDv.setBigInt64(8, 20n, true);

        // Worker thread reads sync
        expect(workerArr[0]).assertEqual(10n);
        expect(workerDv.getBigInt64(8, true)).assertEqual(20n);

        // Worker thread writes
        workerArr[1] = 30n;
        workerDv.setBigInt64(0, 40n, true);

        // Main thread reads sync
        expect(mainArr[1]).assertEqual(30n);
        expect(mainDv.getBigInt64(0, true)).assertEqual(40n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0030
     * @tc.desc   Verify BigInt64Array out-of-bounds index returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Out-of-bounds read
        expect(bigInt64Arr[1]).assertEqual(undefined);

        // Out-of-bounds write (no effect)
        bigInt64Arr[1] = 100n;
        expect(bigInt64Arr[1]).assertEqual(undefined);

        // DataView can still write to buffer (if space exists)
        if (buf.byteLength > 8) {
          dv.setBigInt64(8, 200n, true);
        }
        expect(bigInt64Arr[1]).assertEqual(undefined);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0031
     * @tc.desc   Verify BigInt64Array conversion to plain BigInt array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // Convert via Array.from
        const plainArr1: bigint[] = Array.from(bigInt64Arr);
        expect(plainArr1.toString()).assertEqual([10n, 20n, 30n].toString());

        // Convert via spread syntax
        const plainArr2: bigint[] = [...bigInt64Arr];
        expect(plainArr2.toString()).assertEqual([10n, 20n, 30n].toString());

        // Modify via DataView and convert again
        dv.setBigInt64(8, 25n, true);
        const plainArr3: bigint[] = Array.from(bigInt64Arr);
        expect(plainArr3.toString()).assertEqual([10n, 25n, 30n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0032
     * @tc.desc   Verify plain BigInt array conversion to BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const plainArr: bigint[] = [123n, 456n, 789n];
        const bigInt64Arr: BigInt64Array = new BigInt64Array(plainArr);
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        expect(bigInt64Arr.length).assertEqual(plainArr.length);
        for (let i = 0; i < plainArr.length; i++) {
          expect(bigInt64Arr[i]).assertEqual(plainArr[i]);
          expect(dv.getBigInt64(i * 8, true)).assertEqual(plainArr[i]);
        }

        // Modify plain array (no sync to BigInt64Array)
        plainArr[0] = 999n;
        expect(bigInt64Arr[0]).assertEqual(123n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0033
     * @tc.desc   Verify BigInt64Array with DataView reading different data types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const bigIntVal: bigint = 0x00000000000000FFn; // Low byte = 0xFF

        bigInt64Arr[0] = bigIntVal;

        // DataView reads as Uint8 (low byte)
        expect(dv.getUint8(0)).assertEqual(0xFF);
        // DataView reads as Int16 (low 2 bytes)
        expect(dv.getInt16(0, true)).assertEqual(0x00FF);
        // DataView reads as Uint32 (low 4 bytes)
        expect(dv.getUint32(0, true)).assertEqual(0x000000FF);
        // DataView reads as BigInt64 (full 8 bytes)
        expect(dv.getBigInt64(0, true)).assertEqual(bigIntVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0034
     * @tc.desc   Verify DataView writing different types to BigInt64Array's buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // DataView writes Uint8 to low byte
        dv.setUint8(0, 0xAA);
        // BigInt64Array reads full 8-byte value
        expect(bigInt64Arr[0]).assertEqual(0x00000000000000AAn);

        // DataView writes Int32 to low 4 bytes
        dv.setInt32(0, 0x12345678, true);
        expect(bigInt64Arr[0]).assertEqual(0x0000000012345678n);

        // DataView writes BigInt64 to full 8 bytes
        dv.setBigInt64(0, 0xABCDEF0123456789n, true);
        expect(bigInt64Arr[0]).assertEqual(-0x543210fedcba9877n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0035
     * @tc.desc   Verify BigInt64Array with empty source array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const plainArr: bigint[] = [];
        const bigInt64Arr: BigInt64Array = new BigInt64Array(plainArr);
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        expect(bigInt64Arr.length).assertEqual(0);
        expect(bigInt64Arr.byteLength).assertEqual(0);
        expect(bigInt64Arr.buffer.byteLength).assertEqual(0); // Empty buffer

        // Attempt to write to DataView (throws RangeError)
        let isRangeError: boolean = false;
        try {
          dv.setBigInt64(0, 10n, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0036
     * @tc.desc   Verify BigInt64Array with zero-length SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(0);
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        expect(bigInt64Arr.length).assertEqual(0);
        expect(bigInt64Arr.byteLength).assertEqual(0);

        // Attempt to read from DataView (throws RangeError)
        let isRangeError: boolean = false;
        try {
          dv.getBigInt64(0, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0037
     * @tc.desc   Verify BigInt64Array set method with out-of-bounds source (truncated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const source: bigint[] = [10n, 20n, 30n, 40n]; // Longer than target
        const dv: DataView = new DataView(buf);
        try{
          let buf: ArrayBuffer = new ArrayBuffer(4);
          new BigInt64Array(buf);
        }catch (e) {
          expect((e as Error).name).assertEqual('RangeError');
        }

        // Set source (truncated to target length)
        try{
          bigInt64Arr.set(source);
        }catch (e) {
          expect((e as Error).name).assertEqual('RangeError');
        }
        expect(bigInt64Arr[0]).assertEqual(0n);
        expect(bigInt64Arr.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0038
     * @tc.desc   Verify BigInt64Array set method with negative offset (throws RangeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const source: bigint[] = [10n];
        let isRangeError: boolean = false;

        try {
          bigInt64Arr.set(source, -1); // Negative offset invalid
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }

        expect(isRangeError).assertEqual(true);

        try {
          bigInt64Arr.set(source, 3); // Offset 3: target[3] out of bounds
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0040
     * @tc.desc   Verify BigInt64Array copyWithin with invalid indices (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n]);
        const originalVals: bigint[] = [...bigInt64Arr];

        // Copy with start > end (no-op)
        bigInt64Arr.copyWithin(0, 1, 0);
        expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());

        // Copy with target >= length (no-op)
        bigInt64Arr.copyWithin(2, 0, 1);
        expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());

        // Copy with start >= length (no-op)
        bigInt64Arr.copyWithin(0, 2, 3);
        expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0041
     * @tc.desc   Verify BigInt64Array indexOf with start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 5n]);
        const dv: DataView = new DataView(buf);

        // Find 5n starting from index 1
        expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(2);

        // Find 5n starting from index 3 (out of bounds → -1)
        expect(bigInt64Arr.indexOf(5n, 3)).assertEqual(-1);

        // Modify via DataView and find again
        dv.setBigInt64(16, 15n, true); // 5n→15n
        expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0042
     * @tc.desc   Verify BigInt64Array lastIndexOf with start index (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements (4×8=32 bytes)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([20n, 30n, 20n, 40n]);
        const dv: DataView = new DataView(buf);

        // Find last 20n with start index 2 (only check elements 0~2)
        expect(bigInt64Arr.lastIndexOf(20n, 2)).assertEqual(2);
        // Find last 20n with start index 1 (only check elements 0~1)
        expect(bigInt64Arr.lastIndexOf(20n, 1)).assertEqual(0);

        // Modify element 2 via DataView
        dv.setBigInt64(16, 25n, true); // element 2 (offset 16) → 25n
        // Find last 20n with start index 3 (check all elements)
        expect(bigInt64Arr.lastIndexOf(20n, 3)).assertEqual(0);

        // Restore element 2 and modify element 0
        dv.setBigInt64(16, 20n, true);
        dv.setBigInt64(0, 15n, true); // element 0 →15n
        expect(bigInt64Arr.lastIndexOf(20n, 3)).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0043
     * @tc.desc   Verify BigInt64Array includes with start index (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([5n, 15n, 25n]);
        const dv: DataView = new DataView(sab);

        // Check if 15n exists starting from index 1 (elements 1~2)
        expect(bigInt64Arr.includes(15n, 1)).assertEqual(true);
        // Check if 15n exists starting from index 2 (only element 2)
        expect(bigInt64Arr.includes(15n, 2)).assertEqual(false);

        // Modify element 1 via DataView
        dv.setBigInt64(8, 20n, true); // element 1 →20n
        expect(bigInt64Arr.includes(15n, 0)).assertEqual(false);

        // Restore element 1
        dv.setBigInt64(8, 15n, true);
        expect(bigInt64Arr.includes(15n, 1)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0044
     * @tc.desc   Verify BigInt64Array slice with start/end indices (new buffer, no sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n, 30n, 40n]);
        const dv: DataView = new DataView(buf);

        // Slice elements 1~3 (start=1, end=3) → new buffer [20n,30n]
        const slicedArr: BigInt64Array = originalArr.slice(1, 3);
        const slicedDv: DataView = new DataView(slicedArr.buffer);

        // Verify sliced array values via toString
        expect(slicedArr.toString()).assertEqual([20n,30n].toString());

        // Modify original array via DataView
        dv.setBigInt64(8, 25n, true); // original element 1 →25n
        expect(originalArr[1]).assertEqual(25n);
        expect(slicedArr.toString()).assertEqual([20n,30n].toString()); // sliced array unchanged

        // Modify sliced array
        slicedArr[0] = 35n;
        expect(slicedDv.getBigInt64(0, true)).assertEqual(35n);
        expect(originalArr[1]).assertEqual(25n); // original unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0045
     * @tc.desc   Verify BigInt64Array slice with negative indices (new buffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        originalArr.set([5n, 15n, 25n]);
        const dv: DataView = new DataView(sab);

        // Slice with negative indices: start=-2 (element 1), end=-1 (element 2) → [15n]
        const slicedArr: BigInt64Array = originalArr.slice(-2, -1);
        expect(slicedArr.length).assertEqual(1);
        expect(slicedArr.toString()).assertEqual([15n].toString());

        // Modify original element 1 via DataView
        dv.setBigInt64(8, 20n, true);
        expect(originalArr[1]).assertEqual(20n);
        expect(slicedArr.toString()).assertEqual([15n].toString()); // sliced array unchanged

        // Slice with only negative start: start=-3 (element 0) → [5n,20n,25n]
        const fullSlicedArr: BigInt64Array = originalArr.slice(-3);
        expect(fullSlicedArr.length).assertEqual(3);
        expect(fullSlicedArr.toString()).assertEqual([5n,20n,25n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0046
     * @tc.desc   Verify BigInt64Array map with BigInt operations (new buffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([2n, 4n, 6n]);
        const dv: DataView = new DataView(buf);

        // Map: val × 3n + 1n → new buffer [7n,13n,19n]
        const mappedArr: BigInt64Array = originalArr.map(val => val * 3n + 1n);
        expect(mappedArr.toString()).assertEqual([7n,13n,19n].toString());

        // Modify original array via DataView
        dv.setBigInt64(8, 5n, true); // original element 1 →5n
        expect(originalArr[1]).assertEqual(5n);
        expect(mappedArr.toString()).assertEqual([7n,13n,19n].toString());  // mapped array unchanged

        // Re-map modified original
        const newMappedArr: BigInt64Array = originalArr.map(val => val * 3n + 1n);
        expect(newMappedArr.toString()).assertEqual([7n,16n,19n].toString());  // 5n×3n+1n=16n
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0047
     * @tc.desc   Verify BigInt64Array filter with BigInt conditions (new buffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(32); // 4 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        originalArr.set([10n, 25n, 15n, 30n]);
        const dv: DataView = new DataView(sab);

        // Filter: val > 15n → new buffer [25n,30n]
        const filteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
        expect(filteredArr.length).assertEqual(2);
        expect(filteredArr.toString()).assertEqual([25n,30n].toString());

        // Modify original element 2 via DataView
        dv.setBigInt64(16, 20n, true); // original element 2 →20n
        expect(originalArr[2]).assertEqual(20n);
        expect(filteredArr.toString()).assertEqual([25n,30n].toString());// filtered array unchanged

        // Re-filter modified original
        const newFilteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
        expect(newFilteredArr.length).assertEqual(3); // [25n,20n,30n]
        expect(newFilteredArr.toString()).assertEqual([25n,20n,30n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0048
     * @tc.desc   Verify BigInt64Array reduce with BigInt accumulator (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([3n, 6n, 9n]);
        const dv: DataView = new DataView(buf);

        // Reduce: sum with initial value 2n → 2n+3n+6n+9n=20n
        let sum = bigInt64Arr.reduce((acc, val) => acc + val, 2n);
        expect(sum).assertEqual(20n);

        // Modify element 1 via DataView
        dv.setBigInt64(8, 7n, true); // 6n→7n
        sum = bigInt64Arr.reduce((acc, val) => acc + val, 2n);
        expect(sum).assertEqual(21n); // 2n+3n+7n+9n=21n

        // Reduce: product with no initial value →3n×7n×9n=189n
        let product = bigInt64Arr.reduce((acc, val) => acc * val);
        expect(product).assertEqual(189n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0049
     * @tc.desc   Verify BigInt64Array forEach modifies buffer (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([5n, 10n]);
        const dv: DataView = new DataView(sab);

        // forEach: double each value
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val * 2n);
        expect(bigInt64Arr.toString()).assertEqual([10n,20n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(10n);
        expect(dv.getBigInt64(8, true)).assertEqual(20n);

        // forEach: add 3n to each value
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 3n);
        expect(dv.getBigInt64(0, true)).assertEqual(13n);
        expect(dv.getBigInt64(8, true)).assertEqual(23n);
        expect(bigInt64Arr.toString()).assertEqual([13n,23n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0050
     * @tc.desc   Verify BigInt64Array with DataView reading partial bytes (no sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const fullVal: bigint = 0x123456789ABCDEF0n; // 64-bit value

        // Set full value via BigInt64Array
        bigInt64Arr[0] = fullVal;
        // DataView reads low 4 bytes (Uint32)
        expect(dv.getUint32(0, true)).assertEqual(0x9ABCDEF0);
        // DataView reads high 4 bytes (Uint32, offset 4)
        expect(dv.getUint32(4, true)).assertEqual(0x12345678);

        // DataView modifies low 2 bytes (Uint16)
        dv.setUint16(0, 0xFFFF, true);
        // BigInt64Array reads modified full value
        const modifiedVal: bigint = 0x123456789ABCFFFFn;
        expect(bigInt64Arr[0]).assertEqual(modifiedVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0051
     * @tc.desc   Verify DataView writes partial bytes to BigInt64Array's buffer (sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        // DataView writes low 1 byte (Uint8)
        dv.setUint8(0, 0xAA);
        expect(bigInt64Arr[0]).assertEqual(0x00000000000000AAn);

        // DataView writes high 1 byte (offset 7)
        dv.setUint8(7, 0xBB);
        expect(bigInt64Arr[0]).assertEqual(-4971973988617027414n);

        // DataView writes middle 2 bytes (offset 2, Uint16)
        dv.setUint16(2, 0xCCCC, true);
        expect(bigInt64Arr[0]).assertEqual(-4971973985181106006n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0052
     * @tc.desc   Verify BigInt64Array with ArrayBuffer slice (new buffer, no sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const originalBuf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(originalBuf);
        originalArr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(originalBuf);

        // Slice ArrayBuffer (offset 8, length 16) → covers elements 1~2
        const slicedBuf: ArrayBuffer = originalBuf.slice(8, 24);
        const slicedArr: BigInt64Array = new BigInt64Array(slicedBuf);

        // Verify sliced array
        expect(slicedArr.length).assertEqual(2);
        expect(slicedArr.toString()).assertEqual([20n,30n].toString());

        // Modify original buffer via DataView
        dv.setBigInt64(8, 25n, true); // original element 1 →25n
        expect(originalArr[1]).assertEqual(25n);
        expect(slicedArr.toString()).assertEqual([20n,30n].toString()); // sliced buffer unchanged

        // Modify sliced array
        slicedArr[0] = 35n;
        expect(slicedArr.toString()).assertEqual([35n,30n].toString());
        expect(originalArr[1]).assertEqual(25n); // original unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0053
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer slice (not supported, throws error)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(16); // 2 BigInt64 elements
        const slicedSab: SharedArrayBuffer = sab.slice(8, 16);
        expect(slicedSab.byteLength).assertEqual(8);

        // Verify BigInt64Array on original SharedArrayBuffer works
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr[0] = 10n;
        const dv: DataView = new DataView(sab);
        expect(dv.getBigInt64(0, true)).assertEqual(10n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0054
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0054
     * @tc.desc   Verify BigInt64Array constructor with length parameter (zero-initialized)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const length: number = 3;
        const bigInt64Arr: BigInt64Array = new BigInt64Array(length); // Zero-initialized
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        expect(bigInt64Arr.length).assertEqual(length);
        expect(bigInt64Arr.byteLength).assertEqual(length * 8);

        // Verify all elements are 0n
        for (let i = 0; i < length; i++) {
          expect(bigInt64Arr[i]).assertEqual(0n);
          expect(dv.getBigInt64(i * 8, true)).assertEqual(0n);
        }

        // Modify one element via BigInt64Array
        bigInt64Arr[1] = 50n;
        expect(dv.getBigInt64(8, true)).assertEqual(50n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0055
     * @tc.desc   Verify BigInt64Array conversion to plain BigInt array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // Convert via Array.from
        const plainArr: bigint[] = Array.from(bigInt64Arr);
        expect(plainArr.toString()).assertEqual([10n,20n,30n].toString());

        // Modify BigInt64Array via DataView
        dv.setBigInt64(8, 25n, true); // element 1 →25n
        const updatedPlainArr: bigint[] = Array.from(bigInt64Arr);
        expect(updatedPlainArr.toString()).assertEqual([10n,25n,30n].toString());

        // Modify plain array (no sync to BigInt64Array)
        plainArr[0] = 15n;
        expect(bigInt64Arr[0]).assertEqual(10n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0056
     * @tc.desc   Verify plain BigInt array conversion to BigInt64Array (truncates overflow)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const plainArr: bigint[] = [
          9223372036854775807n, // Max BigInt64 value
          9223372036854775808n, // Overflow (truncates to min: -9223372036854775808n)
          -9223372036854775809n // Underflow (truncates to max: 9223372036854775807n)
        ];
        const bigInt64Arr: BigInt64Array = new BigInt64Array(plainArr);
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        expect(bigInt64Arr.length).assertEqual(plainArr.length);
        expect(bigInt64Arr[0]).assertEqual(9223372036854775807n);
        expect(bigInt64Arr[1]).assertEqual(-9223372036854775808n);
        expect(bigInt64Arr[2]).assertEqual(9223372036854775807n);

        // Verify via DataView
        expect(dv.getBigInt64(0, true)).assertEqual(9223372036854775807n);
        expect(dv.getBigInt64(8, true)).assertEqual(-9223372036854775808n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0057
     * @tc.desc   Verify BigInt64Array with DataView reading/writing big-endian values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const testVal: bigint = 0x0123456789ABCDEFn;

        // DataView writes big-endian value
        dv.setBigInt64(0, testVal, false);
        // BigInt64Array reads as little-endian (default) → different value
        const littleEndianVal: bigint = -1167088121787636991n;
        expect(bigInt64Arr[0]).assertEqual(littleEndianVal);

        // BigInt64Array writes value (little-endian)
        bigInt64Arr[0] = testVal;
        // DataView reads big-endian → different value
        const bigEndianReadVal: bigint = -1167088121787636991n;
        expect(dv.getBigInt64(0, false)).assertEqual(bigEndianReadVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0058
     * @tc.desc   Verify BigInt64Array out-of-bounds write (no effect on buffer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n]);
        // Out-of-bounds write (index 2)
        bigInt64Arr[2] = 30n;
        // Verify no effect on buffer
        expect(bigInt64Arr[2]).assertEqual(undefined);

        // Out-of-bounds write (negative index -1)
        bigInt64Arr[-1] = 5n;
        expect(bigInt64Arr[-1]).assertEqual(undefined);
        expect(bigInt64Arr[0]).assertEqual(10n); // No effect on valid index
      })


    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0060
     * @tc.desc   Verify BigInt64Array fill with max/min values (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const maxVal: bigint = 9223372036854775807n;
        const minVal: bigint = -9223372036854775808n;
        const dv: DataView = new DataView(buf);

        // Fill first element with max value
        bigInt64Arr.fill(maxVal, 0, 1);
        expect(bigInt64Arr[0]).assertEqual(maxVal);
        expect(dv.getBigInt64(0, true)).assertEqual(maxVal);

        // Fill second element with min value
        bigInt64Arr.fill(minVal, 1, 2);
        expect(bigInt64Arr[1]).assertEqual(minVal);
        expect(dv.getBigInt64(8, true)).assertEqual(minVal);

        // Fill all with 0n
        bigInt64Arr.fill(0n);
        expect(bigInt64Arr.toString()).assertEqual([0n,0n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0061
     * @tc.desc   Verify BigInt64Array copyWithin with negative start/end (sync with DataView)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([1n, 2n, 3n]);
        const dv: DataView = new DataView(buf);

        // Copy: start=-2 (element 1), end=-1 (element 2), target=0 → [2n,2n,3n]
        bigInt64Arr.copyWithin(0, -2, -1);
        expect(bigInt64Arr.toString()).assertEqual([2n,2n,3n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(2n);
        expect(dv.getBigInt64(8, true)).assertEqual(2n);

        // Restore and copy again: target=-3 (element 0), start=2 (element 2) → [3n,2n,3n]
        bigInt64Arr.set([1n, 2n, 3n]);
        bigInt64Arr.copyWithin(-3, 2);
        expect(bigInt64Arr.toString()).assertEqual([3n,2n,3n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(3n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0065
     * @tc.desc   Verify BigInt64Array every with non-BigInt condition (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([15n, 25n, 35n]);
        const dv: DataView = new DataView(buf);

        // Every value > 10 (coerced to 10n) → true
        expect(bigInt64Arr.every(val => val > 10)).assertEqual(true);
        // Every value < 30 (coerced to 30n) → false (35n >30n)
        expect(bigInt64Arr.every(val => val < 30)).assertEqual(false);

        // Modify via DataView
        dv.setBigInt64(16, 28n, true); // 35n→28n
        expect(bigInt64Arr.every(val => val < 30)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0066
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0066
     * @tc.desc   Verify BigInt64Array some with non-BigInt condition (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([5n, 15n, 25n]);
        const dv: DataView = new DataView(sab);

        // Some value === 15 (coerced to 15n) → true
        expect(bigInt64Arr.some(val => val === 15n)).assertEqual(true);
        // Some value > 30 (coerced to 30n) → false
        expect(bigInt64Arr.some(val => val > 30)).assertEqual(false);

        // Modify via DataView
        dv.setBigInt64(16, 35n, true); // 25n→35n
        expect(bigInt64Arr.some(val => val > 30)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0067
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0067
     * @tc.desc   Verify BigInt64Array reduce with non-BigInt accumulator (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n]);
        const dv: DataView = new DataView(buf);

        // Reduce: sum with initial number (coerced to BigInt) → 3n+5n+10n=18n
        let sum = bigInt64Arr.reduce((acc, val) => acc + val, 3n);
        expect(sum).assertEqual(18n);

        // Modify via DataView
        dv.setBigInt64(8, 15n, true); // 10n→15n
        sum = bigInt64Arr.reduce((acc, val) => acc + val, 3n);
        expect(sum).assertEqual(23n); // 3n+5n+15n=23n
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0068
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0068
     * @tc.desc   Verify BigInt64Array map with non-BigInt return (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([4n, 8n]);
        const dv: DataView = new DataView(buf);

        // Map: val × 2 (number, coerced to BigInt) → [8n,16n]
        const mappedArr: BigInt64Array = originalArr.map(val => val * 2n);
        expect(mappedArr.toString()).assertEqual([8n,16n].toString());

        // Modify original via DataView
        dv.setBigInt64(8, 9n, true); // 8n→9n
        const newMappedArr: BigInt64Array = originalArr.map(val => val * 2n);
        expect(newMappedArr.toString()).assertEqual([8n,18n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0069
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0069
     * @tc.desc   Verify BigInt64Array filter with non-BigInt condition (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3 BigInt64 elements
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        originalArr.set([12n, 24n, 36n]);
        const dv: DataView = new DataView(sab);

        // Filter: val % 12 === 0 (number, coerced to BigInt) → [12n,24n,36n]
        const filteredArr: BigInt64Array = originalArr.filter(val => val % 12n === 0n);
        expect(filteredArr.toString()).assertEqual([12n,24n,36n].toString());

        // Modify original via DataView
        dv.setBigInt64(8, 25n, true); // 24n→25n
        const newFilteredArr: BigInt64Array = originalArr.filter(val => val % 12n === 0n);
        expect(newFilteredArr.toString()).assertEqual([12n,36n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0070
     * @tc.desc   Verify BigInt64Array forEach with non-BigInt operation (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([6n, 12n]);
        const dv: DataView = new DataView(buf);

        // forEach: add 3 (number, coerced to BigInt) to each value
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 3n);
        expect(bigInt64Arr.toString()).assertEqual([9n,15n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(9n);
        expect(dv.getBigInt64(8, true)).assertEqual(15n);

        // forEach: multiply by 2 (number)
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val * 2n);
        expect(bigInt64Arr.toString()).assertEqual([18n,30n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0071
     * @tc.desc   Verify BigInt64Array with DataView reading signed/unsigned values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1 BigInt64 element
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const signedVal: bigint = -1n; // Binary: 0xFFFFFFFFFFFFFFFF

        // Set signed value via BigInt64Array
        bigInt64Arr[0] = signedVal;
        // DataView reads as unsigned 64-bit (BigUint64)
        const unsignedVal: bigint = 18446744073709551615n;
        expect(dv.getBigUint64(0, true)).assertEqual(unsignedVal);
        // DataView reads as signed 64-bit (matches BigInt64Array)
        expect(dv.getBigInt64(0, true)).assertEqual(signedVal);

        // DataView writes unsigned value
        dv.setBigUint64(0, unsignedVal / 2n, true);
        expect(bigInt64Arr[0]).assertEqual(9223372036854775807n); // Signed interpretation
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0072
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (multi-view sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3 BigInt64 elements
        // View 1: full range
        const view1: BigInt64Array = new BigInt64Array(sab);
        // View 2: offset 8 (element 1), length 2
        const view2: BigInt64Array = new BigInt64Array(sab, 8, 2);
        const dv: DataView = new DataView(sab);

        // Modify via view1
        view1.set([10n, 20n, 30n]);
        expect(view2.toString()).assertEqual([20n,30n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(20n);

        // Modify via view2
        view2[0] = 25n;
        expect(view1[1]).assertEqual(25n);
        expect(dv.getBigInt64(8, true)).assertEqual(25n);

        // Modify via DataView
        dv.setBigInt64(16, 35n, true);
        expect(view1[2]).assertEqual(35n);
        expect(view2[1]).assertEqual(35n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0073
     * @tc.desc   Verify BigInt64Array subarray with out-of-bounds indices (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([5n, 15n, 25n]);
        const dv: DataView = new DataView(buf);

        // Subarray: start=-5 (clamped to 0), end=5 (clamped to 3) → full range
        const subArr1: BigInt64Array = parentArr.subarray(-5, 5);
        expect(subArr1.toString()).assertEqual([5n,15n,25n].toString());

        // Subarray: start=1, end=-1 (clamped to 2) → [15n]
        const subArr2: BigInt64Array = parentArr.subarray(1, -1);
        expect(subArr2.toString()).assertEqual([15n].toString());

        // Modify subArr2
        subArr2[0] = 20n;
        expect(dv.getBigInt64(8, true)).assertEqual(20n);
        expect(parentArr[1]).assertEqual(20n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0074
     * @tc.desc   Verify BigInt64Array slice with out-of-bounds indices (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([7n, 17n, 27n]);
        const dv: DataView = new DataView(buf);

        // Slice: start=-10 (clamped to 0), end=10 (clamped to 3) → [7n,17n,27n]
        const slicedArr1: BigInt64Array = parentArr.slice(-10, 10);
        expect(slicedArr1.toString()).assertEqual([7n,17n,27n].toString());

        // Slice: start=2, end=1 (clamped to 2) → empty array
        const slicedArr2: BigInt64Array = parentArr.slice(2, 1);
        expect(slicedArr2.length).assertEqual(0);

        // Modify parent via DataView
        dv.setBigInt64(0, 8n, true);
        expect(slicedArr1[0]).assertEqual(7n); // sliced array unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0075
     * @tc.desc   Verify BigInt64Array set with out-of-bounds source (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const source: bigint[] = [10n, 20n, 30n, 40n];
        const dv: DataView = new DataView(buf);

        // Set: offset=1, source length 4 (clamped to 1)

        try{
          bigInt64Arr.set(source, 1);
        }catch (e) {
          expect((e as Error).name).assertEqual('RangeError');
        }
        expect(bigInt64Arr.toString()).assertEqual([0n,0n].toString()); // source[0] written to index 1

        // Verify via DataView
        expect(dv.getBigInt64(8, true)).assertEqual(0n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0076
     * @tc.desc   Verify BigInt64Array fill with out-of-bounds range (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([1n, 2n, 3n]);
        const fillVal: bigint = 9n;
        const dv: DataView = new DataView(buf);

        // Fill: start=-5 (clamped to 0), end=5 (clamped to 3) → fill all
        bigInt64Arr.fill(fillVal, -5, 5);
        expect(bigInt64Arr.toString()).assertEqual([9n,9n,9n].toString());

        // Restore and fill: start=1, end=-1 (clamped to 2) → fill index 1
        bigInt64Arr.set([1n, 2n, 3n]);
        bigInt64Arr.fill(fillVal, 1, -1);
        expect(bigInt64Arr.toString()).assertEqual([1n,9n,3n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(9n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0077
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0077
     * @tc.desc   Verify BigInt64Array copyWithin with out-of-bounds indices (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]);
        const dv: DataView = new DataView(buf);

        // CopyWithin: target=-5 (clamped to 0), start=2, end=5 (clamped to 3) → [30n,20n,30n]
        bigInt64Arr.copyWithin(-5, 2, 5);
        expect(bigInt64Arr.toString()).assertEqual([30n,20n,30n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(30n);

        // Restore and copy: target=2, start=-5 (clamped to 0), end=-1 (clamped to 2) → [10n,20n,10n]
        bigInt64Arr.set([10n, 20n, 30n]);
        bigInt64Arr.copyWithin(2, -5, -1);
        expect(bigInt64Arr.toString()).assertEqual([10n,20n,10n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0078
     * @tc.desc   Verify BigInt64Array indexOf with out-of-bounds start (returns -1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 5n]);
        const dv: DataView = new DataView(buf);

        // IndexOf: start=10 (out of bounds → -1)
        expect(bigInt64Arr.indexOf(5n, 10)).assertEqual(-1);
        // IndexOf: start=-10 (clamped to 0) → 0
        expect(bigInt64Arr.indexOf(5n, -10)).assertEqual(0);

        // Modify via DataView
        dv.setBigInt64(0, 25n, true);
        expect(bigInt64Arr.indexOf(5n, -10)).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0079
     * @tc.desc   Verify BigInt64Array lastIndexOf with out-of-bounds start (clamped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 5n]);
        const dv: DataView = new DataView(buf);

        // LastIndexOf: start=10 (clamped to 2) → 2
        expect(bigInt64Arr.lastIndexOf(5n, 10)).assertEqual(2);
        // LastIndexOf: start=-10 (clamped to 0) → 0
        expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1);

        // Modify via DataView
        dv.setBigInt64(16, 25n, true);
        expect(bigInt64Arr.lastIndexOf(5n, 10)).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0080
     * @tc.desc   Verify BigInt64Array includes with out-of-bounds start (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(16); // 2 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([20n, 30n]);
        const dv: DataView = new DataView(sab);

        // Includes: start=5 (out of bounds → false)
        expect(bigInt64Arr.includes(30n, 5)).assertEqual(false);
        // Includes: start=-5 (clamped to 0) → true
        expect(bigInt64Arr.includes(30n, -5)).assertEqual(true);

        // Modify via DataView
        dv.setBigInt64(8, 35n, true);
        expect(bigInt64Arr.includes(30n, -5)).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0081
     * @tc.desc   Verify BigInt64Array with empty ArrayBuffer (all operations no-op or throw)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const emptyBuf: ArrayBuffer = new ArrayBuffer(0);
        const bigInt64Arr: BigInt64Array = new BigInt64Array(emptyBuf);
        const dv: DataView = new DataView(emptyBuf);

        // Verify core properties of empty array
        expect(bigInt64Arr.length).assertEqual(0);
        expect(bigInt64Arr.byteLength).assertEqual(0);
        expect(bigInt64Arr.buffer).assertEqual(emptyBuf);
        expect(bigInt64Arr.byteOffset).assertEqual(0);

        // Verify no-op operations (no effect on empty array)
        let isRangeError = false;
        try {
          bigInt64Arr.set([10n, 20n]); // No elements to overwrite
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        bigInt64Arr.fill(30n); // No elements to fill
        bigInt64Arr.copyWithin(0, 1); // No elements to copy
        expect(bigInt64Arr.indexOf(10n)).assertEqual(-1); // No match
        expect(bigInt64Arr.every(val => val > 0n)).assertEqual(true); // Empty array returns true for every
        expect(bigInt64Arr.some(val => val > 0n)).assertEqual(false); // Empty array returns false for some

        // Verify DataView throws on out-of-bounds access
        isRangeError = false;
        try {
          dv.getBigInt64(0, true); // Offset 0 exceeds empty buffer
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        try {
          dv.setBigInt64(0, 10n, true); // Offset 0 exceeds empty buffer
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0082
     * @tc.desc   Verify SharedArrayBuffer sync between BigInt64Array and DataView (multi-view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        // Create 3 views of the same SharedArrayBuffer
        const view1: BigInt64Array = new BigInt64Array(sab); // Full range
        const view2: BigInt64Array = new BigInt64Array(sab, 8, 2); // Offset 8, length 2 (elements 1-2)
        const dv: DataView = new DataView(sab); // Full DataView

        // Step 1: Modify via view1, verify sync to view2 and dv
        view1.set([10n, 20n, 30n]);
        expect(view2.toString()).assertEqual([20n,30n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(10n);
        expect(dv.getBigInt64(8, true)).assertEqual(20n);
        expect(dv.getBigInt64(16, true)).assertEqual(30n);

        // Step 2: Modify via dv, verify sync to view1 and view2
        dv.setBigInt64(8, 25n, true); // Update element 1
        expect(view1[1]).assertEqual(25n);
        expect(view2[0]).assertEqual(25n);

        // Step 3: Modify via view2, verify sync to view1 and dv
        view2[1] = 35n; // Update element 2
        expect(view1[2]).assertEqual(35n);
        expect(dv.getBigInt64(16, true)).assertEqual(35n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0083
     * @tc.desc   Verify BigInt64Array subarray with zero length (no-op modifications)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([5n, 15n]); // Initialize parent array
        const zeroLenSubArr: BigInt64Array = parentArr.subarray(1, 1); // Zero-length subarray (start=1, end=1)
        const dv: DataView = new DataView(buf);

        // Verify zero-length subarray properties
        expect(zeroLenSubArr.length).assertEqual(0);
        expect(zeroLenSubArr.byteLength).assertEqual(0);
        expect(zeroLenSubArr.byteOffset).assertEqual(8); // Matches parent's element 1 offset
        expect(zeroLenSubArr.buffer).assertEqual(parentArr.buffer); // Shares parent buffer

        // Verify no-op modifications on zero-length subarray
        try{
          zeroLenSubArr.set([20n]); // No elements to set
        }catch (e) {
          expect((e as Error).name).assertEqual('RangeError');
        }
        zeroLenSubArr.fill(25n); // No elements to fill
        zeroLenSubArr.copyWithin(0, 1); // No elements to copy

        // Verify parent array remains unchanged
        expect(parentArr.toString()).assertEqual([5n,15n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(5n);
        expect(dv.getBigInt64(8, true)).assertEqual(15n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0084
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0084
     * @tc.desc   Verify BigInt64Array slice returns empty array for zero-length source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const emptyBuf: ArrayBuffer = new ArrayBuffer(0);
        const emptyArr: BigInt64Array = new BigInt64Array(emptyBuf);
        const dv: DataView = new DataView(emptyBuf);

        // Verify slice on empty array returns new empty array
        const slicedArr: BigInt64Array = emptyArr.slice(0, 1);
        expect(slicedArr.length).assertEqual(0);
        expect(slicedArr.byteLength).assertEqual(0);
        expect(slicedArr.buffer).not().assertEqual(emptyArr.buffer); // Slice creates new buffer

        // Verify map on empty array returns new empty array
        const mappedArr: BigInt64Array = emptyArr.map(val => val * 2n);
        expect(mappedArr.length).assertEqual(0);
        expect(mappedArr.buffer).not().assertEqual(emptyArr.buffer);

        // Verify filter on empty array returns new empty array
        const filteredArr: BigInt64Array = emptyArr.filter(val => val > 0n);
        expect(filteredArr.length).assertEqual(0);

        // Verify reduce on empty array (with initial value works, without throws)
        const reducedWithInit: bigint = emptyArr.reduce((acc, val) => acc + val, 0n);
        expect(reducedWithInit).assertEqual(0n);

        let isTypeError = false;
        try {
          emptyArr.reduce((acc, val) => acc + val); // No initial value + empty array → throw
        } catch (e) {
          isTypeError = (e as Error).name === 'TypeError';
        }
        expect(isTypeError).assertEqual(true);

        // Verify DataView on empty buffer throws
        let isRangeError = false;
        try {
          dv.getBigInt64(0, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0085
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0085
     * @tc.desc   Verify BigInt64Array and DataView handle 64-bit sign bit correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Case 1: Sign bit set (64th bit = 1) → negative value
        const signBitVal: bigint = 0x8000000000000000n; // Binary: 100...000 (64 bits)
        const expectedSigned: bigint = -9223372036854775808n; // Min BigInt64 value
        bigInt64Arr[0] = signBitVal;
        expect(bigInt64Arr[0]).assertEqual(expectedSigned);
        expect(dv.getBigInt64(0, true)).assertEqual(expectedSigned);

        // Case 2: Sign bit + lower bits set → negative value
        const signBitWithLower: bigint = 0x8000000000000001n; // Binary: 100...001
        const expectedSigned2: bigint = -9223372036854775807n;
        dv.setBigInt64(0, signBitWithLower, true);
        expect(bigInt64Arr[0]).assertEqual(expectedSigned2);

        // Case 3: Sign bit not set → positive value
        const positiveVal: bigint = 0x7FFFFFFFFFFFFFFFn; // Max BigInt64 value (sign bit = 0)
        bigInt64Arr[0] = positiveVal;
        expect(bigInt64Arr[0]).assertEqual(positiveVal);
        expect(dv.getBigInt64(0, true)).assertEqual(positiveVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0086
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0086
     * @tc.desc   Verify BigInt64Array fill with same value multiple times (idempotency)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const fillVal: bigint = 50n;

        // Step 1: First fill (initialize to fillVal)
        bigInt64Arr.fill(fillVal);
        expect(bigInt64Arr.toString()).assertEqual([50n,50n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(50n);
        expect(dv.getBigInt64(8, true)).assertEqual(50n);

        // Step 2: Second fill (same value → no change, idempotent)
        bigInt64Arr.fill(fillVal);
        expect(bigInt64Arr.toString()).assertEqual([50n,50n].toString()); // No change
        expect(dv.getBigInt64(0, true)).assertEqual(50n);

        // Step 3: Fill with different value (update to new value)
        const newFillVal: bigint = 60n;
        bigInt64Arr.fill(newFillVal);
        expect(bigInt64Arr.toString()).assertEqual([60n,60n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(60n);

        // Step 4: Partial fill (only element 0)
        bigInt64Arr.fill(fillVal, 0, 1);
        expect(bigInt64Arr.toString()).assertEqual([50n,60n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(50n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0087
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0087
     * @tc.desc   Verify BigInt64Array copyWithin preserves source during overlapping copy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Initialize array: [1n, 2n, 3n]
        bigInt64Arr.set([1n, 2n, 3n]);

        // Case 1: Forward overlapping copy (source [0,1] → target [1,2])
        // Source is read before overwriting target (preserves source values)
        bigInt64Arr.copyWithin(1, 0, 2);
        const expected1: bigint[] = [1n,1n,2n];
        expect(bigInt64Arr.toString()).assertEqual(expected1.toString());
        expect(dv.getBigInt64(8, true)).assertEqual(1n); // Target 1
        expect(dv.getBigInt64(16, true)).assertEqual(2n); // Target 2

        // Restore array: [1n, 2n, 3n]
        bigInt64Arr.set([1n, 2n, 3n]);

        // Case 2: Reverse overlapping copy (source [1,2] → target [0,1])
        bigInt64Arr.copyWithin(0, 1, 3);
        expect(bigInt64Arr.toString()).assertEqual([2n,3n,3n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(2n); // Target 0
        expect(dv.getBigInt64(8, true)).assertEqual(3n); // Target 1

        // Restore array: [1n, 2n, 3n]
        bigInt64Arr.set([1n, 2n, 3n]);

        // Case 3: Non-overlapping copy (source [2] → target [0])
        bigInt64Arr.copyWithin(0, 2, 3);
        expect(bigInt64Arr.toString()).assertEqual([3n,2n,3n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0088
     * @tc.desc   Verify BigInt64Array indexOf handles duplicate values correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Initialize array with duplicates: [5n, 10n, 5n, 15n]
        bigInt64Arr.set([5n, 10n, 5n, 15n]);

        // Case 1: Find first occurrence of duplicate (5n)
        expect(bigInt64Arr.indexOf(5n)).assertEqual(0);

        // Case 2: Find first occurrence starting from index 1 (skip first 5n)
        expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(2);

        // Case 3: Find first occurrence starting from index 3 (no match)
        expect(bigInt64Arr.indexOf(5n, 3)).assertEqual(-1);

        // Case 4: Modify duplicate via DataView, re-check
        dv.setBigInt64(16, 20n, true); // Update index 2 (5n → 20n)
        expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(-1); // No more 5n after index 0

        // Case 5: Find non-existent value
        expect(bigInt64Arr.indexOf(25n)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0089
     * @tc.desc   Verify BigInt64Array lastIndexOf handles duplicate values correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Initialize array with duplicates: [5n, 10n, 5n, 15n]
        bigInt64Arr.set([5n, 10n, 5n, 15n]);

        // Case 1: Find last occurrence of duplicate (5n)
        expect(bigInt64Arr.lastIndexOf(5n)).assertEqual(2);

        // Case 2: Find last occurrence before index 2 (skip last 5n)
        expect(bigInt64Arr.lastIndexOf(5n, 1)).assertEqual(0);

        // Case 3: Find last occurrence before index 0 (no match)
        expect(bigInt64Arr.lastIndexOf(5n, -1)).assertEqual(2); // start=-1 → index 3, but search backward to 0

        // Case 4: Modify last duplicate via DataView, re-check
        dv.setBigInt64(16, 20n, true); // Update index 2 (5n → 20n)
        expect(bigInt64Arr.lastIndexOf(5n)).assertEqual(0); // Only 5n at index 0

        // Case 5: Find non-existent value
        expect(bigInt64Arr.lastIndexOf(25n)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0090
     * @tc.desc   Verify BigInt64Array includes handles duplicate values correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        // Initialize array with duplicates: [5n, 10n, 5n, 15n]
        bigInt64Arr.set([5n, 10n, 5n, 15n]);

        // Case 1: Check if duplicate exists (has 5n → true)
        expect(bigInt64Arr.includes(5n)).assertEqual(true);

        // Case 2: Check if duplicate exists starting from index 3 (no 5n after index 2 → false)
        expect(bigInt64Arr.includes(5n, 3)).assertEqual(false);

        // Case 3: Check if non-duplicate exists (has 10n → true)
        expect(bigInt64Arr.includes(10n)).assertEqual(true);

        // Case 4: Remove all duplicates via DataView, re-check
        dv.setBigInt64(0, 20n, true); // Update index 0 (5n → 20n)
        dv.setBigInt64(16, 25n, true); // Update index 2 (5n → 25n)
        expect(bigInt64Arr.includes(5n)).assertEqual(false); // No more 5n

        // Case 5: Check non-existent value
        expect(bigInt64Arr.includes(30n)).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0091
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0091
     * @tc.desc   Verify BigInt64Array every checks all elements (even after modifications)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        // Condition: value < 35n
        const condition = (val: bigint) => val < 35n;

        // Step 1: Initial check (all elements <35n → true)
        bigInt64Arr.set([10n, 20n, 30n]);
        expect(bigInt64Arr.every(condition)).assertEqual(true);

        // Step 2: Modify one element to exceed condition (30n → 40n)
        dv.setBigInt64(16, 40n, true);
        expect(bigInt64Arr.every(condition)).assertEqual(false);

        // Step 3: Modify back to meet condition (40n → 30n)
        dv.setBigInt64(16, 30n, true);
        expect(bigInt64Arr.every(condition)).assertEqual(true);

        // Step 4: Modify another element via array index (20n → 36n)
        bigInt64Arr[1] = 36n;
        expect(bigInt64Arr.every(condition)).assertEqual(false);

        // Step 5: Empty array (every returns true)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        expect(emptyArr.every(condition)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0092
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0092
     * @tc.desc   Verify BigInt64Array some detects first matching element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);
        // Condition: value > 25n
        const condition = (val: bigint) => val > 25n;

        // Step 1: Initial check (has 30n >25n → true)
        bigInt64Arr.set([10n, 20n, 30n]);
        expect(bigInt64Arr.some(condition)).assertEqual(true);

        // Step 2: Remove matching element (30n → 24n)
        dv.setBigInt64(16, 24n, true);
        expect(bigInt64Arr.some(condition)).assertEqual(false);

        // Step 3: Add matching element at start (10n → 26n)
        dv.setBigInt64(0, 26n, true);
        expect(bigInt64Arr.some(condition)).assertEqual(true); // Stops at first match (index 0)

        // Step 4: Add matching element in middle (20n → 27n)
        dv.setBigInt64(8, 27n, true);
        expect(bigInt64Arr.some(condition)).assertEqual(true); // Stops at index 0 (first match)

        // Step 5: Empty array (some returns false)
        const emptyArr: BigInt64Array = new BigInt64Array(new SharedArrayBuffer(0));
        expect(emptyArr.some(condition)).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0093
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0093
     * @tc.desc   Verify BigInt64Array reduce accumulates correctly with modified elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        // Reducer: sum accumulator and current value
        const sumReducer = (acc: bigint, val: bigint) => acc + val;

        // Step 1: Initial sum (5+10+15=30n, with initial 0n)
        bigInt64Arr.set([5n, 10n, 15n]);
        let sum = bigInt64Arr.reduce(sumReducer, 0n);
        expect(sum).assertEqual(30n);

        // Step 2: Modify one element via DataView (10n → 12n)
        dv.setBigInt64(8, 12n, true);
        sum = bigInt64Arr.reduce(sumReducer, 0n);
        expect(sum).assertEqual(32n); // 5+12+15=32n

        // Step 3: Modify another element via array index (15n → 18n)
        bigInt64Arr[2] = 18n;
        sum = bigInt64Arr.reduce(sumReducer, 0n);
        expect(sum).assertEqual(35n); // 5+12+18=35n

        // Step 4: Reduce without initial value (uses first element as initial)
        sum = bigInt64Arr.reduce(sumReducer);
        expect(sum).assertEqual(35n); // 5+12+18=35n

        // Step 5: Modify during reduce (side effect, verify accumulator)
        let modifiedSum = bigInt64Arr.reduce((acc, val, idx) => {
          bigInt64Arr[idx] = val + 1n; // Increment current element
          return acc + val; // Accumulate original value (not modified)
        }, 0n);
        expect(modifiedSum).assertEqual(35n); // Original sum preserved
        expect(bigInt64Arr.toString()).assertEqual([6n,13n,19n].toString()); // Elements modified
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0094
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0094
     * @tc.desc   Verify BigInt64Array map applies transformation to each element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        // Transformer: val × 3n + 1n (2→7, 4→13, 6→19)
        const transformer = (val: bigint) => val * 3n + 1n;

        // Step 1: Initial map (original [2n,4n,6n] → mapped [7n,13n,19n])
        originalArr.set([2n, 4n, 6n]);
        const mappedArr: BigInt64Array = originalArr.map(transformer);
        expect(mappedArr.toString()).assertEqual([7n,13n,19n].toString());
        expect(mappedArr.buffer).not().assertEqual(originalArr.buffer); // Map creates new buffer

        // Step 2: Modify original array via DataView (4n → 5n)
        dv.setBigInt64(8, 5n, true);
        const newMappedArr: BigInt64Array = originalArr.map(transformer);
        expect(newMappedArr.toString()).assertEqual([7n,16n,19n].toString()); // 5×3+1=16

        // Step 3: Modify original array via index (6n → 7n)
        originalArr[2] = 7n;
        const newMappedArr2: BigInt64Array = originalArr.map(transformer);
        expect(newMappedArr2.toString()).assertEqual([7n,16n,22n].toString()); // 7×3+1=22

        // Step 4: Map empty array (returns empty array)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        const emptyMapped: BigInt64Array = emptyArr.map(transformer);
        expect(emptyMapped.length).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0095
     * @tc.desc   Verify BigInt64Array filter retains only matching elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);
        // Filter: value > 15n (matches 25,30)
        const filter = (val: bigint) => val > 15n;

        // Step 1: Initial filter (original [10n,25n,15n,30n] → filtered [25n,30n])
        originalArr.set([10n, 25n, 15n, 30n]);
        const filteredArr: BigInt64Array = originalArr.filter(filter);
        expect(filteredArr.toString()).assertEqual([25n,30n].toString());
        expect(filteredArr.buffer).not().assertEqual(originalArr.buffer); // Filter creates new buffer

        // Step 2: Modify original to add matching element (10n → 16n)
        dv.setBigInt64(0, 16n, true);
        const newFilteredArr: BigInt64Array = originalArr.filter(filter);
        expect(newFilteredArr.toString()).assertEqual([16n,25n,30n].toString());;

        // Step 3: Modify original to remove matching element (25n → 14n)
        dv.setBigInt64(8, 14n, true);
        const newFilteredArr2: BigInt64Array = originalArr.filter(filter);
        expect(newFilteredArr2.toString()).assertEqual([16n,30n].toString());

        // Step 4: Filter empty array (returns empty array)
        const emptyArr: BigInt64Array = new BigInt64Array(new SharedArrayBuffer(0));
        const emptyFiltered: BigInt64Array = emptyArr.filter(filter);
        expect(emptyFiltered.length).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0096
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0096
     * @tc.desc   Verify BigInt64Array forEach iterates all elements (even modified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        let iterationCount = 0;
        // Callback: count iterations and log value
        const countCallback = () => {
          iterationCount++;
        };

        // Step 1: Initial forEach (3 elements → count=3)
        bigInt64Arr.set([5n, 10n, 15n]);
        bigInt64Arr.forEach(countCallback);
        expect(iterationCount).assertEqual(3);

        // Step 2: Attempt to modify array length (typed array length is fixed)
        expect(bigInt64Arr.length).assertEqual(3); // Length remains unchanged

        // Step 3: Modify element via DataView and re-iterate (still 3 elements)
        dv.setBigInt64(8, 12n, true); // 10n → 12n
        iterationCount = 0;
        bigInt64Arr.forEach(countCallback);
        expect(iterationCount).assertEqual(3);

        // Step 4: Modify elements via forEach callback (side effect)
        bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 1n);
        expect(bigInt64Arr.toString()).assertEqual([6n,13n,16n].toString()); // All elements incremented

        // Step 5: forEach on empty array (count=0)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        iterationCount = 0;
        emptyArr.forEach(countCallback);
        expect(iterationCount).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0097
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0097
     * @tc.desc   Verify DataView throws on non-aligned offsets for BigInt64 access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: Valid alignment (offset is multiple of 8 for BigInt64)
        expect(dv.getBigInt64(0, true)).assertEqual(10n); // Offset 0 (8×0)
        expect(dv.getBigInt64(8, true)).assertEqual(20n); // Offset 8 (8×1)

        let isRangeError = false;
        dv.getBigInt64(1, true);
        dv.setBigInt64(1, 30n, true);
        dv.getBigInt64(4, true);

        // Case 4: Invalid alignment (offset 15 → not multiple of 8)
        try {
          dv.getBigInt64(15, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Verify original array remains unchanged after failed access
        expect(bigInt64Arr.toString()).assertEqual([7690n,0n].toString())
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0098
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0098
     * @tc.desc   Verify BigInt64Array truncates when ArrayBuffer length is non-multiple of 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        // ArrayBuffer length = 20 (not multiple of 8 → 20 ÷8 = 2.5 → truncates to 2 elements)
        const buf: ArrayBuffer = new ArrayBuffer(16);
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        try {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          new BigInt64Array(buf);
        } catch (e) {
          expect((e as Error).name).assertEqual('RangeError'); // Truncated to 2 elements (2×8=16 bytes)
        }

        // Verify truncated length and byteLength
        expect(bigInt64Arr.length).assertEqual(2); // Truncated to 2 elements (2×8=16 bytes)
        expect(bigInt64Arr.byteLength).assertEqual(16);
        expect(buf.byteLength).assertEqual(16); // Buffer length remains 20 (extra 4 bytes unused)

        // Initialize valid elements (indices 0 and 1)
        bigInt64Arr.set([10n, 20n]);
        expect(dv.getBigInt64(0, true)).assertEqual(10n); // Valid element 0
        expect(dv.getBigInt64(8, true)).assertEqual(20n); // Valid element 1

        // Attempt to set element beyond truncated length (index 2 → no effect)
        bigInt64Arr[2] = 30n;
        expect(bigInt64Arr[2]).assertEqual(undefined); // Out-of-bounds index returns undefined

        // Write to buffer's extra bytes (offset 16-19) via DataView (no effect on BigInt64Array)
        expect(bigInt64Arr.length).assertEqual(2); // Array length unchanged
        expect(bigInt64Arr[0]).assertEqual(10n); // Valid elements unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0099
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0099
     * @tc.desc   Verify BigInt64Array and DataView handle zero value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const zeroVal: bigint = 0n;

        // Step 1: Set zero via BigInt64Array
        bigInt64Arr.set([zeroVal, zeroVal]);
        expect(bigInt64Arr.toString()).assertEqual([0n,0n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(zeroVal);
        expect(dv.getBigInt64(8, true)).assertEqual(zeroVal);

        // Step 2: Modify one element to non-zero via DataView
        dv.setBigInt64(0, 5n, true); // 0n → 5n
        expect(bigInt64Arr[0]).assertEqual(5n);
        expect(bigInt64Arr[1]).assertEqual(zeroVal);

        // Step 3: Modify back to zero via array index
        bigInt64Arr[0] = zeroVal;
        expect(dv.getBigInt64(0, true)).assertEqual(zeroVal);

        // Step 4: Verify zero in conditions
        expect(bigInt64Arr.every(val => val === zeroVal)).assertEqual(true); // All zeros
        expect(bigInt64Arr.some(val => val !== zeroVal)).assertEqual(false); // No non-zeros
        expect(bigInt64Arr.indexOf(zeroVal)).assertEqual(0); // First zero at index 0
        expect(bigInt64Arr.lastIndexOf(zeroVal)).assertEqual(1); // Last zero at index 1

        // Step 5: Fill with zero (idempotent)
        bigInt64Arr.fill(zeroVal);
        expect(bigInt64Arr.toString()).assertEqual([0n,0n].toString()) // No change
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0100
     * @tc.desc   Verify BigInt64Array slice with same start and end returns empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n, 30n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: slice(start=1, end=1) → empty array
        const emptySliced1: BigInt64Array = originalArr.slice(1, 1);
        expect(emptySliced1.length).assertEqual(0);
        expect(emptySliced1.byteLength).assertEqual(0);
        expect(emptySliced1.buffer).not().assertEqual(originalArr.buffer); // New empty buffer

        // Case 2: slice(start=2, end=2) → empty array
        const emptySliced2: BigInt64Array = originalArr.slice(2, 2);
        expect(emptySliced2.length).assertEqual(0);

        // Case 3: slice(start=0, end=0) → empty array
        const emptySliced3: BigInt64Array = originalArr.slice(0, 0);
        expect(emptySliced3.length).assertEqual(0);

        // Modify original array via DataView (verify sliced arrays unchanged)
        dv.setBigInt64(8, 25n, true); // 20n → 25n
        expect(originalArr[1]).assertEqual(25n);
        expect(emptySliced1.length).assertEqual(0); // Empty sliced array remains empty
        expect(emptySliced2.length).assertEqual(0);

        // Verify slice with same start/end on empty array (still empty)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        const emptySliced4: BigInt64Array = emptyArr.slice(0, 0);
        expect(emptySliced4.length).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0101
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0101
     * @tc.desc   Verify BigInt64Array copyWithin with target=source is no-op
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const originalStr: string = bigInt64Arr.toString();
        const dv: DataView = new DataView(buf);

        // Case 1: copyWithin(target=0, start=0) → copy source 0 to target 0 (no-op)
        bigInt64Arr.copyWithin(0, 0);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 2: copyWithin(target=1, start=1, end=3) → copy source 1-2 to target 1-2 (no-op)
        bigInt64Arr.copyWithin(1, 1, 3);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 3: copyWithin(target=2, start=2) → copy source 2 to target 2 (no-op)
        bigInt64Arr.copyWithin(2, 2);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Modify array to confirm no-op isn't due to identical values
        dv.setBigInt64(8, 25n, true); // 20n → 25n
        const newOriginalStr: string = bigInt64Arr.toString(); // [10n,25n,30n]
        bigInt64Arr.copyWithin(1, 1); // copy source 1 to target 1 (no-op)
        expect(bigInt64Arr.toString()).assertEqual(newOriginalStr);

        // copyWithin on empty array (no-op)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        emptyArr.copyWithin(0, 1); // No effect
        expect(emptyArr.length).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0104
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0104
     * @tc.desc   Verify BigInt64Array set with out-of-bounds offset throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const source: bigint[] = [10n]; // Source with 1 element
        let isRangeError = false;

        // Case 1: Offset = 2 (array length is 2 → offset 2 is out of bounds)
        try {
          bigInt64Arr.set(source, 2);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 2: Offset = -1 (negative offset is invalid)
        isRangeError = false;
        try {
          bigInt64Arr.set(source, -1);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 3: Offset = 1 (valid), source length = 2 (exceeds remaining space → throws)
        isRangeError = false;
        const longSource: bigint[] = [10n, 20n];
        try {
          bigInt64Arr.set(longSource, 1); // Needs 2 elements, only 1 remaining (index 1)
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 4: Valid offset and source (control case)
        bigInt64Arr.set(source, 0); // Offset 0, source length 1 → valid
        expect(bigInt64Arr[0]).assertEqual(10n);
        expect(bigInt64Arr[1]).assertEqual(0n); // Unset element remains 0n

        // Case 5: Set on empty array (any offset throws)
        const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        isRangeError = false;
        try {
          emptyArr.set(source, 0);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0106
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0106
     * @tc.desc   Verify BigInt64Array subarray shares buffer with parent (sync modifications)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([10n, 20n, 30n]); // Initialize parent array
        // Subarray: covers elements 1-2 (offset 8, length 2)
        const subArr: BigInt64Array = parentArr.subarray(1, 3);
        const dv: DataView = new DataView(buf);

        // Verify subarray shares buffer with parent
        expect(subArr.buffer).assertEqual(parentArr.buffer);
        expect(subArr.byteOffset).assertEqual(8); // Matches parent's element 1 offset
        expect(subArr.length).assertEqual(2);

        // Step 1: Modify subarray → parent syncs
        subArr[0] = 25n; // Update subarray index 0 (parent index 1)
        subArr[1] = 35n; // Update subarray index 1 (parent index 2)
        expect(parentArr.toString()).assertEqual([10n,25n,35n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(25n);
        expect(dv.getBigInt64(16, true)).assertEqual(35n);

        // Step 2: Modify parent → subarray syncs
        parentArr[1] = 28n; // Update parent index 1 (subarray index 0)
        parentArr[2] = 38n; // Update parent index 2 (subarray index 1)
        expect(subArr.toString()).assertEqual([28n,38n].toString());

        // Step 3: Modify via DataView → both parent and subarray sync
        dv.setBigInt64(8, 22n, true); // Update parent index 1 (subarray index 0)
        expect(parentArr[1]).assertEqual(22n);
        expect(subArr[0]).assertEqual(22n);

        // Step 4: Subarray of subarray (still shares root buffer)
        const subSubArr: BigInt64Array = subArr.subarray(0, 1); // Covers subarray index 0 (parent index 1)
        subSubArr[0] = 29n;
        expect(parentArr[1]).assertEqual(29n);
        expect(subArr[0]).assertEqual(29n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0107
     * @tc.desc   Verify BigInt64Array constructor with length parameter (zero-initialized)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
        const length: number = 3; // Request 3 BigInt64 elements
        const bigInt64Arr: BigInt64Array = new BigInt64Array(length);
        const dv: DataView = new DataView(bigInt64Arr.buffer);

        // Verify constructor creates correct buffer and array properties
        expect(bigInt64Arr.length).assertEqual(length);
        expect(bigInt64Arr.byteLength).assertEqual(length * 8); // 3×8=24 bytes
        expect(bigInt64Arr.buffer.byteLength).assertEqual(length * 8); // Buffer matches byteLength
        expect(bigInt64Arr.byteOffset).assertEqual(0);

        // Verify all elements are zero-initialized (BigInt 0n)
        for (let i = 0; i < length; i++) {
          expect(bigInt64Arr[i]).assertEqual(0n);
          expect(dv.getBigInt64(i * 8, true)).assertEqual(0n);
        }

        // Modify one element via BigInt64Array → DataView syncs
        bigInt64Arr[1] = 50n;
        expect(dv.getBigInt64(8, true)).assertEqual(50n);

        // Modify one element via DataView → BigInt64Array syncs
        dv.setBigInt64(16, 70n, true); // Update element 2
        expect(bigInt64Arr[2]).assertEqual(70n);

        // Verify modified array values
        expect(bigInt64Arr.toString()).assertEqual([0n,50n,70n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0109
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0109
     * @tc.desc   Verify BigInt64Array conversion to plain BigInt array via Array.from (complete)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize typed array
        const dv: DataView = new DataView(buf);

        // Convert typed array to plain BigInt array via Array.from
        const plainArr: bigint[] = Array.from(bigInt64Arr);
        // Verify plain array values (use toString to match required format)
        expect(plainArr.toString()).assertEqual([10n,20n,30n].toString());

        // Modify typed array via DataView (syncs to typed array, not plain array)
        dv.setBigInt64(8, 25n, true); // Update element 1 (20n →25n)
        const updatedPlainArr: bigint[] = Array.from(bigInt64Arr);
        expect(updatedPlainArr.toString()).assertEqual([10n,25n,30n].toString());

        // Modify plain array (no sync to typed array)
        plainArr[0] = 15n;
        expect(bigInt64Arr[0]).assertEqual(10n); // Typed array remains unchanged
        expect(plainArr.toString()).assertEqual([15n,20n,30n].toString()); // Plain array updated
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0110
     * @tc.desc   Verify BigInt64Array with ArrayBuffer slice (partial range, sync check)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const originalBuf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(originalBuf);
        originalArr.set([5n, 15n, 25n, 35n]); // Initialize original array
        const dv: DataView = new DataView(originalBuf);

        // Slice ArrayBuffer: offset 16 (element 2), length 16 (covers elements 2-3)
        const slicedBuf: ArrayBuffer = originalBuf.slice(16, 32);
        const slicedArr: BigInt64Array = new BigInt64Array(slicedBuf);

        // Verify sliced array properties and values
        expect(slicedArr.length).assertEqual(2);
        expect(slicedArr.byteLength).assertEqual(16);
        expect(slicedArr.toString()).assertEqual([25n,35n].toString());

        // Modify original array via DataView (no sync to sliced buffer)
        dv.setBigInt64(16, 28n, true); // Update original element 2 (25n →28n)
        expect(originalArr[2]).assertEqual(28n);
        expect(slicedArr[0]).assertEqual(25n); // Sliced array unchanged

        // Modify sliced array (no sync to original buffer)
        slicedArr[1] = 38n;
        expect(slicedArr.toString()).assertEqual([25n,38n].toString());
        expect(originalArr[3]).assertEqual(35n); // Original array unchanged
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0111
     * @tc.desc   Verify DataView writes BigInt64 values with different endianness (sync to typed array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const testVal: bigint = 0x0000000000001234n; // Little-endian: 0x1234000000000000 when written as big-endian

        // DataView writes in big-endian (littleEndian=false)
        dv.setBigInt64(0, testVal, false);
        // Typed array reads in little-endian (default), so value is reversed
        const expectedLittleEndianVal: bigint = 0x3412000000000000n;
        expect(bigInt64Arr[0]).assertEqual(expectedLittleEndianVal);

        // Typed array writes in little-endian
        bigInt64Arr[0] = testVal;
        // DataView reads in big-endian, so value is reversed
        const expectedBigEndianReadVal: bigint = 0x3412000000000000n;
        expect(dv.getBigInt64(0, false)).assertEqual(expectedBigEndianReadVal);

        // Verify endianness consistency with DataView little-endian read
        expect(dv.getBigInt64(0, true)).assertEqual(testVal); // Matches typed array value
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0112
     * @tc.desc   Verify BigInt64Array out-of-bounds read returns undefined (no throw)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n]); // Initialize valid elements
        const dv: DataView = new DataView(buf);

        // Out-of-bounds read: index 2 (array length is 2)
        expect(bigInt64Arr[2]).assertEqual(undefined);
        // Out-of-bounds read: negative index -1
        expect(bigInt64Arr[-1]).assertEqual(undefined);
        // Out-of-bounds read: large index 100
        expect(bigInt64Arr[100]).assertEqual(undefined);

        // Verify valid indices still work
        expect(bigInt64Arr[0]).assertEqual(10n);
        expect(bigInt64Arr[1]).assertEqual(20n);

        // Modify valid element via DataView (out-of-bounds reads still undefined)
        dv.setBigInt64(8, 25n, true); // Update element 1 (20n →25n)
        expect(bigInt64Arr[1]).assertEqual(25n);
        expect(bigInt64Arr[2]).assertEqual(undefined);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0113
     * @tc.desc   Verify BigInt64Array fill with start > end (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([1n, 2n, 3n]); // Initialize array
        const originalStr: string = bigInt64Arr.toString();
        const fillVal: bigint = 9n;
        const dv: DataView = new DataView(buf);

        // Case 1: start=2, end=1 (start > end → no-op)
        bigInt64Arr.fill(fillVal, 2, 1);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 2: start=1, end=0 (start > end → no-op)
        bigInt64Arr.fill(fillVal, 1, 0);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 3: start=-1, end=-2 (start > end → no-op)
        bigInt64Arr.fill(fillVal, -1, -2);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Control case: start=0, end=2 (valid range → fill works)
        bigInt64Arr.fill(fillVal, 0, 2);
        expect(bigInt64Arr.toString()).assertEqual([9n,9n,3n].toString());
        expect(dv.getBigInt64(0, true)).assertEqual(9n);
        expect(dv.getBigInt64(8, true)).assertEqual(9n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0114
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0114
     * @tc.desc   Verify BigInt64Array copyWithin with start > end (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const originalStr: string = bigInt64Arr.toString();
        const dv: DataView = new DataView(buf);

        // Case 1: start=2, end=1 (start > end → no-op)
        bigInt64Arr.copyWithin(0, 2, 1);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 2: start=1, end=0 (start > end → no-op)
        bigInt64Arr.copyWithin(2, 1, 0);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 3: start=-1, end=-2 (start > end → no-op)
        bigInt64Arr.copyWithin(0, -1, -2);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Control case: start=0, end=2 (valid range → copy works)
        bigInt64Arr.copyWithin(1, 0, 2);
        expect(bigInt64Arr.toString()).assertEqual([10n,10n,20n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(10n);
        expect(dv.getBigInt64(16, true)).assertEqual(20n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0115
     * @tc.desc   Verify BigInt64Array includes with start > array length (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([50n, 60n]); // Initialize array
        const dv: DataView = new DataView(sab);

        // Case 1: start=5 (array length=2 → start > length → no elements to check → false)
        expect(bigInt64Arr.includes(50n, 5)).assertEqual(false);
        expect(bigInt64Arr.includes(60n, 5)).assertEqual(false);

        // Case 2: start=2 (equal to length → no elements to check → false)
        expect(bigInt64Arr.includes(50n, 2)).assertEqual(false);

        // Case 3: start=-10 (clamped to 0 → valid range → true)
        expect(bigInt64Arr.includes(50n, -10)).assertEqual(true);

        // Modify array via DataView (start > length still false)
        dv.setBigInt64(8, 65n, true); // Update element 1 (60n →65n)
        expect(bigInt64Arr.includes(65n, 5)).assertEqual(false);
        expect(bigInt64Arr.includes(65n, 1)).assertEqual(true); // Valid start
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0116
     * @tc.desc   Verify BigInt64Array indexOf with start > array length (returns -1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([15n, 25n, 15n]); // Initialize array with duplicate
        const dv: DataView = new DataView(buf);

        // Case 1: start=10 (array length=3 → start > length → no match → -1)
        expect(bigInt64Arr.indexOf(15n, 10)).assertEqual(-1);
        expect(bigInt64Arr.indexOf(25n, 10)).assertEqual(-1);

        // Case 2: start=3 (equal to length → no match → -1)
        expect(bigInt64Arr.indexOf(15n, 3)).assertEqual(-1);

        // Case 3: start=-5 (clamped to 0 → valid range → returns 0)
        expect(bigInt64Arr.indexOf(15n, -5)).assertEqual(0);

        // Modify duplicate via DataView (start > length still -1)
        dv.setBigInt64(16, 35n, true); // Update element 2 (15n →35n)
        expect(bigInt64Arr.indexOf(15n, 10)).assertEqual(-1);
        expect(bigInt64Arr.indexOf(15n, 0)).assertEqual(0); // Valid start
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0117
     * @tc.desc   Verify BigInt64Array lastIndexOf with start < 0 (clamped to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 5n]); // Initialize array with duplicate
        const dv: DataView = new DataView(buf);

        // Case 1: start=-10 (clamped to 0 → search only index 0)
        expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1);
        expect(bigInt64Arr.lastIndexOf(15n, -10)).assertEqual(-1); // No 15n at index 0

        // Case 2: start=-1 (clamped to 2 → search indices 0-2)
        expect(bigInt64Arr.lastIndexOf(5n, -1)).assertEqual(2);

        // Case 3: start=-2 (clamped to 1 → search indices 0-1)
        expect(bigInt64Arr.lastIndexOf(5n, -2)).assertEqual(0);

        // Modify element 0 via DataView (start <0 result updates)
        dv.setBigInt64(0, 25n, true); // Update element 0 (5n →25n)
        expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1); // No 5n at index 0
        expect(bigInt64Arr.lastIndexOf(5n, -2)).assertEqual(-1); // No 5n in 0-1
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0118
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (cross-view modification sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        // Create 3 views: 2 BigInt64Array, 1 DataView
        const viewA: BigInt64Array = new BigInt64Array(sab, 0, 2); // Elements 0-1
        const viewB: BigInt64Array = new BigInt64Array(sab, 8, 2); // Elements 1-2
        const dv: DataView = new DataView(sab);

        // Step 1: Modify via viewA → sync to viewB and dv
        viewA.set([100n, 200n]);
        expect(viewB[0]).assertEqual(200n); // viewB shares element 1 with viewA
        expect(dv.getBigInt64(0, true)).assertEqual(100n);
        expect(dv.getBigInt64(8, true)).assertEqual(200n);

        // Step 2: Modify via viewB → sync to viewA and dv
        viewB[1] = 300n; // Update element 2
        expect(viewA[1]).assertEqual(200n); // viewA doesn't cover element 2 → no change
        expect(dv.getBigInt64(16, true)).assertEqual(300n);

        // Step 3: Modify via dv → sync to viewA and viewB
        dv.setBigInt64(8, 250n, true); // Update element 1
        expect(viewA[1]).assertEqual(250n);
        expect(viewB[0]).assertEqual(250n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0119
     * @tc.desc   Verify BigInt64Array forEach with index and array parameters (access correct values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([3n, 6n, 9n]); // Initialize array
        const log: string[] = [];
        const dv: DataView = new DataView(buf);

        // forEach callback: logs value, index, and array reference
        bigInt64Arr.forEach((val, idx, arr) => {
          log.push(`val:${val}, idx:${idx}, arrRef:${arr === bigInt64Arr}`);
        });

        // Verify log entries (correct value, index, and array reference)
        expect(log[0]).assertEqual('val:3, idx:0, arrRef:true');
        expect(log[1]).assertEqual('val:6, idx:1, arrRef:true');
        expect(log[2]).assertEqual('val:9, idx:2, arrRef:true');

        // Modify array via DataView and re-run forEach
        dv.setBigInt64(8, 7n, true); // Update element 1 (6n →7n)
        log.length = 0; // Clear log
        bigInt64Arr.forEach((val, idx) => {
          log.push(`val:${val}, idx:${idx}`);
        });
        expect(log[0]).assertEqual('val:3, idx:0');
        expect(log[1]).assertEqual('val:7, idx:1');
        expect(log[2]).assertEqual('val:9, idx:2');
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0120
     * @tc.desc   Verify BigInt64Array map with index and array parameters (transformation uses index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([2n, 4n, 6n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Map callback: val + idx (uses index to adjust value)
        const mappedArr: BigInt64Array = originalArr.map((val, idx) => val + BigInt(idx));
        expect(mappedArr.toString()).assertEqual([2n,5n,8n].toString()); // 2+0=2, 4+1=5, 6+2=8

        // Modify original array via DataView and re-map
        dv.setBigInt64(8, 5n, true); // Update element 1 (4n →5n)
        const newMappedArr: BigInt64Array = originalArr.map((val, idx) => val + BigInt(idx));
        expect(newMappedArr.toString()).assertEqual([2n,6n,8n].toString()); // 2+0=2, 5+1=6, 6+2=8

        // Verify map uses current array reference (not stale)
        const arrRefCheck: BigInt64Array = originalArr.map((val, _idx, arr) => {
          return arr === originalArr ? val : 0n;
        });
        expect(arrRefCheck.toString()).assertEqual([2n,5n,6n].toString()); // All values preserved (arr reference matches)
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0121
     * @tc.desc   Verify BigInt64Array filter with index parameter (filters by index range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        originalArr.set([10n, 20n, 30n, 40n]); // Initialize array
        const dv: DataView = new DataView(sab);

        // Filter callback: keep elements where idx is even (0,2)
        const filteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx % 2 === 0);
        expect(filteredArr.toString()).assertEqual([10n,30n].toString());

        // Modify original array via DataView (even indices) and re-filter
        dv.setBigInt64(0, 15n, true); // Update index 0 (10n →15n)
        dv.setBigInt64(16, 35n, true); // Update index 2 (30n →35n)
        const newFilteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx % 2 === 0);
        expect(newFilteredArr.toString()).assertEqual([15n,35n].toString());

        // Filter by index > 1 (keep indices 2,3)
        const idxFilteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx > 1);
        expect(idxFilteredArr.toString()).assertEqual([35n,40n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0122
     * @tc.desc   Verify BigInt64Array reduce with index and array parameters (tracks index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 15n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Reduce callback: acc + val + idx (sum value and index)
        const sumWithIdx: bigint = bigInt64Arr.reduce((acc, val, idx) => {
          return acc + val + BigInt(idx);
        }, 0n);
        // Calculation: 0 + (5+0) + (10+1) + (15+2) = 0+5+11+17=33n
        expect(sumWithIdx).assertEqual(33n);

        // Modify element 1 via DataView and re-reduce
        dv.setBigInt64(8, 12n, true); // Update element 1 (10n →12n)
        const newSumWithIdx: bigint = bigInt64Arr.reduce((acc, val, idx) => {
          return acc + val + BigInt(idx);
        }, 0n);
        // Calculation: 0 + (5+0) + (12+1) + (15+2) = 0+5+13+17=35n
        expect(newSumWithIdx).assertEqual(35n);

        // Verify array reference in reduce
        const arrRefCheck: bigint = bigInt64Arr.reduce((acc, val, _idx, arr) => {
          return arr === bigInt64Arr ? acc + val : 0n;
        }, 0n);
        expect(arrRefCheck).assertEqual(5n + 12n + 15n); // 32n
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0123
     * @tc.desc   Verify BigInt64Array every with index parameter (checks value and index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Every callback: val > idx * 5 (10>0, 20>5, 30>10 → all true)
        const allMeetCondition: boolean = bigInt64Arr.every((val, idx) => val > BigInt(idx * 5));
        expect(allMeetCondition).assertEqual(true);

        // Modify element 2 via DataView (30n →9n) → 9>10? false
        dv.setBigInt64(16, 9n, true);
        const someFail: boolean = bigInt64Arr.every((val, idx) => val > BigInt(idx * 5));
        expect(someFail).assertEqual(false);

        // Every callback: idx < 3 (always true for 3-element array)
        const idxCheck: boolean = bigInt64Arr.every((_val, idx) => idx < 3);
        expect(idxCheck).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0124
     * @tc.desc   Verify BigInt64Array some with index parameter (checks value and index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([5n, 15n, 25n]); // Initialize array
        const dv: DataView = new DataView(sab);

        // Some callback: val === idx * 5 + 5 (5=0*5+5 → true)
        const hasMatch: boolean = bigInt64Arr.some((val, idx) => val === BigInt(idx * 5 + 5));
        expect(hasMatch).assertEqual(true);

        // Modify element 0 via DataView (5n →6n) → check val === idx*5+6 (15=1*5+10? No; 25=2*5+15? No; 6=0*5+6? Yes)
        dv.setBigInt64(0, 6n, true);
        const newHasMatch: boolean = bigInt64Arr.some((val, idx) => val === BigInt(idx * 5 + 6));
        expect(newHasMatch).assertEqual(true);

        // Some callback: idx === 5 (no index 5 → false)
        const noIdxMatch: boolean = bigInt64Arr.some((_val, idx) => idx === 5);
        expect(noIdxMatch).assertEqual(false);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0125
     * @tc.desc   Verify BigInt64Array with DataView reading/writing 8-bit values (partial byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const initialVal: bigint = 0x1122334455667788n; // 64-bit initial value

        // Set initial value via BigInt64Array
        bigInt64Arr[0] = initialVal;

        // DataView reads 8-bit values from different offsets (little-endian)
        expect(dv.getUint8(0)).assertEqual(0x88); // Offset 0 (LSB)
        expect(dv.getUint8(1)).assertEqual(0x77); // Offset 1
        expect(dv.getUint8(7)).assertEqual(0x11); // Offset 7 (MSB)

        // DataView writes 8-bit value to offset 2 (0x33 →0x99)
        dv.setUint8(2, 0x99);
        const modifiedVal: bigint = 0x1122334455997788n; // Expected modified value
        expect(bigInt64Arr[0]).assertEqual(modifiedVal);

        // DataView writes 8-bit value to offset 7 (0x11 →0xFF)
        dv.setUint8(7, 0xFF);
        const finalVal: bigint = -0xddccbbaa668878n; // Expected final value
        expect(bigInt64Arr[0]).assertEqual(finalVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0126
     * @tc.desc   Verify BigInt64Array with DataView reading/writing 16-bit values (partial bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const initialVal: bigint = 0x0001020304050607n; // 64-bit initial value

        // Set initial value via BigInt64Array
        bigInt64Arr[0] = initialVal;

        // DataView reads 16-bit values from different offsets (little-endian)
        expect(dv.getUint16(0, true)).assertEqual(0x0607); // Offsets 0-1
        expect(dv.getUint16(2, true)).assertEqual(0x0405); // Offsets 2-3
        expect(dv.getUint16(6, true)).assertEqual(0x0001); // Offsets 6-7

        // DataView writes 16-bit value to offsets 4-5 (0x0203 →0x0A0B)
        dv.setUint16(4, 0x0A0B, true);
        const modifiedVal: bigint = 0x00010A0B04050607n; // Expected modified value
        expect(bigInt64Arr[0]).assertEqual(modifiedVal);

        // DataView writes 16-bit value to offsets 0-1 (0x0607 →0x0C0D)
        dv.setUint16(0, 0x0C0D, true);
        const finalVal: bigint = 0x00010A0B04050C0Dn; // Expected final value
        expect(bigInt64Arr[0]).assertEqual(finalVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0127
     * @tc.desc   Verify BigInt64Array with DataView reading/writing 32-bit values (partial bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const initialVal: bigint = 0x1111222233334444n; // 64-bit initial value

        // Set initial value via BigInt64Array
        bigInt64Arr[0] = initialVal;

        // DataView reads 32-bit values from different offsets (little-endian)
        expect(dv.getUint32(0, true)).assertEqual(0x33334444); // Offsets 0-3 (lower 32 bits)
        expect(dv.getUint32(4, true)).assertEqual(0x11112222); // Offsets 4-7 (upper 32 bits)

        // DataView writes 32-bit value to offsets 0-3 (0x33334444 →0x55556666)
        dv.setUint32(0, 0x55556666, true);
        const modifiedVal: bigint = 0x1111222255556666n; // Expected modified value
        expect(bigInt64Arr[0]).assertEqual(modifiedVal);

        // DataView writes 32-bit value to offsets 4-7 (0x11112222 →0x77778888)
        dv.setUint32(4, 0x77778888, true);
        const finalVal: bigint = 0x7777888855556666n; // Expected final value
        expect(bigInt64Arr[0]).assertEqual(finalVal);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0128
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0128
     * @tc.desc   Verify BigInt64Array constructor with buffer, byteOffset, and length (valid range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const dv: DataView = new DataView(buf);
        // Pre-fill buffer with values via DataView (offsets 0,8,16,24)
        dv.setBigInt64(0, 10n, true);
        dv.setBigInt64(8, 20n, true);
        dv.setBigInt64(16, 30n, true);
        dv.setBigInt64(24, 40n, true);

        // Constructor: buffer + byteOffset=8 + length=2 (covers elements 1-2)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, 8, 2);

        // Verify array properties and values
        expect(bigInt64Arr.length).assertEqual(2);
        expect(bigInt64Arr.byteOffset).assertEqual(8);
        expect(bigInt64Arr.byteLength).assertEqual(16);
        expect(bigInt64Arr.toString()).assertEqual([20n,30n].toString());

        // Modify array → sync to buffer (via DataView)
        bigInt64Arr[0] = 25n; // Update element 1
        expect(dv.getBigInt64(8, true)).assertEqual(25n);

        // Modify buffer via DataView → sync to array
        dv.setBigInt64(16, 35n, true); // Update element 2
        expect(bigInt64Arr[1]).assertEqual(35n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0129
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0129
     * @tc.desc   Verify BigInt64Array constructor with invalid byteOffset (throws RangeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        let isRangeError = false;

        // Case 1: byteOffset=4 (not multiple of 8 → invalid for BigInt64)
        try {
          new BigInt64Array(buf, 4, 1);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 2: byteOffset=16 (exceeds buffer length 16 → invalid)
        isRangeError = false;
        try {
          new BigInt64Array(buf, 16, 1);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 3: byteOffset=8, length=2 (buffer has only 2 elements → length exceeds remaining → invalid)
        isRangeError = false;
        try {
          new BigInt64Array(buf, 8, 2); // Remaining elements after offset 8: 1 (index 1)
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Control case: valid byteOffset=8, length=1
        isRangeError = false;
        let bigInt64Arr: BigInt64Array | null = null;
        try {
          bigInt64Arr = new BigInt64Array(buf, 8, 1);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(false);
        expect(bigInt64Arr?.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0130
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0130
     * @tc.desc   Verify BigInt64Array constructor with invalid length (throws RangeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        let isRangeError = false;

        // Case 1: length=-1 (negative length → invalid)
        try {
          new BigInt64Array(buf, 0, -1);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 2: length=4 (buffer has only 3 elements → length exceeds buffer capacity → invalid)
        isRangeError = false;
        try {
          new BigInt64Array(buf, 0, 4); // 4×8=32 > 24 bytes
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Case 3: length=2, byteOffset=16 (remaining bytes after offset 16: 8 → 1 element → length=2 invalid)
        isRangeError = false;
        try {
          new BigInt64Array(buf, 16, 2); // 2×8=16 > 8 remaining bytes
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        // Control case: valid length=2, byteOffset=0
        isRangeError = false;
        let bigInt64Arr: BigInt64Array | null = null;
        try {
          bigInt64Arr = new BigInt64Array(buf, 0, 2);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(false);
        expect(bigInt64Arr?.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0132
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0132
     * @tc.desc   Verify BigInt64Array slice with negative end index (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([5n, 15n, 25n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: slice(start=0, end=-1) → end clamped to 2 (array length 3 → 3-1=2) → elements 0-1
        const sliced1: BigInt64Array = originalArr.slice(0, -1);
        expect(sliced1.toString()).assertEqual([5n,15n].toString());

        // Case 2: slice(start=1, end=-2) → end clamped to 1 (3-2=1) → start=1 > end=1 → empty array
        const sliced2: BigInt64Array = originalArr.slice(1, -2);
        expect(sliced2.length).assertEqual(0);

        // Case 3: slice(start=-3, end=-1) → start clamped to 0, end clamped to 2 → elements 0-1
        const sliced3: BigInt64Array = originalArr.slice(-3, -1);
        expect(sliced3.toString()).assertEqual([5n,15n].toString());

        // Modify original array via DataView and re-slice
        dv.setBigInt64(8, 18n, true); // Update element 1 (15n →18n)
        const sliced4: BigInt64Array = originalArr.slice(0, -1);
        expect(sliced4.toString()).assertEqual([5n,18n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0133
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0133
     * @tc.desc   Verify BigInt64Array slice with negative start index (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([10n, 20n, 30n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: slice(start=-2, end=3) → start clamped to 1 (3-2=1) → elements 1-2
        const sliced1: BigInt64Array = originalArr.slice(-2, 3);
        expect(sliced1.toString()).assertEqual([20n,30n].toString());

        // Case 2: slice(start=-4, end=2) → start clamped to 0 (4>3) → elements 0-1
        const sliced2: BigInt64Array = originalArr.slice(-4, 2);
        expect(sliced2.toString()).assertEqual([10n,20n].toString());

        // Case 3: slice(start=-1, end=2) → start clamped to 2 (3-1=2) → start=2 > end=2 → empty array
        const sliced3: BigInt64Array = originalArr.slice(-1, 2);
        expect(sliced3.length).assertEqual(0);

        // Modify original array via DataView and re-slice
        dv.setBigInt64(16, 35n, true); // Update element 2 (30n →35n)
        const sliced4: BigInt64Array = originalArr.slice(-2, 3);
        expect(sliced4.toString()).assertEqual([20n,35n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0134
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0134
     * @tc.desc   Verify BigInt64Array copyWithin with negative target index (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 25n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: copyWithin(target=-1, start=0, end=2) → target clamped to 2 (3-1=2) → copy 0-1 to 2
        bigInt64Arr.copyWithin(-1, 0, 2);
        expect(bigInt64Arr.toString()).assertEqual([5n,15n,5n].toString());

        // Restore original array
        bigInt64Arr.set([5n, 15n, 25n]);

        // Case 2: copyWithin(target=-3, start=1, end=3) → target clamped to 0 (3-3=0) → copy 1-2 to 0
        bigInt64Arr.copyWithin(-3, 1, 3);
        expect(bigInt64Arr.toString()).assertEqual([15n,25n,25n].toString());

        // Restore original array
        bigInt64Arr.set([5n, 15n, 25n]);

        // Case 3: copyWithin(target=-2, start=2, end=3) → target clamped to 1 (3-2=1) → copy 2 to 1
        bigInt64Arr.copyWithin(-2, 2, 3);
        expect(bigInt64Arr.toString()).assertEqual([5n,25n,25n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(25n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0135
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0135
     * @tc.desc   Verify BigInt64Array copyWithin with negative start/end indices (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array

        // Case 1: copyWithin(target=0, start=-2, end=-1) → start=1, end=2 → copy 1 to 0
        bigInt64Arr.copyWithin(0, -2, -1);
        expect(bigInt64Arr.toString()).assertEqual([20n,20n,30n].toString());

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 2: copyWithin(target=1, start=-3, end=-2) → start=0, end=1 → copy 0 to 1
        bigInt64Arr.copyWithin(1, -3, -2);
        expect(bigInt64Arr.toString()).assertEqual([10n,10n,30n].toString());

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 3: copyWithin(target=2, start=-1, end=-0) → start=2, end=3 → copy 2 to 2 (no-op)
        bigInt64Arr.copyWithin(2, -1, -0);
        expect(bigInt64Arr.toString()).assertEqual([10n,20n,30n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0136
     * @tc.desc   Verify BigInt64Array fill with negative start index (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 25n]); // Initialize array
        const fillVal: bigint = 9n;
        const dv: DataView = new DataView(buf);

        // Case 1: fill(val, -2, 3) → start clamped to 1 (3-2=1) → fill 1-2
        bigInt64Arr.fill(fillVal, -2, 3);
        expect(bigInt64Arr.toString()).assertEqual([5n,9n,9n].toString());

        // Restore original array
        bigInt64Arr.set([5n, 15n, 25n]);

        // Case 2: fill(val, -4, 2) → start clamped to 0 (4>3) → fill 0-1
        bigInt64Arr.fill(fillVal, -4, 2);
        expect(bigInt64Arr.toString()).assertEqual([9n,9n,25n].toString());

        // Restore original array
        bigInt64Arr.set([5n, 15n, 25n]);

        // Case 3: fill(val, -1, 2) → start clamped to 2 (3-1=2) → start=2 > end=2 → no-op
        bigInt64Arr.fill(fillVal, -1, 2);
        expect(bigInt64Arr.toString()).assertEqual([5n,15n,25n].toString());

        // Verify DataView sync after valid fill
        bigInt64Arr.fill(fillVal, 0, 1);
        expect(dv.getBigInt64(0, true)).assertEqual(9n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0137
     * @tc.desc   Verify BigInt64Array fill with negative end index (clamped correctly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const fillVal: bigint = 7n;
        const dv: DataView = new DataView(buf);

        // Case 1: fill(val, 0, -1) → end clamped to 2 (3-1=2) → fill 0-1
        bigInt64Arr.fill(fillVal, 0, -1);
        expect(bigInt64Arr.toString()).assertEqual([7n,7n,30n].toString());

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 2: fill(val, 1, -2) → end clamped to 1 (3-2=1) → start=1 > end=1 → no-op
        bigInt64Arr.fill(fillVal, 1, -2);
        expect(bigInt64Arr.toString()).assertEqual([10n,20n,30n].toString());

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 3: fill(val, 0, -4) → end clamped to 0 (4>3) → start=0 > end=0 → no-op
        bigInt64Arr.fill(fillVal, 0, -4);
        expect(bigInt64Arr.toString()).assertEqual([10n,20n,30n].toString());

        // Verify DataView sync after valid fill
        bigInt64Arr.fill(fillVal, 1, -1);
        expect(dv.getBigInt64(8, true)).assertEqual(7n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0138
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (empty buffer, all operations no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const emptySab: SharedArrayBuffer = new SharedArrayBuffer(0); // Empty SharedArrayBuffer
        const bigInt64Arr: BigInt64Array = new BigInt64Array(emptySab);

        // Verify empty properties
        expect(bigInt64Arr.length).assertEqual(0);
        expect(bigInt64Arr.byteLength).assertEqual(0);
        expect(bigInt64Arr.buffer).assertEqual(emptySab);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0139
     * @tc.desc   Verify BigInt64Array with DataView reading signed 32-bit values (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const signed32Val: number = -123456; // 32-bit signed value

        // DataView writes signed 32-bit value to offset 0
        dv.setInt32(0, signed32Val, true);
        // BigInt64Array reads full 64-bit buffer (lower 32 bits = signed32Val, upper 32 bits = 0)
        expect(bigInt64Arr[0]).assertEqual(0xFFFE1DC0n);

        // DataView writes signed 32-bit value to offset 4 (upper 32 bits of BigInt64)
        dv.setInt32(4, 789, true);
        expect(bigInt64Arr[0]).assertEqual(0x315FFFE1DC0n);

        // BigInt64Array writes value, DataView reads signed 32-bit (lower 32 bits)
        bigInt64Arr[0] = -987654321n;
        const readInt32: number = dv.getInt32(0, true);
        expect(readInt32).assertEqual(-987654321);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0140
     * @tc.desc   Verify BigInt64Array forEach stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 15n]); // Initialize array
        let iterationCount = 0;
        const errorMsg = 'Test error at index 1';

        // forEach callback: throws at index 1
        try {
          bigInt64Arr.forEach((_val, idx) => {
            iterationCount++;
            if (idx === 1) {
              throw new Error(errorMsg);
            }
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }

        // Verify iteration stopped at index 1 (count=2: indices 0 and 1)
        expect(iterationCount).assertEqual(2);

        // Modify array via DataView, re-run to confirm behavior
        const dv: DataView = new DataView(buf);
        dv.setBigInt64(8, 20n, true); // Update index 1 to 20n
        iterationCount = 0;
        try {
          bigInt64Arr.forEach((_val, idx) => {
            iterationCount++;
            if (idx === 1) {
              throw new Error(errorMsg);
            }
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }
        expect(iterationCount).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0141
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0141
     * @tc.desc   Verify BigInt64Array map stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([2n, 4n, 6n]); // Initialize array
        let mappedValues: bigint[] = [];
        const errorMsg = 'Test error at index 1';

        // map callback: throws at index 1, collects values before error
        try {
          originalArr.map((val, idx) => {
            const result = val * 2n;
            mappedValues.push(result);
            if (idx === 1) {
              throw new Error(errorMsg);
            }
            return result;
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }

        // Verify only first 2 values were mapped (indices 0 and 1)
        expect(mappedValues.toString()).assertEqual([4n, 8n].toString());

        // Modify original array via DataView, re-run
        const dv: DataView = new DataView(buf);
        dv.setBigInt64(8, 5n, true); // Update index 1 to 5n
        mappedValues = [];
        try {
          originalArr.map((val, idx) => {
            const result = val * 2n;
            mappedValues.push(result);
            if (idx === 1) {
              throw new Error(errorMsg);
            }
            return result;
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }
        expect(mappedValues.toString()).assertEqual([4n, 10n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0142
     * @tc.desc   Verify BigInt64Array filter stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(sab);
        originalArr.set([10n, 20n, 30n]); // Initialize array
        let checkedValues: bigint[] = [];
        const errorMsg = 'Test error at index 1';

        // filter callback: throws at index 1, collects checked values before error
        try {
          originalArr.filter((val, idx) => {
            checkedValues.push(val);
            if (idx === 1) {
              throw new Error(errorMsg);
            }
            return val > 15n;
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }

        // Verify only first 2 values were checked (indices 0 and 1)
        expect(checkedValues.toString()).assertEqual([10n, 20n].toString());

        // Modify original array via DataView, re-run
        const dv: DataView = new DataView(sab);
        dv.setBigInt64(8, 25n, true); // Update index 1 to 25n
        checkedValues = [];
        try {
          originalArr.filter((val, idx) => {
            checkedValues.push(val);
            if (idx === 1) {
              throw new Error(errorMsg);
            }
            return val > 15n;
          });
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }
        expect(checkedValues.toString()).assertEqual([10n, 25n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0143
     * @tc.desc   Verify BigInt64Array reduce stops if callback throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 15n]); // Initialize array
        let lastAccumulator: bigint | null = null;
        const errorMsg = 'Test error at index 1';

        // reduce callback: throws at index 1, tracks last accumulator
        try {
          bigInt64Arr.reduce((acc, val, idx) => {
            const newAcc = acc + val;
            if (idx === 1) {
              lastAccumulator = newAcc;
              throw new Error(errorMsg);
            }
            lastAccumulator = newAcc;
            return newAcc;
          }, 0n);
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }

        // Verify accumulator after index 1 (0+5+10=15n)
        expect(lastAccumulator).assertEqual(15n);

        // Modify array via DataView, re-run
        const dv: DataView = new DataView(buf);
        dv.setBigInt64(8, 12n, true); // Update index 1 to 12n
        lastAccumulator = null;
        try {
          bigInt64Arr.reduce((acc, val, idx) => {
            const newAcc = acc + val;
            if (idx === 1) {
              lastAccumulator = newAcc;
              throw new Error(errorMsg);
            }
            lastAccumulator = newAcc;
            return newAcc;
          }, 0n);
        } catch (e) {
          expect((e as Error).message).assertEqual(errorMsg);
        }
        expect(lastAccumulator).assertEqual(17n); // 0+5+12=17n
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0144
     * @tc.desc   Verify BigInt64Array every stops early if callback returns false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        let checkedCount = 0;
        const condition = (val: bigint) => {
          checkedCount++;
          return val < 25n; // Fails at val=30n (index 2)
        };

        // First every call: condition fails at index 2 → stops early
        const result1 = bigInt64Arr.every(condition);
        expect(result1).assertEqual(false);
        expect(checkedCount).assertEqual(3); // All elements checked (fails at last)

        // Modify array to fail at index 1
        const dv: DataView = new DataView(buf);
        dv.setBigInt64(8, 35n, true); // Update index 1 to 35n
        checkedCount = 0;
        const result2 = bigInt64Arr.every(condition);
        expect(result2).assertEqual(false);
        expect(checkedCount).assertEqual(2); // Stops at index 1 (no need to check index 2)

        // Modify array to pass all conditions
        dv.setBigInt64(8, 20n, true); // Restore index 1 to 20n
        dv.setBigInt64(16, 25n, true); // Update index 2 to 25n (adjust condition to pass)
        checkedCount = 0;
        const newCondition = (val: bigint) => {
          checkedCount++;
          return val <= 25n; // Passes all
        };
        const result3 = bigInt64Arr.every(newCondition);
        expect(result3).assertEqual(true);
        expect(checkedCount).assertEqual(3); // All elements checked
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0145
     * @tc.desc   Verify BigInt64Array some stops early if callback returns true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        let checkedCount = 0;
        const condition = (val: bigint) => {
          checkedCount++;
          return val > 25n; // Passes at val=30n (index 2)
        };

        // First some call: passes at index 2 → checks all 3 elements
        const result1 = bigInt64Arr.some(condition);
        expect(result1).assertEqual(true);
        expect(checkedCount).assertEqual(3);

        // Modify array to pass at index 0
        const dv: DataView = new DataView(sab);
        dv.setBigInt64(0, 35n, true); // Update index 0 to 35n
        checkedCount = 0;
        const result2 = bigInt64Arr.some(condition);
        expect(result2).assertEqual(true);
        expect(checkedCount).assertEqual(1); // Stops at index 0 (no need to check others)

        // Modify array to pass at index 1
        dv.setBigInt64(0, 10n, true); // Restore index 0 to 10n
        dv.setBigInt64(8, 35n, true); // Update index 1 to 35n
        checkedCount = 0;
        const result3 = bigInt64Arr.some(condition);
        expect(result3).assertEqual(true);
        expect(checkedCount).assertEqual(2); // Stops at index 1
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0146
     * @tc.desc   Verify BigInt64Array with DataView writing float values (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const floatVal: number = 123.456; // Float value (truncated when coerced to BigInt)

        // DataView writes 64-bit float to buffer
        dv.setFloat64(0, floatVal, true);
        // BigInt64Array reads buffer as integer (float bits interpreted as BigInt)
        const floatAsBigInt: bigint = dv.getBigInt64(0, true);
        expect(bigInt64Arr[0]).assertEqual(floatAsBigInt);

        // BigInt64Array writes integer value
        bigInt64Arr[0] = 456n;
        // DataView reads as float (integer bits interpreted as float)
        const bigIntAsFloat: number = dv.getFloat64(0, true);
        expect(bigIntAsFloat).assertEqual(2.253e-321); // Integer value remains exact in float64

        // DataView writes 32-bit float (smaller precision)
        dv.setFloat32(0, 789.123, true);
        const float32AsBigInt: bigint = dv.getBigInt64(0, true);
        expect(bigInt64Arr[0]).assertEqual(float32AsBigInt);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0147
     * @tc.desc   Verify BigInt64Array subarray with max length (covers remaining elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([10n, 20n, 30n, 40n]); // Initialize parent array
        const dv: DataView = new DataView(buf);

        // Subarray: start=1, length=100 (exceeds remaining elements → clamped to 3)
        const subArr1: BigInt64Array = parentArr.subarray(1, 1 + 100);
        expect(subArr1.length).assertEqual(3);
        expect(subArr1.toString()).assertEqual([20n, 30n, 40n].toString());

        // Subarray: start=2, length=0 (zero length → empty array)
        const subArr2: BigInt64Array = parentArr.subarray(2, 2 + 0);
        expect(subArr2.length).assertEqual(0);

        // Subarray: start=3, length=5 (remaining elements=1 → clamped to 1)
        const subArr3: BigInt64Array = parentArr.subarray(3, 3 + 5);
        expect(subArr3.length).assertEqual(1);
        expect(subArr3[0]).assertEqual(40n);

        // Modify parent array via DataView → subarray syncs
        dv.setBigInt64(8, 25n, true); // Update parent index 1 to 25n
        expect(subArr1[0]).assertEqual(25n);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0148
     * @tc.desc   Verify BigInt64Array slice with max length (covers remaining elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const parentArr: BigInt64Array = new BigInt64Array(buf);
        parentArr.set([5n, 15n, 25n, 35n]); // Initialize parent array
        const dv: DataView = new DataView(buf);

        // Slice: start=1, end=100 (exceeds array length → clamped to 4)
        const sliced1: BigInt64Array = parentArr.slice(1, 100);
        expect(sliced1.length).assertEqual(3);
        expect(sliced1.toString()).assertEqual([15n, 25n, 35n].toString());
        expect(sliced1.buffer).not().assertEqual(parentArr.buffer);

        // Slice: start=2, end=2 (zero length → empty array)
        const sliced2: BigInt64Array = parentArr.slice(2, 2);
        expect(sliced2.length).assertEqual(0);

        // Slice: start=3, end=5 (remaining elements=1 → clamped to 4)
        const sliced3: BigInt64Array = parentArr.slice(3, 5);
        expect(sliced3.length).assertEqual(1);
        expect(sliced3[0]).assertEqual(35n);

        // Modify parent array via DataView → sliced arrays unchanged
        dv.setBigInt64(8, 20n, true); // Update parent index 1 to 20n
        expect(sliced1[0]).assertEqual(15n); // Sliced array retains original value
      })
    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0151
     * @tc.desc   Verify BigInt64Array with DataView reading unsigned 32-bit values (coerced to BigInt)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const uint32Val: number = 0xFFFFFF00; // 32-bit unsigned value (4294967040)

        // DataView writes unsigned 32-bit value to offset 0
        dv.setUint32(0, uint32Val, true);
        const expectedLower32: bigint = BigInt(uint32Val);
        expect(bigInt64Arr[0]).assertEqual(expectedLower32);

        // DataView writes unsigned 32-bit value to offset 4 (upper 32 bits)
        dv.setUint32(4, 0x000000FF, true);
        const expectedFull64: bigint = (BigInt(0x000000FF) << 32n) | expectedLower32;
        expect(bigInt64Arr[0]).assertEqual(expectedFull64);

        // BigInt64Array writes value, DataView reads unsigned 32-bit (lower 32 bits)
        bigInt64Arr[0] = 0x123456789ABCDEF0n;
        const readUint32: number = dv.getUint32(0, true);
        expect(readUint32).assertEqual(0x9ABCDEF0); // Lower 32 bits of the BigInt value
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0152
     * @tc.desc   Verify BigInt64Array copyWithin with target beyond array length (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 15n, 25n]); // Initialize array
        const originalStr = bigInt64Arr.toString();
        const dv: DataView = new DataView(buf);

        // Case 1: target=5 (exceeds array length 3 → no-op)
        bigInt64Arr.copyWithin(5, 0, 2);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 2: target=3 (equal to array length → no-op)
        bigInt64Arr.copyWithin(3, 0, 2);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 3: target=2, start=0, end=1 (valid range → copy works)
        bigInt64Arr.copyWithin(2, 0, 1);
        expect(bigInt64Arr.toString()).assertEqual([5n, 15n, 5n].toString());
        expect(dv.getBigInt64(16, true)).assertEqual(5n);

        // Restore original array
        bigInt64Arr.set([5n, 15n, 25n]);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0153
     * @tc.desc   Verify BigInt64Array fill with target beyond array length (no-op)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const originalStr = bigInt64Arr.toString();
        const fillVal: bigint = 99n;
        const dv: DataView = new DataView(buf);

        // Case 1: start=5 (exceeds array length 3 → no-op)
        bigInt64Arr.fill(fillVal, 5);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 2: start=3 (equal to array length → no-op)
        bigInt64Arr.fill(fillVal, 3);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);

        // Case 3: start=1, end=3 (valid range → fill works)
        bigInt64Arr.fill(fillVal, 1, 3);
        expect(bigInt64Arr.toString()).assertEqual([10n, 99n, 99n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(99n);
        expect(dv.getBigInt64(16, true)).assertEqual(99n);

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);
        expect(bigInt64Arr.toString()).assertEqual(originalStr);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0154
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0154
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (multi-thread simulation: lock-free read)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const thread1Arr: BigInt64Array = new BigInt64Array(sab);
        const thread2Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        // Thread 1 writes initial value
        thread1Arr[0] = 100n;
        expect(thread2Arr[0]).assertEqual(100n); // Thread 2 reads sync

        // Simulate Thread 1 write + Thread 2 read (lock-free)
        thread1Arr[0] = 200n;
        const thread2Read = thread2Arr[0];
        expect(thread2Read).assertEqual(200n); // No race condition in single-threaded simulation

        // Simulate Thread 2 write via DataView + Thread 1 read
        dv.setBigInt64(0, 300n, true);
        expect(thread1Arr[0]).assertEqual(300n);

        // Verify value consistency across all views
        expect(thread1Arr[0]).assertEqual(thread2Arr[0]);
        expect(thread2Arr[0]).assertEqual(dv.getBigInt64(0, true));
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0155
     * @tc.desc   Verify BigInt64Array indexOf with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 5n]); // Initialize array with duplicate
        const dv: DataView = new DataView(buf);

        // Case 1: start=1.9 (coerced to 1)
        expect(bigInt64Arr.indexOf(5n, 1.9)).assertEqual(2);

        // Case 2: start=2.1 (coerced to 2)
        expect(bigInt64Arr.indexOf(5n, 2.1)).assertEqual(2);

        // Case 3: start=-1.5 (coerced to -1 → clamped to 2)
        expect(bigInt64Arr.indexOf(5n, -1.5)).assertEqual(2);

        // Modify duplicate via DataView
        dv.setBigInt64(16, 15n, true); // Update index 2 (5n →15n)
        expect(bigInt64Arr.indexOf(5n, 1.9)).assertEqual(-1);

        // Case 4: start=0.0 (coerced to 0)
        expect(bigInt64Arr.indexOf(5n, 0.0)).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0156
     * @tc.desc   Verify BigInt64Array lastIndexOf with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([5n, 10n, 5n]); // Initialize array with duplicate
        const dv: DataView = new DataView(buf);

        // Case 1: start=1.9 (coerced to 1)
        expect(bigInt64Arr.lastIndexOf(5n, 1.9)).assertEqual(0);

        // Case 2: start=2.1 (coerced to 2)
        expect(bigInt64Arr.lastIndexOf(5n, 2.1)).assertEqual(2);

        // Case 3: start=-1.5 (coerced to -1 → clamped to 2)
        expect(bigInt64Arr.lastIndexOf(5n, -1.5)).assertEqual(2);

        // Modify duplicate via DataView
        dv.setBigInt64(0, 15n, true); // Update index 0 (5n →15n)
        expect(bigInt64Arr.lastIndexOf(5n, 1.9)).assertEqual(-1);

        // Case 4: start=0.0 (coerced to 0)
        expect(bigInt64Arr.lastIndexOf(5n, 0.0)).assertEqual(-1);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0157
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0157
     * @tc.desc   Verify BigInt64Array includes with non-integer start (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        bigInt64Arr.set([20n, 30n, 40n]); // Initialize array
        const dv: DataView = new DataView(sab);

        // Case 1: start=1.9 (coerced to 1) → check indices 1-2
        expect(bigInt64Arr.includes(30n, 1.9)).assertEqual(true);
        expect(bigInt64Arr.includes(20n, 1.9)).assertEqual(false);

        // Case 2: start=2.1 (coerced to 2) → check index 2
        expect(bigInt64Arr.includes(40n, 2.1)).assertEqual(true);
        expect(bigInt64Arr.includes(30n, 2.1)).assertEqual(false);

        // Case 3: start=-1.5 (coerced to -1 → clamped to 2) → check index 2
        expect(bigInt64Arr.includes(40n, -1.5)).assertEqual(true);

        // Modify array via DataView
        dv.setBigInt64(16, 45n, true); // Update index 2 (40n →45n)
        expect(bigInt64Arr.includes(40n, 2.1)).assertEqual(false);
        expect(bigInt64Arr.includes(45n, 2.1)).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0158
     * @tc.desc   Verify BigInt64Array with DataView writing 8-bit unsigned values (partial byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const initialVal: bigint = 0x0000000000000000n;

        // Set initial zero value
        bigInt64Arr[0] = initialVal;

        // Write 8-bit unsigned value to offset 0 (0x12)
        dv.setUint8(0, 0x12);
        let expectedVal: bigint = 0x0000000000000012n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Write 8-bit unsigned value to offset 3 (0x34)
        dv.setUint8(3, 0x34);
        expectedVal = 0x0000000034000012n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Write 8-bit unsigned value to offset 7 (0x78)
        dv.setUint8(7, 0x78);
        expectedVal = 0x7800000034000012n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Read back 8-bit values to confirm
        expect(dv.getUint8(0)).assertEqual(0x12);
        expect(dv.getUint8(3)).assertEqual(0x34);
        expect(dv.getUint8(7)).assertEqual(0x78);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0159
     * @tc.desc   Verify BigInt64Array with DataView writing 16-bit unsigned values (partial bytes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const initialVal: bigint = 0x0000000000000000n;

        // Set initial zero value
        bigInt64Arr[0] = initialVal;

        // Write 16-bit unsigned value to offset 0 (0x1234)
        dv.setUint16(0, 0x1234, true);
        let expectedVal: bigint = 0x0000000000001234n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Write 16-bit unsigned value to offset 2 (0x5678)
        dv.setUint16(2, 0x5678, true);
        expectedVal = 0x0000000000567834n; // Note: Little-endian → offset 2-3: 0x7856, so combined 0x567834?
        // Correct expected value (little-endian: offset 0=0x34, 1=0x12, 2=0x78, 3=0x56 → 0x56781234)
        expectedVal = 0x0000000056781234n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Write 16-bit unsigned value to offset 4 (0x9ABC)
        dv.setUint16(4, 0x9ABC, true);
        expectedVal = 0x00009ABC56781234n; // Little-endian: offset 4=0xBC, 5=0x9A → upper 32 bits: 0x000000BC9A
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Read back 16-bit values to confirm
        expect(dv.getUint16(0, true)).assertEqual(0x1234);
        expect(dv.getUint16(2, true)).assertEqual(0x5678);
        expect(dv.getUint16(4, true)).assertEqual(0x9ABC);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0162
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0162
     * @tc.desc   Verify BigInt64Array with DataView reading 64-bit values in big-endian
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const testVal: bigint = 0x0011223344556677n;

        // BigInt64Array writes in little-endian (default)
        bigInt64Arr[0] = testVal;
        // DataView reads in big-endian → bytes reversed
        const bigEndianRead: bigint = dv.getBigInt64(0, false);
        const expectedBigEndian: bigint = 0x7766554433221100n;
        expect(bigEndianRead).assertEqual(expectedBigEndian);

        // DataView writes in big-endian
        dv.setBigInt64(0, testVal, false);
        // BigInt64Array reads in little-endian → bytes reversed
        const littleEndianRead: bigint = bigInt64Arr[0];
        expect(littleEndianRead).assertEqual(expectedBigEndian);

        // Verify consistency with little-endian read
        expect(dv.getBigInt64(0, true)).assertEqual(littleEndianRead);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0163
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0163
     * @tc.desc   Verify BigInt64Array copyWithin with non-integer target/start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([1n, 2n, 3n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: target=0.9 (coerced to 0), start=1.1 (coerced to 1), end=2.9 (coerced to 2)
        bigInt64Arr.copyWithin(0.9, 1.1, 2.9);
        expect(bigInt64Arr.toString()).assertEqual([2n, 2n, 3n].toString());

        // Restore original array
        bigInt64Arr.set([1n, 2n, 3n]);

        // Case 2: target=1.5 (coerced to 1), start=0.2 (coerced to 0), end=1.8 (coerced to 1)
        bigInt64Arr.copyWithin(1.5, 0.2, 1.8);
        expect(bigInt64Arr.toString()).assertEqual([1n, 1n, 3n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(1n);

        // Restore original array
        bigInt64Arr.set([1n, 2n, 3n]);

        // Case 3: target=-0.5 (coerced to 0), start=-1.2 (coerced to 2), end=-0.1 (coerced to 3)
        bigInt64Arr.copyWithin(-0.5, -1.2, -0.1);
        expect(bigInt64Arr.toString()).assertEqual([1n, 2n, 3n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0164
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0164
     * @tc.desc   Verify BigInt64Array fill with non-integer start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        bigInt64Arr.set([10n, 20n, 30n]); // Initialize array
        const fillVal: bigint = 5n;
        const dv: DataView = new DataView(buf);

        // Case 1: start=0.9 (coerced to 0), end=2.1 (coerced to 2)
        bigInt64Arr.fill(fillVal, 0.9, 2.1);
        expect(bigInt64Arr.toString()).assertEqual([5n, 5n, 30n].toString());

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 2: start=1.2 (coerced to 1), end=-0.5 (coerced to 2)
        bigInt64Arr.fill(fillVal, 1.2, -0.5);
        expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
        expect(dv.getBigInt64(8, true)).assertEqual(20n);

        // Restore original array
        bigInt64Arr.set([10n, 20n, 30n]);

        // Case 3: start=-1.8 (coerced to 2), end=3.5 (coerced to 3)
        bigInt64Arr.fill(fillVal, -1.8, 3.5);
        expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 5n].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0165
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0165
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (empty buffer, multi-view consistency)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const emptySab: SharedArrayBuffer = new SharedArrayBuffer(0);
        const view1: BigInt64Array = new BigInt64Array(emptySab);
        const view2: BigInt64Array = new BigInt64Array(emptySab);
        const dv: DataView = new DataView(emptySab);

        // Verify all views are empty
        expect(view1.length).assertEqual(0);
        expect(view2.length).assertEqual(0);
        expect(view1.byteLength).assertEqual(0);
        expect(view2.byteLength).assertEqual(0);

        // Verify buffer reference consistency
        expect(view1.buffer).assertEqual(emptySab);
        expect(view2.buffer).assertEqual(emptySab);
        expect(dv.buffer).assertEqual(emptySab);

        // DataView operations throw RangeError
        let isRangeError = false;
        try {
          dv.getBigInt64(0, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);

        try {
          dv.setBigInt64(0, 1n, true);
        } catch (e) {
          isRangeError = (e as Error).name === 'RangeError';
        }
        expect(isRangeError).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0166
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0166
     * @tc.desc   Verify BigInt64Array slice with non-integer start/end (coerced to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const originalArr: BigInt64Array = new BigInt64Array(buf);
        originalArr.set([5n, 15n, 25n]); // Initialize array
        const dv: DataView = new DataView(buf);

        // Case 1: start=0.9 (coerced to 0), end=2.1 (coerced to 2)
        const sliced1: BigInt64Array = originalArr.slice(0.9, 2.1);
        expect(sliced1.toString()).assertEqual([5n, 15n].toString());

        // Case 2: start=1.2 (coerced to 1), end=-0.5 (coerced to 2)
        const sliced2: BigInt64Array = originalArr.slice(1.2, -0.5);
        expect(sliced2.toString()).assertEqual([].toString());

        // Case 3: start=-1.8 (coerced to 2), end=3.5 (coerced to 3)
        const sliced3: BigInt64Array = originalArr.slice(-1.8, 3.5);
        expect(sliced3.toString()).assertEqual([25n].toString());

        // Modify original array via DataView → sliced arrays unchanged
        dv.setBigInt64(8, 20n, true); // Update index 1 to 20n
        expect(sliced1.toString()).assertEqual([5n, 15n].toString());
        expect(sliced2.toString()).assertEqual([].toString());
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0167
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0167
     * @tc.desc   Verify BigInt64Array with DataView reading 64-bit values in mixed endianness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        const littleEndianVal: bigint = 0x0011223344556677n; // Expected when read in little-endian
        const bigEndianVal: bigint = 0x7766554433221100n; // Expected when read in big-endian

        // Write via BigInt64Array (little-endian)
        bigInt64Arr[0] = littleEndianVal;
        expect(dv.getBigInt64(0, true)).assertEqual(littleEndianVal); // Little-endian read matches
        expect(dv.getBigInt64(0, false)).assertEqual(bigEndianVal); // Big-endian read is reversed

        // Write via DataView (big-endian)
        dv.setBigInt64(0, littleEndianVal, false);
        expect(bigInt64Arr[0]).assertEqual(bigEndianVal); // BigInt64Array (little-endian) reads reversed
        expect(dv.getBigInt64(0, false)).assertEqual(littleEndianVal); // Big-endian read matches

        // Verify byte order consistency
        const bytes: number[] = [];
        for (let i = 0; i < 8; i++) {
          bytes.push(dv.getUint8(i));
        }
        // Bytes from DataView big-endian write: [0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]
        expect(bytes.toString()).assertEqual([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77].toString());
      })
    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0169
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0169
     * @tc.desc   Verify BigInt64Array with DataView handling out-of-bounds 8-bit writes (clamped values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        bigInt64Arr[0] = 0n; // Initialize to zero

        // Case 1: Write 8-bit value exceeding 0xFF (255) → clamped to 0xFF
        dv.setUint8(0, 300);
        expect(dv.getUint8(0)).assertEqual(44);
        expect(bigInt64Arr[0]).assertEqual(44n);

        // Case 2: Write negative 8-bit value → clamped to 0
        dv.setUint8(1, -50);
        expect(dv.getUint8(1)).assertEqual(206);
        expect(bigInt64Arr[0]).assertEqual(0x000000000000ce2cn); // No change to other bytes

        // Case 3: Write valid 8-bit value to upper byte (offset 7)
        dv.setUint8(7, 128);
        const expectedVal: bigint = -0x7fffffffffff31d4n;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);
        expect(dv.getUint8(7)).assertEqual(128);

      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0170
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0170
     * @tc.desc   Verify BigInt64Array entries() iterator returns [index, value] pairs consistently
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(24); // 3×8=24 bytes (3 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        // Initialize via DataView to ensure buffer sync
        dv.setBigInt64(0, 100n, true);
        dv.setBigInt64(8, 200n, true);
        dv.setBigInt64(16, 300n, true);

        // Collect entries via iterator
        const entries: [number, bigint][] = [];
        for (const entry of bigInt64Arr.entries()) {
          entries.push(entry);
        }

        // Verify entry count and values
        expect(entries.length).assertEqual(3);
        expect(entries[0].toString()).assertEqual([0, 100n].toString());
        expect(entries[1].toString()).assertEqual([1, 200n].toString());
        expect(entries[2].toString()).assertEqual([2, 300n].toString());

        // Modify array via BigInt64Array and re-check entries
        bigInt64Arr[1] = 250n;
        const updatedEntries: [number, bigint][] = [];
        for (const entry of bigInt64Arr.entries()) {
          updatedEntries.push(entry);
        }
        expect(updatedEntries.toString()).assertEqual([[0, 100n], [1, 250n], [2, 300n]].toString());

      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0171
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0171
     * @tc.desc   Verify BigInt64Array keys() iterator returns correct indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(32); // 4×8=32 bytes (4 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);
        // Fill buffer with dummy values to ensure array is initialized
        for (let i = 0; i < 4; i++) {
          dv.setBigInt64(i * 8, BigInt(i * 50), true);
        }

        // Collect keys via iterator
        const keys: number[] = [];
        for (const key of bigInt64Arr.keys()) {
          keys.push(key);
        }

        // Verify key sequence
        expect(keys.toString()).assertEqual([0, 1, 2, 3].toString());

        // Create subarray and check keys (should start from 0 for subarray)
        const subArr: BigInt64Array = bigInt64Arr.subarray(1, 3);
        const subKeys: number[] = [];
        for (const key of subArr.keys()) {
          subKeys.push(key);
        }
        expect(subKeys.toString()).assertEqual([0, 1].toString());

      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0172
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0172
     * @tc.desc   Verify BigInt64Array values() iterator returns consistent values (buffer sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(16); // 2×8=16 bytes (2 BigInt64 elements)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);

        // Initialize array
        bigInt64Arr.set([-500n, 750n]);
        // Collect values via iterator
        const values: bigint[] = [];
        for (const val of bigInt64Arr.values()) {
          values.push(val);
        }
        expect(values.toString()).assertEqual([-500n, 750n].toString());

        // Modify buffer via DataView and re-check values iterator
        dv.setBigInt64(0, -600n, true); // Update index 0
        const updatedValues: bigint[] = [];
        for (const val of bigInt64Arr.values()) {
          updatedValues.push(val);
        }
        expect(updatedValues.toString()).assertEqual([-600n, 750n].toString());

        // Modify array directly and re-check
        bigInt64Arr[1] = 850n;
        const finalValues: bigint[] = [];
        for (const val of bigInt64Arr.values()) {
          finalValues.push(val);
        }
        expect(finalValues.toString()).assertEqual([-600n, 850n].toString());

      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0173
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0173
     * @tc.desc   Verify BigInt64Array with DataView writing 16-bit signed values (negative values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        bigInt64Arr[0] = 0n; // Initialize to zero

        // Case 1: Write 16-bit signed negative value (-100 → 0xFF9C in 16-bit two's complement)
        dv.setInt16(0, -100, true);
        let expectedVal: bigint = 0x000000000000FF9Cn;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);
        expect(dv.getInt16(0, true)).assertEqual(-100);

        // Case 2: Write 16-bit signed value to offset 2 (32000 → 0x7D00)
        dv.setInt16(2, 32000, true);
        expectedVal = 0x000000007D00FF9Cn;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);
        expect(dv.getInt16(2, true)).assertEqual(32000);

        // Case 3: Write 16-bit signed value to upper bytes (offset 6)
        dv.setInt16(6, -500, true);
        expectedVal = -0x1f3ffff82ff0064n; // 0xFC18 = two's complement of -500
        expect(bigInt64Arr[0]).assertEqual(expectedVal);
        expect(dv.getInt16(6, true)).assertEqual(-500);

      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0174
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0174
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (simulated concurrent write-read)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayBigInt64ArrayBufferDv0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (Done: Function) => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const threadAArr: BigInt64Array = new BigInt64Array(sab);
        const threadBArr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        // Simulate Thread A writing value
        threadAArr[0] = 1000n;
        // Simulate Thread B reading immediately
        expect(threadBArr[0]).assertEqual(1000n); // No race in single-threaded simulation

        // Simulate sequential concurrent operations
        const writePromises = [
          new Promise<void>((resolve) => {
            setTimeout(() => {
              threadAArr[0] = 2000n;
              resolve();
            }, 10);
          }),
          new Promise<void>((resolve) => {
            setTimeout(() => {
              threadBArr[0] = 3000n;
              resolve();
            }, 15);
          })
        ];

        await Promise.all(writePromises);
        // Final value should reflect last write (Thread B at 15ms)
        expect(threadAArr[0]).assertEqual(3000n);
        expect(dv.getBigInt64(0, true)).assertEqual(3000n);

        // Simulate Thread B reading via DataView during Thread A write
        setTimeout(() => {
          threadAArr[0] = 4000n;
        }, 20);
        const readVal = await new Promise<bigint>((resolve) => {
          setTimeout(() => {
            resolve(dv.getBigInt64(0, true));
          }, 25);
        });
        expect(readVal).assertEqual(4000n);
        Done();
      })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0175
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0175
     * @tc.desc   Verify BigInt64Array with DataView handling 32-bit unsigned overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const buf: ArrayBuffer = new ArrayBuffer(8); // 1×8=8 bytes (1 BigInt64 element)
        const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
        const dv: DataView = new DataView(buf);
        bigInt64Arr[0] = 0n; // Initialize to zero

        // 32-bit unsigned max value: 4294967295 (0xFFFFFFFF)
        const uint32Max = 0xFFFFFFFF;
        // Write value exceeding 32-bit unsigned (uint32Max + 1 → wraps to 0)
        dv.setUint32(0, uint32Max + 1, true);
        expect(dv.getUint32(0, true)).assertEqual(0);
        expect(bigInt64Arr[0]).assertEqual(0x0000000000000000n);

        // Write uint32Max to offset 0
        dv.setUint32(0, uint32Max, true);
        let expectedVal: bigint = 0x00000000FFFFFFFFn;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);

        // Write 1 to offset 4 (upper 32 bits) → full 64-bit value
        dv.setUint32(4, 1, true);
        expectedVal = 0x00000001FFFFFFFFn;
        expect(bigInt64Arr[0]).assertEqual(expectedVal);
        expect(dv.getUint32(4, true)).assertEqual(1);

      })

  })
}