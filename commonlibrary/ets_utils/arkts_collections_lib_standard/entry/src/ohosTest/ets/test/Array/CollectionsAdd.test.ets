/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}


export default function collectionsAddTest() {
  describe('collectionsAddTest', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsTestAdd0100
     * @tc.number SUB_COLLECTION_ADD_CONCAtARRRY_0100
     * @tc.desc   ConcatArray join 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of concatArray) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd0101
     * @tc.number SUB_COLLECTION_ADD_CONCAtARRRY_0101
     * @tc.desc   ConcatArray slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd0101';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of array) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1100
     * @tc.number SUB_COLLECTION_ADD_ARRRY_0100
     * @tc.desc   Array create 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Array(1, 2, 3, 4, 5);
        array.fill(0, 1, 3);
        array.fill(0, 1);
        array.fill(1);
        expect(array.length).assertEqual(5)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1200
     * @tc.number SUB_COLLECTION_ADD_ARRAY_0200
     * @tc.desc   Array 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1200';
        console.info(`${caseName} test start`);
        let container: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of container) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1300
     * @tc.number SUB_COLLECTION_ADD_ARRAY_0300
     * @tc.desc   Array forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1300';
        console.info(`${caseName} test start`);
        let container: collections.Map<number, number> = new collections.Map<number, number>([
          [1, 0],
          [2, 1],
          [3, 2],
        ])
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of container) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2100
     * @tc.number SUB_COLLECTION_ADD_TEST_0100
     * @tc.desc   Array from 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2100';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int8Array(arrayLike)
        expect(collections.Int8Array.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int8Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2200
     * @tc.number SUB_COLLECTION_ADD_TEST_0200
     * @tc.desc   Map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2200';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int16Array(arrayLike)
        expect(collections.Int16Array.BYTES_PER_ELEMENT).assertEqual(2)
        expect(arr.buffer.byteLength).assertEqual(6)
        expect(arr.byteLength).assertEqual(6)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int16Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2300
     * @tc.number SUB_COLLECTION_ADD_TEST_0300
     * @tc.desc   Map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2300';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint16Array(arrayLike)
        expect(collections.Uint16Array.BYTES_PER_ELEMENT).assertEqual(2)
        expect(arr.buffer.byteLength).assertEqual(6)
        expect(arr.byteLength).assertEqual(6)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint16Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2400
     * @tc.number SUB_COLLECTION_ADD_TEST_TEST_0400
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2400';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int32Array(arrayLike)
        expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd3400
     * @tc.number SUB_COLLECTION_ADD_MAP_TEST_0400
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3400';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint32Array(arrayLike)
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsTestAdd3600
     * @tc.number SUB_COLLECTION_ADD_CONCATARRAYMAP_TEST_0600
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3600';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Float32Array(arrayLike)
        expect(collections.Float32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Float32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd3700
     * @tc.number SUB_COLLECTION_ADD_CONCATARRAYMAP_TEST_0700
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3700';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint8Array(arrayLike)
        expect(collections.Uint8Array.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint8Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   CollectionsTestAdd4100
     * @tc.number SUB_COLLECTION_ADD_SET_TEST_0100
     * @tc.desc   Set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd4100';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint8ClampedArray(arrayLike)
        expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint8ClampedArray = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd4200
     * @tc.number SUB_COLLECTION_ADD_SET_TEST_0200
     * @tc.desc   Set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd4200';
        console.info(`${caseName} test start`);
        let count = 0
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);

        for (let item of bitVector) {
          console.info("value: " + item);
          count++;
        }
        expect(count).assertEqual(5)
        console.info(`${caseName} test end`);
        done()
      })


  })
}