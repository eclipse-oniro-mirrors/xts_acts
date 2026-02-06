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

interface GeneratedObjectLiteralInterface_1 {
  version: number;
  recordCount: number;
  flags: number;
}

interface GeneratedObjectLiteralInterface_2 {
  id: number;
  values: Uint16Array;
}

export default function typeArrayUint16ArrayTest() {
  describe('TypeArrayUint16ArrayTest', () => {
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
     * @tc.name   TypeArrayUint16Array0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0001
     * @tc.desc   Construct Uint16Array from length and verify basic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.byteLength).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0002
     * @tc.desc   Construct Uint16Array from regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr.toString()).assertEqual('100,200,300');
      expect(arr[1]).assertEqual(200);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0003
     * @tc.desc   Construct Uint16Array from ArrayBuffer with offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0004
     * @tc.desc   Verify storage of Uint16Array maximum value (65535)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65535;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0005
     * @tc.desc   Verify truncation handling for values exceeding 65535
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0006
     * @tc.desc   Verify unsigned conversion handling for negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = -1;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0007
     * @tc.desc   Verify modification synchronization for views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const arr1 = new Uint16Array(buffer);
      const arr2 = new Uint16Array(buffer);

      arr1[0] = 1234;
      expect(arr2[0]).assertEqual(1234);
      expect(arr2[1]).assertEqual(0);
      expect(arr2.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0008
     * @tc.desc   Create Int32Array view from Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([0x1234, 0x5678]);
      const int32View = new Int32Array(uint16Arr.buffer);

      expect(int32View.length).assertEqual(1);
      expect(int32View[0]).assertEqual(0x56781234);
    })

    /**
     * @tc.name   TypeArrayUint16Array0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0009
     * @tc.desc   Copy data from regular array using set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      arr.set([10, 20, 30]);
      expect(arr.toString()).assertEqual('10,20,30,0,0');
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0010
     * @tc.desc   Copy data with offset using set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(6);
      arr.fill(1);
      arr.set([5, 6, 7], 2);
      expect(arr.toString()).assertEqual('1,1,5,6,7,1');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(7);
      expect(arr[5]).assertEqual(1);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayUint16Array0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0011
     * @tc.desc   Handle out-of-range values with set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.set([70000, -50, 32768]);
      expect(arr.toString()).assertEqual('4464,65486,32768');
      expect(arr[0]).assertEqual(4464);
      expect(arr[1]).assertEqual(65486);
      expect(arr[2]).assertEqual(32768);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0012
     * @tc.desc   Create subarray sharing buffer with subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const subArr = arr.subarray(1, 4);
      expect(subArr.toString()).assertEqual('2,3,4');
      expect(subArr.buffer).assertEqual(arr.buffer);
      expect(subArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(2);
      expect(subArr[1]).assertEqual(3);
      expect(subArr[2]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0013
     * @tc.desc   Create non-shared copy with slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30]);
      const slicedArr = arr.slice(1);
      expect(slicedArr.toString()).assertEqual('20,30');
      expect(slicedArr.buffer === arr.buffer).assertFalse();
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint16Array0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0014
     * @tc.desc   Fill array with valid single value using fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(4);
      arr.fill(12345);
      expect(arr.every(v => v === 12345)).assertEqual(true);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(12345);
      expect(arr[1]).assertEqual(12345);
      expect(arr[2]).assertEqual(12345);
      expect(arr[3]).assertEqual(12345);
    })

    /**
     * @tc.name   TypeArrayUint16Array0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0015
     * @tc.desc   Fill array with out-of-range value using fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.fill(80000);
      expect(arr.every(v => v === 14464)).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(14464);
      expect(arr[1]).assertEqual(14464);
      expect(arr[2]).assertEqual(14464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0016
     * @tc.desc   Transform elements with map method (within range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('200,400,600');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(200);
      expect(mappedArr[1]).assertEqual(400);
      expect(mappedArr[2]).assertEqual(600);
    })

    /**
     * @tc.name   TypeArrayUint16Array0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0017
     * @tc.desc   Transform elements with map method (out-of-range truncation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([30000, 40000, 50000]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('60000,14464,34464');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(60000);
      expect(mappedArr[1]).assertEqual(14464);
      expect(mappedArr[2]).assertEqual(34464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0018
     * @tc.desc   Filter elements greater than specified value with filter method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1000, 5000, 10000, 20000, 5000]);
      const filteredArr = arr.filter(v => v > 5000);
      expect(filteredArr.toString()).assertEqual('10000,20000');
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(10000);
      expect(filteredArr[1]).assertEqual(20000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0019
     * @tc.desc   Calculate sum of elements with reduce method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(1000);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(arr[3]).assertEqual(400);
    })

    /**
     * @tc.name   TypeArrayUint16Array0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0020
     * @tc.desc   Verify if all elements are less than specified value with every method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 15000]);
      const allBelow20000 = arr.every(v => v < 20000);
      const allBelow10000 = arr.every(v => v < 10000);
      expect(allBelow20000).assertEqual(true);
      expect(allBelow10000).assertEqual(false);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5000);
      expect(arr[1]).assertEqual(10000);
      expect(arr[2]).assertEqual(15000);
    })
    /**
     * @tc.name   TypeArrayUint16Array0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0021
     * @tc.desc   Check existence of element with some method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([15000, 30000, 45000]);
      const hasOver35000 = arr.some(v => v > 35000);
      const hasBelow10000 = arr.some(v => v < 10000);
      expect(hasOver35000).assertEqual(true);
      expect(hasBelow10000).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0022
     * @tc.desc   Find element with find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const found = arr.find(v => v === 16000);
      const notFound = arr.find(v => v === 40000);
      expect(found).assertEqual(16000);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayUint16Array0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0023
     * @tc.desc   Find element index with findIndex method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const index = arr.findIndex(v => v === 16000);
      const notFoundIndex = arr.findIndex(v => v === 40000);
      expect(index).assertEqual(1);
      expect(notFoundIndex).assertEqual(-1);

    })

    /**
     * @tc.name   TypeArrayUint16Array0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0024
     * @tc.desc   Check element existence with includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 65535, 30000]);
      expect(arr.includes(10000)).assertEqual(true);
      expect(arr.includes(65536)).assertEqual(false);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0025
     * @tc.desc   Find first occurrence index with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.indexOf(6000)).assertEqual(1);
      expect(arr.indexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);


    })

    /**
     * @tc.name   TypeArrayUint16Array0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0026
     * @tc.desc   Find last occurrence index with lastIndexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.lastIndexOf(6000)).assertEqual(3);
      expect(arr.lastIndexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0027
     * @tc.desc   Concatenate elements to string with join method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1234, 5678, 9012]);
      expect(arr.join('-')).assertEqual('1234-5678-9012');
      expect(arr.join('|')).assertEqual('1234|5678|9012');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0028
     * @tc.desc   Use values iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([2000, 4000, 6000]);
      const values = Array.from(arr.values());
      expect(values.toString()).assertEqual('2000,4000,6000');
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(2000);
      expect(values[1]).assertEqual(4000);
      expect(values[2]).assertEqual(6000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0029
     * @tc.desc   Use keys iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500]);
      const keys = Array.from(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0030
     * @tc.desc   Use entries iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1111, 2222, 3333]);
      const entries = Array.from(arr.entries());
      expect(entries[0].toString()).assertEqual('0,1111');
      expect(entries[1].toString()).assertEqual('1,2222');
      expect(entries[2].toString()).assertEqual('2,3333');
      expect(entries.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0031
     * @tc.desc   Convert to regular array with Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([7000, 14000, 21000]);
      const regArr = Array.from(uint16Arr);
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.toString()).assertEqual('7000,14000,21000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0032
     * @tc.desc   Convert to regular array with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([8000, 16000, 24000]);
      const regArr = [...uint16Arr];
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.toString()).assertEqual('8000,16000,24000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0033
     * @tc.desc   Convert to Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([32000, 64000, 65535]);
      const uint32Arr = new Uint32Array(uint16Arr);
      expect(uint32Arr instanceof Uint32Array).assertEqual(true);
      expect(uint32Arr.toString()).assertEqual('32000,64000,65535');
      expect(uint32Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0034
     * @tc.desc   Convert to Int16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([32767, 32768, 65535]);
      const int16Arr = new Int16Array(uint16Arr);
      expect(int16Arr instanceof Int16Array).assertEqual(true);
      expect(int16Arr.toString()).assertEqual('32767,-32768,-1');
      expect(int16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0035
     * @tc.desc   Convert to string with toString method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10000, 20000, 30000]);
      expect(arr.toString()).assertEqual('10000,20000,30000');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0036
     * @tc.desc   Convert to string with toLocaleString method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345, 6789, 54321]);
      expect(arr.toLocaleString()).assertEqual('12,345,6,789,54,321');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0037
     * @tc.desc   Interaction with JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const jsonStr = JSON.stringify(arr);
      expect(jsonStr).assertEqual('{"0":100,"1":200,"2":300,"3":400}');
    })

    /**
     * @tc.name   TypeArrayUint16Array0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0038
     * @tc.desc   Handle NaN value storage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(2);
      arr[0] = NaN;
      arr[1] = Number.NaN;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0039
     * @tc.desc   Handle Infinity value storage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0040
     * @tc.desc   Verify buffer property of Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500]);
      const buffer = arr.buffer;
      expect(buffer instanceof ArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(6);
    })
    /**
     * @tc.name   TypeArrayUint16Array0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0041
     * @tc.desc   Handle empty Uint16Array (length 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.every(() => false)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0042
     * @tc.desc   Create from Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr = new Int8Array([-1, 127, -128]);
      const uint16Arr = new Uint16Array(int8Arr);
      expect(uint16Arr.toString()).assertEqual('65535,127,65408');
      expect(uint16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0043
     * @tc.desc   Create from Float32Array with value conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const float32Arr = new Float32Array([-1.5, 32768.5, 70000.9]);
      const uint16Arr = new Uint16Array(float32Arr);
      expect(uint16Arr.toString()).assertEqual('65535,32768,4464');
      expect(uint16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0044
     * @tc.desc   Create view with DataView and interact with Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const uint16Arr = new Uint16Array(buffer);
      const dataView = new DataView(buffer);
      dataView.setUint16(2, 0x1234, true);
      expect(uint16Arr[0]).assertEqual(0x00);
      expect(uint16Arr[1]).assertEqual(0x1234);
      expect(uint16Arr[2]).assertEqual(0x00);
      expect(uint16Arr[3]).assertEqual(0x00);
      expect(uint16Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0045
     * @tc.desc   Handle large array (接近最大长度)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeLength = Math.pow(2, 27) - 1;
      const arr = new Uint16Array(largeLength);
      expect(arr.length).assertEqual(largeLength);
      arr[0] = 65535;
      arr[largeLength - 1] = 32768;
      expect(arr[0]).assertEqual(65535);
      expect(arr[largeLength - 1]).assertEqual(32768);
    })

    /**
     * @tc.name   TypeArrayUint16Array0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0046
     * @tc.desc   16-bit audio sample processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertToSigned = (samples: Uint16Array) => {
        return samples.map(s => s > 32767 ? s - 65536 : s);
      };
      const samples = new Uint16Array([0, 32767, 32768, 65535]);
      const signedSamples = convertToSigned(samples);
      expect(signedSamples.toString()).assertEqual('0,32767,32768,65535');
      expect(signedSamples.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0047
     * @tc.desc   16-bit grayscale image processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const applyThreshold = (pixels: Uint16Array, threshold: number) => {
        return pixels.map(p => p > threshold ? 65535 : 0);
      };

      const pixels = new Uint16Array([10000, 30000, 40000, 50000]);
      const processed = applyThreshold(pixels, 35000);
      expect(processed.toString()).assertEqual('0,0,65535,65535');
      expect(processed.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0048
     * @tc.desc   Network protocol 16-bit field handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const createPacket = (flags: number, length: number, checksum: number) => {
        return new Uint16Array([flags, length, checksum]);
      };

      const packet = createPacket(0x0001, 0x04D2, 0x1234);
      expect(packet[0]).assertEqual(1);
      expect(packet[1]).assertEqual(1234);
      expect(packet[2]).assertEqual(4660);
      expect(packet.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayUint16Array0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0049
     * @tc.desc   16-bit value processing in compression algorithm
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const deltaEncode16 = (data: Uint16Array) => {
        const encoded = new Uint16Array(data.length);
        encoded[0] = data[0];
        for (let i = 1; i < data.length; i++) {
          encoded[i] = (data[i] - data[i-1]) & 0xFFFF;
        }
        return encoded;
      };

      const data = new Uint16Array([1000, 1002, 1005, 1005, 1010]);
      const encoded = deltaEncode16(data);
      expect(encoded.toString()).assertEqual('1000,2,3,0,5');
      expect(encoded.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayUint16Array0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0050
     * @tc.desc   Sensor data processing with 16-bit precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const calibrateData = (rawData: Uint16Array, offset: number) => {
        return rawData.map(v => (v + offset) & 0xFFFF);
      };

      const raw = new Uint16Array([65530, 65532, 65534]);
      const calibrated = calibrateData(raw, 10);
      expect(calibrated.toString()).assertEqual('4,6,8');
      expect(calibrated.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayUint16Array0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0051
     * @tc.desc   Game coordinate system with 16-bit values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const translateCoordinates = (coords: Uint16Array, x: number, y: number) => {
        const result = new Uint16Array(coords.length);
        for (let i = 0; i < coords.length; i += 2) {
          result[i] = (coords[i] + x) & 0xFFFF;
          result[i+1] = (coords[i+1] + y) & 0xFFFF;
        }
        return result;
      };

      const coords = new Uint16Array([100, 200, 300, 400]);
      const translated = translateCoordinates(coords, 50, -150);
      expect(translated.toString()).assertEqual('150,50,350,250');
      expect(translated.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0052
     * @tc.desc   Binary file format parsing with 16-bit fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parseHeader = (data: Uint16Array) => {
        return ({
          version: data[0],
          recordCount: data[1],
          flags: data[2]
        } as GeneratedObjectLiteralInterface_1);
      };

      const headerData = new Uint16Array([0x0003, 0x000A, 0x8000]);
      const header: GeneratedObjectLiteralInterface_1 = parseHeader(headerData);
      expect(header.version).assertEqual(3);
      expect(header.recordCount).assertEqual(10);
      expect(header.flags).assertEqual(32768);
    })

    /**
     * @tc.name   TypeArrayUint16Array0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0053
     * @tc.desc   Handling invalid buffer offset in constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      let errorThrown = false;

      try {
        new Uint16Array(buffer, 7, 1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0054
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0054
     * @tc.desc   Test iteration with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5, 10, 15, 20]);
      let sum = 0;

      for (const value of arr) {
        sum += value;
      }
      expect(sum).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint16Array0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0055
     * @tc.desc   Test sort method with numeric comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([30000, 10000, 50000, 20000]);
      const sorted = [...arr].sort((a, b) => a - b);
      expect(sorted.toString()).assertEqual('10000,20000,30000,50000');
      expect(sorted.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0056
     * @tc.desc   Test reverse method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const reversed = [...arr].reverse();
      expect(reversed.toString()).assertEqual('5,4,3,2,1');
      expect(reversed.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayUint16Array0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0058
     * @tc.desc   Test buffer resizing effects (indirectly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new Uint16Array([1, 2, 3]);
      const buffer = arr.buffer;

      arr = new Uint16Array(buffer, 0, buffer.byteLength / 2);
      expect(arr.length).assertEqual(3);

      const newBuffer = new ArrayBuffer(4);
      arr = new Uint16Array(newBuffer);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0059
     * @tc.desc   Test with large values that wrap around
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr[0] = 65535 + 5;
      arr[1] = -1 - 5;
      arr[2] = 65535 * 2 + 3;

      expect(arr.toString()).assertEqual('4,65530,1');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0060
     * @tc.desc   Test multiple views with different offsets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const view1 = new Uint16Array(buffer, 0, 3);
      const view2 = new Uint16Array(buffer, 4, 2);

      view1.set([0x1111, 0x2222, 0x3333]);
      view2.set([0x4444, 0x5555]);

      expect(view1.toString()).assertEqual('4369,8738,17476');
      expect(view1.length).assertEqual(3);
      expect(view2.toString()).assertEqual('17476,21845');
      expect(view2.length).assertEqual(2);
    })
    /**
     * @tc.name   TypeArrayUint16Array0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0061
     * @tc.desc   Test subarray modification affects original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint16Array([100, 200, 300, 400, 500]);
      const subArr = original.subarray(1, 4);

      subArr[0] = 250;
      subArr[2] = 450;

      expect(original.toString()).assertEqual('100,250,300,450,500');
      expect(original.length).assertEqual(5);
      expect(original[0]).assertEqual(100);
      expect(original[1]).assertEqual(250);
      expect(original[2]).assertEqual(300);
      expect(original[3]).assertEqual(450);
      expect(original[4]).assertEqual(500);
    })

    /**
     * @tc.name   TypeArrayUint16Array0062
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0062
     * @tc.desc   Test slice modification does not affect original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint16Array([100, 200, 300, 400, 500]);
      const sliced = original.slice(1, 4);

      sliced[0] = 250;
      sliced[2] = 450;

      expect(original.toString()).assertEqual('100,200,300,400,500');
      expect(original.length).assertEqual(5);
      expect(original[0]).assertEqual(100);
      expect(original[1]).assertEqual(200);
      expect(original[2]).assertEqual(300);
      expect(original[3]).assertEqual(400);
      expect(original[4]).assertEqual(500);
    })

    /**
     * @tc.name   TypeArrayUint16Array0063
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0063
     * @tc.desc   Test fill method with start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(999, 2, 5);
      expect(arr.toString()).assertEqual('1,2,999,999,999,6');
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(999);
      expect(arr[3]).assertEqual(999);
      expect(arr[4]).assertEqual(999);
      expect(arr[5]).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayUint16Array0064
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0064
     * @tc.desc   Test map method with out-of-range values and clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([30000, 40000, 50000]);
      const mapped = arr.map(v => v * 2);

      expect(mapped.toString()).assertEqual('60000,14464,34464');
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(60000);
      expect(mapped[1]).assertEqual(14464);
      expect(mapped[2]).assertEqual(34464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0065
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0065
     * @tc.desc   Test reduce method with initial value and overflow handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([65530, 10, 5]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(65545);
    })

    /**
     * @tc.name   TypeArrayUint16Array0066
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0066
     * @tc.desc   Test every method with range check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Uint16Array([1000, 2000, 3000, 4000]);
      const arr2 = new Uint16Array([1000, 2000, 70000, 4000]);
      const allBelow5000 = (v: number) => v < 5000;
      expect(arr1.every(allBelow5000)).assertEqual(true);
      expect(arr2.every(allBelow5000)).assertEqual(true);
      expect(arr1.length).assertEqual(4);
      expect(arr2.length).assertEqual(4);
      expect(arr1[0]).assertEqual(1000);
      expect(arr1[1]).assertEqual(2000);
      expect(arr1[2]).assertEqual(3000);
      expect(arr1[3]).assertEqual(4000);
      expect(arr2[0]).assertEqual(1000);
      expect(arr2[1]).assertEqual(2000);
      expect(arr2[2]).assertEqual(4464);
      expect(arr2[3]).assertEqual(4000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0067
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0067
     * @tc.desc   Test some method with value existence check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr1 = new Uint16Array([1234, 5678, 9012]);
      const arr2 = new Uint16Array([1234, 5678, 9012]);

      const has5678 = (v: number) => v === 5678;
      const has9999 = (v: number) => v === 9999;

      expect(arr1.some(has5678)).assertEqual(true);
      expect(arr2.some(has9999)).assertEqual(false);
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(arr1[0]).assertEqual(1234);
      expect(arr1[1]).assertEqual(5678);
      expect(arr1[2]).assertEqual(9012);
      expect(arr2[0]).assertEqual(1234);
      expect(arr2[1]).assertEqual(5678);
      expect(arr2[2]).assertEqual(9012);
    })

    /**
     * @tc.name   TypeArrayUint16Array0068
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0068
     * @tc.desc   Test find method with conditional check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 15000, 20000, 25000]);
      const found = arr.find(v => v > 15000);
      const notFound = arr.find(v => v < 5000);

      expect(found).assertEqual(20000);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayUint16Array0069
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0069
     * @tc.desc   Test findIndex method with conditional check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 15000, 20000, 25000]);
      const index = arr.findIndex(v => v > 15000);
      const notFoundIndex = arr.findIndex(v => v < 5000);

      expect(index).assertEqual(3);
      expect(notFoundIndex).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0070
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0070
     * @tc.desc   Test includes method with out-of-range value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([32767, 32768, 65535]);
      expect(arr.includes(32767)).assertEqual(true);
      expect(arr.includes(65536)).assertEqual(false);
      expect(arr.includes(-1)).assertEqual(false);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(32767);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(65535);
    })

    /**
     * @tc.name   TypeArrayUint16Array0071
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0071
     * @tc.desc   Test indexOf method with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 100, 300, 100]);
      expect(arr.indexOf(100)).assertEqual(0);
      expect(arr.indexOf(100, 1)).assertEqual(2);
      expect(arr.indexOf(400)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(100);
      expect(arr[3]).assertEqual(300);
      expect(arr[4]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint16Array0072
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0072
     * @tc.desc   Test lastIndexOf method with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 100, 300, 100]);
      expect(arr.lastIndexOf(100)).assertEqual(4);
      expect(arr.lastIndexOf(100, 3)).assertEqual(2);
      expect(arr.lastIndexOf(400)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(100);
      expect(arr[3]).assertEqual(300);
      expect(arr[4]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint16Array0073
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0073
     * @tc.desc   Test join method with empty separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([123, 456, 789]);
      expect(arr.join('')).assertEqual('123456789');
      expect(arr.join()).assertEqual('123,456,789');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(123);
      expect(arr[1]).assertEqual(456);
      expect(arr[2]).assertEqual(789);
    })

    /**
     * @tc.name   TypeArrayUint16Array0074
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0074
     * @tc.desc   Test values iterator with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([2000, 4000, 6000, 8000]);
      const values: number[] = [];

      for (const val of arr.values()) {
        values.push(val);
      }

      expect(values.toString()).assertEqual('2000,4000,6000,8000');
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(2000);
      expect(values[1]).assertEqual(4000);
      expect(values[2]).assertEqual(6000);
      expect(values[3]).assertEqual(8000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0075
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0075
     * @tc.desc   Test keys iterator with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([2000, 4000, 6000, 8000]);
      const keys: number[] = [];

      for (const key of arr.keys()) {
        keys.push(key);
      }

      expect(keys.toString()).assertEqual('0,1,2,3');
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
      expect(keys[3]).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0076
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0076
     * @tc.desc   Test entries iterator with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([2000, 4000, 6000]);
      const entries: [number, number][] = [];

      for (const entry of arr.entries()) {
        entries.push(entry);
      }

      expect(entries[0].toString()).assertEqual('0,2000');
      expect(entries[2].toString()).assertEqual('2,6000');
      expect(entries.length).assertEqual(3);
      expect(entries[1].toString()).assertEqual('1,4000');
    })

    /**
     * @tc.name   TypeArrayUint16Array0077
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0077
     * @tc.desc   Test Array.from with mapping function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([100, 200, 300]);
      const mappedRegArr = Array.from(uint16Arr, v => v * 2);

      expect(Array.isArray(mappedRegArr)).assertEqual(true);
      expect(mappedRegArr.toString()).assertEqual('200,400,600');
      expect(mappedRegArr.length).assertEqual(3);
      expect(mappedRegArr[0]).assertEqual(200);
      expect(mappedRegArr[1]).assertEqual(400);
      expect(mappedRegArr[2]).assertEqual(600);
    })
    /**
     * @tc.name   TypeArrayUint16Array0079
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0079
     * @tc.desc   Test conversion to Int32Array with value preservation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([32767, 32768, 65535]);
      const int32Arr = new Int32Array(uint16Arr);
      expect(int32Arr[0]).assertEqual(32767);
      expect(int32Arr[1]).assertEqual(32768);
      expect(int32Arr[2]).assertEqual(65535);
      expect(int32Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0080
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0080
     * @tc.desc   Test toLocaleString with different locales
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345, 6789]);
      const enStr = arr.toLocaleString();
      expect(enStr).assertEqual('12,345,6,789');
    })

    /**
     * @tc.name   TypeArrayUint16Array0081
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0081
     * @tc.desc   Test JSON.stringify with nested Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const data: GeneratedObjectLiteralInterface_2 = { id: 1, values: new Uint16Array([100, 200, 300]) };
      const jsonStr = JSON.stringify(data);
      expect(jsonStr).assertEqual('{"id":1,"values":{"0":100,"1":200,"2":300}}');
      expect(data.values.length).assertEqual(3);
      expect(data.values[0]).assertEqual(100);
      expect(data.values[1]).assertEqual(200);
      expect(data.values[2]).assertEqual(300);
    })

    /**
     * @tc.name   TypeArrayUint16Array0082
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0082
     * @tc.desc   Test handling of non-integer values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr[0] = 123.45;
      arr[1] = 456.99;
      arr[2] = -78.1;
      expect(arr.toString()).assertEqual('123,456,65458');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(123);
      expect(arr[1]).assertEqual(456);
      expect(arr[2]).assertEqual(65458);
    })

    /**
     * @tc.name   TypeArrayUint16Array0083
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0083
     * @tc.desc   Test buffer byteLength matching element count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5, 10, 15, 20, 25]);
      const expectedByteLength = arr.length * arr.BYTES_PER_ELEMENT;
      expect(arr.byteLength).assertEqual(expectedByteLength);
      expect(arr.buffer.byteLength).assertEqual(expectedByteLength);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint16Array0084
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0084
     * @tc.desc   Test subarray with negative indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const subArr1 = arr.subarray(-3);
      const subArr2 = arr.subarray(1, -1);
      expect(subArr1.toString()).assertEqual('3,4,5');
      expect(subArr2.toString()).assertEqual('2,3,4');
      expect(subArr1.length).assertEqual(3);
      expect(subArr2.length).assertEqual(3);
      expect(subArr1[0]).assertEqual(3);
      expect(subArr1[1]).assertEqual(4);
      expect(subArr1[2]).assertEqual(5);
      expect(subArr2[0]).assertEqual(2);
      expect(subArr2[1]).assertEqual(3);
      expect(subArr2[2]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0085
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0085
     * @tc.desc   Test slice with negative indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const sliced1 = arr.slice(-3);
      const sliced2 = arr.slice(1, -1);
      expect(sliced1.toString()).assertEqual('3,4,5');
      expect(sliced2.toString()).assertEqual('2,3,4');
      expect(sliced1.length).assertEqual(3);
      expect(sliced2.length).assertEqual(3);
      expect(sliced1[0]).assertEqual(3);
      expect(sliced1[1]).assertEqual(4);
      expect(sliced1[2]).assertEqual(5);
      expect(sliced2[0]).assertEqual(2);
      expect(sliced2[1]).assertEqual(3);
      expect(sliced2[2]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0086
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0086
     * @tc.desc   Test fill with negative start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(9, -3);
      expect(arr.toString()).assertEqual('1,2,9,9,9');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(9);
    })

    /**
     * @tc.name   TypeArrayUint16Array0087
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0087
     * @tc.desc   Test map with negative value conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const mapped = arr.map(v => -v);
      expect(mapped.toString()).assertEqual('65436,65336,65236');
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(65436);
      expect(mapped[1]).assertEqual(65336);
      expect(mapped[2]).assertEqual(65236);
    })

    /**
     * @tc.name   TypeArrayUint16Array0088
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0088
     * @tc.desc   Test filter with value range check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 15000, 25000, 35000, 45000]);
      const filtered = arr.filter(v => v >= 20000 && v <= 40000);
      expect(filtered.toString()).assertEqual('25000,35000');
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(25000);
      expect(filtered[1]).assertEqual(35000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0089
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0089
     * @tc.desc   Test reduce with value transformation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      const sumOfDoubles = arr.reduce((acc, val) => acc + (val * 2), 0);
      expect(sumOfDoubles).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint16Array0090
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0090
     * @tc.desc   Test every with value type check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const allIntegers = arr.every(v => Number.isInteger(v));
      const allStrings = arr.every(v => typeof v === 'string');
      expect(allIntegers).assertEqual(true);
      expect(allStrings).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0091
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0091
     * @tc.desc   Test some with value type check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const hasInteger = arr.some(v => Number.isInteger(v));
      const hasString = arr.some(v => typeof v === 'string');
      expect(hasInteger).assertEqual(true);
      expect(hasString).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0092
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0092
     * @tc.desc   Test find with value transformation check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500, 2000]);
      const found = arr.find(v => v * 2 > 2500);
      expect(found).assertEqual(1500);
    })

    /**
     * @tc.name   TypeArrayUint16Array0093
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0093
     * @tc.desc   Test findIndex with value transformation check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500, 2000]);
      const index = arr.findIndex(v => v * 2 > 2500);
      expect(index).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0094
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0094
     * @tc.desc   Test includes with value transformation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1000, 2000, 3000]);
      const hasTransformed = arr.includes(2000 * 1);
      const hasNonTransformed = arr.includes(2000 * 2);
      expect(hasTransformed).assertEqual(true);
      expect(hasNonTransformed).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0095
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0095
     * @tc.desc   Test indexOf with start index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const index1 = arr.indexOf(200, 5);
      const index2 = arr.indexOf(100, 0);
      expect(index1).assertEqual(-1);
      expect(index2).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0096
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0096
     * @tc.desc   Test lastIndexOf with start index below 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 100, 300]);
      const index1 = arr.lastIndexOf(100, -5);
      const index2 = arr.lastIndexOf(100, -2);
      expect(index1).assertEqual(-1);
      expect(index2).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0097
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0097
     * @tc.desc   Test join with multi-character separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([123, 456, 789]);
      const joined = arr.join('->');
      expect(joined).assertEqual('123->456->789');
    })

    /**
     * @tc.name   TypeArrayUint16Array0098
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0098
     * @tc.desc   Test entries iterator with destructuring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500]);
      const entries: string[] = [];

      for (const ite of arr.entries()) {
        entries.push(`${ite[0]}:${ite[1]}`);
      }

      expect(entries.toString()).assertEqual('0:500,1:1000,2:1500');
      expect(entries.length).assertEqual(3);
      expect(entries[0]).assertEqual('0:500');
      expect(entries[1]).assertEqual('1:1000');
      expect(entries[2]).assertEqual('2:1500');
    })
    /**
     * @tc.name   TypeArrayUint16Array0099
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0099
     * @tc.desc   Test Array.from with empty Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyUint16 = new Uint16Array(0);
      const regArr = Array.from(emptyUint16);
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0100
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0100
     * @tc.desc   Test spread operator with empty Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyUint16 = new Uint16Array(0);
      const regArr = [...emptyUint16];
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0101
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0101
     * @tc.desc   Test conversion to Uint8Array with value truncation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([255, 256, 300, 65535]);
      const uint8Arr = new Uint8Array(uint16Arr);
      expect(uint8Arr.toString()).assertEqual('255,0,44,255');
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(0);
      expect(uint8Arr[2]).assertEqual(44);
      expect(uint8Arr[3]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint16Array0102
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0102
     * @tc.desc   Test toString with maximum and minimum values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 65535, 32767, 32768]);
      expect(arr.toString()).assertEqual('0,65535,32767,32768');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(32767);
      expect(arr[3]).assertEqual(32768);
    })

    /**
     * @tc.name   TypeArrayUint16Array0104
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0104
     * @tc.desc   Test JSON.stringify with large Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const largeArr = new Uint16Array(100);
      for (let i = 0; i < largeArr.length; i++) {
        largeArr[i] = i * 10;
      }
      const jsonStr = JSON.stringify(largeArr);
      const parsed: Uint16Array = JSON.parse(jsonStr);
      expect(parsed.length).assertEqual(undefined);
      expect(parsed[99]).assertEqual(990);
    })

    /**
     * @tc.name   TypeArrayUint16Array0106
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0106
     * @tc.desc   Test buffer sharing with nested subarrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = new Uint16Array([1, 2, 3, 4, 5, 6]);
      const sub1 = original.subarray(1, 5);
      const sub2 = sub1.subarray(1, 3);

      sub2[0] = 99;
      expect(original[2]).assertEqual(99);
      expect(sub1[1]).assertEqual(99);
      expect(original.length).assertEqual(6);
      expect(original[0]).assertEqual(1);
      expect(original[1]).assertEqual(2);
      expect(original[3]).assertEqual(4);
      expect(original[4]).assertEqual(5);
      expect(original[5]).assertEqual(6);
      expect(sub1.length).assertEqual(4);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[2]).assertEqual(4);
      expect(sub1[3]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0107
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0107
     * @tc.desc   Test slice with start index equal to array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const sliced = arr.slice(3);
      expect(sliced.length).assertEqual(0);
      expect(sliced.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0108
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0108
     * @tc.desc   Test fill with end index less than start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(9, 3, 1);
      expect(arr.toString()).assertEqual('1,2,3,4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0109
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0109
     * @tc.desc   Test map with return value exceeding Uint16 range multiple times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10000, 20000, 30000]);
      const mapped = arr.map(v => v * 4);
      expect(mapped.toString()).assertEqual('40000,14464,54464');
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(40000);
      expect(mapped[1]).assertEqual(14464);
      expect(mapped[2]).assertEqual(54464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0110
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0110
     * @tc.desc   Test filter with empty result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const filtered = arr.filter(v => v > 500);
      expect(filtered.length).assertEqual(0);
      expect(filtered instanceof Uint16Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0111
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0111
     * @tc.desc   Test reduce with empty array and initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const sum = emptyArr.reduce((acc, val) => acc + val, 100);
      expect(sum).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint16Array0112
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0112
     * @tc.desc   Test every with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.every(v => v > 100)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0113
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0113
     * @tc.desc   Test some with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.some(v => v > 100)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0114
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0114
     * @tc.desc   Test find with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const found = emptyArr.find(v => v > 100);
      expect(found).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayUint16Array0115
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0115
     * @tc.desc   Test findIndex with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const index = emptyArr.findIndex(v => v > 100);
      expect(index).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0116
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0116
     * @tc.desc   Test includes with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.includes(100)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0117
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0117
     * @tc.desc   Test indexOf with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.indexOf(100)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0118
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0118
     * @tc.desc   Test lastIndexOf with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.lastIndexOf(100)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0119
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0119
     * @tc.desc   Test join with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.join(',')).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayUint16Array0120
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0120
     * @tc.desc   Test entries iterator with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const entries = Array.from(emptyArr.entries());
      expect(entries.length).assertEqual(0);
    })
    /**
     * @tc.name   TypeArrayUint16Array0121
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0121
     * @tc.desc   Test values iterator with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const values = Array.from(emptyArr.values());
      expect(values.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0122
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0122
     * @tc.desc   Test keys iterator with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const keys = Array.from(emptyArr.keys());
      expect(keys.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0123
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0123
     * @tc.desc   Test Uint16Array with maximum safe integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxSafe = Number.MAX_SAFE_INTEGER;
      try {
        new Uint16Array(maxSafe);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    })

    /**
     * @tc.name   TypeArrayUint16Array0124
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0124
     * @tc.desc   Test set method with array larger than target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      let errorThrown = false;
      try {
        arr.set([1, 2, 3, 4]);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0125
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0125
     * @tc.desc   Test set method with negative offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      let errorThrown = false;
      try {
        arr.set([1, 2], -1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0126
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0126
     * @tc.desc   Test subarray with start index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3]);
      const subArr = arr.subarray(5);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0127
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0127
     * @tc.desc   Test slice with start index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3]);
      const sliced = arr.slice(5);
      expect(sliced.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0130
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0130
     * @tc.desc   Test filter with function returning non-boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const filtered = arr.filter(v => v > 150 ? 'true' : '');
      expect(filtered.toString()).assertEqual('200,300');
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(200);
      expect(filtered[1]).assertEqual(300);
    })

    /**
     * @tc.name   TypeArrayUint16Array0132
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0132
     * @tc.desc   Test every with function returning non-boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.every(v => v > 50 ? 1 : 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0136
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0136
     * @tc.desc   Test Uint16Array with ArrayBuffer of maximum size
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0136', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, () => {
      const maxBufferSize = 2**32 - 1;
      try {
        const buffer = new ArrayBuffer(maxBufferSize);
        new Uint16Array(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertContain('Out of range');
      }

    })

    /**
     * @tc.name   TypeArrayUint16Array0137
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0137
     * @tc.desc   Test subarray with same start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      const subArr = arr.subarray(2, 2);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0138
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0138
     * @tc.desc   Test slice with same start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      const sliced = arr.slice(2, 2);
      expect(sliced.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0139
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0139
     * @tc.desc   Test fill with start index equal to array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.fill(9, 3);
      expect(arr.toString()).assertEqual('1,2,3');
    })

    /**
     * @tc.name   TypeArrayUint16Array0140
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0140
     * @tc.desc   Test map with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const mapped = emptyArr.map(v => v * 2);
      expect(mapped.length).assertEqual(0);
      expect(mapped instanceof Uint16Array).assertEqual(true);
    })
    /**
     * @tc.name   TypeArrayUint16Array0141
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0141
     * @tc.desc   Test filter with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      const filtered = emptyArr.filter(v => v > 100);
      expect(filtered.length).assertEqual(0);
      expect(filtered instanceof Uint16Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0142
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0142
     * @tc.desc   Test reduce without initial value on non-empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30]);
      const sum = arr.reduce((acc, val) => acc + val);
      expect(sum).assertEqual(60);
    })

    /**
     * @tc.name   TypeArrayUint16Array0143
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0143
     * @tc.desc   Test reduce without initial value on empty array (should throw)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      let errorThrown = false;
      try {
        emptyArr.reduce((acc, val) => acc + val);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0144
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0144
     * @tc.desc   Test includes with value that wraps around
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([65535]);
      expect(arr.includes(-1)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0145
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0145
     * @tc.desc   Test indexOf with value that wraps around
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([65535, 100, 65535]);
      expect(arr.indexOf(-1)).assertEqual(-1);
      expect(arr.indexOf(-1, 1)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0146
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0146
     * @tc.desc   Test lastIndexOf with value that wraps around
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([65535, 100, 65535]);
      expect(arr.lastIndexOf(-1)).assertEqual(-1);
      expect(arr.lastIndexOf(-1, 1)).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0147
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0147
     * @tc.desc   Test join with empty array and custom separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr = new Uint16Array(0);
      expect(emptyArr.join('|')).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayUint16Array0148
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0148
     * @tc.desc   Test values iterator with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345]);
      const values = Array.from(arr.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(12345);
    })

    /**
     * @tc.name   TypeArrayUint16Array0149
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0149
     * @tc.desc   Test keys iterator with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345]);
      const keys = Array.from(arr.keys());
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0150
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0150
     * @tc.desc   Test entries iterator with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(1);
      expect(entries[0].toString()).assertEqual('0,12345');
    })

    /**
     * @tc.name   TypeArrayUint16Array0151
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0151
     * @tc.desc   Test Array.from with mapping function on empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyUint16 = new Uint16Array(0);
      const mapped = Array.from(emptyUint16, v => v * 2);
      expect(mapped.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0152
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0152
     * @tc.desc   Test spread operator with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([54321]);
      const regArr = [...uint16Arr];
      expect(regArr.length).assertEqual(1);
      expect(regArr[0]).assertEqual(54321);
    })

    /**
     * @tc.name   TypeArrayUint16Array0153
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0153
     * @tc.desc   Test conversion to Float64Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([0, 32768, 65535]);
      const float64Arr = new Float64Array(uint16Arr);
      expect(float64Arr[0]).assertEqual(0);
      expect(float64Arr[1]).assertEqual(32768);
      expect(float64Arr[2]).assertEqual(65535);
      expect(float64Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0154
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0154
     * @tc.desc   Test toString with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([9876]);
      expect(arr.toString()).assertEqual('9876');
    })

    /**
     * @tc.name   TypeArrayUint16Array0155
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0155
     * @tc.desc   Test toLocaleString with single element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([12345]);
      expect(arr.toLocaleString()).assertEqual('12,345');
    })

    /**
     * @tc.name   TypeArrayUint16Array0156
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0156
     * @tc.desc   Test JSON.stringify with single element array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([123]);
      expect(JSON.stringify(arr)).assertEqual('{"0":123}');
    })

    /**
     * @tc.name   TypeArrayUint16Array0158
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0158
     * @tc.desc   Test buffer sharing with different TypedArrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayUint16Array0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(8);
      const uint16Arr = new Uint16Array(buffer);
      const float32Arr = new Float32Array(buffer);
      uint16Arr.set([0x0000, 0x8000, 0xFFFF, 0x7FFF]);
      expect(float32Arr[0]).assertEqual(0);
      expect(float32Arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0159
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0159
     * @tc.desc   Test slice with end index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30]);
      const sliced = arr.slice(1, 10);
      expect(sliced.toString()).assertEqual('20,30');
      expect(sliced.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0160
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0160
     * @tc.desc   Test fill with end index beyond array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      arr.fill(9, 1, 10);
      expect(arr.toString()).assertEqual('1,9,9,9');
    })
  })
}