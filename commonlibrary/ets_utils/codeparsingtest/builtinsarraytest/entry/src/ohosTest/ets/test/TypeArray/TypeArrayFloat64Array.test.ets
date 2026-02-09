/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'
import { arrayLike } from './TypeArrayConst'

interface GeneratedObjectLiteralInterface_1 {
  value: number;
}

export default function typeArrayFloat64ArrayTest() {
  describe('TypeArrayFloat64ArrayTest', () => {
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
     * @tc.name   TypeArrayFloat64Array0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0001
     * @tc.desc   Verify the basic properties of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr.buffer instanceof ArrayBuffer).assertEqual(true);
      expect(arr.byteOffset).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0002
     * @tc.desc   Verify Float64Array creation based on ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const arr = new Float64Array(buffer, 8, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(24);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0003
     * @tc.desc   Verify Float64Array creation based on SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      if (typeof SharedArrayBuffer !== 'undefined') {
        const buffer = new SharedArrayBuffer(40);
        const arr = new Float64Array(buffer);
        expect(arr.length).assertEqual(5);
        expect(arr.buffer instanceof SharedArrayBuffer).assertEqual(true);
      }
    })

    /**
     * @tc.name   TypeArrayFloat64Array0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0004
     * @tc.desc   Verify interaction between Float64Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(32);
      const float64Arr = new Float64Array(buffer);
      const dv = new DataView(buffer);

      dv.setFloat64(0, 123.456, false);
      dv.setFloat64(8, 789.012, true);
      expect(approxEqual(float64Arr[0], 123.456)).assertEqual(false);
      expect(approxEqual(float64Arr[1], 789.012)).assertEqual(true);

      float64Arr[2] = 3.1415926535;

      expect(approxEqual(dv.getFloat64(16, false), 3.1415926535)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0005
     * @tc.desc   Verify various construction methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {

      const arr1 = new Float64Array(2);
      expect(arr1.length).assertEqual(2);

      const arr2 = new Float64Array([1.1, 2.2, 3.3]);
      expect(arr2.length).assertEqual(3);
      expect(approxEqual(arr2[1], 2.2)).assertEqual(true);
      const source = new Float32Array([4.4, 5.5]);
      const arr3 = new Float64Array(source);
      expect(arr3.length).assertEqual(2);
      expect(approxEqual(arr3[0], 4.4)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0006
     * @tc.desc   Verify the set method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array(5);
      const source = new Float64Array([1.0, 2.0, 3.0]);

      arr.set(source);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[2]).assertEqual(3.0);

      try {
        arr.set(source, 3);
        expect(arr[3]).assertEqual(1.0);
        expect(arr[4]).assertEqual(2.0);
      } catch (e) {
        expect(e.message).assertContain('The sum of srcLength and targetOffset is greater than targetLength.')
      }
    })

    /**
     * @tc.name   TypeArrayFloat64Array0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0007
     * @tc.desc   Verify the subarray method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const sub = arr.subarray(1, 4);

      expect(sub.length).assertEqual(3);
      expect(sub.toString()).assertEqual('2,3,4');

      sub[0] = 20.0;
      expect(arr[1]).assertEqual(20.0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0008
     * @tc.desc   Verify conversion between Float64Array and regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = [1.1, 2.2, 3.3];
      const float64Arr = new Float64Array(original);

      const converted = Array.from(float64Arr);

      expect(converted.length).assertEqual(3);
      expect(approxEqual(converted[0], original[0])).assertEqual(true);
      expect(approxEqual(converted[2], original[2])).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0009
     * @tc.desc   Verify static from and of methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = Float64Array.from([1, 2, 3], (x) => x * 0.1);
      expect(arr1.toString()).assertEqual('0.1,0.2,0.30000000000000004');

      const arr2 = Float64Array.of(1.1, 2.2, 3.3);
      expect(arr2.length).assertEqual(3);
      expect(approxEqual(arr2[1], 2.2)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0010
     * @tc.desc   Verify iteration methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);

      const results: number[] = [];
      arr.forEach((val) => results.push(val * 2));
      expect(results.toString()).assertEqual('2,4,6,8');

      const mapped = arr.map((val) => val * val);
      expect(mapped.toString()).assertEqual('1,4,9,16');
      expect(mapped.length).assertEqual(4);
      const filtered = arr.filter((val) => val > 2.0);
      expect(filtered.toString()).assertEqual('3,4');
      expect(filtered.length).assertEqual(2);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(10.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0011
     * @tc.desc   Verify search methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 2.0, 1.0]);

      expect(arr.indexOf(2.0)).assertEqual(1);
      expect(arr.indexOf(2.0, 2)).assertEqual(3);
      expect(arr.lastIndexOf(2.0)).assertEqual(3);
      expect(arr.lastIndexOf(2.0, 2)).assertEqual(1);

      expect(arr.includes(3.0)).assertEqual(true);
      expect(arr.includes(4.0)).assertEqual(false);

      const found = arr.find((val) => val > 2.0);
      expect(found).assertEqual(3.0);

      const foundIndex = arr.findIndex((val) => val > 2.0);
      expect(foundIndex).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0012
     * @tc.desc   Verify manipulation methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Float64Array(5);
      arr1.fill(3.14);
      expect(arr1[0]).assertEqual(3.14);
      arr1.fill(1.59, 1, 4);
      expect(arr1.toString()).assertEqual('3.14,1.59,1.59,1.59,3.14');

      const arr2 = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr2.copyWithin(0, 3);
      expect(arr2.toString()).assertEqual('4,5,3,4,5');
      expect(arr2.length).assertEqual(5);
      const arr3 = new Float64Array([3.0, 1.0, 4.0, 2.0]);
      arr3.sort((a, b) => a - b);
      expect(arr3.toString()).assertEqual('1,2,3,4');
      expect(arr3.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0013
     * @tc.desc   Verify handling of boundary values by Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([
        0.0, -0.0, Infinity, -Infinity, NaN,
        Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON
      ]);

      expect(arr[0]).assertEqual(0.0);
      expect(arr[1]).assertEqual(-0.0);
      expect(arr[2]).assertEqual(Infinity);
      expect(arr[3]).assertEqual(-Infinity);
      expect(isNaN(arr[4])).assertEqual(true);
      expect(arr[5]).assertEqual(Number.MAX_VALUE);
      expect(arr[6]).assertEqual(Number.MIN_VALUE);
      expect(arr[7]).assertEqual(Number.EPSILON);
      expect(arr.length).assertEqual(8);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0014
     * @tc.desc   Verify buffer boundary handling of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);

      const arr1 = new Float64Array(buffer, 8, 1);
      expect(arr1.length).assertEqual(1);
      expect(arr1.byteOffset).assertEqual(8);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0015
     * @tc.desc   Verify exception scenario handling of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let errorThrown = false;
      try {
        const arr = new Float64Array(2);
        arr.set(new Float64Array(3));
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0016
     * @tc.desc   Verify data parsing rules of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(16);
      const dv = new DataView(buffer);
      const float64Arr = new Float64Array(buffer);

      dv.setFloat64(0, 123.456, false);
      dv.setFloat64(8, 123.456, true);


      expect(approxEqual(float64Arr[0], 123.456)).assertEqual(false);

      const buffer2 = new ArrayBuffer(8);
      const dv2 = new DataView(buffer2);
      dv2.setFloat64(0, 1.0, false);
      const float64Arr2 = new Float64Array(buffer2);

      dv2.setUint8(0, 0);

      expect(float64Arr2[0].toString()).assertEqual('3.03554e-319');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0017
     * @tc.desc   Verify interaction of multiple views on the same buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);

      const float64Arr = new Float64Array(buffer);
      const int32Arr = new Int32Array(buffer);
      const dv = new DataView(buffer);

      float64Arr[0] = 1.0;

      expect(int32Arr.length).assertEqual(8);

      dv.setFloat64(8, 2.0, false);

      expect(float64Arr[1]).assertEqual(3.16e-322);

      int32Arr[0] = 0;
      expect(float64Arr[0]).assertEqual(1.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0018
     * @tc.desc   Verify the slice method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const slice1 = arr.slice(1, 4);
      expect(slice1.length).assertEqual(3);
      expect(slice1.toString()).assertEqual('2,3,4');

      const slice2 = arr.slice(2);
      expect(slice2.toString()).assertEqual('3,4,5');

      slice1[0] = 20.0;
      expect(arr[1]).assertEqual(2.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0019
     * @tc.desc   Verify the every and some methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([2.0, 4.0, 6.0, 8.0]);

      const allEven = arr.every((val) => {
        return val % 2 === 0;
      });
      expect(allEven).assertEqual(true);

      const allGreaterThan5 = arr.every((val) => {
        return val > 5;
      });
      expect(allGreaterThan5).assertEqual(false);

      const hasGreaterThan6 = arr.some((val) => {
        return val > 6;
      });
      expect(hasGreaterThan6).assertEqual(true);

      const hasNegative = arr.some((val) => {
        return val < 0;
      });
      expect(hasNegative).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0020
     * @tc.desc   Verify the reduceRight method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);

      const sumRight = arr.reduceRight((acc, val) => {
        return acc + val;
      }, 0);
      expect(sumRight).assertEqual(10.0);

      const str = arr.reduceRight((acc, val) => {
        return acc + val.toString();
      }, '');
      expect(str).assertEqual('4321');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0021
     * @tc.desc   Verify out-of-bounds index behavior of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);

      expect(isNaN(arr[3])).assertEqual(true);
      expect(isNaN(arr[-1])).assertEqual(true);

      arr[5] = 5.0;
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0022
     * @tc.desc   Verify buffer sharing between Float64Array and other TypedArrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const float64Arr = new Float64Array(buffer);
      const int16Arr = new Int16Array(buffer);

      float64Arr[0] = 1.0;
      float64Arr[1] = 2.0;

      expect(int16Arr.length).assertEqual(16);

      int16Arr[0] = 0;
      int16Arr[1] = 0;
      expect(float64Arr[0]).assertEqual(1.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0023
     * @tc.desc   Verify batch operation performance-related features of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const size = 100;
      const arr = new Float64Array(size);

      for (let i = 0; i < size; i++) {
        arr[i] = i * 0.1;
      }

      expect(approxEqual(arr[10], 1.0)).assertEqual(true);
      expect(approxEqual(arr[99], 9.9)).assertEqual(true);

      const transformed = new Float64Array(size);
      for (let i = 0; i < size; i++) {
        transformed[i] = Math.sin(arr[i]);
      }


      expect(approxEqual(transformed[0], 0.0)).assertEqual(true);
      expect(approxEqual(transformed[Math.floor(Math.PI * 5)], Math.sin(Math.PI * 0.5))).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0024
     * @tc.desc   Verify handling of special mathematical operations by Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([0.0, 1.0, -1.0, Infinity, -Infinity, NaN]);


      expect(isNaN(arr[0] / arr[0])).assertEqual(true);
      expect(arr[1] / arr[4]).assertEqual(-0.0);
      expect(arr[3] * arr[2]).assertEqual(-Infinity);
      expect(isNaN(arr[5] * arr[1])).assertEqual(true);
      expect(String(arr[3] + arr[4])).assertEqual('NaN');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0025
     * @tc.desc   Verify empty array behavior of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emptyArr = new Float64Array(0);

      expect(emptyArr.length).assertEqual(0);
      expect(emptyArr.byteLength).assertEqual(0);


      expect(emptyArr.map((val) => val * 2).length).assertEqual(0);
      expect(emptyArr.filter((val) => val > 0).length).assertEqual(0);

      let errorThrown = false;
      try {
        emptyArr.reduce((acc, val) => acc + val);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);

      const result = emptyArr.reduce((acc, val) => acc + val, 0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0026
     * @tc.desc   Verify boundary handling of the fill method for Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      arr.fill(0.0, 3, 10);
      expect(arr.toString()).assertEqual('1,2,3,0,0');
      expect(arr.length).assertEqual(5);
      arr.fill(9.0, 2, 1);
      expect(arr.toString()).assertEqual('1,2,3,0,0');
      expect(arr.length).assertEqual(5);
      arr.fill(6.0, -3, -1);
      expect(arr.toString()).assertEqual('1,2,6,6,0');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0027
     * @tc.desc   Verify boundary handling of the copyWithin method for Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      arr.copyWithin(0, 3, 10);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
      arr.copyWithin(3, 0, 2);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
      const arr2 = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr2.copyWithin(-2, -4, -2);
      expect(arr2.toString()).assertEqual('1,2,3,2,3');
      expect(arr2.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0028
     * @tc.desc   Verify handling of special values by the sort method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([3.0, NaN, 1.0, Infinity, -Infinity, 2.0]);

      arr.sort((a, b) => {
        if (isNaN(a)) {
          return 1;
        }
        if (isNaN(b)) {
          return -1;
        }
        return a - b;
      });

      expect(arr[0]).assertEqual(-Infinity);
      expect(arr[1]).assertEqual(1.0);
      expect(arr[2]).assertEqual(2.0);
      expect(arr[3]).assertEqual(3.0);
      expect(arr[4]).assertEqual(Infinity);
      expect(isNaN(arr[5])).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0029
     * @tc.desc   Verify interaction between Float64Array and JSON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);

      const json = JSON.stringify(arr);
      expect(json).assertEqual('{"0":1,"1":2,"2":3,"3":4}');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0030
     * @tc.desc   Verify handling of NaN by the find and findIndex methods of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat64Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float64Array([1.0, NaN, 3.0, NaN, 5.0]);

      const foundNaN = arr.find((val) => isNaN(val));
      expect(isNaN(foundNaN!)).assertEqual(true);

      const foundNaNIndex = arr.findIndex((val) => isNaN(val));
      expect(foundNaNIndex).assertEqual(1);

      const foundNaNFromIndex = arr.findIndex((val) => isNaN(val), 2);
      expect(foundNaNFromIndex).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0031
     * @tc.desc   Validate the Values Iterator of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.1, 2.2, 3.3]);
      const values: number[] = [];

      for (const value of arr.values()) {
        values.push(value);
      }

      expect(values.length).assertEqual(3);
      expect(approxEqual(values[0], 1.1)).assertEqual(true);
      expect(approxEqual(values[2], 3.3)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0032
     * @tc.desc   Verify the key iterators of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array(3);
      const keys: number[] = [];

      for (const key of arr.keys()) {
        keys.push(key);
      }
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0033
     * @tc.desc   Verify the entries iterator of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([10.0, 20.0, 30.0]);
      const entries: number[][] = [];

      for (const entry of arr.entries()) {
        entries.push(entry);
      }

      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(approxEqual(entries[0][1], 10.0)).assertEqual(true);
      expect(entries[2][0]).assertEqual(2);
      expect(approxEqual(entries[2][1], 30.0)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0034
     * @tc.desc   Verify the forEach method parameters of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);

      interface arrInter {
        val: number,
        index: number,
        length: number
      }

      const log: arrInter[] = [];

      arr.forEach((val, index, array) => {
        log.push({ val, index, length: array.length });
      });

      expect(log.length).assertEqual(3);
      expect(log[0].val).assertEqual(1.0);
      expect(log[0].index).assertEqual(0);
      expect(log[0].length).assertEqual(3);
      expect(log[2].val).assertEqual(3.0);
      expect(log[2].index).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0035
     * @tc.desc   Verify the impact of the map method of Float64Array on the array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const mapped = arr.map((val, index) => {
        arr[index] = val * 10;
        return val * 2;
      });
      expect(mapped.toString()).assertEqual('2,4,6');
      expect(mapped.length).assertEqual(3);
      expect(arr.toString()).assertEqual('10,20,30');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0036
     * @tc.desc   Validate the filter method of Float64Array for handling sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(5);
      arr[0] = 1.0;
      arr[2] = 3.0;
      arr[4] = 5.0;
      const filtered = arr.filter(() => true);
      expect(filtered.length).assertEqual(5);
      expect(filtered.toString()).assertEqual('1,0,3,0,5');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0037
     * @tc.desc   Verify the fill method of Float64Array for filling special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(3);

      arr.fill(NaN);
      expect(isNaN(arr[0])).assertEqual(true);
      expect(isNaN(arr[2])).assertEqual(true);

      arr.fill(Infinity);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(Infinity);

      arr.fill(-0);
      expect(arr[0]).assertEqual(-0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0038
     * @tc.desc   Validate the set method of Float64Array for handling different source types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(5);

      arr.set([1.0, 2.0]);
      expect(arr.toString()).assertEqual('1,2,0,0,0');

      const source = new Int32Array([3, 4]);
      arr.set(source, 2);
      expect(arr.toString()).assertEqual('1,2,3,4,0');

      const float32Source = new Float32Array([5.555555]);
      arr.set(float32Source, 4);
      expect(approxEqual(arr[4], 5.555555)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0039
     * @tc.desc   Validate the subarray method of Float64Array for handling negative indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const sub1 = arr.subarray(-3);
      expect(sub1.toString()).assertEqual('3,4,5');
      expect(sub1.length).assertEqual(3);
      const sub2 = arr.subarray(1, -1);
      expect(sub2.toString()).assertEqual('2,3,4');
      expect(sub2.length).assertEqual(3);
      const sub3 = arr.subarray(-4, -2);
      expect(sub3.toString()).assertEqual('2,3');
      expect(sub3.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0040
     * @tc.desc   Validate the slice method of Float64Array for handling negative indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const slice1 = arr.slice(-3);
      expect(slice1.toString()).assertEqual('3,4,5');
      expect(slice1.length).assertEqual(3);
      const slice2 = arr.slice(1, -1);
      expect(slice2.toString()).assertEqual('2,3,4');
      expect(slice2.length).assertEqual(3);
      const slice3 = arr.slice(-4, -2);
      expect(slice3.toString()).assertEqual('2,3');
      expect(slice3.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0041
     * @tc.desc   Verify the performance of Float64Array in complex mathematical operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([0, Math.PI / 2, Math.PI, 3 * Math.PI / 2, 2 * Math.PI]);

      const sinValues = arr.map((val) => Math.sin(val));

      expect(approxEqual(sinValues[0], 0)).assertEqual(true);
      expect(approxEqual(sinValues[1], 1)).assertEqual(true);
      expect(approxEqual(sinValues[2], 0)).assertEqual(true);
      expect(approxEqual(sinValues[3], -1)).assertEqual(true);
      expect(approxEqual(sinValues[4], 0)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0042
     * @tc.desc   Verify the handling of array like objects by the from method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = Float64Array.from(arrayLike, (x) => x * 0.5);

      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('5,10,15');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0043
     * @tc.desc   Verify the batch modification performance characteristics of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const size = 1000;
      const arr = new Float64Array(size);

      for (let i = 0; i < size; i++) {
        arr[i] = i;
      }

      for (let i = 0; i < size; i++) {
        arr[i] = Math.sqrt(arr[i]) * 0.1;
      }

      expect(approxEqual(arr[0], 0)).assertEqual(true);
      expect(approxEqual(arr[25], 0.5)).assertEqual(true);
      expect(approxEqual(arr[100], 1.0)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0044
     * @tc.desc   Verify the interaction between Float64Array and WebView in different byte orders
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const dv = new DataView(buffer);

      dv.setFloat64(0, 12345.6789, false);

      dv.setFloat64(8, 12345.6789, true);

      const arr = new Float64Array(buffer);

      expect(approxEqual(arr[0], 12345.6789)).assertEqual(false);

      const isLittleEndian = (() => {
        const buffer = new ArrayBuffer(2);
        new DataView(buffer).setInt16(0, 256, true);
        return new Int16Array(buffer)[0] === 256;
      })();

      if (isLittleEndian) {
        expect(approxEqual(arr[1], 12345.6789)).assertEqual(true);
      } else {
        expect(approxEqual(arr[1], 12345.6789)).assertEqual(false);
      }
    })

    /**
     * @tc.name   TypeArrayFloat64Array0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0045
     * @tc.desc   Verify the handling of special values by the indexOf method of Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([0.0, -0.0, NaN, Infinity, -Infinity]);

      expect(arr.indexOf(0.0)).assertEqual(0);
      expect(arr.indexOf(-0.0)).assertEqual(0);

      expect(arr.indexOf(Infinity)).assertEqual(3);

      expect(arr.indexOf(-Infinity)).assertEqual(4);

      expect(arr.indexOf(NaN)).assertEqual(-1);
    })


    /**
     * @tc.name   TypeArrayFloat64Array0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0046
     * @tc.desc   Test Float64Array with typed array conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const source = new Float64Array([1.1, 2.2, 3.3]);

      const int8Arr = new Int8Array(source.buffer);
      const float32Arr = new Float32Array(source.buffer);

      expect(int8Arr.length).assertEqual(source.byteLength);
      expect(float32Arr.length).assertEqual(source.length * 2);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0047
     * @tc.desc   Test Float64Array buffer sharing modifications
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const arr1 = new Float64Array(buffer, 0, 2);
      const arr2 = new Float64Array(buffer, 8, 1);

      arr1[0] = 100.1;
      arr1[1] = 200.2;

      expect(arr2[0]).assertEqual(200.2);

      arr2[0] = 300.3;
      expect(arr1[1]).assertEqual(300.3);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0048
     * @tc.desc   Test Float64Array with large values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const largeValue = 1e300;
      const arr = new Float64Array([largeValue, largeValue * 2]);

      expect(arr[0]).assertEqual(largeValue);
      expect(arr[1]).assertEqual(largeValue * 2);
      expect(arr[0] * 2).assertEqual(arr[1]);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0049
     * @tc.desc   Test Float64Array with very small values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const smallValue = 1e-300;
      const arr = new Float64Array([smallValue, smallValue / 2]);

      expect(arr[0]).assertEqual(smallValue);
      expect(approxEqual(arr[1], smallValue / 2)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0050
     * @tc.desc   Test Float64Array reduce with initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);

      const product = arr.reduce((acc, val) => acc * val, 1.0);
      expect(product).assertEqual(24.0);

      const concatenated = arr.reduce((acc, val) => acc + val.toString(), '');
      expect(concatenated).assertEqual('1234');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0051
     * @tc.desc   Test Float64Array find with index parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([5.0, 10.0, 15.0, 20.0]);

      const found = arr.find((val, index) => {
        return val === index * 5;
      });

      const foundIndex = arr.findIndex((val, index) => {
        return val === index * 5 + 5;
      });

      expect(found).assertEqual(undefined);
      expect(foundIndex).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0052
     * @tc.desc   Test Float64Array filter with array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);

      const filtered = arr.filter((val, _index, array) => {
        return val < array[array.length - 1] / 2;
      });

      expect(filtered.toString()).assertEqual('1');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0053
     * @tc.desc   Test Float64Array map with thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const multiplier: GeneratedObjectLiteralInterface_1 = { value: 2.0 };
      const arr = new Float64Array([1.0, 2.0, 3.0]);

      const mapped = arr.map(val => {
        return val * multiplier.value;
      });

      expect(mapped.toString()).assertEqual('2,4,6');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0055
     * @tc.desc   Test Float64Array with DataView and overlapping ranges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(24);
      const arr = new Float64Array(buffer, 0, 3);
      const dv = new DataView(buffer);

      arr[0] = 1.0;
      arr[1] = 2.0;
      arr[2] = 3.0;

      dv.setUint8(7, 0xFF);
      dv.setUint8(15, 0xFF);
      expect(arr[0].toString()).assertEqual('-Infinity');
      expect(arr[1].toString()).assertEqual('-5.486124068793689e+303');
      expect(arr[2]).assertEqual(3.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0056
     * @tc.desc   Test Float64Array includes method with fromIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 2.0, 1.0]);

      expect(arr.includes(2.0)).assertEqual(true);
      expect(arr.includes(2.0, 3)).assertEqual(true);
      expect(arr.includes(2.0, 4)).assertEqual(false);
      expect(arr.includes(1.0, -1)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0057
     * @tc.desc   Test Float64Array with zero length buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(0);
      const arr = new Float64Array(buffer);

      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0058
     * @tc.desc   Test Float64Array with modified buffer byteLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(16);
      const arr = new Float64Array(buffer);

      arr[0] = 1.0;
      arr[1] = 2.0;


      const arr2 = new Float64Array(buffer, 0, 1);

      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(1.0);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0059
     * @tc.desc   Test Float64Array sort stability
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const values = [3.0, 1.0, 2.0, 2.0, 1.0];
      const arr = new Float64Array(values);
      const originalIndices: number[] = [];
      arr.forEach((val, index) => {
        if (val === 2.0) {
          originalIndices.push(index);
        }
      });
      arr.sort((a, b) => a - b);
      const sortedIndices: number[] = [];
      arr.forEach((val, index) => {
        if (val === 2.0) {
          sortedIndices.push(index);
        }
      });
      expect(originalIndices.length).assertEqual(sortedIndices.length);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0060
     * @tc.desc   Test Float64Array with maximum length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const size = 1024;
      const arr = new Float64Array(size);

      for (let i = 0; i < size; i++) {
        arr[i] = i * 0.1;
      }

      expect(arr.length).assertEqual(size);
      expect(approxEqual(arr[size - 1], (size - 1) * 0.1)).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0061
     * @tc.desc   Verify Float64Array interaction with ArrayBuffer transfer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(32);
      const float64Arr = new Float64Array(buffer);
      float64Arr[0] = 100.123;
      float64Arr[1] = 200.456;

     const transferredArr = new Float64Array(buffer);

      transferredArr[0] = 150.789;
      expect(approxEqual(float64Arr[0], 150.789)).assertEqual(true);
      expect(float64Arr.byteLength).assertEqual(32);
      expect(transferredArr.byteLength).assertEqual(32);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0064
     * @tc.desc   Verify Float64Array behavior with structured cloning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const original = new Float64Array([10.1, 20.2, 30.3]);

      const cloned = new Float64Array(original.buffer.slice(0));

      expect(cloned.length).assertEqual(original.length);
      expect(approxEqual(cloned[0], original[0])).assertEqual(true);

      cloned[1] = 99.9;
      expect(approxEqual(original[1], 20.2)).assertEqual(true);
      expect(approxEqual(cloned[1], 99.9)).assertEqual(true);

      const subOriginal = original.subarray(1, 3);
      const clonedSub = new Float64Array(subOriginal.buffer.slice(subOriginal.byteOffset,
        subOriginal.byteOffset + subOriginal.byteLength));
      expect(clonedSub.length).assertEqual(2);
      expect(approxEqual(clonedSub[0], 20.2)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0065
     * @tc.desc   Verify Float64Array handling of maximum safe integer values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const maxSafeInt = Number.MAX_SAFE_INTEGER;
      const arr = new Float64Array(4);
      arr[0] = maxSafeInt;
      arr[1] = maxSafeInt + 1;
      arr[2] = maxSafeInt - 1;
      arr[3] = Number.MIN_SAFE_INTEGER;
      expect(arr[0]).assertEqual(maxSafeInt);
      expect(arr[1]).assertEqual(maxSafeInt + 2);
      expect(arr[2]).assertEqual(maxSafeInt - 1);
      expect(arr[3]).assertEqual(Number.MIN_SAFE_INTEGER);
      const largeFloat = 123456789012345.6789;
      arr[0] = largeFloat;
      expect(approxEqual(arr[0], largeFloat, 0.0001)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0067
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0067
     * @tc.desc   Verify Float64Array behavior with zero-length buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const zeroBuffer = new ArrayBuffer(0);
      const arr1 = new Float64Array(zeroBuffer);
      expect(arr1.length).assertEqual(0);
      expect(arr1.byteLength).assertEqual(0);
      expect(arr1.byteOffset).assertEqual(0);
      const arr2 = new Float64Array(0);
      expect(arr2.length).assertEqual(0);
      expect(arr2.byteLength).assertEqual(0);
      expect(arr2.map((val) => val * 2).length).assertEqual(0);
      expect(arr2.filter((val) => val > 0).length).assertEqual(0);
      const sub = arr2.subarray(0, 0);
      expect(sub.length).assertEqual(0);
      let errorThrown = false;
      try {
        arr2.set(new Float64Array(0));
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(false);
      errorThrown = false;
      try {
        arr2.set(new Float64Array(1));
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0068
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0068
     * @tc.desc   Verify Float64Array handling of floating-point precision edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(5);
      arr[0] = 0.1;
      arr[1] = 0.2;
      const sum = arr[0] + arr[1];
      expect(sum.toString()).assertEqual('0.30000000000000004');
      expect(approxEqual(sum, 0.3, 0.000000000000001)).assertEqual(true);
      arr[2] = Number.EPSILON;
      arr[3] = Number.EPSILON / 2;
      expect(arr[2]).assertEqual(2.220446049250313e-16);
      expect(arr[3]).assertEqual(1.1102230246251565e-16);
      arr[0] = 256.0;
      arr[1] = 1024.0;
      arr[2] = 1 / 16;
      expect(arr[0]).assertEqual(256.0);
      expect(arr[1]).assertEqual(1024.0);
      expect(arr[2]).assertEqual(0.0625);
      const denormal = 1e-323;
      arr[4] = denormal;
      expect(arr[4]).assertEqual(1e-323);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0070
     * @tc.desc   Verify Float64Array behavior with overlapping subarray operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const baseArr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const sub1 = baseArr.subarray(1, 4);
      const sub2 = baseArr.subarray(2, 5);
      sub1[1] = 30.0;
      expect(baseArr[2]).assertEqual(30.0);
      expect(sub1[1]).assertEqual(30.0);
      expect(sub2[0]).assertEqual(30.0);
      sub2[2] = 50.0;
      expect(baseArr[4]).assertEqual(50.0);
      expect(sub2[2]).assertEqual(50.0);
      expect(sub1.length).assertEqual(3);
      expect(sub1[2]).assertEqual(4.0);
      sub1.set([20.0, 21.0, 22.0]);
      expect(baseArr.slice(1, 4).toString()).assertEqual('20,21,22');
      expect(sub2.slice(0, 2).toString()).assertEqual('21,22');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0071
     * @tc.desc   Verify Float64Array handling of large value ranges (exponents)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(6);
      arr[0] = Number.MIN_VALUE;
      arr[1] = Number.MAX_VALUE;
      arr[2] = 1e-300;
      arr[3] = 1e+300;
      arr[4] = Number.MIN_VALUE / 2;
      arr[5] = -Number.MAX_VALUE;
      expect(arr[0]).assertEqual(5e-324);
      expect(arr[1]).assertEqual(1.7976931348623157e+308);
      expect(approxEqual(arr[2], 1e-300, 1e-310)).assertEqual(true);
      expect(approxEqual(arr[3], 1e+300, 1e+288)).assertEqual(true);
      expect(arr[4]).assertEqual(0.0);
      expect(arr[5]).assertEqual(-1.7976931348623157e+308);
      const overflowVal = Number.MAX_VALUE * 2;
      arr[0] = overflowVal;
      expect(arr[0]).assertEqual(Infinity);
      const underflowVal = -Number.MAX_VALUE * 2;
      arr[1] = underflowVal;
      expect(arr[1]).assertEqual(-Infinity);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0072
     * @tc.desc   Verify Float64Array compatibility with ArrayBuffer.slice (buffer duplication)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const original = new Float64Array([10.5, 20.5, 30.5, 40.5]);
      const originalBuffer = original.buffer;
      const slicedBuffer = originalBuffer.slice(0);
      const duplicatedArr = new Float64Array(slicedBuffer);
      expect(original.toString()).assertEqual(duplicatedArr.toString());
      duplicatedArr[1] = 200.5;
      expect(original[1]).assertEqual(20.5);
      expect(duplicatedArr[1]).assertEqual(200.5);
      const partialBuffer = originalBuffer.slice(8, 24);
      const partialArr = new Float64Array(partialBuffer);
      expect(partialArr.length).assertEqual(2);
      expect(partialArr[0]).assertEqual(20.5);
      expect(partialArr[1]).assertEqual(30.5);
      partialArr[0] = 2000.5;
      expect(original[1]).assertEqual(20.5);
      expect(partialArr[0]).assertEqual(2000.5);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0073
     * @tc.desc   Verify Float64Array iteration with for...of and entries()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([1.1, 2.2, 3.3, 4.4]);
      const values: number[] = [];
      const indices: number[] = [];
      for (const val of arr) {
        values.push(val);
      }
      expect(values.length).assertEqual(4);
      expect(approxEqual(values[0], 1.1)).assertEqual(true);
      expect(approxEqual(values[3], 4.4)).assertEqual(true);
      for (const item of arr.entries()) {
        indices.push(item[0]);
        values.push(item[1]);
      }
      expect(indices.toString()).assertEqual('0,1,2,3');
      expect(approxEqual(values[4], 1.1)).assertEqual(true);
      expect(approxEqual(values[7], 4.4)).assertEqual(true);
      const keyList = Array.from(arr.keys());
      expect(keyList.toString()).assertEqual('0,1,2,3');
      const valueList = Array.from(arr.values());
      expect(valueList.length).assertEqual(4);
      expect(approxEqual(valueList[2], 3.3)).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0074
     * @tc.desc   Verify Float64Array handling of NaN equality in array methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([1.0, NaN, 3.0, NaN, 5.0]);
      expect(arr.indexOf(NaN)).assertEqual(-1);
      expect(arr.indexOf(3.0)).assertEqual(2);
      expect(arr.lastIndexOf(NaN)).assertEqual(-1);
      expect(arr.lastIndexOf(1.0)).assertEqual(0);
      expect(arr.includes(NaN)).assertEqual(true);
      expect(arr.includes(4.0)).assertEqual(false);
      const foundNaN = arr.find(val => isNaN(val));
      expect(isNaN(foundNaN!)).assertEqual(true);
      const nanFiltered = arr.filter(val => isNaN(val));
      expect(nanFiltered.length).assertEqual(2);
      expect(isNaN(nanFiltered[0])).assertEqual(true);
      expect(isNaN(nanFiltered[1])).assertEqual(true);
      const hasNaN = arr.some(val => isNaN(val));
      expect(hasNaN).assertEqual(true);
      const allNaN = arr.every(val => isNaN(val));
      expect(allNaN).assertEqual(false);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0075
     * @tc.desc   Verify Float64Array behavior with byteOffset and length parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(64);
      const fullArr = new Float64Array(buffer);
      for (let i = 0; i < fullArr.length; i++) {
        fullArr[i] = i * 10.0;
      }
      const offsetArr = new Float64Array(buffer, 16);
      expect(offsetArr.length).assertEqual(6);
      expect(offsetArr[0]).assertEqual(20.0);
      expect(offsetArr[5]).assertEqual(70.0);
      const offsetLenArr = new Float64Array(buffer, 8, 3);
      expect(offsetLenArr.length).assertEqual(3);
      expect(offsetLenArr[0]).assertEqual(10.0);
      expect(offsetLenArr[1]).assertEqual(20.0);
      expect(offsetLenArr[2]).assertEqual(30.0);
      expect(offsetArr.byteOffset).assertEqual(16);
      expect(offsetLenArr.byteOffset).assertEqual(8);
      offsetLenArr[1] = 200.0;
      expect(fullArr[2]).assertEqual(200.0);
      expect(offsetArr[0]).assertEqual(200.0);
      let errorThrown = false;
      try {
        new Float64Array(buffer, 12);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
      try {
        const emptyOffsetArr = new Float64Array(buffer, 100);
        expect(emptyOffsetArr.length).assertEqual(0);
      } catch (e) {
        expect(e.message).assertContain('The offset cannot be an integral multiple of elementSize.')
      }
    })

    /**
     * @tc.name   TypeArrayFloat64Array0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0076
     * @tc.desc   Verify Float64Array compatibility with DataView for mixed-type buffer access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(40);
      const float64Arr = new Float64Array(buffer, 0, 4);
      const dv = new DataView(buffer);
      float64Arr[0] = 1.234;
      float64Arr[1] = 5.678;
      float64Arr[2] = 9.012;
      float64Arr[3] = 3.456;
      expect(approxEqual(dv.getFloat64(0), 1.234)).assertEqual(false);
      expect(approxEqual(dv.getFloat64(16), 9.012)).assertEqual(false);
      dv.setInt32(32, 12345);
      dv.setUint16(36, 6789);
      expect(approxEqual(float64Arr[3], 3.456)).assertEqual(true);
      dv.setFloat64(8, 55.555, true);
      expect(approxEqual(float64Arr[1], 55.555)).assertEqual(true);
      const floatBytes = new Uint8Array(buffer, 0, 8);
      const dvBytes = new Uint8Array(buffer, 0, 8);
      expect(floatBytes.toString()).assertEqual(dvBytes.toString());
    })
    /**
     * @tc.name   TypeArrayFloat64Array0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0078
     * @tc.desc   Verify Float64Array behavior with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([0.5, 1.5, 2.5, 3.5]);
      const iterator = arr[Symbol.iterator]();
      let result = iterator.next();
      expect(result.done).assertEqual(false);
      expect(approxEqual(result.value, 0.5)).assertEqual(true);
      result = iterator.next();
      expect(result.done).assertEqual(false);
      expect(approxEqual(result.value, 1.5)).assertEqual(true);
      iterator.next();
      iterator.next();
      result = iterator.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
      const spreadArr = [...arr];
      expect(Array.isArray(spreadArr)).assertEqual(true);
      expect(spreadArr.length).assertEqual(4);
      expect(approxEqual(spreadArr[3], 3.5)).assertEqual(true);
      const fromArr = Array.from(arr);
      expect(fromArr.toString()).assertEqual('0.5,1.5,2.5,3.5');
      const iterator1 = arr[Symbol.iterator]();
      const iterator2 = arr[Symbol.iterator]();
      expect(iterator1.next().value).assertEqual(0.5);
      expect(iterator2.next().value).assertEqual(0.5);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0079
     * @tc.desc   Verify Float64Array handling of floating-point signed zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(4);
      arr[0] = 0.0;
      arr[1] = -0.0;
      arr[2] = 1.0 / Infinity;
      arr[3] = -1.0 / Infinity;
      expect(arr[0] === arr[1]).assertEqual(true);
      expect(arr[2] === arr[3]).assertEqual(true);
      expect(1.0 / arr[0]).assertEqual(Infinity);
      expect(1.0 / arr[1]).assertEqual(-Infinity);
      expect(1.0 / arr[2]).assertEqual(Infinity);
      expect(1.0 / arr[3]).assertEqual(-Infinity);
      arr[0] = arr[0] + arr[1];
      arr[1] = arr[3] * -1;
      const dv = new DataView(arr.buffer);
      const posZeroBytes = dv.getUint32(0);
      const negZeroBytes = dv.getUint32(8);
      expect(posZeroBytes !== negZeroBytes).assertEqual(false);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0081
     * @tc.desc   Verify Float64Array behavior with buffer resizing (via TypedArray constructor)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(32);
      const arr1 = new Float64Array(buffer);
      arr1.set([10.0, 20.0, 30.0, 40.0]);
      const arr2 = new Float64Array(buffer, 0, 2);
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(10.0);
      expect(arr2[1]).assertEqual(20.0);
      arr2[0] = 100.0;
      expect(arr1[0]).assertEqual(100.0);
      const arr3 = new Float64Array(6);
      arr3.set(arr1);
      expect(arr3.length).assertEqual(6);
      expect(arr3[3]).assertEqual(40.0);
      expect(arr3[4]).assertEqual(0.0);
      arr3[0] = 200.0;
      expect(arr1[0]).assertEqual(100.0);
      const subArr = arr1.subarray(1, 3);
      const resizedArr = new Float64Array(subArr.length + 2);
      resizedArr.set(subArr, 1);
      resizedArr[0] = 5.0;
      resizedArr[3] = 35.0;
      expect(resizedArr.toString()).assertEqual('5,20,30,35');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0082
     * @tc.desc   Verify Float64Array handling of non-integer length in constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr1 = new Float64Array(3.9);
      expect(arr1.length).assertEqual(3);
      expect(arr1.byteLength).assertEqual(24);
      const arr2 = new Float64Array(5.1);
      expect(arr2.length).assertEqual(5);
      expect(arr2.byteLength).assertEqual(40);
      let errorThrown = false;
      try {
        new Float64Array(-2.5);
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(errorThrown).assertEqual(true);
      const buffer = new ArrayBuffer(64);
      const arr3 = new Float64Array(buffer, 0, 7.8);
      expect(arr3.length).assertEqual(7);
      expect(arr3.byteLength).assertEqual(56);
      const arr4 = new Float64Array(buffer, 16, 4.2);
      expect(arr4.length).assertEqual(4);
      expect(arr4.byteOffset).assertEqual(16);
      expect(arr4.byteLength).assertEqual(32);
      errorThrown = false;
      try {
        new Float64Array(buffer, 12.5);
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(errorThrown).assertEqual(true);
      const arr5 = new Float64Array(buffer, 16.0);
      expect(arr5.byteOffset).assertEqual(16);
      expect(arr5.length).assertEqual(6);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0083
     * @tc.desc   Verify Float64Array compatibility with Math functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat64Array0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float64Array([Math.PI, Math.E, -Math.PI / 2, 0.0, 1.0, -1.0]);
      const absArr = arr.map(val => Math.abs(val));
      expect(approxEqual(absArr[2], Math.PI / 2)).assertEqual(true);
      expect(absArr[5]).assertEqual(1.0);
      const sqrtArr = arr.map(val => val >= 0 ? Math.sqrt(val) : NaN);
      expect(approxEqual(sqrtArr[0], Math.sqrt(Math.PI))).assertEqual(true);
      expect(isNaN(sqrtArr[2])).assertEqual(true);
      const expArr = arr.map(val => Math.exp(val));
      const logArr = arr.map(val => val > 0 ? Math.log(val) : NaN);
      expect(approxEqual(expArr[3], 1.0)).assertEqual(true);
      expect(approxEqual(logArr[4], 0.0)).assertEqual(true);
      expect(isNaN(logArr[2])).assertEqual(true);
      const maxVal = Math.max(...arr);
      const minVal = Math.min(...arr);
      expect(approxEqual(maxVal, Math.PI)).assertEqual(true);
      expect(approxEqual(minVal, -Math.PI / 2)).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0084
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0084
     * @tc.desc   Verify Float64Array behavior with nested TypedArray views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const parentBuffer = new ArrayBuffer(96);
      const parentArr = new Float64Array(parentBuffer);
      for (let i = 0; i < parentArr.length; i++) {
        parentArr[i] = i * 1.0;
      }
      const subArr2 = parentArr.subarray(4, 8);
      const subArr3 = parentArr.subarray(8, 12);
      const nestedSub1 = subArr2.subarray(1, 3);
      const nestedSub2 = subArr3.subarray(0, 2);
      expect(nestedSub1[0]).assertEqual(5.0);
      expect(nestedSub1[1]).assertEqual(6.0);
      expect(nestedSub2[1]).assertEqual(9.0);
      nestedSub1[0] = 55.0;
      expect(subArr2[1]).assertEqual(55.0);
      expect(parentArr[5]).assertEqual(55.0);
      parentArr[9] = 99.0;
      expect(subArr3[1]).assertEqual(99.0);
      expect(nestedSub2[1]).assertEqual(99.0);
      expect(nestedSub2.byteOffset).assertEqual(64);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0088
     * @tc.desc   Verify Float64Array handling of time-related values (timestamps)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(5);
      const now = Date.now();
      const yesterday = now - 86400000;
      const tomorrow = now + 86400000;
      arr[0] = now;
      arr[1] = yesterday;
      arr[2] = tomorrow;
      expect(arr[0]).assertEqual(now);
      expect(arr[1]).assertEqual(yesterday);
      expect(arr[2]).assertEqual(tomorrow);
      const nowDate = new Date(arr[0]);
      const yesterdayDate = new Date(arr[1]);
      expect(nowDate.getTime()).assertEqual(now);
      expect(yesterdayDate.getTime()).assertEqual(yesterday);
      const microTimestamp = 1717248000000123;
      arr[3] = microTimestamp;
      expect(arr[3]).assertEqual(microTimestamp);
      const largeTimestamp = 9007199254740993000;
      arr[4] = largeTimestamp;
      expect(arr[4]).assertEqual(largeTimestamp);
      expect(arr[4]).assertEqual(9007199254740993000);
      const largeDate = new Date(arr[4]);
      expect(String(largeDate.getTime())).assertEqual('NaN');
    })
    /**
     * @tc.name   TypeArrayFloat64Array0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0089
     * @tc.desc   Verify Float64Array compatibility with WebGL buffer usage (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const vertexData = new Float64Array([
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0,
        -1.0, 1.0, 0.0,
        1.0, 1.0, 0.0
      ]);
      expect(vertexData.byteLength).assertEqual(96);
      expect(vertexData.BYTES_PER_ELEMENT).assertEqual(8);
      expect(vertexData.length % 3).assertEqual(0);
      vertexData[1] = -0.5;
      vertexData[7] = 0.5;
      expect(vertexData[1]).assertEqual(-0.5);
      expect(vertexData[7]).assertEqual(0.5);
      const firstTwoVertices = vertexData.subarray(0, 6);
      expect(firstTwoVertices.toString()).assertEqual('-1,-0.5,0,1,-1,0');
      firstTwoVertices[3] = 0.8;
      expect(vertexData[3]).assertEqual(0.8);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0090
     * @tc.desc   Verify Float64Array handling of scientific notation values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(6);
      arr[0] = 1.23e5;
      arr[1] = 4.56e-3;
      arr[2] = -7.89e2;
      arr[3] = 1e30;
      arr[4] = 2.5e-20;
      arr[5] = -3.14e-1;
      expect(arr[0]).assertEqual(123000);
      expect(approxEqual(arr[1], 0.00456)).assertEqual(true);
      expect(arr[2]).assertEqual(-789);
      expect(arr[3]).assertEqual(1e30);
      expect(approxEqual(arr[4], 2.5e-20)).assertEqual(true);
      expect(arr[5]).assertEqual(-0.314);
      const sum = arr[0] + arr[2];
      expect(sum).assertEqual(122211);
      const product = arr[1] * arr[3];
      expect(approxEqual(product, 4.56e27)).assertEqual(false);
      expect(arr[4].toString()).assertEqual('2.5e-20');
      expect(arr[3].toString()).assertEqual('1e+30');
    })
    /**
     * @tc.name   TypeArrayFloat64Array0093
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0093
     * @tc.desc   Verify Float64Array handling of bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 15.0, 16.0]);
      const bitwiseAnd = arr.map(val => val & 0b1010);
      expect(bitwiseAnd.toString()).assertEqual('0,2,2,0,10,0');
      const bitwiseOr = arr.map(val => val | 0b1000);
      expect(bitwiseOr.toString()).assertEqual('9,10,11,12,15,24');
      const bitwiseXor = arr.map(val => val ^ 0b1111);
      expect(bitwiseXor.toString()).assertEqual('14,13,12,11,0,31');
      const leftShift = arr.map(val => val << 2);
      expect(leftShift.toString()).assertEqual('4,8,12,16,60,64');
      const rightShift = arr.map(val => val >> 1);
      expect(rightShift.toString()).assertEqual('0,1,1,2,7,8');
      expect(arr.toString()).assertEqual('1,2,3,4,15,16');
      const nonIntegerArr = new Float64Array([1.9, 2.5, 3.1415]);
      const truncatedShift = nonIntegerArr.map(val => val << 1);
      expect(truncatedShift.toString()).assertEqual('2,4,6');
      const bitwiseNot = arr.map(val => ~val);
      expect(bitwiseNot.toString()).assertEqual('-2,-3,-4,-5,-16,-17');
    })

    /**
     * @tc.name   TypeArrayFloat64Array0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0095
     * @tc.desc   Verify Float64Array compatibility with typed array constructors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const float64Arr = new Float64Array([1.1, 2.2, 3.3, 4.4]);
      const int8Arr = new Int8Array(float64Arr.buffer);
      const uint16Arr = new Uint16Array(float64Arr.buffer);
      const float32Arr = new Float32Array(float64Arr.buffer);
      expect(float64Arr.byteLength).assertEqual(32);
      expect(int8Arr.byteLength).assertEqual(32);
      expect(int8Arr.length).assertEqual(32);
      expect(uint16Arr.length).assertEqual(16);
      expect(float32Arr.length).assertEqual(8);
      float64Arr[0] = 100.1;
      expect(int8Arr[0].toString()).assertEqual('102');
      const convertedBack = new Float64Array(float32Arr.buffer, 0, 4);
      expect(convertedBack.length).assertEqual(4);
      expect(approxEqual(convertedBack[0], 100.1, 0.1)).assertEqual(true);
      const mixedBuffer = new ArrayBuffer(16);
      const uint32Part = new Uint32Array(mixedBuffer, 0, 2);
      const float64Part = new Float64Array(mixedBuffer, 8, 1);
      uint32Part[0] = 0x12345678;
      float64Part[0] = 987.654;
      const fullFloat64 = new Float64Array(mixedBuffer);
      expect(fullFloat64.length).assertEqual(2);
      expect(isNaN(fullFloat64[0])).assertEqual(false);
      expect(approxEqual(fullFloat64[1], 987.654)).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0097
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0097
     * @tc.desc   Verify Float64Array behavior with RegExp when converting to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([12.34, 56.78, 90.12, 34.56, 78.90]);
      const arrStr = arr.toString();
      expect(arrStr).assertEqual('12.34,56.78,90.12,34.56,78.9');
      const has5678 = /56\.78/.test(arrStr);
      expect(has5678).assertEqual(true);
      const has100 = /100/.test(arrStr);
      expect(has100).assertEqual(false);
      const valueRegex = /\d+\.\d+/g;
      const matches = arrStr.match(valueRegex);
      expect(matches?.toString()).assertEqual('12.34,56.78,90.12,34.56,78.9');
      expect(matches!.length).assertEqual(5);
      expect(matches![2]).assertEqual('90.12');
      const replacedStr = arrStr.replace(/\d+\.\d+/g, (match) => {
        return (parseFloat(match) * 2).toString();
      });
      expect(replacedStr).assertEqual('24.68,113.56,180.24,69.12,157.8');
      expect(arr.toString()).assertEqual('12.34,56.78,90.12,34.56,78.9');
      const specialArr = new Float64Array([NaN, Infinity, -Infinity, 0.0]);
      const specialStr = specialArr.toString();
      expect(specialStr).assertEqual('NaN,Infinity,-Infinity,0');
      expect(/NaN/.test(specialStr)).assertEqual(true);
      expect(/Infinity/.test(specialStr)).assertEqual(true);
      expect(/-Infinity/.test(specialStr)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat64Array0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0100
     * @tc.desc   Verify Float64Array behavior with very large arrays (memory constraints)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const largeSize = 1000000;
      const largeArr = new Float64Array(largeSize);
      expect(largeArr.length).assertEqual(largeSize);
      expect(largeArr.byteLength).assertEqual(largeSize * 8);
      for (let i = 0; i < largeSize; i++) {
        largeArr[i] = i * 0.001;
      }
      expect(approxEqual(largeArr[0], 0.0)).assertEqual(true);
      expect(approxEqual(largeArr[largeSize - 1], 999.999)).assertEqual(true);
      expect(approxEqual(largeArr[500000], 500.0)).assertEqual(true);
      const sum = largeArr.reduce((acc, val) => acc + val, 0);
      const expectedSum = (largeSize * (largeSize - 1) / 2) * 0.001;
      expect(approxEqual(sum, expectedSum, 1.0)).assertEqual(true);
      const largeSub = largeArr.subarray(1000, 2000);
      expect(largeSub.length).assertEqual(1000);
      expect(approxEqual(largeSub[0], 1.0)).assertEqual(true);
      let didThrow = false;
      try {
        for (let i = 0; i < 1000; i++) {
          const idx = Math.floor(Math.random() * largeSize);
          largeArr[idx] += 0.0001;
        }
      } catch (e) {
        didThrow = true;
      }
      expect(didThrow).assertEqual(false);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0110
     * @tc.desc   Verify Float64Array handling of numeric separators in assignments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(6);
      arr[0] = 1_000_000.123_456;
      arr[1] = 123_456.789;
      arr[2] = 0.000_001_234;
      arr[3] = 123_456_789;
      arr[4] = -987_654.321;
      arr[5] = 1_234_567.890_123_456;
      expect(arr[0]).assertEqual(1000000.123456);
      expect(arr[1]).assertEqual(123456.789);
      expect(approxEqual(arr[2], 0.000001234)).assertEqual(true);
      expect(arr[3]).assertEqual(123456789);
      expect(arr[4]).assertEqual(-987654.321);
      expect(approxEqual(arr[5], 1234567.890123456)).assertEqual(true);
      const sum = arr[1] + arr[3];
      expect(sum).assertEqual(123456.789 + 123456789);
      const product = arr[2] * arr[0];
      expect(approxEqual(product, 0.000001234 * 1000000.123456)).assertEqual(true);
      expect(arr[3].toString()).assertEqual('123456789');
      expect(arr[0].toString()).assertEqual('1000000.123456');
    })
    /**
     * @tc.name   TypeArrayFloat64Array0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0113
     * @tc.desc   Verify Float64Array handling of weak references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      if (typeof WeakRef === 'undefined' || typeof FinalizationRegistry === 'undefined') {
        console.log('WeakRef not supported, skipping test');
        return;
      }
      let arr = new Float64Array([1.1, 2.2, 3.3]);
      const weakRef = new WeakRef(arr);
      let finalized = false;
      expect(weakRef.deref()!.toString()).assertEqual('1.1,2.2,3.3');
      arr = new Float64Array();
      expect(finalized).assertEqual(false);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0115
     * @tc.desc   Verify Float64Array handling of array buffer concatenation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr1 = new Float64Array([1.1, 2.2, 3.3]);
      const arr2 = new Float64Array([4.4, 5.5, 6.6]);
      const combinedBuffer = new ArrayBuffer(arr1.byteLength + arr2.byteLength);
      const combinedArr = new Float64Array(combinedBuffer);
      combinedArr.set(arr1);
      combinedArr.set(arr2, arr1.length);
      expect(combinedArr.length).assertEqual(6);
      expect(combinedArr.toString()).assertEqual('1.1,2.2,3.3,4.4,5.5,6.6');
      expect(arr1.toString()).assertEqual('1.1,2.2,3.3');
      expect(arr2.toString()).assertEqual('4.4,5.5,6.6');
      const arr3 = new Float64Array([7.7, 8.8]);
      const totalLength = arr1.length + arr2.length + arr3.length;
      const totalCombined = new Float64Array(totalLength);
      let offset = 0;
      totalCombined.set(arr1, offset);
      offset += arr1.length;
      totalCombined.set(arr2, offset);
      offset += arr2.length;
      totalCombined.set(arr3, offset);
      expect(totalCombined.toString()).assertEqual('1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8');
      const emptyArr = new Float64Array(0);
      const withEmpty = new Float64Array(arr1.length + emptyArr.length);
      withEmpty.set(arr1);
      withEmpty.set(emptyArr, arr1.length);
      expect(withEmpty.toString()).assertEqual(arr1.toString());
    })
    /**
     * @tc.name   TypeArrayFloat64Array0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0116
     * @tc.desc   Verify Float64Array behavior with Math.hypot for vector calculations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const vectors2D = new Float64Array([
        3.0, 4.0,
        5.0, 12.0,
        0.0, 0.0
      ]);
      const vectors3D = new Float64Array([
        1.0, 2.0, 2.0,
        8.0, 6.0, 0.0
      ]);
      const magnitudes2D: number[] = [];
      for (let i = 0; i < vectors2D.length; i += 2) {
        magnitudes2D.push(Math.hypot(vectors2D[i], vectors2D[i + 1]));
      }
      const magnitudes3D: number[] = [];
      for (let i = 0; i < vectors3D.length; i += 3) {
        magnitudes3D.push(Math.hypot(vectors3D[i], vectors3D[i + 1], vectors3D[i + 2]));
      }
      expect(magnitudes2D[0]).assertEqual(5.0);
      expect(magnitudes2D[1]).assertEqual(13.0);
      expect(magnitudes2D[2]).assertEqual(0.0);
      expect(magnitudes3D[0]).assertEqual(3.0);
      expect(magnitudes3D[1]).assertEqual(10.0);
      const negativeVector = new Float64Array([-3.0, -4.0]);
      const negativeMagnitude = Math.hypot(negativeVector[0], negativeVector[1]);
      expect(negativeMagnitude).assertEqual(5.0);
      const largeVector = new Float64Array([1e300, 1e300]);
      const largeMagnitude = Math.hypot(largeVector[0], largeVector[1]);
      const expectedLarge = 1e300 * Math.SQRT2;
      expect(approxEqual(largeMagnitude, expectedLarge)).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0119
     * @tc.desc   Verify Float64Array behavior with error handling in array methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      let errorThrown = false;
      try {
        arr.map((val) => {
          if (val === 3.0) {
            throw new Error('Value is 3.0');
          }
          return val * 2;
        });
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Value is 3.0');
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        arr.forEach((val) => {
          if (val === 2.0) {
            throw new Error('Value is 2.0');
          }
        });
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Value is 2.0');
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        arr.reduce((acc, val) => {
          if (val === 4.0) {
            throw new Error('Final value reached');
          }
          return acc + val;
        }, 0);
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Final value reached');
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        arr.find((val) => {
          if (val > 3.0) {
            throw new Error('Value exceeds 3.0');
          }
          return false;
        });
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Value exceeds 3.0');
      }
      expect(errorThrown).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayFloat64Array0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT64ARRAY_0120
     * @tc.desc   Verify Float64Array handling of very small positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayFloat64Array0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const arr = new Float64Array(8);
      arr[0] = 1e-300;
      arr[1] = 1e-305;
      arr[2] = 1e-320;
      arr[3] = Number.MIN_VALUE;
      arr[4] = -1e-300;
      arr[5] = -1e-305;
      arr[6] = -1e-320;
      arr[7] = -Number.MIN_VALUE;
      expect(arr[0]).assertEqual(1e-300);
      expect(arr[1]).assertEqual(1e-305);
      expect(arr[2]).assertEqual(1e-320);
      expect(arr[3]).assertEqual(5e-324);
      expect(arr[4]).assertEqual(-1e-300);
      expect(arr[5]).assertEqual(-1e-305);
      expect(arr[6]).assertEqual(-1e-320);
      expect(arr[7]).assertEqual(-5e-324);
      const sumSmall = arr[0] + arr[3];
      expect(approxEqual(sumSmall, 1e-300 + 2.2250738585072014e-308)).assertEqual(true);
      const productSmall = arr[1] * 2;
      expect(approxEqual(productSmall, 2e-305)).assertEqual(true);
      expect(arr[0] > arr[1]).assertEqual(true);
      expect(arr[2] < arr[3]).assertEqual(false);
      expect(arr[6] < arr[5]).assertEqual(false);
      const underflow = arr[3] / 1e20;
      expect(underflow).assertEqual(0);
    })
  })
}


function approxEqual(a: number, b: number, epsilon: number = 0.0000001): boolean {
  return Math.abs(a - b) < epsilon;
}