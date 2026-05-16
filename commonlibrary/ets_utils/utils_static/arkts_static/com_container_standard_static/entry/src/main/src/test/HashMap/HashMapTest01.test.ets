/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index'
import { HashMap } from '@kit.ArkTS';

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashMapTest01Test(): void {
  describe('hashMapTest01Test', () => {
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
     * @tc.number   SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0100
     * @tc.name     testHashMap0001
     * @tc.desc     Testing HashMap length is 0
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('testHashMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ()=> {
      const TAG = 'testHashMap0001';
      console.log(TAG + ' start');

      let hashMap = new HashMap<string, number>();
      expect(hashMap.length).assertEqual(0);

    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0200
     * @tc.name      testHashMap0002
     * @tc.desc      Verify the boundary values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0002';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8Arr = new Int8Array([-128]);
      hashMap.set('key', int8Arr);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(-128);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0300
     * @tc.name      testHashMap0003
     * @tc.desc      Verify the boundary values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0003';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8Arr = new Int8Array([127]);
      hashMap.set('key', int8Arr);

      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(127);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0400
     * @tc.name      testHashMap0004
     * @tc.desc      Verify the out-of-bounds values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     level 2
     */
    it("testHashMap0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0004';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8Arr = new Int8Array([-129]);
      hashMap.set('key', int8Arr);

      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(127);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0500
     * @tc.name      testHashMap0005
     * @tc.desc      Verify the out-of-bounds values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0005';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8Arr = new Int8Array([128]);
      hashMap.set('key', int8Arr);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(-128);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0600
     * @tc.name      testHashMap0006
     * @tc.desc      Verify the boundary values of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0006';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8Array = new Uint8Array([0]);
      hashMap.set('key', uint8Array);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0700
     * @tc.name      testHashMap0007
     * @tc.desc      Verify the boundary values of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0007';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8Array = new Uint8Array([255]);
      hashMap.set('key', uint8Array);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(255);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0800
     * @tc.name      testHashMap0008
     * @tc.desc      Verify the out-of-bounds values of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0008';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8Array = new Uint8Array([-1]);
      hashMap.set('key', uint8Array);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(255);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_0900
     * @tc.name      testHashMap0009
     * @tc.desc      Verify the out-of-bounds values of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0009';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8Array = new Uint8Array([256]);
      hashMap.set('key', uint8Array);

      console.log("value:" + hashMap.get("key")!.toString());
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1000
     * @tc.name      testHashMap0010
     * @tc.desc      Verify the boundary values of Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0010';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8Array = new Uint8ClampedArray([0]);
      hashMap.set('key', uint8Array);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1100
     * @tc.name      testHashMap0011
     * @tc.desc      Verify the boundary values of Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0011';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8Array = new Uint8ClampedArray([255]);
      hashMap.set('key', uint8Array);
      expect(hashMap.length).assertEqual(1);
      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(255);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1200
     * @tc.name      testHashMap0012
     * @tc.desc      Verify the out-of-bounds values of Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0012';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8Array = new Uint8ClampedArray([256]);
      hashMap.set('key', uint8Array);

      console.log("value:" + hashMap.get("key")!.toString());
      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(255);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1300
     * @tc.name      testHashMap0013
     * @tc.desc      Verify the out-of-bounds values of Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0013';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8Array = new Uint8ClampedArray([-1]);
      hashMap.set('key', uint8Array);

      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1400
     * @tc.name      testHashMap0014
     * @tc.desc      Verify the boundary values of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0014';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([-32768]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(-32768);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1500
     * @tc.name      testHashMap0015
     * @tc.desc      Verify the boundary values of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0015';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([32767]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(32767);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1600
     * @tc.name      testHashMap0016
     * @tc.desc      Verify the out-of-bounds values of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0016';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([-32769]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(32767);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1700
     * @tc.name      testHashMap0017
     * @tc.desc      Verify the out-of-bounds values of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0017';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([32768]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(-32768);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1800
     * @tc.name      testHashMap0018
     * @tc.desc      Verify the boundary values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0018';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([0]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_1900
     * @tc.name      testHashMap0019
     * @tc.desc      Verify the boundary values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0019';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([65535]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(65535);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2000
     * @tc.name      testHashMap0020
     * @tc.desc      Verify the out-of-bounds values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0020';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([-1]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(65535);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2100
     * @tc.name      testHashMap0021
     * @tc.desc      Verify the out-of-bounds values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0021';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([65536]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2200
     * @tc.name      testHashMap0022
     * @tc.desc      Verify the boundary values of Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0022';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([-2147483648]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(-2147483648);

      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2300
     * @tc.name      testHashMap0023
     * @tc.desc      Verify the boundary values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0023';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([2147483647]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(2147483647);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2400
     * @tc.name      testHashMap0024
     * @tc.desc      Verify the out-of-bounds values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0024';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([-2147483649]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(2147483647);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2500
     * @tc.name      testHashMap0025
     * @tc.desc      Verify the out-of-bounds values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0025';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([2147483648]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(-2147483648);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2600
     * @tc.name      testHashMap0026
     * @tc.desc      Verify the boundary values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0026';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([0]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2700
     * @tc.name      testHashMap0027
     * @tc.desc      Verify the boundary values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0027';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([4294967295]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(4294967295);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2800
     * @tc.name      testHashMap0028
     * @tc.desc      Verify the out-of-bounds values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0028';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([-1]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(4294967295);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_2900
     * @tc.name      testHashMap0029
     * @tc.desc      Verify the out-of-bounds values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0029';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([4294967296]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3000
     * @tc.name      testHashMap0030
     * @tc.desc      Verify the boundary values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0030';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const float32A = new Float32Array([-3.4028234663852886e38]);
      hashMap.set('key', float32A);
      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(-3.4028234663852886e+38);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3100
     * @tc.name      testHashMap0031
     * @tc.desc      Verify the boundary values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0031';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const float32A = new Float32Array([3.4028234663852886e38]);
      hashMap.set('key', float32A);
      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(3.4028234663852886e+38);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3200
     * @tc.name      testHashMap0032
     * @tc.desc      Verify the out-of-bounds values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0032';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const float32A = new Float32Array([-3.5E38]);
      hashMap.set('key', float32A);
      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(-Infinity);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3300
     * @tc.name      testHashMap0033
     * @tc.desc      Verify the out-of-bounds values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0033';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const float32A = new Float32Array([3.5e38]);
      hashMap.set('key', float32A);
      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(Infinity);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3400
     * @tc.name      testHashMap0034
     * @tc.desc      Verify the boundary values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0034';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([-1.7976931348623157e308]);
      hashMap.set('key', float64A);
      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(-1.7976931348623157e+308);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3500
     * @tc.name      testHashMap0035
     * @tc.desc      Verify the boundary values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0035';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([1.7976931348623157e308]);
      hashMap.set('key', float64A);

      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(1.7976931348623157e+308);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3600
     * @tc.name      testHashMap0036
     * @tc.desc      Verify the out-of-bounds values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0036';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([-Infinity]);
      hashMap.set('key', float64A);

      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(-Infinity);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3700
     * @tc.name      testHashMap0037
     * @tc.desc      Verify the out-of-bounds values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0037';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([Infinity]);
      hashMap.set('key', float64A);

      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(Infinity);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3800
     * @tc.name      testHashMap0038
     * @tc.desc      Verify the boundary values of BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0038';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigInt64Array>();
      const bigInt64A = new BigInt64Array([-9223372036854775808n]);
      hashMap.set('key', bigInt64A);
      const result = hashMap.get("key") as BigInt64Array;
      expect(result[0]).assertEqual(-9223372036854775808n);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_3900
     * @tc.name      testHashMap0039
     * @tc.desc      Verify the boundary values of BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0039';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigInt64Array>();
      const bigInt64A = new BigInt64Array([9223372036854775807n]);
      hashMap.set('key', bigInt64A);

      const result = hashMap.get("key") as BigInt64Array;
      expect(result[0]).assertEqual(9223372036854775807n);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4000
     * @tc.name      testHashMap0040
     * @tc.desc      Verify the out-of-bounds values of BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0040';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigInt64Array>();
      const bigInt64A = new BigInt64Array([-9223372036854775809n]);
      hashMap.set('key', bigInt64A);

      const result = hashMap.get("key") as BigInt64Array;
      expect(result[0]).assertEqual(9223372036854775807n);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4100
     * @tc.name      testHashMap0041
     * @tc.desc      Verify the out-of-bounds values of BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0041';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigInt64Array>();
      const bigInt64A = new BigInt64Array([9223372036854775808n]);
      hashMap.set('key', bigInt64A);

      const result = hashMap.get("key") as BigInt64Array;
      expect(result[0]).assertEqual(-9223372036854775808n);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4200
     * @tc.name      testHashMap0042
     * @tc.desc      Verify the boundary values of BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0042';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigUint64Array>();
      const bigUInt64A = new BigUint64Array([0n]);
      hashMap.set('key', bigUInt64A);
      const result = hashMap.get("key") as BigUint64Array;
      expect(result[0]).assertEqual(0n);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4300
     * @tc.name      testHashMap0043
     * @tc.desc      Verify the boundary values of BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0043';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigUint64Array>();
      const bigUInt64A = new BigUint64Array([18446744073709551615n]);
      hashMap.set('key', bigUInt64A);

      const result = hashMap.get("key") as BigUint64Array;
      expect(result[0]).assertEqual(18446744073709551615n);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4400
     * @tc.name      testHashMap0044
     * @tc.desc      Verify the out-of-bounds values of BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0044';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigUint64Array>();
      const bigUInt64A = new BigUint64Array([18446744073709551616n]);
      hashMap.set('key', bigUInt64A);

      const result = hashMap.get("key") as BigUint64Array;
      expect(result[0]).assertEqual(0n);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4500
     * @tc.name      testHashMap0045
     * @tc.desc      Passing in the special value Infinity to Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0045';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const bigUInt64A = new Float32Array([Infinity]);
      hashMap.set('key', bigUInt64A);

      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(Infinity);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4600
     * @tc.name      testHashMap0046
     * @tc.desc      Passing in the special value -Infinity to Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0046';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const bigUInt64A = new Float32Array([-Infinity]);
      hashMap.set('key', bigUInt64A);

      const result = hashMap.get("key") as Float32Array;
      expect(result[0]).assertEqual(-Infinity);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4700
     * @tc.name      testHashMap0047
     * @tc.desc      Passing in the special value NaN to Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0047';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float32Array>();
      const bigUInt64A = new Float32Array([NaN]);
      hashMap.set('key', bigUInt64A);
      const result = hashMap.get("key") as Float32Array;
      expect(result[0].toString()).assertEqual('NaN');

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4800
     * @tc.name      testHashMap0048
     * @tc.desc      Passing in the special value Infinity to Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0048';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([Infinity]);
      hashMap.set('key', float64A);
      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(Infinity);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_4900
     * @tc.name      testHashMap0049
     * @tc.desc      Passing in the special value -Infinity to Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0049';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([-Infinity]);
      hashMap.set('key', float64A);
      const result = hashMap.get("key") as Float64Array;
      expect(result[0]).assertEqual(-Infinity);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5000
     * @tc.name      testHashMap0050
     * @tc.desc      Passing in the special value NaN to Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0050';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Float64Array>();
      const float64A = new Float64Array([NaN]);
      hashMap.set('key', float64A);
      const result = hashMap.get("key") as Float64Array;
      expect(result[0].toString()).assertEqual('NaN');

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5100
     * @tc.name      testHashMap0051
     * @tc.desc      Passing in the special value Infinity to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0051';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8A = new Int8Array([Infinity]);
      hashMap.set('key', int8A);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5200
     * @tc.name      testHashMap0052
     * @tc.desc      Passing in the special value -Infinity to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0052';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8A = new Int8Array([-Infinity]);
      hashMap.set('key', int8A);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5300
     * @tc.name      testHashMap0053
     * @tc.desc      Passing in the special value NaN to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0053';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int8Array>();
      const int8A = new Int8Array([NaN]);
      hashMap.set('key', int8A);
      const result = hashMap.get("key") as Int8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5400
     * @tc.name      testHashMap0054
     * @tc.desc      Passing in the special value Infinity to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0054';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8A = new Uint8Array([Infinity]);
      hashMap.set('key', uint8A);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5500
     * @tc.name      testHashMap0055
     * @tc.desc      Passing in the special value -Infinity to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0055';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8A = new Uint8Array([-Infinity]);
      hashMap.set('key', uint8A);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5600
     * @tc.name      testHashMap0056
     * @tc.desc      Passing in the special value NaN to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0056';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8Array>();
      const uint8A = new Uint8Array([NaN]);
      hashMap.set('key', uint8A);
      const result = hashMap.get("key") as Uint8Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5700
     * @tc.name      testHashMap0057
     * @tc.desc      Passing in the special value Infinity to Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0057';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([Infinity]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5800
     * @tc.name      testHashMap0058
     * @tc.desc      Passing in the special value -Infinity to Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0058';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([-Infinity]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_5900
     * @tc.name      testHashMap0059
     * @tc.desc      Passing in the special value NaN to Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0059';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int16Array>();
      const int16A = new Int16Array([NaN]);
      hashMap.set('key', int16A);
      const result = hashMap.get("key") as Int16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6000
     * @tc.name      testHashMap0060
     * @tc.desc      Passing in the special value Infinity to Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0060';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([Infinity]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6100
     * @tc.name      testHashMap0061
     * @tc.desc      Passing in the special value -Infinity to Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0061';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([-Infinity]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6200
     * @tc.name      testHashMap0062
     * @tc.desc      Passing in the special value NaN to Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0062';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint16Array>();
      const uint16A = new Uint16Array([NaN]);
      hashMap.set('key', uint16A);
      const result = hashMap.get("key") as Uint16Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6300
     * @tc.name      testHashMap0063
     * @tc.desc      Passing in the special value Infinity to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0063';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([Infinity]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6400
     * @tc.name      testHashMap0064
     * @tc.desc      Passing in the special value -Infinity to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0064';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([-Infinity]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6500
     * @tc.name      testHashMap0065
     * @tc.desc      Passing in the special value NaN to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0065';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Int32Array>();
      const int32A = new Int32Array([NaN]);
      hashMap.set('key', int32A);
      const result = hashMap.get("key") as Int32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6600
     * @tc.name      testHashMap0066
     * @tc.desc      Passing in the special value Infinity to Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0066';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([Infinity]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6700
     * @tc.name      testHashMap0067
     * @tc.desc      Passing in the special value -Infinity to Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0067';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([-Infinity]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6800
     * @tc.name      testHashMap0068
     * @tc.desc      Passing in the special value NaN to Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0068';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint32Array>();
      const uint32A = new Uint32Array([NaN]);
      hashMap.set('key', uint32A);
      const result = hashMap.get("key") as Uint32Array;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_6900
     * @tc.name      testHashMap0069
     * @tc.desc      Passing in the special value Infinity to Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0069';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8c = new Uint8ClampedArray([Infinity]);
      hashMap.set('key', uint8c);
      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(255);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7000
     * @tc.name      testHashMap0070
     * @tc.desc      Passing in the special value -Infinity to Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0070';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8c = new Uint8ClampedArray([-Infinity]);
      hashMap.set('key', uint8c);
      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7100
     * @tc.name      testHashMap0071
     * @tc.desc      Passing in the special value NaN to Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0071';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, Uint8ClampedArray>();
      const uint8c = new Uint8ClampedArray([NaN]);
      hashMap.set('key', uint8c);

      const result = hashMap.get("key") as Uint8ClampedArray;
      expect(result[0]).assertEqual(0);

      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7200
     * @tc.name      testHashMap0075
     * @tc.desc      String type data is passed into  undefined check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0075';
      console.log(TAG + ' start');

      let hashMap = new HashMap<string, string | undefined>();
      hashMap.set('key', undefined);
      expect(hashMap.get("key")).assertEqual(undefined);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7300
     * @tc.name      testHashMap0076
     * @tc.desc      String type data is passed into  undefined check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0076';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string | null>();
      hashMap.set('key', null);
      expect(hashMap.get("key")).assertEqual(null);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7400
     * @tc.name      testHashMap0077
     * @tc.desc      String type data is passed into  empty string check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0077';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '');
      expect(hashMap.get("key")).assertEqual('');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7500
     * @tc.name      testHashMap0078
     * @tc.desc      String type data is passed into '!' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0078';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '!');
      expect(hashMap.get("key")).assertEqual('!');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7600
     * @tc.name      testHashMap0079
     * @tc.desc      String type data is passed into '"' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0079';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '"');
      expect(hashMap.get("key")).assertEqual('"');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7700
     * @tc.name      testHashMap0080
     * @tc.desc      String type data is passed into '#' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0080';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '#');
      expect(hashMap.get("key")).assertEqual('#');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7800
     * @tc.name      testHashMap0081
     * @tc.desc      String type data is passed into '$' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0081';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '$');
      expect(hashMap.get("key")).assertEqual('$');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_7900
     * @tc.name      testHashMap0082
     * @tc.desc      String type data is passed into '%' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0082';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '%');
      expect(hashMap.get("key")).assertEqual('%');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8000
     * @tc.name      testHashMap0083
     * @tc.desc      String type data is passed into '&' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0083';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '&');
      expect(hashMap.get("key")).assertEqual('&');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8100
     * @tc.name      testHashMap0084
     * @tc.desc      String type data is passed into  "'" check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0084';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', "'");
      expect(hashMap.get("key")).assertEqual( "'");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8200
     * @tc.name      testHashMap0085
     * @tc.desc      String type data is passed into  '(' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0085';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '(');
      expect(hashMap.get("key")).assertEqual( '(');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8300
     * @tc.name      testHashMap0086
     * @tc.desc      String type data is passed into  ')' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0086';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ')');
      expect(hashMap.get("key")).assertEqual(')');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8400
     * @tc.name      testHashMap0087
     * @tc.desc      String type data is passed into  '*' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0087';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '*');
      expect(hashMap.get("key")).assertEqual('*');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8500
     * @tc.name      testHashMap0088
     * @tc.desc      String type data is passed into  '+' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0088';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '+');
      expect(hashMap.get("key")).assertEqual('+');
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTONE_8600
     * @tc.name      testHashMap0089
     * @tc.desc      String type data is passed into  ',' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0089';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ',');
      expect(hashMap.get("key")).assertEqual(',');
      console.log(TAG + ' end');
    });
  })
}