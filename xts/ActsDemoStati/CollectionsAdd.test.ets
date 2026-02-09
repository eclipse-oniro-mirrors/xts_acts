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
import { ArkTSUtils, collections, lang, HashMap, HashSet } from '@kit.ArkTS'
import { collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function collectionsAddTest1() {
  describe('collectionsAddTest1', () => {
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
          count++;
        }
        expect(count).assertEqual(5)
        console.info(`${caseName} test end`);
        done()
      })

          /**
     * @tc.name   ASONTestClass001
     * @tc.number ASONTestClass001
     * @tc.desc   ArkTS ASON parse BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'big':112233445566778898}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      expect((obj as object)?.['big']).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass002
     * @tc.number ASONTestClass002
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '123';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass003
     * @tc.number ASONTestClass003
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{'number':123}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.['number']).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass004
     * @tc.number ASONTestClass004
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{'string':'testASON'}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.['string']).assertEqual('testASON');
      done();
    })

    /**
     * @tc.name   ASONTestClass005
     * @tc.number ASONTestClass005
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = ''testASON'';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual('testASON');
      done();
    })

    /**
     * @tc.name   ASONTestClass006
     * @tc.number ASONTestClass006
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '[1,2,3]';
      let obj : collections.Array<number> = ArkTSUtils.ASON.parse(jsonText) as collections.Array<number>;
      expect(obj.at(1)).assertEqual(2);
      done();
    })

    /**
     * @tc.name   ASONTestClass007
     * @tc.number ASONTestClass007
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'arr':[1,3,5]}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let arr : collections.Array<number> = (obj as object)?.['arr'];
      expect(arr.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass008
     * @tc.number ASONTestClass008
     * @tc.desc   ArkTS ASON parse true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'true';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(true);
      done();
    })

    /**
     * @tc.name   ASONTestClass009
     * @tc.number ASONTestClass009
     * @tc.desc   ArkTS ASON parse false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'false';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(false);
      done();
    })

    /**
     * @tc.name   ASONTestClass010
     * @tc.number ASONTestClass010
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(typeof obj).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ASONTestClass011
     * @tc.number ASONTestClass011
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'123':'123'}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect((obj as object)?.['123']).assertEqual('123');
      done();
    })

    /**
     * @tc.name   ASONTestClass012
     * @tc.number ASONTestClass012
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{'big':112233445566778898}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,bigint>;
      expect(map.get('big')).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass013
     * @tc.number ASONTestClass013
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      expect(typeof map).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ASONTestClass014
     * @tc.number ASONTestClass014
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{'feature':{'arr':[1,3,5]}}';
      let map = {'feature':{'arr':[1,3,5]}};
      expect(typeof map.get('feature')).assertEqual('object');
      expect(map.get('feature')?.get('arr')?.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass015
     * @tc.number ASONTestClass015
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected MAP Prop in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass016
     * @tc.number ASONTestClass016
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected Object Prop in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass017
     * @tc.number ASONTestClass017
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{'error'}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected MAP in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass018
     * @tc.number ASONTestClass018
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{'error'}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected Object in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass019
     * @tc.number ASONTestClass019
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 1122;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('1122');
      done();
    })

    /**
     * @tc.name   ASONTestClass020
     * @tc.number ASONTestClass020
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 'test ASON';
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual(''test ASON'');
      done();
    })

    /**
     * @tc.name   ASONTestClass021
     * @tc.number ASONTestClass021
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = true;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('true');
      done();
    })

    /**
     * @tc.name   ASONTestClass022
     * @tc.number ASONTestClass022
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = false;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('false');
      done();
    })

    /**
     * @tc.name   ASONTestClass023
     * @tc.number ASONTestClass023
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = null;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('null');
      done();
    })

    /**
     * @tc.name   ASONTestClass024
     * @tc.number ASONTestClass024
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = new collections.Array<number>(1, 3, 5);
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('[1,3,5]');
      done();
    })

    /**
     * @tc.name   ASONTestClass025
     * @tc.number ASONTestClass025
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'string':'testASON'}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'string':'testASON'}');
      done();
    })

    /**
     * @tc.name   ASONTestClass026
     * @tc.number ASONTestClass026
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{}');
      done();
    })

    /**
     * @tc.name   ASONTestClass027
     * @tc.number ASONTestClass027
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 112233445566778899n;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('112233445566778899');
      done();
    })

    /**
     * @tc.name   ASONTestClass028
     * @tc.number ASONTestClass028
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'zerodeci1':0.0000123,'zerodeci2':0.4799123,'zerodeci3':0.7777334477383838389929292922,'zerodeci4':0.0000000000000123}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'zerodeci1':0.0000123,'zerodeci2':0.4799123,'zerodeci3':0.7777334477383838,'zerodeci4':1.23e-14}');
      done();
    })

    /**
     * @tc.name   ASONTestClass029
     * @tc.number ASONTestClass029
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'feature':{'arr':[1,3,5]}}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'feature':{'arr':[1,3,5]}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass030
     * @tc.number ASONTestClass030
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'text':'ASON support MAP Test Start','largeNumber':112233445566778899,'people':{'name':'Mary','sex':'1','height':'165'}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'text':'ASON support MAP Test Start','largeNumber':112233445566778899,'people':{'name':'Mary','sex':'1','height':'165'}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass031
     * @tc.number ASONTestClass031
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'args1':true,'args2':false,'args3':null}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'args1':true,'args2':false,'args3':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass032
     * @tc.number ASONTestClass032
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'people':{'name':'Mary','sex':'1','height':165,'args':{'arr':[1,2,3],'check':true,'num':null}}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'people':{'name':'Mary','sex':'1','height':165,'args':{'arr':[1,2,3],'check':true,'num':null}}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass033
     * @tc.number ASONTestClass033
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass034
     * @tc.number ASONTestClass034
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass035
     * @tc.number ASONTestClass035
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new HashSet<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass036
     * @tc.number ASONTestClass036
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr = new collections.Array<string>();
      arr.push('a', 'b', 'c');
      let sendableObj = new SendableTestClass(arr);
      let set = new collections.Set<SendableTestClass>();
      set.add(sendableObj);
      let map = new collections.Map<string, collections.Set<SendableTestClass>>();
      map.set('set', set);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'set':[{'arr':['a','b','c']}]}');
      done();
    })

    /**
     * @tc.name   ASONTestClass037
     * @tc.number ASONTestClass037
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr = ['a', 'b', 'c'];
      arr.push('a', 'b', 'c');
      let obj = new NormalTestClass(arr);
      let set = new Set<Object>();
      set.add(obj);
      let map = new Map<string, Set<Object>>();
      map.set('set', set);
      let hashSet = new HashSet<Object>();
      hashSet.add(map);
      let hashMap = new HashMap<string, HashSet<Object>>();
      hashMap.set('hashSet', hashSet);
      let output = ArkTSUtils.ASON.stringify(hashMap);
      expect(output).assertEqual('{'hashSet':[{'set':[{'arr':['a','b','c']}]}]}');
      done();
    })

    /**
     * @tc.name   ASONTestClass038
     * @tc.number ASONTestClass038
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new Map<string, Object>();
      let set = new Set<Object>();
      let hashMap = new HashMap<string, Object>();
      let hashSet = new HashSet<Object>();
      map.set('set', set);
      set.add(hashMap);
      hashMap.set('hashSet', hashSet);
      hashSet.add(map);
      try {
        ArkTSUtils.ASON.stringify(map);
      } catch (e) {
        expect(e.message).assertEqual('stack contains value, usually caused by circular structure');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass039
     * @tc.number ASONTestClass039
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new Map<string>();
      map.set('a1', 'a1');
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'1':1,'true':true}');
      done();
    })

    /**
     * @tc.name   ASONTestClass040
     * @tc.number ASONTestClass040
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new collections.Map<string>();
      map.set('a1', 'a1');
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'1':1,'true':true}');
      done();
    })

    /**
     * @tc.name   ASONTestClass041
     * @tc.number ASONTestClass041
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new Set<string | null | number | boolean>();
      set.add('a1');
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })

    /**
     * @tc.name   ASONTestClass042
     * @tc.number ASONTestClass042
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new collections.Set<string | null | number | boolean>();
      set.add('a1');
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })

     /**
      * @tc.name   ASONTestClass043
      * @tc.number ASONTestClass043
      * @tc.desc   ArkTS ASON stringify Map and Set undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('ASONTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new Map<string | null | number | boolean | undefined, string | null | number | boolean | undefined>();
      map.set('a1', 1);
      map.set(undefined, 'a2');
      map.set(null, undefined);
      map.set(undefined, undefined);
      map.set(undefined, null);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1,'undefined':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass044
     * @tc.number ASONTestClass044
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new collections.Map<string>();
      map.set('a1', 1);
      map.set(undefined, 'a2');
      map.set(null, undefined);
      map.set(undefined, undefined);
      map.set(undefined, null);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1,'undefined':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass045
     * @tc.number ASONTestClass045
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new HashMap<string>();
      map.set('a1', 1);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1}');
      done();
    })

    /**
     * @tc.name   ASONTestClass046
     * @tc.number ASONTestClass046
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let set = new Set<string | null | number | boolean | undefined>();
      set.add('a1');
      set.add(undefined);
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('['a1',null,1,true]');
      done();
    })

    /**
     * @tc.name   ASONTestClass047
     * @tc.number ASONTestClass047
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let set = new collections.Set<string | null | number | boolean | undefined>();
      set.add('ss');
      set.add(undefined);
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('['a1',null,1,true]');
      done();
    })

  })
}