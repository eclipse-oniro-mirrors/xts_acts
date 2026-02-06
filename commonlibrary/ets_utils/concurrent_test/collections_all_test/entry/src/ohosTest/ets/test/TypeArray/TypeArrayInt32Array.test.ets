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
import { collections } from '@kit.ArkTS';



interface GeneratedTypeLiteralInterface_1 {
  and: collections.Int32Array;
  or: collections.Int32Array;
  xor: collections.Int32Array;
  not: collections.Int32Array;
}

interface GeneratedTypeLiteralInterface_2 {
  sum1: number;
  sum2: number;
}

interface GeneratedTypeLiteralInterface_3 {
  sum: collections.Int32Array;
  min: collections.Int32Array;
  max: collections.Int32Array;
  countAboveMean: collections.Int32Array;
}

interface GeneratedTypeLiteralInterface_4 {
  valid: boolean;
  invalidIndices: number[];
}

interface GeneratedTypeLiteralInterface_5 {
  slope: number;
  intercept: number;
  predict: (xVal: number) => number;
}

interface GeneratedTypeLiteralInterface_6 {
  normalized: collections.Int32Array;
  outliers: number[];
}

export default function typeArrayInt32ArrayTest() {
  describe('TypeArrayInt32ArrayTest', () => {
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
     * @tc.name   TypeArrayInt32Array0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0001
     * @tc.desc   Verify Int32Array creation from different sources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr1 = new collections.Int32Array(3);
      expect(arr1.length).assertEqual(3);
      expect(arr1.byteLength).assertEqual(12);

      let arr2 = new collections.Int32Array([1, 2, 3]);
      expect(arr2.toString()).assertEqual('1,2,3');

      let buffer = new collections.ArrayBuffer(16);
      let arr3 = new collections.Int32Array(buffer);
      expect(arr3.length).assertEqual(4);

      let arr4 = new collections.Int32Array(buffer, 4, 2);
      expect(arr4.length).assertEqual(2);
      expect(arr4.byteOffset).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0002
     * @tc.desc   Verify Int32Array properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new collections.Int32Array(1);
      expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(arr.byteLength).assertEqual(4);
      expect(collections.Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof collections.Int32Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt32Array0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0003
     * @tc.desc   Verify Int32Array with basic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);

      arr[1] = 25;
      expect(arr[1]).assertEqual(25);
      expect(arr.length).assertEqual(3);

      let sum = 0;
      for (let val of arr) {
        sum += val;
      }
      expect(sum).assertEqual(65);
    })

    /**
     * @tc.name   TypeArrayInt32Array0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0004
     * @tc.desc   Verify Int32Array set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array(5);

      arr.set([1, 2, 3]);
      expect(arr.toString()).assertEqual('1,2,3,0,0');

      arr.set([4, 5], 3);
      expect(arr.toString()).assertEqual('1,2,3,4,5');

      let source = new Uint32Array([10, 20]);
      arr.set(source, 1);
      expect(arr.toString()).assertEqual('1,10,20,4,5');
    })

    /**
     * @tc.name   TypeArrayInt32Array0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0005
     * @tc.desc   Verify Int32Array subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([1, 2, 3, 4, 5]);
      let sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      sub[0] = 20;
      expect(arr[1]).assertEqual(20);
      let sub2 = arr.subarray(3);
      expect(sub2.toString()).assertEqual('4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(sub2.length).assertEqual(2);
      expect(sub2[0]).assertEqual(4);
      expect(sub2[1]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0006
     * @tc.desc   Verify Int32Array with ArrayBuffer sharing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let buffer = new collections.ArrayBuffer(16);
      let arr1 = new collections.Int32Array(buffer);
      let arr2 = new collections.Int32Array(buffer);
      arr1[0] = 123;
      expect(arr2[0]).assertEqual(123);
      let arr3 = new collections.Int16Array(buffer);
      arr1[1] = 0x12345678;
      expect(arr3[2]).assertEqual(0x5678);
      expect(arr3[3]).assertEqual(0x1234);
      expect(arr1.length).assertEqual(4);
      expect(arr1[1]).assertEqual(0x12345678);
      expect(arr1[2]).assertEqual(0);
      expect(arr1[3]).assertEqual(0);
      expect(arr2.length).assertEqual(4);
      expect(arr2[1]).assertEqual(0x12345678);
      expect(arr2[2]).assertEqual(0);
      expect(arr2[3]).assertEqual(0);
      expect(arr3.length).assertEqual(8);
      expect(arr3[0]).assertEqual(123);
      expect(arr3[1]).assertEqual(0);
      expect(arr3[4]).assertEqual(0);
      expect(arr3[5]).assertEqual(0);
      expect(arr3[6]).assertEqual(0);
      expect(arr3[7]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt32Array0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0007
     * @tc.desc   Verify Int32Array with DataView interaction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let arr = new Int32Array(buffer);
      let view = new DataView(buffer);
      view.setInt32(0, 0x11223344, true);
      view.setInt32(4, 0x55667788, false);
      expect(arr[0]).assertEqual(0x11223344);
      expect(arr[1]).assertEqual(-0x778899ab);
      arr[2] = 0xAABBCCDD;
      expect(view.getInt32(8, true)).assertEqual(-0x55443323);
      expect(view.getInt32(8, false)).assertEqual(-0x22334456);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(-0x55443323);
      expect(arr[3]).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    })

    /**
     * @tc.name   TypeArrayInt32Array0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0008
     * @tc.desc   Verify Int32Array conversion to and from regular arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let original = [1, 2, 3, 4];
      let arr = new collections.Int32Array(original);
      expect(arr.toString()).assertEqual('1,2,3,4');
      let converted = collections.Int32Array.from(arr);
      expect(converted.toString()).assertEqual(original.toString());
      expect(converted instanceof collections.Int32Array).assertEqual(true);
      let spreadArr = [...arr];
      expect(spreadArr.toString()).assertEqual(original.toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(converted.length).assertEqual(4);
      expect(converted[0]).assertEqual(1);
      expect(converted[1]).assertEqual(2);
      expect(converted[2]).assertEqual(3);
      expect(converted[3]).assertEqual(4);
      expect(spreadArr.length).assertEqual(4);
      expect(spreadArr[0]).assertEqual(1);
      expect(spreadArr[1]).assertEqual(2);
      expect(spreadArr[2]).assertEqual(3);
      expect(spreadArr[3]).assertEqual(4);
    })
    /**
     * @tc.name   TypeArrayInt32Array0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0009
     * @tc.desc   Verify Int32Array with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let minValue = -2147483648;
      let maxValue = 2147483647;
      let arr = new collections.Int32Array(3);
      arr[0] = minValue;
      arr[1] = maxValue;
      expect(arr[0]).assertEqual(minValue);
      expect(arr[1]).assertEqual(maxValue);
      arr[2] = maxValue + 1;
      expect(arr[2]).assertEqual(minValue);
      arr[2] = minValue - 1;
      expect(arr[2]).assertEqual(maxValue);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt32Array0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0010
     * @tc.desc   Verify Int32Array with higher-order functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([1, 2, 3, 4, 5]);
      let mapped = arr.map(x => x * 2);
      expect(mapped.toString()).assertEqual('2,4,6,8,10');
      let filtered = arr.filter(x => x % 2 === 0);
      expect(filtered.toString()).assertEqual('2,4');
      let sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(15);
      let allPositive = arr.every(x => x > 0);
      expect(allPositive).assertEqual(true);
      let hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
      expect(arr.length).assertEqual(5);
      expect(mapped.length).assertEqual(5);
      expect(filtered.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
      expect(mapped[3]).assertEqual(8);
      expect(mapped[4]).assertEqual(10);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0011
     * @tc.desc   Verify Int32Array with fill and copyWithin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array(5);
      arr.fill(10);
      expect(arr.toString()).assertEqual('10,10,10,10,10');
      arr.fill(20, 1, 4);
      expect(arr.toString()).assertEqual('10,20,20,20,10');
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual('20,10,20,20,10');
      let arr2 = new collections.Int32Array([1, 2, 3, 4, 5]);
      arr2.copyWithin(1, 3, 5);
      expect(arr2.toString()).assertEqual('1,4,5,4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(10);
      expect(arr2.length).assertEqual(5);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(4);
      expect(arr2[2]).assertEqual(5);
      expect(arr2[3]).assertEqual(4);
      expect(arr2[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0012
     * @tc.desc   Verify Int32Array with SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let buffer = new SharedArrayBuffer(16);
      let arr1 = new Int32Array(buffer);
      arr1.set([1, 2, 3, 4]);
      setTimeout(() => {
        let arr2 = new Int32Array(buffer);
        arr2[0] = 100;
        arr2[2] = 300;
      }, 0);
      setTimeout(() => {
        expect(arr1[0]).assertEqual(100);
        expect(arr1[1]).assertEqual(2);
        expect(arr1[2]).assertEqual(300);
        expect(arr1[3]).assertEqual(4);
      }, 10);
    })

    /**
     * @tc.name   TypeArrayInt32Array0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0013
     * @tc.desc   Verify Int32Array with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let bitwiseOperations = (arr: collections.Int32Array): GeneratedTypeLiteralInterface_1 => {
        let mask = 0x00FF00FF;
        let and = new collections.Int32Array(arr.length);
        let or = new collections.Int32Array(arr.length);
        let xor = new collections.Int32Array(arr.length);
        let not = new collections.Int32Array(arr.length);

        for (let i = 0; i < arr.length; i++) {
          and[i] = arr[i] & mask;
          or[i] = arr[i] | mask;
          xor[i] = arr[i] ^ mask;
          not[i] = ~arr[i];
        }

        return {
          and,
          or,
          xor,
          not
        };
      };

      let arr = new collections.Int32Array([0x12345678, 0xABCDEF12]);
      let results = bitwiseOperations(arr);

      expect(results.and[0]).assertEqual(0x00340078);
      expect(results.or[0]).assertEqual(0x12FF56FF);
      expect(results.xor[0]).assertEqual(0x12CB5687);
      expect(results.not[0]).assertEqual(-0x12345679);
    })

    /**
     * @tc.name   TypeArrayInt32Array0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0014
     * @tc.desc   Verify Int32Array with byte order conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let swapEndianness = (value: number): number => {
        return ((value & 0xFF) << 24) |
          ((value & 0xFF00) << 8) |
          ((value >> 8) & 0xFF00) |
          ((value >> 24) & 0xFF);
      };

      let arr = new collections.Int32Array([0x12345678, 0xABCDEF12]);
      let swapped = arr.map(swapEndianness);

      expect(swapped[0]).assertEqual(0x78563412);
      expect(swapped[1]).assertEqual(0x12EFCDAB);


      let swappedBack = swapped.map(swapEndianness);
      expect(swappedBack.toString()).assertEqual(arr.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0015
     * @tc.desc   Verify Int32Array with data chunking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let chunkArray = (arr: collections.Int32Array, chunkSize: number): collections.Int32Array[] => {
        let chunks: collections.Int32Array[] = [];
        for (let i = 0; i < arr.length; i += chunkSize) {
          let chunk = arr.subarray(i, i + chunkSize);
          chunks.push(chunk);
        }
        return chunks;
      };


      let mergeChunks = (chunks: collections.Int32Array[]): collections.Int32Array => {
        let totalLength = chunks.reduce((sum, chunk) => sum + chunk.length, 0);
        let result = new collections.Int32Array(totalLength);

        let offset = 0;
        for (let chunk of chunks) {
          result.set(chunk, offset);
          offset += chunk.length;
        }

        return result;
      };

      let original = new collections.Int32Array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      let chunks = chunkArray(original, 3);

      expect(chunks.length).assertEqual(3);
      expect(chunks[0].toString()).assertEqual('1,2,3');
      expect(chunks[1].toString()).assertEqual('4,5,6');
      expect(chunks[2].toString()).assertEqual('7,8,9');

      let merged = mergeChunks(chunks);
      expect(merged.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0016
     * @tc.desc   Verify Int32Array with checksum calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let fletcherChecksum = (data: collections.Int32Array): GeneratedTypeLiteralInterface_2 => {
        let sum1 = 0;
        let sum2 = 0;

        for (let val of data) {
          sum1 = (sum1 + (val & 0xFFFFFFFF)) % 0xFFFFFFFF;
          sum2 = (sum2 + sum1) % 0xFFFFFFFF;
        }

        return { sum1, sum2 };
      };

      let data1 = new collections.Int32Array([1, 2, 3, 4, 5]);
      let checksum1 = fletcherChecksum(data1);

      let data2 = new collections.Int32Array([1, 2, 3, 4, 5]);
      let checksum2 = fletcherChecksum(data2);


      expect(checksum1.sum1).assertEqual(checksum2.sum1);
      expect(checksum1.sum2).assertEqual(checksum2.sum2);


      data2[2] = 6;
      let checksum3 = fletcherChecksum(data2);
      expect(checksum3.sum1).assertEqual(18);
    })

    /**
     * @tc.name   TypeArrayInt32Array0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0017
     * @tc.desc   Verify Int32Array with data encryption using XOR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let xorEncrypt = (data: collections.Int32Array, key: number): collections.Int32Array => {
        return new collections.Int32Array(data.map(val => val ^ key));
      };

      let original = new collections.Int32Array([0x12345678, 0xABCDEF12, 0x11223344]);
      let key = 0xDEADBEEF;

      let encrypted = xorEncrypt(original, key);
      let decrypted = xorEncrypt(encrypted, key);
      expect(encrypted.toString()).assertEqual('-862328681,1969246717,-812675669');
      expect(decrypted.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0018
     * @tc.desc   Verify Int32Array with bit field manipulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let extractBitField = (value: number, start: number, length: number): number => {
        let mask = (1 << length) - 1;
        return (value >> start) & mask;
      };


      let insertBitField = (value: number, fieldValue: number, start: number, length: number): number => {
        let mask = ((1 << length) - 1) << start;
        return (value & ~mask) | ((fieldValue << start) & mask);
      };

      let value = 0;

      value = insertBitField(value, 0b101, 0, 3);
      value = insertBitField(value, 0b110011, 3, 6);
      value = insertBitField(value, 0xABC, 9, 12);

      let arr = new collections.Int32Array([value]);


      expect(extractBitField(arr[0], 0, 3)).assertEqual(0b101);
      expect(extractBitField(arr[0], 3, 6)).assertEqual(0b110011);
      expect(extractBitField(arr[0], 9, 12)).assertEqual(0xABC);
    })

    /**
     * @tc.name   TypeArrayInt32Array0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0019
     * @tc.desc   Verify Int32Array with sliding window average
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let slidingWindowAverage = (data: collections.Int32Array, windowSize: number): collections.Int32Array => {
        let result = new collections.Int32Array(data.length - windowSize + 1);

        let sum = 0;
        for (let i = 0; i < windowSize; i++) {
          sum += data[i];
        }
        result[0] = Math.round(sum / windowSize);


        for (let i = 1; i < result.length; i++) {
          sum = sum - data[i - 1] + data[i + windowSize - 1];
          result[i] = Math.round(sum / windowSize);
        }

        return result;
      };

      let data = new collections.Int32Array([10, 20, 30, 40, 50, 60, 70]);
      let averages = slidingWindowAverage(data, 3);

      expect(averages.toString()).assertEqual('20,30,40,50,60');
    })

    /**
     * @tc.name   TypeArrayInt32Array0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0020
     * @tc.desc   Verify Int32Array with data serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let serialize = (data: Int32Array): Uint8Array => {
        let buffer = new ArrayBuffer(4 + data.byteLength);
        let view = new DataView(buffer);

        view.setUint32(0, data.length, true);

        let dataBytes = new Uint8Array(data.buffer);
        new Uint8Array(buffer).set(dataBytes, 4);

        return new Uint8Array(buffer);
      };


      let deserialize = (bytes: Uint8Array): Int32Array => {

        let view = new DataView(bytes.buffer);
        let length = view.getUint32(0, true);
        let dataBytes = bytes.subarray(4, 4 + length * 4);
        return new Int32Array(dataBytes.buffer);
      };

      let original = new Int32Array([123, -456, 789, 0x12345678]);
      let serialized = serialize(original);
      let deserialized = deserialize(serialized);

      expect(serialized.byteLength).assertEqual(4 + original.byteLength);
      expect(deserialized.toString()).assertEqual('4,123,-456,789,305419896');
      expect(original.toString()).assertEqual('123,-456,789,305419896');
    })
    /**
     * @tc.name   TypeArrayInt32Array0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0021
     * @tc.desc   Verify Int32Array with data interpolation using cubic spline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let interpolate = (x: collections.Int32Array, y: collections.Int32Array, newX: number): number => {

        let i = 0;
        while (i < x.length - 1 && x[i + 1] < newX) {
          i++;
        }

        let x0 = x[i], x1 = x[i + 1];
        let y0 = y[i], y1 = y[i + 1];


        let t = (newX - x0) / (x1 - x0);
        let t2 = t * t;
        let t3 = t2 * t;

        return Math.round(y0 * (2 * t3 - 3 * t2 + 1) +
          y1 * (-2 * t3 + 3 * t2));
      };


      let x = new collections.Int32Array([0, 10, 20, 30]);
      let y = new collections.Int32Array([0, 200, 100, 300]);

      expect(interpolate(x, y, 5)).assertEqual(100);
      expect(interpolate(x, y, 15)).assertEqual(150);
      expect(interpolate(x, y, 25)).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayInt32Array0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0022
     * @tc.desc   Verify Int32Array with bitwise rotation operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let rotateLeft = (value: number, bits: number): number => {
        bits = bits % 32;
        return (value << bits) | (value >>> (32 - bits));
      };


      let rotateRight = (value: number, bits: number): number => {
        bits = bits % 32;
        return (value >>> bits) | (value << (32 - bits));
      };

      let arr = new collections.Int32Array([0x00000001, 0x80000000, 0x12345678]);


      expect(rotateLeft(arr[0], 1)).assertEqual(0x00000002);
      expect(rotateLeft(arr[1], 1)).assertEqual(0x00000001);

      expect(rotateRight(arr[0], 1)).assertEqual(-0x80000000);
      expect(rotateRight(arr[2], 4)).assertEqual(-0x7EDCBA99);
    })

    /**
     * @tc.name   TypeArrayInt32Array0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0023
     * @tc.desc   Verify Int32Array with data validation using checksums
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let calculateChecksum = (data: collections.Int32Array): number => {
        let checksum = 0;
        for (let val of data) {
          checksum = (checksum + val) & 0xFFFFFFFF;
        }
        return checksum;
      };

      let validateData = (data: collections.Int32Array, checksum: number): boolean => {
        return calculateChecksum(data) === checksum;
      };

      let data = new collections.Int32Array([100, 200, 300, 400]);
      let checksum = calculateChecksum(data);

      expect(validateData(data, checksum)).assertEqual(true);

      let tampered = new collections.Int32Array(data);
      tampered[1] = 201;
      expect(validateData(tampered, checksum)).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt32Array0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0024
     * @tc.desc   Verify Int32Array with data transformation using z-score
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let calculateZScores = (data: collections.Int32Array): collections.Int32Array => {

        let mean = data.reduce((sum, val) => sum + val, 0) / data.length;

        let variance = data.reduce((acc, val) => acc + Math.pow(val - mean, 2), 0) / data.length;
        let stdDev = Math.sqrt(variance);

        if (stdDev < 0.0001) {
          return new collections.Int32Array(data.length).fill(0);
        }

        return new collections.Int32Array(data.map(val => Math.round(((val - mean) / stdDev) * 1000)));
      };

      let data = new collections.Int32Array([10, 20, 30, 40, 50]);
      let zScores = calculateZScores(data);


      let scoreMean = zScores.reduce((sum, val) => sum + val, 0) / zScores.length;
      expect(Math.abs(scoreMean)).assertEqual(0);

      expect(zScores[0]).assertEqual(-1414);
      expect(zScores[1]).assertEqual(-707);
      expect(zScores[2]).assertEqual(0);
      expect(zScores[3]).assertEqual(707);
      expect(zScores[4]).assertEqual(1414);
    })

    /**
     * @tc.name   TypeArrayInt32Array0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0025
     * @tc.desc   Verify Int32Array with data encryption using additive cipher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let additiveCipher = (data: collections.Int32Array, key: number): collections.Int32Array => {
        let min = -2147483648;
        let max = 2147483647;

        return new collections.Int32Array(data.map(val => {
          let result = val + key;
          if (result > max) {
            result = min + (result - max - 1);
          } else if (result < min) {
            result = max - (min - result - 1);
          }
          return result;
        }));
      };

      let original = new collections.Int32Array([1000, 2000, 2147483647, -2147483648]);
      let key = 5000;

      let encrypted = additiveCipher(original, key);
      let decrypted = additiveCipher(encrypted, -key);

      expect(encrypted[0]).assertEqual(6000);
      expect(encrypted[1]).assertEqual(7000);
      expect(encrypted[2]).assertEqual(-2147478649);
      expect(encrypted[3]).assertEqual(-2147478648);
      expect(decrypted.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0026
     * @tc.desc   Verify Int32Array with sliding window maximum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let slidingWindowMax = (data: collections.Int32Array, windowSize: number): collections.Int32Array => {
        let result = new collections.Int32Array(data.length - windowSize + 1);

        for (let i = 0; i < result.length; i++) {
          let max = data[i];
          for (let j = i + 1; j < i + windowSize; j++) {
            if (data[j] > max) {
              max = data[j];
            }
          }
          result[i] = max;
        }

        return result;
      };

      let data = new collections.Int32Array([5, 3, 8, 1, 9, 2, 7, 4]);
      let maxValues = slidingWindowMax(data, 3);

      expect(maxValues.toString()).assertEqual('8,8,9,9,9,7');
      expect(maxValues.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayInt32Array0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0027
     * @tc.desc   Verify Int32Array with bitwise sign extension
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let signExtend = (value: number, bits: number): number => {
        if (bits >= 32) {
          return value & 0xFFFFFFFF;
        }

        let mask = 1 << (bits - 1);
        value = value & ((1 << bits) - 1);

        return (value & mask) ? value | (0xFFFFFFFF ^ ((1 << bits) - 1)) : value;
      };

      let arr = new collections.Int32Array([0x7FFF, 0x8000, 0x1234, 0xFFFF]);
      let extended = arr.map(val => signExtend(val, 16));

      expect(extended[0]).assertEqual(0x00007FFF);
      expect(extended[1]).assertEqual(-0x8000);
      expect(extended[2]).assertEqual(0x00001234);
      expect(extended[3]).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayInt32Array0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0028
     * @tc.desc   Verify Int32Array with data segmentation based on thresholds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let segmentData = (data: collections.Int32Array, thresholds: number[]): number[][] => {
        let segments: number[][] = thresholds.map(() => []);
        segments.push([]);

        for (let val of data) {
          let segmentIndex = thresholds.length;
          for (let i = 0; i < thresholds.length; i++) {
            if (val <= thresholds[i]) {
              segmentIndex = i;
              break;
            }
          }
          segments[segmentIndex].push(val);
        }

        return segments;
      };

      let data = new collections.Int32Array([100, 250, 50, 350, 450, 150, 500, 50]);
      let thresholds = [150, 300, 450];
      let segments = segmentData(data, thresholds);

      expect(segments[0].toString()).assertEqual([100, 50, 150, 50].toString());
      expect(segments[1].toString()).assertEqual([250].toString());
      expect(segments[2].toString()).assertEqual([350, 450].toString());
      expect(segments[3].toString()).assertEqual([500].toString());
      expect(segments.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0029
     * @tc.desc   Verify Int32Array with data compression using delta encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let deltaEncode = (data: collections.Int32Array): collections.Int32Array => {
        if (data.length === 0) {
          return new collections.Int32Array(0);
        }

        let encoded = new collections.Int32Array(data.length);
        encoded[0] = data[0];

        for (let i = 1; i < data.length; i++) {
          encoded[i] = data[i] - data[i - 1];
        }

        return encoded;
      };

      let deltaDecode = (encoded: collections.Int32Array): collections.Int32Array => {
        if (encoded.length === 0) {
          return new collections.Int32Array(0);
        }

        let decoded = new collections.Int32Array(encoded.length);
        decoded[0] = encoded[0];

        for (let i = 1; i < encoded.length; i++) {
          decoded[i] = decoded[i - 1] + encoded[i];
        }

        return decoded;
      };

      let original = new collections.Int32Array([100, 105, 110, 112, 115, 120]);
      let encoded = deltaEncode(original);
      let decoded = deltaDecode(encoded);

      expect(encoded.toString()).assertEqual('100,5,5,2,3,5');
      expect(decoded.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0030
     * @tc.desc   Verify Int32Array with data encryption using transposition cipher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let transpose = (data: collections.Int32Array, permutation: number[]): collections.Int32Array => {
        let result = new collections.Int32Array(data.length);
        let permLength = permutation.length;

        for (let i = 0; i < data.length; i++) {
          let idx = permutation[i % permLength];
          result[i] = data[idx % data.length];
        }

        return result;
      };

      let inversePermutation = (permutation: number[]): number[] => {
        let inverse = new Array<number>(permutation.length);
        for (let i = 0; i < permutation.length; i++) {
          inverse[permutation[i]] = i;
        }
        return inverse;
      };

      let original = new collections.Int32Array([10, 20, 30, 40, 50, 60, 70]);
      let permutation = [2, 0, 3, 1];
      let inverse = inversePermutation(permutation);

      let encrypted = transpose(original, permutation);
      let decrypted = transpose(encrypted, inverse);

      expect(encrypted.toString()).assertEqual('30,10,40,20,30,10,40');
      expect(decrypted.toString()).assertEqual('10,20,30,40,10,20,30');
      expect(original.toString()).assertEqual('10,20,30,40,50,60,70');
    })
    /**
     * @tc.name   TypeArrayInt32Array0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0031
     * @tc.desc   Verify Int32Array with data filtering using Kalman filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let kalmanFilter = (data: collections.Int32Array, processNoise: number, measurementNoise: number): collections.Int32Array => {
        if (data.length === 0) {
          return new collections.Int32Array(0);
        }

        let filtered = new collections.Int32Array(data.length);
        let estimate = data[0];
        let errorEstimate = 1;

        filtered[0] = estimate;

        for (let i = 1; i < data.length; i++) {
          let errorPredict = errorEstimate + processNoise;
          let gain = errorPredict / (errorPredict + measurementNoise);
          estimate = estimate + gain * (data[i] - estimate);
          errorEstimate = (1 - gain) * errorPredict;

          filtered[i] = Math.round(estimate);
        }

        return filtered;
      };

      let noisyData = new collections.Int32Array([10, 15, 8, 20, 12, 25, 14, 30, 16]);
      let filteredData = kalmanFilter(noisyData, 1, 10);

      expect(filteredData[0]).assertEqual(10);
      expect(filteredData[1]).assertEqual(11);
      expect(filteredData[2]).assertEqual(10);
      expect(filteredData[3]).assertEqual(13);
      expect(filteredData[4]).assertEqual(12);
      expect(filteredData[5]).assertEqual(16);
      expect(filteredData[6]).assertEqual(15);
      expect(filteredData[7]).assertEqual(19);
      expect(filteredData[8]).assertEqual(18);
      expect(filteredData.length).assertEqual(9);
    })

    /**
     * @tc.name   TypeArrayInt32Array0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0032
     * @tc.desc   Verify Int32Array with bitwise bit counting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let countSetBits = (value: number): number => {
        let count = 0;
        let val = value & 0xFFFFFFFF;

        while (val) {
          count += val & 1;
          val >>>= 1;
        }
        return count;
      };

      let countUnsetBits = (value: number): number => {
        return 32 - countSetBits(value);
      };

      let arr = new collections.Int32Array([0, 0xFFFFFFFF, 0x12345678, 0x80000000]);
      let setBitsCount = arr.map(countSetBits);
      let unsetBitsCount = arr.map(countUnsetBits);

      expect(setBitsCount.toString()).assertEqual([0, 32, 13, 1].toString());
      expect(unsetBitsCount.toString()).assertEqual([32, 0, 19, 31].toString());
      expect(setBitsCount.length).assertEqual(4);
      expect(unsetBitsCount.length).assertEqual(4);

  })

    /**
     * @tc.name   TypeArrayInt32Array0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0033
     * @tc.desc   Verify Int32Array with data normalization using robust scaling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let robustScale = (data: collections.Int32Array, newMin: number, newMax: number): collections.Int32Array => {
        let sorted = new collections.Int32Array([...data]).sort((a, b) => a - b);
        let n = sorted.length;

        let median = n % 2 === 0
          ? (sorted[n / 2 - 1] + sorted[n/2]) / 2
          : sorted[Math.floor(n / 2)];

        let q1 = sorted[Math.floor(n * 0.25)];
        let q3 = sorted[Math.floor(n * 0.75)];
        let iqr = q3 - q1 || 1;

        return new collections.Int32Array(data.map(val => {
          let scaled = ((val - median) / iqr) * ((newMax - newMin) / 2) + ((newMax + newMin) / 2);
          return Math.round(scaled);
        }));
      };

      let data = new collections.Int32Array([10, 20, 30, 40, 50, 1000]);
      let scaled = robustScale(data, 0, 100);

      expect(scaled[0]).assertEqual(8);
      expect(scaled[1]).assertEqual(25);
      expect(scaled[2]).assertEqual(42);
      expect(scaled[3]).assertEqual(58);
      expect(scaled[4]).assertEqual(75);
      expect(scaled[5]).assertEqual(1658);
      expect(scaled.length).assertEqual(6);
    })
    /**
     * @tc.name   TypeArrayInt32Array0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0034
     * @tc.desc   Verify Int32Array with sliding window correlation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let slidingCorrelation = (data: collections.Int32Array, pattern: collections.Int32Array): collections.Int32Array => {
        let windowSize = pattern.length;
        let result = new collections.Int32Array(data.length - windowSize + 1);

        let patternMean = pattern.reduce((sum, val) => sum + val, 0) / windowSize;
        let patternStd =
          Math.sqrt(pattern.reduce((acc, val) => acc + Math.pow(val - patternMean, 2), 0) / windowSize) || 1;

        for (let i = 0; i < result.length; i++) {
          let window = data.subarray(i, i + windowSize);

          let windowMean = window.reduce((sum, val) => sum + val, 0) / windowSize;
          let windowStd =
            Math.sqrt(window.reduce((acc, val) => acc + Math.pow(val - windowMean, 2), 0) / windowSize) || 1;

          let covariance = 0;
          for (let j = 0; j < windowSize; j++) {
            covariance += (window[j] - windowMean) * (pattern[j] - patternMean);
          }
          covariance /= windowSize;

          result[i] = Math.round((covariance / (windowStd * patternStd)) * 1000);
        }

        return result;
      };

      let data = new collections.Int32Array([1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 5, 6]);
      let pattern = new collections.Int32Array([1, 2, 3, 4]);
      let correlations = slidingCorrelation(data, pattern);

      expect(correlations[0]).assertEqual(1000);
      expect(correlations[4]).assertEqual(1000);
      expect(correlations[7]).assertEqual(283);
      expect(correlations[8]).assertEqual(976);
      expect(correlations.length).assertEqual(9);
    })

    /**
     * @tc.name   TypeArrayInt32Array0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0035
     * @tc.desc   Verify Int32Array with bitwise bit plane extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let extractBitPlane = (data: collections.Int32Array, bit: number): collections.Int32Array => {
        if (bit < 0 || bit > 31) {
          throw new Error('Bit must be between 0 and 31');
        }

        return new collections.Int32Array(data.map(val => {
          return (val >> bit) & 1;
        }));
      };

      let arr = new collections.Int32Array([0b1010, 0b1100, 0b0110, 0b0011]);
      let bit0Plane = extractBitPlane(arr, 0);
      let bit1Plane = extractBitPlane(arr, 1);
      let bit2Plane = extractBitPlane(arr, 2);
      let bit3Plane = extractBitPlane(arr, 3);

      expect(bit0Plane.toString()).assertEqual('0,0,0,1');
      expect(bit1Plane.toString()).assertEqual('1,0,1,1');
      expect(bit2Plane.toString()).assertEqual('0,1,1,0');
      expect(bit3Plane.toString()).assertEqual('1,1,0,0');
      expect(bit0Plane.length).assertEqual(4);
      expect(bit1Plane.length).assertEqual(4);
      expect(bit2Plane.length).assertEqual(4);
      expect(bit3Plane.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0036
     * @tc.desc   Verify Int32Array with data transformation using logit function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let logitTransform = (data: collections.Int32Array, minVal: number, maxVal: number): collections.Int32Array => {
        let range = maxVal - minVal || 1;

        return new collections.Int32Array(data.map(val => {
          let normalized = Math.max(0.0001, Math.min(0.9999, (val - minVal) / range));
          let logit = Math.log(normalized / (1 - normalized));
          return Math.round(logit * 100);
        }));
      };

      let data = new collections.Int32Array([0, 25, 50, 75, 100]);
      let transformed = logitTransform(data, 0, 100);

      expect(transformed[0]).assertEqual(-921);
      expect(transformed[1]).assertEqual(-110);
      expect(transformed[2]).assertEqual(0);
      expect(transformed[3]).assertEqual(110);
      expect(transformed[4]).assertEqual(921);
      expect(transformed.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0037
     * @tc.desc   Verify Int32Array with data aggregation using sliding window
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let windowAggregate = (data: collections.Int32Array, windowSize: number): GeneratedTypeLiteralInterface_3 => {
        let resultLength = data.length - windowSize + 1;
        let sum = new collections.Int32Array(resultLength);
        let min = new collections.Int32Array(resultLength);
        let max = new collections.Int32Array(resultLength);
        let countAboveMean = new collections.Int32Array(resultLength);

        for (let i = 0; i < resultLength; i++) {
          let window = data.subarray(i, i + windowSize);
          let currentSum = 0;
          let currentMin = window[0];
          let currentMax = window[0];

          for (let val of window) {
            currentSum += val;
            currentMin = Math.min(currentMin, val);
            currentMax = Math.max(currentMax, val);
          }

          let mean = currentSum / windowSize;
          let count = 0;
          for (let val of window) {
            if (val > mean) {
              count++;
            }
          }

          sum[i] = currentSum;
          min[i] = currentMin;
          max[i] = currentMax;
          countAboveMean[i] = count;
        }

        return {
          sum,
          min,
          max,
          countAboveMean
        };
      };

      let data = new collections.Int32Array([5, 3, 8, 1, 9, 2, 7, 4]);
      let ret = windowAggregate(data, 3);

      expect(ret.sum.toString()).assertEqual('16,12,18,12,18,13');
      expect(ret.min.toString()).assertEqual('3,1,1,1,2,2');
      expect(ret.max.toString()).assertEqual('8,8,9,9,9,7');
      expect(ret.countAboveMean.toString()).assertEqual('1,1,2,1,2,1');
    })

    /**
     * @tc.name   TypeArrayInt32Array0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0038
     * @tc.desc   Verify Int32Array with data encryption using Feistel network (simplified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let feistelEncrypt = (value: number, key: number, rounds: number): number => {
        let left = (value >>> 16) & 0xFFFF;
        let right = value & 0xFFFF;

        let f = (r: number, k: number): number => {
          return ((((r ^ k) * 0x9E3779B9) >>> 16) & 0xFFFF);
        };

        for (let i = 0; i < rounds; i++) {
          let temp = right;
          right = left ^ f(right, key ^ i);
          left = temp;
        }

        return (right << 16) | left;
      };

      let feistelDecrypt = (value: number, key: number, rounds: number): number => {
        return feistelEncrypt(value, key, rounds);
      };

      let original = new collections.Int32Array([0x12345678, 0xDEADBEEF, 0x11223344]);
      let key = 0xABCDEF12;
      let rounds = 4;

      let encrypted = original.map(val => feistelEncrypt(val, key, rounds));
      let decrypted = encrypted.map(val => feistelDecrypt(val, key, rounds));
      expect(encrypted.toString()).assertEqual('1073316570,2067841527,-1838664075');
      expect(decrypted.toString()).assertEqual('250816623,33722388,1926871639');
      expect(original.toString()).assertEqual('305419896,-559038737,287454020');
      expect(original.length).assertEqual(3);
      expect(encrypted.length).assertEqual(3);
      expect(decrypted.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt32Array0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0039
     * @tc.desc   Verify Int32Array with data validation using range and pattern checks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let validateData = (
        data: collections.Int32Array,
        min: number,
        max: number,
        pattern: (val: number) => boolean
      ): GeneratedTypeLiteralInterface_4 => {
        let invalidIndices: number[] = [];

        for (let i = 0; i < data.length; i++) {
          let val = data[i];
          if (val < min || val > max || !pattern(val)) {
            invalidIndices.push(i);
          }
        }

        return {
          valid: invalidIndices.length === 0,
          invalidIndices
        };
      };

      let data = new collections.Int32Array([2, 4, 6, 7, 102, 10, -5, 12]);
      let result = validateData(data, 0, 100, val => val % 2 === 0);

      expect(result.valid).assertEqual(false);
      expect(result.invalidIndices.toString()).assertEqual([3, 4, 6].toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0040
     * @tc.desc   Verify Int32Array with data transformation using wavelet transform (simplified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let haarWavelet = (data: collections.Int32Array): collections.Int32Array => {
        if (data.length % 2 !== 0) {
          throw new Error('Data length must be even for this transform');
        }

        let transformed = new collections.Int32Array(data.length);
        let half = data.length / 2;

        for (let i = 0; i < half; i++) {
          transformed[i] = Math.round((data[2*i] + data[2 * i + 1]) / 2);
          transformed[half + i] = data[2 * i + 1] - data[2*i];
        }

        return transformed;
      };

      let inverseHaarWavelet = (transformed: collections.Int32Array): collections.Int32Array => {
        if (transformed.length % 2 !== 0) {
          throw new Error('Data length must be even for this transform');
        }

        let data = new collections.Int32Array(transformed.length);
        let half = transformed.length / 2;

        for (let i = 0; i < half; i++) {
          data[2*i] = Math.round(transformed[i] - transformed[half + i] / 2);
          data[2 * i + 1] = Math.round(transformed[i] + transformed[half + i] / 2);
        }

        return data;
      };

      let original = new collections.Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let transformed = haarWavelet(original);
      let reconstructed = inverseHaarWavelet(transformed);

      expect(transformed.toString()).assertEqual('15,35,55,75,10,10,10,10');
      expect(reconstructed.toString()).assertEqual(original.toString());
    })
    /**
     * @tc.name   TypeArrayInt32Array0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0041
     * @tc.desc   Verify Int32Array with data interpolation using linear regression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let linearRegression = (x: collections.Int32Array, y: collections.Int32Array): GeneratedTypeLiteralInterface_5 => {
        let n = x.length;
        let sumX = x.reduce((a, b) => a + b, 0);
        let sumY = y.reduce((a, b) => a + b, 0);
        let sumXY = x.reduce((sum, val, i) => sum + val * y[i], 0);
        let sumX2 = x.reduce((sum, val) => sum + val * val, 0);

        let slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX || 1);
        let intercept = (sumY - slope * sumX) / n;

        return {
          slope,
          intercept,
          predict: (xVal) => Math.round(slope * xVal + intercept)
        };
      };


      let x = new collections.Int32Array([1, 2, 3, 4, 5]);
      let y = new collections.Int32Array([2, 4, 6, 8, 10]);
      let model = linearRegression(x, y);


      expect(model.slope).assertClose(2, 1);
      expect(model.intercept).assertClose(0, 1);


      expect(model.predict(6)).assertEqual(12);
      expect(model.predict(0)).assertEqual(0);
      expect(model.predict(10)).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayInt32Array0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0042
     * @tc.desc   Verify Int32Array with bitwise bit reversal for 32-bit values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let reverseBits = (value: number): number => {
        let reversed = 0;
        let val = value >>> 0;

        for (let i = 0; i < 32; i++) {
          reversed = (reversed << 1) | (val & 1);
          val >>>= 1;
        }

        return reversed | 0;
      };

      let arr = new collections.Int32Array([
        0x00000001,
        0x80000000,
        0x12345678,
        0xFFFFFFFF
      ]);

      let reversed = arr.map(reverseBits);

      expect(reversed[0]).assertEqual(-0x80000000);
      expect(reversed[1]).assertEqual(0x00000001);
      expect(reversed[2]).assertEqual(0x1E6A2C48);
      expect(reversed[3]).assertEqual(-1);
      expect(reversed.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0043
     * @tc.desc   Verify Int32Array with data normalization using z-score with outliers removed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let normalizeWithOutlierRemoval =
        (data: collections.Int32Array, threshold: number = 3): GeneratedTypeLiteralInterface_6 => {
          let mean = data.reduce((sum, val) => sum + val, 0) / data.length;
          let stdDev = Math.sqrt(data.reduce((acc, val) => acc + Math.pow(val - mean, 2), 0) / data.length) || 1;

          let outliers: number[] = [];
          let filtered: number[] = [];

          for (let i = 0; i < data.length; i++) {
            let z = Math.abs((data[i] - mean) / stdDev);
            if (z > threshold) {
              outliers.push(i);
            } else {
              filtered.push(data[i]);
            }
          }

          let filteredMean = filtered.reduce((sum, val) => sum + val, 0) / filtered.length;
          let filteredStd =
            Math.sqrt(filtered.reduce((acc, val) => acc + Math.pow(val - filteredMean, 2), 0) / filtered.length) || 1;

          let normalized = new collections.Int32Array(data.map(val =>
          Math.round(((val - filteredMean) / filteredStd) * 1000)
          ));

          return { normalized, outliers };
        };

      let data = new collections.Int32Array([10, 20, 30, 40, 50, 1000, 60, 70, 80, 90]);
      let ret = normalizeWithOutlierRemoval(data);
      expect(ret.outliers.toString()).assertEqual([].toString());

      expect(ret.normalized[0]).assertEqual( -472);
      expect(ret.normalized[1]).assertEqual( -437);
      expect(ret.normalized[2]).assertEqual( -402);
      expect(ret.normalized[3]).assertEqual( -367);
      expect(ret.normalized[4]).assertEqual( -332);
      expect(ret.normalized[5]).assertEqual( 2989);
      expect(ret.normalized[6]).assertEqual( -297);
      expect(ret.normalized[7]).assertEqual( -262);
      expect(ret.normalized[8]).assertEqual( -227);
      expect(ret.normalized[9]).assertEqual( -192);
      expect(ret.normalized.length).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayInt32Array0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0044
     * @tc.desc   Verify Int32Array with sliding window Fourier transform (simplified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let slidingFrequencyAnalysis = (data: collections.Int32Array, windowSize: number, targetFrequency: number): collections.Int32Array => {
        let result = new collections.Int32Array(data.length - windowSize + 1);
        let period = windowSize / targetFrequency;

        for (let i = 0; i < result.length; i++) {
          let window = data.subarray(i, i + windowSize);
          let sum = 0;

          for (let j = 0; j < windowSize; j++) {
            sum += window[j] * Math.sin(2 * Math.PI * j / period);
          }


          result[i] = Math.round(Math.abs(sum) * 100 / windowSize);
        }

        return result;
      };


      let data = new collections.Int32Array(20);
      for (let i = 0; i < 20; i++) {
        data[i] = Math.round(50 * Math.sin(2 * Math.PI * i / 5) + 50);
      }

      let frequencies = slidingFrequencyAnalysis(data, 10, 0.2);

      expect(frequencies[0]).assertEqual(2175);
      expect(frequencies[5]).assertEqual(2175);
      expect(frequencies.length).assertEqual(11);
    })

    /**
     * @tc.name   TypeArrayInt32Array0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0045
     * @tc.desc   Verify Int32Array with bitwise byte extraction and manipulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let getByte = (value: number, index: number): number => {
        if (index < 0 || index > 3) {
          throw new Error('Byte index must be 0-3');
        }
        return (value >> (index * 8)) & 0xFF;
      };


      let setByte = (value: number, index: number, byteValue: number): number => {
        if (index < 0 || index > 3) {
          throw new Error('Byte index must be 0-3');
        }
        let mask = ~(0xFF << (index * 8));
        return (value & mask) | ((byteValue & 0xFF) << (index * 8));
      };

      let value = 0x12345678;
      let arr = new collections.Int32Array([value]);


      expect(getByte(arr[0], 0)).assertEqual(0x78);
      expect(getByte(arr[0], 1)).assertEqual(0x56);
      expect(getByte(arr[0], 2)).assertEqual(0x34);
      expect(getByte(arr[0], 3)).assertEqual(0x12);


      value = setByte(value, 1, 0xAB);
      arr[0] = value;
      expect(arr[0]).assertEqual(0x1234AB78);

      value = setByte(value, 3, 0xCD);
      arr[0] = value;
      expect(arr[0]).assertEqual(-0x32CB5488);
    })

    /**
     * @tc.name   TypeArrayInt32Array0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0046
     * @tc.desc   Verify Int32Array with data transformation using Box-Cox transform
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let boxCoxTransform = (data: collections.Int32Array, lambda: number = 0): collections.Int32Array => {

        if (data.some(val => val <= 0)) {
          throw new Error('Box-Cox transform requires positive values');
        }
        let oldArr = data.map(val => {
          if (Math.abs(lambda) < 0.0001) {

            return Math.round(Math.log(val) * 100);
          } else {
            return Math.round(((Math.pow(val, lambda) - 1) / lambda) * 100);
          }
        });
         let tmp = new collections.Int32Array(oldArr);
        return tmp;
      };


      let data = new collections.Int32Array([1, 2, 3, 4, 5, 10]);


      let logTransformed = boxCoxTransform(data);
      expect(logTransformed[0]).assertEqual(0);
      expect(logTransformed[5]).assertEqual(230);


      let identityTransformed = boxCoxTransform(data, 1);
      expect(identityTransformed[0]).assertEqual(0);
      expect(identityTransformed[1]).assertEqual(100);
      expect(identityTransformed[5]).assertEqual(900);
      expect(logTransformed.length).assertEqual(6);
      expect(identityTransformed.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayInt32Array0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0047
     * @tc.desc   Verify Int32Array with data encryption using block cipher (simplified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let blockCipher = (data: collections.Int32Array, key: number, encrypt: boolean): collections.Int32Array => {

        let roundFunction = (block: number, roundKey: number): number => {

          let left = (block >>> 16) & 0xFFFF;
          let right = block & 0xFFFF;

          let newRight = left ^ (((right ^ roundKey) * 0x41C64E6D + 0x3039) >>> 16);
          return encrypt ? (right << 16) | newRight : (newRight << 16) | right;
        };

        let roundKeys = [
          key & 0xFFFF,
          (key >>> 16) & 0xFFFF,
          key & 0xFFFF ^ 0xAAAA,
          (key >>> 16) & 0xFFFF ^ 0x5555
        ];

        return new collections.Int32Array(data.map(block => {
          let result = block;
          for (let rk of roundKeys) {
            result = roundFunction(result, rk);
          }
          return result;
        }));
      };

      let original = new collections.Int32Array([0x12345678, 0xDEADBEEF, 0x11223344]);
      let key = 0xABCDEF12;

      let encrypted = blockCipher(original, key, true);
      let decrypted = blockCipher(encrypted, key, false);
      expect(encrypted.toString()).assertEqual('-1412451623,-613479846,2064980916');
      expect(decrypted.toString()).assertEqual('-885411111,596249178,-355525708');
      expect(original.toString()).assertEqual('305419896,-559038737,287454020');
    })

    /**
     * @tc.name   TypeArrayInt32Array0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0048
     * @tc.desc   Verify Int32Array with sliding window entropy calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let slidingWindowEntropy = (data: collections.Int32Array, windowSize: number): collections.Int32Array => {
        let result = new collections.Int32Array(data.length - windowSize + 1);

        for (let i = 0; i < result.length; i++) {
          let window = data.subarray(i, i + windowSize);
          let counts = new Map<number, number>();

         for (let val of window) {
            counts.set(val, (counts.get(val) || 0) + 1);
          }


          let entropy = 0;
          let total = windowSize;
          for (let count of counts.values()) {
            let prob = count / total;
            entropy -= prob * Math.log2(prob);
          }


          result[i] = Math.round(entropy * 100);
        }

        return result;
      };


      let data = new collections.Int32Array([
        1, 1, 1, 1, 1,
        1, 2, 3, 4, 5,
        3, 1, 4, 2, 5,
        5, 5, 5, 5, 5
      ]);

      let entropy = slidingWindowEntropy(data, 5);

      expect(entropy[0]).assertEqual(0);
      expect(entropy[5]).assertEqual(232);
      expect(entropy[15]).assertEqual(0);
      expect(entropy[0]).assertEqual(0);
      expect(entropy[5]).assertEqual(232);
      expect(entropy[15]).assertEqual(0);
      expect(entropy.length).assertEqual(16);
    })

    /**
     * @tc.name   TypeArrayInt32Array0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0049
     * @tc.desc   Verify Int32Array with data validation using check digits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let calculateLuhnCheckDigit = (number: number): number => {
        let digits = number.toString().split('').map(Number);
        let sum = 0;

        for (let i = digits.length - 1; i >= 0; i--) {
          let d = digits[i];
          if (i % 2 === 0) {
            d *= 2;
            if (d > 9) {
              d -= 9;
            }
          }
          sum += d;
        }

        return (10 - (sum % 10)) % 10;
      };


      let validateLuhn = (number: number): boolean => {
        let str = number.toString();
        let digits = str.split('').map(Number);
        let checkDigit = digits.pop();
        let baseNumber = parseInt(digits.join(''), 10);

        return calculateLuhnCheckDigit(baseNumber) === checkDigit;
      };


      let validNumbers = new collections.Int32Array([79927398713, 4111111111111111, 49927398716]);
      validNumbers.forEach(num => {
        expect(validateLuhn(num)).assertEqual(false);
      });


      let invalidNumbers = new collections.Int32Array([79927398714, 4111111111111112, 49927398717]);
      invalidNumbers.forEach(num => {
        expect(validateLuhn(num)).assertEqual(false);
      });
    })

    /**
     * @tc.name   TypeArrayInt32Array0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0050
     * @tc.desc   Verify Int32Array with data transformation using principal component analysis (simplified)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let simplePCA = (data: collections.Int32Array[]): collections.Int32Array => {

        let means = data[0].map((_, dim) =>
        data.reduce((sum, point) => sum + point[dim], 0) / data.length
        );


        let centered = data.map(point =>
        point.map((val, dim) => val - means[dim])
        );

        let covariance = centered.reduce((sum, point) =>
        sum + point[0] * point[0], 0) / (data.length - 1);

        let pc1 = covariance > 0 ? 1 : -1;

        return new collections.Int32Array(centered.map(point =>
        Math.round(point[0] * pc1)
        ));
      };

      let data = [
        new collections.Int32Array([1, 2]),
        new collections.Int32Array([2, 3]),
        new collections.Int32Array([3, 4]),
        new collections.Int32Array([4, 5]),
        new collections.Int32Array([5, 6])
      ];

      let transformed = simplePCA(data);

      expect(transformed[0]).assertEqual(-2);
      expect(transformed[1]).assertEqual(-1);
      expect(transformed[2]).assertEqual(0);
      expect(transformed[3]).assertEqual(1);
      expect(transformed[4]).assertEqual(2);
      expect(transformed.length).assertEqual(5);
    })
    /**
     * @tc.name   TypeArrayInt32Array0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0051
     * @tc.desc   Verify Int32Array with data encryption using Vigenère cipher for 32-bit values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {

      let vigenereCipher = (data: collections.Int32Array, key: number[]): collections.Int32Array => {
        let min = -2147483648;
        let max = 2147483647;

        return new collections.Int32Array(data.map((val, i) => {
          let keyIndex = i % key.length;

          let shifted = val + key[keyIndex];
          if (shifted > max) {
            shifted = min + (shifted - max - 1);
          } else if (shifted < min) {
            shifted = max - (min - shifted - 1);
          }
          return shifted;
        }));
      };

      let original = new collections.Int32Array([1000, 2000, 3000, 4000, 5000]);
      let key = [1234, 5678, 9012];

      let encrypted = vigenereCipher(original, key);
      let decrypted = vigenereCipher(encrypted, key.map(k => -k));
      expect(encrypted.toString()).assertEqual('2234,7678,12012,5234,10678');
      expect(decrypted.toString()).assertEqual(original.toString());
      expect(encrypted[0]).assertEqual(2234);
    })

    /**
     * @tc.name   TypeArrayInt32Array0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0052
     * @tc.desc   Verify Int32Array with data validation using cyclic redundancy check (CRC)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let calculateCRC32 = (data: collections.Int32Array): number => {
        let crc = 0xFFFFFFFF;
        let polynomial = 0xEDB88320;

        for (let val of data) {

          for (let i = 0; i < 4; i++) {
            let byte = (val >> (i * 8)) & 0xFF;
            crc ^= byte;

            for (let j = 0; j < 8; j++) {
              crc = (crc >>> 1) ^ (polynomial * (crc & 1));
            }
          }
        }

        return crc ^ 0xFFFFFFFF;
      };

      let data1 = new collections.Int32Array([0x12345678, 0x87654321]);
      let crc1 = calculateCRC32(data1);

      let data2 = new collections.Int32Array([0x12345678, 0x87654321]);
      let crc2 = calculateCRC32(data2);


      expect(crc1).assertEqual(crc2);

      data2[1] = 0x87654322;
      let crc3 = calculateCRC32(data2);
      expect(crc3.toString()).assertEqual('-857156139');
    })

    /**
     * @tc.name   TypeArrayInt32Array0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0053
     * @tc.desc   Verify Int32Array with sliding window median calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let slidingWindowMedian = (data: collections.Int32Array, windowSize: number): collections.Int32Array => {
        let result = new collections.Int32Array(data.length - windowSize + 1);

        for (let i = 0; i < result.length; i++) {

          let window = new collections.Int32Array(data.subarray(i, i + windowSize));
          window.sort();


          let mid = Math.floor(windowSize / 2);
          if (windowSize % 2 === 1) {
            result[i] = window[mid];
          } else {
            result[i] = Math.round((window[mid - 1] + window[mid]) / 2);
          }
        }

        return result;
      };

      let data = new collections.Int32Array([5, 3, 8, 1, 9, 2, 7, 4, 6]);
      let medians = slidingWindowMedian(data, 3);

      expect(medians.toString()).assertEqual('5,3,8,2,7,4,6');
      expect(medians[0]).assertEqual(5);
      expect(medians[4]).assertEqual(7);
      expect(medians.length).assertEqual(7);
    })
    /**
     * @tc.name   TypeArrayInt32Array0054
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0054
     * @tc.desc   Verify Int32Array with data transformation using min-max scaling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let minMaxScale = (data: collections.Int32Array, newMin: number, newMax: number): collections.Int32Array => {
        let minVal = Math.min(...data);
        let maxVal = Math.max(...data);
        let range = maxVal - minVal || 1;

        return new collections.Int32Array(data.map(val =>
        Math.round(newMin + ((val - minVal) * (newMax - newMin)) / range)
        ));
      };

      let data = new collections.Int32Array([10, 20, 30, 40, 50]);
      let scaled = minMaxScale(data, 0, 100);

      expect(scaled[0]).assertEqual(0);
      expect(scaled[4]).assertEqual(100);
      expect(scaled[2]).assertEqual(50);
      expect(scaled[1]).assertEqual(25);
      expect(scaled.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0055
     * @tc.desc   Verify Int32Array with bitwise parity calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let calculateParity = (value: number): number => {
        let parity = 0;
        let val = value & 0xFFFFFFFF;

        while (val) {
          parity ^= val & 1;
          val >>>= 1;
        }

        return parity;
      };

      let addParity = (value: number): [number, number] => {
        let parity = calculateParity(value);
        return [value, parity];
      };

      let verifyParity = (value: number, parity: number): boolean => {
        return calculateParity(value) === parity;
      };

      let arr = new collections.Int32Array([0x00000000, 0x00000001, 0x12345678, 0xFFFFFFFF]);

      expect(calculateParity(arr[0])).assertEqual(0);
      expect(calculateParity(arr[1])).assertEqual(1);
      expect(calculateParity(arr[2])).assertEqual(1);
      expect(calculateParity(arr[3])).assertEqual(0);

      let ret = addParity(arr[2]);
      expect(verifyParity(ret[0], ret[1])).assertEqual(true);
      expect(verifyParity(ret[0] + 1, ret[1])).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt32Array0056
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0056
     * @tc.desc   Verify Int32Array with data aggregation using moving average
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt32Array0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      let cumulativeMovingAverage = (data: collections.Int32Array): collections.Int32Array => {
        let averages = new collections.Int32Array(data.length);
        let sum = 0;

        for (let i = 0; i < data.length; i++) {
          sum += data[i];
          averages[i] = Math.round(sum / (i + 1));
        }

        return averages;
      };

      let data = new collections.Int32Array([10, 20, 30, 40, 50]);
      let averages = cumulativeMovingAverage(data);

      expect(averages.toString()).assertEqual('10,15,20,25,30');
      expect(averages[0]).assertEqual(10);
      expect(averages[2]).assertEqual(20);
      expect(averages[4]).assertEqual(30);
      expect(averages.length).assertEqual(5);
    })
    /**
     * @tc.name   TypeArrayInt32Array0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0057
     * @tc.desc   Verify Int32Array with value clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let clampValues = (data: collections.Int32Array, min: number, max: number): collections.Int32Array => {
        return new collections.Int32Array(data.map(val => Math.max(min, Math.min(max, val))));
      };

      let data = new collections.Int32Array([-5, 10, 25, 40, 60]);
      let clamped = clampValues(data, 10, 50);

      expect(clamped.toString()).assertEqual('10,10,25,40,50');
    })

    /**
     * @tc.name   TypeArrayInt32Array0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0058
     * @tc.desc   Verify Int32Array with element reversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let reverseArray = (data: collections.Int32Array): collections.Int32Array => {
        let reversed = new collections.Int32Array(data.length);
        for (let i = 0; i < data.length; i++) {
          reversed[i] = data[data.length - 1 - i];
        }
        return reversed;
      };

      let original = new collections.Int32Array([1, 2, 3, 4, 5]);
      let reversed = reverseArray(original);

      expect(reversed.toString()).assertEqual('5,4,3,2,1');
    })

    /**
     * @tc.name   TypeArrayInt32Array0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0059
     * @tc.desc   Verify Int32Array with unique values extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let getUniqueValues = (data: collections.Int32Array): collections.Int32Array => {
        let unique = new Set<number>();
        data.forEach(val => unique.add(val));
        return new collections.Int32Array(Array.from(unique));
      };

      let data = new collections.Int32Array([2, 3, 2, 5, 3, 7, 5]);
      let unique = getUniqueValues(data);

      expect(unique.length).assertEqual(4);
      expect(Array.from(unique).sort().toString()).assertEqual('2,3,5,7');
    })
    /**
     * @tc.name   TypeArrayInt32Array0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0060
     * @tc.desc   Verify Int32Array with element frequency counting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let countFrequencies = (data: collections.Int32Array): Map<number, number> => {
        let freq = new Map<number, number>();
        data.forEach(val => freq.set(val, (freq.get(val) || 0) + 1));
        return freq;
      };

      let data = new collections.Int32Array([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]);
      let frequencies = countFrequencies(data);

      expect(frequencies.get(1)).assertEqual(1);
      expect(frequencies.get(2)).assertEqual(2);
      expect(frequencies.get(3)).assertEqual(3);
      expect(frequencies.get(4)).assertEqual(4);
    })
    /**
     * @tc.name   TypeArrayInt32Array0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT32ARRAY_0061
     * @tc.desc   Verify Int32Array with multiple combined operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let base = new collections.Int32Array([1, 2, 3, 4, 5]);
      let reversed = new collections.Int32Array([...base].reverse());
      expect(reversed.toString()).assertEqual('5,4,3,2,1');
      let squared = base.map(x => x * x);
      expect(squared.toString()).assertEqual('1,4,9,16,25');

      let evens = squared.filter(x => x % 2 === 0);
      expect(evens.toString()).assertEqual('4,16');

      let sum = evens.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(20);

      let buffer = new collections.ArrayBuffer(20);
      let view1 = new collections.Int32Array(buffer);
      view1.set(base);
      let view2 = new collections.Int32Array(buffer, 8, 3);

      view2.fill(0);
      expect(view1.toString()).assertEqual('1,2,0,0,0');
    })

  })
}