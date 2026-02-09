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

export default function typeArrayFloat32ArrayTest() {
  describe('TypeArrayFloat32ArrayTest', () => {
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
     * @tc.name   TypeArrayFloat32ArrayBufferDv0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0001
     * @tc.desc   Verify the basic properties of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const length = 5;
      const arr = new Float32Array(length);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.length).assertEqual(length);
      expect(arr.byteLength).assertEqual(length * 4);
      expect(arr.buffer.byteLength).assertEqual(length * 4);
      expect(arr.byteOffset).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0002
     * @tc.desc   Verify Float32Array creation from different data sources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new Float32Array(3)
      expect(arr1.length).assertEqual(3)
      const arr2 = new Float32Array([1.5, 2.5, 3.5])
      expect(arr2.length).assertEqual(3)
      expect(arr2.toString()).assertEqual('1.5,2.5,3.5')
      const arr3 = new Float32Array(arr2)
      expect(arr3.length).assertEqual(3)
      expect(arr3.toString()).assertEqual('1.5,2.5,3.5')
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0003
     * @tc.desc   Verify the relationship between Float32Array and ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16)
      const arr = new Float32Array(buffer)
      arr[0] = 1.0
      arr[1] = 2.0
      const view = new DataView(buffer)
      expect(view.getFloat32(0)).assertEqual(4.600602988224807e-41)
      expect(view.getFloat32(4)).assertEqual(8.96831017167883e-44)
      view.setFloat32(8, 3.0)
      expect(arr[2]).assertEqual(2.304855714121459e-41)
      expect(arr[3]).assertEqual(0)
      expect(arr.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0004
     * @tc.desc   Verify the interaction between Float32Array and SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(12)
      const arr = new Float32Array(sab)
      arr[0] = 10.5
      arr[1] = 20.5
      arr[2] = 30.5
      const arr2 = new Float32Array(sab)
      expect(arr2.toString()).assertEqual('10.5,20.5,30.5')
      arr[1] = 25.5
      expect(arr2[1]).assertEqual(25.5)
      expect(arr2.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0005
     * @tc.desc   Verify the set method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array(5);
      const source = new Float32Array([1.1, 2.2, 3.3]);
      arr.set(source, 1);
      expect(arr.toString()).assertEqual('0,1.100000023841858,2.200000047683716,3.299999952316284,0');
      arr.set([4.4, 5.5], 3);
      expect(arr.toString()).assertEqual('0,1.100000023841858,2.200000047683716,4.400000095367432,5.5');
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0006
     * @tc.desc   Verify the subarray method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      sub[0] = 20.0;
      expect(arr.toString()).assertEqual('1,20,3,4,5');
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0007
     * @tc.desc   Verify the slice method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0])
      const slice = arr.slice(1, 4)
      expect(slice.toString()).assertEqual('2,3,4')
      expect(slice.length).assertEqual(3)
      slice[0] = 20.0
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0008
     * @tc.desc   Verify the reverse method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.reverse();
      expect(arr.toString()).assertEqual('4,3,2,1');
      expect(arr.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0009
     * @tc.desc   Verify the sort method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([3.0, 1.0, 4.0, 2.0]);
      arr.sort((a, b) => a - b);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0010
     * @tc.desc   Verify the fill method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.fill(0.0);
      expect(arr.toString()).assertEqual('0,0,0,0,0');
      expect(arr.length).assertEqual(5)
      arr.fill(10.0, 1, 4);
      expect(arr.toString()).assertEqual('0,10,10,10,0');
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0011
     * @tc.desc   Verify the copyWithin method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.copyWithin(0, 3, 5);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0012
     * @tc.desc   Verify the indexOf method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([10.5, 20.5, 30.5, 20.5, 10.5]);

      expect(arr.indexOf(20.5)).assertEqual(1);
      expect(arr.indexOf(40.5)).assertEqual(-1);
      expect(arr.indexOf(10.5, 2)).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0013
     * @tc.desc   Verify the lastIndexOf method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([10.5, 20.5, 30.5, 20.5, 10.5]);

      expect(arr.lastIndexOf(20.5)).assertEqual(3);
      expect(arr.lastIndexOf(40.5)).assertEqual(-1);
      expect(arr.lastIndexOf(10.5, 3)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0014
     * @tc.desc   Verify the includes method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      expect(arr.includes(3.0)).assertEqual(true);
      expect(arr.includes(6.0)).assertEqual(false);
      expect(arr.includes(2.0, 2)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0015
     * @tc.desc   Verify the forEach method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let sum = 0;

      arr.forEach(val => {
        sum += val;
      });

      expect(sum).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0016
     * @tc.desc   Verify the map method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const mapped = arr.map(val => val * 2);

      expect(mapped.toString()).assertEqual('2,4,6');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0017
     * @tc.desc   Verify the filter method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5, 5.5]);
      const filtered = arr.filter(val => val > 3.0);

      expect(filtered.toString()).assertEqual('3.5,4.5,5.5');
      expect(filtered.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0018
     * @tc.desc   Verify the every method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new Float32Array([2.0, 4.0, 6.0, 8.0]);
      const arr2 = new Float32Array([2.0, 3.0, 6.0, 8.0]);

      expect(arr1.every(val => val % 2 === 0)).assertEqual(true);
      expect(arr2.every(val => val % 2 === 0)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0019
     * @tc.desc   Verify the some method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new Float32Array([1.0, 3.0, 5.0, 7.0]);
      const arr2 = new Float32Array([1.0, 3.0, 6.0, 7.0]);

      expect(arr1.some(val => val % 2 === 0)).assertEqual(false);
      expect(arr2.some(val => val % 2 === 0)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0020
     * @tc.desc   Verify the reduce method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0021
     * @tc.desc   Verify the reduceRight method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

      const sum = arr.reduceRight((acc, val) => acc + val, 0);
      expect(sum).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0022
     * @tc.desc   Verify the find method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);

      const result = arr.find(val => val > 25.0);
      expect(result).assertEqual(30.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0023
     * @tc.desc   Verify the findIndex method of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);

      const index = arr.findIndex(val => val > 25.0);
      expect(index).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0025
     * @tc.desc   Verify Float32Array handling of special floating-point values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(4)
      arr[0] = Infinity
      arr[1] = -Infinity
      arr[2] = NaN
      arr[3] = 0.0
      expect(arr[0]).assertEqual(Infinity)
      expect(arr[1]).assertEqual(-Infinity)
      expect(isNaN(arr[2])).assertEqual(true)
      expect(arr[3]).assertEqual(0.0)
      expect(arr.indexOf(NaN)).assertEqual(-1)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0026
     * @tc.desc   Verify Float32Array handling of boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxVal = 3.4028234663852886e+38
      const minVal = 1.401298464324817e-45
      const arr = new Float32Array(4)
      arr[0] = maxVal
      arr[1] = -maxVal
      arr[2] = minVal
      arr[3] = -minVal
      expect(arr[0]).assertEqual(maxVal)
      expect(arr[1]).assertEqual(-maxVal)
      expect(arr[2]).assertEqual(minVal)
      expect(arr[3]).assertEqual(-minVal)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0027
     * @tc.desc   Verify the precision limitations of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const highPrecision = 1.234567890123456789
      const arr = new Float32Array([highPrecision])
      expect(arr[0].toString()).assertEqual('1.2345678806304932')
      expect(arr[0].toFixed(7)).assertEqual(highPrecision.toFixed(7))
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0028
     * @tc.desc   Verify conversion between Float32Array and regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = [1.1, 2.2, 3.3, 4.4]
      const floatArr = new Float32Array(original)
      const converted = Array.from(floatArr)
      expect(converted.length).assertEqual(original.length)
      for (let i = 0; i < original.length; i++) {
        expect(converted[i].toFixed(6)).assertEqual(original[i].toFixed(6));
      }
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0029
     * @tc.desc   Verify Float32Array exception scenarios - invalid buffer offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(12)
      let errorThrown = false
      try {
        new Float32Array(buffer, 1)
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0030
     * @tc.desc   Verify Float32Array exception scenarios - out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(3)
      expect(arr[10]).assertEqual(undefined)
      arr[10] = 100.0
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0031
     * @tc.desc   Verify Float32Array exception scenarios - invalid constructor parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let errorThrown = false;
      try {
        new Float32Array(-5);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0032
     * @tc.desc   Verify the iterators of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);

      const values: number[] = [];
      for (const val of arr.values()) {
        values.push(val);
      }
      expect(new Float32Array(values).toString()).assertEqual('1,2,3');

      const keys: number[] = [];
      for (const key of arr.keys()) {
        keys.push(key);
      }
      expect(keys.toString()).assertEqual('0,1,2');

      const entries: [number, number][] = [];
      for (const entry of arr.entries()) {
        entries.push(entry);
      }
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual(1.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0033
     * @tc.desc   Verify Float32Array sharing buffer with other typed arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const floatArr = new Float32Array(buffer);

      floatArr[0] = 1.0;
      floatArr[1] = 2.0;

      const view = new DataView(buffer);
      expect(view.getFloat32(0)).assertEqual(4.600602988224807e-41);
      expect(view.getFloat32(4)).assertEqual(8.96831017167883e-44);

      view.setFloat32(8, 3.0);
      expect(floatArr[2]).assertEqual(2.304855714121459e-41);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0034
     * @tc.desc   Verify Float32Array subarray shares buffer with original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(20);
      const arr = new Float32Array(buffer);
      arr.set([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub = arr.subarray(1, 4);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.byteOffset).assertEqual(4);
      expect(sub.byteLength).assertEqual(12);
      sub[0] = 20.0;
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(20.0);
      expect(arr[2]).assertEqual(3.0);
      expect(arr[3]).assertEqual(4.0);
      expect(arr[4]).assertEqual(5.0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0035
     * @tc.desc   Verify Float32Array fill method handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(4);
      arr.fill(NaN);
      expect(isNaN(arr[0])).assertEqual(true);
      expect(isNaN(arr[3])).assertEqual(true);
      arr.fill(Infinity, 1, 3);
      expect(arr[0]).assertNaN();
      expect(arr[1]).assertEqual(Infinity);
      expect(arr[2]).assertEqual(Infinity);
      expect(arr[3]).assertNaN();
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0036
     * @tc.desc   Verify Float32Array set method handling of out-of-bounds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(3);
      const source = new Float32Array([10.0, 20.0, 30.0, 40.0]);

      try {
        arr.set(source);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }

      try {
        arr.set([1.0, 2.0], 2);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertContain('The sum of length and targetOffset is greater than targetLength.');
      }
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0037
     * @tc.desc   Verify Float32Array set method handling of negative offsets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(5);
      const source = new Float32Array([1.0, 2.0]);

      let errorThrown = false;
      try {
        arr.set(source, -2);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual('0,0,0,0,0');

      errorThrown = false;
      try {
        arr.set(source, -1);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0038
     * @tc.desc   Verify default behavior of Float32Array sort method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([3.0, 1.0, 10.0, 2.0]);

      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3,10');

      arr.sort((a, b) => a - b);
      expect(arr.toString()).assertEqual('1,2,3,10');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0039
     * @tc.desc   Verify Float32Array indexOf handling of NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, NaN, 3.0, NaN, 5.0]);

      expect(arr.indexOf(NaN)).assertEqual(-1);

      expect(arr.indexOf(arr[1])).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0040
     * @tc.desc   Verify Float32Array includes handling of NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, NaN, 3.0]);

      expect(arr.includes(NaN)).assertEqual(true);
      expect(arr.includes(NaN, 2)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0041
     * @tc.desc   Verify Float32Array copyWithin method boundary handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.copyWithin(3, 0, 2);
      expect(arr.toString()).assertEqual('1,2,3,1,2');
      arr.copyWithin(0, 3, 10);
      expect(arr.toString()).assertEqual('1,2,3,1,2');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0042
     * @tc.desc   Verify Float32Array reduce method without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Float32Array([1.0, 2.0, 3.0]);
      const arr2 = new Float32Array([5.0]);

      const sum1 = arr1.reduce((acc, val) => acc + val);
      expect(sum1).assertEqual(6.0);

      const sum2 = arr2.reduce((acc, val) => acc + val);
      expect(sum2).assertEqual(5.0);

      let errorThrown = false;
      try {
        new Float32Array(0).reduce((acc, val) => acc + val);
      } catch (e) {
        errorThrown = (e instanceof TypeError);
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0043
     * @tc.desc   Verify Float32Array find method handling of sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(5);
      arr[0] = 10.0;
      arr[3] = 40.0;

      const result = arr.find(val => val > 20.0);
      expect(result).assertEqual(40.0);

      const zeroResult = arr.find(val => val === 0.0);
      expect(zeroResult).assertEqual(0.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0044
     * @tc.desc   Verify Float32Array forEach method handling of sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(5);
      arr[0] = 10.0;
      arr[3] = 40.0;

      const visited: number[] = [];
      arr.forEach((_val, index) => {
        visited.push(index);
      });

      expect(visited.toString()).assertEqual('0,1,2,3,4');
      expect(visited.length).assertEqual(5);
    })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0045
     * @tc.desc   Verify Float32Array interaction with DataView regarding endianness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(4);
      const dv = new DataView(buffer);
      const floatArr = new Float32Array(buffer);
      dv.setFloat32(0, 1.234, true);

      expect(floatArr[0].toFixed(3)).assertEqual(1.234.toFixed(3));

      floatArr[0] = 5.678;

      const le = dv.getFloat32(0, true);
      const be = dv.getFloat32(0, false);
      expect(le.toFixed(3)).assertEqual(5.678.toFixed(3));
      expect(be.toFixed(3)).assertEqual('0.000');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0047
     * @tc.desc   Verify that the map method of Float32Array returns a new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const mapped = arr.map(val => val * 2);
      expect(mapped.toString()).assertEqual('2,4,6');
      expect(mapped.buffer === arr.buffer).assertFalse();
      expect(mapped.toString()).assertEqual('2,4,6');
      expect(mapped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0048
     * @tc.desc   Verify that the filter method of Float32Array returns a new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const filtered = arr.filter(val => val > 3.0);
      expect(filtered.toString()).assertEqual('4,5');
      expect(filtered.buffer === arr.buffer).assertFalse();
      expect(filtered.toString()).assertEqual('4,5');
      expect(filtered.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0049
     * @tc.desc   Verify the short-circuit behavior of Float32Array's every method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([2.0, 4.0, 6.0, 3.0, 8.0]);
      let checks = 0;
      const result = arr.every(val => {
        checks++;
        return val % 2 === 0;
      });
      expect(result).assertEqual(false);
      expect(checks).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0050
     * @tc.desc   Verify the short-circuit behavior of Float32Array's some method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 3.0, 5.0, 4.0, 7.0]);
      let checks = 0;

      const result = arr.some(val => {
        checks++;
        return val % 2 === 0;
      });

      expect(result).assertEqual(true);
      expect(checks).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0051
     * @tc.desc   Verify that Float32Array's forEach method cannot be interrupted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let checks = 0;

      arr.forEach(val => {
        checks++;
        if (val === 2.0) {
          return;
        }
      });

      expect(checks).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0052
     * @tc.desc   Verify Float32Array iterator behavior when modifying the array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const values: number[] = [];

      for (const val of arr) {
        values.push(val);
        if (val === 2.0) {
          arr[3] = 40.0;
        }
      }

      expect(values.toString()).assertEqual('1,2,3,40');
      expect(values.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0053
     * @tc.desc   Verify precision loss when converting Float32Array with other numeric types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const float64 = new Float64Array([1.2345678901234567]);
      const float32 = new Float32Array(float64);
      expect(float32[0].toString()).assertEqual('1.2345678806304932');
      expect(float32[0].toFixed(7)).assertEqual(float64[0].toFixed(7));
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0055
     * @tc.desc   Verify Float32Array's set method handling of different source types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(4);
      const uint8 = new Uint8Array([0, 128, 255, 64]);
      arr.set(uint8);
      expect(arr.toString()).assertEqual('0,128,255,64');
      const int16 = new Int16Array([-1000, 2000]);
      arr.set(int16, 2);
      expect(arr.toString()).assertEqual('0,128,-1000,2000');
      expect(arr.length).assertEqual(4);
    })


    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0057
     * @tc.desc   Verify Float32Array's find method with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, NaN, 3.0, Infinity, -Infinity]);

      const nan = arr.find(val => isNaN(val));
      expect(isNaN(nan!)).assertEqual(true);

      const inf = arr.find(val => val === Infinity);
      expect(inf).assertEqual(Infinity);

      const negInf = arr.find(val => val === -Infinity);
      expect(negInf).assertEqual(-Infinity);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0058
     * @tc.desc   Verify Float32Array's slice method handling of negative indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const slice1 = arr.slice(-3);
      expect(slice1.toString()).assertEqual('3,4,5');

      const slice2 = arr.slice(1, -1);
      expect(slice2.toString()).assertEqual('2,3,4');

      const slice3 = arr.slice(-4, -2);
      expect(slice3.toString()).assertEqual('2,3');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0059
     * @tc.desc   Verify Float32Array's subarray method handling of negative indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
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
     * @tc.name   TypeArrayFloat32ArrayBufferDv0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0060
     * @tc.desc   Verify Float32Array's join method handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, NaN, Infinity, -Infinity]);
      expect(arr.join()).assertEqual('1,NaN,Infinity,-Infinity');
      expect(arr.join('|')).assertEqual('1|NaN|Infinity|-Infinity');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0061
     * @tc.desc   Verify Float32Array's reduce method handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, NaN, 4.0]);

      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(isNaN(sum)).assertEqual(true);

      const filteredSum = arr.reduce((acc, val) => {
        return isNaN(val) ? acc : acc + val;
      }, 0);
      expect(filteredSum).assertEqual(7.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0062
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0062
     * @tc.desc   Verify Float32Array's map method handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, NaN, Infinity, -Infinity]);

      const mapped = arr.map(val => {
        if (isNaN(val)) {
          return 0.0;
        }
        if (val === Infinity) {
          return 1000.0;
        }
        if (val === -Infinity) {
          return -1000.0;
        }
        return val * 2;
      });
      expect(mapped.toString()).assertEqual('2,0,1000,-1000');
      expect(mapped.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0063
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0063
     * @tc.desc   Verify Float32Array's indexOf method handling of extremely close values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value = 1.2345678;
      const closeValue = value + 1e-8;
      const arr = new Float32Array([1.0, value, 3.0]);

      expect(arr.indexOf(closeValue)).assertEqual(-1);
      expect(arr.indexOf(value)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0064
     * @tc.desc   Verify Float32Array's find method handling of extremely close values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value = 1.2345678;
      const epsilon = 1e-6;
      const arr = new Float32Array([1.0, value, 3.0]);
      const found = arr.find(val => Math.abs(val - value) < epsilon);
      expect(found).assertEqual(1.2345677614212036);

      const closeFound = arr.find(val => Math.abs(val - (value + 1e-5)) < epsilon);
      expect(closeFound).assertEqual(undefined);
    })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0070
     * @tc.desc   Verify Float32Array's of method for creating arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      const mixedArr = Float32Array.of(5, NaN);
      expect(mixedArr.toString()).assertEqual('5,NaN');
      expect(mixedArr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0071
     * @tc.desc   Verify Float32Array serialization and deserialization with JSON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, NaN, Infinity]);

      const json = JSON.stringify(arr);
      expect(json).assertEqual('{"0":1,"1":2,"2":3,"3":null,"4":null}');

      const parsed: ESObject = JSON.parse(json);
      const newArr = new Float32Array(parsed);

      expect(newArr.toString()).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0072
     * @tc.desc   Verify Float32Array's entries iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const entries = Array.from(arr.entries());

      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual(10.0);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(20.0);
    })


    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0075
     * @tc.desc   Verify batch data processing between Float32Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const size = 1000;
      const buffer = new ArrayBuffer(size * 4);
      const floatArr = new Float32Array(buffer);
      const dv = new DataView(buffer);

      for (let i = 0; i < size; i++) {
        dv.setFloat32(i * 4, i * 0.5, true);
      }

      for (let i = 0; i < size; i++) {
        expect(floatArr[i].toFixed(6)).assertEqual((i * 0.5).toFixed(6));
      }

      for (let i = 0; i < size; i++) {
        floatArr[i] = i * 2.0;
      }

      for (let i = 0; i < size; i++) {
        expect(dv.getFloat32(i * 4, true).toFixed(6)).assertEqual((i * 2.0).toFixed(6));
      }
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0076
     * @tc.desc   Verify nested array conversion for Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nestedArray = [
        [1.1, 2.2],
        [3.3, 4.4],
        [5.5, 6.6]
      ];

      const floatArrays = nestedArray.map(inner => new Float32Array(inner));

      expect(floatArrays.length).assertEqual(3);
      expect(floatArrays[0].toString()).assertEqual('1.100000023841858,2.200000047683716');
      expect(floatArrays[1].toString()).assertEqual('3.299999952316284,4.400000095367432');

      const flatArray = new Float32Array(
        nestedArray.reduce((acc, inner) => [...acc, ...inner], [])
      );

      expect(flatArray.toString())
        .assertEqual('1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432,5.5,6.599999904632568');
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0078
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0078
     * @tc.desc   Verify mathematical operation accuracy of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5]);

      const added = arr.map(x => x + 2.5);
      expect(added.toString()).assertEqual('4,5,6,7');

      const multiplied = arr.map(x => x * 2);
      expect(multiplied.toString()).assertEqual('3,5,7,9');

      const divided = arr.map(x => x / 2);
      expect(divided.toString()).assertEqual('0.75,1.25,1.75,2.25');
      const sqrtArr = new Float32Array([4.0, 9.0, 16.0]);
      const squaredRoots = sqrtArr.map(x => Math.sqrt(x));
      expect(squaredRoots.toString()).assertEqual('2,3,4');
      expect(squaredRoots.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0079
     * @tc.desc   Verify comparison operations of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      const greaterThan = arr.filter(x => x > 3.0);
      expect(greaterThan.toString()).assertEqual('4,5');
      expect(greaterThan.length).assertEqual(2);
      const lessThanOrEqual = arr.filter(x => x <= 2.0);
      expect(lessThanOrEqual.toString()).assertEqual('1,2');
      expect(lessThanOrEqual.length).assertEqual(2);

      const inRange = arr.filter(x => x > 2.0 && x < 5.0);
      expect(inRange.toString()).assertEqual('3,4');
      expect(inRange.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0080
     * @tc.desc   Verify batch modification of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size = 10000;
      const arr = new Float32Array(size);

      arr.fill(1.0);

      for (let i = 0; i < size; i++) {
        if (i % 2 === 1) {
          arr[i] *= 2;
        }
      }

      for (let i = 0; i < 10; i++) {
        if (i % 2 === 0) {
          expect(arr[i]).assertEqual(1.0);
        } else {
          expect(arr[i]).assertEqual(2.0);
        }
      }


      const modified = arr.map((val, i) => i % 3 === 0 ? val * 3 : val);

      expect(modified[0]).assertEqual(3.0);
      expect(modified[1]).assertEqual(2.0);
      expect(modified[2]).assertEqual(1.0);
      expect(modified[3]).assertEqual(6.0);
      expect(modified.length).assertEqual(10000);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0081
     * @tc.desc   Verify handling of zero-length Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Float32Array(0);

      expect(emptyArr.length).assertEqual(0);
      expect(emptyArr.byteLength).assertEqual(0);
      expect(emptyArr.buffer.byteLength).assertEqual(0);

      expect(emptyArr.toString()).assertEqual('');
      expect(emptyArr.join(',')).assertEqual('');
      expect(emptyArr.indexOf(0)).assertEqual(-1);
      expect(emptyArr.includes(0)).assertEqual(false);

      let called = false;
      emptyArr.forEach(() => called = true);
      expect(called).assertEqual(false);
      const mapped = emptyArr.map(x => x * 2);
      expect(mapped.length).assertEqual(0);
    })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0083
     * @tc.desc   Verify Float32Array buffer slicing operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(32);
      const fullArr = new Float32Array(buffer);

      for (let i = 0; i < fullArr.length; i++) {
        fullArr[i] = i + 1.0;
      }

      const sliceBuffer = buffer.slice(8, 24);
      const sliceArr = new Float32Array(sliceBuffer);

      expect(sliceArr.length).assertEqual(4);
      expect(sliceArr.toString()).assertEqual('3,4,5,6');
      expect(sliceArr.length).assertEqual(4);
      sliceArr[0] = 30.0;
      expect(fullArr[2]).assertEqual(3.0);

    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0088
     * @tc.desc   Verify Float32Array buffer view range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(24);
      const fullArr = new Float32Array(buffer);

      for (let i = 0; i < fullArr.length; i++) {
        fullArr[i] = i + 1.0;
      }

      const partialArr = new Float32Array(buffer, 8, 3);

      expect(partialArr.length).assertEqual(3);
      expect(partialArr.toString()).assertEqual('3,4,5');

      partialArr[1] = 40.0;
      expect(fullArr[3]).assertEqual(40.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0089
     * @tc.desc   Verify Float32Array overflow handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayFloat32ArrayBufferDv0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxFloat32 = 3.4028234663852886e+38;
      const arr = new Float32Array(2);

      arr[0] = maxFloat32 * 2;
      expect(arr[0]).assertEqual(Infinity);

      const minFloat32 = 1.401298464324817e-45;
      arr[1] = minFloat32 / 2;
      expect(arr[1]).assertEqual(0.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0090
     * @tc.desc   Verify Float32Array type conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const float32 = new Float32Array([1.5, 2.5, 3.5]);

      const int32 = new Int32Array(float32.buffer);
      const uint8 = new Uint8Array(float32.buffer);

      expect(int32.length).assertEqual(3);
      expect(uint8.length).assertEqual(12);

      const float64 = new Float64Array([1.1, 2.2, 3.3]);
      const converted = new Float32Array(float64);

      expect(converted.length).assertEqual(3);
      expect(converted[0].toFixed(3)).assertEqual(1.1.toFixed(3));
      expect(converted[1].toFixed(3)).assertEqual(2.2.toFixed(3));
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0111
     * @tc.desc   Verify Float32Array constructor parameter types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr1 = new Float32Array(3);
        expect(arr1.length).assertEqual(3);

        const arr2 = new Float32Array([1, 2, 3]);
        expect(arr2.length).assertEqual(3);
        expect(arr2[0]).assertEqual(1);

        const buffer = new ArrayBuffer(12);
        const arr3 = new Float32Array(buffer);
        expect(arr3.length).assertEqual(3);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0112
     * @tc.desc   Verify Float32Array's indexOf and lastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
        expect(arr.indexOf(2.0)).assertEqual(1);
        expect(arr.indexOf(4.0)).assertEqual(-1);
        expect(arr.indexOf(2.0, 2)).assertEqual(3);
        expect(arr.lastIndexOf(2.0)).assertEqual(3);
        expect(arr.lastIndexOf(2.0, 2)).assertEqual(1);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0113
     * @tc.desc   Verify Float32Array's every and some methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([2.0, 4.0, 6.0, 8.0]);

        const allEven = arr.every((val) => {
          return val % 2 === 0;
        });
        expect(allEven).assertEqual(true);

        const hasGreaterThanFive = arr.some((val) => {
          return val > 5;
        });
        expect(hasGreaterThanFive).assertEqual(true);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0114
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0114
     * @tc.desc   Verify Float32Array's forEach method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0]);
        const results: number[] = [];

        arr.forEach((val, index) => {
          results.push(val * index);
        });
        expect(results.toString()).assertEqual('0,2,6');
        expect(results.length).assertEqual(3);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0115
     * @tc.desc   Verify Float32Array's subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        const sub1 = arr.subarray(1, 3);
        expect(sub1.toString()).assertEqual('2,3');
        expect(sub1.length).assertEqual(2);
        const sub2 = arr.subarray(2);
        expect(sub2.toString()).assertEqual('3,4,5');
        expect(sub2.length).assertEqual(3);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0116
     * @tc.desc   Verify Float32Array's slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        const slice1 = arr.slice(1, 3);
        expect(slice1.toString()).assertEqual('2,3');
        expect(slice1.length).assertEqual(2);
        const slice2 = arr.slice(3);
        expect(slice2.toString()).assertEqual('4,5');
        expect(slice2.length).assertEqual(2);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0117
     * @tc.desc   Verify Float32Array's fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array(5);
        arr.fill(10.0);
        expect(arr.toString()).assertEqual('10,10,10,10,10');
        expect(arr.length).assertEqual(5);
        arr.fill(20.0, 1, 4);
        expect(arr.toString()).assertEqual('10,20,20,20,10');
        expect(arr.length).assertEqual(5);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0118
     * @tc.desc   Verify Float32Array's set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array(5);
        const source = new Float32Array([1.0, 2.0, 3.0]);

        arr.set(source);
        expect(arr.toString()).assertEqual('1,2,3,0,0');
        expect(arr.length).assertEqual(5);
        arr.set(source, 2);
        expect(arr.toString()).assertEqual('1,2,1,2,3');
        expect(arr.length).assertEqual(5);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0119
     * @tc.desc   Verify Float32Array's copyWithin method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        arr.copyWithin(0, 3);
        expect(arr.toString()).assertEqual('4,5,3,4,5');
        expect(arr.length).assertEqual(5);
        const arr2 = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        arr2.copyWithin(2, 0, 2);
        expect(arr2.toString()).assertEqual('1,2,1,2,5');
        expect(arr.length).assertEqual(5);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0120
     * @tc.desc   Verify Float32Array's sort method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([3.0, 1.0, 4.0, 2.0]);

        arr.sort((a, b) => {
          return a - b;
        });
        expect(arr.toString()).assertEqual('1,2,3,4');
        expect(arr.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0121
     * @tc.desc   Verify Float32Array's find and findIndex methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        const found = arr.find((val) => {
          return val > 3.0;
        });
        expect(found).assertEqual(4.0);

        const foundIndex = arr.findIndex((val) => {
          return val > 3.0;
        });
        expect(foundIndex).assertEqual(3);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0122
     * @tc.desc   Verify Float32Array's reduceRight method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

        const str = arr.reduceRight((acc, val) => {
          return acc + val.toString();
        }, '');
        expect(str).assertEqual('4321');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0123
     * @tc.desc   Verify Float32Array's static from method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr1 = Float32Array.from([1, 2, 3]);
        expect(arr1.toString()).assertEqual('1,2,3');

        const arr2 = Float32Array.from(arrayLike as ArrayLike<number>);
        expect(arr2.toString()).assertEqual('10,20,30');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0124
     * @tc.desc   Verify Float32Array's static of method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1.0);
        expect(arr[3]).assertEqual(4.0);
        expect(arr.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0125
     * @tc.desc   Verify Float32Array's includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
        expect(arr.includes(2.0)).assertEqual(true);
        expect(arr.includes(5.0)).assertEqual(false);
        expect(arr.includes(2.0, 2)).assertEqual(false);
        expect(arr.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0126
     * @tc.desc   Verify interaction between Float32Array and DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const buffer = new ArrayBuffer(16);
        const floatArr = new Float32Array(buffer);
        const dv = new DataView(buffer);

        dv.setFloat32(0, 1.234, false);
        dv.setFloat32(4, 5.678, false);

        expect(approxEqual(floatArr[0], 1.234)).assertEqual(false);
        expect(approxEqual(floatArr[1], 5.678)).assertEqual(false);

        floatArr[2] = 9.012;

        expect(approxEqual(dv.getFloat32(8, false), 9.012)).assertEqual(false);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0127
     * @tc.desc   Verify properties of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array(3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteLength).assertEqual(12);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        expect(arr.buffer.byteLength).assertEqual(12);
        expect(arr.byteOffset).assertEqual(0);

        const buffer = new ArrayBuffer(20);
        const arr2 = new Float32Array(buffer, 4, 3);
        expect(arr2.byteOffset).assertEqual(4);
        expect(arr2.byteLength).assertEqual(12);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0128
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0128
     * @tc.desc   Verify nested buffer views of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const buffer = new ArrayBuffer(32);
        const arr1 = new Float32Array(buffer, 0, 4);
        const arr2 = new Float32Array(buffer, 16, 4);

        for (let i = 0; i < 4; i++) {
          arr1[i] = i + 1.0;
          arr2[i] = i + 5.0;
        }

        const fullArr = new Float32Array(buffer);
        expect(fullArr.toString()).assertEqual('1,2,3,4,5,6,7,8');
        expect(fullArr.length).assertEqual(8);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0129
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0129
     * @tc.desc   Verify handling of special values in Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([0.0, -0.0, NaN, Infinity, -Infinity]);
        expect(arr[0]).assertEqual(0.0);
        expect(arr[1]).assertEqual(-0.0);
        expect(isNaN(arr[2])).assertEqual(true);
        expect(arr[3]).assertEqual(Infinity);
        expect(arr[4]).assertEqual(-Infinity);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0130
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0130
     * @tc.desc   Verify batch operations of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const size = 10;
        const arr = new Float32Array(size);

        for (let i = 0; i < size; i++) {
          arr[i] = i * 0.5;
        }

        const transformed = new Float32Array(size);
        for (let i = 0; i < size; i++) {
          transformed[i] = Math.sqrt(arr[i]);
        }

        expect(approxEqual(transformed[4], Math.sqrt(2.0))).assertEqual(true);
        expect(approxEqual(transformed[8], Math.sqrt(4.0))).assertEqual(true);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0131
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0131
     * @tc.desc   Verify conversion between Float32Array and other TypedArrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const float32 = new Float32Array([1.5, 2.5, 3.5]);
        const int32 = new Int32Array(float32.buffer);
        expect(int32.length).assertEqual(3);

        const convertedBack = new Float32Array(int32.buffer);
        expect(approxEqual(convertedBack[0], 1.5)).assertEqual(true);
        expect(approxEqual(convertedBack[1], 2.5)).assertEqual(true);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0132
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0132
     * @tc.desc   Verify index access boundaries of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);

      expect(arr[0]).assertEqual(1.0);
      expect(arr[2]).assertEqual(3.0);

      expect(isNaN(arr[3])).assertEqual(true);

      const originalLength = arr.length;
      arr[5] = 5.0;
      expect(arr.length).assertEqual(originalLength);
      expect(arr[5]).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0133
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0133
     * @tc.desc   Verify index handling in Float32Array's map method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0]);

        const indexedMap = arr.map((val, index) => {
          return val * index;
        });
        expect(indexedMap.toString()).assertEqual('0,2,6');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0134
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0134
     * @tc.desc   Verify index handling in Float32Array's filter method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        const evenIndices = arr.filter((_val, index) => {
          return index % 2 === 0;
        });
        expect(evenIndices.toString()).assertEqual('1,3,5');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0135
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0135
     * @tc.desc   Verify Float32Array's reduce method with initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0]);

        const sumWithInitial = arr.reduce((acc, val) => {
          return acc + val;
        }, 10.0);
        expect(approxEqual(sumWithInitial, 16.0)).assertEqual(true);

        const str = arr.reduce((acc, val) => {
          return acc + val.toString() + ',';
        }, '');
        expect(str).assertEqual('1,2,3,');
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0136
     * @tc.desc   Verify relationship between Float32Array's subarray and original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const sub = arr.subarray(1, 4);

        sub[0] = 20.0
        expect(arr[1]).assertEqual(20.0);

        arr[2] = 30.0;
        expect(sub[1]).assertEqual(30.0);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0137
     * @tc.desc   Verify the relationship between Float32Array's slice and the original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const slice = arr.slice(1, 4);

        slice[0] = 20.0;
        expect(arr[1]).assertEqual(2.0);

        arr[2] = 30.0;
        expect(slice[1]).assertEqual(3.0);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0138
     * @tc.desc   Verify Float32Array's fill method handling of start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        arr.fill(0.0, 1, 4);
        expect(arr.toString()).assertEqual('1,0,0,0,5');

        arr.fill(9.0, 3, 1);
        expect(arr.toString()).assertEqual('1,0,0,0,5');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0139
     * @tc.desc   Verify Float32Array's set method handling of different sources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array(5);

        arr.set([1.0, 2.0, 3.0]);
        expect(arr.toString()).assertEqual('1,2,3,0,0');
        expect(arr.length).assertEqual(5);
        const source = new Float32Array([4.0, 5.0]);
        arr.set(source, 3);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
        expect(arr.length).assertEqual(5);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0140
     * @tc.desc   Verify Float32Array's copyWithin method handling of overlapping ranges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        arr.copyWithin(2, 0, 3);
        expect(arr.toString()).assertEqual('1,2,1,2,3');
        expect(arr.length).assertEqual(5);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0142
     * @tc.desc   Verify Float32Array's find method handling of indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

        const found = arr.find((val, index) => {
          return val > index * 1.5;
        });
        expect(found).assertEqual(1);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0143
     * @tc.desc   Verify Float32Array's static from method using a mapping function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {

        const arr = Float32Array.from([1, 2, 3], (x) => {
          return x * 2.5;
        });
        expect(arr.toString()).assertEqual('2.5,5,7.5');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0144
     * @tc.desc   Verify Float32Array's includes method handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([0.0, -0.0, NaN, Infinity]);
        expect(arr.includes(0.0)).assertEqual(true);
        expect(arr.includes(-0.0)).assertEqual(true);
        expect(arr.includes(NaN)).assertEqual(true);
        expect(arr.includes(Infinity)).assertEqual(true);
        expect(arr.includes(-Infinity)).assertEqual(false);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0145
     * @tc.desc   Verify Float32Array and DataView handling of endianness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const buffer = new ArrayBuffer(4);
        const dv = new DataView(buffer);


        dv.setFloat32(0, 1.234, false);


        const leValue = dv.getFloat32(0, true);

        expect(approxEqual(leValue, 1.234)).assertEqual(false);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0146
     * @tc.desc   Verify Float32Array's buffer properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const buffer = new ArrayBuffer(16)
      const arr = new Float32Array(buffer, 4, 3)
      expect(arr.buffer).assertEqual(buffer)
      expect(arr.byteOffset).assertEqual(4)
      expect(arr.byteLength).assertEqual(12)
      expect(arr.length).assertEqual(3)
      expect(Float32Array.BYTES_PER_ELEMENT).assertEqual(4)
      Done()
    })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0147
     * @tc.desc   Verify Float32Array's buffer sharing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const buffer = new ArrayBuffer(16)
      const arr1 = new Float32Array(buffer)
      const arr2 = new Float32Array(buffer)
      arr1[0] = 10.0
      expect(arr2[0]).assertEqual(10.0)
      arr2[1] = 20.0
      expect(arr1[1]).assertEqual(20.0)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0148
     * @tc.desc   Verify mathematical operations with special values in Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([0.0, NaN, Infinity, -Infinity])
      expect(isNaN(arr[0] / arr[0])).assertEqual(true)
      expect(isNaN(arr[1] + 1.0)).assertEqual(true)
      expect(isNaN(arr[2] - arr[2])).assertEqual(true)
      expect(isNaN(arr[2] / arr[2])).assertEqual(true)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0149
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0149
     * @tc.desc   Verify batch conversion of Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const size = 5
      const input = new Float32Array(size)
      for (let i = 0; i < size; i++) { input[i] = i * 0.1 }
      const output = new Float32Array(size)
      for (let i = 0; i < size; i++) { output[i] = 20 * Math.log10(input[i] || 0.0001) }
      expect(approxEqual(output[1], 20 * Math.log10(0.1))).assertEqual(true)
      expect(approxEqual(output[3], 20 * Math.log10(0.3))).assertEqual(true)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0150
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0150
     * @tc.desc   Verify operations on empty Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const emptyArr = new Float32Array(0)
      expect(emptyArr.map((val) => val * 2).length).assertEqual(0)
      expect(emptyArr.filter((val) => val > 0).length).assertEqual(0)
      expect(emptyArr.reduce((acc, val) => acc + val, 0)).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0151
     * @tc.desc   Verify Float32Array's filter method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0])
      const evenNumbers = arr.filter((val) => val % 2 === 0)
      expect(evenNumbers.toString()).assertEqual('2,4')
      Done()
    })


    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0152
     * @tc.desc   Verify Float32Array's map method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0])
      const squared = arr.map((val) => val * val)
      expect(squared.toString()).assertEqual('1,4,9,16')
      Done()
    })


    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0153
     * @tc.desc   Verify Float32Array's find method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0])
      const found = arr.find((val) => val > 25.0)
      expect(found).assertEqual(30.0)
      Done()
    })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0154
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0154
     * @tc.desc   Verify Float32Array's findIndex method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0])
      const foundIndex = arr.findIndex((val) => val > 25.0)
      expect(foundIndex).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0155
     * @tc.desc   Verify Float32Array's every method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr1 = new Float32Array([2.0, 4.0, 6.0, 8.0])
      const arr2 = new Float32Array([2.0, 3.0, 6.0, 8.0])
      const allEven1 = arr1.every((val) => val % 2 === 0)
      const allEven2 = arr2.every((val) => val % 2 === 0)
      expect(allEven1).assertEqual(true)
      expect(allEven2).assertEqual(false)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0156
     * @tc.desc   Verify Float32Array's some method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr1 = new Float32Array([1.0, 3.0, 5.0, 7.0])
      const arr2 = new Float32Array([1.0, 3.0, 6.0, 7.0])
      const hasEven1 = arr1.some((val) => val % 2 === 0)
      const hasEven2 = arr2.some((val) => val % 2 === 0)
      expect(hasEven1).assertEqual(false)
      expect(hasEven2).assertEqual(true)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0157
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0157
     * @tc.desc   Verify Float32Array's forEach method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (Done: Function) => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0])
      const results: number[] = []
      arr.forEach((val) => { results.push(val * 2) })
      expect(results.toString()).assertEqual('2,4,6,8')
      expect(results.length).assertEqual(4)
      Done()
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0158
     * @tc.desc   Verify Float32Array's reduce method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

        const sum = arr.reduce((acc, val) => {
          return acc + val;
        }, 0);
        expect(approxEqual(sum, 10.0)).assertEqual(true);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0159
     * @tc.desc   Verify Float32Array's reduceRight method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

        const str = arr.reduceRight((acc, val) => {
          return acc + val.toString();
        }, '');
        expect(str).assertEqual('4321');

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0160
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0160
     * @tc.desc   Verify Float32Array's sort method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([3.0, 1.0, 4.0, 2.0]);

        arr.sort((a, b) => {
          return a - b;
        });
        expect(arr.toString()).assertEqual('1,2,3,4');
        expect(arr.length).assertEqual(4)
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0161
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0161
     * @tc.desc   Verify Float32Array's filter method using arrow functions with index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
        const filtered = arr.filter((val, index) => {
          return index % 2 === 0 && val > 2.0;
        });
        expect(filtered.toString()).assertEqual('3,5');
        expect(filtered.length).assertEqual(2);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0162
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0162
     * @tc.desc   Verify Float32Array's map method using arrow functions with index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);

        const mapped = arr.map((val, index) => {
          return val * (index + 1);
        });
        expect(mapped.toString()).assertEqual('1,4,9,16');
        expect(mapped.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0163
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0163
     * @tc.desc   Verify Float32Array's find method using arrow functions with index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);

        const found = arr.find((val, index) => {
          return val > 25.0 && index % 2 === 0;
        });
        expect(found).assertEqual(30.0);

        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0164
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0164
     * @tc.desc   Verify Float32Array's static from method using arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {

        const arr = Float32Array.from([1, 2, 3, 4], (x) => {
          return x * 1.5;
        });
        expect(arr.toString()).assertEqual('1.5,3,4.5,6');
        expect(arr.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0165
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0165
     * @tc.desc   Verify Float32Array's sort method using arrow functions with conditions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (Done: Function) => {
        const arr = new Float32Array([3.0, NaN, 1.0, 5.0, NaN, 2.0]);

        arr.sort((a, b) => {
          if (isNaN(a)) {
            return 1;
          }
          if (isNaN(b)) {
            return -1;
          }
          return a - b;
        });
        expect(arr[0]).assertEqual(1.0);
        expect(arr[1]).assertEqual(2.0);
        expect(arr[2]).assertEqual(3.0);
        expect(arr[3]).assertEqual(5.0);
        expect(isNaN(arr[4])).assertEqual(true);
        expect(isNaN(arr[5])).assertEqual(true);
        expect(arr.length).assertEqual(6);
        Done();
      })
    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0166
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0166
     * @tc.desc   Verify Float32Array basic properties (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(20);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.buffer.byteLength).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0167
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0167
     * @tc.desc   Verify Float32Array index access (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr[0] = 10.0;
      arr[3] = 40.0;
      expect(arr[0]).assertEqual(10.0);
      expect(arr[1]).assertEqual(2.0);
      expect(arr[2]).assertEqual(3.0);
      expect(arr[3]).assertEqual(40.0);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0168
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0168
     * @tc.desc   Verify Float32Array's filter method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5, 5.5]);
      const filtered = arr.filter((val) => {
        return val > 3.0;
      });

      expect(filtered.length).assertEqual(3);
      expect(approxEqual(filtered[0], 3.5)).assertEqual(true);
      expect(approxEqual(filtered[1], 4.5)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0169
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0169
     * @tc.desc   Verify Float32Array's map method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const squared = arr.map((val) => {
        return val * val;
      });

      expect(squared.toString()).assertEqual('1,4,9,16');
      expect(squared.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0170
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0170
     * @tc.desc   Verify Float32Array's every method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Float32Array([2.0, 4.0, 6.0, 8.0]);
      const arr2 = new Float32Array([2.0, 3.0, 6.0, 8.0]);
      const allGreater1 = arr1.every((val) => {
        return val > 1.0;
      });
      const allEven = arr2.every((val) => {
        return val % 2 === 0;
      });

      expect(allGreater1).assertEqual(true);
      expect(allEven).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0171
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0171
     * @tc.desc   Verify Float32Array's some method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Float32Array([1.0, 3.0, 5.0, 7.0]);
      const arr2 = new Float32Array([1.0, 3.0, 6.0, 7.0]);

      const hasGreater5 = arr1.some((val) => {
        return val > 5.0;
      });

      const hasEven = arr2.some((val) => {
        return val % 2 === 0;
      });

      expect(hasGreater5).assertEqual(true);
      expect(hasEven).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0172
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0172
     * @tc.desc   Verify Float32Array's fill method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(5);

      arr.fill(3.14);

      expect(arr[0]).assertEqual(3.140000104904175);
      expect(arr[4]).assertEqual(3.140000104904175);

      arr.fill(1.59, 1, 4);
      expect(arr[0]).assertEqual(3.140000104904175);
      expect(arr[1]).assertEqual(1.590000033378601);
      expect(arr[3]).assertEqual(1.590000033378601);
      expect(arr[4]).assertEqual(3.140000104904175);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0173
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0173
     * @tc.desc   Verify Float32Array's set method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array(6);
      const source = new Float32Array([1.0, 2.0, 3.0]);
      arr.set(source);
      arr.set(source, 3);
      expect(arr.toString()).assertEqual('1,2,3,1,2,3');
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0174
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0174
     * @tc.desc   Verify Float32Array's copyWithin method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0175
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0175
     * @tc.desc   Verify Float32Array's sort method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([3.0, 1.0, 4.0, 2.0, 5.0]);
      arr.sort((a, b) => a - b);
      expect(arr.toString()).assertEqual('1,2,3,4,5');
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0176
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0176
     * @tc.desc   Verify Float32Array's indexOf method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);

      expect(arr.indexOf(2.0)).assertEqual(1);
      expect(arr.indexOf(2.0, 2)).assertEqual(3);
      expect(arr.indexOf(6.0)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0177
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0177
     * @tc.desc   Verify Float32Array's lastIndexOf method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);

      expect(arr.lastIndexOf(2.0)).assertEqual(3);
      expect(arr.lastIndexOf(2.0, 2)).assertEqual(1);
      expect(arr.lastIndexOf(6.0)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0178
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0178
     * @tc.desc   Verify Float32Array's includes method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);

      expect(arr.includes(3.0)).assertEqual(true);
      expect(arr.includes(6.0)).assertEqual(false);
      expect(arr.includes(3.0, 3)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0179
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0179
     * @tc.desc   Verify Float32Array's subarray method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      expect(sub.length).assertEqual(3);
      sub[0] = 20.0;
      expect(arr[1]).assertEqual(20.0);
    })

    /**
     * @tc.name   TypeArrayFloat32ArrayBufferDv0180
     * @tc.number SUB_BUILDINS_TYPEARRAY_FLOAT32ARRAY_BUFFER_DV_0180
     * @tc.desc   Verify Float32Array's slice method (synchronous test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayFloat32ArrayBufferDv0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const slice = arr.slice(1, 4);
      expect(slice.toString()).assertEqual('2,3,4');
      expect(slice.length).assertEqual(3);
      slice[0] = 20.0;
      expect(arr[1]).assertEqual(2.0);
    })

  })
}

function approxEqual(a: number, b: number, epsilon: number = 0.000001): boolean {
  return Math.abs(a - b) < epsilon;
}
