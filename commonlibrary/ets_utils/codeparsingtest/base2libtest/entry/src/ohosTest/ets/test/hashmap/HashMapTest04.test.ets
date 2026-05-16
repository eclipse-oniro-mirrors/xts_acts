/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { buffer, HashMap,util } from '@kit.ArkTS';
import { systemManager } from '@kit.MDMKit';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashMapTest04Test() {
  describe('hashMapTest04Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_HASHMAP_TEST_0387
     * @tc.name      testHashMap0288
     * @tc.desc      Verify the correctness of storing and reading a normal Uint8Array array
     *               (corresponding to HelloWorld123?) in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0288", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0288';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();

      const testValues = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const uint8Array = new Uint8Array(testValues);
      hashMap.set("uint8ArrayKey",uint8Array);

      const getUint8Array = hashMap.get("uint8ArrayKey");
      expect(getUint8Array.length).assertEqual(uint8Array.length);
      for (let i = 0; i < uint8Array.length; i++) {
        expect(getUint8Array?.[i]).assertEqual(uint8Array[i]);
      }

      const strFromUint8 = new util.TextDecoder().decodeToString(uint8Array);
      expect(strFromUint8).assertEqual("HelloWorld123?");
      const strFromGetUint8 = new util.TextDecoder().decodeToString(getUint8Array!);
      expect(strFromGetUint8).assertEqual("HelloWorld123?");

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0388
     * @tc.name      testHashMap0289
     * @tc.desc      Verify whether the length of the array is correct after reading
     *               when storing an array containing multiple 0s in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0289", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0289';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number[]>();
      const testArray = [72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63];
      hashMap.set('arrayWithZerosKey', testArray);
      expect(hashMap.get("arrayWithZerosKey").length).assertEqual(19)
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0389
     * @tc.name      testHashMap0290
     * @tc.desc      Verify that after converting an array containing negative numbers stored in a HashMap
     *               to a Uint8Array, the read result is consistent with the conversion rule
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0290';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint8Array = new Uint8Array(negativeArray);
      hashMap.set('uint8Key', uint8Array);
      const getUint8Array = hashMap.get("uint8Key") as Uint8Array;
      expect(getUint8Array.length).assertEqual(negativeArray.length)

      const uint8Expected = [
        72, 101, 108, 108, 111, 87,
        145, // -111 → 256 - 111 = 145
        114, 108, 100,
        207, // -49 → 256 - 49 = 207
        50, 51,
        193  // -63 → 256 - 63 = 193
      ];

      for (let i = 0; i < uint8Expected.length; i++) {
        expect(getUint8Array[i]).assertEqual(uint8Expected[i]);
      }

      expect(getUint8Array).assertEqual(uint8Array);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0390
     * @tc.name      testHashMap0291
     * @tc.desc      Verify that after converting an array containing negative numbers stored in a HashMap
     *               to a Uint16Array, the read result is consistent with the conversion rule
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0291", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0291';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint16Array = new Uint16Array(negativeArray);
      hashMap.set('uint16Key', uint16Array);
      const getUint16Array = hashMap.get("uint16Key") as Uint16Array;
      expect(getUint16Array.length).assertEqual(negativeArray.length)

      const uint16Expected = [
        72, 101, 108, 108, 111, 87,
        65425, // -111 → 65536 - 111 = 65425
        114, 108, 100,
        65487, // -49 → 65536 - 49 = 65487
        50, 51,
        65473  // -63 → 65536 - 63 = 65473
      ];

      for (let i = 0; i < uint16Expected.length; i++) {
        expect(getUint16Array[i]).assertEqual(uint16Expected[i]);
      }
      expect(getUint16Array).assertEqual(uint16Array)
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0391
     * @tc.name      testHashMap0292
     * @tc.desc      Verify that after converting an array containing negative numbers stored in a HashMap
     *               to a Uint32Array, the read result is consistent with the conversion rule
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0292", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0292';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      const uint32Array = new Uint32Array(negativeArray);
      hashMap.set('uint32Key', uint32Array);
      const getUint32Array = hashMap.get("uint32Key") as Uint32Array;
      expect(getUint32Array.length).assertEqual(negativeArray.length)


      const uint32Expected = [
        72, 101, 108, 108, 111, 87,
        4294967185, // -111 → 4294967296 - 111 = 4294967185
        114, 108, 100,
        4294967247, // -49 → 4294967296 - 49 = 4294967247
        50, 51,
        4294967233  // -63 → 4294967296 - 63 = 4294967233
      ];

      for (let i = 0; i < uint32Expected.length; i++) {
        expect(getUint32Array[i]).assertEqual(uint32Expected[i]);
      }
      expect(getUint32Array).assertEqual(uint32Array)
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0392
     * @tc.name      testHashMap0293
     * @tc.desc      Verify that the storage and retrieval in HashMap do not follow the array of numerical coordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0293", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0293';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Array<2>>();
      const arr =[];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      hashMap.set('key', arr);

      const getArr = hashMap.get("key");
      expect(getArr).assertEqual(arr);
      expect(getArr["abc"]).assertEqual(111);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0393
     * @tc.name      testHashMap0294
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0294", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0294';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const int8Array = new Int8Array(numberArray);
      hashMap.set('int8ArrayKey', int8Array);
      const getInt8Array=hashMap.get('int8ArrayKey') as Int8Array;
      const int8Expected=[10, -20, 30, 40, -128, 127, 3]
      for (let i = 0; i < int8Expected.length; i++) {
        expect(getInt8Array[i]).assertEqual(int8Expected[i]);
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0394
     * @tc.name      testHashMap0295
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0295", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0295';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const uint8Array = new Uint8Array(numberArray);
      hashMap.set('uint8ArrayKey', uint8Array);
      const getUint8Array=hashMap.get('uint8ArrayKey') as Uint8Array;
      const uint8Expected = [10, 236, 30, 40, 128, 127, 3];
      for (let i = 0; i < uint8Expected.length; i++) {
        expect(getUint8Array[i]).assertEqual(uint8Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0395
     * @tc.name      testHashMap0296
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0296", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0296';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const int16Array = new Int16Array(numberArray);
      hashMap.set('int16ArrayKey', int16Array);
      const getInt16Array=hashMap.get('int16ArrayKey') as Int16Array;
      const int16Expected = [10,-20,30,40,128,-129,3];
      for (let i = 0; i < int16Expected.length; i++) {
        expect(getInt16Array[i]).assertEqual(int16Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0396
     * @tc.name      testHashMap0297
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0297", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0297';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const uint16Array = new Uint16Array(numberArray);
      hashMap.set('uint16ArrayKey', uint16Array);
      const getUint16Array=hashMap.get('uint16ArrayKey') as Uint16Array;
      const uint16Expected = [10,65516,30,40,128,65407,3];
      for (let i = 0; i < uint16Expected.length; i++) {
        expect(getUint16Array[i]).assertEqual(uint16Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0397
     * @tc.name      testHashMap0298
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0298", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0298';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const int32Array = new Int32Array(numberArray);
      hashMap.set('int32ArrayKey', int32Array);
      const getInt32Array=hashMap.get('int32ArrayKey') as Int32Array;
      const int32Expected = [10,-20,30,40,128,-129,3];
      for (let i = 0; i < int32Expected.length; i++) {
        expect(getInt32Array[i]).assertEqual(int32Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0398
     * @tc.name      testHashMap0299
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0299", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0299';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const uint32Array = new Uint32Array(numberArray);
      hashMap.set('uint32ArrayKey', uint32Array);
      const getUint32Array=hashMap.get('uint32ArrayKey') as Uint32Array;
      const uint32Expected = [10,4294967276,30,40,128,4294967167,3];
      for (let i = 0; i < uint32Expected.length; i++) {
        expect(getUint32Array[i]).assertEqual(uint32Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0399
     * @tc.name      testHashMap0300
     * @tc.desc      Verify that storing and reading numbers contained in an array in HashMap can be
     *               converted to Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0300';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const numberArray = [10, -20, 30.5, 40, 128, -129, 3.14159];
      const float32Array = new Float32Array(numberArray);
      hashMap.set('float32ArrayKey', float32Array);
      const getFloat32Array=hashMap.get('float32ArrayKey') as Float32Array;
      const float32Expected = [10,-20,30.5,40,128,-129,3.141590118408203];
      for (let i = 0; i < float32Expected.length; i++) {
        expect(getFloat32Array[i]).assertEqual(float32Expected[i]);
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0400
     * @tc.name      testHashMap0301
     * @tc.desc      Verify the handling rules and correctness of storage and reading for non-numeric values
     *               when converting arrays containing NaN/Infinity stored in HashMap to TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0301';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const originalArray = [72, 101, NaN, Infinity, 108, 111];
      const uint8Array = new Uint8Array(originalArray);
      hashMap.set('uint8ArrayKey', uint8Array);
      const getUint8Array = hashMap.get("uint8ArrayKey") as Uint8Array;
      const uint8Expected = [72, 101, 0, 0, 108, 111];
      for (let i = 0; i < uint8Expected.length; i++) {
        expect(getUint8Array[i]).assertEqual(uint8Expected[i]);
      }
      expect(getUint8Array).assertEqual(uint8Array)
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0401
     * @tc.name      testHashMap0302
     * @tc.desc      Verify the handling rules and correctness of storage and reading for non-numeric values
     *               when converting arrays containing NaN/Infinity stored in HashMap to TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0302", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0302';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const originalArray = [72, 101, NaN, Infinity, 108, 111];
      const int16Array = new Int16Array(originalArray);
      hashMap.set('int16ArrayKey', int16Array);
      const getInt16Array = hashMap.get("int16ArrayKey") as Int16Array;
      const int16Expected = [72, 101, 0, 0, 108, 111];
      for (let i = 0; i < int16Expected.length; i++) {
        expect(getInt16Array[i]).assertEqual(int16Expected[i]);
      }
      expect(getInt16Array).assertEqual(int16Array);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0402
     * @tc.name      testHashMap0303
     * @tc.desc      Verify the handling rules and correctness of storage and reading for non-numeric values
     *               when converting arrays containing NaN/Infinity stored in HashMap to TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0303", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0303';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const originalArray = [72, 101, NaN, Infinity, 108, 111];
      const float16Array = new Float64Array(originalArray);
      hashMap.set('float16ArrayKey', float16Array);
      const getFloat64Array = hashMap.get("float16ArrayKey") as Float64Array;
      expect(getFloat64Array[0]).assertEqual(72);
      expect(getFloat64Array[1]).assertEqual(101);
      expect(getFloat64Array[4]).assertEqual(108);
      expect(getFloat64Array[5]).assertEqual(111);
      expect(isNaN(getFloat64Array[2])).assertTrue();
      expect(getFloat64Array[3]).assertEqual(Infinity);
      expect(getFloat64Array).assertEqual(float16Array)
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0403
     * @tc.name      testHashMap0304
     * @tc.desc      Verify the type handling rules when converting arrays containing non-numeric
     *               types (string, boolean, null, undefined) stored in HashMap to TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0304", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0304';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, object>();
      const originalArray = [72, "abc", true, null, undefined, 108];

      hashMap.set("arraykey",originalArray)
      expect(hashMap.get("arraykey")).assertEqual(originalArray);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0404
     * @tc.name      testHashMap0305
     * @tc.desc      Verify the correctness of handling a length of 0 when storing a regular empty array ([])
     *               in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0305", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0305';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number[]>();
      const originalArray = [];
      hashMap.set("originalkey",originalArray)
      expect(hashMap.get("originalkey")).assertEqual(originalArray);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0405
     * @tc.name      testHashMap0306
     * @tc.desc      Verify the correctness of handling a length of 0 when storing a regular empty Uint8Array
     *               in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0306", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0306';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const originalArray = [];
      const uint8Array=new Uint8Array(originalArray);
      hashMap.set("uint8key",uint8Array)
      expect(hashMap.get("uint8key").length).assertEqual(0);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0406
     * @tc.name      testHashMap0307
     * @tc.desc      Verify the correctness of handling a length of 0 when storing a regular empty Int16Array
     *               in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0307", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0307';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const originalArray = [];
      const int16Array=new Int16Array(originalArray);
      hashMap.set("int16key",int16Array)
      expect(hashMap.get("int16key").length).assertEqual(0);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0407
     * @tc.name      testHashMap0308
     * @tc.desc      Verify the overflow handling rules for arrays containing extremely large values (256/65536/32768)
     *               stored in HashMap when converting them to Uint8Array, which exceed the type range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0308", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0308';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const overflowArray = [256, 65536, 32768];
      const uint8Array = new Uint8Array(overflowArray);
      hashMap.set('uint8ArrayKey', uint8Array);
      const getUint8Array = hashMap.get("uint8ArrayKey") as Uint8Array;
      const uint8Expected = [0, 0, 0];
      for (let i = 0; i < uint8Expected.length; i++) {
        expect(getUint8Array[i]).assertEqual(uint8Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0408
     * @tc.name      testHashMap0309
     * @tc.desc      Verify the overflow handling rules for arrays containing extremely large values (256/65536/32768)
     *               stored in HashMap when converting them to Uint16Array, which exceed the type range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0309", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0309';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const overflowArray = [256, 65536, 32768];
      const uint16Array = new Uint16Array(overflowArray);
      hashMap.set('uint16ArrayKey', uint16Array);
      const getUint16Array = hashMap.get("uint16ArrayKey") as Uint16Array;
      const uint16Expected = [256, 0, 32768];
      for (let i = 0; i < uint16Expected.length; i++) {
        expect(getUint16Array[i]).assertEqual(uint16Expected[i]);
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0409
     * @tc.name      testHashMap0310
     * @tc.desc      Verify the overflow handling rules for arrays containing extremely large values (256/65536/32768)
     *               stored in HashMap when converting them to Int16Array, which exceed the type range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0310';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const overflowArray = [256, 65536, 32768];
      const int16Array = new Int16Array(overflowArray);
      hashMap.set('int16ArrayKey', int16Array);
      const getInt16Array = hashMap.get("int16ArrayKey") as Int16Array;
      const int16Expected = [256, 0, -32768];
      for (let i = 0; i < int16Expected.length; i++) {
        expect(getInt16Array[i]).assertEqual(int16Expected[i]);
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0410
     * @tc.name      testHashMap0311
     * @tc.desc      Verify that after deleting the element at a specified index from the array stored in the HashMap,
     *               the data in the HashMap changes accordingly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0311';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number[]>();

      const arr=[1,2,3]
      hashMap.set('testArrayKey', arr);
      arr.splice(1,1);
      const gettestArray=hashMap.get('testArrayKey') as number[];
      expect(gettestArray.length).assertEqual(2);
      expect(gettestArray[0]).assertEqual(1);
      expect(gettestArray[1]).assertEqual(3);
      console.log(TAG + ' end');

    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0411
     * @tc.name      testHashMap0312
     * @tc.desc      Verify that after deleting an object stored in a HashMap, the state of the HashMap
     *               can be correctly reflected after the attribute is deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0312';
      console.log(TAG + ' start');
      interface SimpleTestObject {
        a?: number;
        b?: number;
      };
      let obj:SimpleTestObject= {a: 1, b: 2 };

      let hashMap = new HashMap<string, SimpleTestObject>();
      hashMap.set("testArrayKey",obj);
      obj.a=undefined;

      const gettestArray=hashMap.get('testArrayKey')
      expect(gettestArray.a).assertEqual(undefined);
      expect(gettestArray.b).assertEqual(2);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0412
     * @tc.name      testHashMap0313
     * @tc.desc      Verify that after deleting non-existent attributes of objects stored in HashMap, the state after
     *               attribute deletion can be correctly reflected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0313';
      console.log(TAG + ' start');
      interface SimpleTestObject {
        a?: number;
        b?: number;
      };
      let obj:SimpleTestObject= {a: 1};

      let hashMap = new HashMap<string, SimpleTestObject>();
      hashMap.set("testArrayKey",obj);
      obj.b=undefined;

      const gettestArray=hashMap.get('testArrayKey')
      expect(gettestArray.a).assertEqual(1);
      expect(gettestArray.b).assertEqual(undefined);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0417
     * @tc.name      testHashMap0318
     * @tc.desc      Verify the basic property traversal and value processing of common objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0318", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0318';
      console.log(TAG + ' start');
      interface CommonTestObject {
        a?: number;
        b?: string;
        c?: number[];
      };
      const testObj: CommonTestObject = {
        a: 1,
        b: "test",
        c: [1, 2, 3]
      };

      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("commonObjKey", testObj);
      const getTestObj = hashMap.get("commonObjKey");
      expect(getTestObj?.a).assertEqual(1);
      expect(getTestObj?.b).assertEqual("test");
      expect(getTestObj?.c).not().assertNull();
      expect(getTestObj?.c?.length).assertEqual(3);
      expect(getTestObj?.c?.[0]).assertEqual(1);
      expect(getTestObj?.c?.[1]).assertEqual(2);
      expect(getTestObj?.c?.[2]).assertEqual(3);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0418
     * @tc.name      testHashMap0319
     * @tc.desc      Verify the basic property traversal and value processing of common objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0319", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0319';
      console.log(TAG + ' start');
      interface CommonTestObject {
        a?: number;
        b?: string;
        c?: number[];
      };
      const testObj: CommonTestObject = {
        a: 1,
        b: "test",
        c: [1, 2, 3]
      };

      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("commonObjKey", testObj);
      const getTestObj = hashMap.get("commonObjKey");

      testObj.a = 100;
      testObj.b = "updated test";
      testObj.c?.push(4);
      expect(getTestObj?.a).assertEqual(100);
      expect(getTestObj?.b).assertEqual("updated test");
      expect(getTestObj?.c?.length).assertEqual(4);
      expect(getTestObj?.c?.[3]).assertEqual(4);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0419
     * @tc.name      testHashMap0320
     * @tc.desc      Verify the recursive processing capability of nested object structures stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0320';
      console.log(TAG + ' start');

      interface Level3Object {
        e?: number;
      }
      interface Level2Object {
        c?: number;
        d?: Level3Object;
      }
      interface NestedTestObject {
        a?: number;
        b?: Level2Object;
      };

      const testObj: NestedTestObject = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };

      const hashMap = new HashMap<string, NestedTestObject>();
      hashMap.set("nestedObjKey", testObj);
      const getTestObj = hashMap.get("nestedObjKey");
      expect(getTestObj?.a).assertEqual(1);
      expect(getTestObj?.b).not().assertNull();
      expect(getTestObj?.b?.c).assertEqual(2);
      expect(getTestObj?.b?.d).not().assertNull();
      expect(getTestObj?.b?.d?.e).assertEqual(3);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0420
     * @tc.name      testHashMap0321
     * @tc.desc      Verify the recursive processing capability of nested object structures stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0321';
      console.log(TAG + ' start');
      interface Level3Object {
        e?: number;
      }
      interface Level2Object {
        c?: number;
        d?: Level3Object;
      }
      interface NestedTestObject {
        a?: number;
        b?: Level2Object;
      };

      const testObj: NestedTestObject = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };

      const hashMap = new HashMap<string, NestedTestObject>();
      hashMap.set("nestedObjKey", testObj);
      const getTestObj = hashMap.get("nestedObjKey");
      testObj.b!.d!.e = 300;
      testObj.b!.c = 200;
      testObj.a = 100;
      expect(getTestObj?.a).assertEqual(100);
      expect(getTestObj?.b?.c).assertEqual(200);
      expect(getTestObj?.b?.d?.e).assertEqual(300);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0422
     * @tc.name      testHashMap0323
     * @tc.desc      Verify whether function properties of objects stored in HashMap are excluded
     *               or specially processed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0323';
      console.log(TAG + ' start');
      interface FuncPropertyObject {
        a: number;
        b: () => void;
      }
      const testFunc = () => {
        console.log('test function executed');
      };
      const testObj: FuncPropertyObject = {
        a: 1,
        b: testFunc
      };
      const hashMap = new HashMap<string, FuncPropertyObject>();
      hashMap.set("funcObjKey", testObj);
      const getTestObj = hashMap.get("funcObjKey")!;
      expect(getTestObj.a).assertEqual(1);
      expect(getTestObj.b).assertEqual(testFunc);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0423
     * @tc.name      testHashMap0324
     * @tc.desc      Verify whether function properties of objects stored in HashMap are excluded
     *               or specially processed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0324", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0324';
      console.log(TAG + ' start');
      interface FuncPropertyObject {
        a: number;
        b: () => void;
      }
      const testFunc = () => {
        console.log('test function executed');
      };
      const testObj: FuncPropertyObject = {
        a: 1,
        b: testFunc
      };
      const hashMap = new HashMap<string, FuncPropertyObject>();
      hashMap.set("funcObjKey", testObj);
      const getTestObj = hashMap.get("funcObjKey")!;

      let funcExecuted = false;
      testObj.b = () => {
        funcExecuted = true;
      };
      getTestObj.b();
      expect(funcExecuted).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0424
     * @tc.name      testHashMap0325
     * @tc.desc      Verify whether function properties of objects stored in HashMap are excluded
     *               or specially processed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0325", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0325';
      console.log(TAG + ' start');
      interface FuncPropertyObject {
        a: number;
        b: () => void;
      }
      const testFunc = () => {
        console.log('test function executed');
      };
      const testObj: FuncPropertyObject = {
        a: 1,
        b: testFunc
      };
      const hashMap = new HashMap<string, FuncPropertyObject>();
      hashMap.set("funcObjKey", testObj);
      const getTestObj = hashMap.get("funcObjKey")!;
      const newTestFunc = () => {
        console.log('new test function executed');
      };
      testObj.b = newTestFunc;
      expect(getTestObj.b).assertEqual(newTestFunc);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0425
     * @tc.name      testHashMap0326
     * @tc.desc      Verify the integrity of the ArrayBuffer instances contained within the objects stored
     *               in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0326", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0326';
      console.log(TAG + ' start');
      interface CommonTestObject {
        buffer: ArrayBuffer;
      };
      const testObj: CommonTestObject = {
        buffer: new ArrayBuffer(16)
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("arrayBufferObjKey", testObj);
      const getTestObj = hashMap.get("arrayBufferObjKey");
      expect(getTestObj?.buffer?.byteLength).assertEqual(16);
      expect(getTestObj?.buffer instanceof ArrayBuffer).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0426
     * @tc.name      testHashMap0327
     * @tc.desc      Verify that the ArrayBuffer data in the object containing ArrayBuffer stored in HashMap
     *               can be read and written
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0327", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0327';
      console.log(TAG + ' start');
      interface CommonTestObject {
        buffer: ArrayBuffer;
      };
      const testObj: CommonTestObject = {
        buffer: new ArrayBuffer(16)
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("arrayBufferObjKey", testObj);
      const getTestObj = hashMap.get("arrayBufferObjKey");
      const originalView = new Uint8Array(testObj.buffer);
      for (let i = 0; i < originalView.length; i++) {
        originalView[i] = i;
      }
      const retrievedView = new Uint8Array(getTestObj?.buffer!);
      expect(retrievedView[8]).assertEqual(8);
      expect(retrievedView[15]).assertEqual(15);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0427
     * @tc.name      testHashMap0328
     * @tc.desc      Verify the uniqueness of ArrayBuffer references within objects containing ArrayBuffer
     *               stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0328", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0328';
      console.log(TAG + ' start');
      interface CommonTestObject {
        buffer: ArrayBuffer;
      };
      const testObj: CommonTestObject = {
        buffer: new ArrayBuffer(16)
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("arrayBufferObjKey", testObj);
      const getTestObj = hashMap.get("arrayBufferObjKey");
      const newBuffer = new ArrayBuffer(16);
      expect(getTestObj?.buffer === newBuffer).assertFalse();
      expect(getTestObj?.buffer === testObj.buffer).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0428
     * @tc.name      testHashMap0329
     * @tc.desc      Verify the integrity of instances of objects containing DataView in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0329", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0329';
      console.log(TAG + ' start');
      interface CommonTestObject {
        view: DataView;
      };
      const testObj: CommonTestObject = {
        view: new DataView(new ArrayBuffer(16)) // 16字节缓冲区的DataView实例
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("dataViewObjKey", testObj);
      const getTestObj = hashMap.get("dataViewObjKey");
      expect(getTestObj?.view?.buffer?.byteLength).assertEqual(16);
      expect(getTestObj?.view instanceof DataView).assertTrue();
      expect(getTestObj?.view?.byteOffset).assertEqual(0);
      expect(getTestObj?.view?.byteLength).assertEqual(16);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0429
     * @tc.name      testHashMap0330
     * @tc.desc      Verify the binary data read and write capability of objects containing DataView in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0330';
      console.log(TAG + ' start');
      interface CommonTestObject {
        view: DataView;
      };
      const testObj: CommonTestObject = {
        view: new DataView(new ArrayBuffer(16)) // 16字节缓冲区的DataView实例
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("dataViewObjKey", testObj);
      const getTestObj = hashMap.get("dataViewObjKey");
      testObj.view.setInt32(0, 123456);
      testObj.view.setFloat32(4, 3.14);
      expect(getTestObj?.view.getInt32(0)).assertEqual(123456);
      expect(Math.round(getTestObj?.view.getFloat32(4) * 100) / 100).assertEqual(3.14);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0430
     * @tc.name      testHashMap0331
     * @tc.desc      Verify the synchronization of data modification involving DataView in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0331';
      console.log(TAG + ' start');
      interface CommonTestObject {
        view: DataView;
      };
      const testObj: CommonTestObject = {
        view: new DataView(new ArrayBuffer(16)) // 16字节缓冲区的DataView实例
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("dataViewObjKey", testObj);
      const getTestObj = hashMap.get("dataViewObjKey");
      testObj.view.setUint8(8, 255);
      expect(getTestObj?.view.getUint8(8)).assertEqual(255);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0431
     * @tc.name      testHashMap0332
     * @tc.desc      Verify the uniqueness of references to DataView contained in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0332';
      console.log(TAG + ' start');
      interface CommonTestObject {
        view: DataView;
      };
      const testObj: CommonTestObject = {
        view: new DataView(new ArrayBuffer(16)) // 16字节缓冲区的DataView实例
      };
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("dataViewObjKey", testObj);
      const getTestObj = hashMap.get("dataViewObjKey");
      const newDataView = new DataView(new ArrayBuffer(16));
      expect(getTestObj?.view === newDataView).assertFalse();
      expect(getTestObj?.view === testObj.view).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0432
     * @tc.name      testHashMap0333
     * @tc.desc      Verify the consistency of reference counting for null objects stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0333';
      console.log(TAG + ' start');
      interface CommonTestObject {
      };
      const testObj: CommonTestObject = {};
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("emptyObjKey", testObj);
      const getTestObj = hashMap.get("emptyObjKey");
      expect(getTestObj === testObj).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0433
     * @tc.name      testHashMap0334
     * @tc.desc      Verify that the initial empty object stored in HashMap has no inherent properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0334", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0334';
      console.log(TAG + ' start');
      interface CommonTestObject {
      };
      const testObj: CommonTestObject = {};
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("emptyObjKey", testObj);
      const getTestObj = hashMap.get("emptyObjKey");
      expect(Object.getOwnPropertyNames(getTestObj!).length).assertEqual(0);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0434
     * @tc.name      testHashMap0335
     * @tc.desc      Synchronize updates after verifying the dynamically added attributes of null objects
     *               stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0335", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0335';
      console.log(TAG + ' start');
      interface CommonTestObject {
        prop1?: string;
        prop2?: number;
      };
      const testObj: CommonTestObject = {};
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("emptyObjKey", testObj);
      const getTestObj = hashMap.get("emptyObjKey");
      testObj.prop1 = "test";
      testObj.prop2 = 123;
      expect(getTestObj?.prop1).assertEqual("test");
      expect(getTestObj?.prop2).assertEqual(123);
      expect(Object.getOwnPropertyNames(getTestObj!).length).assertEqual(2);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0435
     * @tc.name      testHashMap0336
     * @tc.desc      The synchronization takes effect after verifying the deletion attribute of the null object
     *               stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0336", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0336';
      console.log(TAG + ' start');
      interface CommonTestObject {
        prop1?: string;
        prop2?: number;
      };
      const testObj: CommonTestObject = {};
      testObj.prop1 = "test";
      testObj.prop2 = 123;
      const hashMap = new HashMap<string, CommonTestObject>();
      hashMap.set("emptyObjKey", testObj);
      const getTestObj = hashMap.get("emptyObjKey");
      testObj.prop2 = undefined;
      expect(Object.getOwnPropertyNames(getTestObj!).filter(key => (getTestObj as object)[key] !== undefined).length).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0436
     * @tc.name      testHashMap0337
     * @tc.desc      Test the performance and data integrity of large-scale objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0337", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0337';
      console.log(TAG + ' start');

      type LargeTestObject = Record<string, number>;
      const testObj: LargeTestObject = {} as LargeTestObject;
      const OBJECT_SIZE = 10000;
      const buildStart = Date.now();
      for (let i = 0; i < OBJECT_SIZE; i++) {
        testObj[String(i)] = i;
      }
      const buildEnd = Date.now();
      console.log(`${TAG} - Large object build time: ${buildEnd - buildStart}ms`);
      const hashMap = new HashMap<string, LargeTestObject>();
      const setStart = Date.now();
      hashMap.set("largeObjKey", testObj);
      const setEnd = Date.now();
      console.log(`${TAG} - HashMap set time: ${setEnd - setStart}ms`);

      const getStart = Date.now();
      const getTestObj = hashMap.get("largeObjKey");
      const getEnd = Date.now();
      console.log(`${TAG} - HashMap get time: ${getEnd - getStart}ms`);
      expect(getTestObj?.["0"]).assertEqual(0);
      expect(getTestObj?.[String(OBJECT_SIZE - 1)]).assertEqual(OBJECT_SIZE - 1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0437
     * @tc.name      testHashMap0338
     * @tc.desc      Testing the performance threshold verification of large-scale objects stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0338", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0338';
      console.log(TAG + ' start');

      type LargeTestObject = Record<string, number>;
      const testObj: LargeTestObject = {} as LargeTestObject;
      const OBJECT_SIZE = 10000;
      const buildStart = Date.now();
      for (let i = 0; i < OBJECT_SIZE; i++) {
        testObj[String(i)] = i;
      }
      const buildEnd = Date.now();
      console.log(`${TAG} - Large object build time: ${buildEnd - buildStart}ms`);
      const hashMap = new HashMap<string, LargeTestObject>();
      const setStart = Date.now();
      hashMap.set("largeObjKey", testObj);
      const setEnd = Date.now();
      console.log(`${TAG} - HashMap set time: ${setEnd - setStart}ms`);

      const getStart = Date.now();
      const getTestObj = hashMap.get("largeObjKey");
      const getEnd = Date.now();
      console.log(`${TAG} - HashMap get time: ${getEnd - getStart}ms`);
      expect(buildEnd - buildStart).assertLessOrEqual(500);
      expect(setEnd - setStart).assertLessOrEqual(100);
      expect(getEnd - getStart).assertLessOrEqual(50);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0438
     * @tc.name      testHashMap0339
     * @tc.desc      Verify the integrity of the attributes containing null values stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0339", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0339';
      console.log(TAG + ' start');

      interface NullPropertyTestObject {
        a: null | number;
        b: number;
      };
      const testObj: NullPropertyTestObject = {
        a: null,
        b: 1
      };
      const hashMap = new HashMap<string, NullPropertyTestObject>();
      hashMap.set("nullPropObjKey", testObj);
      const getTestObj = hashMap.get("nullPropObjKey");
      expect(getTestObj?.a==null).assertTrue();
      expect(getTestObj?.b).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0439
     * @tc.name      testHashMap0340
     * @tc.desc      Verify the synchronization of attribute modifications involving null values stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0340';
      console.log(TAG + ' start');

      interface NullPropertyTestObject {
        a: null | number;
        b: number;
      };
      const testObj: NullPropertyTestObject = {
        a: null,
        b: 1
      };
      const hashMap = new HashMap<string, NullPropertyTestObject>();
      hashMap.set("nullPropObjKey", testObj);
      const getTestObj = hashMap.get("nullPropObjKey");
      testObj.a = 999;
      expect(getTestObj?.a).assertEqual(999);
      testObj.a = null;
      expect(getTestObj?.a==null).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0440
     * @tc.name      testHashMap0341
     * @tc.desc      Verify the differentiated handling of null values and undefined values stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0341';
      console.log(TAG + ' start');
      interface NullPropertyTestObject {
        a: null | number;
        b: number;
        c?: number;
      };
      const testObj: NullPropertyTestObject = {
        a: null,
        b: 1
      };
      const hashMap = new HashMap<string, NullPropertyTestObject>();
      hashMap.set("nullPropObjKey", testObj);
      const getTestObj = hashMap.get("nullPropObjKey");
      expect(getTestObj?.a==null).assertTrue();
      expect(getTestObj?.c).assertEqual(undefined);
      expect(getTestObj?.a !== getTestObj?.c).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0441
     * @tc.name      testHashMap0342
     * @tc.desc      Verify the traversal characteristics of HashMap containing null value attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0342';
      console.log(TAG + ' start');

      interface NullPropertyTestObject {
        a: null | number;
        b: number;
        c?: number;
      };
      const testObj: NullPropertyTestObject = {
        a: null,
        b: 1
      };
      const hashMap = new HashMap<string, NullPropertyTestObject>();
      hashMap.set("nullPropObjKey", testObj);
      const getTestObj = hashMap.get("nullPropObjKey");
      const propNames = Object.getOwnPropertyNames(getTestObj!);
      expect(propNames.includes("a")).assertTrue();
      expect(propNames.includes("b")).assertTrue();
      expect(propNames.length).assertEqual(2);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0442
     * @tc.name      testHashMap0343
     * @tc.desc      Check the integrity of the attributes containing NaN values stored in the HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0343';
      console.log(TAG + ' start');

      interface NaNPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: NaNPropertyTestObject = {
        a: NaN,
        b: 1
      };
      const hashMap = new HashMap<string, NaNPropertyTestObject>();
      hashMap.set("nanPropObjKey", testObj);
      const getTestObj = hashMap.get("nanPropObjKey");
      expect(isNaN(getTestObj?.a)).assertTrue();
      expect(getTestObj?.b).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0443
     * @tc.name      testHashMap0344
     * @tc.desc      Check the synchronization of attribute modifications involving NaN values stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0344", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0344';
      console.log(TAG + ' start');

      interface NaNPropertyTestObject {
        a: number;
        b: number;
      };

      const testObj: NaNPropertyTestObject = {
        a: NaN,
        b: 1
      };
      const hashMap = new HashMap<string, NaNPropertyTestObject>();
      hashMap.set("nanPropObjKey", testObj);
      const getTestObj = hashMap.get("nanPropObjKey");
      testObj.a = 888;
      expect(getTestObj?.a).assertEqual(888);
      testObj.b = NaN;
      expect(isNaN(getTestObj?.b)).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0444
     * @tc.name      testHashMap0345
     * @tc.desc      Check the differentiated handling of NaN values and other special values stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0345", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0345';
      console.log(TAG + ' start');

      interface NaNPropertyTestObject {
        a: number;
        b: number;
      };

      const testObj: NaNPropertyTestObject = {
        a: NaN,
        b: 1
      };
      const hashMap = new HashMap<string, NaNPropertyTestObject>();
      hashMap.set("nanPropObjKey", testObj);
      const getTestObj = hashMap.get("nanPropObjKey");
      testObj.a = NaN;
      expect(getTestObj?.a !== null).assertTrue();
      expect(getTestObj?.a !== undefined).assertTrue();
      expect(isNaN(getTestObj?.a) && getTestObj?.a !== null).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0445
     * @tc.name      testHashMap0346
     * @tc.desc      Check the traversal characteristics of the attributes containing NaN values stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0346", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0346';
      console.log(TAG + ' start');

      interface NaNPropertyTestObject {
        a: number;
        b: number;
      };

      const testObj: NaNPropertyTestObject = {
        a: NaN,
        b: 1
      };
      const hashMap = new HashMap<string, NaNPropertyTestObject>();
      hashMap.set("nanPropObjKey", testObj);
      const getTestObj = hashMap.get("nanPropObjKey");
      const propNames = Object.getOwnPropertyNames(getTestObj!);
      expect(propNames.includes("a")).assertTrue();
      expect(propNames.includes("b")).assertTrue();
      expect(propNames.length).assertEqual(2);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0446
     * @tc.name      testHashMap0347
     * @tc.desc      Verify the integrity of attributes containing Infinity stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0347", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0347';
      console.log(TAG + ' start');
      interface InfinityPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: InfinityPropertyTestObject = {
        a: Infinity,
        b: 1
      };
      const hashMap = new HashMap<string, InfinityPropertyTestObject>();
      hashMap.set("infinityPropObjKey", testObj);
      const getTestObj = hashMap.get("infinityPropObjKey");
      expect(getTestObj?.a).assertEqual(Infinity);
      expect(getTestObj?.b).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0447
     * @tc.name      testHashMap0348
     * @tc.desc      Verify the arithmetic property of Infinity for the Infinity attribute
     *               stored in HashMap: Infinity + any number = Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0348", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0348';
      console.log(TAG + ' start');

      interface InfinityPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: InfinityPropertyTestObject = {
        a: Infinity,
        b: 1
      };
      const hashMap = new HashMap<string, InfinityPropertyTestObject>();
      hashMap.set("infinityPropObjKey", testObj);
      const getTestObj = hashMap.get("infinityPropObjKey");
      expect(getTestObj?.a + 1000).assertEqual(Infinity);
      expect(getTestObj?.b + 1000).assertEqual(1001);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0448
     * @tc.name      testHashMap0349
     * @tc.desc      Verify the synchronization of modifying Infinity value attributes stored in a HashMap
     *               that contain Infinity attributes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0349", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0349';
      console.log(TAG + ' start');
      interface InfinityPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: InfinityPropertyTestObject = {
        a: Infinity,
        b: 1
      };
      const hashMap = new HashMap<string, InfinityPropertyTestObject>();
      hashMap.set("infinityPropObjKey", testObj);
      const getTestObj = hashMap.get("infinityPropObjKey");
      testObj.a = 999999;
      expect(getTestObj?.a).assertEqual(999999);
      testObj.b = -Infinity;
      expect(getTestObj?.b).assertEqual(-Infinity);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0449
     * @tc.name      testHashMap0350
     * @tc.desc      Verify the distinction between Infinity and other special values for attributes containing
     *               Infinity stored in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0350';
      console.log(TAG + ' start');

      interface InfinityPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: InfinityPropertyTestObject = {
        a: Infinity,
        b: 1
      };
      const hashMap = new HashMap<string, InfinityPropertyTestObject>();
      hashMap.set("infinityPropObjKey", testObj);
      const getTestObj = hashMap.get("infinityPropObjKey");
      expect(isNaN(getTestObj?.a)).assertFalse();       // 区分Infinity与NaN
      expect(getTestObj?.a !== null).assertTrue();      // 区分Infinity与null
      expect(getTestObj?.a !== undefined).assertTrue(); // 区分Infinity与undefined
      expect(getTestObj?.a !== -Infinity).assertTrue(); // 区分正/负无穷大
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0450
     * @tc.name      testHashMap0351
     * @tc.desc      Verify the traversal characteristics of attributes containing Infinity values stored in a HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0351", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0351';
      console.log(TAG + ' start');

      interface InfinityPropertyTestObject {
        a: number;
        b: number;
      };
      const testObj: InfinityPropertyTestObject = {
        a: Infinity,
        b: 1
      };
      const hashMap = new HashMap<string, InfinityPropertyTestObject>();
      hashMap.set("infinityPropObjKey", testObj);
      const getTestObj = hashMap.get("infinityPropObjKey");
      const propNames = Object.getOwnPropertyNames(getTestObj!);
      expect(propNames.includes("a")).assertTrue();
      expect(propNames.includes("b")).assertTrue();
      expect(propNames.length).assertEqual(2);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0451
     * @tc.name      testHashMap0352
     * @tc.desc      Verify the integrity of TypedArray objects stored as attribute values
     *               (data access/type recognition) in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0352", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0352';
      console.log(TAG + ' start');
      interface TypedArrayTestObject {
        buffer: Uint8Array;
      };
      const testObj: TypedArrayTestObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]) // 对应字符 "Hello"
      };
      const hashMap = new HashMap<string, TypedArrayTestObject>();
      hashMap.set("typedArrayObjKey", testObj);
      const getTestObj = hashMap.get("typedArrayObjKey");
      expect(getTestObj!=null).assertTrue();
      expect(getTestObj?.buffer!=null).assertTrue();
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0452
     * @tc.name      testHashMap0353
     * @tc.desc      Verify the type recognition of TypedArray objects stored as attribute values
     *               (data access/type recognition) in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0353", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0353';
      console.log(TAG + ' start');
      interface TypedArrayTestObject {
        buffer: Uint8Array;
      };
      const testObj: TypedArrayTestObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]) // 对应字符 "Hello"
      };
      const hashMap = new HashMap<string, TypedArrayTestObject>();
      hashMap.set("typedArrayObjKey", testObj);
      const getTestObj = hashMap.get("typedArrayObjKey");
      expect(getTestObj?.buffer instanceof Uint8Array).assertTrue();
      expect(getTestObj?.buffer.BYTES_PER_ELEMENT).assertEqual(1);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0453
     * @tc.name      testHashMap0354
     * @tc.desc      Verify the synchronization of modifications to TypedArray data stored as attribute values
     *               (data access/type recognition) in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0354", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0354';
      console.log(TAG + ' start');
      interface TypedArrayTestObject {
        buffer: Uint8Array;
      };
      const testObj: TypedArrayTestObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111])
      };
      const hashMap = new HashMap<string, TypedArrayTestObject>();
      hashMap.set("typedArrayObjKey", testObj);
      const getTestObj = hashMap.get("typedArrayObjKey");
      testObj.buffer[2] = 97;
      expect(getTestObj?.buffer[2]).assertEqual(97);
      const updatedStr = String.fromCharCode(...Array.from(getTestObj?.buffer!));
      expect(updatedStr).assertEqual("Healo");

      expect(getTestObj?.buffer.buffer instanceof ArrayBuffer).assertTrue();
      // 验证缓冲区字节长度
      expect(getTestObj?.buffer.buffer.byteLength).assertEqual(5);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0454
     * @tc.name      testHashMap0355
     * @tc.desc      Verify the integrity of the underlying ArrayBuffer for TypedArray data stored
     *               as attribute values (data access/type recognition) in HashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0355", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0355';
      console.log(TAG + ' start');
      interface TypedArrayTestObject {
        buffer: Uint8Array;
      };

      const testObj: TypedArrayTestObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111])
      };
      const hashMap = new HashMap<string, TypedArrayTestObject>();
      hashMap.set("typedArrayObjKey", testObj);
      const getTestObj = hashMap.get("typedArrayObjKey");
      expect(getTestObj?.buffer.buffer instanceof ArrayBuffer).assertTrue();
      expect(getTestObj?.buffer.buffer.byteLength).assertEqual(5);
      console.log(TAG + ' end');
    });

  })
}