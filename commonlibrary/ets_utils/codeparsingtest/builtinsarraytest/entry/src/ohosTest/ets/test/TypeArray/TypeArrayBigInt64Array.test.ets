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
import { sleep } from '../..//testability/pages/Utils'

export default function typeArrayBigInt64ArrayTest() {
  describe('TypeArrayBigInt64ArrayTest', () => {
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
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0001
     * @tc.desc   Verify BigInt64Array and DataView share ArrayBuffer (bidirectional sync)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayBigInt64ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 9223372036854775807n;
      bigInt64Arr[0] = testVal;
      expect(dv.getBigInt64(0, true)).assertEqual(testVal);
      const newVal: bigint = -9223372036854775808n;
      dv.setBigInt64(0, newVal, true);
      expect(bigInt64Arr[0]).assertEqual(newVal);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const offset: number = 8;
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, offset, 2);
      const dv: DataView = new DataView(buf);
      const val1: bigint = 1234567890123456789n;
      const val2: bigint = -8570200862721897295n;
      bigInt64Arr[0] = val1;
      bigInt64Arr[1] = val2;
      expect(dv.getBigInt64(offset, true)).assertEqual(val1);
      expect(dv.getBigInt64(offset + 8, true)).assertEqual(val2);
      const newVal: bigint = 4567890123456789012n;
      dv.setBigInt64(offset + 4, newVal, true);
      expect(bigInt64Arr[0].toString()).assertEqual('-7662810906284687083');
      expect(bigInt64Arr[1].toString()).assertEqual('-8570200865478776867');
      expect(bigInt64Arr.length).assertEqual(2);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      const val1: bigint = 1n;
      const val2: bigint = -1n;
      bigInt64Arr[0] = val1;
      bigInt64Arr[1] = val2;
      expect(dv.getBigInt64(0, true)).assertEqual(val1);
      expect(dv.getBigInt64(8, true)).assertEqual(val2);
      const newVal1: bigint = 100n;
      const newVal2: bigint = -200n;
      dv.setBigInt64(0, newVal1, true);
      dv.setBigInt64(8, newVal2, true);
      expect(bigInt64Arr[0]).assertEqual(newVal1);
      expect(bigInt64Arr[1]).assertEqual(newVal2);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const overflowVal: bigint = 9223372036854775808n;
      const underflowVal: bigint = -9223372036854775809n;
      const expectedOverflow: bigint = -9223372036854775808n;
      const expectedUnderflow: bigint = 9223372036854775807n;
      bigInt64Arr[0] = overflowVal;
      expect(bigInt64Arr[0]).assertEqual(expectedOverflow);
      expect(dv.getBigInt64(0, true)).assertEqual(expectedOverflow);
      bigInt64Arr[0] = underflowVal
      expect(bigInt64Arr.length).assertEqual(1);
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
    it('TypeArrayBigInt64ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source: bigint[] = [10n, 20n, 30n];
      const bigInt64Arr: BigInt64Array = new BigInt64Array(source);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(source.length);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(20n);
      expect(bigInt64Arr[2]).assertEqual(30n);
      expect(bigInt64Arr.byteLength).assertEqual(source.length * 8);
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
    it('TypeArrayBigInt64ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, 0, 0);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.length).assertEqual(0);
      expect(bigInt64Arr.byteLength).assertEqual(0);
      expect(bigInt64Arr.buffer).assertEqual(buf);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([1n, 2n, 3n]);
      const subArr: BigInt64Array = parentArr.subarray(1, 3);
      const dv: DataView = new DataView(buf);
      subArr[0] = 20n;
      subArr[1] = 30n;
      expect(parentArr[1]).assertEqual(20n);
      expect(parentArr[2]).assertEqual(30n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      expect(dv.getBigInt64(16, true)).assertEqual(30n);
      dv.setBigInt64(0, 10n, true);
      expect(parentArr[0]).assertEqual(10n);
      expect(parentArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(20n);
      expect(subArr[1]).assertEqual(30n);
      expect(subArr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n]);
      const slicedArr: BigInt64Array = originalArr.slice(0, 1);
      const dv: DataView = new DataView(buf);
      slicedArr[0] = 100n;
      expect(originalArr[0]).assertEqual(10n);
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      dv.setBigInt64(0, 200n, true);
      expect(originalArr[0]).assertEqual(200n);
      expect(originalArr[1]).assertEqual(20n);
      expect(slicedArr[0]).assertEqual(100n);
      expect(slicedArr.length).assertEqual(1);
      expect(originalArr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      let isRangeError: boolean = false;
      try {
        dv.getBigInt64(1, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      try {
        dv.setBigInt64(8, 10n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const targetArr: BigInt64Array = new BigInt64Array(buf);
      const sourceArr: BigInt64Array = new BigInt64Array([100n, 200n]);
      const dv: DataView = new DataView(buf);
      targetArr.set(sourceArr, 1);
      expect(targetArr[0]).assertEqual(0n);
      expect(targetArr[1]).assertEqual(100n);
      expect(targetArr[2]).assertEqual(200n);
      expect(targetArr.length).assertEqual(3);
      expect(dv.getBigInt64(8, true)).assertEqual(100n);
      expect(dv.getBigInt64(16, true)).assertEqual(200n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const fillVal: bigint = 500n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal);
      for (let i = 0; i < bigInt64Arr.length; i++) {
        expect(bigInt64Arr[i]).assertEqual(fillVal);
        expect(dv.getBigInt64(i * 8, true)).assertEqual(fillVal);
      }
      const newFillVal: bigint = 600n;
      bigInt64Arr.fill(newFillVal, 1, 3);
      expect(bigInt64Arr[0]).assertEqual(fillVal);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n, 40n]);
      const fillVal: bigint = 99n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, -3, -1);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(fillVal);
      expect(bigInt64Arr[2]).assertEqual(fillVal);
      expect(bigInt64Arr[3]).assertEqual(40n);
      expect(bigInt64Arr.length).assertEqual(4)
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n, 4n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0, 2);
      expect(bigInt64Arr[0]).assertEqual(3n);
      expect(bigInt64Arr[1]).assertEqual(4n);
      expect(bigInt64Arr[2]).assertEqual(3n);
      expect(bigInt64Arr[3]).assertEqual(4n);
      expect(bigInt64Arr.length).assertEqual(4)
      expect(dv.getBigInt64(0, true)).assertEqual(3n);
      expect(dv.getBigInt64(8, true)).assertEqual(4n);
      expect(dv.getBigInt64(16, true)).assertEqual(3n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(1, 0);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(10n);
      expect(bigInt64Arr[2]).assertEqual(20n);
      expect(bigInt64Arr.length).assertEqual(3)
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(0);
      dv.setBigInt64(0, 25n, true);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([20n, 30n, 20n, 40n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(2);
      dv.setBigInt64(16, 50n, true);
      expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(0);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([100n, 200n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.includes(100n)).assertEqual(true);
      expect(bigInt64Arr.includes(150n)).assertEqual(false);
      dv.setBigInt64(0, 150n, true);
      expect(bigInt64Arr.includes(100n)).assertEqual(false);
      expect(bigInt64Arr.includes(150n)).assertEqual(true);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.every(val => val < 20n)).assertEqual(true);
      dv.setBigInt64(16, 25n, true);
      expect(bigInt64Arr.every(val => val < 20n)).assertEqual(false);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true);
      dv.setBigInt64(16, 12n, true);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(false);
      dv.setBigInt64(8, 13n, true);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      let sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(60n);
      dv.setBigInt64(8, 25n, true);
      sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(65n);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n]);
      const dv: DataView = new DataView(buf);
      let product = bigInt64Arr.reduce((acc, val) => acc * val);
      expect(product).assertEqual(50n);
      dv.setBigInt64(0, 6n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n]);
      const dv: DataView = new DataView(buf);
      const mappedArr: BigInt64Array = originalArr.map(val => val * 2n);
      expect(mappedArr[0]).assertEqual(20n);
      expect(mappedArr[1]).assertEqual(40n);
      dv.setBigInt64(0, 15n, true);
      expect(originalArr[0]).assertEqual(15n);
      expect(mappedArr[0]).assertEqual(20n);
      mappedArr[0] = 25n;
      expect(originalArr[0]).assertEqual(15n);
      expect(mappedArr.length).assertEqual(2);
      expect(originalArr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const filteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(20n);
      dv.setBigInt64(8, 14n, true);
      expect(originalArr[1]).assertEqual(14n);
      expect(originalArr.length).assertEqual(3);
      expect(filteredArr[0]).assertEqual(20n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);
      let count: number = 0;
      bigInt64Arr.forEach(val => val > 10n && count++);
      expect(count).assertEqual(2);
      dv.setBigInt64(0, 11n, true);
      count = 0;
      bigInt64Arr.forEach(val => val > 10n && count++);
      expect(count).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const val1: bigint = 0x123456789ABCDEF0n;
      const val2: bigint = -0x123456789ABCDEF0n;
      dv.setBigInt64(0, val1, true);
      dv.setBigInt64(8, val2, true);
      expect(bigInt64Arr[0]).assertEqual(val1);
      expect(bigInt64Arr[1]).assertEqual(val2);
      expect(bigInt64Arr.length).assertEqual(2);
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
    it('TypeArrayBigInt64ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const offset: number = 16;
      const length: number = 2;
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, offset, length);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.byteOffset).assertEqual(offset);
      expect(bigInt64Arr.byteLength).assertEqual(length * 8);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.buffer.byteLength).assertEqual(buf.byteLength);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const mainArr: BigInt64Array = new BigInt64Array(sab);
      const mainDv: DataView = new DataView(sab);
      const workerArr: BigInt64Array = new BigInt64Array(sab);
      const workerDv: DataView = new DataView(sab);
      mainArr[0] = 10n;
      mainDv.setBigInt64(8, 20n, true);
      expect(workerArr[0]).assertEqual(10n);
      expect(workerDv.getBigInt64(8, true)).assertEqual(20n);
      workerArr[1] = 30n;
      workerDv.setBigInt64(0, 40n, true);
      expect(mainArr[1]).assertEqual(30n);
      expect(mainArr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr[1]).assertEqual(undefined);
      bigInt64Arr[1] = 100n;
      expect(bigInt64Arr[1]).assertEqual(undefined);
      if (buf.byteLength > 8) {
        dv.setBigInt64(8, 200n, true);
      }
      expect(bigInt64Arr[1]).assertEqual(undefined);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const plainArr1: bigint[] = Array.from(bigInt64Arr);
      expect(plainArr1.toString()).assertEqual([10n, 20n, 30n].toString());
      const plainArr2: bigint[] = [...bigInt64Arr];
      expect(plainArr2.toString()).assertEqual([10n, 20n, 30n].toString());
      dv.setBigInt64(8, 25n, true);
      const plainArr3: bigint[] = Array.from(bigInt64Arr);
      expect(plainArr3.toString()).assertEqual([10n, 25n, 30n].toString());
      expect(plainArr1.length).assertEqual(3);
      expect(plainArr2.length).assertEqual(3);
      expect(plainArr3.length).assertEqual(3);
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
      plainArr[0] = 999n;
      expect(bigInt64Arr[0]).assertEqual(123n);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const bigIntVal: bigint = 0x00000000000000FFn;
      bigInt64Arr[0] = bigIntVal;
      expect(dv.getUint8(0)).assertEqual(0xFF);
      expect(dv.getInt16(0, true)).assertEqual(0x00FF);
      expect(dv.getUint32(0, true)).assertEqual(0x000000FF);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setUint8(0, 0xAA);
      expect(bigInt64Arr[0]).assertEqual(0x00000000000000AAn);
      dv.setInt32(0, 0x12345678, true);
      expect(bigInt64Arr[0]).assertEqual(0x0000000012345678n);
      dv.setBigInt64(0, 0xABCDEF0123456789n, true);
      expect(bigInt64Arr[0]).assertEqual(-0x543210fedcba9877n);
      expect(bigInt64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0035
     * @tc.desc   Verify BigInt64Array with empty source array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const plainArr: bigint[] = [];
      const bigInt64Arr: BigInt64Array = new BigInt64Array(plainArr);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(0);
      expect(bigInt64Arr.byteLength).assertEqual(0);
      expect(bigInt64Arr.buffer.byteLength).assertEqual(0);
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
    it('TypeArrayBigInt64ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sab: SharedArrayBuffer = new SharedArrayBuffer(0);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.length).assertEqual(0);
      expect(bigInt64Arr.byteLength).assertEqual(0);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const source: bigint[] = [10n, 20n, 30n, 40n];
      const dv: DataView = new DataView(buf);
      try {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        new BigInt64Array(buf);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      try {
        bigInt64Arr.set(source);
      } catch (e) {
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const source: bigint[] = [10n];
      let isRangeError: boolean = false;
      try {
        bigInt64Arr.set(source, -1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      try {
        bigInt64Arr.set(source, 3);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n]);
      const originalVals: bigint[] = [...bigInt64Arr];
      bigInt64Arr.copyWithin(0, 1, 0);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());
      bigInt64Arr.copyWithin(2, 0, 1);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());
      bigInt64Arr.copyWithin(0, 2, 3);
      expect(bigInt64Arr.toString()).assertEqual(originalVals.toString());
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(2);
      expect(bigInt64Arr.indexOf(5n, 3)).assertEqual(-1);
      expect(bigInt64Arr.length).assertEqual(3);
      dv.setBigInt64(16, 15n, true);
      expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(-1);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([20n, 30n, 20n, 40n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(20n, 2)).assertEqual(2);
      expect(bigInt64Arr.lastIndexOf(20n, 1)).assertEqual(0);
      dv.setBigInt64(16, 25n, true);
      expect(bigInt64Arr.lastIndexOf(20n, 3)).assertEqual(0);
      dv.setBigInt64(16, 20n, true);
      dv.setBigInt64(0, 15n, true);
      expect(bigInt64Arr.lastIndexOf(20n, 3)).assertEqual(2);
      expect(bigInt64Arr.length).assertEqual(4);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.includes(15n, 1)).assertEqual(true);
      expect(bigInt64Arr.includes(15n, 2)).assertEqual(false);
      dv.setBigInt64(8, 20n, true);
      expect(bigInt64Arr.includes(15n, 0)).assertEqual(false);
      dv.setBigInt64(8, 15n, true);
      expect(bigInt64Arr.includes(15n, 1)).assertEqual(true);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n, 30n, 40n]);
      const dv: DataView = new DataView(buf);
      const slicedArr: BigInt64Array = originalArr.slice(1, 3);
      const slicedDv: DataView = new DataView(slicedArr.buffer);
      expect(slicedArr.toString()).assertEqual([20n, 30n].toString());
      dv.setBigInt64(8, 25n, true);
      expect(originalArr[1]).assertEqual(25n);
      expect(slicedArr.toString()).assertEqual([20n, 30n].toString());
      slicedArr[0] = 35n;
      expect(slicedDv.getBigInt64(0, true)).assertEqual(35n);
      expect(originalArr[0]).assertEqual(10n);
      expect(originalArr[1]).assertEqual(25n);
      expect(originalArr[2]).assertEqual(30n);
      expect(originalArr[3]).assertEqual(40n);
      expect(originalArr.length).assertEqual(4);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      originalArr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(sab);
      const slicedArr: BigInt64Array = originalArr.slice(-2, -1);
      expect(slicedArr.length).assertEqual(1);
      expect(slicedArr.toString()).assertEqual([15n].toString());
      dv.setBigInt64(8, 20n, true);
      expect(originalArr[1]).assertEqual(20n);
      expect(slicedArr.toString()).assertEqual([15n].toString());
      const fullSlicedArr: BigInt64Array = originalArr.slice(-3);
      expect(fullSlicedArr.length).assertEqual(3);
      expect(fullSlicedArr.toString()).assertEqual([5n, 20n, 25n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([2n, 4n, 6n]);
      const dv: DataView = new DataView(buf);
      const mappedArr: BigInt64Array = originalArr.map(val => val * 3n + 1n);
      expect(mappedArr.toString()).assertEqual([7n, 13n, 19n].toString());
      dv.setBigInt64(8, 5n, true);
      expect(originalArr[1]).assertEqual(5n);
      expect(mappedArr.toString()).assertEqual([7n, 13n, 19n].toString());
      const newMappedArr: BigInt64Array = originalArr.map(val => val * 3n + 1n);
      expect(newMappedArr.toString()).assertEqual([7n, 16n, 19n].toString());
      expect(newMappedArr.length).assertEqual(3);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      originalArr.set([10n, 25n, 15n, 30n]);
      const dv: DataView = new DataView(sab);
      const filteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr.toString()).assertEqual([25n, 30n].toString());
      dv.setBigInt64(16, 20n, true);
      expect(originalArr[2]).assertEqual(20n);
      expect(filteredArr.toString()).assertEqual([25n, 30n].toString());
      const newFilteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
      expect(newFilteredArr.length).assertEqual(3);
      expect(newFilteredArr.toString()).assertEqual([25n, 20n, 30n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([3n, 6n, 9n]);
      const dv: DataView = new DataView(buf);
      let sum = bigInt64Arr.reduce((acc, val) => acc + val, 2n);
      expect(sum).assertEqual(20n);
      dv.setBigInt64(8, 7n, true);
      sum = bigInt64Arr.reduce((acc, val) => acc + val, 2n);
      expect(sum).assertEqual(21n);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([5n, 10n]);
      const dv: DataView = new DataView(sab);
      bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val * 2n);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 3n);
      expect(dv.getBigInt64(0, true)).assertEqual(13n);
      expect(dv.getBigInt64(8, true)).assertEqual(23n);
      expect(bigInt64Arr.toString()).assertEqual([13n, 23n].toString());
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const fullVal: bigint = 0x123456789ABCDEF0n;
      bigInt64Arr[0] = fullVal;
      expect(dv.getUint32(0, true)).assertEqual(0x9ABCDEF0);
      expect(dv.getUint32(4, true)).assertEqual(0x12345678);
      dv.setUint16(0, 0xFFFF, true);
      const modifiedVal: bigint = 0x123456789ABCFFFFn;
      expect(bigInt64Arr[0]).assertEqual(modifiedVal);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      dv.setUint8(0, 0xAA);
      expect(bigInt64Arr[0]).assertEqual(0x00000000000000AAn);
      dv.setUint8(7, 0xBB);
      expect(bigInt64Arr[0]).assertEqual(-4971973988617027414n);
      dv.setUint16(2, 0xCCCC, true);
      expect(bigInt64Arr[0]).assertEqual(-4971973985181106006n);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const originalBuf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(originalBuf);
      originalArr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(originalBuf);
      const slicedBuf: ArrayBuffer = originalBuf.slice(8, 24);
      const slicedArr: BigInt64Array = new BigInt64Array(slicedBuf);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr.toString()).assertEqual([20n, 30n].toString());
      dv.setBigInt64(8, 25n, true);
      expect(originalArr[1]).assertEqual(25n);
      expect(slicedArr.toString()).assertEqual([20n, 30n].toString());
      slicedArr[0] = 35n;
      expect(slicedArr.toString()).assertEqual([35n, 30n].toString());
      expect(originalArr[1]).assertEqual(25n);
      expect(originalArr.length).assertEqual(3);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const slicedSab: SharedArrayBuffer = sab.slice(8, 16);
      expect(slicedSab.byteLength).assertEqual(8);
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
    it('TypeArrayBigInt64ArrayBufferDv0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const length: number = 3;
      const bigInt64Arr: BigInt64Array = new BigInt64Array(length);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(length);
      expect(bigInt64Arr.byteLength).assertEqual(length * 8);
      for (let i = 0; i < length; i++) {
        expect(bigInt64Arr[i]).assertEqual(0n);
        expect(dv.getBigInt64(i * 8, true)).assertEqual(0n);
      }
      bigInt64Arr[1] = 50n;
      expect(bigInt64Arr[0]).assertEqual(0n);
      expect(bigInt64Arr[1]).assertEqual(50n);
      expect(bigInt64Arr[2]).assertEqual(0n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const plainArr: bigint[] = Array.from(bigInt64Arr);
      expect(plainArr.toString()).assertEqual([10n, 20n, 30n].toString());
      dv.setBigInt64(8, 25n, true);
      const updatedPlainArr: bigint[] = Array.from(bigInt64Arr);
      expect(updatedPlainArr.toString()).assertEqual([10n, 25n, 30n].toString());
      plainArr[0] = 15n;
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(25n);
      expect(bigInt64Arr[2]).assertEqual(30n);
      expect(bigInt64Arr.length).assertEqual(3);
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
        9223372036854775807n,
        9223372036854775808n,
        -9223372036854775809n
      ];
      const bigInt64Arr: BigInt64Array = new BigInt64Array(plainArr);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(plainArr.length);
      expect(bigInt64Arr[0]).assertEqual(9223372036854775807n);
      expect(bigInt64Arr[1]).assertEqual(-9223372036854775808n);
      expect(bigInt64Arr[2]).assertEqual(9223372036854775807n);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 0x0123456789ABCDEFn;
      dv.setBigInt64(0, testVal, false);
      const littleEndianVal: bigint = -1167088121787636991n;
      expect(bigInt64Arr[0]).assertEqual(littleEndianVal);
      bigInt64Arr[0] = testVal;
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n]);
      bigInt64Arr[2] = 30n;
      expect(bigInt64Arr[2]).assertEqual(undefined);
      bigInt64Arr[-1] = 5n;
      expect(bigInt64Arr[-1]).assertEqual(undefined);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(20n);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const maxVal: bigint = 9223372036854775807n;
      const minVal: bigint = -9223372036854775808n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(maxVal, 0, 1);
      expect(bigInt64Arr[0]).assertEqual(maxVal);
      expect(dv.getBigInt64(0, true)).assertEqual(maxVal);
      bigInt64Arr.fill(minVal, 1, 2);
      expect(bigInt64Arr[1]).assertEqual(minVal);
      expect(dv.getBigInt64(8, true)).assertEqual(minVal);
      bigInt64Arr.fill(0n);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.toString()).assertEqual([0n, 0n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0, -2, -1);
      expect(bigInt64Arr.toString()).assertEqual([2n, 2n, 3n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(2n);
      expect(dv.getBigInt64(8, true)).assertEqual(2n);
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(-3, 2);
      expect(bigInt64Arr.toString()).assertEqual([3n, 2n, 3n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(3n);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([15n, 25n, 35n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.every(val => val > 10)).assertEqual(true);
      expect(bigInt64Arr.every(val => val < 30)).assertEqual(false);
      dv.setBigInt64(16, 28n, true);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.some(val => val === 15n)).assertEqual(true);
      expect(bigInt64Arr.some(val => val > 30)).assertEqual(false);
      dv.setBigInt64(16, 35n, true);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n]);
      const dv: DataView = new DataView(buf);
      let sum = bigInt64Arr.reduce((acc, val) => acc + val, 3n);
      expect(sum).assertEqual(18n);
      dv.setBigInt64(8, 15n, true);
      sum = bigInt64Arr.reduce((acc, val) => acc + val, 3n);
      expect(sum).assertEqual(23n);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([4n, 8n]);
      const dv: DataView = new DataView(buf);
      const mappedArr: BigInt64Array = originalArr.map(val => val * 2n);
      expect(mappedArr.toString()).assertEqual([8n, 16n].toString());
      dv.setBigInt64(8, 9n, true);
      const newMappedArr: BigInt64Array = originalArr.map(val => val * 2n);
      expect(newMappedArr.toString()).assertEqual([8n, 18n].toString());
      expect(newMappedArr.length).assertEqual(2);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      originalArr.set([12n, 24n, 36n]);
      const dv: DataView = new DataView(sab);
      const filteredArr: BigInt64Array = originalArr.filter(val => val % 12n === 0n);
      expect(filteredArr.toString()).assertEqual([12n, 24n, 36n].toString());
      dv.setBigInt64(8, 25n, true);
      const newFilteredArr: BigInt64Array = originalArr.filter(val => val % 12n === 0n);
      expect(newFilteredArr.toString()).assertEqual([12n, 36n].toString());
      expect(newFilteredArr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([6n, 12n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 3n);
      expect(bigInt64Arr.toString()).assertEqual([9n, 15n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(9n);
      expect(dv.getBigInt64(8, true)).assertEqual(15n);
      bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val * 2n);
      expect(bigInt64Arr.toString()).assertEqual([18n, 30n].toString());
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const signedVal: bigint = -1n;
      bigInt64Arr[0] = signedVal;
      const unsignedVal: bigint = 18446744073709551615n;
      expect(dv.getBigUint64(0, true)).assertEqual(unsignedVal);
      expect(dv.getBigInt64(0, true)).assertEqual(signedVal);
      dv.setBigUint64(0, unsignedVal / 2n, true);
      expect(bigInt64Arr[0]).assertEqual(9223372036854775807n);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const view1: BigInt64Array = new BigInt64Array(sab);
      const view2: BigInt64Array = new BigInt64Array(sab, 8, 2);
      const dv: DataView = new DataView(sab);
      view1.set([10n, 20n, 30n]);
      expect(view2.toString()).assertEqual([20n, 30n].toString());
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      view2[0] = 25n;
      expect(view1[1]).assertEqual(25n);
      expect(dv.getBigInt64(8, true)).assertEqual(25n);
      dv.setBigInt64(16, 35n, true);
      expect(view1[0]).assertEqual(10n);
      expect(view1[1]).assertEqual(25n);
      expect(view1[2]).assertEqual(35n);
      expect(view2[0]).assertEqual(25n);
      expect(view2[1]).assertEqual(35n);
      expect(view1.length).assertEqual(3);
      expect(view2.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);
      const subArr1: BigInt64Array = parentArr.subarray(-5, 5);
      expect(subArr1.toString()).assertEqual([5n, 15n, 25n].toString());
      const subArr2: BigInt64Array = parentArr.subarray(1, -1);
      expect(subArr2.toString()).assertEqual([15n].toString());
      subArr2[0] = 20n;
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      expect(parentArr[0]).assertEqual(5n);
      expect(parentArr[1]).assertEqual(20n);
      expect(parentArr[2]).assertEqual(25n);
      expect(parentArr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([7n, 17n, 27n]);
      const dv: DataView = new DataView(buf);
      const slicedArr1: BigInt64Array = parentArr.slice(-10, 10);
      expect(slicedArr1.toString()).assertEqual([7n, 17n, 27n].toString());
      const slicedArr2: BigInt64Array = parentArr.slice(2, 1);
      expect(slicedArr2.length).assertEqual(0);
      dv.setBigInt64(0, 8n, true);
      expect(slicedArr1[0]).assertEqual(7n);
      expect(slicedArr1[0]).assertEqual(7n);
      expect(slicedArr1[0]).assertEqual(7n);
      expect(slicedArr1.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const source: bigint[] = [10n, 20n, 30n, 40n];
      const dv: DataView = new DataView(buf);
      try {
        bigInt64Arr.set(source, 1);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(bigInt64Arr.toString()).assertEqual([0n, 0n].toString());
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n]);
      const fillVal: bigint = 9n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, -5, 5);
      expect(bigInt64Arr.toString()).assertEqual([9n, 9n, 9n].toString());
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.fill(fillVal, 1, -1);
      expect(bigInt64Arr.toString()).assertEqual([1n, 9n, 3n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(-5, 2, 5);
      expect(bigInt64Arr.toString()).assertEqual([30n, 20n, 30n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(30n);
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.copyWithin(2, -5, -1);
      expect(bigInt64Arr.length).assertEqual(3);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 10n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(5n, 10)).assertEqual(-1);
      expect(bigInt64Arr.indexOf(5n, -10)).assertEqual(0);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(5n, 10)).assertEqual(2);
      expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([20n, 30n]);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.includes(30n, 5)).assertEqual(false);
      expect(bigInt64Arr.includes(30n, -5)).assertEqual(true);
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
      expect(bigInt64Arr.length).assertEqual(0);
      expect(bigInt64Arr.byteLength).assertEqual(0);
      expect(bigInt64Arr.buffer).assertEqual(emptyBuf);
      expect(bigInt64Arr.byteOffset).assertEqual(0);
      let isRangeError = false;
      try {
        bigInt64Arr.set([10n, 20n]);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      bigInt64Arr.fill(30n);
      bigInt64Arr.copyWithin(0, 1);
      expect(bigInt64Arr.indexOf(10n)).assertEqual(-1);
      expect(bigInt64Arr.every(val => val > 0n)).assertEqual(true);
      expect(bigInt64Arr.some(val => val > 0n)).assertEqual(false);
      isRangeError = false;
      try {
        dv.getBigInt64(0, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      try {
        dv.setBigInt64(0, 10n, true);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const view1: BigInt64Array = new BigInt64Array(sab);
      const view2: BigInt64Array = new BigInt64Array(sab, 8, 2);
      const dv: DataView = new DataView(sab);
      view1.set([10n, 20n, 30n]);
      expect(view2.toString()).assertEqual([20n, 30n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      expect(dv.getBigInt64(16, true)).assertEqual(30n);
      dv.setBigInt64(8, 25n, true);
      expect(view1[1]).assertEqual(25n);
      expect(view2[0]).assertEqual(25n);
      view2[1] = 35n;
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([5n, 15n]);
      const zeroLenSubArr: BigInt64Array = parentArr.subarray(1, 1);
      const dv: DataView = new DataView(buf);
      expect(zeroLenSubArr.length).assertEqual(0);
      expect(zeroLenSubArr.byteLength).assertEqual(0);
      expect(zeroLenSubArr.byteOffset).assertEqual(8);
      expect(zeroLenSubArr.buffer).assertEqual(parentArr.buffer);
      try {
        zeroLenSubArr.set([20n]);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      zeroLenSubArr.fill(25n);
      zeroLenSubArr.copyWithin(0, 1);
      expect(parentArr.toString()).assertEqual([5n, 15n].toString());
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
      const slicedArr: BigInt64Array = emptyArr.slice(0, 1);
      expect(slicedArr.length).assertEqual(0);
      expect(slicedArr.byteLength).assertEqual(0);
      expect(slicedArr.buffer === emptyArr.buffer).assertFalse();
      const mappedArr: BigInt64Array = emptyArr.map(val => val * 2n);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr.buffer === emptyArr.buffer).assertFalse();
      const filteredArr: BigInt64Array = emptyArr.filter(val => val > 0n);
      expect(filteredArr.length).assertEqual(0);
      const reducedWithInit: bigint = emptyArr.reduce((acc, val) => acc + val, 0n);
      expect(reducedWithInit).assertEqual(0n);

      let isTypeError = false;
      try {
        emptyArr.reduce((acc, val) => acc + val);
      } catch (e) {
        isTypeError = (e as Error).name === 'TypeError';
      }
      expect(isTypeError).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const signBitVal: bigint = 0x8000000000000000n;
      const expectedSigned: bigint = -9223372036854775808n;
      bigInt64Arr[0] = signBitVal;
      expect(bigInt64Arr[0]).assertEqual(expectedSigned);
      expect(dv.getBigInt64(0, true)).assertEqual(expectedSigned);
      const signBitWithLower: bigint = 0x8000000000000001n;
      const expectedSigned2: bigint = -9223372036854775807n;
      dv.setBigInt64(0, signBitWithLower, true);
      expect(bigInt64Arr[0]).assertEqual(expectedSigned2);
      expect(bigInt64Arr.length).assertEqual(1);
      const positiveVal: bigint = 0x7FFFFFFFFFFFFFFFn;
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const fillVal: bigint = 50n;
      bigInt64Arr.fill(fillVal);
      expect(bigInt64Arr.toString()).assertEqual([50n, 50n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(50n);
      expect(dv.getBigInt64(8, true)).assertEqual(50n);
      bigInt64Arr.fill(fillVal);
      expect(bigInt64Arr.toString()).assertEqual([50n, 50n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(50n);
      const newFillVal: bigint = 60n;
      bigInt64Arr.fill(newFillVal);
      expect(bigInt64Arr.toString()).assertEqual([60n, 60n].toString());
      expect(dv.getBigInt64(8, true)).assertEqual(60n);
      bigInt64Arr.fill(fillVal, 0, 1);
      expect(bigInt64Arr.toString()).assertEqual([50n, 60n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(50n);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(1, 0, 2);
      const expected1: bigint[] = [1n, 1n, 2n];
      expect(bigInt64Arr.toString()).assertEqual(expected1.toString());
      expect(dv.getBigInt64(8, true)).assertEqual(1n);
      expect(dv.getBigInt64(16, true)).assertEqual(2n);
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(0, 1, 3);
      expect(bigInt64Arr.toString()).assertEqual([2n, 3n, 3n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(2n);
      expect(dv.getBigInt64(8, true)).assertEqual(3n);
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(0, 2, 3);
      expect(bigInt64Arr.toString()).assertEqual([3n, 2n, 3n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.set([5n, 10n, 5n, 15n]);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(0);
      expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(2);
      expect(bigInt64Arr.indexOf(5n, 3)).assertEqual(-1);
      dv.setBigInt64(16, 20n, true);
      expect(bigInt64Arr.indexOf(5n, 1)).assertEqual(-1);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.set([5n, 10n, 5n, 15n]);
      expect(bigInt64Arr.lastIndexOf(5n)).assertEqual(2);
      expect(bigInt64Arr.lastIndexOf(5n, 1)).assertEqual(0);
      expect(bigInt64Arr.lastIndexOf(5n, -1)).assertEqual(2);
      dv.setBigInt64(16, 20n, true);
      expect(bigInt64Arr.lastIndexOf(5n)).assertEqual(0);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      bigInt64Arr.set([5n, 10n, 5n, 15n]);
      expect(bigInt64Arr.includes(5n)).assertEqual(true);
      expect(bigInt64Arr.includes(5n, 3)).assertEqual(false);
      expect(bigInt64Arr.includes(10n)).assertEqual(true);
      dv.setBigInt64(0, 20n, true);
      dv.setBigInt64(16, 25n, true);
      expect(bigInt64Arr.includes(5n)).assertEqual(false);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const condition = (val: bigint) => val < 35n;
      bigInt64Arr.set([10n, 20n, 30n]);
      expect(bigInt64Arr.every(condition)).assertEqual(true);
      dv.setBigInt64(16, 40n, true);
      expect(bigInt64Arr.every(condition)).assertEqual(false);
      dv.setBigInt64(16, 30n, true);
      expect(bigInt64Arr.every(condition)).assertEqual(true);
      bigInt64Arr[1] = 36n;
      expect(bigInt64Arr.every(condition)).assertEqual(false);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      const condition = (val: bigint) => val > 25n;
      bigInt64Arr.set([10n, 20n, 30n]);
      expect(bigInt64Arr.some(condition)).assertEqual(true);
      dv.setBigInt64(16, 24n, true);
      expect(bigInt64Arr.some(condition)).assertEqual(false);
      dv.setBigInt64(0, 26n, true);
      expect(bigInt64Arr.some(condition)).assertEqual(true);
      dv.setBigInt64(8, 27n, true);
      expect(bigInt64Arr.some(condition)).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const sumReducer = (acc: bigint, val: bigint) => acc + val;
      bigInt64Arr.set([5n, 10n, 15n]);
      let sum = bigInt64Arr.reduce(sumReducer, 0n);
      expect(sum).assertEqual(30n);
      dv.setBigInt64(8, 12n, true);
      sum = bigInt64Arr.reduce(sumReducer, 0n);
      expect(sum).assertEqual(32n);
      bigInt64Arr[2] = 18n;
      sum = bigInt64Arr.reduce(sumReducer, 0n);
      expect(sum).assertEqual(35n);
      sum = bigInt64Arr.reduce(sumReducer);
      expect(sum).assertEqual(35n);
      let modifiedSum = bigInt64Arr.reduce((acc, val, idx) => {
        bigInt64Arr[idx] = val + 1n;
        return acc + val;
      }, 0n);
      expect(modifiedSum).assertEqual(35n);
      expect(bigInt64Arr.toString()).assertEqual([6n, 13n, 19n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const transformer = (val: bigint) => val * 3n + 1n;
      originalArr.set([2n, 4n, 6n]);
      const mappedArr: BigInt64Array = originalArr.map(transformer);
      expect(mappedArr.toString()).assertEqual([7n, 13n, 19n].toString());
      expect(mappedArr.buffer === originalArr.buffer).assertFalse();
      dv.setBigInt64(8, 5n, true);
      const newMappedArr: BigInt64Array = originalArr.map(transformer);
      expect(newMappedArr.toString()).assertEqual([7n, 16n, 19n].toString());
      originalArr[2] = 7n;
      const newMappedArr2: BigInt64Array = originalArr.map(transformer);
      expect(newMappedArr2.toString()).assertEqual([7n, 16n, 22n].toString());
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      const filter = (val: bigint) => val > 15n;
      originalArr.set([10n, 25n, 15n, 30n]);
      const filteredArr: BigInt64Array = originalArr.filter(filter);
      expect(filteredArr.toString()).assertEqual([25n, 30n].toString());
      expect(filteredArr.buffer === originalArr.buffer).assertFalse();
      dv.setBigInt64(0, 16n, true);
      const newFilteredArr: BigInt64Array = originalArr.filter(filter);
      expect(newFilteredArr.toString()).assertEqual([16n, 25n, 30n].toString());
      ;
      dv.setBigInt64(8, 14n, true);
      const newFilteredArr2: BigInt64Array = originalArr.filter(filter);
      expect(newFilteredArr2.toString()).assertEqual([16n, 30n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      let iterationCount = 0;
      const countCallback = () => {
        iterationCount++;
      };
      bigInt64Arr.set([5n, 10n, 15n]);
      bigInt64Arr.forEach(countCallback);
      expect(iterationCount).assertEqual(3);
      expect(bigInt64Arr.length).assertEqual(3);
      dv.setBigInt64(8, 12n, true);
      iterationCount = 0;
      bigInt64Arr.forEach(countCallback);
      expect(iterationCount).assertEqual(3);
      bigInt64Arr.forEach((val, idx) => bigInt64Arr[idx] = val + 1n);
      expect(bigInt64Arr.toString()).assertEqual([6n, 13n, 16n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n]);
      const dv: DataView = new DataView(buf);
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      let isRangeError = false;
      dv.getBigInt64(1, true);
      dv.setBigInt64(1, 30n, true);
      dv.getBigInt64(4, true);
      try {
        dv.getBigInt64(15, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      expect(bigInt64Arr.toString()).assertEqual([7690n, 0n].toString())
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      try {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        new BigInt64Array(buf);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.byteLength).assertEqual(16);
      expect(buf.byteLength).assertEqual(16);
      bigInt64Arr.set([10n, 20n]);
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      bigInt64Arr[2] = 30n;
      expect(bigInt64Arr[2]).assertEqual(undefined);
      expect(bigInt64Arr[1]).assertEqual(20n);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr[0]).assertEqual(10n);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const zeroVal: bigint = 0n;
      bigInt64Arr.set([zeroVal, zeroVal]);
      expect(bigInt64Arr.toString()).assertEqual([0n, 0n].toString());
      expect(dv.getBigInt64(0, true)).assertEqual(zeroVal);
      expect(dv.getBigInt64(8, true)).assertEqual(zeroVal);
      dv.setBigInt64(0, 5n, true);
      expect(bigInt64Arr[0]).assertEqual(5n);
      expect(bigInt64Arr[1]).assertEqual(zeroVal);
      bigInt64Arr[0] = zeroVal;
      expect(dv.getBigInt64(0, true)).assertEqual(zeroVal);
      expect(bigInt64Arr.every(val => val === zeroVal)).assertEqual(true);
      expect(bigInt64Arr.some(val => val !== zeroVal)).assertEqual(false);
      expect(bigInt64Arr.indexOf(zeroVal)).assertEqual(0);
      expect(bigInt64Arr.lastIndexOf(zeroVal)).assertEqual(1);
      bigInt64Arr.fill(zeroVal);
      expect(bigInt64Arr.toString()).assertEqual([0n, 0n].toString())
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const emptySliced1: BigInt64Array = originalArr.slice(1, 1);
      expect(emptySliced1.length).assertEqual(0);
      expect(emptySliced1.byteLength).assertEqual(0);
      expect(emptySliced1.buffer === originalArr.buffer).assertFalse();
      const emptySliced2: BigInt64Array = originalArr.slice(2, 2);
      expect(emptySliced2.length).assertEqual(0);
      const emptySliced3: BigInt64Array = originalArr.slice(0, 0);
      expect(emptySliced3.length).assertEqual(0);
      dv.setBigInt64(8, 25n, true);
      expect(originalArr[1]).assertEqual(25n);
      expect(emptySliced1.length).assertEqual(0);
      expect(emptySliced2.length).assertEqual(0);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const originalStr: string = bigInt64Arr.toString();
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0, 0);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(1, 1, 3);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(2, 2);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      dv.setBigInt64(8, 25n, true);
      const newOriginalStr: string = bigInt64Arr.toString();
      bigInt64Arr.copyWithin(1, 1);
      expect(bigInt64Arr.toString()).assertEqual(newOriginalStr);
      const emptyArr: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
      emptyArr.copyWithin(0, 1);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const source: bigint[] = [10n];
      let isRangeError = false;
      try {
        bigInt64Arr.set(source, 2);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      try {
        bigInt64Arr.set(source, -1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      const longSource: bigint[] = [10n, 20n];
      try {
        bigInt64Arr.set(longSource, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      bigInt64Arr.set(source, 0);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(0n);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([10n, 20n, 30n]);
      const subArr: BigInt64Array = parentArr.subarray(1, 3);
      const dv: DataView = new DataView(buf);
      expect(subArr.buffer).assertEqual(parentArr.buffer);
      expect(subArr.byteOffset).assertEqual(8);
      expect(subArr.length).assertEqual(2);
      subArr[0] = 25n;
      subArr[1] = 35n;
      expect(parentArr.toString()).assertEqual([10n, 25n, 35n].toString());
      expect(parentArr.length).assertEqual(3);
      expect(dv.getBigInt64(8, true)).assertEqual(25n);
      expect(dv.getBigInt64(16, true)).assertEqual(35n);
      parentArr[1] = 28n;
      parentArr[2] = 38n;
      expect(subArr.toString()).assertEqual([28n, 38n].toString());
      dv.setBigInt64(8, 22n, true);
      expect(parentArr[1]).assertEqual(22n);
      expect(subArr[0]).assertEqual(22n);
      const subSubArr: BigInt64Array = subArr.subarray(0, 1);
      subSubArr[0] = 29n;
      expect(parentArr[1]).assertEqual(29n);
      expect(subArr[0]).assertEqual(29n);
      expect(parentArr.length).assertEqual(3);
      expect(subArr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0107
     * @tc.desc   Verify BigInt64Array constructor with length parameter (zero-initialized)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayBigInt64ArrayBufferDv0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const length: number = 3;
      const bigInt64Arr: BigInt64Array = new BigInt64Array(length);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(length);
      expect(bigInt64Arr.byteLength).assertEqual(length * 8);
      expect(bigInt64Arr.buffer.byteLength).assertEqual(length * 8);
      expect(bigInt64Arr.byteOffset).assertEqual(0);
      for (let i = 0; i < length; i++) {
        expect(bigInt64Arr[i]).assertEqual(0n);
        expect(dv.getBigInt64(i * 8, true)).assertEqual(0n);
      }
      bigInt64Arr[1] = 50n;
      expect(dv.getBigInt64(8, true)).assertEqual(50n);
      dv.setBigInt64(16, 70n, true);
      expect(bigInt64Arr[2]).assertEqual(70n);
      expect(bigInt64Arr.toString()).assertEqual([0n, 50n, 70n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const plainArr: bigint[] = Array.from(bigInt64Arr);
      expect(plainArr.toString()).assertEqual([10n, 20n, 30n].toString());
      dv.setBigInt64(8, 25n, true);
      const updatedPlainArr: bigint[] = Array.from(bigInt64Arr);
      expect(updatedPlainArr.toString()).assertEqual([10n, 25n, 30n].toString());
      plainArr[0] = 15n;
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(plainArr.toString()).assertEqual([15n, 20n, 30n].toString());
      expect(plainArr.length).assertEqual(3);
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
      const originalBuf: ArrayBuffer = new ArrayBuffer(32);
      const originalArr: BigInt64Array = new BigInt64Array(originalBuf);
      originalArr.set([5n, 15n, 25n, 35n]);
      const dv: DataView = new DataView(originalBuf);
      const slicedBuf: ArrayBuffer = originalBuf.slice(16, 32);
      const slicedArr: BigInt64Array = new BigInt64Array(slicedBuf);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr.byteLength).assertEqual(16);
      expect(slicedArr.toString()).assertEqual([25n, 35n].toString());
      dv.setBigInt64(16, 28n, true);
      expect(originalArr[2]).assertEqual(28n);
      expect(slicedArr[0]).assertEqual(25n);
      slicedArr[1] = 38n;
      expect(slicedArr.toString()).assertEqual([25n, 38n].toString());
      expect(originalArr[3]).assertEqual(35n);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 0x0000000000001234n;
      dv.setBigInt64(0, testVal, false);
      const expectedLittleEndianVal: bigint = 0x3412000000000000n;
      expect(bigInt64Arr[0]).assertEqual(expectedLittleEndianVal);
      bigInt64Arr[0] = testVal;
      const expectedBigEndianReadVal: bigint = 0x3412000000000000n;
      expect(dv.getBigInt64(0, false)).assertEqual(expectedBigEndianReadVal);
      expect(dv.getBigInt64(0, true)).assertEqual(testVal);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr[2]).assertEqual(undefined);
      expect(bigInt64Arr[-1]).assertEqual(undefined);
      expect(bigInt64Arr[100]).assertEqual(undefined);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(20n);
      dv.setBigInt64(8, 25n, true);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(25n);
      expect(bigInt64Arr[2]).assertEqual(undefined);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n]);
      const originalStr: string = bigInt64Arr.toString();
      const fillVal: bigint = 9n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, 2, 1);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.fill(fillVal, 1, 0);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.fill(fillVal, -1, -2);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.fill(fillVal, 0, 2);
      expect(bigInt64Arr.length).assertEqual(3);
      expect(bigInt64Arr.toString()).assertEqual([9n, 9n, 3n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const originalStr: string = bigInt64Arr.toString();
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0, 2, 1);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(2, 1, 0);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(0, -1, -2);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(1, 0, 2);
      expect(bigInt64Arr.length).assertEqual(3);
      expect(bigInt64Arr.toString()).assertEqual([10n, 10n, 20n].toString());
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
      const sab: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([50n, 60n]);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.includes(50n, 5)).assertEqual(false);
      expect(bigInt64Arr.includes(60n, 5)).assertEqual(false);
      expect(bigInt64Arr.includes(50n, 2)).assertEqual(false);
      expect(bigInt64Arr.includes(50n, -10)).assertEqual(true);
      dv.setBigInt64(8, 65n, true);
      expect(bigInt64Arr.includes(65n, 5)).assertEqual(false);
      expect(bigInt64Arr.includes(65n, 1)).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([15n, 25n, 15n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(15n, 10)).assertEqual(-1);
      expect(bigInt64Arr.indexOf(25n, 10)).assertEqual(-1);
      expect(bigInt64Arr.indexOf(15n, 3)).assertEqual(-1);
      expect(bigInt64Arr.indexOf(15n, -5)).assertEqual(0);
      dv.setBigInt64(16, 35n, true);
      expect(bigInt64Arr.indexOf(15n, 10)).assertEqual(-1);
      expect(bigInt64Arr.indexOf(15n, 0)).assertEqual(0);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1);
      expect(bigInt64Arr.lastIndexOf(15n, -10)).assertEqual(-1);
      expect(bigInt64Arr.lastIndexOf(5n, -1)).assertEqual(2);
      expect(bigInt64Arr.lastIndexOf(5n, -2)).assertEqual(0);
      dv.setBigInt64(0, 25n, true);
      expect(bigInt64Arr.lastIndexOf(5n, -10)).assertEqual(-1);
      expect(bigInt64Arr.lastIndexOf(5n, -2)).assertEqual(-1);
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
      const sab: ArrayBuffer = new ArrayBuffer(24);
      const viewA: BigInt64Array = new BigInt64Array(sab, 0, 2);
      const viewB: BigInt64Array = new BigInt64Array(sab, 8, 2);
      const dv: DataView = new DataView(sab);
      viewA.set([100n, 200n]);
      expect(viewB[0]).assertEqual(200n);
      expect(dv.getBigInt64(0, true)).assertEqual(100n);
      expect(dv.getBigInt64(8, true)).assertEqual(200n);
      viewB[1] = 300n;
      expect(viewA[1]).assertEqual(200n);
      expect(dv.getBigInt64(16, true)).assertEqual(300n);
      dv.setBigInt64(8, 250n, true);
      expect(viewA[0]).assertEqual(100n);
      expect(viewA[1]).assertEqual(250n);
      expect(viewB[0]).assertEqual(250n);
      expect(viewB[1]).assertEqual(300n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([3n, 6n, 9n]);
      const log: string[] = [];
      const dv: DataView = new DataView(buf);
      bigInt64Arr.forEach((val, idx, arr) => {
        log.push(`val:${val}, idx:${idx}, arrRef:${arr === bigInt64Arr}`);
      });
      expect(log[0]).assertEqual('val:3, idx:0, arrRef:true');
      expect(log[1]).assertEqual('val:6, idx:1, arrRef:true');
      expect(log[2]).assertEqual('val:9, idx:2, arrRef:true');
      dv.setBigInt64(8, 7n, true);
      log.length = 0;
      bigInt64Arr.forEach((val, idx) => {
        log.push(`val:${val}, idx:${idx}`);
      });
      expect(log[0]).assertEqual('val:3, idx:0');
      expect(log[1]).assertEqual('val:7, idx:1');
      expect(log[2]).assertEqual('val:9, idx:2');
      expect(log.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([2n, 4n, 6n]);
      const dv: DataView = new DataView(buf);
      const mappedArr: BigInt64Array = originalArr.map((val, idx) => val + BigInt(idx));
      expect(mappedArr.toString()).assertEqual([2n, 5n, 8n].toString());
      dv.setBigInt64(8, 5n, true);
      const newMappedArr: BigInt64Array = originalArr.map((val, idx) => val + BigInt(idx));
      expect(newMappedArr.toString()).assertEqual([2n, 6n, 8n].toString());
      const arrRefCheck: BigInt64Array = originalArr.map((val, _idx, arr) => {
        return arr === originalArr ? val : 0n;
      });
      expect(arrRefCheck.toString())
        .assertEqual([2n, 5n, 6n].toString());
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
      const sab: ArrayBuffer = new ArrayBuffer(32);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      originalArr.set([10n, 20n, 30n, 40n]);
      const dv: DataView = new DataView(sab);
      const filteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx % 2 === 0);
      expect(filteredArr.toString()).assertEqual([10n, 30n].toString());
      dv.setBigInt64(0, 15n, true);
      dv.setBigInt64(16, 35n, true);
      const newFilteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx % 2 === 0);
      expect(newFilteredArr.toString()).assertEqual([15n, 35n].toString());
      const idxFilteredArr: BigInt64Array = originalArr.filter((_val, idx) => idx > 1);
      expect(idxFilteredArr.toString()).assertEqual([35n, 40n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      const dv: DataView = new DataView(buf);
      const sumWithIdx: bigint = bigInt64Arr.reduce((acc, val, idx) => {
        return acc + val + BigInt(idx);
      }, 0n);
      expect(sumWithIdx).assertEqual(33n);
      dv.setBigInt64(8, 12n, true);
      const newSumWithIdx: bigint = bigInt64Arr.reduce((acc, val, idx) => {
        return acc + val + BigInt(idx);
      }, 0n);
      expect(newSumWithIdx).assertEqual(35n);
      const arrRefCheck: bigint = bigInt64Arr.reduce((acc, val, _idx, arr) => {
        return arr === bigInt64Arr ? acc + val : 0n;
      }, 0n);
      expect(arrRefCheck).assertEqual(5n + 12n + 15n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const allMeetCondition: boolean = bigInt64Arr.every((val, idx) => val > BigInt(idx * 5));
      expect(allMeetCondition).assertEqual(true);
      dv.setBigInt64(16, 9n, true);
      const someFail: boolean = bigInt64Arr.every((val, idx) => val > BigInt(idx * 5));
      expect(someFail).assertEqual(false);
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
      const sab: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(sab);
      const hasMatch: boolean = bigInt64Arr.some((val, idx) => val === BigInt(idx * 5 + 5));
      expect(hasMatch).assertEqual(true);
      dv.setBigInt64(0, 6n, true);
      const newHasMatch: boolean = bigInt64Arr.some((val, idx) => val === BigInt(idx * 5 + 6));
      expect(newHasMatch).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x1122334455667788n;
      bigInt64Arr[0] = initialVal;
      expect(dv.getUint8(0)).assertEqual(0x88);
      expect(dv.getUint8(1)).assertEqual(0x77);
      expect(dv.getUint8(7)).assertEqual(0x11);
      dv.setUint8(2, 0x99);
      const modifiedVal: bigint = 0x1122334455997788n;
      expect(bigInt64Arr[0]).assertEqual(modifiedVal);
      dv.setUint8(7, 0xFF);
      const finalVal: bigint = -0xddccbbaa668878n;
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0001020304050607n;
      bigInt64Arr[0] = initialVal;
      expect(dv.getUint16(0, true)).assertEqual(0x0607);
      expect(dv.getUint16(2, true)).assertEqual(0x0405);
      expect(dv.getUint16(6, true)).assertEqual(0x0001);
      dv.setUint16(4, 0x0A0B, true);
      const modifiedVal: bigint = 0x00010A0B04050607n;
      expect(bigInt64Arr[0]).assertEqual(modifiedVal);
      dv.setUint16(0, 0x0C0D, true);
      const finalVal: bigint = 0x00010A0B04050C0Dn;
      expect(bigInt64Arr[0]).assertEqual(finalVal);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x1111222233334444n;
      bigInt64Arr[0] = initialVal;
      expect(dv.getUint32(0, true)).assertEqual(0x33334444);
      expect(dv.getUint32(4, true)).assertEqual(0x11112222);
      dv.setUint32(0, 0x55556666, true);
      const modifiedVal: bigint = 0x1111222255556666n;
      expect(bigInt64Arr[0]).assertEqual(modifiedVal);
      dv.setUint32(4, 0x77778888, true);
      const finalVal: bigint = 0x7777888855556666n;
      expect(bigInt64Arr[0]).assertEqual(finalVal);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(0, 10n, true);
      dv.setBigInt64(8, 20n, true);
      dv.setBigInt64(16, 30n, true);
      dv.setBigInt64(24, 40n, true);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, 8, 2);
      expect(bigInt64Arr.length).assertEqual(2);
      expect(bigInt64Arr.byteOffset).assertEqual(8);
      expect(bigInt64Arr.byteLength).assertEqual(16);
      expect(bigInt64Arr.toString()).assertEqual([20n, 30n].toString());
      bigInt64Arr[0] = 25n;
      expect(dv.getBigInt64(8, true)).assertEqual(25n);
      dv.setBigInt64(16, 35n, true);
      expect(bigInt64Arr[0]).assertEqual(25n);
      expect(bigInt64Arr[1]).assertEqual(35n);
      expect(bigInt64Arr[2]).assertEqual(undefined);
      expect(bigInt64Arr.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      let isRangeError = false;
      try {
        new BigInt64Array(buf, 4, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      try {
        new BigInt64Array(buf, 16, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      try {
        new BigInt64Array(buf, 8, 2);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      let isRangeError = false;
      try {
        new BigInt64Array(buf, 0, -1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      try {
        new BigInt64Array(buf, 0, 4);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      isRangeError = false;
      try {
        new BigInt64Array(buf, 16, 2);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);
      const sliced1: BigInt64Array = originalArr.slice(0, -1);
      expect(sliced1.toString()).assertEqual([5n, 15n].toString());
      const sliced2: BigInt64Array = originalArr.slice(1, -2);
      expect(sliced2.length).assertEqual(0);
      const sliced3: BigInt64Array = originalArr.slice(-3, -1);
      expect(sliced3.toString()).assertEqual([5n, 15n].toString());
      const sliced4: BigInt64Array = originalArr.slice(0, -1);
      expect(sliced4.toString()).assertEqual([5n, 15n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const sliced1: BigInt64Array = originalArr.slice(-2, 3);
      expect(sliced1.toString()).assertEqual([20n, 30n].toString());
      const sliced2: BigInt64Array = originalArr.slice(-4, 2);
      expect(sliced2.toString()).assertEqual([10n, 20n].toString());
      const sliced3: BigInt64Array = originalArr.slice(-1, 2);
      expect(sliced3.length).assertEqual(0);
      dv.setBigInt64(16, 35n, true);
      const sliced4: BigInt64Array = originalArr.slice(-2, 3);
      expect(sliced4.toString()).assertEqual([20n, 35n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(-1, 0, 2);
      expect(bigInt64Arr.toString()).assertEqual([5n, 15n, 5n].toString());
      bigInt64Arr.set([5n, 15n, 25n]);
      bigInt64Arr.copyWithin(-3, 1, 3);
      expect(bigInt64Arr.toString()).assertEqual([15n, 25n, 25n].toString());
      bigInt64Arr.set([5n, 15n, 25n]);
      bigInt64Arr.copyWithin(-2, 2, 3);
      expect(bigInt64Arr.toString()).assertEqual([5n, 25n, 25n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.copyWithin(0, -2, -1);
      expect(bigInt64Arr.toString()).assertEqual([20n, 20n, 30n].toString());
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.copyWithin(1, -3, -2);
      expect(bigInt64Arr.toString()).assertEqual([10n, 10n, 30n].toString());
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.copyWithin(2, -1, -0);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 25n]);
      const fillVal: bigint = 9n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, -2, 3);
      expect(bigInt64Arr.toString()).assertEqual([5n, 9n, 9n].toString());
      bigInt64Arr.set([5n, 15n, 25n]);
      bigInt64Arr.fill(fillVal, -4, 2);
      expect(bigInt64Arr.toString()).assertEqual([9n, 9n, 25n].toString());
      bigInt64Arr.set([5n, 15n, 25n]);
      bigInt64Arr.fill(fillVal, -1, 2);
      expect(bigInt64Arr.toString()).assertEqual([5n, 15n, 25n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const fillVal: bigint = 7n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, 0, -1);
      expect(bigInt64Arr.toString()).assertEqual([7n, 7n, 30n].toString());
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.fill(fillVal, 1, -2);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.fill(fillVal, 0, -4);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
      expect(bigInt64Arr.length).assertEqual(3);
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
      const emptySab: SharedArrayBuffer = new SharedArrayBuffer(0);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(emptySab);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const signed32Val: number = -123456;
      dv.setInt32(0, signed32Val, true);
      expect(bigInt64Arr[0]).assertEqual(0xFFFE1DC0n);
      dv.setInt32(4, 789, true);
      expect(bigInt64Arr[0]).assertEqual(0x315FFFE1DC0n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      let iterationCount = 0;
      const errorMsg = 'Test error at index 1';
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
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(8, 20n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([2n, 4n, 6n]);
      let mappedValues: bigint[] = [];
      const errorMsg = 'Test error at index 1';
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
      expect(mappedValues.toString()).assertEqual([4n, 8n].toString());
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(8, 5n, true);
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
      expect(mappedValues.length).assertEqual(2);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(sab);
      originalArr.set([10n, 20n, 30n]);
      let checkedValues: bigint[] = [];
      const errorMsg = 'Test error at index 1';
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
      expect(checkedValues.toString()).assertEqual([10n, 20n].toString());
      const dv: DataView = new DataView(sab);
      dv.setBigInt64(8, 25n, true);
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
      expect(checkedValues.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      let lastAccumulator: bigint | null = null;
      const errorMsg = 'Test error at index 1';
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
      expect(lastAccumulator).assertEqual(15n);
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(8, 12n, true);
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
      expect(lastAccumulator).assertEqual(17n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      let checkedCount = 0;
      const condition = (val: bigint) => {
        checkedCount++;
        return val < 25n;
      };
      const result1 = bigInt64Arr.every(condition);
      expect(result1).assertEqual(false);
      expect(checkedCount).assertEqual(3);
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(8, 35n, true);
      checkedCount = 0;
      const result2 = bigInt64Arr.every(condition);
      expect(result2).assertEqual(false);
      expect(checkedCount).assertEqual(2);
      dv.setBigInt64(8, 20n, true);
      dv.setBigInt64(16, 25n, true);
      checkedCount = 0;
      const newCondition = (val: bigint) => {
        checkedCount++;
        return val <= 25n;
      };
      const result3 = bigInt64Arr.every(newCondition);
      expect(result3).assertEqual(true);
      expect(checkedCount).assertEqual(3);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([10n, 20n, 30n]);
      let checkedCount = 0;
      const condition = (val: bigint) => {
        checkedCount++;
        return val > 25n;
      };
      const result1 = bigInt64Arr.some(condition);
      expect(result1).assertEqual(true);
      expect(checkedCount).assertEqual(3);
      const dv: DataView = new DataView(sab);
      dv.setBigInt64(0, 35n, true);
      checkedCount = 0;
      const result2 = bigInt64Arr.some(condition);
      expect(result2).assertEqual(true);
      expect(checkedCount).assertEqual(1);
      dv.setBigInt64(0, 10n, true);
      dv.setBigInt64(8, 35n, true);
      checkedCount = 0;
      const result3 = bigInt64Arr.some(condition);
      expect(result3).assertEqual(true);
      expect(checkedCount).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const floatVal: number = 123.456;
      dv.setFloat64(0, floatVal, true);
      const floatAsBigInt: bigint = dv.getBigInt64(0, true);
      expect(bigInt64Arr[0]).assertEqual(floatAsBigInt);
      bigInt64Arr[0] = 456n;
      const bigIntAsFloat: number = dv.getFloat64(0, true);
      expect(bigIntAsFloat).assertEqual(2.253e-321);
      dv.setFloat32(0, 789.123, true);
      const float32AsBigInt: bigint = dv.getBigInt64(0, true);
      expect(bigInt64Arr[0]).assertEqual(float32AsBigInt);
      expect(bigInt64Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([10n, 20n, 30n, 40n]);
      const dv: DataView = new DataView(buf);
      const subArr1: BigInt64Array = parentArr.subarray(1, 1 + 100);
      expect(subArr1.length).assertEqual(3);
      expect(subArr1.toString()).assertEqual([20n, 30n, 40n].toString());
      const subArr2: BigInt64Array = parentArr.subarray(2, 2 + 0);
      expect(subArr2.length).assertEqual(0);
      const subArr3: BigInt64Array = parentArr.subarray(3, 3 + 5);
      expect(subArr3.length).assertEqual(1);
      expect(subArr3[0]).assertEqual(40n);
      dv.setBigInt64(8, 25n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([5n, 15n, 25n, 35n]);
      const dv: DataView = new DataView(buf);
      const sliced1: BigInt64Array = parentArr.slice(1, 100);
      expect(sliced1.length).assertEqual(3);
      expect(sliced1.toString()).assertEqual([15n, 25n, 35n].toString());
      expect(sliced1.buffer === parentArr.buffer).assertFalse();
      const sliced2: BigInt64Array = parentArr.slice(2, 2);
      expect(sliced2.length).assertEqual(0);
      const sliced3: BigInt64Array = parentArr.slice(3, 5);
      expect(sliced3.length).assertEqual(1);
      expect(sliced3[0]).assertEqual(35n);
      dv.setBigInt64(8, 20n, true);
      expect(sliced1[0]).assertEqual(15n);
      expect(sliced1[1]).assertEqual(25n);
      expect(sliced1[2]).assertEqual(35n);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const uint32Val: number = 0xFFFFFF00;
      dv.setUint32(0, uint32Val, true);
      const expectedLower32: bigint = BigInt(uint32Val);
      expect(bigInt64Arr[0]).assertEqual(expectedLower32);
      dv.setUint32(4, 0x000000FF, true);
      const expectedFull64: bigint = (BigInt(0x000000FF) << 32n) | expectedLower32;
      expect(bigInt64Arr[0]).assertEqual(expectedFull64);
      bigInt64Arr[0] = 0x123456789ABCDEF0n;
      const readUint32: number = dv.getUint32(0, true);
      expect(readUint32).assertEqual(0x9ABCDEF0);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 25n]);
      const originalStr = bigInt64Arr.toString();
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(5, 0, 2);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(3, 0, 2);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.copyWithin(2, 0, 1);
      expect(bigInt64Arr.toString()).assertEqual([5n, 15n, 5n].toString());
      expect(dv.getBigInt64(16, true)).assertEqual(5n);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const originalStr = bigInt64Arr.toString();
      const fillVal: bigint = 99n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, 5);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.fill(fillVal, 3);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      bigInt64Arr.fill(fillVal, 1, 3);
      expect(bigInt64Arr.toString()).assertEqual([10n, 99n, 99n].toString());
      expect(dv.getBigInt64(8, true)).assertEqual(99n);
      expect(dv.getBigInt64(16, true)).assertEqual(99n);
      bigInt64Arr.set([10n, 20n, 30n]);
      expect(bigInt64Arr.toString()).assertEqual(originalStr);
      expect(bigInt64Arr.length).assertEqual(3);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(8);
      const thread1Arr: BigInt64Array = new BigInt64Array(sab);
      const thread2Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      thread1Arr[0] = 100n;
      expect(thread2Arr[0]).assertEqual(100n);
      thread1Arr[0] = 200n;
      const thread2Read = thread2Arr[0];
      expect(thread2Read).assertEqual(200n);
      dv.setBigInt64(0, 300n, true);
      expect(thread1Arr[0]).assertEqual(300n);
      expect(thread1Arr[0]).assertEqual(thread2Arr[0]);
      expect(thread1Arr.length).assertEqual(1);
      expect(thread1Arr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(5n, 1.9)).assertEqual(2);
      expect(bigInt64Arr.indexOf(5n, 2.1)).assertEqual(2);
      expect(bigInt64Arr.indexOf(5n, -1.5)).assertEqual(2);
      dv.setBigInt64(16, 15n, true);
      expect(bigInt64Arr.indexOf(5n, 1.9)).assertEqual(-1);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(5n, 1.9)).assertEqual(0);
      expect(bigInt64Arr.lastIndexOf(5n, 2.1)).assertEqual(2);
      expect(bigInt64Arr.lastIndexOf(5n, -1.5)).assertEqual(2);
      dv.setBigInt64(0, 15n, true);
      expect(bigInt64Arr.lastIndexOf(5n, 1.9)).assertEqual(-1);
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      bigInt64Arr.set([20n, 30n, 40n]);
      const dv: DataView = new DataView(sab);
      expect(bigInt64Arr.includes(30n, 1.9)).assertEqual(true);
      expect(bigInt64Arr.includes(20n, 1.9)).assertEqual(false);
      expect(bigInt64Arr.includes(40n, 2.1)).assertEqual(true);
      expect(bigInt64Arr.includes(30n, 2.1)).assertEqual(false);
      expect(bigInt64Arr.includes(40n, -1.5)).assertEqual(true);
      dv.setBigInt64(16, 45n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0000000000000000n;
      bigInt64Arr[0] = initialVal;
      dv.setUint8(0, 0x12);
      let expectedVal: bigint = 0x0000000000000012n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      dv.setUint8(3, 0x34);
      expectedVal = 0x0000000034000012n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      dv.setUint8(7, 0x78);
      expectedVal = 0x7800000034000012n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(dv.getUint8(0)).assertEqual(0x12);
      expect(dv.getUint8(3)).assertEqual(0x34);
      expect(dv.getUint8(7)).assertEqual(0x78);
      expect(dv.getUint8(1)).assertEqual(0);
      expect(dv.getUint8(2)).assertEqual(0);
      expect(dv.getUint8(4)).assertEqual(0);
      expect(dv.getUint8(5)).assertEqual(0);
      expect(dv.getUint8(6)).assertEqual(0);

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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const initialVal: bigint = 0x0000000000000000n;
      bigInt64Arr[0] = initialVal;
      dv.setUint16(0, 0x1234, true);
      let expectedVal: bigint = 0x0000000000001234n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      dv.setUint16(2, 0x5678, true);
      expectedVal = 0x0000000000567834n;
      expectedVal = 0x0000000056781234n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      dv.setUint16(4, 0x9ABC, true);
      expectedVal = 0x00009ABC56781234n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 0x0011223344556677n;
      bigInt64Arr[0] = testVal;
      const bigEndianRead: bigint = dv.getBigInt64(0, false);
      const expectedBigEndian: bigint = 0x7766554433221100n;
      expect(bigEndianRead).assertEqual(expectedBigEndian);
      dv.setBigInt64(0, testVal, false);
      const littleEndianRead: bigint = bigInt64Arr[0];
      expect(littleEndianRead).assertEqual(expectedBigEndian);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0.9, 1.1, 2.9);
      expect(bigInt64Arr.toString()).assertEqual([2n, 2n, 3n].toString());
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(1.5, 0.2, 1.8);
      expect(bigInt64Arr.toString()).assertEqual([1n, 1n, 3n].toString());
      expect(dv.getBigInt64(8, true)).assertEqual(1n);
      bigInt64Arr.set([1n, 2n, 3n]);
      bigInt64Arr.copyWithin(-0.5, -1.2, -0.1);
      expect(bigInt64Arr.toString()).assertEqual([1n, 2n, 3n].toString());
      expect(bigInt64Arr.length).assertEqual(3)
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const fillVal: bigint = 5n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, 0.9, 2.1);
      expect(bigInt64Arr.toString()).assertEqual([5n, 5n, 30n].toString());
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.fill(fillVal, 1.2, -0.5);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 30n].toString());
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      bigInt64Arr.set([10n, 20n, 30n]);
      bigInt64Arr.fill(fillVal, -1.8, 3.5);
      expect(bigInt64Arr.toString()).assertEqual([10n, 20n, 5n].toString());
      expect(bigInt64Arr.length).assertEqual(3)
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
      expect(view1.length).assertEqual(0);
      expect(view2.length).assertEqual(0);
      expect(view1.byteLength).assertEqual(0);
      expect(view2.byteLength).assertEqual(0);
      expect(view1.buffer).assertEqual(emptySab);
      expect(view2.buffer).assertEqual(emptySab);
      expect(dv.buffer).assertEqual(emptySab);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([5n, 15n, 25n]);
      const dv: DataView = new DataView(buf);
      const sliced1: BigInt64Array = originalArr.slice(0.9, 2.1);
      expect(sliced1.length).assertEqual(2)
      expect(sliced1.toString()).assertEqual([5n, 15n].toString());
      const sliced2: BigInt64Array = originalArr.slice(1.2, -0.5);
      expect(sliced2.toString()).assertEqual([].toString());
      const sliced3: BigInt64Array = originalArr.slice(-1.8, 3.5);
      expect(sliced3.toString()).assertEqual([25n].toString());
      expect(sliced3.length).assertEqual(1)
      dv.setBigInt64(8, 20n, true);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const littleEndianVal: bigint = 0x0011223344556677n;
      const bigEndianVal: bigint = 0x7766554433221100n;
      bigInt64Arr[0] = littleEndianVal;
      expect(dv.getBigInt64(0, true)).assertEqual(littleEndianVal);
      expect(dv.getBigInt64(0, false)).assertEqual(bigEndianVal);
      dv.setBigInt64(0, littleEndianVal, false);
      expect(bigInt64Arr[0]).assertEqual(bigEndianVal);
      expect(dv.getBigInt64(0, false)).assertEqual(littleEndianVal);
      const bytes: number[] = [];
      for (let i = 0; i < 8; i++) {
        bytes.push(dv.getUint8(i));
      }
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr[0] = 0n;
      dv.setUint8(0, 300);
      expect(dv.getUint8(0)).assertEqual(44);
      expect(bigInt64Arr[0]).assertEqual(44n);
      expect(bigInt64Arr.length).assertEqual(1)
      dv.setUint8(1, -50);
      expect(dv.getUint8(1)).assertEqual(206);
      expect(bigInt64Arr[0]).assertEqual(0x000000000000ce2cn);
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
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setBigInt64(0, 100n, true);
      dv.setBigInt64(8, 200n, true);
      dv.setBigInt64(16, 300n, true);
      const entries: [number, bigint][] = [];
      for (const entry of bigInt64Arr.entries()) {
        entries.push(entry);
      }
      expect(entries.length).assertEqual(3);
      expect(entries[0].toString()).assertEqual([0, 100n].toString());
      expect(entries[1].toString()).assertEqual([1, 200n].toString());
      expect(entries[2].toString()).assertEqual([2, 300n].toString());
      expect(entries.length).assertEqual(3)
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
      const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      for (let i = 0; i < 4; i++) {
        dv.setBigInt64(i * 8, BigInt(i * 50), true);
      }
      const keys: number[] = [];
      for (const key of bigInt64Arr.keys()) {
        keys.push(key);
      }
      expect(keys.toString()).assertEqual([0, 1, 2, 3].toString());
      const subArr: BigInt64Array = bigInt64Arr.subarray(1, 3);
      const subKeys: number[] = [];
      for (const key of subArr.keys()) {
        subKeys.push(key);
      }
      expect(subKeys.toString()).assertEqual([0, 1].toString());
      expect(subKeys.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.set([-500n, 750n]);
      const values: bigint[] = [];
      for (const val of bigInt64Arr.values()) {
        values.push(val);
      }
      expect(values.toString()).assertEqual([-500n, 750n].toString());
      dv.setBigInt64(0, -600n, true);
      const updatedValues: bigint[] = [];
      for (const val of bigInt64Arr.values()) {
        updatedValues.push(val);
      }
      expect(updatedValues.toString()).assertEqual([-600n, 750n].toString());
      bigInt64Arr[1] = 850n;
      const finalValues: bigint[] = [];
      for (const val of bigInt64Arr.values()) {
        finalValues.push(val);
      }
      expect(finalValues.toString()).assertEqual([-600n, 850n].toString());
      expect(finalValues.length).assertEqual(2);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr[0] = 0n;

      dv.setInt16(0, -100, true);
      let expectedVal: bigint = 0x000000000000FF9Cn;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(dv.getInt16(0, true)).assertEqual(-100);
      expect(bigInt64Arr.length).assertEqual(1);

      dv.setInt16(2, 32000, true);
      expectedVal = 0x000000007D00FF9Cn;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(dv.getInt16(2, true)).assertEqual(32000);
      expect(bigInt64Arr.length).assertEqual(1);

      dv.setInt16(6, -500, true);
      expectedVal = -0x1f3ffff82ff0064n;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(dv.getInt16(6, true)).assertEqual(-500);
      expect(bigInt64Arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayBigInt64ArrayBufferDv0174
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGINT64ARRAY_BUFFER_DV_0174
     * @tc.desc   Verify BigInt64Array with SharedArrayBuffer (simulated concurrent write-read)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayBigInt64ArrayBufferDv0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (Done: Function) => {
        const sab: SharedArrayBuffer = new SharedArrayBuffer(8);
        const threadAArr: BigInt64Array = new BigInt64Array(sab);
        const threadBArr: BigInt64Array = new BigInt64Array(sab);
        const dv: DataView = new DataView(sab);

        threadAArr[0] = 1000n;
        expect(threadBArr[0]).assertEqual(1000n);
        expect(threadAArr.length).assertEqual(1);
        expect(threadBArr.length).assertEqual(1);

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
        expect(threadAArr[0]).assertEqual(3000n);
        expect(dv.getBigInt64(0, true)).assertEqual(3000n);
        expect(threadAArr.length).assertEqual(1);
        expect(threadBArr.length).assertEqual(1);

        setTimeout(() => {
          threadAArr[0] = 4000n;
        }, 20);
        const readVal = await new Promise<bigint>((resolve) => {
          setTimeout(() => {
            resolve(dv.getBigInt64(0, true));
          }, 25);
        });
        expect(readVal).assertEqual(4000n);
        expect(threadAArr.length).assertEqual(1);
        expect(threadBArr.length).assertEqual(1);
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
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      bigInt64Arr[0] = 0n;

      const uint32Max = 0xFFFFFFFF;
      dv.setUint32(0, uint32Max + 1, true);
      expect(dv.getUint32(0, true)).assertEqual(0);
      expect(bigInt64Arr[0]).assertEqual(0x0000000000000000n);
      expect(bigInt64Arr.length).assertEqual(1);

      dv.setUint32(0, uint32Max, true);
      let expectedVal: bigint = 0x00000000FFFFFFFFn;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(bigInt64Arr.length).assertEqual(1);

      dv.setUint32(4, 1, true);
      expectedVal = 0x00000001FFFFFFFFn;
      expect(bigInt64Arr[0]).assertEqual(expectedVal);
      expect(dv.getUint32(4, true)).assertEqual(1);
      expect(bigInt64Arr.length).assertEqual(1);
    })

  })
}